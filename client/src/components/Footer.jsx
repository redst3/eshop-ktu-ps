import React from "react";
import GitHubIcon from "@mui/icons-material/GitHub";
import LinkedInIcon from "@mui/icons-material/LinkedIn";
import CopyrightIcon from "@mui/icons-material/Copyright";

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
        <GitHubIcon />
        <LinkedInIcon />
      </div>
    </div>
  );
};
export default Footer;
