import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import "./authPages.scss";
import authServices from "../../services/AuthServices";
import wishServices from "../../services/WishlistServices";
import { useEffect } from "react";

const Login = () => {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [update, setUpdate] = useState(false);

  const handleSumbit = (e) => {
    e.preventDefault();
    if (!username || !password) return setError("Please fill in all fields");
    authServices.login(username, password).then(
      (response) => {
        handleWishlist(response);
      },
      (error) => {
        setError(error.code);
        console.log(error);
        return;
      }
    );
  };
  const handleWishlist = async (userId) => {
    await wishServices.getWishList(userId);
    setUpdate(true);
  };
  useEffect(() => {
    if (update) {
      navigate("/");
    }
  }, [update, navigate]);
  useEffect(() => {
    if (sessionStorage.getItem("user")) {
      navigate("/");
    }
  }, [navigate]);

  return (
    <div className="login">
      <div className="login-window">
        <h1 className="login-title">EXISTING USER</h1>
        <form className="login-form">
          <div className="login-form-email">
            <label htmlFor="username">USERNAME</label>
            <input
              className="form-input"
              name="username"
              id="username"
              onChange={(e) => setUsername(e.target.value)}
            />
          </div>
          <div className="login-form-password">
            <label htmlFor="password">PASSWORD</label>
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
              type="submit"
              value="LOGIN"
              onClick={handleSumbit}
            />
          </div>
        </form>
        <p className="error-message">{error}</p>
        <Link to="/register">
          <div className="navigate-register">
            <p>DON`T HAVE AN ACCOUNT?</p>
          </div>
        </Link>
      </div>
    </div>
  );
};
export default Login;
