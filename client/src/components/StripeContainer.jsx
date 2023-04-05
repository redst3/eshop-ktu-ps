import React from "react";
import Checkout from "./Checkout";
import { loadStripe } from "@stripe/stripe-js";
import { Elements } from "@stripe/react-stripe-js";

const stripePromise = loadStripe(process.env.REACT_APP_STRIPE_PK);

export default function StripeContainer(props) {
  return (
    <Elements stripe={stripePromise}>
      <Checkout flag={props} />
    </Elements>
  );
}
