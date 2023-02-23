import React, { useState } from "react";
import { useParams } from "react-router-dom";
import List from "../components/List";
import "./zpages.scss";
import { motion } from "framer-motion";

const Products = () => {
  const params = useParams();
  const categoryId = parseInt(params.id);
  const [maxPrice, setMaxPrice] = useState(100);
  const [sort, setSort] = useState("asc");
  console.log(params);
  return (
    <div className="products">
      <div className="left">
        <div className="filter">
          <h2>Product Categories</h2>
          <div className="inputItem">
            <input type="checkbox" id="1" value={1}></input>
            <label htmlFor="1">product 1</label>
          </div>
          <div className="inputItem">
            <input type="checkbox" id="2" value={2}></input>
            <label htmlFor="2">product 2</label>
          </div>
        </div>
        <div className="filter">
          <h2>Filter by price</h2>
          <span>0</span>
          <input
            type="range"
            min="0"
            max="100"
            onChange={(e) => setMaxPrice(e.target.value)}
          />
          <span>{maxPrice}</span>
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
      </div>
      <motion.div
        className="right"
        initial={{ x: "1000px" }}
        animate={{ x: 0 }}
        transition={{ duration: 2, stiffness: 100, type: "spring" }}
      >
        <img
          className="categoryImg"
          src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
          alt="categoryImg"
        ></img>
        <List categoryId={categoryId} maxPrice={maxPrice} sort={sort} />
      </motion.div>
    </div>
  );
};
export default Products;
