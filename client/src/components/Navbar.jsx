import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import logo from "../img/logo.png";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import PersonIcon from "@mui/icons-material/Person";
import "./styles.scss";
import Cart from "./Cart";
import { useSelector } from "react-redux";
import { motion } from "framer-motion";
import { UserPanel } from "./UserPanel";

const Navbar = () => {
  const [open, setOpen] = useState(false);
  const [user, setUser] = useState(false);
  const [openPanel, setOpenPanel] = useState(false);
  document.addEventListener("click", (e) => {
    let zz = String(e.target.className);
    if (!(zz.includes("p01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setOpen(false);
    }
    if (!(zz.includes("h01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setOpenPanel(false);
    }
  });
  const products = useSelector((state) => state.cart.products);
  useEffect(() => {
    if (sessionStorage.getItem("user")) {
      setUser(true);
    }
  }, [user]);
  const handleUserPanel = () => {
    setOpenPanel(openPanel ? false : true);
    if (open) {
      setOpen(false);
    }
  };
  const handleCart = () => {
    setOpen(open ? false : true);
    if (openPanel) {
      setOpenPanel(false);
    }
  };
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
            <Link className="link" to="/preview/introduction">
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
            {user ? (
              <motion.div
                whileHover={{ scale: 1.15 }}
                className="active"
                onClick={() => {
                  handleUserPanel();
                }}
              >
                <PersonIcon />
              </motion.div>
            ) : (
              <Link className="link" to="/login">
                <motion.div whileHover={{ scale: 1.15 }}>
                  <PersonOutlineOutlinedIcon />
                </motion.div>
              </Link>
            )}
            <motion.div whileHover={{ scale: 1.15 }}>
              <Link to={"/user/wishlist"} className="link wishlist">
                <FavoriteBorderOutlinedIcon />
              </Link>
            </motion.div>
            <motion.div
              whileHover={{ scale: 1.15 }}
              className="cartIcon"
              onClick={() => {
                handleCart();
              }}
            >
              <ShoppingCartOutlinedIcon />
              <span
                className="p01hz"
                onClick={() => {
                  handleCart();
                }}
              >
                {products.length}
              </span>
            </motion.div>
          </div>
        </div>
      </div>
      {open && <Cart />}
      {openPanel && <UserPanel />}
    </div>
  );
};
export default Navbar;
