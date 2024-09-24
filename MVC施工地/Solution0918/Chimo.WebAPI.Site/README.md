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
							  顯示老師icon (目前是直接寫死路徑)