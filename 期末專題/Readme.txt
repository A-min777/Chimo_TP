[v] 
新增	EFModels/folder  
新增	SqlDb.cs
建立	AppDbcontext,conn string,Entity Classes  
新增	Nuget套件 Dapper
=====================
[v]
新增	MemberController  -------會員管理
新增 GetAllMembers() Action 
	add GetAllMembers.cshtml 
	add MemberService.cs 
	
=====================
[v]
新增 CoursesController  -------課程管理
新增 GetAllCourses() Action
	add GetAllcourses.cshtml
	add CoursesService.cs 

新增 UpdateCourseStatus() Action
	add StatusUpdateDto.cs

新增 ViewCoureseDetail() Action
	add	CourseDetailVm.cs

=====================
[v]
新增	MemberManagementController  -------會員詳細資料
	add	MemberManagementService.cs
	add MemberSearchVm.cs
	add Search.cshtml

[working on...]
目前如果搜尋與資料庫裡相異的會員名字不會跳出警告訊息 Orz 

