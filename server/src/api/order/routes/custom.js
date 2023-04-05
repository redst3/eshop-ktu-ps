module.exports = {
  routes: [
    {
      method: "POST",
      path: "/order/payment",
      handler: "order.CreateOrderOnSuccess",
      config: {},
    },
  ],
};
