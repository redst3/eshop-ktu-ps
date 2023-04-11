"use strict";

/**
 * order controller
 */
const stripe = require("stripe")(process.env.REACT_APP_STRIPE_SK);
const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::order.order", ({ Strapi }) => ({
  async CreateOrderOnSuccess(ctx) {
    try {
      const {
        amount,
        id,
        userId,
        products,
        total_cost,
        email,
        shipping_address,
      } = ctx.request.body;
      const payment = await stripe.paymentIntents.create({
        amount,
        currency: "EUR",
        description: `Ordered by ${email} for ${products.length} products`,
        payment_method: id,
        confirm: true,
      });
      if (payment.status === "succeeded") {
        // create order logic here

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
