"use strict";

/**
 * order controller
 */
const stripe = require("stripe")(process.env.STRIPE_KEY);
const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::order.order", ({ strapi }) => ({
  async create(ctx) {
    const { userId, products } = ctx.request.body;
    const listItems = await Promise.all(
      products.map(async (product) => {
        const foundProduct = await strapi
          .service("api::product.product")
          .findOne(product.id);

        let x = 1;
        let y = 2;
        return {
          price_data: {
            currency: "eur",
            product_data: {
              name: foundProduct.title,
              // images: [foundProduct.image.url],
            },
            unit_amount: foundProduct.price * 100,
          },
          quantity: product.quantity,
        };
      })
    );
    try {
      const session = await stripe.checkout.sessions.create({
        mode: "payment",
        success_url: process.env.FRONT_URL + "/?success=true",
        cancel_url: process.env.FRONT_URL + "/?success=false",
        line_items: listItems,
        shipping_address_collection: { allowed_countries: ["LT", "LV", "EE"] },
        payment_method_types: ["card"],
      });
      const order_date = new Date(Date.now()).toLocaleString().split(",")[0];
      await strapi.service("api::order.order").create({
        data: { products, order_date, userId },
      });
      return { stripeSession: session };
    } catch (err) {
      ctx.response.status = 222;
      return err;
    }
  },
}));
