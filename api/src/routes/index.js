const express = require("express");
const { StatusCodes } = require("http-status-codes");

const { getStudentById } = require("../services/student.js");

const router = express.Router();

/* GET home page. */
router.get("/", function (req, res) {
  res.send("Closegap!");
});

/* GET for testing db. */
router.get("/students/:studentId", async (req, res) => {
  let student;

  try {
    student = await getStudentById(parseInt(req.params.studentId));
  } catch (e) {
    return res.status(StatusCodes.BAD_REQUEST).json({
      error: "database error",
    });
  }

  if (student === null) {
    return res.status(StatusCodes.NOT_FOUND).json({
      error: "no student found with given id",
    });
  }

  return res.json({
    data: student,
  });
});

module.exports = router;
