import express from "express";

const app = express();

const user = {
  name: "zhangsan",
  age: 19,
  sex: 0,
};

function ok(data: object) {
  return {
    code: 200,
    message: null,
    data,
  };
}

function error(message?: string, code: number = 500) {
  return {
    code,
    message,
    data: null,
  };
}

app.get("/user", (req, res) => {
  res.json(ok(user));
});

app.get("/users", (req, res) => {
  res.json(ok([user, user, user, user, user]));
});

app.listen("10086", (e) => {
  if (e) {
    console.log("runing error",e);
  } else {
    console.log("runing at port : 9000");
  }
});
