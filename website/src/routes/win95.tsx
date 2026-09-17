import { createFileRoute } from "@tanstack/solid-router";
import { createSignal } from "solid-js";
import meImage from "@/assets/me.jpg?url";
import {
	AboutMeText,
	ContactFolderItems,
	ResourcesFolderContents,
} from "@/components/win95/content";
import { Taskbar } from "@/components/win95/taskbar";
import {
	FolderWindow,
	ImageViewerWindow,
	RtfDocumentWindow,
} from "@/components/win95/windows";
import win95Css from "@/styles/win95.css?url";

export const Route = createFileRoute("/win95")({
	component: Home,
	head: () => ({
		links: [{ rel: "stylesheet", href: win95Css }],
	}),
});

type WindowId =
	| "about-me-window"
	| "profile-pic-window"
	| "resources-window"
	| "contact-window";

function Home() {
	const [focusedWindow, setFocusedWindow] =
		createSignal<WindowId>("about-me-window");

	const windowProps = (id: WindowId) => ({
		id,
		active: focusedWindow() === id,
		onFocus: () => setFocusedWindow(id),
	});

	return (
		<>
			<main>
				<RtfDocumentWindow
					fakeDocumentPath="C:\Documents\about_me.rtf"
					{...windowProps("about-me-window")}
				>
					<AboutMeText />
				</RtfDocumentWindow>

				<ImageViewerWindow
					fakeImageFilename="C:\Documents\me.jpg"
					statusText="JPEG image - 73.3 kB"
					{...windowProps("profile-pic-window")}
				>
					<img src={meImage} alt="Magnus Bergmark, profile from the front." />
				</ImageViewerWindow>

				<FolderWindow
					folderPath="C:\Documents\Resources"
					{...windowProps("resources-window")}
				>
					<ResourcesFolderContents />
				</FolderWindow>

				<FolderWindow
					folderPath="C:\Documents\Contact"
					{...windowProps("contact-window")}
				>
					<ContactFolderItems />
				</FolderWindow>
			</main>
			<Taskbar />
		</>
	);
}
