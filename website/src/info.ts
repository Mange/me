import { parseMarkdown } from "@tanstack/markdown";

import introMarkdown from "./intro.md?raw";

export type ContactInfo = {
	name: string;
	text: string;
	url: string;
};

export type ResourceInfo = {
	type: "file" | "service";
	name: string;
	url: string;
};

export const info = {
	resources: [
		{
			type: "file",
			name: "cv.pdf",
			url: "/cv.pdf",
		},
		{
			type: "service",
			name: "Github (Mange)",
			url: "https://github.com/Mange",
		},
		{
			type: "service",
			name: "Keybase (magnusbergmark)",
			url: "https://keybase.io/magnusbergmark",
		},
	] satisfies ResourceInfo[],
	contact: [
		{
			name: "Email",
			text: "me@mange.dev",
			url: "mailto:me@mange.dev",
		},
		{
			name: "Consulting",
			text: "magnus@devbox.com",
			url: "mailto:magnus@devbox.com",
		},
		{
			name: "Telegram",
			text: "MangeB",
			url: "https://t.me/MangeB",
		},
	] satisfies ContactInfo[],

	introDocument: parseMarkdown(introMarkdown, { allowHtml: false }),
} as const;
