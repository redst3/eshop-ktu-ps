import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import "./styles.scss";
import { motion } from "framer-motion";

export const Card = ({ item }) => {
  const [label, setLabel] = useState(false);
  const image = item?.attributes?.img?.data[0]?.attributes?.url;
  const [collection, setCollection] = useState();
  useEffect(() => {
    if (item?.attributes?.new) {
      setCollection("New");
      setLabel(true);
      return;
    }
    if (item?.attributes?.type === "featured") {
      setCollection("Featured");
      setLabel(true);
      return;
    }
    if (item?.attributes?.type === "trending") {
      setCollection("Popular");
      setLabel(true);
      return;
    }
  }, [item]);

  return (
    <Link className="link" to={`/product/${item.id}`}>
      <motion.div className="card" whileHover={{ scale: 1.05 }}>
        <div className="image">
          {label && <span className={`tag ${collection}`}>{collection}</span>}
          {image === undefined ? (
            <div id="spin" className="spinner"></div>
          ) : (
            <img
              src={process.env.REACT_APP_IMG_URL + image}
              alt={item.id}
              className="firstImage"
            />
          )}
        </div>
        <h2>{item?.attributes?.title}</h2>
        <h3>
          {item?.attributes?.author !== null ? item?.attributes?.author : "-"}
        </h3>
        <div className="prices">
          {item?.attributes?.on_sale ? (
            <>
              <h3>{(item?.attributes?.price * 1.33).toFixed(2)} €</h3>
              <h3>{item?.attributes?.price} €</h3>
            </>
          ) : (
            <h4 className="normal">{item?.attributes?.price} €</h4>
          )}
        </div>
      </motion.div>
    </Link>
  );
};
