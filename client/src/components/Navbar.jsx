import React, { useState } from "react";
import { Link } from "react-router-dom";
import logo from "../img/logo.png";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import "./styles.scss";
import Cart from "./Cart";
import { useSelector } from "react-redux";
import { motion } from "framer-motion";

const Navbar = () => {
  const [open, setOpen] = useState(false);
  document.addEventListener("click", (e) => {
    let zz = String(e.target.className);
    if (!(zz.includes("p01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setOpen(false);
    }
  });
  const products = useSelector((state) => state.cart.products);

  return (
    <div className="navbar">
      <div className="wrapper">
        <div className="left">
          <motion.div className="item" whileHover={{ scale: 1.15 }}>
            <Link className="link" to="/products/1">
              Browse
            </Link>
          </motion.div>
          <motion.div className="item" whileHover={{ scale: 1.15 }}>
            <Link className="link" to="/">
              Custom paintings
            </Link>
          </motion.div>
          <motion.div className="item" whileHover={{ scale: 1.15 }}>
            <Link className="link" to="/">
              Preview
            </Link>
          </motion.div>
        </div>
        <div className="center">
          <Link className="link" to="/">
            <img src={logo} className="logo" alt="logo"></img>
          </Link>
        </div>
        <div className="right">
          <div className="item"></div>
          <motion.div className="item" whileHover={{ scale: 1.15 }}>
            <Link className="link" to="/">
              About
            </Link>
          </motion.div>
          <motion.div className="item" whileHover={{ scale: 1.15 }}>
            <Link className="link" to="/">
              Contact
            </Link>
          </motion.div>
          <div className="icons">
            <motion.div whileHover={{ scale: 1.15 }}>
              <SearchIcon />
            </motion.div>
            <Link className="link" to="/login">
              <motion.div whileHover={{ scale: 1.15 }}>
                <PersonOutlineOutlinedIcon />
              </motion.div>
            </Link>
            <motion.div whileHover={{ scale: 1.15 }}>
              <FavoriteBorderOutlinedIcon />
            </motion.div>
            <motion.div
              whileHover={{ scale: 1.15 }}
              className="cartIcon"
              onClick={() => {
                setOpen(open ? false : true);
              }}
            >
              <ShoppingCartOutlinedIcon />
              <span>{products.length}</span>
            </motion.div>
          </div>
        </div>
      </div>
      {open && <Cart />}
    </div>
  );
};
export default Navbar;
