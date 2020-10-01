const createError = require("http-errors");
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const dotenv = require("dotenv");

const indexRouter = require("./routes/index");

// use config/NODE_ENV.env as config
dotenv.config({
  path: path.resolve(__dirname, `../config/${process.env.NODE_ENV}.env`),
});

const app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  const NOT_FOUND_ERROR = 404;

  next(createError(NOT_FOUND_ERROR));
});

// error handler
app.use(function (err, req, res) {
  const INTERNAL_ERROR_CODE = 500;

  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || INTERNAL_ERROR_CODE);
  res.render("error");
});

module.exports = app;
