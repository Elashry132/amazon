//imports from package
const express = require("express");
const mongoose = require("mongoose");

//imports from other files
const authRouter = require("./routes/auth");
const adminRoute = require("./routes/admin");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//init
const PORT = 3000;

const app = express();
const DB = process.env.DB;

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successfull");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, process.env.HOSTNAME, () => {
  console.log(`Server is running on port ${PORT}`);
});
