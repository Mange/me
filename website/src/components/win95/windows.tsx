import { children, type ParentComponent, splitProps } from "solid-js";
import rtfIconSmall from "@/assets/win95icons/w95_2-1.png?url";
import folderOpenIconSmall from "@/assets/win95icons/w95_5-1.png?url";
import paintFileIconSmall from "@/assets/win95icons/w98_paint_file-1.png?url";
import {
	Canvas,
	FolderGrid,
	StatusBar,
	StatusBarItem,
	Window,
	type WindowProps,
} from "./window";

export const ImageViewerWindow: ParentComponent<
	Omit<WindowProps, "title" | "iconSrc"> & {
		fakeImageFilename: string;
		statusText: string;
	}
> = (props) => {
	const [myProps, windowProps] = splitProps(props, [
		"fakeImageFilename",
		"statusText",
		"children",
	]);

	return (
		<Window
			title={`${myProps.fakeImageFilename} - Image Viewer`}
			iconSrc={paintFileIconSmall}
			{...windowProps}
		>
			<div class="image-wrapper">{myProps.children}</div>
			<StatusBar>
				<StatusBarItem>{myProps.statusText}</StatusBarItem>
			</StatusBar>
		</Window>
	);
};

export const RtfDocumentWindow: ParentComponent<
	Omit<WindowProps, "title" | "iconSrc"> & { fakeDocumentPath: string }
> = (props) => {
	const [myProps, windowProps] = splitProps(props, [
		"fakeDocumentPath",
		"children",
	]);

	return (
		<Window
			title={`${myProps.fakeDocumentPath} - WordPad`}
			iconSrc={rtfIconSmall}
			{...windowProps}
		>
			<Canvas>{myProps.children}</Canvas>
			<StatusBar>
				<div
					class="statusbar-item"
					style={{ width: "6ch", flex: "none", "margin-left": "auto" }}
				>
					&nbsp;
				</div>
				<div
					class="statusbar-item"
					style={{ width: "6ch", "text-align": "center", flex: "none" }}
				>
					NUM
				</div>
			</StatusBar>
		</Window>
	);
};

export const FolderWindow: ParentComponent<
	Omit<WindowProps, "title" | "iconSrc"> & { folderPath: string }
> = (props) => {
	const [myProps, windowProps] = splitProps(props, ["folderPath", "children"]);
	const items = children(() => myProps.children);

	return (
		<Window
			title={myProps.folderPath}
			iconSrc={folderOpenIconSmall}
			{...windowProps}
		>
			<FolderGrid>{items()}</FolderGrid>
			<StatusBar>
				<StatusBarItem>{items.toArray().length} object(s)</StatusBarItem>
				<StatusBarItem></StatusBarItem>
			</StatusBar>
		</Window>
	);
};
