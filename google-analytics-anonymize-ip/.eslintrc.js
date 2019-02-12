module.exports = {
  extends: ["standard", "prettier"],
  env: {
    "jest/globals": true
  },
  parser: "babel-eslint",
  plugins: ["jest"],
  globals: {
    page: true,
    browser: true,
    context: true,
    jestPuppeteer: true
  }
};
