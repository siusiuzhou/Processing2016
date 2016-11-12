import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput audioOutput;

class SineInstrument implements Instrument {
  Oscil oscil;
  ADSR adsr;
  
  SineInstrument(float frequency, float amplitude) {
    oscil = new Oscil(frequency, amplitude, Waves.SINE);
    
    float maxAmp = 0.4;
    float attTime = 0.01;
    float decTime = 0.1;
    float susLvl = 0.5;
    float relTime = 0.5;
    
    adsr = new ADSR(maxAmp, attTime, decTime, susLvl, relTime);
    
    oscil.patch(adsr);
  }
  
  void noteOn(float duration) {
    adsr.noteOn();
    adsr.patch(audioOutput);
  }
  
  void noteOff() {
    adsr.noteOff();
    adsr.unpatchAfterRelease(audioOutput);
  }
}

int x = 0;
float notes[] = { 493.88, 440.00, 392.00, 349.23, 329.63, 293.66, 261.63, 246.94, 220.00, 196.00, 174.61, 164.81, 146.83, 130.81, 123.47 };

void setup() {
  size(400, 400);
  
  minim = new Minim(this);
  audioOutput = minim.getLineOut();
}

void draw() {
  background(0);
  noStroke();
  
  int circleSize = 20;

  int n = 15;

  for (int i = 0; i < n; i = i + 1) {
    float speedModifier = 100.0 + 10.0 * i;
    
    float circlePositionX = sin(x / speedModifier + i / 10.0) * width / 2 + width / 2;
    float circlePositionY = (height / (n + 1)) * (i + 1);

    fill(255, 106, 106);

    if (circlePositionX > width / 2 - 1.0 && 
        circlePositionX < width / 2 + 1.0) {
      fill(255, 0, 0);
      float freq = notes[i];
      audioOutput.playNote(0.0, 0.4, new SineInstrument(freq, 0.2));
    }

    ellipse(circlePositionX, circlePositionY, circleSize, circleSize);
  }

  x = x + 1;
}