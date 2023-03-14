import axios from "axios";

const API_URL = "http://localhost:5246/api/wishlists/";

class WishlistService {
  getWishList(userId) {
    var data = "";

    var config = {
      method: "get",
      maxBodyLength: Infinity,
      url: API_URL + userId,
      headers: {},
      data: data,
    };
    console.log(config);
    axios(config)
      .then(function (response) {
        sessionStorage.setItem("wishlist", response.data.productIds);
      })
      .catch(function (error) {
        console.log(error);
      });
  }
  addToWishList(userId, productId) {
    var data = "";

    var config = {
      method: "put",
      maxBodyLength: Infinity,
      url: API_URL + userId + "/" + productId,
      headers: {},
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
      headers: {},
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