import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  products: [],
};

export const cartSlice = createSlice({
  name: "counter",
  initialState,
  reducers: {
    addProductToCart: (state, action) => {
      const product = action.payload;
      const productInCart = state.products.find(
        (item) => item.id === product.id
      );
      if (productInCart) {
        state.products = state.products.map((item) =>
          item.id === product.id
            ? { ...item, quantity: item.quantity + product.quantity }
            : item
        );
      } else {
        state.products.push(product);
      }
    },
    removeProductFromCart: (state, action) => {
      state.products = state.products.filter(
        (item) => item.id !== action.payload
      );
    },
    resetCart: (state) => {
      state.products = [];
    },
    updateCart: (state, action) => {
      // update cart with items that come from action.payload and check if item is in cart, increase quantity
      state.products = [];
      const products = action.payload;
      products.forEach((product) => {
        const productInCart = state.products.find(
          (item) => item.id === product.id
        );
        if (productInCart) {
          productInCart.quantity += product.quantity;
        } else {
          state.products.push(product);
        }
      });
    },
  },
});

export const {
  addProductToCart,
  removeProductFromCart,
  resetCart,
  updateCart,
} = cartSlice.actions;
export default cartSlice.reducer;
