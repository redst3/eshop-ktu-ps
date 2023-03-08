import React from "react";
import { Link } from "react-router-dom";
import "./styles.scss";
import { motion } from "framer-motion";

function Categories() {
  return (
    <div className="categories">
      <div className="col">
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <img
            src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
            alt=""
          />
          <span>
            <Link className="link" to="/products">
              Vases
            </Link>
          </span>
        </motion.div>
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <img
            src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
            alt=""
          />
          <span>
            <Link className="link" to="/products">
              Paintings
            </Link>
          </span>
        </motion.div>
      </div>
      <div className="col">
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <img
            src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
            alt=""
          />
          <span>
            <Link className="link" to="/products">
              Candles
            </Link>
          </span>
        </motion.div>
      </div>
      <div className="col col-l">
        <div className="row">
          <div className="col">
            <motion.div className="row" whileHover={{ scale: 0.95 }}>
              <img
                src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
              />
              <span>
                <Link className="link" to="/products">
                  Cushions
                </Link>
              </span>
            </motion.div>
          </div>
          <div className="col">
            <motion.div className="row" whileHover={{ scale: 0.95 }}>
              <img
                src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
              />
              <span>
                <Link className="link" to="/products">
                  Lamps
                </Link>
              </span>
            </motion.div>
          </div>
        </div>
        <motion.div className="row" whileHover={{ scale: 0.95 }}>
          <img
            src="https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
            alt=""
          />
          <span>
            <Link className="link" to="/products">
              Mirrors
            </Link>
          </span>
        </motion.div>
      </div>
    </div>
  );
}

export default Categories;
