import React, { useState } from "react";
import { motion } from "framer-motion";
import useFetch from "../hooks/useFetch";

export const Search = () => {
  const [keyword, setKeyword] = useState("");
  const { data } = useFetch(
    `/products?populate=*&[filters][title][$containsi]=${keyword}`
  );
  return (
    <div className="search-navbar s01hz">
      <div className="search-container s01hz">
        <input
          className="search-input s01hz"
          placeholder="search..."
          value={keyword}
          onChange={(e) => setKeyword(e.target.value)}
        ></input>
        {keyword !== "" && (
          <span className="search-results">Search results: {data?.length}</span>
        )}
        <div className="cart-items s01hz">
          {keyword !== "" &&
            (data?.length > 0 ? (
              data?.map((item) => (
                <motion.div
                  whileHover={{ scale: 0.95 }}
                  className="item s01hz"
                  key={item.id}
                  onClick={() => console.log(item)}
                >
                  <img
                    src={
                      process.env.REACT_APP_IMG_URL +
                      item.attributes.img.data[0].attributes.url
                    }
                    alt={item.id}
                  />
                  <div className="info s01hz">
                    <h1>{item.attributes.title}</h1>
                    <h1 className="author s01hz">
                      {item.attributes.author ? item.attributes.author : "-"}
                    </h1>
                    <div className="price s01hz">
                      {item.attributes.price} €
                      <span className="measurements s01hz">{`${item.attributes?.width} cm x ${item.attributes?.height} cm  `}</span>
                    </div>
                  </div>
                </motion.div>
              ))
            ) : (
              <div className="item s01hz">
                <h2 className="search-notfound s01hz">Nothing was found!</h2>
              </div>
            ))}
        </div>
      </div>
    </div>
  );
};
