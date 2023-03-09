import React from "react";
import GitHubIcon from "@mui/icons-material/GitHub";
import LinkedInIcon from "@mui/icons-material/LinkedIn";
import CopyrightIcon from "@mui/icons-material/Copyright";
import { motion } from "framer-motion";
import { Link } from "react-router-dom";
const Footer = () => {
  return (
    <div className="footer">
      <div className="left">
        <span>Redas Steckys</span>
      </div>
      <div className="center">
        <CopyrightIcon />
        <span> 2023</span>
      </div>
      <div className="right">
        <motion.div whileHover={{ scale: 1.15 }}>
          <Link to="https://github.com/redst3" target="_blank">
            <GitHubIcon />
          </Link>
        </motion.div>
        <motion.div whileHover={{ scale: 1.15 }}>
          <Link
            to="https://lt.linkedin.com/in/redas-steckys-5b3612214"
            target="_blank"
          >
            <LinkedInIcon />
          </Link>
        </motion.div>
      </div>
    </div>
  );
};
export default Footer;
