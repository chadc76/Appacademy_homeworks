document.addEventListener("DOMContentLoaded", function smiley() {
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'purple';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 240, 0, 2 * Math.PI);
  ctx.fillStyle = 'blue';
  ctx.fill();
  ctx.moveTo(375, 250);
  ctx.arc(250, 250, 125, 0, Math.PI, false);  // Mouth (clockwise)
  ctx.moveTo(205, 160);
  ctx.arc(180, 160, 25, 0, Math.PI * 2, true);  // Left eye
  ctx.moveTo(335, 160);
  ctx.arc(310, 160, 25, 0, Math.PI * 2, true);  // Right eye
  ctx.strokeStyle = 'black'
  ctx.lineWidth = 5;
  ctx.stroke();
});