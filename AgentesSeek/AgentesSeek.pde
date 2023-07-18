PVector agent, target, agentCurrentVel;


void setup(){
size(900,900);
 agent = new PVector(0,0);
target = new PVector(0,0);
agentCurrentVel = new PVector(0,0);
}
void draw(){
 background(25,150,97);
 seek();
 colorCaracter();
}

void seek(){
 float maxVel = 5, maxForce =2, mass = 20, maxSpeed = 10;
PVector desireVel = PVector.sub(target,agent);
desireVel.normalize();
desireVel.mult(maxVel);
PVector steering = PVector.sub(desireVel, agentCurrentVel);
steering.limit(maxForce);
steering.div(mass);
agentCurrentVel.add(steering);
agentCurrentVel.limit(maxSpeed);
agent.add(agentCurrentVel);
}



void colorCaracter(){
fill(230);
circle(agent.x ,agent.y, 50);
//target.x= mouseX;
//target.y=mouseY;
target = new PVector(mouseX,mouseY);
fill(80);
circle(target.x,target.y, 90);
}
