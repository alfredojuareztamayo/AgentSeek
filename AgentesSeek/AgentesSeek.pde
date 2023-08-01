Agent agent, target;
//SteeringBehavior sb;
float color1 = 123, color2= 234;
void setup()
{
  size(900, 900);
  agent = new Agent(new PVector(width/2, height/2), 3, 2, 1, 13);
  target = new Agent(new PVector(100, 0), 4, 3, 1, 25);
  //sb = new SteeringBehavior();
 // noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
   background(255, 180, 240);

  //fill(230);
  //circle(agent.position.x, agent.position.y, 30);
  // target.position = new PVector(mouseX, mouseY);
  //PVector fleeForce = sb.flee(agent, target.position);
  //sb.applyForce(target, sb.seek(target, agent.position));
  //sb.applyForce(agent, sb.flee(agent, target.position));

  //fill(50);
  //circle(target.position.x, target.position.y, 50);
  agent.bounds();
  target.bounds();
  agent.display(color(color1, 23, 21));
  target.display(color(color2, 95, 80));
  color1  = (color1>360)?0: color1 +  1f;
  color2  = (color2>360)?0: color2 + 1f;
}
