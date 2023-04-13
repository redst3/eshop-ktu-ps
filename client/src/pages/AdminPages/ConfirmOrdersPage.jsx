import React, { useState } from "react";
import { motion } from "framer-motion";
import useFetch from "../../hooks/useFetch";
import "../UserPages/authPages.scss";
import AlertConfirm from "react-alert-confirm";
import Order from "../../components/Order";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import ArrowForwardIosIcon from "@mui/icons-material/ArrowForwardIos";

export const ConfirmOrdersPage = () => {
  const { data, error } = useFetch(`/orders?populate=*`);
  const orders = ["created", "confirmed", "shipped", "completed", "cancelled"];
  const headers = [
    "NEW ORDERS",
    "CONFIRMED ORDERS",
    "SHIPPED ORDERS",
    "COMPLETED ORDERS",
    "CANCELLED ORDERS",
  ];
  const [orderType, setOrderType] = useState(orders[0]);
  const [orderCount, setOrderCount] = useState(0);
  return (
    <div className="order-page">
      {error ? (
        <h1>Something went wrong or there is no orders</h1>
      ) : (
        <>
          <div className="header">
            <ArrowBackIosIcon
              className="arrow"
              onClick={() => {
                if (orderCount === 0) {
                  setOrderCount(4);
                  setOrderType(orders[4]);
                  return;
                }
                setOrderCount(orderCount - 1);
                setOrderType(orders[orderCount - 1]);
              }}
            />
            <h1>{headers[orderCount]}</h1>
            <ArrowForwardIosIcon
              className="arrow"
              onClick={() => {
                if (orderCount === 4) {
                  setOrderCount(0);
                  setOrderType(orders[0]);
                  return;
                }
                setOrderCount(orderCount + 1);
                setOrderType(orders[orderCount + 1]);
              }}
            />
          </div>
          <div className="order-container">
            <ul className="responsive-table">
              <li className="table-header">
                <div className="col col-1">ORDER ID</div>
                <div className="col col-2">ORDER DATE</div>
                <div className="col col-3">ORDER STATUS</div>
                <div className="col col-4">VIEW ORDER</div>
              </li>
              {data?.map(
                (data) =>
                  data.attributes.order_status === orderType && (
                    <li className="table-row" key={data.id}>
                      <div className="col col-1" data-label="ORDER ID">
                        {data.id}
                      </div>
                      <div className="col col-2" data-label="ORDER DATE">
                        {data.attributes.order_date}
                      </div>
                      <div className="col col-3" data-label="ORDER STATUS">
                        {data.attributes.order_status}
                      </div>
                      <motion.div
                        whileHover={{ scale: 1.15 }}
                        className="col col-4 more"
                        data-label="VIEW ORDER"
                        onClick={async () => {
                          const [action] = await AlertConfirm({
                            custom: (window) => (
                              <Order props={{ data, isAdmin: true, window }} />
                            ),
                          });
                          if (action) {
                            window.location.reload();
                          }
                        }}
                      >
                        MORE
                      </motion.div>
                    </li>
                  )
              )}
            </ul>
          </div>
        </>
      )}
    </div>
  );
};
