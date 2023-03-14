import React from "react";

import { Navigate } from "react-router-dom";

const protectedRoutes = ({ requiredRole, page }) => {
  const user = JSON.parse(sessionStorage.getItem("user"));
  const role = sessionStorage.getItem("role");
  if (user) {
    if (requiredRole === role || role === "Admin") {
      return page;
    } else {
      return <Navigate to="/" />;
    }
  }
  return <Navigate to="/login" />;
};

export default protectedRoutes;
