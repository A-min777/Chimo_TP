# Chimo_TP

Team Project Chimo!

名:
[V] 首頁(header/footer/分類/搜尋功能/熱門推薦)
    修改 index.cshtml
    修改 _Layout.cshtml
    新增 Categories.cshtml、 新增 SearchResult.cshtml

[V] 登入/註冊(登入/註冊/忘記密碼)
    新增 LoginController  新增 Login View
      新增 Login.cshtml、 新增 Register.cshtml、 新增 RegisterDetail.cshtml、 新增 ForgrtPassword.cshtml

[V] 商品頁(購買課程/觀看課程)
    新增 ProductsController 新增 Products View
      新增 Action ViewProduct //判斷跳轉邏輯
      新增 Products.cshtml、 新增 Courses.cshtml
      
[V] 會員頁(修改個資/修改密碼/已購買課程/收藏/購買紀錄)
    新增 MembersController 新增 Members View
      新增 EditInfo.cshtml、 新增 UpdatePassword.cshtml、 新增 MyCourses.cshtml、 新增 MyCollections.cshtml、 新增 MyOrders.cshtml、 
      
    
[V] 交易頁(儲值/購物車/結帳/直接購買)
    新增 MyCart.cshtml、 新增 TopUp.cshtml、 新增 Checkout.cshtml、 BuyDirectly.cshtml

[V] 自製Modal(警告/錯誤/完成/加載/儲值)   
    
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


 <h3>2.專案簡介  </h3>

資策會專題-MVC網頁開發
我們計劃開發一個線上售課平台，讓用戶能夠自由瀏覽各類課程商品。

用戶在登入後，可以輕鬆選擇並購買自己感興趣的課程。

如果用戶已經購買過某門課程，點擊該商品時，系統將自動導向該課程的內容頁面方便用戶立即開始學習，提升學習體驗的便捷性與連貫性。

網站前台後端使用ASP.Net Framework 搭配API，前端則用Vue3，讓使用者在瀏覽時有更好的互動體驗。

後台是使用ASP.Net Framework MVC製作。

登入部分我們用了JWT進行登入與身分驗證來確保用戶資料的安全。

同時，網站有RWD設計，讓使用者無論用手機還是電腦，都能獲得良好的使用體驗。



 <h3>3.成員分工 </h3>

阿名(Amin Chen):
專案主題規格規劃
專案時程控管
網站主視覺


小許(TS):
資料庫建立與維護
實作商品頁功能
實作課程頁功能
實作結帳功能


阿權(5ccBinnie):
後台建立與管理
實作登入與註冊功能，登入使用JWT Token進行驗證
實作搜尋功能
實作會員相關功能