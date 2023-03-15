import axios from "axios";
import jwt from "jwt-decode";
const API_URL = "http://localhost:5246/api";

class AuthService {
  async login(username, password) {
    var data = JSON.stringify({
      userName: username,
      password: password,
    });
    var config = {
      method: "post",
      url: API_URL + "/login",
      headers: {
        "Content-Type": "application/json",
      },
      data: data,
    };
    const response = await axios(config);
    if (response.data.accessToken) {
      const user = jwt(response.data.accessToken);
      const token_1 = response.data.accessToken;
      sessionStorage.setItem("user", JSON.stringify(user));
      sessionStorage.setItem("token", token_1);
      sessionStorage.setItem("userchange", true);
      let roles =
        user["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"];
      if (roles.length === 3) {
        sessionStorage.setItem("role", "Admin");
      } else {
        sessionStorage.setItem("role", roles);
      }
      return user.sub;
    }
    return response.data;
  }
  logout() {
    sessionStorage.clear();
    sessionStorage.setItem("userchange", true);
  }
  async register(username, password, email) {
    var data = JSON.stringify({
      userName: username,
      email: email,
      password: password,
    });
    var config = {
      method: "post",
      url: API_URL + "/register",
      headers: {
        "Content-Type": "application/json",
      },
      data: data,
    };
    const response = await axios(config);
    return response.data;
  }
}
const authServices = new AuthService();
export default authServices;
