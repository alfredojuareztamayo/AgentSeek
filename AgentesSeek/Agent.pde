public class Agent {
  PVector position;
  PVector currentVel;
  PVector desiredVel;
  PVector steering;
  float maxSpeed;
  float maxVelocity;
  float mass;
  float maxForce;
  float perceptionRatio;

  public Agent(PVector pos, float maxSpd, float maxV, float maxF, float mss) {
    position = pos;
    currentVel = new PVector(0, 0);
    desiredVel = new PVector(0, 0);
    steering = new PVector(0, 0);
    maxSpeed = maxSpd;
    maxVelocity = maxV;
    maxForce = maxF;
    mass = mss;
    perceptionRatio = 200;
  }

  void perceptionManager(Agent toPercept) {
    if (PVector.dist(position, toPercept.position) < perceptionRatio) {
      if (toPercept.mass < mass) {
        //seek
      } else {
        //flee
      }
    }
  }

  void display(color clr) {
    fill(clr);
    circle(position.x, position.y, mass);
    stroke(10);
    noFill();
    circle(position.x, position.y, perceptionRatio*2);
  }

  void bounds() {
    if (position.x > width) {
      position = new PVector(0, position.y);
    } else if (position.x < -1) {
      position = new PVector(width -1, position.y);
    }
    if (position.y > height) {
      position = new PVector(position.x, 0);
    } else if (position.y < 0) {
      position = new PVector(position.x, height -1);
    }
  }
}//End class Agent
