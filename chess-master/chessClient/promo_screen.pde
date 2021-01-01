void promotion () {
  strokeWeight(2);
  stroke(0);
  fill(140);
  rect(150, 250, 500, 300 );

  //fill();

  rect(170, 400, 100, 100);
  image (brook, 170, 400, 100, 100);
  if (mouseX > 170 & mouseX < 270 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'R'; 
      promo = false;
      promoPiece = 'R';
      myClient.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }

  rect(290, 400, 100, 100);
  image(bbishop, 290, 400, 100, 100);
  if (mouseX > 290 & mouseX < 390 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'B'; 
      promo = false;
      promoPiece = 'B';
      myClient.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }  

  rect(410, 400, 100, 100);
  image(bknight, 410, 400, 100, 100);
  if (mouseX > 410 & mouseX < 510 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'N'; 
      promo = false;
      promoPiece = 'N';
      myClient.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }

  rect(530, 400, 100, 100);
  image(bqueen, 530, 400, 100, 100);
  if (mouseX > 530 & mouseX < 630 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'Q'; 
      promo = false;
      promoPiece = 'Q';
      myClient.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }
}
