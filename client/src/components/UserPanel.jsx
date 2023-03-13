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

  return (
    <div className="user-panel h01hz">
      <div className="user-panel-container h01hz">
        <motion.div
          className="user-panel-order-history h01hz"
          whileHover={{ scale: 1.15 }}
        >
          <button className="h01hz">View purchase history</button>
        </motion.div>
        <motion.div
          className="user-panel-logout h01hz"
          whileHover={{ scale: 1.15 }}
        >
          <button className="h01hz" onClick={handleLogout}>
            Logout
          </button>
        </motion.div>
      </div>
    </div>
  );
};
