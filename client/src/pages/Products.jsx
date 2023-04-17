import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import List from "../components/List";
import useFetch from "../hooks/useFetch";
import "./zpages.scss";
import { motion } from "framer-motion";
import KeyboardDoubleArrowRightIcon from "@mui/icons-material/KeyboardDoubleArrowRight";
import KeyboardDoubleArrowLeftIcon from "@mui/icons-material/KeyboardDoubleArrowLeft";

const Products = () => {
  const categoryId = parseInt(useParams().id);
  const [maxPrice, setMaxPrice] = useState(1000);
  const [price, setPrice] = useState(500);
  const [sort, setSort] = useState("asc");
  const [selected, setSelected] = useState([]);
  const [show, setShow] = useState("hide");
  const [button, setButton] = useState("hide-button");
  const [placeholder, setPlaceholder] = useState("");
  const { data, loading } = useFetch(
    `/sub-categories?[filters][category][id][$eq]=${categoryId}`
  );
  const categories = useFetch(`/categories?populate=*`);

  const category = categories.data?.find((item) => item.id === categoryId);

  const handleChange = (e) => {
    if (e.target.checked) {
      setSelected([...selected, e.target.value]);
    } else {
      setSelected(selected.filter((item) => item !== e.target.value));
    }
  };
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
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  return (
    <div className="products">
      {loading ? (
        <div id="spin" className="spinner"></div>
      ) : data.length === 0 ? (
        <h1>
          Are you sure this category exists?
          <br />
          <center>
            <Link to="/products">Go back</Link>
          </center>
        </h1>
      ) : (
        <>
          <div className={placeholder} onClick={handleButton}></div>

          <div className="left-navbar">
            <div
              className={`left-navbar-arrow ${button}`}
              onClick={handleButton}
            >
              {button === "hide-button" ? (
                <KeyboardDoubleArrowRightIcon />
              ) : (
                <KeyboardDoubleArrowLeftIcon />
              )}
            </div>
            <div className={`left-navbar-open ${show}`}>
              <div className="filter">
                <h2> SECONDARY CATEGORIES</h2>
                {data?.map((item) => (
                  <div
                    className="inputItem"
                    key={item.id}
                    style={{ textTransform: "uppercase" }}
                  >
                    <input
                      type="checkbox"
                      id={item.id}
                      value={item.id}
                      key={item.id}
                      defaultChecked
                      onChange={handleChange}
                    ></input>
                    <label htmlFor={item.id}>{item.attributes.title}</label>
                  </div>
                ))}
              </div>
              <div className="filter">
                <h2>FILTER BY PRICE</h2>
                <span>0</span>
                <input
                  type="range"
                  min="0"
                  value={maxPrice}
                  max="1000"
                  onChange={(e) => setMaxPrice(e.target.value)}
                />
                <span>{maxPrice}</span>
                <div className="filter">
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
                    onClick={handleButton}
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
          <div className="left">
            <div className="filter">
              <h2> SECONDARY CATEGORIES</h2>
              {data?.map((item) => (
                <div
                  className="inputItem"
                  key={item.id}
                  style={{ textTransform: "uppercase" }}
                >
                  <input
                    type="checkbox"
                    id={item.id}
                    value={item.id}
                    key={item.id}
                    onChange={handleChange}
                  ></input>
                  <label htmlFor={item.id}>{item.attributes.title}</label>
                </div>
              ))}
            </div>
            <div className="filter">
              <h2>FILTER BY PRICE</h2>
              <span>0</span>
              <input
                type="range"
                min="0"
                value={maxPrice}
                max="1000"
                onChange={(e) => setMaxPrice(e.target.value)}
              />
              <span>{maxPrice}</span>
              <div className="filter">
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
          <div className="right">
            <img
              className="categoryImg"
              src={
                process.env.REACT_APP_IMG_URL +
                category?.attributes.img.data.attributes.url
              }
              alt=" "
            ></img>
            <List
              categoryId={categoryId}
              maxPrice={price}
              sort={sort}
              selectedSubCategories={selected}
            />
          </div>
        </>
      )}
    </div>
  );
};
export default Products;
