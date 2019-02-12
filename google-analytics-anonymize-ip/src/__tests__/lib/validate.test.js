import { validateDeployment } from "../../lib/validate";

const payload = {
  body: {
    deployment_status: { state: "foo" },
    deployment: { sha: "bar", payload: "biz" }
  }
};

describe("validateDeployment", () => {
  it("returns the body if it has all the required elements of the payload", () => {
    expect(validateDeployment(payload)).toEqual(payload["body"]);
  });

  it("returns error if the payload has no body key", () => {
    expect(() => validateDeployment({})).toThrow();
  });

  it("returns error if the payload has no deployment", () => {
    let copy = { ...payload };
    delete copy.body.deployment;
    expect(() => validateDeployment(copy)).toThrow();
  });

  it("returns error if the payload has no deployment_status", () => {
    let copy = { ...payload };
    delete copy.body.deployment_status;
    expect(() => validateDeployment(copy)).toThrow();
  });
});
