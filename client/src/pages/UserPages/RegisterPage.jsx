import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "./authPages.scss";
import authServices from "../../services/AuthServices";
import { useNavigate } from "react-router-dom";
import VisibilityIcon from "@mui/icons-material/Visibility";
import VisibilityOffIcon from "@mui/icons-material/VisibilityOff";
import AlertConfirm from "react-alert-confirm";
const Register = () => {
  const [visibility, setVisibility] = useState(false);
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleSumbit = (e) => {
    e.preventDefault();
    var spans = document.querySelectorAll(".validator");
    spans.forEach((span) => {
      span.innerHTML = "";
    });
    if (!username || !password || !email)
      return setError("Please fill in all fields");
    if (!email.includes("@")) {
      document.getElementById("email-validator").innerHTML =
        "Please enter a valid email";
      return;
    }
    if (password.length < 6) {
      document.getElementById("password-validator").innerHTML =
        "Password must be at least 6 characters long";
      return;
    }
    if (!password.match(/[A-Z]/g)) {
      document.getElementById("password-validator").innerHTML =
        "Password must contain at least one uppercase letter";
      return;
    }
    if (!password.match(/[0-9]/g)) {
      document.getElementById("password-validator").innerHTML =
        "Password must contain at least one number";
      return;
    }
    if (!password.match(/[!@#$%^&*(),.?":{}|<>]/g)) {
      document.getElementById("password-validator").innerHTML =
        "Password must contain at least one special character";
      return;
    }

    authServices.register(username, password, email).then(
      () => {
        AlertConfirm.alert(
          "You have successfully registered your account!"
        ).then(() => {
          navigate("/login");
        });
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
        <h1 className="register-title">REGISTRATION</h1>
        <form className="register-form">
          <div className="register-form-email">
            <label htmlFor="email">EMAIL</label>
            <input
              className="form-input"
              type="email"
              name="email"
              id="email"
              onChange={(e) => setEmail(e.target.value)}
            />
            <span className="validator" id="email-validator"></span>
          </div>{" "}
          <div className="register-form-email">
            <label htmlFor="email">USERNAME</label>
            <input
              className="form-input"
              name="username"
              id="username"
              onChange={(e) => setUsername(e.target.value)}
            />
            <span className="validator" id="username-validator"></span>
          </div>
          <div className="register-form-password">
            <label htmlFor="password">PASSWORD</label>
            {visibility ? (
              <VisibilityIcon
                className="visible"
                onClick={() => setVisibility(!visibility)}
              />
            ) : (
              <VisibilityOffIcon
                className="visible"
                onClick={() => {
                  setVisibility(!visibility);
                }}
              />
            )}
            <input
              className="form-input"
              type={visibility ? "text" : "password"}
              name="password"
              id="password"
              onChange={(e) => setPassword(e.target.value)}
            />
            <span className="validator" id="password-validator"></span>
          </div>
          <div className="register-form-submit">
            <input
              className="register-form-submit-button"
              type="submit"
              value="REGISTER"
              onClick={handleSumbit}
            />
          </div>
        </form>
        <p className="error-message">{error}</p>
        <Link to="/login">
          <div className="navigate-login">
            <p>ALREADY HAVE AN ACCOUNT?</p>
          </div>
        </Link>
      </div>
    </div>
  );
};
export default Register;
