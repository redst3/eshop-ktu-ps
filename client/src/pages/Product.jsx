import React, { useEffect, useState } from "react";
import "./zpages.scss";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import { motion } from "framer-motion";
import useFetch from "../hooks/useFetch";
import { useParams } from "react-router-dom";
import { useDispatch } from "react-redux";
import { addProductToCart } from "../services/reduceCart";
import wishServices from "../services/WishlistServices";
import { useNavigate } from "react-router-dom";
const Product = () => {
  const productId = parseInt(useParams().id);
  const [exists, setExists] = useState(false);
  const [wishlist, setWishlist] = useState([]);
  const { data, error, loading } = useFetch(
    `/products?populate=*&[filters][id][$eq]=${productId}`
  );
  const [selectedImage, setSelectedImage] = useState(0);
  const [quantity, setQuantity] = useState(1);
  const dispatchHook = useDispatch();
  const navigate = useNavigate();

  useEffect(() => {
    if (sessionStorage.getItem("wishlist")) {
      setWishlist(JSON.parse(sessionStorage.getItem("wishlist")));
      if (JSON.parse(sessionStorage.getItem("wishlist").includes(productId))) {
        setExists(true);
      }
    }
    window.scrollTo(0, 0);
  }, [productId]);

  const handleAddToWishlist = async () => {
    if (sessionStorage.getItem("wishlist")) {
      if (exists) {
        setExists(false);
        let newWishlist = wishlist.filter((item) => item !== productId);
        sessionStorage.setItem("wishlist", JSON.stringify(newWishlist));
        setWishlist(newWishlist);
        await wishServices.deleteFromWishList(
          JSON.parse(sessionStorage.getItem("user")).sub,
          productId
        );
      } else {
        setExists(true);
        let newWishlist = [...wishlist, productId];
        sessionStorage.setItem("wishlist", JSON.stringify(newWishlist));
        setWishlist(newWishlist);
        await wishServices.addToWishList(
          JSON.parse(sessionStorage.getItem("user")).sub,
          productId
        );
      }
    } else {
      navigate("/login");
    }
  };
  return (
    <div className="product">
      {loading ? (
        <div id="spin" className="spinner"></div>
      ) : error ? (
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
              <motion.button
                whileHover={{ scale: 0.95 }}
                onClick={() =>
                  quantity > 1
                    ? setQuantity(quantity - 1)
                    : setQuantity(quantity)
                }
              >
                -
              </motion.button>
              <span>{quantity}</span>
              <motion.button
                whileHover={{ scale: 0.95 }}
                onClick={() =>
                  quantity < 5
                    ? setQuantity(quantity + 1)
                    : setQuantity(quantity)
                }
              >
                +
              </motion.button>
            </div>
            <div className="add-to-cart">
              <motion.button
                whileHover={{ scale: 0.95 }}
                className="addTo"
                onClick={() =>
                  dispatchHook(
                    addProductToCart({
                      id: data[0]?.id,
                      title: data[0]?.attributes.title,
                      author: data[0]?.attributes.author,
                      price: data[0]?.attributes.price,
                      width: data[0]?.attributes.width,
                      height: data[0]?.attributes.height,
                      img:
                        process.env.REACT_APP_IMG_URL +
                        data[0]?.attributes.img.data[0].attributes.url,
                      quantity,
                    })
                  )
                }
              >
                <AddShoppingCartIcon /> ADD TO CART
              </motion.button>
            </div>
            <div className="links">
              {exists ? (
                <>
                  {" "}
                  <motion.div
                    className="item-exists"
                    whileHover={{ scale: 1.05 }}
                    onClick={handleAddToWishlist}
                  >
                    <FavoriteBorderIcon /> REMOVE FROM WISHLIST
                  </motion.div>
                </>
              ) : (
                <>
                  <motion.div
                    className="item"
                    whileHover={{ scale: 1.05 }}
                    onClick={handleAddToWishlist}
                  >
                    <FavoriteBorderIcon /> ADD TO WISHLIST
                  </motion.div>
                </>
              )}
            </div>
            <hr
              style={{
                color: "tealdark",
                height: 0.1,
                width: "100%",
              }}
            />
            <div className="info">
              <span>ABOUT</span>
              <span className="info-about">
                CATEGORY: {data[0]?.attributes.category.data.attributes.title}
              </span>
              <span className="info-about">
                SUB-CATEGORY:{" "}
                {data[0]?.attributes.sub_category.data.attributes.title}
              </span>
              <span className="info-about">
                WIDTH: {data[0]?.attributes.width} cm
              </span>
              <span className="info-about">
                HEIGHT: {data[0]?.attributes.height} cm
              </span>
            </div>
          </div>
        </>
      )}
    </div>
  );
};
export default Product;
