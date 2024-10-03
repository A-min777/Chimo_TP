--首頁
	-- 1.用戶購買過的課程(不包含已退費課程)
	SELECT M.Name 會員名稱, C.Title 購買過的課程
	FROM Members M
	JOIN Orders O ON M.Id = O.MemberId
	JOIN OrderItems OI ON O.Id = OI.OrderId
	JOIN Courses C ON C.Id = OI.CourseId
	WHERE OI.Status = 1

	-- 2.熱門課程(依購買數量排序，因為資料不夠用這裡先試取前3，不計算已被退貨的購買)
	SELECT TOP 3  C.Title 熱門課程, COUNT(*) 購買數
	FROM Courses C JOIN OrderItems OI
	ON C.Id = OI.CourseId AND OI.Status = 1
	GROUP BY OI.CourseId, C.Title
	ORDER BY 購買數 DESC


--分類
	--1.任意一種分類全課程(僅包含上架課程)
	SELECT * FROM Courses C WHERE CategoryId = 1 AND Status = 1


--商品頁面
	-- 課程名稱、課程全目錄、全章節
	SELECT C.Title 課程名稱, CL.Name 課程目錄, CP.Name 課程章節
	FROM Courses C
	JOIN CourseCatalogs CL ON CL.CourseId = C.Id
	JOIN CourseChapters CP ON CP.CatalogId = CL.Id
	
	-- 課程名稱, 課程分類, 課程簡介, 課程價格, 教師名稱, 教師簡介, 購買人數 (僅包含上架課程,不包含被退貨的購買)
	SELECT C.Title 課程名稱,CC.Name 課程分類, C.Description 課程簡介, C.Price 課程價格, T.Name 教師名稱,
	T.Intro 教師簡介, COUNT(OI.Id) 購買人數
	FROM Courses C
	JOIN CourseCategories CC ON C.CategoryId = CC.Id
	JOIN Teachers T ON C.TeacherId = T.Id
	JOIN OrderItems OI ON OI.CourseId = C.Id AND OI.Status = 1
	JOIN Orders O ON OI.OrderId = O.Id
	WHERE C.Status = 1
	GROUP BY C.Title, CC.Name, C.Description, C.Price, T.Name, T.Intro

	-- 課程名稱, 章節數量
	SELECT C.Title 課程名稱, COUNT(CP.Id) 章節數量
	FROM Courses C
	JOIN CourseCatalogs CL ON CL.CourseId = C.Id
	JOIN CourseChapters CP ON CP.CatalogId = CL.Id
	GROUP BY C.Title

	--第一堂課程影片(依照Catalog及Chapter的DisplayOrder做排序) 僅包含上架課程
	SELECT C.Title 課程名稱,
       (SELECT TOP 1 CH.VideoURL 
        FROM CourseChapters CH 
        WHERE CH.CatalogId = (SELECT TOP 1 CC.Id 
                              FROM CourseCatalogs CC 
                              WHERE CC.CourseId = C.Id 
                              ORDER BY CC.DisplayOrder)
        ORDER BY CH.DisplayOrder) 第一堂課程影片
	FROM Courses C
	WHERE C.Status = 1


--課程頁面
	--1.顯示(課程分類、課程名稱、課程影片、章節簡介、課程全目錄、全章節、教師名稱、教師簡介
	SELECT C.Title 課程名稱, C.CategoryId 課程分類, CL.Name 課程目錄, CP.Name 課程章節, CP.Description  章節簡介,
	CP.VideoURL 課程影片, T.Name 教師名稱, T.Intro 教師簡介
	FROM Courses C
	JOIN CourseCategories CC ON C.CategoryId = CC.Id
	JOIN CourseCatalogs CL ON CL.CourseId = C.Id
	JOIN CourseChapters CP ON CP.CatalogId = CL.Id
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE C.Id = 3

	--2.教師其他課程(課程名稱、課程價格)) 僅包含上架課程 測試結果為課程Id為3的開課老師所開的其他課程
	SELECT C.Title 課程名稱, C.Price 課程價格
	FROM Courses C
	WHERE C.TeacherId = (
		SELECT C2.TeacherId
		FROM Courses C2
		WHERE C2.Id = 3) 
	AND C.Id != 3
	AND C.Status = 1

	
--會員資料
	--1.顯示(會員名稱、點數數量、性別、電話、信箱、個人簡介、上次修改時間?
	SELECT M.Name 會員名稱, M.Point 點數數量, M.Gender 性別, M.Phone 電話, M.Email 信箱,
	M.Intro 個人簡介, M.UpdatedDate 上次修改時間
	FROM Members M


--我的課程
	--1.顯示(已購買課程(課程名稱、課程封面、課程價格、教師名稱、購買日期)) 不包含已退費課程
	SELECT C.Title Id10所購買課程名稱, C.Thumbnail 課程封面, C.Price 課程價格, T.Name 教師名稱, O.CreatedDate 購買日期
	FROM Courses C
	JOIN Teachers T ON C.TeacherId = T.Id
	JOIN OrderItems OI ON OI.CourseId = C.Id AND OI.Status = 1
	JOIN Orders O ON OI.OrderId = O.Id
	JOIN Members M ON O.MemberId = M.Id
	WHERE M.Id = 11


--我的收藏
	--1.顯示(已收藏課程(課程名稱、課程封面、課程價格、教師名稱)) 僅包含上架課程
	SELECT C.Title Id9的收藏課程名稱, C.Thumbnail 課程封面, C.Price 課程價格, T.Name 教師名稱
	FROM MemberCollections MC
	JOIN Members M ON MC.MemberId = M.Id
	JOIN Courses C ON MC.CourseId = C.Id AND C.Status = 1
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE M.Id = 9

	
--購買紀錄
	--1.顯示(已購買課程(訂單成立日期、訂單內容(課程名稱、課程封面、課程價格、教師名稱，訂單總金額)、訂單狀態, 課程持有狀態)
	SELECT O.Id ID9訂單紀錄, O.CreatedDate 訂單成立日期, C.Title 課程名稱,  C.Thumbnail 課程封面, C.Price 課程價格, 
	T.Name 教師名稱, O.TotalAmount 訂單總金額,O.Status 訂單狀態, OI.Status 課程持有狀態
	FROM Orders O
	JOIN Members M ON O.MemberId = M.Id
	JOIN OrderItems OI ON OI.OrderId = O.Id
	JOIN Courses C ON OI.CourseId = C.Id
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE M.Id = 9


--購物車
	--1.顯示(購物車內容(課程名稱、課程封面、課程價格、教師名稱)、總金額) 僅包含上架課程
	SELECT C.Title ID9的購物車課程名稱, C.Thumbnail 課程封面, C.Price 課程價格, T.Name 教師名稱, CT.TotalAmount 總金額
	FROM Members M
	JOIN Carts CT ON CT.MemberId = M.Id AND CT.Status = 0
	JOIN CartItems CI ON CI.CartId = CT.Id
	JOIN Courses C ON CI.CourseId = C.Id AND C.Status = 1
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE M.Id = 10



