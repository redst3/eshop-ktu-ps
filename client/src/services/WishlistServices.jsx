import axios from "axios";

const API_URL = "https://persuasive-userapi.azurewebsites.net/api/wishlists/";

class WishlistService {
  async getWishList(userId) {
    var data = "";

    var config = {
      method: "get",
      maxBodyLength: Infinity,
      url: API_URL + userId,
      headers: { Authorization: "Bearer " + sessionStorage.getItem("token") },
      data: data,
    };
    const response = await axios(config);
    if (response.status === 200) {
      sessionStorage.setItem("wishlist", response.data.productIds);
    } else {
      console.log(response.statusText);
    }
    // .then(function (response) {
    //   sessionStorage.setItem("wishlist", response.data.productIds);
    //   return true;
    // })
    // .catch(function (error) {
    //   console.log(error);
    // });
  }
  addToWishList(userId, productId) {
    var data = "";

    var config = {
      method: "put",
      maxBodyLength: Infinity,
      url: API_URL + userId + "/" + productId,
      headers: { Authorization: "Bearer " + sessionStorage.getItem("token") },
      data: data,
    };

    axios(config)
      .then(function (response) {})
      .catch(function (error) {
        console.log(error);
      });
  }
  deleteFromWishList(userId, productId) {
    var data = "";

    var config = {
      method: "delete",
      maxBodyLength: Infinity,
      url: API_URL + userId + "/" + productId,
      headers: { Authorization: "Bearer " + sessionStorage.getItem("token") },
      data: data,
    };

    axios(config)
      .then(function (response) {})
      .catch(function (error) {
        console.log(error);
      });
  }
}

const wishServices = new WishlistService();
export default wishServices;
