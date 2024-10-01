--����
	-- 1.�Τ��ʶR�L���ҵ{(���]�t�w�h�O�ҵ{)
	SELECT M.Name �|���W��, C.Title �ʶR�L���ҵ{
	FROM Members M
	JOIN Orders O ON M.Id = O.MemberId
	JOIN OrderItems OI ON O.Id = OI.OrderId
	JOIN Courses C ON C.Id = OI.CourseId
	WHERE OI.Status = 1

	-- 2.�����ҵ{(���ʶR�ƶq�ƧǡA�]����Ƥ����γo�̥��ը��e3�A���p��w�Q�h�f���ʶR)
	SELECT TOP 3  C.Title �����ҵ{, COUNT(*) �ʶR��
	FROM Courses C JOIN OrderItems OI
	ON C.Id = OI.CourseId AND OI.Status = 1
	GROUP BY OI.CourseId, C.Title
	ORDER BY �ʶR�� DESC


--����
	--1.���N�@�ؤ������ҵ{(�ȥ]�t�W�[�ҵ{)
	SELECT * FROM Courses C WHERE CategoryId = 1 AND Status = 1


--�ӫ~����
	-- �ҵ{�W�١B�ҵ{���ؿ��B�����`
	SELECT C.Title �ҵ{�W��, CL.Name �ҵ{�ؿ�, CP.Name �ҵ{���`
	FROM Courses C
	JOIN CourseCatalogs CL ON CL.CourseId = C.Id
	JOIN CourseChapters CP ON CP.CatalogId = CL.Id
	
	-- �ҵ{�W��, �ҵ{����, �ҵ{²��, �ҵ{����, �Юv�W��, �Юv²��, �ʶR�H�� (�ȥ]�t�W�[�ҵ{,���]�t�Q�h�f���ʶR)
	SELECT C.Title �ҵ{�W��,CC.Name �ҵ{����, C.Description �ҵ{²��, C.Price �ҵ{����, T.Name �Юv�W��,
	T.Intro �Юv²��, COUNT(OI.Id) �ʶR�H��
	FROM Courses C
	JOIN CourseCategories CC ON C.CategoryId = CC.Id
	JOIN Teachers T ON C.TeacherId = T.Id
	JOIN OrderItems OI ON OI.CourseId = C.Id AND OI.Status = 1
	JOIN Orders O ON OI.OrderId = O.Id
	WHERE C.Status = 1
	GROUP BY C.Title, CC.Name, C.Description, C.Price, T.Name, T.Intro

	-- �ҵ{�W��, ���`�ƶq
	SELECT C.Title �ҵ{�W��, COUNT(CP.Id) ���`�ƶq
	FROM Courses C
	JOIN CourseCatalogs CL ON CL.CourseId = C.Id
	JOIN CourseChapters CP ON CP.CatalogId = CL.Id
	GROUP BY C.Title

	--�Ĥ@��ҵ{�v��(�̷�Catalog��Chapter��DisplayOrder���Ƨ�) �ȥ]�t�W�[�ҵ{
	SELECT C.Title �ҵ{�W��,
       (SELECT TOP 1 CH.VideoURL 
        FROM CourseChapters CH 
        WHERE CH.CatalogId = (SELECT TOP 1 CC.Id 
                              FROM CourseCatalogs CC 
                              WHERE CC.CourseId = C.Id 
                              ORDER BY CC.DisplayOrder)
        ORDER BY CH.DisplayOrder) �Ĥ@��ҵ{�v��
	FROM Courses C
	WHERE C.Status = 1


--�ҵ{����
	--1.���(�ҵ{�����B�ҵ{�W�١B�ҵ{�v���B���`²���B�ҵ{���ؿ��B�����`�B�Юv�W�١B�Юv²��
	SELECT C.Title �ҵ{�W��, C.CategoryId �ҵ{����, CL.Name �ҵ{�ؿ�, CP.Name �ҵ{���`, CP.Description  ���`²��,
	CP.VideoURL �ҵ{�v��, T.Name �Юv�W��, T.Intro �Юv²��
	FROM Courses C
	JOIN CourseCategories CC ON C.CategoryId = CC.Id
	JOIN CourseCatalogs CL ON CL.CourseId = C.Id
	JOIN CourseChapters CP ON CP.CatalogId = CL.Id
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE C.Id = 3

	--2.�Юv��L�ҵ{(�ҵ{�W�١B�ҵ{����)) �ȥ]�t�W�[�ҵ{ ���յ��G���ҵ{Id��3���}�ҦѮv�Ҷ}����L�ҵ{
	SELECT C.Title �ҵ{�W��, C.Price �ҵ{����
	FROM Courses C
	WHERE C.TeacherId = (
		SELECT C2.TeacherId
		FROM Courses C2
		WHERE C2.Id = 3) 
	AND C.Id != 3
	AND C.Status = 1

	
--�|�����
	--1.���(�|���W�١B�I�Ƽƶq�B�ʧO�B�q�ܡB�H�c�B�ӤH²���B�W���ק�ɶ�?
	SELECT M.Name �|���W��, M.Point �I�Ƽƶq, M.Gender �ʧO, M.Phone �q��, M.Email �H�c,
	M.Intro �ӤH²��, M.UpdatedDate �W���ק�ɶ�
	FROM Members M


--�ڪ��ҵ{
	--1.���(�w�ʶR�ҵ{(�ҵ{�W�١B�ҵ{�ʭ��B�ҵ{����B�Юv�W�١B�ʶR���)) ���]�t�w�h�O�ҵ{
	SELECT C.Title Id10���ʶR�ҵ{�W��, C.Thumbnail �ҵ{�ʭ�, C.Price �ҵ{����, T.Name �Юv�W��, O.CreatedDate �ʶR���
	FROM Courses C
	JOIN Teachers T ON C.TeacherId = T.Id
	JOIN OrderItems OI ON OI.CourseId = C.Id AND OI.Status = 1
	JOIN Orders O ON OI.OrderId = O.Id
	JOIN Members M ON O.MemberId = M.Id
	WHERE M.Id = 11


--�ڪ�����
	--1.���(�w���ýҵ{(�ҵ{�W�١B�ҵ{�ʭ��B�ҵ{����B�Юv�W��)) �ȥ]�t�W�[�ҵ{
	SELECT C.Title Id9�����ýҵ{�W��, C.Thumbnail �ҵ{�ʭ�, C.Price �ҵ{����, T.Name �Юv�W��
	FROM MemberCollections MC
	JOIN Members M ON MC.MemberId = M.Id
	JOIN Courses C ON MC.CourseId = C.Id AND C.Status = 1
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE M.Id = 9

	
--�ʶR����
	--1.���(�w�ʶR�ҵ{(�q�榨�ߤ���B�q�椺�e(�ҵ{�W�١B�ҵ{�ʭ��B�ҵ{����B�Юv�W�١A�q���`���B)�B�q�檬�A, �ҵ{�������A)
	SELECT O.Id ID9�q�����, O.CreatedDate �q�榨�ߤ��, C.Title �ҵ{�W��,  C.Thumbnail �ҵ{�ʭ�, C.Price �ҵ{����, 
	T.Name �Юv�W��, O.TotalAmount �q���`���B,O.Status �q�檬�A, OI.Status �ҵ{�������A
	FROM Orders O
	JOIN Members M ON O.MemberId = M.Id
	JOIN OrderItems OI ON OI.OrderId = O.Id
	JOIN Courses C ON OI.CourseId = C.Id
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE M.Id = 9


--�ʪ���
	--1.���(�ʪ������e(�ҵ{�W�١B�ҵ{�ʭ��B�ҵ{����B�Юv�W��)�B�`���B) �ȥ]�t�W�[�ҵ{
	SELECT C.Title ID9���ʪ����ҵ{�W��, C.Thumbnail �ҵ{�ʭ�, C.Price �ҵ{����, T.Name �Юv�W��, CT.TotalAmount �`���B
	FROM Members M
	JOIN Carts CT ON CT.MemberId = M.Id AND CT.Status = 0
	JOIN CartItems CI ON CI.CartId = CT.Id
	JOIN Courses C ON CI.CourseId = C.Id AND C.Status = 1
	JOIN Teachers T ON C.TeacherId = T.Id
	WHERE M.Id = 10



