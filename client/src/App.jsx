import React from "react";
import Home from "./pages/HomeView";
import { Head } from "./components";
import "./styles/App.css";

function App() {
  let name = "Person";
  let isLoggedIn = false;
  return (
    <div className="App">
      <Head name={name} isLoggedIn={isLoggedIn} />
      <Home />
    </div>
  );
}

export default App;
