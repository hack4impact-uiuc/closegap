import axios from "axios";

const BASE_URL = "http://localhost:5000/";

export const getStudents = () => {
  /**
   * Returns all students
   * Returns GET_STUDENTS_FAIL upon failure
   */
  const requestString = `${BASE_URL}students`;

  return axios
    .get(requestString, {
      headers: {
        "Content-Type": "application/JSON",
      },
    })
    .catch((error) => error({ type: "GET_STUDENTS_FAIL", error }));
};
