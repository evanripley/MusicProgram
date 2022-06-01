//Library: use Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates an object to access all function
AudioPlayer song1; //creates a "Play List" variable holding extesions ...
//
void setup()
{
  //size(500, 600); //Remind you of Display Geometry
  minim = new Minim(this); //load from data directroy, loadFile() should also load from project folder, like loadImage()
  song1 = minim.loadFile("musicdownload/freemp3.plus-ALESTORM - P.A.R.T.Y. (Official Video) _ Napalm Records-320.mp3"); //able to pass absolute paths, file name & extesnion, and URL
}//End setup
//
void draw()
{
  if ( song1.isLooping() ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  println("Song Position", song1.position(), "Song Length", song1.length());
}//End draw
//
void keyPressed()
{
  //Another Play Button, as a finite loop()
  String keystr = null;
  int loopNum = -1;
  if ( key>=0 && key<=3) keystr = String.valueOf(key); //Must press a number
  if ( keystr!=null ) println("Number of Repeats is", keystr); 
  if ( keystr!=null) loopNum = int(keystr); //Local Variable plays once and loops loopNum of times
  if ( loopNum >= 0 && loopNum <= 3 ) song1.loop(loopNum); //Parameter is number of loops
  if ( loopNum > 3 ) println("I donot loop that much, press infinite loop.");
  //if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
  //
  //playpause
  if (key=='p' || key=='P') song1.play();   
  {
    if (song1.isPlaying()) {
      song1.pause();
    } else {
      song1.play();
    }
  }//end playpause
  //mute
  if (key == 'm' || key == 'M') {
    if (song1.isMuted()) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }  //end mute  
  //stop
  if (key == 's' || key == 'S') {
  //end stop
  if (song1.isPlaying()) 
    song1.pause();
    song1.rewind();
  } else {
    song1.rewind();
  }
  //First Play Button
  //song1.play(); //Parameter is milli-seconds from start of audio file to start playing
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN



//"musicdownload/freemp3.plus-ALESTORM - P.A.R.T.Y. (Official Video) _ Napalm Records-320.mp3"
