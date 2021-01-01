void promotion () {
  strokeWeight(2);
  stroke(0);
  fill(140);
  rect(150, 250, 500, 300 );

  //fill();

  rect(170, 400, 100, 100);
  image (wrook, 170, 400, 100, 100);
  if (mouseX > 170 & mouseX < 270 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'r'; 
      promo = false;
      promoPiece = 'r';
      myServer.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }

  rect(290, 400, 100, 100);
  image(wbishop, 290, 400, 100, 100);
  if (mouseX > 290 & mouseX < 390 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'b'; 
      promo = false;
      promoPiece = 'b';
      myServer.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }  

  rect(410, 400, 100, 100);
  image(wknight, 410, 400, 100, 100);
  if (mouseX > 410 & mouseX < 510 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'n'; 
      promo = false;
      promoPiece = 'n';
      myServer.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }

  rect(530, 400, 100, 100);
  image(wqueen, 530, 400, 100, 100);
  if (mouseX > 530 & mouseX < 630 & mouseY > 400 & mouseY < 500 ) {
    if (mousePressed) {
      grid[row2][col2] = 'q'; 
      promo = false;
      promoPiece = 'q';
      myServer.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 2 + "," + lastPieceTaken + "," + promoPiece);
    }
  }
}
