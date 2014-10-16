NormalParticle [] notOdd = new NormalParticle[1000];
OddballParticle notEven;
void setup(){
	size(500,500);
	background(0);
	for(int i = 0; i < notOdd.length; i++){
        notOdd[i] = new NormalParticle(250,250);
    }
    notEven = new OddballParticle(250,250);
}
void draw(){
	background(0);
	for(int i = 0; i < notOdd.length; i++){
		notOdd[i].move();
		notOdd[i].loopBack();
		notOdd[i].show();
	}
	notEven.move();
	notEven.show();
}
class NormalParticle{
	int r,g,b;
	double angle, speed, xpos, ypos, xClick, yClick;
	NormalParticle(int x, int y){
		xpos = x;
		ypos = y;
		speed = (int)(Math.random() * 5) + 1;
		angle = (Math.random() * 2 * Math.PI);
		xClick = 250;
		yClick = 250;
		r = (int)(Math.random()*255)+1;
		g = (int)(Math.random()*255)+1;
		b = (int)(Math.random()*255)+1;
	}
	void show(){
		fill(r,g,b);
		ellipse((int)xpos,(int)ypos,5,5);
	}
	void move(){
		xpos = Math.cos(angle) * speed + xpos;
		ypos = Math.sin(angle) * speed + ypos;
	}
	void loopBack(){
		if(xpos < 0 || xpos > 500 || ypos < 0 || ypos > 500){
			xpos = xClick;
			ypos = yClick;
		}
		if(mousePressed == true){
			xClick = mouseX;
			yClick = mouseY;
		}
    }
}
interface Particle{
	public void move();
	public void show();
}
class OddballParticle{
	double xpos, ypos;
	OddballParticle(int x, int y){
		xpos = x;
		ypos = y;
	}
	void show(){
		fill(0,255,0);
		ellipse((int)xpos,(int)ypos,25,25);
	}
	void move(){
		xpos = mouseX;
		ypos = mouseY;
	}
}


//5 data members: X and Y positions, Color, Angle and Speed. (Hint use doubles for X, Y, Speed and Angle)
//Particle(), the class constructor
//void move(), Takes the cos of the angle times the speed and adds it to the X coordinate. Does the same to Y with the sin of the angle.
//void show(), sets the current color to the color of the particle and draws a dot using ellipse()