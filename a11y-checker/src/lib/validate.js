const hasState = body => {
  if (!body || !body.deployment_status || !body.deployment_status.state) {
    throw new Error("Invalid event deployment_status data");
  }

  if (!body.deployment || !body.deployment.sha || !body.deployment.payload) {
    throw new Error("Invalid event deployment data");
  }

  return true;
};

export const validateDeployment = event => {
  if (!hasState(event)) {
    return false;
  }
  return event;
};