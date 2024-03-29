import axios from "axios";

const API_URL = process.env.REACT_APP_USER_API + "/backgroundimages/";

class BackgroundImageService {
  async uploadBackgroundInformation(userId, file, px_to_cm) {
    var formdata = new FormData();
    if (file !== null) {
      formdata.append("background", file, file.name);
    }
    formdata.append("px_to_cm", px_to_cm.toFixed(3));
    let config = {
      method: "post",
      maxBodyLength: Infinity,
      url: API_URL + userId,
      headers: { Authorization: "Bearer " + sessionStorage.getItem("token") },
      data: formdata,
    };
    await axios
      .request(config)
      .then(() => {
        return true;
      })
      .catch((error) => {
        return error;
      });
  }
  async getBackgroundImage(userId) {
    let config = {
      method: "get",
      maxBodyLength: Infinity,
      url: API_URL + userId,
      headers: {
        Authorization: "Bearer " + sessionStorage.getItem("token"),
      },
    };
    const response = await axios(config);
    return response.data;
  }
}

const backgroundService = new BackgroundImageService();
export default backgroundService;
