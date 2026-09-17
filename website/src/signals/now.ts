import { createSignal, onCleanup, onMount } from "solid-js";

export function createNowSignal() {
	const [now, setNow] = createSignal(new Date());

	onMount(() => {
		const interval = setInterval(() => {
			setNow(new Date());
		}, 1000);

		onCleanup(() => clearInterval(interval));
	});

	return now;
}
