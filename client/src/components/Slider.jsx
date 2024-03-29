import React, { useState } from "react";
import "./styles.scss";
import slider1 from "../img/slider/1.jpg";
import slider2 from "../img/slider/2.jpg";
import slider3 from "../img/slider/3.jpg";
import { Link } from "react-router-dom";
import { motion } from "framer-motion";
function Slider() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const prevSlide = () => {
    setCurrentSlide(currentSlide > 0 ? currentSlide - 1 : 2);
  };
  const nextSlide = () => {
    setCurrentSlide(currentSlide < 2 ? currentSlide + 1 : 0);
  };

  return (
    <div className="slider">
      <div
        className="container"
        style={{ transform: `translateX(-${currentSlide * 100}vw)` }}
      >
        <img src={slider1} alt="" />
        <div className="info modal-1">
          <p>Welcome to persuasive paint</p>
          <p>
            The online shop that will transform your living space with its
            stunning collection of interior design essentials. Our wide variety
            of unique paintings, neon signs, clocks, mirrors, and wall stickers
            will elevate your home decor game to the next level.
          </p>
        </div>
        <img src={slider3} alt="" />
        <div className="info modal-2">
          <p>
            Having trouble deciding which products to buy or how they will look
            in your space? As a registered user, you now have the ability to
            upload a photo of your room wall and see how our products will look
            in your space.
          </p>
          <p>
            Experiment with different products and combinations until you find
            the perfect match for your home.{" "}
          </p>
          <motion.div whileHover={{ scale: 0.95 }}>
            <Link className="link slider-link" to="/preview/introduction">
              PREVIEW PRODUCTS
            </Link>
          </motion.div>
        </div>
        <img src={slider2} alt="" />
        <div className="info modal-3">
          <motion.div whileHover={{ scale: 0.95 }}>
            <Link
              to="https://github.com/redst3/eshop-ktu-ps"
              target={"_blank"}
              className="link slider-link"
            >
              GITHUB REPOSITORY{" "}
            </Link>
          </motion.div>
        </div>
      </div>
      <div className="slider-icons">
        <div className="slider-icon right" onClick={prevSlide}></div>
        <div className="slider-icon left" onClick={nextSlide}></div>
      </div>
    </div>
  );
}

export default Slider;
