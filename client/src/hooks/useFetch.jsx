import { useState, useEffect } from "react";
import { makeRequest } from "../services/request";
const useFetch = (url, options) => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);
  useEffect(() => {
    const getData = async () => {
      try {
        setLoading(true);
        const res = await makeRequest.get(url);
        setData(res.data.data);
      } catch (errors) {
        setError(true);
      }
      setLoading(false);
    };
    getData();
  }, [url]);
  return { data, loading, error };
};

export default useFetch;
