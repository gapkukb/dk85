import { useBack, type PlatformRoute } from "@/composables/useBack";
import { type SetupContext } from "vue";

export default function Authentication(
  props: { routes?: PlatformRoute | string; replacement?: boolean },
  ctx: SetupContext
) {
  const back = useBack(props.routes, props.replacement);

  if (!ctx.slots.default)
    return (
      <button onClick={back}>
        <van-icon name="arrow-left" />
      </button>
    );

  const vNode = ctx.slots.default()?.[0];

  return {
    ...vNode,
    props: {
      onClick: back,
    },
  };
}
