// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2017 Neil Panchal, http://neil.engineer
// ----------------------------------------------------------------------------
// Import libraries


float wallX = 0;
float wallY = 0;

color r;
color y;
color g;
color b;
color[] colors = {
	new Chroma(ColorSpace.LCH, 40, 50, 38).saturate(90).get(),
	new Chroma(ColorSpace.LCH, 70, 50, 85).saturate().get(),
	new Chroma(ColorSpace.LCH, 45, 50, 165).saturate().get(),
	new Chroma(ColorSpace.LCH, 45, 50, 260).saturate().get(),
};

void settings() {

    size(CANVAS_WIDTH, CANVAS_HEIGHT, FX2D);
    pixelDensity(2);
    // fullScreen();

}

void setup() {


    // Set window title
    surface.setTitle(projectName + " / " + CANVAS_WIDTH + " x " + CANVAS_HEIGHT);
    surface.setLocation(520, 100);

    cf = new ControlFrame(this, 420, 900, "Controls");
    background(255);
    shapeMode(CENTER);
    frameRate(24);
    noStroke();
    smooth();

    colorMode(RGB, 255, 255, 255, 100);

    // Add an initial set of boids into the system
    resetSketch();

    // Colors


}

void draw() {


    drawBegin(); // Call routine draw functions

    // Run the process

    if (mousePressed) {
    }

    drawEnd(); // Call routine end draw functions
}




public void resetSketch() {

    noLoop();
    background(255);
    loop();
}


public void startPDFRecording() {

    beginRecord( PDF, "../Export/PDF/" + projectName + "." + UUID.randomUUID().toString().substring(0, 8) + ".pdf");
}

public void endPDFRecording() {
    endRecord();
}
