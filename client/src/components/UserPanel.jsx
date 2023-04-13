import React, { useEffect, useState } from "react";
import { motion } from "framer-motion";
import authServices from "../services/AuthServices";
import { useNavigate } from "react-router-dom";

export const UserPanel = () => {
  const [role, setRole] = useState("");
  useEffect(() => {
    if (sessionStorage.getItem("role") === "Admin") {
      setRole(true);
    } else {
      setRole(false);
    }
  }, []);

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
          {role ? (
            <button
              onClick={() => {
                navigate("/admin/orders");
              }}
            >
              ALL ORDERS
            </button>
          ) : (
            <button
              onClick={() => {
                navigate("/user/orders");
              }}
            >
              PURCHASE HISTORY
            </button>
          )}
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
