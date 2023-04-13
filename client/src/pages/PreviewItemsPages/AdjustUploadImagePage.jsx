import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./zitempreview.scss";
import { PathLine } from "react-svg-pathline";
import backgroundService from "../../services/BackgroundImageServices";
import { motion } from "framer-motion";
import AlertConfirm from "react-alert-confirm";
export const AdjustUploadImagePage = () => {
  const navigate = useNavigate();
  const [next, setNext] = useState("disabled");
  const [lines, setLines] = useState([]);
  const [linelength, setLinelength] = useState([]);
  const [loadedImage, setLoadedImage] = useState(false);
  const [loadedContent, setLoadedContent] = useState(null);
  const [loadedType, setLoadedType] = useState(null);
  const [selectedImage, setSelectedImage] = useState(null);
  const [firstClick, setFirstClick] = useState(null);
  const [drawLines, setDrawLines] = useState(false);
  const [pixelSize, setPixelSize] = useState(1);
  const [selectedLineSize, setSelectedLineSize] = useState(0);
  const [lastSelectedLineSize, setLastSelectedLineSize] = useState(0);
  AlertConfirm.config({
    maskClosable: true,
    okText: "Continue",
    cancelText: "Cancel",
  });
  useEffect(() => {
    var userId = JSON.parse(sessionStorage.getItem("user")).sub;
    document.getElementById("continue").disabled = true;
    async function fetchData() {
      try {
        await backgroundService
          .getBackgroundImage(userId)
          .then((response) => {
            setPixelSize(response.px_to_cm);
            setLoadedImage(true);
            setLoadedContent(response.image.fileContents);
            setLoadedType(response.image.contentType);
          })
          .catch(() => {
            console.log("No image found");
            setLoadedImage(false);
          });
      } catch {}
    }
    fetchData(userId);
  }, []);
  const handleClick = (e) => {
    if (drawLines === false) return;
    document.getElementById("status").innerHTML = "";
    var rect = document.querySelector(".line-frame").getBoundingClientRect();
    var x = e.clientX - rect.left; //x position within the element.
    var y = e.clientY - rect.top; //y position within the element.
    if (firstClick === null) {
      setFirstClick([x, y]);
      return;
    }
    var distanceSquared = Math.sqrt(
      Math.pow(firstClick[0] - x, 2) + Math.pow(firstClick[1] - y, 2)
    ).toFixed(0);
    setLines([
      ...lines,
      [
        { x: firstClick[0], y: firstClick[1] },
        { x: x, y: y },
      ],
    ]);
    setLinelength([...linelength, (distanceSquared * pixelSize).toFixed(2)]);
    setFirstClick(null);
  };
  const handleUndo = () => {
    document.getElementById("status").innerHTML = "";
    if (lines.length === 0) return;
    setLines(lines.slice(0, -1));
    setLinelength(linelength.slice(0, -1));
    setFirstClick(null);
    var allLines = document.querySelectorAll(".line");
    allLines.forEach((line) => {
      line.style.stroke = "red";
    });
    document.querySelector(".image-option-pixels").style = "display:none";
  };
  const handleLineClick = (e, length) => {
    if (drawLines) return;
    document.getElementById("status").innerHTML = "";
    var lines = document.querySelectorAll(".line");
    lines.forEach((line) => {
      line.style.stroke = "red";
    });
    e.target.style.stroke = "blue";
    setSelectedLineSize(length);
    setLastSelectedLineSize(length);
    document.querySelector(".image-option-pixels").style = "display:flex";
  };
  const handleUpdate = () => {
    document.getElementById("status").innerHTML = "";
    if (drawLines) return;
    if (selectedLineSize === lastSelectedLineSize) return;
    if (selectedLineSize <= 0) return;
    if (isNaN(selectedLineSize)) return;
    AlertConfirm("This action will update all line lengths, continue?").then(
      (res) => {
        if (res[0]) {
          var newSize =
            parseFloat(selectedLineSize) / parseFloat(lastSelectedLineSize);
          var newlengths = [];
          linelength.forEach((length) => {
            newlengths.push((parseFloat(length) * newSize).toFixed(2));
          });
          setPixelSize(pixelSize * newSize);
          setLinelength(newlengths);
          var lines = document.querySelectorAll(".line");
          lines.forEach((line) => {
            line.style.stroke = "red";
          });
          document.querySelector(".image-option-pixels").style = "display:none";
        }
      }
    );
  };
  const handleUpload = async () => {
    var status = document.getElementById("status");
    if (status.innerHTML === "Information has been saved successfully!") return;
    var flag = false;
    if (selectedImage) {
      flag = true;
    }
    if (loadedImage) {
      flag = true;
    }

    if (flag) {
      AlertConfirm(
        "This action will save current image and line lengths, continue?"
      ).then(async (res) => {
        if (res[0]) {
          try {
            var userId = JSON.parse(sessionStorage.getItem("user")).sub;
          } catch {
            status.innerHTML = "You are not logged in!";
            status.style.color = "red";
            return;
          }
          await backgroundService
            .uploadBackgroundInformation(userId, selectedImage, pixelSize)
            .then(() => {
              status.innerHTML = "Information has been saved successfully!";
              setNext("");
              document.getElementById("continue").disabled = false;
            })
            .catch((err) => {
              status.innerHTML = err;
              status.style.color = "red";
            });
        }
      });
    }
    if (!flag) {
      status.innerHTML = "Please select an image!";
      status.style.color = "red";
    }
  };
  const handleNavigation = () => {
    navigate("/preview/preview-items");
  };

  return (
    <div className="adjust-upload-page">
      <div className="container">
        <div className="left">
          <h1>Options</h1>
          <div className="image-options">
            <motion.label
              htmlFor="upload"
              className="image-upload"
              whileHover={{ scale: 0.95 }}
            >
              Upload Image
              <input
                id="upload"
                type="file"
                accept="image/jpg, image/jpeg, image/png"
                name="myImage"
                onChange={(event) => {
                  setSelectedImage(event.target.files[0]);
                  setLoadedImage(false);
                  setLines([]);
                  setLinelength([]);
                }}
              />
            </motion.label>
            <div className="image-option">
              <motion.button
                whileHover={{ scale: 0.95 }}
                onClick={() => {
                  setDrawLines(drawLines ? false : true);
                  document.querySelector(".image-option-pixels").style =
                    "display:none";
                  var lines = document.querySelectorAll(".line");
                  lines.forEach((line) => {
                    line.style.stroke = "red";
                  });
                }}
              >
                Draw Lines
              </motion.button>
              <span>{drawLines ? "ON" : "OFF"}</span>
            </div>
            <div className="image-option">
              <motion.button whileHover={{ scale: 0.95 }} onClick={handleUndo}>
                Undo
              </motion.button>
            </div>
            <div className="image-option">
              <motion.button
                whileHover={{ scale: 0.95 }}
                onClick={handleUpload}
              >
                Save image and information
              </motion.button>
              <span id="status" className="upload-status"></span>
              <motion.button
                id="continue"
                onClick={handleNavigation}
                whileHover={{ scale: 0.95 }}
                className={"continue-" + next}
              >
                Continue
              </motion.button>
            </div>
            <div className="image-option-pixels">
              <label>Selected Line length in cm</label>
              <input
                type="number"
                min={10}
                max={10000}
                value={selectedLineSize}
                onChange={(e) => {
                  setSelectedLineSize(e.target.value);
                }}
              />
              <motion.button
                whileHover={{ scale: 0.95 }}
                onClick={handleUpdate}
              >
                Update all line lengths
              </motion.button>
            </div>
          </div>
        </div>
        <div className="right">
          {loadedImage ? ( // This is image that is fetched from database if found
            <div className="image-holder" onClick={handleClick}>
              <img
                alt="not found"
                src={`data:${loadedType};base64,${loadedContent}`}
                type={loadedType}
              />
              <svg className="line-frame">
                {lines.map((line, index) => (
                  <svg className="line-svg" key={index}>
                    <PathLine
                      className="line"
                      points={line}
                      stroke="red"
                      strokeWidth="5"
                      fill="none"
                      r={1}
                      onClick={(e) => handleLineClick(e, linelength[index])}
                    />
                    <title>Line length - {linelength[index]} cm</title>
                  </svg>
                ))}
              </svg>
            </div>
          ) : (
            // This is image that is uploaded
            selectedImage && (
              <div className="image-holder" onClick={handleClick}>
                <img alt="not found" src={URL.createObjectURL(selectedImage)} />
                <svg className="line-frame">
                  {lines.map((line, index) => (
                    <svg className="line-svg" key={index}>
                      <PathLine
                        className="line"
                        points={line}
                        stroke="red"
                        strokeWidth="5"
                        fill="none"
                        r={1}
                        onClick={(e) => handleLineClick(e, linelength[index])}
                      />
                      <title>Line length - {linelength[index]} cm</title>
                    </svg>
                  ))}
                </svg>
              </div>
            )
          )}
        </div>
      </div>
    </div>
  );
};
