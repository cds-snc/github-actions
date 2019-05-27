"use strict";
import { requestScan } from "./lib";

export const handle = async url => {
  try {
    const result = await requestScan(url);

    if (!result) {
      return false;
    }

    return result;
  } catch (e) {
    console.log(e.message);
    return false;
  }
};
