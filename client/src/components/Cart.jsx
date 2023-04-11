import React, { useEffect, useState } from "react";
import "./styles.scss";
import DeleteOutlinedIcon from "@mui/icons-material/DeleteOutlined";
import { useSelector } from "react-redux";
import { useDispatch } from "react-redux";
import { removeProductFromCart, resetCart } from "../services/reduceCart";
import { useNavigate } from "react-router-dom";
import AlertConfirm from "react-alert-confirm";
import StripeContainer from "./StripeContainer";
AlertConfirm.config({
  title: "Are you sure you want to delete this item?",
  okText: null,
});
const Cart = () => {
  const navigate = useNavigate();
  const products = useSelector((state) => state.cart.products);
  const dispatchHook = useDispatch();
  const [total, setTotal] = useState(0);

  useEffect(() => {
    var total = 0;
    products.forEach((item) => {
      total += item.price * item.quantity;
    });
    setTotal(total);
  }, [products]);

  return (
    <div className="cart p01hz">
      {products.length === 0 ? (
        <h1 className="p01hz">No items in cart</h1>
      ) : (
        <>
          <h1 className="p01hz">Currently selected items</h1>
          <div className="cart-items">
            {products?.map((item) => (
              <div className="item p01hz" key={item.id}>
                <img className="p01hz" src={item.img} alt={item.id} />
                <div className="info p01hz">
                  <h1 className="p01hz">{item.title}</h1>
                  <p className="p01hz">{item.author?.substring(0, 70)}</p>
                  <div className="price p01hz">
                    {item.quantity} x {item.price} €
                  </div>
                </div>
                <div className="p01hz delete">
                  <DeleteOutlinedIcon
                    className="delete"
                    onClick={() => dispatchHook(removeProductFromCart(item.id))}
                  />
                </div>
              </div>
            ))}
          </div>
          <div className="total p01hz">
            <span className="p01hz">PRICE</span>
            <span className="p01hz">{total.toFixed(2)} €</span>
          </div>
          <div className="checkout-button p01hz">
            <button
              className="checkout p01hz"
              onClick={async () => {
                const [action] = await AlertConfirm({
                  custom: () => <StripeContainer props={products} />,
                  style: {
                    zIndex: 9999,
                  },
                });
                action && console.log("alert ok");
              }}
            >
              Checkout
            </button>
          </div>
          <span
            className="reset-cart p01hz"
            onClick={() => dispatchHook(resetCart())}
          >
            Reset cart
          </span>
        </>
      )}
    </div>
  );
};

export default Cart;
