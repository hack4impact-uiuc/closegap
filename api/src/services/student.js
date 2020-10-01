const db = require("../db");

const getStudentById = (id) => db.oneOrNone("SELECT * FROM students WHERE id = $1", [id]);

module.exports = {
  getStudentById,
};
