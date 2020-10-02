import React from "react";
import Navbar from "../Navbar";

const Head = ({ isLoggedIn, name }) => {
  return <Navbar isLoggedIn={isLoggedIn} name={name} />;
};

export default Head;
