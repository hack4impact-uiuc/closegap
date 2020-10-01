const request = require("supertest");
const app = require("../src/app");
const statusCodes = require("http-status-codes");

describe("Get Endpoints", () => {
  it("should get our project name", async () => {
    const res = await request(app).get("/api");
    expect(res.statusCode).toEqual(statusCodes.OK);
    expect(res.text).toEqual("Closegap!");
  });
});
