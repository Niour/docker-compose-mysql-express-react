// import qs from "qs";
// import cors from "cors";
const express = require("express");
// import morgan from "morgan";
// import helmet from "helmet";
const firstRoute = require("./routes/first");

const app = express();

// app.use(morgan("dev"));

// http://expressjs.com/en/4x/api.html#app.settings.table
// https://github.com/expressjs/express/issues/3039
// https://github.com/expressjs/express/issues/4053
// app.set("query parser", function (str: string) {
//     return qs.parse(str, { comma: true });
//   });

app.use(firstRoute);

app.listen(80);
