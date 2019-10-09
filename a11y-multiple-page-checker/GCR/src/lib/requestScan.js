const { AxePuppeteer } = require('axe-puppeteer');
const puppeteer = require('puppeteer');

export const requestScan = async (url, useGlobalPuppeteer = false) => {
  try {
    const browser = !useGlobalPuppeteer
      ? await puppeteer.launch({
          args: ["--no-sandbox", "--disable-setuid-sandbox"]
        })
      : useGlobalPuppeteer.browser;

    const page = !useGlobalPuppeteer
      ? await browser.newPage()
      : useGlobalPuppeteer.page;

    await page.setBypassCSP(true);

    await page.goto(url);

    const results = await new AxePuppeteer(page).analyze();

    await page.close();
    await browser.close();

    if (results.violations.length > 0) {
      //console.log("Failure: " + results.violations.length + " violations:");
      //console.log(results.violations);
      return {statusCode: 1, violations: results.violations}; //failure
    } else {
      //console.log("Passed with 0 violations");
      return {statusCode: 0, violations: []}; //success
    }
  } catch (e) {
    console.log("something happened");
    console.log(e.message);
    return false;
  }
};