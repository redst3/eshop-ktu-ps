import React, { useState } from "react";
import { Link } from "react-router-dom";
import ListAll from "../components/ListAll";
import useFetch from "../hooks/useFetch";
import "./zpages.scss";
import { motion } from "framer-motion";
import KeyboardDoubleArrowRightIcon from "@mui/icons-material/KeyboardDoubleArrowRight";
import KeyboardDoubleArrowLeftIcon from "@mui/icons-material/KeyboardDoubleArrowLeft";

const AllProducts = () => {
  const [maxPrice, setMaxPrice] = useState(1000);
  const [keyword, setKeyword] = useState("");
  const [price, setPrice] = useState(500);
  const [sort, setSort] = useState("random");
  const [show, setShow] = useState("hide");
  const [button, setButton] = useState("hide-button");
  const [placeholder, setPlaceholder] = useState("");
  const categories = useFetch(`/categories?populate=*`);
  const handleButton = () => {
    if (show === "hide") {
      setShow("show");
      setButton("show-button");
      setPlaceholder("mobile-navbar-placeholder");
    } else {
      setShow("hide");
      setButton("hide-button");
      setPlaceholder("");
    }
  };
  return (
    <div className="products">
      <>
        <div className={placeholder} onClick={handleButton}></div>
        <div className="left-navbar">
          <div className={`left-navbar-arrow ${button}`} onClick={handleButton}>
            {button === "hide-button" ? (
              <KeyboardDoubleArrowRightIcon />
            ) : (
              <KeyboardDoubleArrowLeftIcon />
            )}
          </div>
          <div className={`left-navbar-open ${show}`}>
            <div className="filter">
              <h2> SEARCH</h2>
              <input
                className="search"
                type="text"
                value={keyword}
                onChange={(e) => setKeyword(e.target.value)}
              ></input>
            </div>
            <div className="filter">
              <h2>FILTER BY PRICE</h2>
              <span>0</span>
              <input
                type="range"
                min="0"
                value={maxPrice}
                max="500"
                onChange={(e) => setMaxPrice(e.target.value)}
              />
              <span>{maxPrice}</span>
              <div className="filter-price-button">
                <motion.button
                  whileHover={{ scale: 0.95 }}
                  className="priceButton"
                  onClick={() => {
                    setPrice(maxPrice);
                  }}
                >
                  FILTER
                </motion.button>
              </div>
            </div>
            <div className="filter">
              <h2>SORT BY</h2>
              <div className="inputItem">
                <input
                  type="radio"
                  id="asc"
                  value="asc"
                  name="price"
                  onChange={() => setSort("asc")}
                ></input>
                <label htmlFor="asc">LOWEST FIRST</label>
              </div>
              <div className="inputItem">
                <input
                  type="radio"
                  id="desc"
                  value="desc"
                  name="price"
                  onChange={() => setSort("desc")}
                ></input>
                <label htmlFor="desc">HIGHEST FIRST</label>
              </div>
            </div>
            <div className="filter" style={{ textTransform: "uppercase" }}>
              <h2>CATEGORIES</h2>
              {categories.data?.map((item) => (
                <Link
                  className="link"
                  key={item.id}
                  to={`../products/${item.id}`}
                >
                  <motion.div
                    className="category"
                    key={item.id}
                    whileHover={{ scale: 1.1 }}
                  >
                    {item.attributes.title + "s"}
                  </motion.div>
                </Link>
              ))}
            </div>
          </div>
        </div>
        <div className="right">
          <h1>ALL AVAILABLE PRODUCTS</h1>
          <ListAll maxPrice={price} sort={sort} keyword={keyword} />
        </div>
      </>
    </div>
  );
};
export default AllProducts;
