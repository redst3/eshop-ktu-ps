import React, { useState } from "react";
import { useStripe, useElements, CardElement } from "@stripe/react-stripe-js";
import axios from "axios";
import { makeRequest } from "./../services/request";

const CARD_OPTIONS = {
  hidePostalCode: true,
  iconStyle: "solid",
  style: {
    base: {
      iconColor: "#fff",
      color: "#fff",
      fontWeight: 500,
      fontFamily: "Roboto, Open Sans, Segoe UI, sans-serif",
      fontSize: "16px",
      fontSmoothing: "antialiased",
      ":-webkit-autofill": { color: "##fff" },
      "::placeholder": { color: "#fff" },
    },
    invalid: {
      iconColor: "#c91111",
      color: "#c91111",
    },
  },
};

export default function Checkout(props) {
  const [succeeded, setSucceeded] = useState(false);
  const [products, setProducts] = useState(props.flag.props);
  const total = products.reduce(
    (acc, item) => acc + item.price * item.quantity,
    0
  );
  const stripe = useStripe();
  const elements = useElements();
  const handleSubmit = async (event) => {
    event.preventDefault();
    const { error, paymentMethod } = await stripe.createPaymentMethod({
      type: "card",
      card: elements.getElement(CardElement),
    });
    if (!error) {
      try {
        const { id } = paymentMethod;
        const response = await makeRequest.post(
          "http://localhost:1337/api/order/payment",
          {
            amount: total * 100,
            id: id,
          }
        );
        if (response.data.successful) {
          console.log("Successful payment");
          setSucceeded(true);
        }
      } catch (error) {
        console.log("Error", error);
      }
    } else {
      console.log(error.message);
    }
  };

  return (
    <div className="checkout-modal">
      <div className="checkout-form">
        {!succeeded ? (
          <>
            <form onSubmit={handleSubmit}>
              <span>INFORMATION</span>
              <fieldset className="FormGroup shipping-details">
                <div className="FormRow">
                  <label>COUNTRY</label>
                  <input></input>
                </div>
                <div className="FormRow">
                  <label>CITY</label>
                  <input></input>
                </div>
                <div className="FormRow">
                  <label>ADDRESS</label>
                  <input></input>
                </div>
                <div className="FormRow">
                  <label>POSTAL CODE</label>
                  <input></input>
                </div>
                <div className="FormRow">
                  <label>EMAIL</label>
                  <input></input>
                </div>
              </fieldset>
              <button>SAVE SHIPPING ADDRESS</button>
              <span>INFORMATION</span>
              <div className="cart-information">
                {products?.map((item, id) => (
                  <div key={id}>
                    <h4>{item.title}</h4>
                    <h4>{item.price + " € X " + item.quantity}</h4>
                  </div>
                ))}
                <div className="total">
                  <h3>TOTAL COST</h3>
                  <h3>{total + "€"}</h3>
                </div>
              </div>
              <span>CARD DETAILS</span>
              <fieldset className="FormGroup">
                <div className="FormRowName">
                  <input placeholder=" Name"></input>
                  <input placeholder=" Surname"></input>
                </div>
                <div className="FormRow">
                  <CardElement options={CARD_OPTIONS} />
                </div>
              </fieldset>
              <button>PAY</button>
            </form>
          </>
        ) : (
          <h2>Payment successful!</h2>
        )}
      </div>
    </div>
  );
}
