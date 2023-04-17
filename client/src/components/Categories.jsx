import React from "react";
import { Link } from "react-router-dom";
import "./styles.scss";
import { motion } from "framer-motion";
import useFetch from "../hooks/useFetch";

function Categories() {
  const categories = useFetch(`/categories?populate=*`);
  return (
    <div className="categories">
      <div className="col">
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link" to={`/products/${categories?.data[3]?.id}`}>
            <img
              src={
                process.env.REACT_APP_IMG_URL +
                categories?.data[3]?.attributes?.img?.data?.attributes?.url
              }
              alt=""
            />
            <span>Clocks</span>
          </Link>
        </motion.div>
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link" to={`/products/${categories?.data[1]?.id}`}>
            <img
              src={
                process.env.REACT_APP_IMG_URL +
                categories?.data[1]?.attributes?.img?.data?.attributes?.url
              }
              alt=""
            />
            <span>Mirrors</span>
          </Link>
        </motion.div>
      </div>
      <div className="col">
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link" to={`/products/${categories?.data[0]?.id}`}>
            <img
              src={
                process.env.REACT_APP_IMG_URL +
                categories?.data[0]?.attributes?.img?.data?.attributes?.url
              }
              alt=""
            />
            <span>Paintings</span>
          </Link>
        </motion.div>
      </div>
      <div className="col col-l">
        <div className="row">
          <div className="col">
            <motion.div className="row" whileHover={{ scale: 0.95 }}>
              <Link
                className="link"
                to={`/products/${categories?.data[2]?.id}`}
              >
                <img
                  src={
                    process.env.REACT_APP_IMG_URL +
                    categories?.data[2]?.attributes?.img?.data?.attributes?.url
                  }
                  alt=""
                />
                <span>Neon signs</span>
              </Link>
            </motion.div>
          </div>
          <div className="col">
            <motion.div className="row" whileHover={{ scale: 0.95 }}>
              <Link
                className="link"
                to={`/products/${categories?.data[4]?.id}`}
              >
                <img
                  src={
                    process.env.REACT_APP_IMG_URL +
                    categories?.data[4]?.attributes?.img?.data?.attributes?.url
                  }
                  alt=""
                />
                <span>Wall stickers</span>
              </Link>
            </motion.div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Categories;
