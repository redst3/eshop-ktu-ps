import React, { useEffect } from "react";
import Categories from "../components/Categories";
import { FeaturedProducts } from "../components/FeaturedProducts";
import Slider from "../components/Slider";
import "./zpages.scss";

const Home = () => {
  useEffect(() => {
    if (sessionStorage.getItem("userchange")) {
      sessionStorage.removeItem("userchange");
      window.location.reload();
    }
  }, [sessionStorage.getItem("userchange")]);

  return (
    <div className="home">
      <Slider />
      <FeaturedProducts type="Featured" />
      <Categories />
      <FeaturedProducts type="Trending" />
    </div>
  );
};
export default Home;
