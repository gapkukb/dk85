export abstract class ISO8601 {
  YMD = "YYYY-MM-DD";
  Hms = "HH:mm:ss";
  YMDHms = this.YMD + " " + this.Hms;
}

export abstract class RFC3339 {
  YMD = "YYYY-MM-DD";
  Hms = "HH:mm:ss";
  YMDHms = this.YMD + " " + this.Hms;
}

export abstract class RFC2822 {
  YMD = "YYYY-MM-DD";
  Hms = "HH:mm:ss";
  YMDHms = this.YMD + " " + this.Hms;
}

export abstract class DateTemplate {
  static Y_M_D = "YYYY-MM-DD";
  static YYYYMMDD = "YYYY/MM/DD";
  static YYYYMMDD = "YYYY/MM/DD";
}
