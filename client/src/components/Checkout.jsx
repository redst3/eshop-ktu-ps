import React, { useState, useEffect } from "react";
import { useStripe, useElements, CardElement } from "@stripe/react-stripe-js";
import { makeRequest } from "../services/request";
import authServices from "../services/AuthServices";

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
  const [country, setCountry] = useState("");
  const [city, setCity] = useState("");
  const [address, setAddress] = useState("");
  const [postalCode, setPostalCode] = useState("");
  const [email, setEmail] = useState("");
  const [loggedIn, setLoggedIn] = useState(false);
  const [userId, setUserId] = useState("");

  useEffect(() => {
    try {
      var user = JSON.parse(sessionStorage.getItem("user"));
      const shippingAdress = user["shipping-address"].split(",");
      setUserId(user["sub"]);
      setEmail(user["email"]);
      setLoggedIn(true);
      setCountry(shippingAdress[0]);
      setCity(shippingAdress[1]);
      setAddress(shippingAdress[2]);
      setPostalCode(shippingAdress[3]);
    } catch {
      setLoggedIn(false);
    }
  }, [userId]);

  const total = products.reduce(
    (acc, item) => acc + item.price * item.quantity,
    0
  );
  const stripe = useStripe();
  const elements = useElements();
  const handleSubmit = async (event) => {
    var empty = false;
    if (
      country === "" ||
      city === "" ||
      address === "" ||
      postalCode === "" ||
      email === ""
    ) {
      empty = true;
    } else {
      document.getElementById("shipping-adress").innerHTML = "";
    }
    event.preventDefault();
    const { error, paymentMethod } = await stripe.createPaymentMethod({
      type: "card",
      card: elements.getElement(CardElement),
    });
    if (!error && !empty) {
      try {
        const { id } = paymentMethod;
        const response = await makeRequest.post(
          "http://localhost:1337/api/order/payment",
          {
            amount: total * 100,
            id: id,
            userId: userId,
            products: products,
            total_cost: total,
            email: email,
            shippingAdress: `${country},${city},${address},${postalCode}`,
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
      document.getElementById("shipping-adress").innerHTML =
        "Please fill in all the fields";
    }
  };
  const handleSave = async (event) => {
    event.preventDefault();
    if (
      country === "" ||
      city === "" ||
      address === "" ||
      postalCode === "" ||
      email === ""
    ) {
      document.getElementById("shipping-adress").innerHTML =
        "Please fill in all the fields";
      document.getElementById("shipping-adress").style.color = "red";
    } else {
      document.getElementById("shipping-adress").innerHTML = "";
      authServices
        .updateShippingAddress(userId, country, city, address, postalCode)
        .then((res) => {
          var user = JSON.parse(sessionStorage.getItem("user"));
          user[
            "shipping-address"
          ] = `${country},${city},${address},${postalCode}`;
          sessionStorage.setItem("user", JSON.stringify(user));
          document.getElementById("shipping-adress").innerHTML =
            "Shipping address saved";
          document.getElementById("shipping-adress").style.color = "green";
        });
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
                  <input
                    value={country}
                    onChange={(e) => setCountry(e.target.value)}
                    onClick={() =>
                      (document.getElementById("shipping-adress").innerHTML =
                        "")
                    }
                  ></input>
                </div>
                <div className="FormRow">
                  <label>CITY</label>
                  <input
                    value={city}
                    onChange={(e) => setCity(e.target.value)}
                    onClick={() =>
                      (document.getElementById("shipping-adress").innerHTML =
                        "")
                    }
                  ></input>
                </div>
                <div className="FormRow">
                  <label>ADDRESS</label>
                  <input
                    value={address}
                    onChange={(e) => setAddress(e.target.value)}
                    onClick={() =>
                      (document.getElementById("shipping-adress").innerHTML =
                        "")
                    }
                  ></input>
                </div>
                <div className="FormRow">
                  <label>POSTAL CODE</label>
                  <input
                    value={postalCode}
                    onChange={(e) => setPostalCode(e.target.value)}
                    onClick={() =>
                      (document.getElementById("shipping-adress").innerHTML =
                        "")
                    }
                  ></input>
                </div>
                {loggedIn ? (
                  <div className="FormRow">
                    <label>EMAIL</label>
                    <input value={email} readOnly disabled></input>
                  </div>
                ) : (
                  <div className="FormRow">
                    <label>EMAIL</label>
                    <input
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      onClick={() =>
                        (document.getElementById("shipping-adress").innerHTML =
                          "")
                      }
                    ></input>
                  </div>
                )}
                <h4 id="shipping-adress" style={{ color: "red" }}>
                  {" "}
                </h4>
              </fieldset>

              <button onClick={handleSave}>SAVE SHIPPING ADDRESS</button>
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
