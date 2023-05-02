import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { motion } from "framer-motion";
import { useDispatch } from "react-redux";
import { updateCart } from "../../services/reduceCart";
import { useSelector } from "react-redux";
import Draggable from "react-draggable";
import backgroundService from "../../services/BackgroundImageServices";
import AlertConfirm from "react-alert-confirm";
import ClearIcon from "@mui/icons-material/Clear";
import "react-alert-confirm/lib/style.css";
import "./zitempreview.scss";
import "../../components/styles.scss";
import useFetch from "../../hooks/useFetch";
import x_img from "../../img/rotate/x.png";
import y_img from "../../img/rotate/y.png";
import z_img from "../../img/rotate/z.png";
import HelpIcon from "@mui/icons-material/Help";
import { Tutorial } from "../../components/Tutorial";
AlertConfirm.config({
  maskClosable: true,
  okText: "Continue",
  cancelText: "Go back",
});
export const PreviewItemsAferAdjustPage = () => {
  const navigate = useNavigate();
  const [loadedImage, setLoadedImage] = useState(false);
  const [loadedContent, setLoadedContent] = useState(null);
  const [loadedType, setLoadedType] = useState(null);
  const [pixelSize, setPixelSize] = useState(1);
  const [selectedX, setSelectedX] = useState(0);
  const [selectedY, setSelectedY] = useState(0);
  const [selectedZ, setSelectedZ] = useState(0);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [option, setOption] = useState("cart");
  const products = useSelector((state) => state.cart.products);
  const [previewProducts, setPreviewProducts] = useState([
    ...products.map((item) => {
      return { ...item, inCart: true };
    }),
  ]);
  const [searchProducts, setSearchProducts] = useState([]);
  const [displayProducts, setDisplayProducts] = useState([]);
  const [keyword, setKeyword] = useState("");
  const dispatchHook = useDispatch();
  const { data } = useFetch(`/products?populate=*`);
  useEffect(() => {
    if (keyword !== "") {
      const results = data?.filter(
        (product) =>
          product.attributes.title.toLowerCase().includes(keyword) ||
          product.attributes.author.toLowerCase().includes(keyword)
      );
      setSearchProducts(results);
    } else {
      setSearchProducts(data);
    }
  }, [keyword, data]);
  useEffect(() => {
    var userId = JSON.parse(sessionStorage.getItem("user")).sub;
    async function fetchData() {
      await backgroundService
        .getBackgroundImage(userId)
        .then((response) => {
          setPixelSize(response.px_to_cm);
          setLoadedImage(true);
          setLoadedContent(response.image.fileContents);
          setLoadedType(response.image.contentType);
        })
        .catch(() => {
          navigate("/preview/upload");
        });
    }
    fetchData(userId);
  }, [navigate]);
  const handleClick = (e) => {
    const product = e.target.closest(".image-container");
    document.querySelectorAll(".product-delete").forEach((item) => {
      item.hidden = true;
      item.classList.remove("active");
    });
    const values = [...product.children[0].style.transform.matchAll(/\d+/g)];
    const span = product.querySelector(".product-delete");
    span.hidden = false;
    span.classList.add("active");
    // set values of selected product to states and use them in range inputs
    setSelectedX(values[0][0]);
    setSelectedY(values[1][0]);
    setSelectedZ(values[2][0]);
    setSelectedProduct(product);
  };
  const handleCartProduct = (e) => {
    if (e.quantity === 1) {
      setPreviewProducts(previewProducts.filter((item) => item.id !== e.id));
      setDisplayProducts([...displayProducts, e]);
    } else {
      setPreviewProducts(
        previewProducts.map((item) =>
          item.id === e.id ? { ...item, quantity: item.quantity - 1 } : item
        )
      );
      setDisplayProducts([...displayProducts, { ...e, quantity: 1 }]);
    }
  };
  const handleShopProduct = (e) => {
    const product = {
      id: e.id,
      title: e.attributes.title,
      author: e.attributes.author,
      price: e.attributes.price,
      quantity: 1,
      img:
        process.env.REACT_APP_IMG_URL + e.attributes.img.data[0].attributes.url,
      preview_img:
        process.env.REACT_APP_IMG_URL +
        e.attributes.preview_img.data.attributes.url,
      height: e.attributes.height,
      width: e.attributes.width,
      inCart: false,
    };
    setDisplayProducts([...displayProducts, product]);
  };
  const handleRotate = (e, direction) => {
    if (direction === "x") {
      setSelectedX(e.target.value);
    } else if (direction === "y") {
      setSelectedY(e.target.value);
    } else {
      setSelectedZ(e.target.value);
    }
    selectedProduct.children[0].style.transform = `rotateX(${selectedX}deg) rotateY(${selectedY}deg) rotateZ(${selectedZ}deg)`;
  };
  const handleReset = () => {
    setSelectedX(0);
    setSelectedY(0);
    setSelectedZ(0);
    selectedProduct.children[0].style.transform = `rotateX(${0}deg) rotateY(${0}deg) rotateZ(${0}deg)`;
    selectedProduct.children[0].children[0].height = 200;
    selectedProduct.children[0].children[0].width = 200;
  };
  const handleConfirm = () => {
    AlertConfirm("Are you sure you want to update the cart?").then((res) => {
      if (res[0]) {
        var length = displayProducts.filter(
          (item) => item.quantity !== 0
        ).length;
        if (length === 0) {
          AlertConfirm.alert("There is no items in the background!");
        } else {
          dispatchHook(
            updateCart(displayProducts.filter((item) => item.quantity !== 0))
          );
          window.location.reload();
        }
      }
    });
  };
  const handleDelete = (e) => {
    // iterate display products and find product in array and change its quantity to 0 and add it to preview products
    const product = displayProducts.find((item) => item.id === e.id);
    setDisplayProducts(
      displayProducts.map((item) =>
        item === e ? { ...item, quantity: 0 } : item
      )
    );
    if (!e.inCart) {
      return;
    }
    if (previewProducts.find((item) => item.id === e.id)) {
      setPreviewProducts(
        previewProducts.map((item) =>
          item.id === e.id ? { ...item, quantity: item.quantity + 1 } : item
        )
      );
    } else {
      setPreviewProducts([...previewProducts, { ...product, quantity: 1 }]);
    }
  };
  return (
    <div className="adjust-upload-page">
      <div className="container">
        <div className="left">
          <div
            className="help"
            onClick={async () => {
              await AlertConfirm({
                custom: () => <Tutorial />,
              });
            }}
          >
            <HelpIcon />
            <p>HOW TO USE?</p>
          </div>
          <div className="image-options-back" style={{ marginTop: "20px" }}>
            <motion.button
              whileHover={{ scale: 0.95 }}
              className="options-button"
              onClick={() =>
                AlertConfirm(
                  "This will open image upload and line adjustment screen, continue?"
                ).then((res) => {
                  if (res[0]) {
                    navigate("/preview/upload");
                  }
                })
              }
            >
              BACK
            </motion.button>
            <motion.button
              whileHover={{ scale: 0.95 }}
              className="options-button"
              onClick={() => setOption(option === "cart" ? "all" : "cart")}
            >
              {option === "cart" ? "ALL" : "CART"}
            </motion.button>
          </div>
          {option === "cart" ? (
            <>
              <h4>Your shopping cart</h4>
              <div className="image-options size">
                <div className="cart-items">
                  {previewProducts.length > 0 ? (
                    previewProducts?.map((item) => (
                      <motion.div
                        whileHover={{ scale: 0.95 }}
                        className="item"
                        key={item.id}
                        onClick={() => handleCartProduct(item)}
                      >
                        <img src={item.img} alt={item.id} />
                        <div className="info">
                          <h1>{item.title}</h1>
                          <h1 className="author">
                            {item.author ? item.author : "-"}
                          </h1>
                          <div className="price">
                            {item.quantity + " X " + item.price} €
                            <span className="measurements">{`${item.width} cm x ${item.height} cm  `}</span>
                          </div>
                        </div>
                      </motion.div>
                    ))
                  ) : (
                    <div className="item">
                      <h2 className="search-notfound">Cart is empty!</h2>
                    </div>
                  )}
                </div>
              </div>
            </>
          ) : (
            <>
              {" "}
              <h4>Search all products</h4>
              <div className="image-options size">
                <div className="cart-items">
                  {searchProducts?.length > 0 ? (
                    searchProducts?.map((item) => (
                      <motion.div
                        whileHover={{ scale: 0.95 }}
                        className="item"
                        key={item.id}
                        onClick={() => handleShopProduct(item)}
                      >
                        <img
                          src={
                            process.env.REACT_APP_IMG_URL +
                            item.attributes.img.data[0].attributes.url
                          }
                          alt={item.id}
                        />
                        <div className="info">
                          <h1>{item.attributes.title}</h1>
                          <h1 className="author">
                            {item.attributes.author
                              ? item.attributes.author
                              : "-"}
                          </h1>
                          <div className="price">
                            {item.attributes.price} €
                            <span className="measurements">{`${item.attributes?.width} cm x ${item.attributes?.height} cm  `}</span>
                          </div>
                        </div>
                      </motion.div>
                    ))
                  ) : (
                    <div className="item">
                      <h2 className="search-notfound">Nothing was found!</h2>
                    </div>
                  )}
                </div>
                <div className="search">
                  <span>Search for a product</span>
                  <input
                    value={keyword}
                    onChange={(e) => setKeyword(e.target.value)}
                  ></input>
                </div>
              </div>
            </>
          )}
          <div className="bottom">
            <div className="bottom-selected-container">
              <hr style={{ width: "90%" }} />
              <div className="bottom-selected">
                {selectedProduct && (
                  <>
                    <motion.span
                      whileHover={{ scale: 0.8 }}
                      onClick={handleReset}
                    >
                      RESET
                    </motion.span>
                    <div className="bottom-adjust">
                      <input
                        type="range"
                        min="-180"
                        max="180"
                        value={selectedX}
                        className="preview-range"
                        onChange={(e) => {
                          handleRotate(e, "x");
                        }}
                      ></input>
                      <img src={x_img} alt="xaxis"></img>
                    </div>
                    <div className="bottom-adjust">
                      <input
                        type="range"
                        min="-180"
                        max="180"
                        value={selectedY}
                        className="preview-range"
                        onChange={(e) => {
                          handleRotate(e, "y");
                        }}
                      ></input>
                      <img src={y_img} alt="yaxis"></img>
                    </div>
                    <div className="bottom-adjust">
                      <input
                        type="range"
                        min="-180"
                        max="180"
                        value={selectedZ}
                        className="preview-range"
                        onChange={(e) => {
                          handleRotate(e, "z");
                        }}
                      ></input>
                      <img className="z-axis" src={z_img} alt="zaxis"></img>
                    </div>
                  </>
                )}
              </div>
              <hr style={{ width: "90%" }} />
            </div>
            <div className="update">
              <motion.button
                whileHover={{ scale: 0.95 }}
                onClick={handleConfirm}
              >
                Update cart with products on background
              </motion.button>
            </div>
          </div>
        </div>

        <div className="right">
          {loadedImage ? (
            <div className="image-holder">
              <img
                className="background"
                alt="not found"
                src={`data:${loadedType};base64,${loadedContent}`}
                type={loadedType}
                onClick={() => {
                  setSelectedProduct(null);
                  document
                    .querySelectorAll(".product-delete")
                    .forEach((item) => {
                      item.hidden = true;
                      item.classList.remove("active");
                    });
                }}
              />
              <div className="product-images">
                {displayProducts?.map(
                  (item, key) =>
                    item.quantity > 0 && (
                      <Draggable key={key} bounds=".image-holder">
                        <div className="image-container" onClick={handleClick}>
                          <div
                            className="rotate-image"
                            style={{
                              transform: `rotateX(${0}deg) rotateY(${0}deg) rotateZ(${0}deg)`,
                              width: `${item.width / pixelSize}px`,
                              height: `${item.height / pixelSize}px}`,
                            }}
                          >
                            <img
                              draggable="false"
                              className="product-image"
                              src={item.preview_img}
                              alt="img"
                              style={
                                item.img === item.preview_img
                                  ? {
                                      border: "5px solid white",
                                    }
                                  : {}
                              }
                            />
                          </div>
                          <span
                            className="product-delete"
                            hidden
                            onClick={() => handleDelete(item)}
                          >
                            <ClearIcon />
                          </span>
                        </div>
                      </Draggable>
                    )
                )}
              </div>
            </div>
          ) : (
            <div id="spin" className="spinner"></div>
          )}
        </div>
      </div>
    </div>
  );
};
