import { handle } from "../payloadHandler";
import { requestScan } from "../lib/requestScan";
const path = require("path");

jest.mock("../lib/requestScan", () => ({
  requestScan: jest.fn(url => {
    if (url === "fail_url") {
      return false;
    } else {
      return true;
    }
  })
}));

describe("handle", () => {
  it("returns a passed message if the check passes", async () => {
    const result = await handle(
      path.resolve(__dirname, "../__mocks__/success.json")
    );
    expect(requestScan).toHaveBeenCalledTimes(1);
    expect(result).toEqual(true);
  });

  it("returns a passed message if the check fails", async () => {
    const result = await handle("fail_url");
    expect(result).toEqual(false);
  });
});