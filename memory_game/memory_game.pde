char[] nums = {'2', '1', '3', '6', '7', '7', '1', '2', '4', '6', '5', '5', '4', '8', 
  '8', '3'};
boolean[] covered = new boolean[nums.length];
int[] pair = new int[2];
int size = 125;
int p = 0;
int c = 0;
int count = 0;
int timer = 0;
PFont font;

void setup() {
  size(600, 600);

  //cover the numbers
  for (int i = 0; i < nums.length; i++) {
    covered[i] = true;
  }
}

void draw() {
  background(#FFD191); //orange
  
  for (int y = 0; y < 4; y++) {
    for (int x = 0; x < 4; x++) {

      fill(#B39366); //dark orange
      textAlign(CENTER, CENTER);
      textSize(30);
      text(nums[c], x * size + 105, y * size + 105);

      if (covered[c]) {
        fill(255); //white
        noStroke();
        rect(x * size + 52.5, y * size + 52.5, size - 5, size - 5);
      }
      c++;
      if (c == 16) {
        c = 0;
      }
    }
  }

  if (count == 2) {
    if (millis() - timer > 1000) {
      if (nums[pair[0]] != nums[pair[1]]) {
        covered[pair[0]] = true;
        covered[pair[1]] = true;
      }
      count = 0;
    }
  }
}

void mousePressed() {

  for (int y = 0; y < 4; y++) {
    for (int x = 0; x < 4; x++) {
      if (covered[p]) {
        if (mouseX >= x * size + 52.5 
          && mouseX <= (x * size + 52.5) + size - 5
          && mouseY >= (y * size + 52.5)
          && mouseY <= (y * size + 52.5) + size - 5) {
          if (count < 2) {
            pair[count] = p;
            covered[p] = false;
            count++;
            timer = millis();
          }
        }
      }
      p++;
        if (p == 16) {
          p = 0;
        }
    }
  }
}
