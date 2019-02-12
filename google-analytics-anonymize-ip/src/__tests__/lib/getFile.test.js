import { getFile } from "../../lib/getFile";

describe("getFile", () => {
  it("returns the contents of a file", async () => {
    const buf = await getFile("src/__mocks__/success.json");
    expect(JSON.parse(buf).length).not.toEqual(0);
  });

  it("throws an error if the file does not exist", async () => {
    try {
      await getFile("src/__mocks__/bad.json");
    } catch (e) {
      expect(e);
    }
  });
});
