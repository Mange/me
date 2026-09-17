import { children, type ParentComponent } from "solid-js";

import styles from "./prompt.module.css";

export const Prompt: ParentComponent = (props) => {
	const resolved = children(() => props.children);

	return (
		<div aria-hidden="true">
			<span class={styles.user}>visitor@mange.dev</span>{" "}
			<span class={styles.dir}>~</span> <span class={styles.symbol}>$</span>{" "}
			{resolved()}
		</div>
	);
};
