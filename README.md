# Breakout — Processing Project

## Overview

A simple Breakout game made in Processing Java mode. Move the paddle to bounce a ball and clear eight bricks. Each brick earns 10 points. Destroy all eight bricks to win with 80 points. Missing the ball costs one of three lives; losing all lives ends the game.

## Requirements

- Processing IDE with Java mode.
- The `Breakout.pde` sketch.
- No external libraries, images, audio files or other assets are required.

## How to Run

1. Create a folder named `Breakout`.
2. Put `Breakout.pde` inside that folder.
3. Open the sketch in Processing and select Java mode.
4. Click **Run**.
5. Press **Space** to launch the ball.

If Processing asks to move the sketch into a matching folder, accept the prompt.

## Controls

| Key | Action |
| --- | --- |
| Left arrow | Move the paddle left. |
| Right arrow | Move the paddle right. |
| Space | Launch the ball. |
| R | Restart the game and reset score, lives and bricks. |

Before launch and after a lost life, the ball follows the paddle until Space is pressed.

## Features

- A 600 × 500 game window.
- Two rows containing eight bricks in total.
- A moving ball and keyboard-controlled paddle.
- Simple wall, paddle and brick collisions.
- Score tracking, three lives, win/loss screens and restart.
- A different horizontal bounce direction for each half of the paddle.

## Code Structure

| Function | Purpose |
| --- | --- |
| `setup()` | Creates the window once. |
| `draw()` | Updates game state and renders each frame. |
| `drawBrick(float x, float y)` | Draws one brick at the supplied coordinates. |
| `keyPressed()` | Handles Space and R. |
| `restartGame()` | Restores the initial game state and all bricks. |

### Arrays

`brickX`, `brickY` and `brickAlive` are parallel arrays. The same index describes one brick's horizontal position, vertical position and surviving state. For example, brick 0 starts at `(90, 100)` and is alive.

### Loops

`for` loops check each brick for collisions, draw surviving bricks, determine whether any remain and restore all bricks during restart.

### Animation and Collision Logic

Each frame adds `speedX` and `speedY` to the ball's position. Negative Y speed moves upward. Wall and paddle collisions reverse the relevant speed. Brick collision uses rectangular overlap with the ball's bounding square and reverses vertical speed.

## Example Output

The accompanying `Assignment_1_Breakout_Report.pdf` includes reconstructed illustrations of the initial screen and winning screen. These are explanatory visuals, not screenshots from an executed Processing run.

For the final submission, capture actual screenshots showing gameplay, the win screen and the loss screen. Add them to the project folder and update the report as needed.

## Testing Checklist

Runtime testing has not been completed in this environment. Verify the following in Processing:

- Arrow keys move the paddle, and neither end leaves the screen.
- Space launches the ball.
- The ball bounces from the side and top walls and the paddle.
- A brick disappears after a hit and adds exactly 10 points.
- A miss removes one life and returns the ball above the paddle.
- Zero lives displays Game Over.
- Clearing all eight bricks displays You Win with 80 points.
- R restores all eight bricks, zero points and three lives.
- Check responsiveness when switching and overlapping arrow keys.

## Known Limitations

- Movement uses Processing's single `keyCode` and built-in `keyPressed` state. Overlapping keys can interrupt paddle movement. Separate left/right key state tracking is a proposed improvement.
- Brick collisions use simplified bounding-box overlap. Side hits reverse vertical speed rather than calculating a precise collision normal.
- There is one fixed level, no gravity and no mouse click/drag control.
- This document describes the original 100-pixel-wide paddle. The proposed reduction to 80 pixels has not been applied to the supplied sketch.

## Assignment Requirements

The supplied Assignment 1 asks students to choose one of five project options. Breakout is not named explicitly. Its closest match is **Option 4: Physics-Based Puzzle Game**, but the current sketch only partially matches that option:

| Required feature | Current status |
| --- | --- |
| Gravity and collisions | Collisions implemented; gravity absent. |
| Click/drag to move or place objects | Absent; controls are keyboard-based. |
| Win by stacking objects or clearing shapes | Implemented by clearing bricks. |
| Increasing difficulty through levels | Absent; one fixed layout. |

Implement the missing requirements or confirm acceptance of this variation with the instructor before submitting. The report includes the complete original instructions and marking rubric as an appendix.

## Group Contributions

Group members: Sahil Asifi, Burhanuddin Mohammed

Starting sketch: AI-assisted code based on the Processing tutorial concepts.

Actual group modifications, testing and design decisions: [add only work completed by your group].
