import React, { useState } from "react";
import logo from "../img/logo_nobackground.png";
import { makeRequest } from "../services/request";

const Order = (props) => {
  const [selectedStatus, setSelectedStatus] = useState("");
  const window = props.props.window;
  const order = props.props.data;
  const isAdmin = props.props.isAdmin;
  const shippingAddress = order?.attributes.shipping_address;
  const quantities = JSON.parse(order?.attributes.quantities);

  const handleUpdate = async () => {
    if (
      selectedStatus === order.attributes.order_status ||
      selectedStatus === ""
    )
      return;
    const response = await makeRequest.put(`/orders/${order.id}`, {
      data: {
        order_status: selectedStatus,
        order_date: new Date().toLocaleDateString(),
      },
    });
    if (response.status === 200) window(true);
  };
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
              <h4>{item.attributes.price + " € X " + quantities[id]}</h4>
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
          <div>
            <h4>EMAIL</h4>
            <h4>{order?.attributes.email}</h4>
          </div>
        </div>
        <div className="order-cart-total">
          <h1>TOTAL COST</h1>
          <h1>{order.attributes.total_cost + " €"}</h1>
        </div>
        <div className="order-cart-status">
          <h1>ORDER STATUS</h1>
          {isAdmin ? (
            <>
              <div>
                <h1>{order.attributes.order_status}</h1>
                <h1>{order.attributes.order_date}</h1>
              </div>
              <div className="edit-status">
                <select
                  name="cars"
                  id="cars"
                  onChange={(e) => setSelectedStatus(e.target.value)}
                  defaultValue=""
                >
                  <option value="">Change order status</option>
                  <option value="shipped">Order has been shipped</option>
                  <option value="completed">Order has been completed</option>
                  <option value="canceled">Cancel order</option>
                </select>
                <button onClick={handleUpdate}>Confirm</button>
              </div>
            </>
          ) : (
            <>
              <div>
                <h1>{order.attributes.order_status}</h1>
                <h1>{order.attributes.order_date}</h1>
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default Order;
