import { createFileRoute } from "@tanstack/solid-router";
import {
	ContactList,
	Intro,
	Outro,
	ProfilePicture,
	ResourcesList,
} from "@/components/terminal/content";
import { Prompt } from "@/components/terminal/prompt";
import { TmuxBar } from "@/components/terminal/tmux-bar";
import terminalCss from "@/styles/terminal.css?url";

export const Route = createFileRoute("/")({
	component: Home,
	head: () => ({
		links: [
			{ rel: "stylesheet", href: terminalCss },
			{ rel: "preconnect", href: "https://fonts.googleapis.com" },
			{ rel: "preconnect", href: "https://fonts.gstatic.com", crossorigin: "" },
			{
				rel: "stylesheet",
				href: "https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap",
			},
		],
	}),
});

function Home() {
	return (
		<>
			<main>
				<Prompt>cat index.ansi</Prompt>

				<ProfilePicture />
				<Intro />
				<h2>Resources</h2>
				<ResourcesList />
				<h2>Contact</h2>
				<ContactList />
				<Outro />

				<Prompt>
					<div class="caret">&nbsp;</div>
				</Prompt>
			</main>
			<TmuxBar />
		</>
	);
}
