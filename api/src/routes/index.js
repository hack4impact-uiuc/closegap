const express = require("express");
const router = express.Router();
const statusCodes = require("http-status-codes");

/* GET home page. */
router.get("/", function (req, res) {
  res.status(statusCodes.OK).send("Closegap!");
});

module.exports = router;
