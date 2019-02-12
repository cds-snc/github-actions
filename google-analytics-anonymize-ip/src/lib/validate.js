const parse = event => {
  const body = event.body;
  return { body };
};

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
  const { body } = parse(event);
  if (!hasState(body)) {
    return false;
  }
  return body;
};
