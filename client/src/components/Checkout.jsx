import React from "react";
import { PayPalScriptProvider, PayPalButtons } from "@paypal/react-paypal-js";

export default function Checkout({ sum }) {
  return (
    <PayPalScriptProvider
      options={{
        "client-id":
          "AUZ4RboB6Bf9CM-Q3Y7Z4H3dLqBZXDM3-ZTXTsIrCye5Mc1avKsckJWLmEACfuZUKMVxUA7XdEeHTWpM",
        currency: "EUR",
      }}
    >
      <PayPalButtons
        createOrder={(data, actions) => {
          return actions.order.create({
            purchase_units: [
              {
                amount: {
                  value: sum,
                },
              },
            ],
          });
        }}
        onApprove={(data, actions) => {
          console.log("approved");
          return actions.order.capture().then(function (details) {
            console.log(
              "transaction completed by " + details.payer.name.given_name
            );
          });
        }}
        onCancel={(data) => {
          console.log("cancelled");
        }}
        onError={(err) => {
          console.log("error");
        }}
      />
    </PayPalScriptProvider>
  );
}
