import {
	createRootRouteWithContext,
	HeadContent,
	Outlet,
	Scripts,
} from "@tanstack/solid-router";
import { Suspense } from "solid-js";
import { HydrationScript } from "solid-js/web";

export const Route = createRootRouteWithContext()({
	head: () => ({
		meta: [
			{ name: "charset", content: "UTF-8" },
			{ title: "Magnus Bergmark" },
			{ name: "viewport", content: "width=device-width, initial-scale=1" },
		],
	}),
	shellComponent: RootComponent,
});

function RootComponent() {
	return (
		<html lang="en">
			<head>
				<HydrationScript />
				<HeadContent />
			</head>
			<body>
				<Suspense>
					<Outlet />
				</Suspense>
				<Scripts />
			</body>
		</html>
	);
}
