Agent agent, target;
SteeringBehavior sb;

void setup() {
  size(900, 900);
  agent = new Agent(new PVector(10, 10), 10, 5, 12, 5);
  target = new Agent(new PVector(600/2, 600/2), 11, 6, 1, 3);
  sb = new SteeringBehavior();
}
void draw() {
  background(25, 150, 97);
  sb.seek(agent, target);
  sb.flee(target, agent);
  colorCaracter();
}


void colorCaracter() {
  fill(230);
  circle(agent.position.x, agent.position.y, 50);
  //target.x= mouseX;
  //target.y=mouseY;
  fill(80);
  circle(target.position.x, target.position.y, 90);
}
