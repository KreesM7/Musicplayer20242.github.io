import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight;
//
void setup()
{
  size(400, 800);
  size(900, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonX = ;
  musicButtonY = ;
  musicButtonWidth = appWidth*1/2;
  musicButtonHeight = appHeight*1/2;
  musicButtonX = musicButtonWidth - musicButtonWidth*1/2;
  musicButtonY = musicButtonHeight - musicButtonHeight*1/2;
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  //rect( musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight );
  rect( musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight );
} //End setup
//
void draw() {
