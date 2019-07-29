"use strict";
import { getFile, validateDeployment } from "./lib";
import "isomorphic-fetch";

const statusPass = 0;
const statusNeutral = 78;
const statusFail = 1;

const init = event => {
  const body = validateDeployment(event);
  return body;
};

export const handle = async path => {
  try {
    const data = await getFile(path);
    const event = JSON.parse(data);

    const body = init(event);
    const baseUrl =
      "https://axe-distributed-action-hanuv4jn2q-uc.a.run.app/?url=" +
      body.deployment.payload.web_url;

    // get config file
    const config = await getFile(process.env.GITHUB_WORKSPACE + "/a11y.json");
    const visit = JSON.parse(config).urls;
    console.log("visit:" + visit);

    // iterate through urls in config and send out async requests for each one
    // wait for all to return, and return results
    const results = await Promise.all(
      visit.map(page => {
        console.log("Fetching from: " + baseUrl + page);
        return fetch(baseUrl + page)
          .then(function(response) {
            return response.json();
          })
          .then(function(data) {
            return { page: page, data: data };
          })
          .catch(err => {
            throw new Error("Error: " + JSON.stringify(err));
          });
      })
    );
    let issues = [];
    results.map(result => {
      let data = result.data;
      if (data && data.violations && data.violations.length >= 1) {
        console.log(
          "Violations on page: /" + result.page + ": " + data.violations.length
        );
        data.violations.forEach(v => {
          console.log("- " + JSON.stringify(v));
        });
        issues.push(data.violations);
      }
    });

    if (issues.length >= 1) {
      const count = issues.length;
      console.log(`Found ${count} page(s) with issues`);
      return statusFail;
    } else {
      console.log("Passed with 0 violations");
      return statusPass;
    }
  } catch (e) {
    console.log(e.message);
    return statusNeutral;
  }
};
