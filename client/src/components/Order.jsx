import React from "react";
import logo from "../img/logo_nobackground.png";

const Order = (props) => {
  const order = props.props.data;
  const shippingAddress = order?.attributes.shipping_address;
  console.log(order);
  return (
    <div className="order-modal">
      <img src={logo} className="logo" alt="logo"></img>
      <div className="details">
        <h1>ORDER DETAILS</h1>
      </div>
      <div className="order-cart-information">
        <div className="order-cart-products">
          <span>PRODUCTS</span>
          {order?.attributes.products.data.map((item, id) => (
            <div className="order-cart-product" key={id}>
              <h4>{item.attributes.title}</h4>
              <h4>
                {item.attributes.price + " € X " + item.attributes.quantity}
              </h4>
            </div>
          ))}
        </div>
        <div className="order-cart-shipping">
          <h1>SHIPPING DETAILS</h1>
          <div>
            <h4>COUNTRY</h4>
            <h4>{shippingAddress.country}</h4>
          </div>
          <div>
            <h4>CITY</h4>
            <h4>{shippingAddress.city}</h4>
          </div>
          <div>
            <h4>ADDRESS</h4>
            <h4>{shippingAddress.address}</h4>
          </div>
          <div>
            <h4>POSTAL CODE</h4>
            <h4>{shippingAddress.postal_code}</h4>
          </div>
        </div>
        <div className="order-cart-total">
          <h1>TOTAL COST</h1>
          <h1>{order.attributes.total_cost + " €"}</h1>
        </div>
        <div className="order-cart-status">
          <h1>ORDER STATUS</h1>
          <div>
            <h1>{order.attributes.order_status}</h1>
            <h1>{order.attributes.order_date}</h1>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Order;
