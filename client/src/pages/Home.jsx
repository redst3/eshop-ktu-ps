import React from "react";
import { FeaturedProducts } from "../components/FeaturedProducts";
import Slider from "../components/Slider";
import "./zpages.scss";

const Home = () => {
  return (
    <div className="home">
      <Slider />
      <FeaturedProducts type="Featured" />
      <FeaturedProducts type="Trending" />
    </div>
  );
};
export default Home;
