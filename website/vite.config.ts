import { tanstackStart } from "@tanstack/solid-start/plugin/vite";
import { defineConfig } from "vite";

import solidPlugin from "vite-plugin-solid";

export default defineConfig({
	resolve: { tsconfigPaths: true },
	plugins: [
		tanstackStart({
			prerender: {
				enabled: true,
				autoSubfolderIndex: true,
				autoStaticPathsDiscovery: true,
				concurrency: 2,
				crawlLinks: true,
				failOnError: true,
				filter: ({ path }) => !path.endsWith("/cv.pdf"),
			},
		}),
		solidPlugin({ ssr: true }),
	],
});
