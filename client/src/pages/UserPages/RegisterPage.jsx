import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "./authPages.scss";
import authServices from "../../services/AuthServices";
import { useNavigate } from "react-router-dom";

const Register = () => {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleSumbit = (e) => {
    e.preventDefault();
    if (!username || !password || !email)
      return setError("Please fill in all fields");
    authServices.register(username, password, email).then(
      () => {
        navigate("/login");
      },
      (error) => {
        setError(error.response.data);
        console.log(error);
      }
    );
  };
  useEffect(() => {
    if (sessionStorage.getItem("user")) {
      navigate("/");
    }
  }, [navigate]);
  return (
    <div className="register">
      <div className="register-window">
        <h1 className="register-title">New user registration</h1>
        <form className="register-form">
          <div className="register-form-email">
            <label htmlFor="email">Email</label>
            <input
              className="form-input"
              type="email"
              name="email"
              id="email"
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>{" "}
          <div className="register-form-email">
            <label htmlFor="email">Username</label>
            <input
              className="form-input"
              name="username"
              id="username"
              onChange={(e) => setUsername(e.target.value)}
            />
          </div>
          <div className="register-form-password">
            <label htmlFor="password">Password</label>
            <input
              className="form-input"
              type="password"
              name="password"
              id="password"
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <div className="register-form-submit">
            <input
              className="register-form-submit-button"
              type="submit"
              value="Register"
              onClick={handleSumbit}
            />
          </div>
        </form>
        <p className="error-message">{error}</p>
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
