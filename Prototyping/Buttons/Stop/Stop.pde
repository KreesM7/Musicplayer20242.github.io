import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

// Global Variables
Minim minim;
int numberOfSongs = 8; // Number of songs available
AudioPlayer[] songs = new AudioPlayer[numberOfSongs]; // Array to hold songs
int currentSongIndex = 0; // Start with the first song

int appWidth, appHeight; 
// Dimensions for buttons and layout
float musicButtonWidth, musicButtonHeight, musicButtonX, musicButtonY;
float stopButtonWidth, stopButtonHeight, stopButtonX, stopButtonY; 

color purple = #DB05FF, yellow = #E9FF00, blue = #037EFF, white = #FFFFFF, black = #000000, green = #00FF00; 
color appForeground, appHover, appBackground; 
boolean darkMode = false; // User preference for dark mode

void setup() {
  size(1000, 800); // Set canvas size
  appWidth = width; 
  appHeight = height;

  // Calculate button dimensions
  musicButtonWidth = appWidth * 0.5; 
  musicButtonHeight = appHeight * 0.5; 
  musicButtonX = (appWidth - musicButtonWidth) / 2; 
  musicButtonY = (appHeight - musicButtonHeight) / 2; 

  stopButtonWidth = musicButtonWidth * 0.5; 
  stopButtonHeight = musicButtonHeight * 0.5; 
  stopButtonX = musicButtonX + (musicButtonWidth - stopButtonWidth) / 2; 
  stopButtonY = musicButtonY + (musicButtonHeight - stopButtonHeight) / 2; 

  minim = new Minim(this); // Initialize Minim for audio

  // Load Music Files
  String musicPath = "Music/"; 
  String mp3Extension = ".mp3"; 
  String[] songNames = { "Ghost_Walk", "groove" }; // Example song names

  for (int i = 0; i < songNames.length; i++) {
    String filePath = "../../../" + musicPath + songNames[i] + mp3Extension; 
    songs[i] = minim.loadFile(filePath); 
  }

  // Play the first song
  songs[currentSongIndex].play();

  // Set color scheme based on time of day or user preference
  updateColorScheme(); 
}

void draw() {
  background(appBackground); 
  fill(appForeground); 
  rect(musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight); 

  // Stop button hover effect
  fill(mouseX > stopButtonX && mouseX < stopButtonX + stopButtonWidth && mouseY > stopButtonY && mouseY < stopButtonY + stopButtonHeight ? appHover : appForeground); 
  rect(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight); 
}

void mousePressed() {
  // Stop button interaction
  if (mouseX > stopButtonX && mouseX < stopButtonX + stopButtonWidth && mouseY > stopButtonY && mouseY < stopButtonY + stopButtonHeight) {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause(); // Pause if playing
    } else {
      songs[currentSongIndex].rewind(); // Rewind if paused
    }
  }
}

void keyPressed() {
  if (key == 'P' || key == 'p') {
    songs[currentSongIndex].loop(0); // Play the song on 'P' key
  }
  if (key == 'S' || key == 's') {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause(); // Pause on 'S' key
    } else {
      songs[currentSongIndex].rewind(); // Rewind on double tap
    }
  }
}

void updateColorScheme() {
  if (darkMode) {
    appForeground = purple; 
    appHover = yellow; 
    appBackground = black; 
  } else {
    appForeground = (hour() <= 7 || hour() >= 17) ? green : purple; 
    appHover = yellow; 
    appBackground = (hour() <= 7 || hour() >= 17) ? black : white; 
  }
}
