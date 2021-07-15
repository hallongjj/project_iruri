// https://www.youtube.com/watch?v=ZRCYz0VkNn4&t=1685s
// https://codepen.io/alikerock/pen/abbMQjN
// GNB 호버 효과
(function() {

  const headerGnb = document.querySelector('.header__gnb');
  const gnbList = document.querySelectorAll('.gnb__item');
  const target = document.querySelector('.gnbHoverTarget');

  function headerMouseEnterFunc() {
    target.style.opacity = '1';

    if(!this.classList.contains('active')) {
      gnbList.forEach(li => {
        if(li.parentNode.classList.contains('active')) {
          li.parentNode.classList.remove('active');
        }
        li.style.opacity = '0.25';
      });
      
      this.parentNode.classList.add('active');
      this.style.opacity = '1';

      const width = this.getBoundingClientRect().width;
      const height = this.getBoundingClientRect().height;
      const left = this.getBoundingClientRect().left + window.pageXOffset;
      const top = this.getBoundingClientRect().top + window.pageYOffset + 10;
      const color = 'var(--iruri-red-color)';

      target.style.width = `${width}px`;
      target.style.height = `${height}px`;
      target.style.left = `${left}px`;
      target.style.top = `${top}px`;
      target.style.borderColor = color;
      target.style.transform = 'none';
      
    }
  }

  function headerResizeFunc() {
    const active = document.querySelector('gnb__item.active');

    if(active) {
      const left = active.getBoundingClientRect().left + window.pageXOffset;
      const top = active.getBoundingClientRect().top + window.pageYOffset;

      target.style.left = `${left}px`;
      target.style.top = `${top}px`;
    }
  }
  
  function init() {
    gnbList.forEach(li => {
      li.addEventListener('mouseenter', headerMouseEnterFunc);
    });
    window.addEventListener('resize', headerResizeFunc);
    headerGnb.addEventListener("mouseleave", () => {
      target.style.opacity = '0'
      gnbList.forEach(li => {
        li.style.opacity = '1';
      });
    });
  }
  init();
})();