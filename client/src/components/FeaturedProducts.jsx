import React, { useEffect } from "react";
import "./styles.scss";
import { Card } from "./Card";

export const FeaturedProducts = ({ type }) => {
  useEffect(() => {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("visible");
        } else {
          entry.target.classList.remove("visible");
        }
      });
    });
    const hiddenCards = document.querySelectorAll(".bottom");
    hiddenCards.forEach((card) => {
      observer.observe(card);
    });
  }, []);
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
    {
      id: 4,
      img: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      img2: "https://images.pexels.com/photos/1669754/pexels-photo-1669754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      title: "Product 4",
      author: "Author 1",
      isNew: true,
      oldPrice: 100,
      newPrice: 50,
    },
  ];

  return (
    <div className="featuredProducts">
      <div className="top">
        <h1>{type} Products</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent
          sollicitudin urna vitae urna commodo porttitor. Praesent consequat
          accumsan eros, et ullamcorper magna ullamcorper malesuada. Morbi
          dignissim porta lacinia. In convallis at urna at finibus. Mauris
          dignissim tortor ac nunc condimentum, vestibulum feugiat quam
          efficitur. Donec neque es
        </p>
      </div>
      <div className="bottom">
        {data.map((item) => (
          <Card item={item} key={item.id} />
        ))}
      </div>
    </div>
  );
};
