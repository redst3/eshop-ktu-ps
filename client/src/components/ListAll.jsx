import React, { useEffect } from "react";
import { Card } from "./Card";
import "./styles.scss";
import useFetch from "../hooks/useFetch";
import { useState } from "react";

const List = ({ maxPrice, sort, keyword }) => {
  const [sortOrder, setSortOrder] = useState("");
  useEffect(() => {
    if (sort !== "random") {
      setSortOrder(`&sort=price:${sort}`);
    }
  }, [sort]);

  const { data, loading } = useFetch(
    `/products?populate=*&[filters][price][$lte]=${maxPrice}${sortOrder}`
  );
  const [searchProducts, setSearchProducts] = useState([]);

  useEffect(() => {
    if (keyword !== "") {
      const results = data?.filter((product) =>
        product.attributes.title.toLowerCase().includes(keyword)
      );
      setSearchProducts(results);
    } else {
      setSearchProducts(data);
    }
  }, [keyword, data]);

  return (
    <div className="listCards">
      {loading ? (
        <div id="spin" className="spinner"></div>
      ) : (
        searchProducts.map((item) => <Card item={item} key={item.id} />)
      )}
    </div>
  );
};
export default List;
