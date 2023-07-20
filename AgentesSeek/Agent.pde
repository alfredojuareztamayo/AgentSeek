public class Agent {
  PVector position;
  PVector currentVel;
  PVector desiredVel;
  PVector steering;
  float maxSpeed;
  float maxVelocity;
  float mass;
  float maxForce;

  public Agent(PVector pos, float maxSpd, float maxV, float maxF, float mss) {
    position = pos;
    currentVel = new PVector(0, 0);
    desiredVel = new PVector(0, 0);
    steering = new PVector(0, 0);
    maxSpeed = maxSpd;
    maxVelocity = maxV;
    maxForce = maxF;
    mass = mss;
  }
}//End class Agent
