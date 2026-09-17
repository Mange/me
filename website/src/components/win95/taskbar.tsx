import { useNavigate } from "@tanstack/solid-router";

import windowIcon from "@/assets/win95icons/w95_3-1.png?url";
import startIcon from "@/assets/win95icons/w95_40-1.png?url";
import speakerIcon from "@/assets/win95icons/w98_loudspeaker_rays-1.png?url";
import { createNowSignal } from "@/signals/now";

export function Taskbar() {
	const navigate = useNavigate();
	const now = createNowSignal();

	return (
		<div class="taskbar">
			<button id="start-button" type="button">
				<img src={startIcon} alt="" class="icon-24" />
				Start
			</button>

			<button
				type="button"
				class="taskbar-window"
				onClick={() => navigate({ to: "/", reloadDocument: true })}
			>
				<img src={windowIcon} alt="" class="icon-16" />
				Terminal
			</button>

			<button type="button" class="taskbar-window active">
				<img src={windowIcon} alt="" class="icon-16" />
				Win95
			</button>

			<div class="taskbar-notifications inset">
				<img src={speakerIcon} alt="" class="icon-16" />
				<DisplayTime now={now()} />
			</div>
		</div>
	);
}

function DisplayTime(props: { now: Date }) {
	const timeFormatter = Intl.DateTimeFormat(undefined, { timeStyle: "short" });

	return <span class="time">{timeFormatter.format(props.now)}</span>;
}
