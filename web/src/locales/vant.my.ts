// vant 缅甸语言

export default {
  name: 'နာမည်',
  tel: 'တယ်လီဖုန်း',
  save: 'ကယ်တင်ပါ။',
  clear: 'ရှင်းပါတယ်။',
  cancel: 'မလုပ်တော့',
  confirm: 'သေချာတယ်။',
  delete: 'ဖျက်ပါ။',
  loading: 'ဒိန်း...',
  noCoupon: 'ကူပွန်များ မရှိသေးပါ။',
  nameEmpty: 'သင့်အမည်ကို ဖြည့်ပါ။',
  addContact: 'အဆက်အသွယ်တစ်ခုထည့်ပါ။',
  telInvalid: 'ဖုန်းနံပါတ်အမှန်ကိုဖြည့်ပါ။',
  vanCalendar: {
    end: 'ပြီးအောင်',
    start: 'စတင်ပါ။',
    title: 'ရက်စွဲရွေးချယ်မှု',
    weekdays: ['ခုနစ်', 'ရှင်', 'နှစ်', 'သုံး', 'လေး', 'ငါး ', 'ခြောက်'],
    monthTitle: (year: number, month: number) => `${year}နှစ်${month}လ `,
    rangePrompt: (maxRange: number) => `${maxRange} ရက်အထိ ရွေးပါ။`,
  },
  vanCascader: {
    select: 'ကျေးဇူးပြု၍ ရွေးချယ်ပါ။',
  },
  vanPagination: {
    prev: 'ယခင်စာမျက်နှာ',
    next: 'နောက်စာမျက်နှာ',
  },
  vanPullRefresh: {
    pulling: 'ပြန်လည်စတင်ရန် အောက်သို့ဆွဲချပါ။...',
    loosing: 'ပြန်လည်ဆန်းသစ်ရန် လွှတ်ပါ။...',
  },
  vanSubmitBar: {
    label: 'စုစုပေါင်း:',
  },
  vanCoupon: {
    unlimited: 'တံခါးမရှိ',
    discount: (discount: number) => `${discount} လျှော့စျေး`,
    condition: (condition: number) => `ယွမ် ${condition} နှင့်အထက် ဝယ်ယူနိုင်ပါသည်။`,
  },
  vanCouponCell: {
    title: 'ကူပွန်များ',
    count: (count: number) => `ကဒ် ${count} ရရှိပါသည်။`,
  },
  vanCouponList: {
    exchange: 'လဲလှယ်',
    close: 'အသုံးမပြုပါ။',
    enable: 'ရရှိနိုင်ပါသည်။',
    disabled: 'မရနိုင်ပါ။',
    placeholder: 'ကူပွန်ကုဒ်ကို ရိုက်ထည့်ပါ။',
  },
  vanAddressEdit: {
    area: 'ဧရိယာ',
    areaEmpty: 'သင့်ဒေသကို ရွေးချယ်ပါ။',
    addressEmpty: 'လိပ်စာအသေးစိတ်ဖြည့်ပေးပါ။',
    addressDetail: 'အသေးစိတ်လိပ်စာ',
    defaultAddress: 'မူရင်းပေးပို့လိပ်စာအဖြစ် သတ်မှတ်ပါ။',
  },
  vanAddressList: {
    add: 'လိပ်စာအသစ်',
  },
};