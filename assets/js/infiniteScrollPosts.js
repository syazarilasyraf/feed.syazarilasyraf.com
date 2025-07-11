// assets/js/infiniteScrollPosts.js

document.addEventListener('DOMContentLoaded', function() {
  const POSTS_TO_SHOW = 10;
  const LOAD_COUNT = 10;
  const postList = document.querySelectorAll('.post-list-item');
  let visibleCount = POSTS_TO_SHOW;

  function updateVisibility() {
    postList.forEach((item, idx) => {
      item.style.display = idx < visibleCount ? '' : 'none';
    });
  }

  function handleScroll() {
    const scrollY = window.scrollY || window.pageYOffset;
    const viewport = window.innerHeight;
    const fullHeight = document.body.offsetHeight;
    if (scrollY + viewport >= fullHeight - 100) {
      if (visibleCount < postList.length) {
        visibleCount += LOAD_COUNT;
        updateVisibility();
      }
    }
  }

  window.addEventListener('scroll', handleScroll);
  updateVisibility();
});
