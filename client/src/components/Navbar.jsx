import React, { useState } from "react";
import { Link } from "react-router-dom";
import logo from "../img/logo.png";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import "./styles.scss";
import Cart from "./Cart";

const Navbar = () => {
  const [open, setOpen] = useState(false);
  // create a listener for mouse click outside of the cart div
  // if the click is outside of the cart div, close the cart
  document.addEventListener("click", (e) => {
    let zz = String(e.target.className);
    if (!(zz.includes("p01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setOpen(false);
    }
  });
  return (
    <div className="navbar">
      <div className="wrapper">
        <div className="left">
          <div className="item">
            <Link className="link" to="/products/1">
              Paintings
            </Link>
          </div>
          <div className="item">
            <Link className="link" to="/products/2">
              Vases
            </Link>
          </div>
          <div className="item">
            <Link className="link" to="/products/3">
              empty
            </Link>
          </div>
        </div>
        <div className="center">
          <Link className="link" to="/">
            <img src={logo} className="logo" alt="logo"></img>
          </Link>
        </div>
        <div className="right">
          <div className="item"></div>
          <div className="item">
            <Link className="link" to="/">
              About
            </Link>
          </div>
          <div className="item">
            <Link className="link" to="/">
              Contact
            </Link>
          </div>
          <div className="icons">
            <SearchIcon />
            <Link className="link" to="/login">
              <PersonOutlineOutlinedIcon />
            </Link>
            <FavoriteBorderOutlinedIcon />
            <div
              className="cartIcon"
              onClick={() => {
                setOpen(open ? false : true);
              }}
            >
              <ShoppingCartOutlinedIcon />
              <span>0</span>
            </div>
          </div>
        </div>
      </div>
      {open && <Cart />}
    </div>
  );
};
export default Navbar;
