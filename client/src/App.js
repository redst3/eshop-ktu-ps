import "./App.scss";
import { createBrowserRouter, RouterProvider, Outlet } from "react-router-dom";
import Home from "./pages/Home";
import AllProducts from "./pages/AllProducts";
import Products from "./pages/Products";
import Product from "./pages/Product";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import LoginPage from "./pages/UserPages/LoginPage";
import RegisterPage from "./pages/UserPages/RegisterPage";
import { motion } from "framer-motion";
import ProtectedRoutes from "./services/protectedRoutes";
import { WishlistPage } from "./pages/UserPages/WishlistPage";
import { ErrorPage } from "./pages/ErrorPage";
import { AdjustUploadImagePage } from "./pages/PreviewItemsPages/AdjustUploadImagePage";
import { PreviewItemsAferAdjustPage } from "./pages/PreviewItemsPages/PreviewItemsAfterAdjustPage";
import { OrderHistoryPage } from "./pages/UserPages/OrderHistoryPage";
import { ConfirmOrdersPage } from "./pages/AdminPages/ConfirmOrdersPage";

const Layout = (error) => {
  if (error.error) {
    return (
      <motion.div className="app">
        <Navbar />
        <ErrorPage />
        <Footer />
      </motion.div>
    );
  } else {
    return (
      <motion.div className="app">
        <Navbar />
        <Outlet />
        <Footer />
      </motion.div>
    );
  }
};

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    errorElement: <Layout error />,
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
        path: "/products",
        element: <AllProducts />,
      },
      {
        path: "/products/:id",
        element: <Products />,
      },
      {
        path: "/product/:id",
        element: <Product />,
      },
      {
        path: "/preview/upload",
        element: (
          <ProtectedRoutes
            requiredRole={"User"}
            page={<AdjustUploadImagePage />}
          />
        ),
      },
      {
        path: "/preview/preview-items",
        element: (
          <ProtectedRoutes
            requiredRole={"User"}
            page={<PreviewItemsAferAdjustPage />}
          />
        ),
      },
      {
        path: "/user/wishlist",
        element: (
          <ProtectedRoutes requiredRole={"User"} page={<WishlistPage />} />
        ),
      },
      {
        path: "/user/orders",
        element: (
          <ProtectedRoutes requiredRole={"User"} page={<OrderHistoryPage />} />
        ),
      },
      {
        path: "/admin/orders",
        element: (
          <ProtectedRoutes
            requiredRole={"Admin"}
            page={<ConfirmOrdersPage />}
          />
        ),
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
