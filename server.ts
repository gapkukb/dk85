import express from "express";
import cors from "cors";

const randomAwait = (max = 1000, spec?: number) =>
  new Promise((resolve) => {
    setTimeout(resolve, spec ?? Math.random() * max);
  });

const randomToken = () => Math.random().toString(32);

const app = express();
app.use(cors());
app.use(function (a, b, next) {
  b.setHeader("Cache-Control", "no-store");
  next();
});

let token = randomToken();

// setInterval(() => {
//   token = randomToken();
// }, 30000);

const user = {
  name: "张三",
  age: 18,
  sex: 0,
};

app.get("/user", async (req, res) => {
  await randomAwait();
  if (req.headers.authorization === `${token}`) {
    res.json({
      code: 200,
      msg: null,
      data: user,
    });
  } else {
    res.status(401).json({ code: 401, msg: "111111111111" });
  }
});

app.get("/users", (req, res) => {
  res.json({
    code: 200,
    msg: null,
    data: [user, user, user, user, user],
  });
});

app.get("/login", async (req, res) => {
  await randomAwait();
  res.json({
    code: 200,
    msg: null,
    data: {
      token: token,
      refreshToken: token,
    },
  });
});

app.get("/refresh", async (req, res) => {
  // await randomAwait(undefined,10000);
  res.json({
    code: 200,
    msg: null,
    data: {
      token: token,
    },
  });
});

app.listen("9000", (err) => {
  console.log("running at port : 9000");
});
