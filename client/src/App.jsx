import React from "react";
import HomeView from "./pages/HomeView";
import Navbar from "./components/Navbar";
import "./styles/App.css";

function App() {
  return (
    <div className="App">
      <Navbar />
      <HomeView />
    </div>
  );
}

export default App;
