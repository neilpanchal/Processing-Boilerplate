class ControlFrame extends PApplet {

    int w, h;
    int posYCount;
    int posYCountLabel;
    int controlHeight;
    int controlWidth;
    int buttonWidth;
    int captionLabelWidth;

    int paddingX, paddingY, spacingY;
    PApplet parent;
    ControlP5 cp5;

    boolean toggleWindow;

    List<Textlabel> textLabelList;
    List<String> labelList;

    public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
        super();
        parent = _parent;
        w = _w;
        h = _h;
        paddingX = 20;
        paddingY = 20;
        spacingY = 20;
        captionLabelWidth = 100;
        controlHeight = 16;
        controlWidth = _w - (2 * paddingX) - captionLabelWidth;
        buttonWidth = 16;

        toggleWindow = true;

        labelList = new ArrayList();
        labelList.add("Reset");
        labelList.add("Clear BG");

        labelList.add("BG Refresh");

        labelList.add("Start Video");
        labelList.add("Frame PDF");
        labelList.add("Start PDF");
        labelList.add("End PDF");

        textLabelList = Arrays.asList(new Textlabel[labelList.size()]);
        PApplet.runSketch(new String[] {this.getClass().getName()}, this);
    }

    public void settings() {
        size(w, h);
    }

    public void setup() {
        surface.setLocation(50, 100);
        surface.setTitle(projectName + " / Controller");
        surface.setAlwaysOnTop(true);
        cp5 = new ControlP5(this);


        // Add variables to the .plugTo method as follows.
        // .plugTo(parent, "Variable Name String")


        cp5.addBang("resetSketch")
        .setCaptionLabel("")
        .plugTo(parent)
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.addBang("clearBackground")
        .setCaptionLabel("")
        .plugTo(parent)
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.addToggle("toggleBGRefresh")
        .setCaptionLabel("")
        .plugTo(parent, "bgRefresh")
        .setValue(true)
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.addBang("bangVideo")
        .setCaptionLabel("")
        .plugTo(parent, "recordVideo")
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.addButton("framePDF")
        .setCaptionLabel("")
        .plugTo(parent, "framePDF")
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.addButton("startPDF")
        .setCaptionLabel("")
        .plugTo(parent, "startPDF")
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.addButton("endPDF")
        .setCaptionLabel("")
        .plugTo(parent, "endPDF")
        .setPosition(getX(), getY())
        .setSize(buttonWidth, controlHeight);

        cp5.setColorCaptionLabel(color(0,0,0));
        cp5.setColorActive(#CC0000);
        cp5.setColorBackground(#CCCCCC);
        cp5.setColorForeground(#555555);


        for (String s:labelList) {

            Textlabel currTextLabel = textLabelList.get(labelList.indexOf(s));
            currTextLabel = cp5.addTextlabel(s)
                                .setText(s.toUpperCase())
                                .setPosition(getXLabel(), getYLabel())
                                .setColorValue(0xFF000000);
        }

    }
    int getX() {
        return paddingX + captionLabelWidth;
    }
    int getY() {
        int result = paddingY + (int)(posYCount * controlHeight*2);
        posYCount++;
        return result ;
    }

    int getXLabel() {
        return paddingX;
    }

    int getYLabel() {
        int result = paddingY + (int)(posYCountLabel * controlHeight*2);
        posYCountLabel++;
        return result ;
    }

    void draw() {
        background(#FFFFFF);
    }

    void toggleWindow() {
        surface.setVisible(toggleWindow);
        surface.setAlwaysOnTop(toggleWindow);
        toggleWindow = !toggleWindow;
        println("Controller Window Toggle");
    }

}
