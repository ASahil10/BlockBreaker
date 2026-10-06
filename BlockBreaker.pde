// BREAKOUT 
// LEFT / RIGHT: move. SPACE: launch. R: restart.

float paddleX = 300;
float ballX = 300;
float ballY = 418;
float speedX = 3;
float speedY = -4;
boolean ballMoving = false;
int score = 0;
int lives = 3;
boolean gameWon = false;
boolean gameLost = false;

// Each matching array index describes one brick.
float[] brickX = {90, 230, 370, 510, 90, 230, 370, 510};
float[] brickY = {100, 100, 100, 100, 145, 145, 145, 145};
boolean[] brickAlive = {true, true, true, true, true, true, true, true};

void setup() {
  size(600, 500);
}

void draw() {
  background(20, 25, 45);
  noStroke();
  rectMode(CENTER);

  if (gameWon || gameLost) {
    fill(255);
    textAlign(CENTER);
    textSize(36);
    if (gameWon) {
      text("YOU WIN!", width / 2, 220);
    } else {
      text("GAME OVER", width / 2, 220);
    }
    textSize(20);
    text("Score: " + score, width / 2, 270);
    text("Press R to restart", width / 2, 315);
    return;
  }

  // Move the paddle with the keyboard.
  if (keyPressed) {
    if (keyCode == LEFT) {
      paddleX = paddleX - 6;
    }
    if (keyCode == RIGHT) {
      paddleX = paddleX + 6;
    }
  }
  paddleX = constrain(paddleX, 50, width - 50);

  if (!ballMoving) {
    // Before launch, the ball follows the paddle.
    ballX = paddleX;
    ballY = 418;
  } else {
    ballX = ballX + speedX;
    ballY = ballY + speedY;

    // Reverse direction when the ball touches a wall.
    if (ballX <= 10) {
      ballX = 10;
      speedX = -speedX;
    }
    if (ballX >= width - 10) {
      ballX = width - 10;
      speedX = -speedX;.
      
    }
    if (ballY <= 10) {
      ballY = 10;
      speedY = -speedY;
    }

    // Bounce only when falling across the top of the paddle.
    // The paddle's top is at Y = 430; ball radius is 10.
    if (speedY > 0 && ballY + 10 >= 430 && ballY + 10 - speedY < 430) {
      if (ballX + 10 >= paddleX - 50 && ballX - 10 <= paddleX + 50) {
        ballY = 420;
        speedY = -speedY;
        // Left and right paddle halves send the ball that way.
        if (ballX < paddleX) {
          speedX = -3;
        } else {
          speedX = 3;
        }
      }
    }

    // Check each brick using its rectangular boundaries.
    for (int i = 0; i < brickAlive.length; i++) {
      if (brickAlive[i]) {
        if (ballX + 10 > brickX[i] - 60 && ballX - 10 < brickX[i] + 60 &&
            ballY + 10 > brickY[i] - 15 && ballY - 10 < brickY[i] + 15) {
          brickAlive[i] = false;
          score = score + 10;
          // A simple bounce, like the direction reversal in Tutorial 2.
          speedY = -speedY;
          // Only break one brick per frame.
          break;
        }
      }
    }

    if (ballY > height + 10) {
      lives = lives - 1;
      ballMoving = false;
      speedX = 3;
      speedY = -4;
      ballX = paddleX;
      ballY = 418;
      if (lives == 0) {
        gameLost = true;
      }
    }
  }

  boolean bricksRemaining = false;
  for (int i = 0; i < brickAlive.length; i++) {
    if (brickAlive[i]) {
      bricksRemaining = true;
      drawBrick(brickX[i], brickY[i]);
    }
  }
  if (!bricksRemaining) {
    gameWon = true;
  }

  fill(80, 210, 240);
  rect(paddleX, 440, 100, 20);
  fill(255, 220, 80);
  circle(ballX, ballY, 20);

  fill(255);
  textAlign(LEFT);
  textSize(20);
  text("Score: " + score, 20, 30);
  text("Lives: " + lives, 480, 30);
  textSize(14);
  text("LEFT / RIGHT: Move    SPACE: Launch    R: Restart", 20, 55);
  if (!ballMoving) {
    textAlign(CENTER);
    text("Press SPACE to launch", width / 2, 350);
  }
}

void drawBrick(float x, float y) {
  if (y == 100) {
    fill(255, 110, 110);
  } else {
    fill(160, 120, 240);
  }
  rect(x, y, 120, 30, 5);
}

void keyPressed() {
  if (key == ' ' && !gameWon && !gameLost) {
    ballMoving = true;
  }
  if (key == 'r' || key == 'R') {
    restartGame();
  }
}

void restartGame() {
  paddleX = width / 2;
  ballX = paddleX;
  ballY = 418;
  speedX = 3;
  speedY = -4;
  ballMoving = false;
  score = 0;
  lives = 3;
  gameWon = false;
  gameLost = false;
  for (int i = 0; i < brickAlive.length; i++) {
    brickAlive[i] = true;
  }
}
