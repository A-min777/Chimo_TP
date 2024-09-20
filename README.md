# Chimo_TP

Team Project Chimo!

許:

[V] 在 App_Start/WebApiConfig.cs 加入一行程式，確保 webApi 傳出的 json 檔字首是小寫

[V] 新增 CoursesController, CoursesApiController, RecommendedCourseVm

[V] 新增 Dtos 資料夾 - 新增 CourseDto, TeacherDto
新增 Interfaces 資料夾 - 新增 ICourseRepository
新增 Repositories 資料夾 - 新增 CourseRepository 實作 ICourseRepository
新增 Services 資料夾 - 新增 CourseService
安裝 Auto Mapper 套件
新增 Tools 資料夾 - 新增 Mappings 繼承 Profile, 加入三個自訂 mapping

[V] 在 Global.asax 設定 mappings
