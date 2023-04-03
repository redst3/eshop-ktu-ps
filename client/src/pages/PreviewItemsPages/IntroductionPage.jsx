import React, { useState, useEffect } from "react";
// import { motion } from "framer-motion";
import { useNavigate } from "react-router-dom";
import backgroundService from "../../services/BackgroundImageServices";
import "./zitempreview.scss";

export const IntroductionPage = () => {
  const navigate = useNavigate();
  const [loadedImage, setLoadedImage] = useState(false);
  useEffect(() => {
    var userId = JSON.parse(sessionStorage.getItem("user")).sub;
    async function fetchData() {
      await backgroundService.getBackgroundImage(userId).then(() => {
        setLoadedImage(true);
      });
    }
    fetchData(userId);
  }, [navigate]);
  const handleClick = () => {
    loadedImage
      ? navigate("/preview/preview-items")
      : navigate("/preview/upload");
  };
  return (
    <div className="introduction">
      <h1>Intro page</h1>
      <button onClick={handleClick}>Continue</button>
    </div>
  );
};
