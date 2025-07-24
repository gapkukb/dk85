import { useUser } from "@/stores/user.store";
import { type SetupContext, type SlotsType, type VNode } from "vue";

interface AuthenticationSlots {
  default: (props: { authenticated: boolean; login: Function }) => VNode[]; // Example: default slot with a prop 'msg'
}

/**
 * 逻辑组件，适用于判断登录的ui场景，仅支持单子元素
 */
export default function Authentication(
  props: any,
  ctx: SetupContext<null, SlotsType<AuthenticationSlots>>
) {
  const { authenticated } = useUser();

  function login() {
    alert("login");
  }

  if (!ctx.slots.default) return null;

  const vNode = ctx.slots.default({ authenticated, login })?.[0];

  if (authenticated) return vNode;

  return {
    ...vNode,
    props: {
      onClick: login,
    },
  };
}
