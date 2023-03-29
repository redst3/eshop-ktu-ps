import React, { useEffect } from "react";
import "./styles.scss";
import { Card } from "./Card";
import useFetch from "../hooks/useFetch";

export const FeaturedProducts = ({ type }) => {
  useEffect(() => {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("visible");
        } else {
          entry.target.classList.remove("visible");
        }
      });
    });
    const hiddenCards = document.querySelectorAll(".bottom");
    hiddenCards.forEach((card) => {
      observer.observe(card);
    });
  }, []);
  const { data, loading, error } = useFetch(
    `products?populate=*&[filters][type][$eq]=${type}`
  );
  return (
    <div className="featuredProducts">
      <div className="top">
        <center>
          <h1>{type} Products</h1>
          <hr></hr>
        </center>
      </div>
      <div className="bottom">
        {error ? (
          "Something went wrong..."
        ) : loading ? (
          <div id="spin" className="spinner"></div>
        ) : (
          data.map((item) => <Card item={item} key={item.id} />)
        )}
      </div>
    </div>
  );
};
