import "./App.scss";
import { createBrowserRouter, RouterProvider, Outlet } from "react-router-dom";
import Home from "./pages/Home";
import Products from "./pages/Products";
import Product from "./pages/Product";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import LoginPage from "./pages/UserPages/LoginPage";
import RegisterPage from "./pages/UserPages/RegisterPage";
import { motion } from "framer-motion";
import ProtectedRoutes from "./services/protectedRoutes";

const Layout = () => {
  return (
    <motion.div
      className="app"
      initial={{ opacity: 0.2 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 1.5 }}
    >
      <Navbar />
      <Outlet />
      <Footer />
    </motion.div>
  );
};

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <Home />,
      },
      {
        path: "/login",
        element: <LoginPage />,
      },
      {
        path: "/register",
        element: <RegisterPage />,
      },
      {
        path: "/products/:id",
        // element: <ProtectedRoutes requiredRole={"user"} page={<Products />} />,
        element: <Products />,
      },
      {
        path: "/product/:id",
        element: <Product />,
      },
    ],
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
