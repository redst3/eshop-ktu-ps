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
    <div className="cart p01hz">
      <h1 className="p01hz">Currently selected items</h1>
      {data?.map((item) => (
        <div className="item p01hz" key={item.id}>
          <img className="p01hz" src={item.img} alt={item.id} />
          <div className="info p01hz">
            <h1 className="p01hz">{item.title}</h1>
            <p className="p01hz">{item.desc?.substring(0, 70)}</p>
            <div className="price p01hz">1 x {item.newPrice}</div>
          </div>
          <div className="p01hz">
            <DeleteOutlinedIcon className="delete" />
          </div>
        </div>
      ))}
      <div className="total p01hz">
        <span className="p01hz">PRICE</span>
        <span className="p01hz">mnogo</span>
      </div>
      <div className="checkout-button p01hz">
        <button className="checkout p01hz">Checkout</button>
      </div>
      <span className="reset-cart p01hz">Reset cart</span>
    </div>
  );
};

export default Cart;
