"use strict";
import { getFile, requestScan, validateDeployment } from "./lib";

const init = event => {
  const body = validateDeployment(event);
  return body;
};

export const handle = async path => {
  try {
    const data = await getFile(path);
    const event = JSON.parse(data);

    const body = init(event);
    const url = body.deployment.payload.web_url;
    const exitCode = await requestScan(url);

    if (exitCode != 0) {
      return false;
    } else {
      return true;
    }

  } catch (e) {
    console.log(e.message);
    return false;
  }
};