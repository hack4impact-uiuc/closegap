const db = require("../db");

const getStudentById = async (id) => {
  return db.oneOrNone("SELECT * FROM students WHERE id = $1", [id]);
};

module.exports = {
  getStudentById,
};
