import { requestScan } from "../../lib/requestScan";
import { RequestInterceptor, ResponseFaker } from "puppeteer-request-spy";

import { getFile } from "../../lib/getFile";
import path from "path";

const matcher = (testee, keyword) => {
  return testee.indexOf(keyword) > -1;
};

it("Returns false when html fails axe tests", async () => {
  const domain = "https://www.example.org";
  const htmlPath = path.resolve(__dirname, "../../__mocks__/fail.html");
  const fileResult = await getFile(htmlPath);
  const htmlResponseFaker = new ResponseFaker(domain, {
    status: 200,
    contentType: "text/html",
    body: fileResult.toString("utf8")
  });

  const requestInterceptor = new RequestInterceptor(matcher);
  requestInterceptor.addFaker(htmlResponseFaker);
  page.setRequestInterception(true);
  page.on("request", requestInterceptor.intercept.bind(requestInterceptor));

  const result = await requestScan(domain, {
    browser,
    page
  });

  expect(result).not.toEqual(0);
});