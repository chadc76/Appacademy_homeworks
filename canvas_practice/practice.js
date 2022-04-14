document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.style.width = 500;
  canvas.style.height = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'red';
  void ctx.fillRect(0, 0, 500, 500);
});
