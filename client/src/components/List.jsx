import React from "react";
import { Card } from "./Card";
import "./styles.scss";

const List = () => {
  const data = [
    {
      id: 1,
      img: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      img2: "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      title: "Product 1",
      author: "Author 1",
      isNew: true,
      oldPrice: 100,
      newPrice: 50,
    },
    {
      id: 2,
      img: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      img2: "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      title: "Product 2",
      author: "Author 1",
      isNew: true,
      oldPrice: 100,
      newPrice: 50,
    },
    {
      id: 3,
      img: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      img2: "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      title: "Product 3",
      author: "Author 1",
      isNew: true,
      oldPrice: 100,
      newPrice: 50,
    },
  ];
  return (
    <div className="listCards">
      {data?.map((item) => (
        <Card item={item} key={item.id} />
      ))}
    </div>
  );
};
export default List;
