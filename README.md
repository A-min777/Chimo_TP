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



權

[v] 實作登入作業
新增 Utilities folder
		新增 HashUtility.cs

Web.config modify 	  <add key="salt" value="OIKEPWQk23k" />
--------------------------------------------------------
新增 Dtos folder
		新增 LoginDto.cs
--------------------------------------------------------
新增 Services folder
		新增 MemberService.cs
			新增 Verify method 登入驗證
--------------------------------------------------------		
新增 Repositories folder
		新增 MemberRepository.cs
--------------------------------------------------------
實作JWT
Web.config modify
<add key="JwtKey" value="mi5nh7DilhBCmuN6A8FVSMjkaFCn7YSu	" />  <!--用於簽名和驗證 JWT 的key-->
<add key="JwtIssuer" value="Chimo" />  <!--識別 Token來源-->

Global.asax.cs modify
  //讀取JWT設定
  string jwtKey = ConfigurationManager.AppSettings["JwtKey"];
  string jwtIssuer = ConfigurationManager.AppSettings["JwtIssuer"];

安裝Nuget套件
System.IdentityModel.Tokens.Jwt：提供生成和驗證 JWT 的功能
Microsoft.IdentityModel.Tokens：處理密鑰的簽名和驗證。

	新增 JwtUtility.cs
		新增 static GenerateToken method	--生成JWT
				
--------------------------------------------------------
LoginApiController.cs

新增 action 
public IHttpActionResult Login([FromBody] LoginDto dto)
--------------------------------------------------------

BundleConfig.cs
		新增 bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include("~/Scripts/jquery.validate*"));
--------------------------------------------------------
新增 JwtAuthorizationAttribute.cs 繼承AuthorizationFilterAttribute
--------------------------------------------------------
資料庫的Member資料表 password設計要改成varchar(64)
值也要改成加密後的 目前password1我已手動改成
13C4C36BE52A78FAD02993667B2A4542FBF1E88D0315BA7C8DF31CA5CE68AD00
--------------------------------------------------------
完成功能---當你使用member1@example.com + password1 點擊登入後在應用程式的localStorage會有一個jwtToken的金鑰,先做到這邊 之後等其他頁面起來了再去做設定
--------------------------------------------------------
		
