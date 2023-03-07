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
        <h1>{type} Products</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent
          sollicitudin urna vitae urna commodo porttitor. Praesent consequat
          accumsan eros, et ullamcorper magna ullamcorper malesuada. Morbi
          dignissim porta lacinia. In convallis at urna at finibus. Mauris
          dignissim tortor ac nunc condimentum, vestibulum feugiat quam
          efficitur. Donec neque es
        </p>
      </div>
      <div className="bottom">
        {error
          ? "Error occured"
          : loading
          ? "Loading"
          : data.map((item) => <Card item={item} key={item.id} />)}
      </div>
    </div>
  );
};
