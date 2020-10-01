import React from "react";
import Home from "./pages/HomeView";
import Navbar from "./components/Navbar";
import "./styles/App.css";

function App() {
  return (
    <div className="App">
      <Navbar />
      <Home />
    </div>
  );
}

export default App;
