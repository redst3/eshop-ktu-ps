import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import "./authPages.scss";
import authServices from "../../services/AuthServices";
import { useEffect } from "react";

const Login = () => {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  // const [update, setUpdate] = useState();

  const handleSumbit = (e) => {
    e.preventDefault();
    authServices.login(username, password).then(
      () => {
        navigate("/");
      },
      (error) => {
        setError(error);
      }
    );
  };
  useEffect(() => {
    if (sessionStorage.getItem("user")) {
      navigate("/");
    }
  }, [navigate]);

  return (
    <div className="login">
      <div className="login-window">
        <h1 className="login-title">Existing User</h1>
        <form className="login-form">
          <div className="login-form-email">
            <label htmlFor="email">Username</label>
            <input
              className="form-input"
              name="username"
              id="username"
              onChange={(e) => setUsername(e.target.value)}
            />
          </div>
          <div className="login-form-password">
            <label htmlFor="password">Password</label>
            <input
              className="form-input"
              type="password"
              name="password"
              id="password"
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <div className="login-form-submit">
            <input
              className="login-form-submit-button"
              type="button"
              value="Login"
              onClick={handleSumbit}
            />
          </div>
        </form>
        <p className="error-message">{error}</p>
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
