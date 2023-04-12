import React from "react";
import { motion } from "framer-motion";
import authServices from "../services/AuthServices";
import { useNavigate } from "react-router-dom";

export const UserPanel = () => {
  const navigate = useNavigate();
  const handleLogout = () => {
    authServices.logout();
    window.location.reload();
  };
  const handleOrders = () => {
    navigate("/user/orders");
  };

  return (
    <div className="user-panel h01hz">
      <div className="user-panel-container h01hz">
        <motion.div
          className="user-panel-order-history h01hz"
          whileHover={{ scale: 1.15 }}
        >
          <button onClick={handleOrders}>PURCHASE HISTORY</button>
        </motion.div>
        <motion.div
          className="user-panel-logout h01hz"
          whileHover={{ scale: 1.15 }}
        >
          <button onClick={handleLogout}>LOGOUT</button>
        </motion.div>
      </div>
    </div>
  );
};
