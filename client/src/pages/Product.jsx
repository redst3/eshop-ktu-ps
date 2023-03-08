import React, { useState } from "react";
import "./zpages.scss";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import BalanceIcon from "@mui/icons-material/Balance";
import { motion } from "framer-motion";
import useFetch from "../hooks/useFetch";
import { useParams } from "react-router-dom";
const Product = () => {
  const categoryId = parseInt(useParams().id);
  const { data, loading, error } = useFetch(
    `/products?populate=*&[filters][id][$eq]=${categoryId}`
  );
  const [selectedImage, setSelectedImage] = useState(0);
  const [quantity, setQuantity] = useState(1);
  var food = false;
  return (
    <div className="product">
      {data.length === 0 ? (
        <h1>Something went wrong....</h1>
      ) : (
        <>
          <div className="left">
            <div className="images">
              {data[0]?.attributes.img.data.map((image, id) => (
                <motion.img
                  whileHover={{ scale: 0.95 }}
                  src={process.env.REACT_APP_IMG_URL + image.attributes.url}
                  alt="product"
                  key={id}
                  onClick={() => setSelectedImage(id)}
                />
              ))}
            </div>
            <div className="mainImage">
              <img
                src={
                  process.env.REACT_APP_IMG_URL +
                  data[0]?.attributes.img.data[selectedImage].attributes.url
                }
                alt="product"
              />
            </div>
          </div>
          <div className="right">
            <h1>{data[0]?.attributes.title}</h1>
            <h5>{data[0]?.attributes.author}</h5>
            <span className="price">{data[0]?.attributes.price} €</span>
            <p>{data[0]?.attributes.description}</p>
            <div className="quantity">
              <button
                onClick={() =>
                  quantity > 1
                    ? setQuantity(quantity - 1)
                    : setQuantity(quantity)
                }
              >
                -
              </button>
              <span>{quantity}</span>
              <button
                onClick={() =>
                  quantity < 5
                    ? setQuantity(quantity + 1)
                    : setQuantity(quantity)
                }
              >
                +
              </button>
            </div>
            <div className="add-to-cart">
              <button className="addTo">
                <AddShoppingCartIcon /> ADD TO CART
              </button>
            </div>
            <div className="links">
              <div className="item">
                <FavoriteBorderIcon /> ADD TO WISHLIST
              </div>
              <div className="item">
                <BalanceIcon /> ADD TO COMPARE
              </div>
            </div>
            <hr
              style={{
                color: "tealdark",
                height: 0.1,
                width: "100%",
              }}
            />
            <div className="info">
              <span>About</span>
              <span className="info-about">
                Category: {data[0]?.attributes.category.data.attributes.title}
              </span>
              <span className="info-about">
                Sub-Category:{" "}
                {data[0]?.attributes.sub_category.data.attributes.title}
              </span>
            </div>
          </div>
        </>
      )}
    </div>
  );
};
export default Product;
