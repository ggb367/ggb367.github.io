document.addEventListener("DOMContentLoaded", function() {
  var grid = document.querySelector(".grid");
  if (!grid) return;
  // Init Masonry
  var msnry = new Masonry(grid, {
    gutter: 10,
    horizontalOrder: true,
    itemSelector: ".grid-item",
  });
  // Layout Masonry after each image loads
  imagesLoaded(grid).on("progress", function() {
    msnry.layout();
  });
});
