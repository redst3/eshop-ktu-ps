import React, { useEffect, useState } from "react";
import "./styles.scss";
import DeleteOutlinedIcon from "@mui/icons-material/DeleteOutlined";
import { useSelector } from "react-redux";
import { useDispatch } from "react-redux";
import { removeProductFromCart, resetCart } from "../services/reduceCart";
import { loadStripe } from "@stripe/stripe-js";
import { makeRequest } from "../services/request";

const Cart = () => {
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

  const loadStripePromise = loadStripe(
    "pk_test_51Mol6YJwRVpmwHIv2qOMTXtqDX6Inb6bUU6L1hbcvVnNHkXLTlrM2egvYv6za2IVdYhD40o4uMTw2r5OEN7HeVCR00TijcTwpA"
  );
  const handlePayment = async () => {
    try {
      const userId = JSON.parse(sessionStorage.getItem("user"))["sub"];
      const stripe = await loadStripePromise;
      const response = await makeRequest.post("/orders", {
        userId,
        products,
      });
      await stripe.redirectToCheckout({
        sessionId: response.data.stripeSession.id,
      });
    } catch {
      console.log("Error");
    }
  };
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
            <button className="checkout p01hz" onClick={handlePayment}>
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
