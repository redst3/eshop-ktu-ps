import React from "react";
import { Link } from "react-router-dom";
import "./styles.scss";
import { motion } from "framer-motion";

export const Card = ({ item }) => {
  return (
    <Link className="link" to={`/product/${item.id}`}>
      <motion.div className="card" whileHover={{ scale: 1.05 }}>
        <div className="image">
          {item?.attributes.new && <span>New</span>}
          <img
            src={
              process.env.REACT_APP_IMG_URL +
              item?.attributes.img.data[0].attributes.url
            }
            alt={item.id}
            className="firstImage"
          />
          <img
            src={
              process.env.REACT_APP_IMG_URL +
              (item?.attributes.img.data.length > 1
                ? item?.attributes.img.data[1].attributes.url
                : item?.attributes.img.data[0].attributes.url)
            }
            alt={item.id}
            className="secondImage"
          />
        </div>
        <h2>{item?.attributes.title}</h2>
        <h3>
          {item?.attributes.author !== null ? item?.attributes.author : "-"}
        </h3>
        <div className="prices">
          {item?.attributes.on_sale ? (
            <>
              <h3>{(item?.attributes.price * 1.33).toFixed(2)} €</h3>
              <h3>{item?.attributes.price} €</h3>
            </>
          ) : (
            <h4 className="normal">{item?.attributes.price} €</h4>
          )}
        </div>
      </motion.div>
    </Link>
  );
};
