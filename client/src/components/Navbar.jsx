import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import logo from "../img/logo_nobackground.png";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import StarRateIcon from "@mui/icons-material/StarRate";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import VisibilityIcon from "@mui/icons-material/Visibility";
import ManageSearchIcon from "@mui/icons-material/ManageSearch";
import SegmentIcon from "@mui/icons-material/Segment";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import ManageAccountsIcon from "@mui/icons-material/ManageAccounts";
import EditIcon from "@mui/icons-material/Edit";
import "./styles.scss";
import Cart from "./Cart";
import { useSelector } from "react-redux";
import { motion } from "framer-motion";
import { UserPanel } from "./UserPanel";
import { Search } from "./Search";

const Navbar = () => {
  const [search, setSearch] = useState(false);
  const [open, setOpen] = useState(false);
  const [user, setUser] = useState("");
  const [openPanel, setOpenPanel] = useState(false);
  const [mobileNav, setMobileNav] = useState("navbar-mobile");
  const [backgroundNav, setBackgroundNav] = useState("");
  document.addEventListener("click", (e) => {
    let zz = String(e.target.className);
    if (!(zz.includes("p01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setOpen(false);
    }
    if (!(zz.includes("h01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setOpenPanel(false);
    }
    if (!(zz.includes("s01hz") || zz.includes("[object SVGAnimatedString]"))) {
      setSearch(false);
    }
    if (zz.includes("mobile-navbar-placeholder") && backgroundNav !== "") {
      handleMobileNavbar();
    }
  });
  const products = useSelector((state) => state.cart.products);
  useEffect(() => {
    if (sessionStorage.getItem("role")) {
      setUser(sessionStorage.getItem("role"));
    }
  }, [user]);
  const handleUserPanel = () => {
    setOpenPanel(openPanel ? false : true);
    if (open) {
      setOpen(false);
    }
    if (search) {
      setSearch(false);
    }
  };
  const handleCart = () => {
    setOpen(open ? false : true);
    if (openPanel) {
      setOpenPanel(false);
    }
    if (search) {
      setSearch(false);
    }
  };
  const handleMobileNavbar = () => {
    setMobileNav(
      mobileNav === "navbar-mobile" ? "navbar-mobile show" : "navbar-mobile"
    );
    setBackgroundNav(backgroundNav === "" ? "mobile-navbar-placeholder" : "");
    if (open) {
      setOpen(false);
    }
    if (openPanel) {
      setOpenPanel(false);
    }
    if (search) {
      setSearch(false);
    }
  };
  const handleSearch = () => {
    setSearch(search ? false : true);
    if (open || openPanel) {
      setOpen(false);
      setOpenPanel(false);
    }
  };

  return (
    <div className="navbar-placeholder">
      <div className="navbar">
        <div className="wrapper">
          <div className="left">
            <Link className="link" to="/">
              <img src={logo} className="logo" alt="logo"></img>
            </Link>
          </div>
          <div className="center">
            <motion.div className="item" whileHover={{ scale: 1.15 }}>
              <Link className="link" to="/products">
                <ManageSearchIcon />
                BROWSE
              </Link>
            </motion.div>

            {user === "User" || user === "Admin" ? (
              <motion.div className="item" whileHover={{ scale: 1.15 }}>
                <Link className="link" to="/preview/preview-items">
                  <VisibilityIcon />
                  PREVIEW
                </Link>
              </motion.div>
            ) : null}
            {user === "Admin" ? (
              <motion.div className="item" whileHover={{ scale: 1.15 }}>
                <Link
                  className="link"
                  target="_blank"
                  to={process.env.REACT_APP_STRAPI_ADMIN}
                >
                  <EditIcon />
                  MANAGE
                </Link>
              </motion.div>
            ) : null}
          </div>
          <div className="right">
            <div className="icons">
              <motion.div whileHover={{ scale: 1.15 }}>
                <SearchIcon onClick={handleSearch} />
              </motion.div>
              {user !== "" ? (
                <motion.div
                  whileHover={{ scale: 1.15 }}
                  className="active"
                  onClick={() => {
                    handleUserPanel();
                  }}
                >
                  <ManageAccountsIcon />
                </motion.div>
              ) : (
                <Link className="link" to="/login">
                  <motion.div whileHover={{ scale: 1.15 }}>
                    <PersonOutlineOutlinedIcon />
                  </motion.div>
                </Link>
              )}
              <motion.div whileHover={{ scale: 1.15 }}>
                <Link to="/user/wishlist" className="link wishlist">
                  <StarRateIcon />
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
            <div className="mobile" onClick={handleMobileNavbar}>
              <SegmentIcon />
            </div>
          </div>
        </div>
        <div className="mobile-nav">
          <div className={backgroundNav}>
            <div className={mobileNav}>
              <div className="navbar-close">
                <ArrowBackIcon onClick={handleMobileNavbar} />
              </div>
              <motion.div
                className="navbar-menu-browse"
                whileHover={{ scale: 1.15 }}
              >
                <div onClick={handleMobileNavbar}>
                  <Link className="link" to="/products">
                    BROWSE ALL
                  </Link>
                </div>
              </motion.div>
              <center>
                <h3>BROWSE BY CATEGORY</h3>
              </center>
              <div className="navbar-menu-items">
                <motion.div
                  onClick={handleMobileNavbar}
                  whileHover={{ scale: 1.15 }}
                >
                  <Link className="link" to="/products/1">
                    PAINTINGS
                  </Link>
                </motion.div>
                <motion.div
                  onClick={handleMobileNavbar}
                  whileHover={{ scale: 1.15 }}
                >
                  <Link className="link" to="/products/7">
                    NEON SIGNS
                  </Link>
                </motion.div>
                <motion.div
                  onClick={handleMobileNavbar}
                  whileHover={{ scale: 1.15 }}
                >
                  <Link className="link" to="/products/9">
                    WALL STICKERS
                  </Link>
                </motion.div>
                <motion.div
                  onClick={handleMobileNavbar}
                  whileHover={{ scale: 1.15 }}
                >
                  <Link className="link" to="/products/8">
                    CLOCKS
                  </Link>
                </motion.div>
                <motion.div
                  onClick={handleMobileNavbar}
                  whileHover={{ scale: 1.15 }}
                >
                  <Link className="link" to="/products/6">
                    MIRRORS
                  </Link>
                </motion.div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {open && <Cart />}
      {openPanel && <UserPanel />}
      {search && <Search />}
    </div>
  );
};
export default Navbar;
