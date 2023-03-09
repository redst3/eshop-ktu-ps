import React from "react";
import { Link } from "react-router-dom";
import "./styles.scss";
import { motion } from "framer-motion";

function Categories() {
  return (
    <div className="categories">
      <div className="col">
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link" to="/products/2">
            <img
              src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              alt=""
            />
            <span>Vases</span>
          </Link>
        </motion.div>
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link" to="/products/1">
            <img
              src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              alt=""
            />
            <span>Paintings</span>
          </Link>
        </motion.div>
      </div>
      <div className="col">
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link" to="/products">
            <img
              src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              alt=""
            />
            <span>Candles</span>
          </Link>
        </motion.div>
      </div>
      <div className="col col-l">
        <div className="row">
          <div className="col">
            <motion.div className="row" whileHover={{ scale: 0.95 }}>
              <Link className="link" to="/products">
                <img
                  src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                  alt=""
                />
                <span>Cushions</span>
              </Link>
            </motion.div>
          </div>
          <div className="col">
            <motion.div className="row" whileHover={{ scale: 0.95 }}>
              <Link className="link" to="/products">
                <img
                  src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                  alt=""
                />
                <span>Lamps</span>
              </Link>
            </motion.div>
          </div>
        </div>
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <Link className="link wide" to="/products">
            <img
              className="img"
              src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              alt=""
            />
            <span>Mirrors</span>
          </Link>
        </motion.div>
      </div>
    </div>
  );
}

export default Categories;
