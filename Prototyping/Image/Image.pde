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
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight; 
//
void setup() {
  size(1000, 800); // Set canvas size 
  appWidth = width; 
  appHeight = height;

  // Calculate music button dimensions
  musicButtonWidth = appWidth * 0.5; 
  musicButtonHeight = appHeight * 0.5; 
  musicButtonX = (appWidth - musicButtonWidth) / 2; 
  musicButtonY = (appHeight - musicButtonHeight) / 2; 

  // Set up Minim for audio
  minim = new Minim(this); 

  // Load Music
  String musicPathway = "Music/"; 
  String mp3FileName = ".mp3"; 
  // Alphabetical order for song titles
  String ghostWalk = "Ghost_Walk"; 
  String groove = "groove"; 

  // Define directory path
  String directory = "../../../" + musicPathway; 

  // Load songs into the array
  String file = directory + groove + mp3FileName; 
  songs[currentSongIndex] = minim.loadFile(file); 
  currentSongIndex++; // Move to the next song
  file = directory + ghostWalk + mp3FileName; 
  songs[currentSongIndex] = minim.loadFile(file); 

  // Play the first song
  songs[0].play(); 

  // Log button dimensions for debugging
  println("Button Position: (" + musicButtonX + ", " + musicButtonY + ") Size: (" + musicButtonWidth + ", " + musicButtonHeight + ")");
}

void draw() {
  background(200); // Set background color 
  fill(255); // Set fill color for buttons
  rect(musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight); // Draw music button 
}

void mousePressed() {
  // Implement mouse interaction logic if needed
}

void keyPressed() {
  // Implement keyboard shortcuts if needed
}

// End Main Program
