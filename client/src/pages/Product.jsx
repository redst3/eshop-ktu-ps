import React, { useState } from "react";
import "./zpages.scss";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import BalanceIcon from "@mui/icons-material/Balance";

const Product = () => {
  const [selectedImage, setSelectedImage] = useState(0);
  const [quantity, setQuantity] = useState(1);
  const images = [
    "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  return (
    <div className="product">
      <div className="left">
        <div className="images">
          {images.map((image, id) => (
            <img
              src={image}
              alt="product"
              key={id}
              onClick={() => setSelectedImage(id)}
            />
          ))}
        </div>
        <div className="mainImage">
          <img src={images[selectedImage]} alt="product" />
        </div>
      </div>
      <div className="right">
        <h1>Product1</h1>
        <span className="price">100 eur</span>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
          culpa qui officia deserunt mollit anim id est laborum.
        </p>
        <div className="quantity">
          <button
            onClick={() =>
              quantity > 1 ? setQuantity(quantity - 1) : setQuantity(quantity)
            }
          >
            -
          </button>
          <span>{quantity}</span>
          <button
            onClick={() =>
              quantity < 5 ? setQuantity(quantity + 1) : setQuantity(quantity)
            }
          >
            +
          </button>
        </div>
        <div className="cart">
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
          <span className="info-about">Category: {"food"}</span>
        </div>
      </div>
    </div>
  );
};
export default Product;
