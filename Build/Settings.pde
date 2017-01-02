// Project Libraries

import controlP5.*;
import processing.pdf.*;
import de.looksgood.ani.*;
import java.util.*;
import com.chroma.*;
import com.luma.*;

boolean showvalues = true;

boolean clearBG;
boolean bgRefresh;

// Project details
String projectName = "topic-name";
String videoFolder = "";
int folderName = 1;
int staticFrame = 1;
int videoFrame;
int videoFrameMax = 750;

// Settings
boolean exportPDF;
boolean startPDF;
boolean endPDF;
boolean framePDF;

boolean exportVideo;
int numOfFramesPDF = 20;
PGraphicsPDF[] framesPDF = new PGraphicsPDF[numOfFramesPDF];
PGraphicsPDF pdf;
// Staging
int CANVAS_WIDTH = 1920;
int CANVAS_HEIGHT = 1080;

ControlFrame cf;

// ----------------------------------------------------------------------------

void drawBegin() {
    // background(getRandomColor().get());
    if (bgRefresh) {
        background(255);
    }

    if (startPDF && !bgRefresh) {
        startPDFRecording();
        startPDF = false;
    }

    if (framePDF) {
        startPDFRecording();
    }
}

void drawEnd() {

    // End Draw

    if (exportVideo && videoFrame <= videoFrameMax) {

        saveVideo(videoFrame++);

    } else {
        exportVideo = false;
    }
    if (clearBG) {
        background(255);
        clearBG = false;
    }

    if (framePDF) {
        endPDFRecording();
        framePDF = false;
    }
    if (endPDF && !bgRefresh) {
        endPDFRecording();
        endPDF = false;
    }

}

void mousePressed() {
}

void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../Export/" + projectName + "_" + staticFrame + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".png");
        staticFrame++;
    }
    // Export Video Frames
    if (key == 'p' || key == 'P') { exportPDF = !exportPDF; }
    // Export Video Frames
    if (key == 'v' || key == 'V') { exportVideo = !exportVideo; }
    // Reset program
    if (key == 'r' || key == 'R') {
        // Reset Function
        resetSketch();
    }

    if (key == 'c' || key == 'C') {
        // Reset Function
        cf.toggleWindow();
    }
}

void clearBackground() {
    clearBG = true;
}


void delay(int delay) {
    int time = millis();
    while (millis() - time <= delay);
}

void saveVideo(int i) {
    String istr = i + "";
    if (i < 10) { istr = "00000" + i; }
    else if (i < 100) { istr = "0000" + i; }
    else if (i < 1000) { istr = "000" + i; }
    else if (i < 10000) { istr = "00" + i; }
    else if (i < 100000) { istr = "0" + i; }
    saveFrame("../Export/Video/" + videoFolder + "/" + projectName + "." + istr + ".png");
}

public void recordVideo() {
    videoFolder = UUID.randomUUID().toString().substring(0, 8);
    videoFrame = 1;
    exportVideo = true;
}


// HOW TO ENCODE VIDEO FILES

/*
# use format
ffmpeg [global_options] {[input_options] -i ‘input_file’} ... {[output_options] ‘output_file’} ...

# make a movie from matching .png files, write over original, codec = libx264 (H.264), framerate = 30, 1 pass, resolution = 1920×1080, video bitrate = 6Mbits, format = mp4
ffmpeg -y -pattern_type glob -i 'p_*.png' -vcodec libx264 -r 30 -q 100 -pass 1 -s 1920x1080 -vb 6M -threads 0 -f mp4 file.mp4

# convert the video file to Apple ProRes codec for use in Final Cut
ffmpeg -y -i file.mp4 -vcodec prores -vb 6M -r 30 -s 1920x1080 -f mov file.mov

# here’s another example conversion command. this one has a much higher bitrate
ffmpeg -y -i file_01.mp4 -b:v 40M -vcodec libx264 -pass 1 file_02.mp4

*******************************************************************************
ffmpeg -y -i "GA.229.03.%06d.png" -vcodec libx264 -r 30 -q 100 -pass 1 -s 1920x1080 -vb 16M -threads 0 -f mp4 GA.229.03.1080p.mp4

ffmpeg -y -i GA.229.03.1080p.mp4 -vcodec prores -vb 16M -r 30 -s 1920x1080 -f mov GA.229.03.1080p.mov

*******************************************************************************

ffmpeg -y -i "GA.229.%06d.png" -vcodec libx264 -r 30 -q 100 -pass 1 -s 1080x1080 -vb 16M -threads 0 -f mp4 GA.229.1080p.mp4

ffmpeg -y -i GA.229.1080p.mp4 -vcodec prores -vb 16M -r 30 -s 1080x1080 -f mov GA.229.1080p.mov

*******************************************************************************
ffmpeg -y -i "GA.229.03.%06d.png" -vcodec libx264 -r 30 -q 100 -pass 1 -s 3840x2160 -vb 32M -threads 0 -f mp4 GA.229.03.4k.mp4

ffmpeg -y -i GA.229.03.4k.mp4 -vcodec prores -vb 32M -r 30 -s 3840x2160 -f mov GA.229.03.4k.mov

*/


// Load shapes

// PShape diamonds;
// PShape hearts;
// PShape spades;
// PShape clubs;
// PShape[] cards;

// Add the following lines to setup()
    // diamonds = loadShape("../Assets/diamonds.svg");
    // hearts = loadShape("../Assets/hearts.svg");
    // spades = loadShape("../Assets/spades.svg");
    // clubs = loadShape("../Assets/clubs.svg");
    // cards = new PShape[]{diamonds, hearts, spades, clubs};
