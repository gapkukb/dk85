import AbstractLogin from "./AbstractLogin";

export default class LoginViaToken extends AbstractLogin {
  constructor(public token: string, public loginName: string) {
    super();
  }
  login(): Promise<boolean> {
    throw new Error("Method not implemented.");
  }
}
