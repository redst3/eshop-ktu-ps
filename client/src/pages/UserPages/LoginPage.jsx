import React from "react";
import { Link } from "react-router-dom";
import "./authPages.scss";

const Login = () => {
  return (
    <div className="login">
      <div className="login-window">
        <h1 className="login-title">Existing User</h1>
        <form className="login-form">
          <div className="login-form-email">
            <label htmlFor="email">Email</label>
            <input
              className="form-input"
              type="email"
              name="email"
              id="email"
            />
          </div>
          <div className="login-form-password">
            <label htmlFor="password">Password</label>
            <input
              className="form-input"
              type="password"
              name="password"
              id="password"
            />
          </div>
          <div className="login-form-submit">
            <input
              className="login-form-submit-button"
              type="submit"
              value="Login"
            />
          </div>
        </form>
        <Link to="/register">
          <div className="navigate-register">
            <p>Don't have an account?</p>
          </div>
        </Link>
      </div>
    </div>
  );
};
export default Login;
