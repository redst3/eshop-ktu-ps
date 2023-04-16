import React from "react";
import { motion } from "framer-motion";
import "./styles.scss";
export const Tutorial = () => {
  return (
    <div className="tutorial">
      <div className="container">
        <div className="left">
          <h3>Contents</h3>
          <div className="options">
            <motion.a whileHover={{ scale: 1.1 }} href="#upload-image">
              Upload image
            </motion.a>
            <motion.a whileHover={{ scale: 1.1 }} href="#draw-lines">
              Draw lines
            </motion.a>
            <motion.a whileHover={{ scale: 1.1 }} href="#update-lines">
              Update line lengths
            </motion.a>
            <motion.a whileHover={{ scale: 1.1 }} href="#save-lines">
              Save information
            </motion.a>
            <motion.a whileHover={{ scale: 1.1 }} href="#preview">
              Preview items
            </motion.a>
            <motion.a whileHover={{ scale: 1.1 }} href="#preview-options">
              Possible preview options
            </motion.a>
            <motion.a whileHover={{ scale: 1.1 }} href="#save">
              Update your cart
            </motion.a>
          </div>
        </div>
        <div className="right">
          <div id="upload-image" className="tutorial-part">
            <h1>Upload image</h1>
            <p>
              To start image preview first of all you need to upload an image of
              your wall. You can do it by clicking on the "Upload image" button
              and selecting an image from your computer. Best results will be if
              the image is taken from the front.
            </p>
          </div>
          <div id="draw-lines" className="tutorial-part">
            <h1>Draw lines</h1>
            <p>
              After you uploaded an image you can start drawing lines. To do
              that click on the "Draw lines" button. You can draw lines by
              clicking on the image at the points where you want to start and
              end. To undo an image click on the "Undo" button.
            </p>
          </div>
          <div id="update-lines" className="tutorial-part">
            <h1>Update line lengths</h1>
            <p>
              To update the line lengths to the correct ones you need to disable
              line drawing, click on the drawn line and write the correct length
              in the input field. To save the line length click on the "Update
              all line lengths" button.
            </p>
          </div>
          <div id="save-lines" className="tutorial-part">
            <h1>Save information</h1>
            <p>
              After you checked if the line lengths are correct you can save the
              information by clicking on the "Save image and information"
              button. This will save the image and the line lengths so you will
              not have to do it again. Now you can start previewing the items.
            </p>
          </div>
          <div id="preview" className="tutorial-part">
            <h1>Preview items</h1>
            <p>
              To preview the items you need to click on the "Continue" button.
              You will be redirected to the preview page where you can see the
              items you have added to your cart. You can also add items to your
              cart from this page.
            </p>
          </div>
          <div id="preview-options" className="tutorial-part">
            <h1>Possible preview options</h1>
            <p>
              You can preview the items in 2 different ways. You can preview the
              items that are in your shopping cart, or you can preview all the
              items that are in the store. To change the item preview click
              All/Cart button on the top.
            </p>
          </div>
          <div className="tutorial-part">
            <h1>Drag or adjust items on your wall</h1>
            <p>
              You can click on the item and it will show up on your wall. Then
              you can drag it to the place where you want it to be. Measurements
              will be updated from previous line adjustments.
            </p>
          </div>
          <div id="save" className="tutorial-part">
            <h1>Update your cart</h1>
            <p>
              After you previewed the items you can add all of them that are on
              the wall to your cart by clicking "Update cart with products on
              the background".
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};
