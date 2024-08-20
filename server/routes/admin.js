const express = require("express");

const adminRouter = express.Router();

const isAdmin = require("../middlewares/admin");
const Product = require("../models/product");

// add product
adminRouter.post("/admin/add-product", isAdmin, async (req, res) => {
  try {
    const { name, price, description, images, quantity, category } = req.body;
    let product = new Product({
      name,
      price,
      description,
      images,
      quantity,
      category,
    });

    product = await product.save();
    res.json(product);
  } catch (error) {
    return res.status(500).json({
      error: error.message,
    });
  }
});

// get all the products
adminRouter.get("/admin/get-products", async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (error) {
    return res.status(500).json({
      error: error.message,
    });
  }
});

// delete the product
adminRouter.delete("/admin/delete-product", isAdmin, async (req, res) => {
  try {
    const { id } = req.body;
    const product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (error) {
    return res.status(500).json({
      error: error.message,
    });
  }
});

module.exports = adminRouter;
