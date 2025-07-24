export class UserModel {
  activation!: boolean;
  agentFlag!: boolean;
  birthday!: Date;
  blackFlag!: number;
  branchAddress!: string;
  branchCode!: string;
  branchName!: string;
  branchPhone!: string;
  cashCredit!: number;
  city!: string;
  customerId!: string;
  customerLevel!: number;
  customerType!: number;
  firstDepositDate!: Date;
  firstDepositFlag!: boolean;
  firstIdScan!: string;
  firstIdStatus!: string;
  firstIdType!: string;
  firstName!: string;
  firstNoType!: string;
  gameCredit!: number;
  gender!: string;
  glife!: boolean;
  headShot!: string;
  isLazada!: boolean;
  lastLoginDate!: Date;
  lastName!: string;
  loginName!: string;
  loginNameFlag!: number;
  loginPwdFlag!: boolean;
  marginSwitch!: boolean;
  mayaFlag!: boolean;
  mobileNo!: string;
  nationality!: string;
  newWalletFlag!: number;
  nickName!: string;
  oddsType!: number;
  onlineBet!: boolean;
  product!: number;
  registDate!: Date;
  registerMethod!: string;
  silentPhotoSwitch!: boolean;
  whiteListUser!: boolean;
  withdrewPwd!: boolean;

  constructor(json: any) {
    Object.assign(this, json);
  }
}
