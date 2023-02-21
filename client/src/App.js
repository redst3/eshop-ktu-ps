import "./App.css";
import { createBrowserRouter, RouterProvider, Route } from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <span>Home</span>,
  },
  {
    path: "/products/",
    element: <span>Products</span>,
  },
  {
    path: "/products/:id",
    element: <span>Product</span>,
  },
]);
function App() {
  return (
    <div className="App">
      <RouterProvider router={router} />
    </div>
  );
}

export default App;
