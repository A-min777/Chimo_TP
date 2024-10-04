# Chimo_TP

ReadMe For Chimo.WebApi.Site

許:

	[V] 在 App_Start/WebApiConfig.cs 確保 webApi 傳出的 json 檔字首是小寫

	[V] 新增 CoursesController, CoursesApiController, RecommendedCourseVm

	[V] 新增 Dtos 資料夾 
			- 新增 CourseDto, TeacherDto
		新增 Interfaces 資料夾 
			- 新增 ICourseRepository
		新增 Repositories 資料夾 
			- 新增 CourseRepository 實作 ICourseRepository
		新增 Services 資料夾 
			- 新增 CourseService

		安裝 Auto Mapper 套件
		新增 Tools 資料夾 
			- 新增 Mappings 繼承 Profile, 加入三個自訂 mapping

	[V] 在 Global.asax 設定 mappings

	[V] 修改 Home/Index.cshtml, 讓首頁能呼叫API顯示推薦課程
		(目前測試資料較少的關係，符合條件的只有四個課程)
		(我在資料庫key的課程圖片目前都是不存在的，
		要先去資料庫將Status=1的課程圖片檔名都改成thumbnail.jpg才能正常顯示)
	

	----------------------------2024/9/23----------------------------------


	[V] 在Dtos/ 新增 CourseContentDto, CourseChapterDto, CourseCategoryDto,
					 CourseCatalogDto, ProductInfoVm 
				修改CourseDto
		
	[V]	在ICourseRepository新增ProductInfo頁面要用的5支method, 
		在CourseRepository,實做那5支method

	[V] 在CourseService 呼叫CourseRepository, 組成ProductInfoVm

	[V] 在Mappings 新增4個mappings

	[V] 在 CoursesApiController 新增供 products/productInfo 用的API

	[V] 修改 ChimoDemo_Table的Script, 讓Users及Members的Password欄位長度限制改為70
		修改 EFModels/User 的Password的 Data Annotation, 改為限制字串長度不大於70

	[working on] 修改 Views/Products/ProductInfo.cshtml, 呼叫後端API
				(網址為 https://localhost:44346/Products/ProductInfo/id)
				 
				 尚未完成功能: 顯示課程的第一支影片(目前資料庫存的還不是影片檔名)
							  顯示老師icon (已完成)
	
	
	------------------------------2024/9/24----------------------------------


	[V] 修改Home/Index.html 及ProuctsController的ViewProduct, 點擊課程可以導向 
		ProductInfo or Course
	
	[V] 在CourseApiController 新增 GetMyCourseInfo action,
		在ViewModels/ 新增 CourseInfoVm

	[V] 在Tools/ 新增 CourseDto_Ext, 在裡面新增兩個CourseDto的擴充方法，
		將叫出來的圖片檔名組成檔案路徑

	[V] 在 CourseService 新增 GetMyCourseInfoById method
		在 ICourseRepository 新增 GetOtherCourseById method
		在 CourseRepository 實做 GetOtherCourseById method

	[V] 修改 Products/Courses.cshtml 及 Products/ProductInfo.cshtml
		目前前端除了影片外呈現的都是資料庫叫出來的資料，處理Teacher頭像
		及課程預覽圖若是null, 設成各自指定的default圖片路徑

			
	------------------------------2024/9/25----------------------------------

	[V] 發現無法正確在前端呈現出老師icon,原因為忘記先將老師icon檔名組成路徑再呈現，
		修改 Tools/CourseDto_Ext 的擴充方法，補上將老師icon檔名組成路徑，並補上判斷，
		當檔名為Null或沒有內容時不做處理，讓前端能正確判斷，在沒有圖檔的情況下抓取指定default圖片

	[V] 修改前端FormatThumbnailUrl函式，將處理沒有圖檔的步驟抽離成 handleThumbnailNull

	[V] 修改 Views/Home/Index.cshtml, 讓首頁呈現的課程也能支援沒有圖片時抓取指定default圖片


	------------------------------2024/9/25----------------------------------
	
	[V] 在 Tools/CoourseDto_Ext 新增兩個擴充方法，用來重組影片檔名為路徑

	[V] 修改 ProductsController 的ViewProduct action, 若導向的頁面是
		Course, 抓取該課程的第一個Chapter Id並回傳，修改Course action, 可以接收Chapter Id
	
	[V] 修改 CoursesApiController 的 GetMyCourseInfo 路由，讓網址改成可以接收 Chapter Id

	[V] 在App_Start/RouteConfig 裡新增一個路由定義，讓ProductsController 的 Course action的路由
		可以包含 /chapter/{chapterid}

	[V] 在CourseSerivce新增 GetChapterById 跟 GetFirstChapterId
		在ICourseRepository 新增以上兩個函式定義
		在CourseRepository 實做以上兩個函式

	[V] 修改 Products/ProductInfo.cshtml 可以正常顯示影片
		修改 Products/Course.chtml 修改fetch為新路由，可以正常顯示影片，
		並可以依照點選的章節改變網址顯示不同章節影片

	[V] 修改 MembersApiController 的 GetMemberCourses 路由,避免路由衝突解決合併後首頁叫不到api問題

	[V] 實作MemberService 的HasPurchasedProduct 呼叫Repository部分
		在MemberRepository 裡新增函式 HasPurchased呼叫資料庫判斷是否有購買課程

	[V] 修改 MemberService裡的 GetUserIdFromToken，若使用者有登入能夠正確抓取UserId
		若token是null就直接回傳，如此可支援不登入檢視ProductInfo
			
		
	------------------------------2024/9/25----------------------------------

	[V] 實做 CourseApiController 的 GetPurchasedCourses, 完成顯示首頁會員已購買課程的web api

	[V] 在 CourseService 新增 GetPurchasedCourseById 函式，用來抓取會員已購買課程資訊
		在 MemberRespository 新增 MemberRepository 函式， 用來根據Id判斷是否存在會員
		在 ICourseRepository 新增 GetPurchasedCourseById 函式定義，並在 CourseRepository 實做，

	[V] 修改 Home/Index.cshtml 呼叫 GetPurchasedCourses api, 可以在登入會員首頁顯示已購買課程

	[V] 新增 ICollectionRepository 介面
		新增 CollectionRepository
		新增 CollectionService
		在 ICollectionRepository 及 CollectionService 新增兩個函式
		在 CollectionRepository 實作介面函式

	[V] 新增 CollectionsApiController, 完成新增跟取消收藏的api

	[working on] 修改 Course.cshtml, 呼叫收藏api


	------------------------------2024/9/29----------------------------------

	[V] 為了在新增及取消收藏時能抓到課程id,在 CollectionDto 新增 CourseId 屬性

	[V] 修改 Course.cshtml 及 ProductInfo.cshtml, 呼叫處理收藏的api, 完成新增及取消收藏功能

	[working on] 尚未處理在 ProductInfo.cshtml 使用者未登入時點擊收藏的情形，目前程式會死掉


	------------------------------2024/9/30----------------------------------

	[V] 處理在 ProductInfo.cshtml 使用者未登入時點擊收藏會導向登入畫面

	[V] 新增 AddCartItemDto, ShowCartItemDto

	[V] 在 Tools/Mappings 裡新增一個mapping

	[V] 新增 ICartRepository 介面，新增 CartRepository 實作介面，新增 CartService

	[V] 新增 CartsApiController，新增3個api

	[V] 修改 MyCart.cshtml, 呼叫api, 完成顯示使用者當前購物車內容及刪除購物車內容功能

	[working on] 在ProductInfo.cshtml 呼叫api，加入購物車功能


	------------------------------2024/10/1----------------------------------

	[V] 完成在ProductInfo.cshtml呼叫api，加入購物車功能

	[V] 修改 Checkout.cshtml，能夠叫出會員當前購物車內容

	[V] 新增 ConfirmPaymentDto 及 ConfirmPaymentMemberDto

	[V] 新增 CheckoutsApiController

	[V] 在 Tools/Mappings 新增一個mapping

	[V] 在 MemberRepository 新增 UpdateMemberPoint 及 GetMemberDtoById

	[V] 新增 IOrderRepository 介面，在裡面新增 CreateOrder 跟 CreateOrderItem
		新增 OrderRepository 實作介面
		新增 CheckoutService，實作 ConfirmOrder，完成購物車結帳api

	[working on] 在 Checkout.cshtml 叫用購物車結帳api


	------------------------------2024/10/2----------------------------------

	[V] 新增 IPointHistoryRepository 介面，在裡面新增 CreatePointHistory定義
		新增 PointHistoryRepository 實作介面

	[V] 修改 CheckoutService 的 ConfirmOrder，讓購物車結帳時能新增一筆點數歷史紀錄

	[V] 在 MemberApiController 新增 GetMemberPoint 並在 MemberService 及 MemberRepository 實作，
		用來回傳會員所持點數

	[V] 修改 Checkout.cshtml, 若付費方式選擇點數付費，顯示單位從NT$變成點數，
		呼叫api完成購物車結帳功能，若當前訂單沒東西或者購物車結帳完又按下結帳，出現alert警示
		若要結帳時會員點數低於訂單總金額，按下結帳出現alert警示

	[V] 修改 MyCart.cshtml, 若當前購物車沒東西按下前往結帳，出現alert警示
	
	[V] 在 MembersController 新增 BuyDirectly action，並新增 View: BuyDirectly.cshtml
		修改 ProductInfo.cshtml, 讓按下立即購買會跳轉到 BuyDirectly.cshtml

	[V] 在 BuyDirectly.cshtml 呼叫api，可以藉由網址傳入課程Id在訂單顯示該課程資訊

	[V] 在 CheckoutService 新增 BuyDirectly 及 HandleCart，處理當會員立即購買課程結帳時，
		結帳完去確認當前購物車內有沒有該課程，如果有則將課程從購物車裡移除，完成立即購買課程的api

	[V] 修改 BuyDirectly.cshtml, 呼叫api完成立即購買課程功能，若點數餘額不足出現alert警示，
		若已購買過該課程又按下確認付款，出現alert警示防止重複購買

	[working on] 發現bug: 在某些頁面進行操作後若直接按上一頁，返回的頁面並不會反映出操作後的結果，
				 需要手動重整網頁才會正常反映，例如在ProductInfo頁面將課程加入購物車，到購物車頁面
				 將剛剛加入的課程移除購物車後按上一頁回到ProductInfo，仍會被視為已加入購物車，需要
				 手動重整頁面後才能再次加入購物車


	------------------------------2024/10/3----------------------------------

	[V] 修改搜尋會員購買課程的EF語法，讓在顯示會員購買紀錄的頁面點擊已退費課程時正常導向購買前
		的課程頁面

	[V] 新增 RefundDto，在 CheckoutsApiController 新增 HandleRefund，處理會員退款的api
		在 CheckoutService 新增 HandleRefund， 在 IOrderRepository 新增 GetOrdersByMemberId
		及 UpdateOrderItemStatus，在 OrderRepository實作介面函式
	
	[V] 完成處理會員退款的api


	------------------------------2024/10/3----------------------------------

	[V] 修改 MyCourses.cshtml, 在前端設定購買課程時間超過三天則不會顯示退款按鈕
		叫用api，完成課程退貨功能

	[V] 新增 TeacherProfileVm，用來呈現教師頁面，新增 TeachersApiController，
		在裡面新增 GetTeacherProfile api
	
	[V] 新增 ITeacherRepository 介面，在裡面新增三支函式，新增 TeacherRepository 實作介面
		新增 TeacherService

	[V] 完成顯示教師頁面的api

	[V] 修改 Course.cshtml 及 ProductInfo.cshtml, 讓點擊教師icon後跳轉到 TeacherInfo.cshtml
		網址能帶有教師ID

	[V] 修改 TeacherInfo.cshtml，呼叫api完成顯示教師頁面功能
