import express from "express";

const app = express();

const deley = () =>
  new Promise((res) => setTimeout(res, Math.random() * 10000));

const token = "11111111111ssssss";
app.get("/refresh-token", async (req, res) => {
  res.json({
    access_token: token,
    code: 200,
    status: 1,
    message: "成功生成订单请支付",
    data: { token },
  });

  // res.status(401).end();
});

app.get("/a1", async (req, res) => {
  console.log(
    req.headers.authorization,
    token,
    req.headers.authorization == token
  );
  await deley();
  if (req.headers.authorization != token) {
    res.status(401).end();
  } else {
    res.json({
      code: 200,
      status: 1,
      message: "成功生成订单请支付",
      data: "成功生成订单请支付",
    });
  }
});

app.get("/a2", async (req, res) => {
  await deley();
  if (req.headers.authorization != token) {
    res.status(401).end();
  } else {
    res.json({
      code: 200,
      status: 1,
      message: "成功生成订单请支付",
      data: "成功生成订单请支付",
    });
  }
});

app.get("/a3", async (req, res) => {
  res.json({
    code: 200,
  });
});

app.get("/a4", async (req, res) => {
  res.json([
    {
      code: 200,
    },
    {
      code: 200,
    },
  ]);
});

app.listen(10010);
