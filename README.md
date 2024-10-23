
# 線上售課平台開發-Chimo!   

## 專案簡介
本專案旨在開發一個線上售課平台，讓用戶可以瀏覽、選擇並購買課程，並且提供便捷的學習體驗。平台同時確保使用者的資料安全，並具備響應式設計，適應各種設備操作。

## 核心功能
- 課程瀏覽與購買：用戶登入後可瀏覽各類課程，並選購自己感興趣的課程商品。

- 課程學習導向：若用戶已購買某課程，點擊該商品後將自動導向該課程的內容頁面，讓用戶立即開始學習，增強學習流程的流暢性。

- 安全登入與驗證：採用JWT進行登入與身分驗證，保障用戶資料的安全，確保交易過程中的隱私保護。

- 響應式設計 (RWD)：支援不同設備，無論使用手機、平板或電腦，都能獲得良好的操作體驗。
## 技術架構

**用戶端 (Client Side)**

 - 前端框架：Vue3 

 - 資料交互：Web API

 - 資料管理：Entity Framework

**伺服器端 (Server Side)**

- 後端框架：ASP.Net Framework MVC
  
- 資料管理：Dapper
  
**安全性**

 - JWT 驗證：保護用戶登入與資料安全

 - RWD 設計：提供跨平台一致的使用體驗，無論是行動裝置還是桌面裝置
## 成員分工

- [@Amin Chen](https://www.github.com/A-min777)
    
    - 前期主題規劃
    - 專案規格規劃
    - 網站主視覺
    - 專案時程控管
- [@TS](https://www.github.com/TenjouSora)

    - 資料庫建立與維護
    - 實作商品頁功能
    - 實作課程頁功能
    - 實作結帳功能

- [@5ccBinnie](https://www.github.com/5ccBinnie)
    - 資料庫建立與維護 
    - 後台建立與管理 
    - 實作搜尋與儲值功能
    - 實作登入與註冊功能
    - 實作會員相關功能


