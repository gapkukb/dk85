import { useUser } from "@/stores/user.store";

export default abstract class AbstractLogin {
  protected setUserInfo(json: any) {
    const user = useUser();
    user.setInfo(json);
  }
  
  abstract login(): Promise<boolean>;
}
