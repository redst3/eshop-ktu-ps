import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { motion } from "framer-motion";
import { useDispatch } from "react-redux";
import { updateCart } from "../../services/reduceCart";
import { useSelector } from "react-redux";
import Draggable from "react-draggable";
import backgroundService from "../../services/BackgroundImageServices";
import "./zitempreview.scss";
import "../../components/styles.scss";
import useFetch from "../../hooks/useFetch";
import x_img from "../../img/rotate/x.png";
import y_img from "../../img/rotate/y.png";
import z_img from "../../img/rotate/z.png";

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
  const [previewProducts, setPreviewProducts] = useState([...products]);
  const [displayProducts, setDisplayProducts] = useState([]);
  const [keyword, setKeyword] = useState("");
  const { data } = useFetch(
    `/products?populate=*&[filters][title][$containsi]=${keyword}`
  );
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
          navigate("/introduction");
        });
    }
    fetchData(userId);
  }, [navigate]);
  const handleClick = (e) => {
    const product = e.target.closest(".image-container");
    document.querySelectorAll(".product-delete").forEach((item) => {
      item.hidden = true;
    });
    const values = [...product.children[0].style.transform.matchAll(/\d+/g)];
    const span = product.querySelector(".product-delete");
    span.hidden = false;
    // set values of selected product to states and use them in range inputs
    setSelectedX(values[0][0]);
    setSelectedY(values[1][0]);
    setSelectedZ(values[2][0]);
    setSelectedProduct(product);
  };
  const handleProduct = (e) => {
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
  return (
    <div className="adjust-upload-page">
      <div className="container">
        <div className="left">
          <div className="image-options">
            <button
              className="options-button"
              style={{ marginTop: "20px" }}
              onClick={() => setOption(option === "cart" ? "all" : "cart")}
            >
              SWITCH
            </button>
          </div>
          {option === "cart" ? (
            <>
              <h1>Your shopping cart</h1>
              <div className="image-options size">
                <div className="cart-items">
                  {previewProducts.length > 0 ? (
                    previewProducts?.map((item) => (
                      <div
                        className="item"
                        key={item.id}
                        onClick={() => handleProduct(item)}
                      >
                        <img src={item.img} alt={item.id} />
                        <div className="info">
                          <h1>{item.title}</h1>
                          <div className="price">
                            {item.quantity} x {item.price} €
                          </div>
                        </div>
                      </div>
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
              <h1>Search all products</h1>
              <div className="image-options size">
                <div className="cart-items">
                  {data?.length > 0 ? (
                    data?.map((item) => (
                      <div
                        className="item"
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
                        <div className="info">
                          <h1>{item.attributes.title}</h1>
                          <h1 className="author">
                            {item.attributes.author
                              ? item.attributes.author
                              : "-"}
                          </h1>
                          <div className="price">{item.attributes.price} €</div>
                        </div>
                      </div>
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
          <hr style={{ width: "100%", marginTop: "5px" }} />
          <div className="bottom">
            <div className="bottom-selected">
              <span>Adjust selected product</span>
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
            </div>
            <hr style={{ width: "100%", marginTop: "5px" }} />
            <div className="update">
              <button>Update cart with products on background</button>
            </div>
          </div>
        </div>

        <div className="right">
          {loadedImage ? (
            <div className="image-holder" onClick={() => console.log("cklick")}>
              <img
                className="background"
                alt="not found"
                src={`data:${loadedType};base64,${loadedContent}`}
                type={loadedType}
              />
              <div className="product-images">
                {displayProducts?.map((item, key) => (
                  <Draggable key={key} bounds=".image-holder">
                    <div className="image-container" onClick={handleClick}>
                      <div
                        className="rotate-image"
                        style={{
                          transform: `rotateX(${0}deg) rotateY(${0}deg) rotateZ(${0}deg)`,
                          width: `${item.width * pixelSize}px`,
                          height: `${item.height * pixelSize}px}`,
                        }}
                      >
                        <img
                          draggable="false"
                          className="product-image"
                          src={item.img}
                          alt="img"
                        />
                      </div>
                      <span
                        className="product-delete"
                        hidden
                        onClick={() => console.log("handleDelete(item)")}
                      >
                        X
                      </span>
                    </div>
                  </Draggable>
                ))}
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
