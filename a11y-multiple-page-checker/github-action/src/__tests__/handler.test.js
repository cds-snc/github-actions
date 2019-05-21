import { handle } from "../payloadHandler";
const path = require("path");

describe("handle", () => {
  process.env.GITHUB_WORKSPACE = path.resolve(__dirname, "../__mocks__/pass");
  const mockSuccessResponse = {"statuscode": 0};
  const mockFailResponse = {"statuscode": 1, "violations": ["violation 1", "violation 2"]}
  const mockFetchPromise = Promise.resolve({
    json: () => Promise.resolve(mockSuccessResponse)
  });
  const mockFetchPromiseFail = Promise.resolve({
    json: () => Promise.resolve(mockFailResponse)
  });
  jest.spyOn(global, 'fetch').mockImplementation((url) => (url.indexOf("fail_url") >= 0 ? mockFetchPromise : mockFetchPromiseFail));

  it("performs the correct number of fetch calls", async () => {
    process.env.GITHUB_WORKSPACE = path.resolve(__dirname, "../__mocks__/pass");
    const result = await handle(
      path.resolve(__dirname, "../__mocks__/success.json")
    );
    expect(global.fetch).toHaveBeenCalledTimes(2);
  });
  it("returns a failed message if one or more of the requests fails", async () => {
    process.env.GITHUB_WORKSPACE = path.resolve(__dirname, "../__mocks__/fail");
    const result = await handle(
      path.resolve(__dirname, "../__mocks__/success.json")
    );
  });
});