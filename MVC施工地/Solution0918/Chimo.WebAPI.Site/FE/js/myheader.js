const myHeader = {
  template: `
  <div>
    <header v-if="showAd" class="ad-banner text-center ">Welcome to Chimo! 
      <button v-on:click="closeAd" class="btn btn-outline-light btn-sm ms-2 ps-">X</button>
    </header>
    <header class="navbarA  pt-3 pb-2 border-bottom border-2">
       <a href="index.html"><img src="../images/LOGO.png" alt="Logo" height="60px" class="headerLogo ps-5"></a>
       <div class="navLeft d-flex">
          <div class="dropdown">
            <button
             class="dropdown-toggle btn btn-lg ms-3 text-nowrap fw-bolder"
              type="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              aria-label="Toggle navigation"
              >
             分類
            </button>
            <ul class="dropdown-menu mt-2 ">
              <li class="dropdown-item p-3 text-center">語言學習</li>
              <li class="dropdown-item p-3 text-center">設計創作</li>
              <li class="dropdown-item p-3 text-center">程式語言</li>
              <li class="dropdown-item p-3 text-center">職場技能</li>
               <li class="dropdown-item p-3 text-center">健康生活</li>
             </ul>
          </div>
          <div class="searchbar d-flex justify-content-between">
            <form id="searchbar" class="searchbar  d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="搜尋課程" aria-label="Search" style="max-width: 800px;">
            </form>      
            <a href="myCart.html" >
              <img src="../images/cart.png" alt="cart" class="btn " style="height: 45px;">
            </a>  
          </div>
       </div> 
       <template v-if="!isLoggedIn">
          <a class="headerLogin btn btn-md fw-bolder me-3" href="login.html">登入 | 註冊</a>
       </template> 

       <template v-if="isLoggedIn"> 
       <div class="dropdown">
          <button
            class="dropdown-toggle border-0 btn"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
             <img src="../images/profilePic.png" alt="avatar" class="img-fluid avatar">
          </button>
          <ul class="dropdown-menu mt-2 me-4">
            <a href="member.html"><li class="dropdown-item p-3 text-center">會員資料</li></a>
            <a href="#"><li class="dropdown-item p-3 text-center">儲值點數</li></a>
            <a href="myCourses.html"><li class="dropdown-item p-3 text-center">我的課程</li></a>
            <a href="myCollections.html"><li class="dropdown-item p-3 text-center">我的收藏</li></a>
            <a href="myOrders.html"><li class="dropdown-item p-3 text-center">購買紀錄</li></a>
            <li class="dropdown-item p-3 text-center" v-on:click="isLoggedIn=false">登出</li>
         </ul>
       </div>
       </template>
    </header>
    </div>`,


  setup() {
    const showAd = ref(true);
    const isLoggedIn = ref(true);

    const closeAd = () => {
      showAd.value = false;
    };

    return {
      showAd,
      closeAd,
      isLoggedIn,
    };
  },
};
