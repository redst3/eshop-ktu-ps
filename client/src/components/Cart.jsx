import React from "react";
import "./styles.scss";
import DeleteOutlinedIcon from "@mui/icons-material/DeleteOutlined";

const Cart = () => {
  const data = [
    {
      id: 4,
      img: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      img2: "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      title: "Product 4",
      author: "Author 1",
      desc: "Lorem ipsum dolor siaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      isNew: true,
      oldPrice: 100,
      newPrice: 50,
    },
    {
      id: 1,
      img: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      img2: "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      title: "Product 4",
      author: "Author 1",
      desc: "Lorem ipsum dolor si",
      isNew: true,
      oldPrice: 100,
      newPrice: 50,
    },
  ];
  return (
    <div className="cart">
      <h1>Currently selected items</h1>
      {data?.map((item) => (
        <div className="item" key={item.id}>
          <img src={item.img} alt={item.id} />
          <div className="info">
            <h1>{item.title}</h1>
            <p>{item.desc?.substring(0, 70)}</p>
            <div className="price">1 x {item.newPrice}</div>
          </div>
          <DeleteOutlinedIcon className="delete" />
        </div>
      ))}
      <div className="total">
        <span>PRICE</span>
        <span>mnogo</span>
      </div>
      <div className="checkout-button">
        <button className="checkout">Checkout</button>
      </div>
      <span className="reset-cart">Reset cart</span>
    </div>
  );
};

export default Cart;
