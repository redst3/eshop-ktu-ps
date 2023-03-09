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
        productInCart.quantity += action.payload.quantity;
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
  },
});

export const { addProductToCart, removeProductFromCart, resetCart } =
  cartSlice.actions;
export default cartSlice.reducer;
