"use strict";

/**
 * order controller
 */
const stripe = require("stripe")(process.env.REACT_APP_STRIPE_SK);
const { createCoreController } = require("@strapi/strapi").factories;
const { sanitizeEntity } = require("strapi-utils");

module.exports = createCoreController("api::order.order", ({ strapi }) => ({
  async CreateOrderOnSuccess(ctx) {
    try {
      const {
        amount,
        id,
        userId,
        products,
        total_cost,
        email,
        shippingAdress,
      } = ctx.request.body;
      const payment = await stripe.paymentIntents.create({
        amount,
        currency: "EUR",
        description: `Ordered by ${email} for ${products.length} products`,
        payment_method: id,
        confirm: true,
      });
      if (payment.status === "succeeded") {
        var user = userId.length > 0 ? userId : "guest";
        const address = shippingAdress.split(",");
        await strapi.entityService.create("api::order.order", {
          data: {
            OrderId: id,
            userId: user,
            order_status: "created",
            products: products,
            order_date: new Date().toLocaleDateString(),
            total_cost: total_cost,
            email: email,
            shipping_address: {
              country: address[0],
              city: address[1],
              address: address[2],
              postal_code: address[3],
            },
            publishedAt: new Date().getTime(),
          },
        });
        return ctx.send({
          message: "Order created successfully",
          successful: true,
          payment_info: payment,
        });
      }
    } catch (error) {
      return ctx.badRequest("error", error.message);
    }
  },
}));
