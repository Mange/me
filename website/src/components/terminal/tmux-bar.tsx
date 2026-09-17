import { Link } from "@tanstack/solid-router";
import { children, type ParentComponent } from "solid-js";
import { createNowSignal } from "@/signals/now";

import styles from "./tmux-bar.module.css";

export function TmuxBar() {
	const now = createNowSignal();

	return (
		<footer class={styles["tmux-bar"]}>
			<div class={styles.content}>
				<div class={styles.left}>
					<Section level={2}>0</Section>
					<SectionPyramidSeparator from={2} to={1} />
					<SectionPyramidSeparator from={1} to={4} />
					<Section level={4}>1: terminal</Section>
					<SectionPyramidSeparator from={4} to={1} />
					<SectionPyramidSeparator from={1} to={2} />
					<Link to="/win95" reloadDocument>
						<Section level={2}>2: win95</Section>
					</Link>
					<SectionPyramidSeparator from={2} to={0} />
				</div>

				<div class={styles.right}>
					<SectionPyramidSeparator from={0} to={3} right />
					<Section level={3}>
						<DisplayDate now={now()} />
					</Section>
					<SectionChevronSeparator level={3} right />
					<Section level={3}>
						<DisplayTime now={now()} />
					</Section>
					<SectionPyramidSeparator from={3} to={4} right />
					<Section level={4}>mange.dev</Section>
				</div>
			</div>
		</footer>
	);
}

function DisplayDate(props: { now: Date }) {
	const dateFormatter = Intl.DateTimeFormat(undefined, { dateStyle: "short" });

	return <span>{dateFormatter.format(props.now)}</span>;
}

function DisplayTime(props: { now: Date }) {
	const timeFormatter = Intl.DateTimeFormat(undefined, { timeStyle: "medium" });

	return <span>{timeFormatter.format(props.now)}</span>;
}

type SectionLevel = 0 | 1 | 2 | 3 | 4;

type SectionProps = {
	level: SectionLevel;
};

const Section: ParentComponent<SectionProps> = (props) => {
	const inner = children(() => props.children);
	return (
		<div class={styles.section} data-level={props.level}>
			{inner()}
		</div>
	);
};

type SectionPyramidSeparatorProps = {
	from: SectionLevel;
	to: SectionLevel;
	right?: boolean;
};

const SectionPyramidSeparator: ParentComponent<SectionPyramidSeparatorProps> = (
	props,
) => {
	return (
		<div
			class={styles.pyramid}
			data-from={props.from}
			data-to={props.to}
			data-dir={props.right ? "right" : "left"}
		>
			<div />
		</div>
	);
};

type SectionChevronSeparatorProps = {
	level: SectionLevel;
	right?: boolean;
};

const SectionChevronSeparator: ParentComponent<SectionChevronSeparatorProps> = (
	props,
) => {
	return (
		<div
			class={styles.chevron}
			data-level={props.level}
			data-dir={props.right ? "right" : "left"}
		></div>
	);
};
