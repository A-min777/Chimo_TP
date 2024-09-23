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

	[working on] 首頁的我的課程?
