import React, { useState } from "react";
import { useSelector } from "react-redux";
import Draggable from "react-draggable";
import { useDispatch } from "react-redux";
import { updateCart } from "../../services/reduceCart";
export const PreviewItemsPage = () => {
  const data = {
    img: "https://img.freepik.com/premium-photo/realistic-3d-render-room-beautiful-sunlight-window-frame-shadow-beige-blank-wall-white-skirting-board-empty-room-new-wooden-parquet-floor-background-interior-side-view_695590-889.jpg?w=2000",
  };
  const [selectedX, setSelectedX] = useState(0);
  const [selectedY, setSelectedY] = useState(0);
  const [selectedZ, setSelectedZ] = useState(0);
  const [selectedSize, setSelectedSize] = useState(0);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const products = useSelector((state) => state.cart.products);
  const [previewProducts, setPreviewProducts] = useState([...products]);
  const [displayProducts, setDisplayProducts] = useState([]);
  const dispatchHook = useDispatch();
  const [saved, setSaved] = useState(false);
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
  const handleClick = (e) => {
    const product = e.target.closest(".image-container");
    document.querySelectorAll(".product-delete").forEach((item) => {
      item.hidden = true;
    });
    const values = [...product.children[0].style.transform.matchAll(/\d+/g)];
    setSelectedSize(parseInt(product.children[0].children[0].height));
    const span = product.querySelector(".product-delete");
    span.hidden = false;
    // set values of selected product to states and use them in range inputs
    setSelectedX(values[0][0]);
    setSelectedY(values[1][0]);
    setSelectedZ(values[2][0]);
    setSelectedProduct(product);
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
  const handleResize = (e) => {
    setSelectedSize(parseInt(e.target.value));
    selectedProduct.children[0].children[0].height = selectedSize;
    selectedProduct.children[0].children[0].width = selectedSize;
  };
  const handleReset = () => {
    setSelectedX(0);
    setSelectedY(0);
    setSelectedZ(0);
    setSelectedSize(200);
    selectedProduct.children[0].style.transform = `rotateX(${0}deg) rotateY(${0}deg) rotateZ(${0}deg)`;
    selectedProduct.children[0].children[0].height = 200;
    selectedProduct.children[0].children[0].width = 200;
  };
  const handleDelete = (e) => {
    if (previewProducts.find((item) => item.id === e.id)) {
      setPreviewProducts(
        previewProducts.map((item) =>
          item.id === e.id ? { ...item, quantity: item.quantity + 1 } : item
        )
      );
    } else {
      setPreviewProducts([...previewProducts, { ...e, quantity: 1 }]);
    }
    setDisplayProducts(displayProducts.filter((item) => item !== e));
  };
  return (
    <div className="preview-items">
      <div className="left">
        <h1 className="left-title">Your selected Items</h1>
        <div className="cart-items">
          {previewProducts?.map((item) => (
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
          ))}
        </div>
        <div className="left-bottom">
          <h1>Adjust</h1>
          <div>
            <h2>Options</h2>
            <button>Rotate</button>
            <button>Resize</button>
          </div>
        </div>
      </div>
      <div className="right">
        <div className="top">
          <h1>Item preview</h1>
        </div>
        <div className="middle">
          <div className="image-holder">
            <img className="background" src={data.img} alt="" />
            <div className="product-images">
              {displayProducts?.map((item, key) => (
                <Draggable key={key} bounds=".image-holder">
                  <div className="image-container" onClick={handleClick}>
                    <div
                      className="rotate-image"
                      style={{
                        transform: `rotateX(${0}deg) rotateY(${0}deg) rotateZ(${0}deg)`,
                      }}
                    >
                      <img
                        draggable="false"
                        className="product-image"
                        src={item.img}
                        alt="img"
                        height={200}
                        width={200}
                      />
                    </div>
                    <span
                      className="product-delete"
                      hidden
                      onClick={() => handleDelete(item)}
                    >
                      X
                    </span>
                  </div>
                </Draggable>
              ))}
            </div>
          </div>
        </div>
        <div className="bottom">
          {selectedProduct === null ? (
            ""
          ) : (
            <>
              <div className="bottom-range">
                <div className="adjust-image" hidden>
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
                    <span>X is rotated {selectedX} degrees</span>
                  </div>
                  <div className="bottom-adjust">
                    <input
                      type="range"
                      min="-180"
                      max="180"
                      value={selectedY}
                      className="preview-range"
                      onChange={(e) => handleRotate(e, "y")}
                    ></input>
                    <span></span>
                  </div>
                  <div className="bottom-adjust">
                    <input
                      type="range"
                      min="-180"
                      max="180"
                      value={selectedZ}
                      className="preview-range"
                      onChange={(e) => handleRotate(e, "z")}
                    ></input>
                    <span>Z is rotated {selectedZ} degrees</span>
                  </div>
                </div>
                <div className="resize-image">
                  <div className="bottom-adjust">
                    <input
                      type="range"
                      min="0"
                      max="400"
                      value={selectedSize}
                      className="preview-range"
                      onChange={(e) => handleResize(e)}
                    ></input>
                    <span>
                      Image is resized by{" "}
                      {((selectedSize * 100) / (400 - 0)).toFixed(0) - 50} %
                    </span>
                  </div>
                </div>
              </div>
              <div className="buttons">
                <button className="preview-button" onClick={handleReset}>
                  Reset selected
                </button>
                {!saved ? (
                  <button
                    className="preview-button"
                    onClick={() => {
                      dispatchHook(updateCart(displayProducts));
                      setSaved(true);
                    }}
                  >
                    Save
                  </button>
                ) : (
                  ""
                )}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};
