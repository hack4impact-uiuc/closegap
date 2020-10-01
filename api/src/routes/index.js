const express = require("express");
const router = express.Router();

const { getStudentById } = require("../services/student.js");


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
    return res.status(400).json({
      error: "database error",
    });
  }

  if (student === null) {
    return res.status(404).json({
      error: "no student found with given id",
    });
  }

  return res.json(200, {
    data: student
  });
});

module.exports = router;
