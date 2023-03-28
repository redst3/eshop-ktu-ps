import React, { useState } from "react";
import "./styles.scss";

function Slider() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const data = [
    "https://media.architecturaldigest.com/photos/629f848b56ab5dc0e3622ee5/master/pass/Limewash%20cover.jpg",
    "https://media.architecturaldigest.com/photos/571e97c5741fcddb16b559c9/2:1/w_5127,h_2563,c_limit/modernist-decor-inspiration-01.jpg",
    "https://r4.wallpaperflare.com/wallpaper/128/588/887/interior-design-futuristic-tron-legacy-wallpaper-794068ada11a7d6b3677a84ff041b6ed.jpg",
  ];
  const prevSlide = () => {
    setCurrentSlide(currentSlide > 0 ? currentSlide - 1 : 2);
  };
  const nextSlide = () => {
    setCurrentSlide(currentSlide < data.length - 1 ? currentSlide + 1 : 0);
  };

  return (
    <div className="slider">
      <div
        className="container"
        style={{ transform: `translateX(-${currentSlide * 100}vw)` }}
      >
        <img src={data[0]} alt="0" />
        <div className="info modal-1" data-translate="100">
          aaa
        </div>
        <img src={data[1]} alt="1" />
        <div className="info modal-2">aaa</div>
        <img src={data[2]} alt="2" />
        <div className="info modal-3">aaa</div>
      </div>
      <div className="slider-icons">
        <div className="slider-icon" onClick={prevSlide}></div>
        <div className="slider-icon" onClick={nextSlide}></div>
      </div>
    </div>
  );
}

export default Slider;
