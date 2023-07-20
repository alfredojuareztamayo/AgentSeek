public class SteeringBehavior {


  void seek(Agent agent, Agent target) {

    agent.desiredVel = PVector.sub(target.position, agent.position );
    agent.desiredVel.normalize();
    agent.desiredVel.mult(agent.maxVelocity);
    agent.steering = PVector.sub(agent.desiredVel, agent.currentVel);
    agent.steering.limit(agent.maxForce);
    agent.steering.div(agent.mass);
    agent.currentVel.add(agent.steering);
    agent.currentVel.limit(agent.maxSpeed);
    agent.position.add(agent.currentVel);
  }
  void flee(Agent agent, Agent target) {
    seek(target, agent);
  }
}//end Class SteeringBehavior
