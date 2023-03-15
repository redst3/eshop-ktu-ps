import React, { useEffect, useState } from "react";
import useFetch from "../../hooks/useFetch";
import "./authPages.scss";
import { useNavigate } from "react-router-dom";

export const WishlistPage = () => {
  const navigate = useNavigate();
  const [errors, setErrors] = useState(false);
  const { data } = useFetch(
    `/products?populate=*${
      sessionStorage.getItem("wishlist") === null
        ? ""
        : JSON.parse(sessionStorage.getItem("wishlist")).map(
            (item, index) => `&[filters][id][$in][${index}]=${item}`
          )
    }`
  );
  useEffect(() => {
    if (sessionStorage.getItem("wishlist") === null) {
      setErrors(true);
    } else if (JSON.parse(sessionStorage.getItem("wishlist")).length === 0) {
      setErrors(true);
    }
  }, []);
  return (
    <div className="wishlist-page">
      {errors ? (
        <h1>Something went wrong or wishlist is empty</h1>
      ) : (
        <>
          <div className="header">
            <h1>Here is your wishlist!</h1>
          </div>
          <div className="wishlist-container">
            <div className="wishlist-items">
              {data?.map((item, id) => (
                <div
                  className="wishlist-item"
                  key={id}
                  onClick={() => navigate(`../product/${item.id}`)}
                >
                  <div>
                    <img
                      src={
                        process.env.REACT_APP_IMG_URL +
                        item.attributes?.img?.data[0]?.attributes?.url
                      }
                      alt={item.id}
                    />
                  </div>
                  <div className="info">
                    <h1>{item.attributes?.title}</h1>
                    <h2>{item.attributes?.description}</h2>
                    <h3>{item.attributes?.author}</h3>
                    <div className="price">{item.attributes?.price} €</div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </>
      )}
    </div>
  );
};
