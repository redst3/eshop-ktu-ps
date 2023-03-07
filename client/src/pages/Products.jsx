import React, { useState } from "react";
import { useParams } from "react-router-dom";
import List from "../components/List";
import useFetch from "../hooks/useFetch";
import "./zpages.scss";

const Products = () => {
  const params = useParams();
  const categoryId = parseInt(params.id);
  const [maxPrice, setMaxPrice] = useState(100);
  const [sort, setSort] = useState("asc");
  const [selected, setSelected] = useState([]);
  const { data, loading, error } = useFetch(
    `/sub-categories?[filters][category][id][$eq]=${categoryId}`
  );
  const handleChange = (e) => {
    if (e.target.checked) {
      setSelected([...selected, e.target.value]);
    } else {
      setSelected(selected.filter((item) => item !== e.target.value));
    }
  };
  return (
    <div className="products">
      <div className="left">
        <div className="filter">
          <h2>Product Categories</h2>
          {data?.map((item) => (
            <div className="inputItem" key={item.id}>
              <input
                type="checkbox"
                id={item.id}
                value={item.id}
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
      <div className="right">
        <img
          className="categoryImg"
          src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
          alt="categoryImg"
        ></img>
        <List
          categoryId={categoryId}
          maxPrice={maxPrice}
          sort={sort}
          selectedSubCategories={selected}
        />
      </div>
    </div>
  );
};
export default Products;
