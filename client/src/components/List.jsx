import React from "react";
import { Card } from "./Card";
import "./styles.scss";
import useFetch from "../hooks/useFetch";

const List = ({ categoryId, maxPrice, sort, selectedSubCategories }) => {
  const { data, loading } = useFetch(
    `/products?populate=*&[filters][category][id]=${categoryId}
    ${selectedSubCategories.map(
      (item) => `&[filters][sub_category][id][$eq]=${item}`
    )}&[filters][price][$lte]=${maxPrice}&sort=price:${sort}`
  );
  return (
    <div className="listCards">
      {loading ? (
        <div id="spin" className="spinner"></div>
      ) : (
        data?.map((item) => <Card item={item} key={item.id} />)
      )}
    </div>
  );
};
export default List;
