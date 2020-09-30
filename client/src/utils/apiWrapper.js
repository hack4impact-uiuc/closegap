import axios from "axios";

const BASE_URL = "http://localhost:5000/";
const BASE_URL_TEST = "https://swapi.dev/api/"; // URL for Sample API

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
    .catch((error) =>
      error({
        type: "GET_STUDENTS_FAIL",
        error,
      })
    );
};

// Sample API Wrapper
export const getPeople = () => {
  /**
   * Returns all people
   * Returns GET_PEOPLE_FAIL upon failure
   */
  const requestString = `${BASE_URL_TEST}people`;

  return axios
    .get(requestString, {
      headers: {
        "Content-Type": "application/JSON",
      },
    })
    .catch((error) =>
      error({
        type: "GET_PEOPLE_FAIL",
        error,
      })
    );
};
