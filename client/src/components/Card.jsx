import React from "react";
import { Link } from "react-router-dom";
import "./styles.scss";

export const Card = ({ item }) => {
  return (
    <Link className="link" to={`/product/${item.id}`}>
      <div className="card">
        <div className="image">
          {item.isNew && <span>New</span>}
          <img src={item.img} alt={item.id} className="firstImage" />
          <img src={item.img2} alt={item.id} className="secondImage" />
        </div>
        <h2>{item.title}</h2>
        <h3>{item.author}</h3>
        <div className="prices">
          <h3>{item.oldPrice} €</h3>
          <h3>{item.newPrice} €</h3>
        </div>
      </div>
    </Link>
  );
};
