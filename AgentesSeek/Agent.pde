public enum AgentState {
  None,
    Seek,
    Flee,
    Wander
}

public class Agent {
  PVector position;
  PVector currentVel;
  PVector desiredVel;
  PVector steering;
  float maxSpeed;
  float maxVelocity;
  float mass;
  float maxForce;
  float prcptnRad;
  SteeringBehavior sb;
  Agent target;
  AgentState agentStates = AgentState.None;

  public Agent(PVector pos, float maxSpd, float maxV, float maxF, float mss) {
    position = pos;
    currentVel = new PVector(0, 0);
    desiredVel = new PVector(0, 0);
    steering = new PVector(0, 0);
    maxSpeed = maxSpd;
    maxVelocity = maxV;
    maxForce = maxF;
    mass = mss;
    prcptnRad = 200;
    sb = new SteeringBehavior();
    target = null;
  }

  void perceptionManager(ArrayList<Agent> agentList) {
    for (Agent toPercept : agentList) {
      if (toPercept == this) {
        continue;
      }
      if (PVector.dist(position, toPercept.position) < prcptnRad) {
        target = toPercept;
        return;
      }
    }
    target = null;
  }

  void decitionManager() {
    if (target != null) {
      if (target.mass < mass) {
        agentStates = AgentState.Seek;
      } else {
        agentStates = AgentState.Flee;
      }
    } else {
      agentStates = AgentState.Wander;
    }
  }

  void movementManager() {

    switch(agentStates) {
    case AgentState.None:
      break;
    case AgentState.Seek:
      sb.seek(target, agent.position);
      break;
    case AgentState.Flee:
      sb.flee(agent, target.position);
      break;
    case AgentState.Wander:
      sb.wander(agent);
      break;
      default;
      break;
    }
  }

  void display(color clr) {
    fill(clr);
    circle(position.x, position.y, mass);
    stroke(10);
    noFill();
    circle(position.x, position.y, prcptnRad*2);
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
