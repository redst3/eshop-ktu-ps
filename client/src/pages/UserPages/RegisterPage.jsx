import React from "react";
import { Link } from "react-router-dom";
import "./authPages.scss";

const Register = () => {
  return (
    <div className="register">
      <div className="register-window">
        <h1 className="register-title">New user registration</h1>
        <form className="register-form">
          <div className="register-form-name">
            <label className="register-name" htmlFor="email">
              Name
            </label>
            <input className="form-input" name="name" id="name" />
          </div>
          <div className="register-form-name">
            <label htmlFor="email">Surname</label>
            <input className="form-input" name="surname" id="surname" />
          </div>
          <div className="register-form-email">
            <label htmlFor="email">Email</label>
            <input
              className="form-input"
              type="email"
              name="email"
              id="email"
            />
          </div>
          <div className="register-form-password">
            <label htmlFor="password">Password</label>
            <input
              className="form-input"
              type="password"
              name="password"
              id="password"
            />
          </div>
          <div className="register-form-submit">
            <input
              className="register-form-submit-button"
              type="submit"
              value="Register"
            />
          </div>
        </form>
        <Link to="/login">
          <div className="navigate-login">
            <p>Already have an account?</p>
          </div>
        </Link>
      </div>
    </div>
  );
};
export default Register;
