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
    `/products?populate=*&[filters][price][$lte]=${maxPrice}${sortOrder}&[filters][title][$containsi]=${keyword}`
  );

  return (
    <div className="listCards">
      {loading ? (
        <div id="spin" className="spinner"></div>
      ) : (
        data.map((item) => <Card item={item} key={item.id} />)
      )}
    </div>
  );
};
export default List;
