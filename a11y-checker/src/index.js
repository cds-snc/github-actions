require = require("esm")(module); // eslint-disable-line no-global-assign
const handle = require("./payloadHandler").handle;
const path = require("path");

(async () => {
  const argv = require("minimist")(process.argv.slice(2));
  const { local } = argv;
  let filePath;
  if (local) {
    filePath = path.resolve(__dirname, "__mocks__/success.json");
  } else {
    filePath = process.env.GITHUB_EVENT_PATH;
  }
  if (await handle(filePath)) {
    console.log("Passed");
    process.exit(0);
  } else {
    console.log("Failed");
    process.exit(1);
  }
})();