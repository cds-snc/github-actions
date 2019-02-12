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

    const result = await requestScan(url);

    if (!result) {
      return false;
    }

    return true;
  } catch (e) {
    console.log(e.message);
    return false;
  }
};
