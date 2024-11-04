import ddf.minim.*;

// Global Variables
Minim minim;
int numberOfSongs = 2; // Updated for two songs
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = 0;

// App Dimensions
int appWidth, appHeight;

// Button Dimensions
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;

// Colors
color purple = #DB05FF, yellow = #E9FF00, blue = #037EFF, white = #FFFFFF, black = #000000, green = #00FF00;
color appColorForeground, appColorHoverover, appColorBackground;

// Mode Preference
boolean colorDarkMode = false;

void setup() {
  size(1000, 800);
  appWidth = width;
  appHeight = height;

  // Button Dimensions
  musicButtonDIV_Width = appWidth / 2;
  musicButtonDIV_Height = appHeight / 2;
  musicButtonDIV_X = (appWidth - musicButtonDIV_Width) / 2;
  musicButtonDIV_Y = (appHeight - musicButtonDIV_Height) / 2;

  musicButtonSquareWidth = musicButtonDIV_Width;
  musicButtonSquareHeight = musicButtonDIV_Height;
  musicButtonSquareX = musicButtonDIV_X;
  musicButtonSquareY = musicButtonDIV_Y;

  // Stop Button
  stopWidth = musicButtonSquareWidth / 4;
  stopHeight = musicButtonSquareHeight / 4;
  stopX = musicButtonSquareX + (musicButtonSquareWidth - stopWidth) / 2;
  stopY = musicButtonSquareY + (musicButtonSquareHeight - stopHeight) / 2;

  minim = new Minim(this);
  
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  String ghostWalk = "Ghost_Walk";
  String groove = "groove";

  String directory = "../../../" + musicPathway;
  song[0] = minim.loadFile(directory + groove + mp3FileName);
  song[1] = minim.loadFile(directory + ghostWalk + mp3FileName);
  
  // Start Playing
  song[currentSong].play();

  // Set Colors
  if (colorDarkMode) {
    appColorForeground = purple;
    appColorHoverover = yellow;
    appColorBackground = black;
  } else {
    appColorForeground = purple;
    appColorHoverover = blue;
    appColorBackground = white;
  }
}

void draw() {
  background(appColorBackground);
  
  // Draw Music Button
  fill(appColorForeground);
  rect(musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight);

  // Hover Effect for Stop Button
  if (mouseX > musicButtonSquareX && mouseX < musicButtonSquareX + musicButtonSquareWidth && 
      mouseY > musicButtonSquareY && mouseY < musicButtonSquareY + musicButtonSquareHeight) {
    fill(appColorHoverover);
  } else {
    fill(appColorForeground);
  }
  
  rect(stopX, stopY, stopWidth, stopHeight);
}

void mousePressed() {
  // Stop Button Interaction
  if (mouseX > stopX && mouseX < stopX + stopWidth && 
      mouseY > stopY && mouseY < stopY + stopHeight) {
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
    } else {
      song[currentSong].rewind();
      song[currentSong].play();
    }
  }
}

void keyPressed() {
  // Play and Stop Controls
  if (key == 'P' || key == 'p') {
    song[currentSong].loop(0);
  }
  if (key == 'S' || key == 's') {
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
    } else {
      song[currentSong].rewind();
      song[currentSong].play();
    }
  }
}
