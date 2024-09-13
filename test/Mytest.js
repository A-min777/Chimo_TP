const MyTest = {
    template: `
     <a
    v-for="index in 4"
    :key="index"
    :href="getLink(index)"
    
    >
    <button
      class="btn"
      v-on:click="handleClick(index)"
      :class="['btn', activeIndex  === index ? 'btn-danger' : 'btn-dark']"
    >
      Click {{ index }}
    </button>
    </a>
  `,
  props:{
    activeIndex: {
        type: Number,
        default: null,
      },
  },

    setup(props,{emit}) {

        const pageLinks = {
            1: 'test1.html',
            2: 'test2.html',
            3: 'test3.html',
            4: 'test4.html',  // Add more pages as needed
          };

        const getLink = (index) => {
            return pageLinks[index] || '#';
          };
          const handleClick = (index) => {
            emit('button-clicked', index);
          };
          
          // Reactive state for activeIndex
          const activeIndex = getActiveIndexFromURL()
      
          // Watch for URL changes and update activeIndex
          Vue.watchEffect(() => {
            activeIndex.value = activeIndex
          });
      
          function getActiveIndexFromURL() {
            const path = window.location.pathname;

            
            for (const [index, url] of Object.entries(pageLinks)) {
                if (path.includes(url)) {
                  return parseInt(index, 10);  // Convert index from string to number
                }
              }
              return null;
          }
      
          return { getLink, handleClick, activeIndex };
    },
  };