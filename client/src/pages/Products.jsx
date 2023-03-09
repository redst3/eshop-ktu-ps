import React, { useState } from "react";
import { Link, useParams } from "react-router-dom";
import List from "../components/List";
import useFetch from "../hooks/useFetch";
import "./zpages.scss";
import { motion } from "framer-motion";

const Products = () => {
  const categoryId = parseInt(useParams().id);
  const [maxPrice, setMaxPrice] = useState(1000);
  const [price, setPrice] = useState(1000);
  const [sort, setSort] = useState("asc");
  const [selected, setSelected] = useState([]);
  const { data, loading, error } = useFetch(
    `/sub-categories?[filters][category][id][$eq]=${categoryId}`
  );
  const categories = useFetch(`/categories?populate=*`);
  const handleChange = (e) => {
    if (e.target.checked) {
      setSelected([...selected, e.target.value]);
    } else {
      setSelected(selected.filter((item) => item !== e.target.value));
    }
  };
  return (
    <div className="products">
      {data.length === 0 ? (
        <h1>Something went wrong....</h1>
      ) : (
        <>
          <div className="left">
            <div className="filter">
              <h2> Secondary Categories</h2>
              {data?.map((item) => (
                <div className="inputItem" key={item.id}>
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
              <h2>Filter by price</h2>
              <span>0</span>
              <input
                type="range"
                min="0"
                max="1000"
                onChange={(e) => setMaxPrice(e.target.value)}
              />
              <span>{maxPrice}</span>
              <div className="filter">
                <button
                  className="priceButton"
                  onClick={() => {
                    setPrice(maxPrice);
                  }}
                >
                  filter
                </button>
              </div>
            </div>
            <div className="filter">
              <h2>Sort by</h2>
              <div className="inputItem">
                <input
                  type="radio"
                  id="asc"
                  value="asc"
                  name="price"
                  onChange={() => setSort("asc")}
                ></input>
                <label htmlFor="asc">Lowest first</label>
              </div>
              <div className="inputItem">
                <input
                  type="radio"
                  id="desc"
                  value="desc"
                  name="price"
                  onChange={() => setSort("desc")}
                ></input>
                <label htmlFor="desc">Highest first</label>
              </div>
            </div>
            <div className="filter">
              <h2>Browse more categories</h2>
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
                categories.data[categoryId - 1]?.attributes.img.data.attributes
                  .url
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
