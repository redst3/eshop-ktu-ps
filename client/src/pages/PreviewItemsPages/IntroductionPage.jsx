import React from "react";
// import { motion } from "framer-motion";
import { useNavigate } from "react-router-dom";
import "./zitempreview.scss";

export const IntroductionPage = () => {
  const navigate = useNavigate();
  const handleClick = () => {
    navigate("/preview/upload");
  };
  return (
    <div className="introduction">
      <h1>Intro page</h1>
      <button onClick={handleClick}>Continue</button>
    </div>
  );
};
