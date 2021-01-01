import processing.net.*;

Server myServer;

color lightbrown = #FFFFC3;
color darkbrown  = #D8864E;
PImage wrook, wbishop, wknight, wqueen, wking, wpawn;
PImage brook, bbishop, bknight, bqueen, bking, bpawn;
boolean firstClick;
int row1, col1, row2, col2;
boolean tB = false;
boolean itsMyTurn = true;
boolean promo;
char promoPiece = 'p';
char lastPieceTaken;
int action = 0;

char grid[][] = {
  {'R', 'B', 'N', 'Q', 'K', 'N', 'B', 'R'}, 
  {'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'}, 
  {'r', 'b', 'n', 'q', 'k', 'n', 'b', 'r'}
};


void setup() {
  size(800, 800);

  myServer = new Server(this, 1234);

  firstClick = true;

  brook = loadImage("blackRook.png");
  bbishop = loadImage("blackBishop.png");
  bknight = loadImage("blackKnight.png");
  bqueen = loadImage("blackQueen.png");
  bking = loadImage("blackKing.png");
  bpawn = loadImage("blackPawn.png");

  wrook = loadImage("whiteRook.png");
  wbishop = loadImage("whiteBishop.png");
  wknight = loadImage("whiteKnight.png");
  wqueen = loadImage("whiteQueen.png");
  wking = loadImage("whiteKing.png");
  wpawn = loadImage("whitePawn.png");
}



void draw() {
  drawBoard();
  drawPieces();
  //drawMark();
  receiveMove();
  //println(promoPiece);
  if (promo == true) {
    promotion();
  }
}



void receiveMove() {
  Client myclient = myServer.available();            
  if (myclient != null) {
    String incoming = myclient.readString();
    int r1 = int(incoming.substring(0, 1));
    int c1 = int(incoming.substring(2, 3));
    int r2 = int(incoming.substring(4, 5));
    int c2 = int(incoming.substring(6, 7));
    int a = int(incoming.substring(8, 9));
    lastPieceTaken = incoming.charAt(10);
    promoPiece = incoming.charAt(12);
    println("promoPiece:", promoPiece);
    println("r2, c2:", r2, c2);
    println("r1, c1:", r1, c1);

    if (a == 0) {
      grid[r2][c2] = grid[r1][c1];
      grid[r1][c1] = ' ';
    } else if 
      (a == 1) {
      grid[r1][c1] = grid[r2][c2];
      grid[r2][c2] = lastPieceTaken;
    }

    if (a == 2) {
      if (grid[r2][c2] == 'P') {
        if (r2 == 7) {
          //println("aaaaa");
          grid[r2][c2] = promoPiece;
        }
      }
    }


    itsMyTurn = true;
  }
}



void drawBoard() {
  noStroke();
  for (int r = 0; r < 8; r++) {
    for (int c = 0; c < 8; c++) { 
      if ( (r%2) == (c%2) ) { 
        fill(lightbrown);
      } else { 
        fill(darkbrown);
      }
      rect(c*100, r*100, 100, 100);
    }
  }
}



void drawPieces() {
  for (int r = 0; r < 8; r++) {
    for (int c = 0; c < 8; c++) {
      if (grid[r][c] == 'r') image (wrook, c*100, r*100, 100, 100);
      if (grid[r][c] == 'R') image (brook, c*100, r*100, 100, 100);
      if (grid[r][c] == 'b') image (wbishop, c*100, r*100, 100, 100);
      if (grid[r][c] == 'B') image (bbishop, c*100, r*100, 100, 100);
      if (grid[r][c] == 'n') image (wknight, c*100, r*100, 100, 100);
      if (grid[r][c] == 'N') image (bknight, c*100, r*100, 100, 100);
      if (grid[r][c] == 'q') image (wqueen, c*100, r*100, 100, 100);
      if (grid[r][c] == 'Q') image (bqueen, c*100, r*100, 100, 100);
      if (grid[r][c] == 'k') image (wking, c*100, r*100, 100, 100);
      if (grid[r][c] == 'K') image (bking, c*100, r*100, 100, 100);
      if (grid[r][c] == 'p') image (wpawn, c*100, r*100, 100, 100);
      if (grid[r][c] == 'P') image (bpawn, c*100, r*100, 100, 100);
    }
  }
}



//void drawMark() {
//noFill();
//stroke(255, 0, 0);
//strokeWeight(10);
//rect(col1*100, row1*100, 100, 100);
//}



void mouseReleased() {
  if (firstClick) {
    if (itsMyTurn) {
      row1 = mouseY/100;
      col1 = mouseX/100;
      firstClick = false;
    }
  } else {
    row2 = mouseY/100;
    col2 = mouseX/100;
    lastPieceTaken = grid[row2][col2];
    if (!(row2 == row1 && col2 == col1)) {
      grid[row2][col2] = grid[row1][col1];
      grid[row1][col1] = ' ';
      myServer.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 0 + "," + lastPieceTaken + "," + promoPiece);
      firstClick = true;
      itsMyTurn = false;
      tB = true;
      //println("gridr1c1:", grid[row1][col1]);
      //println("gridr2c2:", grid[row2][col2]);
      //println("lastPieceTaken:", lastPieceTaken);
    }

    if (grid[row2][col2] == 'p') {
      if (row2 == 0) 
      {
        promo = true;
      }
    }
  }
}



void takeBack() {
  if (tB) {
    grid[row1][col1] = grid[row2][col2];
    grid[row2][col2] = lastPieceTaken;
    myServer.write(row1 + "," + col1 + "," + row2 + "," + col2 + "," + 1 + "," + lastPieceTaken + ',' + promoPiece);
    promo = false;
    tB = false;
    //println("gridr1c1:", grid[row1][col1]);
    //println("gridr2c2:", grid[row2][col2]);
    //println("lastPieceTaken:", lastPieceTaken);
  }
}
