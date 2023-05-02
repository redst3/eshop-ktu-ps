import React from "react";
import "./styles.scss";
import { Card } from "./Card";
import useFetch from "../hooks/useFetch";

export const FeaturedProducts = ({ type }) => {
  const { data, loading, error } = useFetch(
    `products?populate=*&[filters][type][$eq]=${type}`
  );
  return (
    <div className="featuredProducts">
      <div className="top">
        <center>
          <h1>Most sold products</h1>
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
