///Here I want to record gesture so I can make
//a gesture recognizer

PrintWriter output;
int counter = 0;

void setupTest() {
  // Create a new file in the sketch directory
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  output = createWriter("positions_" + m + ":"+ s +".txt"); 
}

void drawTest() {

  output.println(counter +":: "+ AValue2.get(0) +", "+ AValue2.get(1) +", "+ AValue2.get(2)); // Write the coordinate to the file
  counter++;
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}



