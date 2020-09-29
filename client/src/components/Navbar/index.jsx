import React from "react";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import "./styles.css";

const Navbar = () => {
  return (
    <div>
      <AppBar>
        <Toolbar classes={{ root: "nav" }}>
          <img id="nav-logo" src="/imgs/logo-white.png" alt="Closegap Logo" />
        </Toolbar>
      </AppBar>
    </div>
  );
};

export default Navbar;
