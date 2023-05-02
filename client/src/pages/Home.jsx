import React, { useEffect } from "react";
import Categories from "../components/Categories";
import { FeaturedProducts } from "../components/FeaturedProducts";
import Slider from "../components/Slider";
import "./zpages.scss";

const Home = () => {
  var change = sessionStorage.getItem("userchange");
  useEffect(() => {
    if (sessionStorage.getItem("userchange")) {
      sessionStorage.removeItem("userchange");
      window.location.reload();
    }
  }, [change]);

  return (
    <div className="home">
      <Slider />
      <FeaturedProducts type="Trending" />
      <center>
        <h1>BROWSE CATEGORIES</h1>
        <hr></hr>
      </center>
      <Categories />
    </div>
  );
};
export default Home;
