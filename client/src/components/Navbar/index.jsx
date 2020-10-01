import React, { useState } from "react";
import AppBar from "@material-ui/core/AppBar";
import PermIdentityIcon from "@material-ui/icons/PermIdentityOutlined";
import Toolbar from "@material-ui/core/Toolbar";
import "../../styles/Navbar.css";

const LoginLink = () => {
  return (
    <a id="nav-login" href="#login">
      Login
    </a>
  );
};

const LogoutLink = () => {
  return (
    <a id="nav-logout" href="#logout">
      Logout
    </a>
  );
};

const ProfileLink = () => {
  const [name, setName] = useState("Person");
  return (
    <div id="nav-profile">
      <PermIdentityIcon id="nav-profile-icon" />
      <a id="nav-profile-link" href="#profile">
        Hi {name}
      </a>
    </div>
  );
};

const Navbar = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  let loginOptions;

  loginOptions = isLoggedIn ? (
    <div class="right-nav">
      <ProfileLink />
      <LogoutLink />
    </div>
  ) : (
    <LoginLink />
  );

  return (
    <div>
      <AppBar>
        <Toolbar classes={{ root: "nav" }}>
          <img id="nav-logo" src="/imgs/logo-white.png" alt="Closegap Logo" />
          {loginOptions}
        </Toolbar>
      </AppBar>
    </div>
  );
};

export default Navbar;
