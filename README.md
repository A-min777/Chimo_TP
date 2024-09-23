# Chimo_TP

Team Project Chimo!

名:
[V] 首頁
    修改_Layout.cshtml

[V] 登入/註冊
    新增 LoginController 
      新增Login View、新增Register View、新增RegisterDetail View、新增ForgrtPassword View

[V] 商品頁
    新增 ProductsController
      新增 Products View、新增 Courses View
      
[W-on] 會員頁
    新增 MembersController
    
[ ] 交易頁

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

實作登入作業
Utilities folder - 新增 HashUtility.cs
Web.config 修改 add key="salt" value="OIKEPWQk23k" 
Dtos folder - 新增 LoginDto.cs
Services folder - 新增 MemberService.cs
新增 Verify method 進行登入驗證
Repositories folder - 新增 MemberRepository.cs

實作 JWT - Web.config 修改
add key="JwtKey" value="mi5nh7DilhBCmuN6A8FVSMjkaFCn7YSu"  ---用於簽名和驗證 JWT 的 key 
add key="JwtIssuer" value="Chimo" ---識別 Token 來源 
Global.asax.cs 修改

// 讀取 JWT 設定
string jwtKey = ConfigurationManager.AppSettings["JwtKey"];
string jwtIssuer = ConfigurationManager.AppSettings["JwtIssuer"];

安裝 NuGet 套件
System.IdentityModel.Tokens.Jwt：提供生成和驗證 JWT 的功能
Microsoft.IdentityModel.Tokens：處理密鑰的簽名和驗證

Utilities folder - 新增 JwtUtility.cs
新增 static GenerateToken method -- 生成 JWT

LoginApiController.cs - 新增 action
public IHttpActionResult Login([FromBody] LoginDto dto)

BundleConfig.cs
新增
bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include("~/Scripts/jquery.validate*"));

新增 JwtAuthorizationAttribute.cs 繼承 AuthorizationFilterAttribute

*資料庫的 Member 資料表password 欄位設計改為 varchar(64)
值改為加密後的，當前 password1 手動改為：13C4C36BE52A78FAD02993667B2A4542FBF1E88D0315BA7C8DF31CA5CE68AD00

*完成功能
當使用 member1@example.com + password1 點擊登入後，應用程式的 localStorage 會有一個 jwtToken 的金鑰。後續將等其他頁面起來後再進行設定。
