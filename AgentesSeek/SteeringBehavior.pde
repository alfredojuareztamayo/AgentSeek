public class SteeringBehavior {


  PVector seek(Agent agent, PVector targetPos)
  {
    PVector desiredVel = PVector.sub(targetPos, agent.position);
    desiredVel.normalize();
    desiredVel.mult(agent.maxVelocity  );
    PVector steering = PVector.sub(desiredVel, agent.currentVel);
    steering.limit(agent.maxForce);
    steering.div(agent.mass);
    return steering;
  }

  PVector flee(Agent agent, PVector targetPos)
  {
    //a PVector targetTmp = PVector.mult(targetPos, -1);
    return PVector.mult(seek(agent, targetPos), -1);
  }

  PVector wander(Agent agent) {
    PVector desiredVel = new PVector(agent.currentVel.x, agent.currentVel.y);
    desiredVel.normalize();
    desiredVel.mult(80);
    desiredVel.add(agent.position);
    PVector randomWheel = new PVector(random(-1, 1), random(-1, 1));
    randomWheel.normalize();
    randomWheel.mult(40);
    randomWheel.add(desiredVel);
    return randomWheel;
  }
  void applyForce(Agent agent, PVector steering)
  {
    agent.currentVel.add(steering);
    agent.currentVel.limit(agent.maxSpeed);
    agent.position.add(agent.currentVel);
  }
}//end Class SteeringBehavior
