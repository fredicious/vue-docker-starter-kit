module.exports = {
  preset: "@vue/cli-plugin-unit-jest",
  roots: ["src", "tests"],
  testMatch: ["**/__tests__/**/*.[jt]s?(x)", "**/?(*.)+(spec|test).[jt]s?(x)"],
  collectCoverage: true,
  coverageDirectory: "coverage",
  collectCoverageFrom: [
    "src/**/*.{js,vue}",
    "!**/node_modules/**",
    "!src/**/*.spec.js",
  ],
};
