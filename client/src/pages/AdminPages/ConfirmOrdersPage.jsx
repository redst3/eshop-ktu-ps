import React from "react";
import { motion } from "framer-motion";
import useFetch from "../../hooks/useFetch";
import "../UserPages/authPages.scss";
import AlertConfirm from "react-alert-confirm";
import Order from "../../components/Order";

export const ConfirmOrdersPage = () => {
  const { data, error } = useFetch(`/orders?populate=*`);

  return (
    <div className="order-page">
      {error ? (
        <h1>Something went wrong or there is no orders</h1>
      ) : (
        <>
          <div className="header">
            <h1>Orders</h1>
          </div>
          <div className="order-container">
            <ul className="responsive-table">
              <li className="table-header">
                <div className="col col-1">ORDER ID</div>
                <div className="col col-2">ORDER DATE</div>
                <div className="col col-3">ORDER STATUS</div>
                <div className="col col-4">VIEW ORDER</div>
              </li>
              {data.map((data) => (
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
                      await AlertConfirm({
                        custom: () => <Order props={{ data }} />,
                      });
                    }}
                  >
                    MORE
                  </motion.div>
                </li>
              ))}
            </ul>
          </div>
        </>
      )}
    </div>
  );
};
