import React, { useState } from "react";
import { useSelector } from "react-redux";
import Draggable from "react-draggable";

export const PreviewItemsPage = () => {
  const products = useSelector((state) => state.cart.products);
  const [previewProducts, setPreviewProducts] = useState([...products]);
  const [displayProducts, setDisplayProducts] = useState([]);
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
  const handleDrag = (e) => {
    console.log("test");
  };
  const handleDelete = (e) => {
    const item = displayProducts.find((item) => item.id === e.id);
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
      </div>
      <div className="right">
        <div className="top">
          <h1>Item preview</h1>
        </div>
        <div className="middle">
          <div className="image-holder">
            <img className="background" src="" alt="" />
            <div className="product-images">
              {displayProducts?.map((item, key) => (
                <Draggable onDrag={handleDrag} key={key}>
                  <div className="image-container">
                    <div
                      className="rotate-image"
                      style={{
                        transform: `rotate3d(0,1,1, 45deg)`,
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
        <div className="bottom"></div>
      </div>
    </div>
  );
};
