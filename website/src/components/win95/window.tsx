import type { ParentComponent } from "solid-js";

export type WindowProps = {
	id?: string;
	active?: boolean;
	title: string;
	iconSrc: string;
	onFocus?: () => void;
};

export const Window: ParentComponent<WindowProps> = (props) => {
	return (
		<div
			class={`window ${props.active ? "active" : ""}`}
			id={props.id}
			on:click={() => props.onFocus?.()}
		>
			<div class="titlebar">
				<img src={props.iconSrc} alt="" class="icon-16 titlebar-icon" />
				<div class="titlebar-text">{props.title}</div>
				<div class="titlebar-controls">
					<div class="button button-minimize"></div>
					<div class="button button-maximize"></div>
					<div class="button button-close"></div>
				</div>
			</div>
			<div class="content">{props.children}</div>
		</div>
	);
};

export const Canvas: ParentComponent = (props) => {
	return <div class="window-canvas">{props.children}</div>;
};

export const FolderGrid: ParentComponent = (props) => {
	return <div class="folder-grid">{props.children}</div>;
};

export const FolderItem: ParentComponent<{
	href: string;
	iconSrc: string;
	label: string;
}> = (props) => {
	return (
		<div class="folder-item">
			<a href={props.href}>
				<img src={props.iconSrc} alt="" class="icon-32" />
			</a>
			<a href={props.href} class="label">
				{props.label}
			</a>
		</div>
	);
};

export const StatusBar: ParentComponent = (props) => {
	return <div class="statusbar">{props.children}</div>;
};

export const StatusBarItem: ParentComponent = (props) => {
	return <div class="statusbar-item">{props.children}</div>;
};
