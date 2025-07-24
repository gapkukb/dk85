import dayjs from "dayjs";
export const dateTemplate = {
  YYYYMMDD: "YYYY-MM-DD HH:mm:ss.sss",
} as const;

function b(c: (typeof dateTemplate)[keyof typeof dateTemplate]) {}

b("YYYY-MM-DD HH:mm:ss.sss");

class Formatter {
  private template!: string;
  constructor(template: string) {
    this.template = template;
  }

  /** 年月日 */
  YYYYMMDD(dateTime: dayjs.ConfigType) {
    dayjs(dateTime).format("YYYY-MM-DD");
  }
  /** 时分秒 */
  HH_mm_ss(dateTime: dayjs.ConfigType) {
    dayjs(dateTime).format("YYYY-MM-DD");
  }
}

const ISO8601 = new Formatter("YYYY-MM-DD HH:mm:ss.sss");
const RFC3339 = new Formatter("YYYY-MM-DD HH:mm:ss.sss");
const RFC2822 = new Formatter("ddd,DD MMM YYYY HH:mm:ss.sss");

export abstract class DateFormatter {
  /** 模板： 1970-01-02 03:04:05 */
  ISO8601(dateTime: dayjs.ConfigType) {
    dayjs(dateTime).format("YYYY-MM-DD HH:mm:ss");
  }

  /** 模板： 70-1-2 3:4:5 */
  ISO8601_simple(dateTime: dayjs.ConfigType) {
    dayjs(dateTime).format("YY-M-D H:m:s");
  }

  ISO8601_YYYY_MM_DD(dateTime: dayjs.ConfigType) {
    dayjs(dateTime).format("YYYY-MM-DD");
  }

  /**
   *
   * @param dateTime any
   * @returns 01:04:59
   */

  HH_MM_SS(dateTime: dayjs.ConfigType) {
    return dayjs(dateTime).format("HH:mm:ss");
  }

  /**
   *
   * @param dateTime any
   * @returns 1:4:59
   */
  simple_HH_MM_SS(dateTime: dayjs.ConfigType) {
    return dayjs(dateTime).format("H:m:s");
  }

  /**
   *
   * @param dateTime any
   * @returns Jun/29 00:00:00
   */
  month_date_time(dateTime: dayjs.ConfigType) {
    return dayjs(dateTime).format("MMM/D HH:mm:ss");
  }
}

export const calendar = {
  YYYYMMDD: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  YYYYMM: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  MMDD: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  DDMM: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  /**  Jun/29  */
  DDDMM: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  /**  Jun/29  */
  HHmmss: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  /**  08:59  */
  HHmm: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
  /**  59:59  */
  mmss: (dateTime: dayjs.ConfigType) => dayjs(dateTime).format("H:m:s"),
} as const;

class SabaOrderStatus {
  static readonly Pending = new SabaOrderStatus("pending");
  static readonly Running = new SabaOrderStatus("running");
  static readonly Reject = new SabaOrderStatus("reject");
  static readonly waiting = new SabaOrderStatus("waiting");

  name!: string;
  private constructor(name: string) {
    this.name = name;
  }
}


function c(d:keyof typeof SabaOrderStatus){}

c()