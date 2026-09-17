import type { BlockNode, HeadingNode, InlineNode } from "@tanstack/markdown";
import type { JSX } from "solid-js";
import { Dynamic } from "solid-js/web";
import meImage from "@/assets/me-pixelated.png?url";
import { info } from "@/info";

export function ProfilePicture() {
	return (
		<img
			id="profile-photo"
			src={meImage}
			alt="Magnus Bergmark, profile from the front."
		/>
	);
}

export function Intro() {
	const doc = info.introDocument;

	// Render elements until the thematic break only.
	const nodes = [];
	for (const node of doc.children) {
		if (node.type === "thematicBreak") {
			break;
		}
		nodes.push(node);
	}

	return <div id="intro">{nodes.map(renderMarkdownBlock)}</div>;
}

export function Outro() {
	const doc = info.introDocument;

	// Render elements after the thematic break only.
	const index = doc.children.findIndex((node) => node.type === "thematicBreak");
	if (index === -1) {
		return null; // No thematic break found, return null or handle as needed
	}

	const nodes = doc.children.slice(index);
	return <div id="outro">{nodes.map(renderMarkdownBlock)}</div>;
}

export function ResourcesList() {
	return (
		<ul>
			{info.resources.map((resource) => {
				const text =
					resource.type === "file"
						? resource.name
						: resource.url.replace(/^https?:\/\//, "");

				return (
					<li>
						<a href={resource.url}>{text}</a>
					</li>
				);
			})}
		</ul>
	);
}

export function ContactList() {
	return (
		<dl>
			{info.contact.map((contact) => (
				<>
					<dt>{contact.name}:</dt>
					<dd>
						<a href={contact.url}>{contact.text}</a>
					</dd>
				</>
			))}
		</dl>
	);
}

function renderMarkdownBlock(node: BlockNode): JSX.Element {
	switch (node.type) {
		case "heading":
			return renderHeading(node);
		case "paragraph":
			return <p>{renderInlineNodes(node.children)}</p>;
		case "thematicBreak":
			return <hr />;
		case "blockquote":
			return <div class="dim">{node.children.map(renderMarkdownBlock)}</div>;
		default:
			throw new Error(`Unsupported block node type: ${node.type}`);
	}
}

function renderHeading(node: HeadingNode): JSX.Element {
	const content = renderInlineNodes(node.children);

	if (node.depth === 1) {
		return (
			<>
				<h1 class="sr-only">{content}</h1>
				<pre class="h1-alternative" aria-hidden="true">{`
 ██      ██ ██     ██   ██                             ██
░██     ░██░░     ░██  ░██                            ░██
░██     ░██ ██   ██████░██       █████  ██████  █████ ░██
░██████████░██  ░░░██░ ░██████  ██░░░██░░██░░█ ██░░░██░██
░██░░░░░░██░██    ░██  ░██░░░██░███████ ░██ ░ ░███████░██
░██     ░██░██    ░██  ░██  ░██░██░░░░  ░██   ░██░░░░ ░░ 
░██     ░██░██    ░░██ ░██  ░██░░██████░███   ░░██████ ██
░░      ░░ ░░      ░░  ░░   ░░  ░░░░░░ ░░░     ░░░░░░ ░░ 
          `}</pre>
			</>
		);
	}

	return <Dynamic component={`h${node.depth}`}>{content}</Dynamic>;
}

function renderInlineNodes(nodes: InlineNode[]): JSX.Element {
	return nodes.map((node) => {
		switch (node.type) {
			case "text":
				return node.value;
			case "strong":
				return <span class="keyword">{renderInlineNodes(node.children)}</span>;
			case "emphasis":
				return <em>{renderInlineNodes(node.children)}</em>;
			case "link":
				return (
					<a href={node.href} title={node.title}>
						{renderInlineNodes(node.children)}
					</a>
				);
			case "break":
				return <br />;
			default:
				throw new Error(`Unsupported inline node type: ${node.type}`);
		}
	});
}
