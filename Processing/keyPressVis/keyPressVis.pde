/*

 380.005 - Programming I     
 Prof. Marlene Brandstätter

 Wesley Lee Yang
 wesley6@gmail.com
 Matrikelnummer: 11732685
 
 */


//It is mapped to my keyboard, en-US / apple
char[][] enUSCharMap = {
  {'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'}, 
  {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'}, 
  {'Z', 'X', 'C', 'V', 'B', 'N', 'M'}
};

//contains height of the boxes
int[][] charHeight = new int[3][10];

//font for the letters on the boxes
PFont font;

void setup() {
  size(480, 270, P3D);
  noStroke();
  
  textMode(SHAPE); // I needed this otherwise font background was not transparent
  font = createFont("sans-serif", 12);
  
  textAlign(CENTER, CENTER);
  textFont(font);
}


void draw() {
  background(0); 
  lights(); // gives some shadows to the 3D shapes

  drawBoxes(); // draws the boxes with the positions stored in the array
  reduceCharHeight(); // changes the height of the boxes if they are higher than 0
}


// goes through all the rectangles and if its higher than > 0, lower it
void reduceCharHeight() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j< 10; j++) {
      if (charHeight[i][j] > 0) { 
        charHeight[i][j]--;
      }
    }
  }
}

// draws the rectangles and the letter on the key
void drawBoxes() {
  pushMatrix();
  translate(100, 100, 0);
  rotateX(-100);

// I tried to use nested fors but got some issues with array out of bounds
// since not all lines have 10 chars.
// Next try was charHeight[j].length, but it returned 10 all the times.
// Then I tried:
/*

for (int j = 0; i < 3; j++) {
  int i = 0;
  while (enUSCharMap[j][i] != 0) { 
    //draw the boxes [j][i]
  i++;
  }
} 

*/
// to only go through the array positions that had characters,
// but all positions returned 0.. so I just copied and pasted the for loop 3 times
// and put the "j" values and line lengths manually


  for (int i = 0; i < 10; i++) {
    translate(25, 0, charHeight[0][i]/2);
    fill(0);
    text(enUSCharMap[0][i], 0, 0, charHeight[0][i]/2+1);
    fill(255);
    box(20, 20, charHeight[0][i]);
    translate(0, 0, -charHeight[0][i]/2);
  }

  translate(-10*25 + 10, 25, 0);
  
  for (int i = 0; i < 9; i++) {
    translate(25, 0, charHeight[1][i]/2);
    fill(0);
    text(enUSCharMap[1][i], 0, 0, charHeight[1][i]/2+1);
    fill(255);
    box(20, 20, charHeight[1][i]);
    translate(0, 0, -charHeight[1][i]/2);
  }

  translate(-9*25 + 10, 25, 0);

  for (int i = 0; i < 7; i++) {
    translate(25, 0, charHeight[2][i]/2);
    fill(0);
    text(enUSCharMap[2][i], 0, 0, charHeight[2][i]/2+1);
    fill(255);
    box(20, 20, charHeight[2][i]);
    translate(0, 0, -charHeight[2][i]/2);
  }
  popMatrix();
}


// If a key is pressed, add height to its corresponding box.
// A possible next step would be to get the pressed key and check its position in the 'enUSCharMap' array,
// instead of using the "coordinates" manually [0][1], [0][2], etc.. i.e.:
/*

void addKeyHeight(){
  for i
    for j
      if enUSCharMap[j][i] == 'key'
        charHeight[j][i] += 20
}

*/
// but to test the program I did the first line (10 chars) manually, so later I just copied
// and modified it for the remaining chars.
void keyPressed() {
  switch(key) {
  case 'q':
    charHeight[0][0] +=20;
    break;

  case 'w':
    charHeight[0][1] +=20;
    break;

  case 'e':
    charHeight[0][2] +=20;
    break;

  case 'r':
    charHeight[0][3] +=20;
    break;

  case 't':
    charHeight[0][4] +=20;
    break;

  case 'y':
    charHeight[0][5] +=20;
    break;

  case 'u':
    charHeight[0][6] +=20;
    break;

  case 'i':
    charHeight[0][7] +=20;
    break;

  case 'o':
    charHeight[0][8] +=20;
    break;
  case 'p':
    charHeight[0][9] +=20;
    break;


  case 'a':
    charHeight[1][0] +=20;
    break;

  case 's':
    charHeight[1][1] +=20;
    break;

  case 'd':
    charHeight[1][2] +=20;
    break;

  case 'f':
    charHeight[1][3] +=20;
    break;

  case 'g':
    charHeight[1][4] +=20;
    break;

  case 'h':
    charHeight[1][5] +=20;
    break;

  case 'j':
    charHeight[1][6] +=20;
    break;

  case 'k':
    charHeight[1][7] +=20;
    break;

  case 'l':
    charHeight[1][8] +=20;
    break;




  case 'z':
    charHeight[2][0] +=20;
    break;

  case 'x':
    charHeight[2][1] +=20;
    break;

  case 'c':
    charHeight[2][2] +=20;
    break;

  case 'v':
    charHeight[2][3] +=20;
    break;

  case 'b':
    charHeight[2][4] +=20;
    break;

  case 'n':
    charHeight[2][5] +=20;
    break;

  case 'm':
    charHeight[2][6] +=20;
    break;
  }
}