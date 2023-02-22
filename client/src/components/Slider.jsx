import React, { useState } from "react";
import ArrowLeftIcon from "@mui/icons-material/ArrowLeft";
import ArrowRightIcon from "@mui/icons-material/ArrowRight";
import "./styles.scss";

function Slider() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const data = [
    "https://images.unsplash.com/photo-1613336026275-d6d473084e85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    "https://plus.unsplash.com/premium_photo-1666900440561-94dcb6865554?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80",
    "https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
  ];
  const prevSlide = () => {
    setCurrentSlide(currentSlide > 0 ? currentSlide - 1 : 2);
    console.log(currentSlide);
  };
  const nextSlide = () => {
    setCurrentSlide(currentSlide < data.length - 1 ? currentSlide + 1 : 0);
    console.log(currentSlide);
  };

  return (
    <div className="slider">
      <div
        className="container"
        style={{ transform: `translateX(-${currentSlide * 100}vw)` }}
      >
        <img src={data[0]} alt="0" />
        <img src={data[1]} alt="1" />
        <img src={data[2]} alt="2" />
      </div>
      <div className="slider-icons">
        <div className="slider-icon" onClick={prevSlide}>
          <ArrowLeftIcon />
        </div>
        <div className="slider-icon" onClick={nextSlide}>
          <ArrowRightIcon />
        </div>
      </div>
    </div>
  );
}

export default Slider;
