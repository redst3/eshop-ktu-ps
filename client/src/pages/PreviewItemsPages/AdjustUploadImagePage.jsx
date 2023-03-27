import React, { useEffect, useState } from "react";
import "./zitempreview.scss";
import { PathLine } from "react-svg-pathline";
import backgroundService from "../../services/BackgroundImageServices";
export const AdjustUploadImagePage = () => {
  const [data, setData] = useState();
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
  useEffect(() => {
    var userId = JSON.parse(sessionStorage.getItem("user")).sub;
    async function fetchData() {
      await backgroundService
        .getBackgroundImage(userId)
        .then((response) => {
          setPixelSize(response.px_to_cm);
          setLoadedImage(true);
          setLoadedContent(response.image.fileContents);
          setLoadedType(response.image.contentType);
        })
        .catch((error) => {
          console.log(error);
        });
    }
    fetchData(userId);
  }, []);
  const handleClick = (e) => {
    if (drawLines === false) return;
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
    if (lines.length === 0) return;
    setLines(lines.slice(0, -1));
    setLinelength(linelength.slice(0, -1));
    setFirstClick(null);
    var allLines = document.querySelectorAll(".line");
    allLines.forEach((line) => {
      line.style.stroke = "red";
    });
    document.querySelector(".image-option-pixels").hidden = true;
  };
  const handleLineClick = (e, length) => {
    if (drawLines) return;

    var lines = document.querySelectorAll(".line");
    lines.forEach((line) => {
      line.style.stroke = "red";
    });
    e.target.style.stroke = "blue";
    setSelectedLineSize(length);
    setLastSelectedLineSize(length);
    document.querySelector(".image-option-pixels").hidden = false;
  };
  const handleUpdate = () => {
    if (drawLines) return;
    if (selectedLineSize === lastSelectedLineSize) return;
    var newSize =
      parseFloat(selectedLineSize) / parseFloat(lastSelectedLineSize);
    var newlengths = [];
    linelength.forEach((length) => {
      newlengths.push((parseFloat(length) * newSize).toFixed(2));
    });
    setPixelSize(newSize);
    setLinelength(newlengths);
    var lines = document.querySelectorAll(".line");
    lines.forEach((line) => {
      line.style.stroke = "red";
    });
    document.querySelector(".image-option-pixels").hidden = true;
  };
  const handleUpload = async () => {
    var status = document.getElementById("status");
    if (selectedImage === null) {
      status.innerHTML = "Image cannot be empty!";
      status.style.color = "red";
      return;
    }
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
      })
      .catch((err) => {
        status.innerHTML = err;
        status.style.color = "red";
      });
  };

  return (
    <div className="adjust-upload-page">
      <div className="container">
        <div className="left">
          <h1>Options</h1>
          <div className="image-options">
            <input
              type="file"
              name="myImage"
              onChange={(event) => {
                setSelectedImage(event.target.files[0]);
                setLoadedImage(false);
                setLines([]);
                setLinelength([]);
              }}
            />
            <div className="image-option">
              <button
                onClick={() => {
                  setDrawLines(drawLines ? false : true);
                  document.querySelector(".image-option-pixels").hidden = true;
                  var lines = document.querySelectorAll(".line");
                  lines.forEach((line) => {
                    line.style.stroke = "red";
                  });
                }}
              >
                Draw Lines
              </button>
              <span>{drawLines ? "ON" : "OFF"}</span>
            </div>
            <div className="image-option">
              <button onClick={handleUndo}>Undo</button>
            </div>
            <div className="image-option-pixels" hidden>
              <label>Selected Line length in cm</label>
              <input
                type="text"
                value={selectedLineSize}
                onChange={(e) => {
                  setSelectedLineSize(e.target.value);
                }}
              />
              <button onClick={handleUpdate}>Update all line lengths</button>
            </div>
            <div className="image-option">
              <button onClick={handleUpload}>Save image and information</button>
              <span id="status" className="upload-status"></span>
              <button onClick={() => console.log("continue")}>Continue</button>
            </div>
            <div className="image-option">
              <span>Pixel size - {pixelSize}</span>
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
