import express from "express";

const app = express();

app.get("/test", (req, res) => {
  res.json({
    code: 200,
    status: 1,
    message: "成功生成订单请支付",
    data: {
      channel_card_no: "09694578477",
      channel_name: "MG888 KBZ 卡2",
      code: 200,
      order_sn: "ZF083115150798269C5",
      result: "ok",
      sys_trade_no: "sys_374b71c0-6d09-4c33-a71c-dc8c639ba63f",
      image_url:
        "https://img.okszckoo.com/upload/images/202502/c18cd50f-1025-48dd-af55-c5d49a819cc5.jpg",
    },
  });
});

app.get("/tests", (req, res) => {
  res.json({
    code: 200,
    status: 1,
    message: "成功生成订单请支付",
    data: [{
      channel_card_no: "09694578477",
      channel_name: "MG888 KBZ 卡2",
      code: 200,
      order_sn: "ZF083115150798269C5",
      result: "ok",
      sys_trade_no: "sys_374b71c0-6d09-4c33-a71c-dc8c639ba63f",
      image_url:
        "https://img.okszckoo.com/upload/images/202502/c18cd50f-1025-48dd-af55-c5d49a819cc5.jpg",
    }],
  });
});

app.listen(10010)