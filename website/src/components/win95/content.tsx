import type { BlockNode, HeadingNode, InlineNode } from "@tanstack/markdown";
import type { JSX } from "solid-js";
import rtfIconLarge from "@/assets/win95icons/w95_2-0.png?url";
import globeIconLarge from "@/assets/win95icons/w95_14-0.png?url";
import documentFolderIconLarge from "@/assets/win95icons/w95_21-0.png?url";
import cogDocumentIconLarge from "@/assets/win95icons/w95_59-0.png?url";
import faxIconLarge from "@/assets/win95icons/w95_70-0.png?url";
import { info } from "@/info";
import { FolderItem } from "./window";

export function AboutMeText() {
	const doc = info.introDocument;
	return <div class="rtf-prose">{doc.children.map(renderMarkdownBlock)}</div>;
}

export function ResourcesFolderContents() {
	return info.resources.map((resource) => {
		const iconSrc = (() => {
			if (resource.name === "cv.pdf") {
				return rtfIconLarge;
			}

			if (resource.name.startsWith("Keybase")) {
				return cogDocumentIconLarge;
			}

			if (resource.name.startsWith("Github")) {
				return documentFolderIconLarge;
			}
			throw new Error(`Add an icon source for this resource: ${resource.name}`);
		})();

		return (
			<FolderItem href={resource.url} iconSrc={iconSrc} label={resource.name} />
		);
	});
}

export function ContactFolderItems() {
	return info.contact.map((contact) => {
		const isEmail = contact.url.startsWith("mailto:");
		const icon = isEmail ? faxIconLarge : globeIconLarge;
		const label = isEmail ? contact.text : `${contact.name} (${contact.text})`;

		return <FolderItem href={contact.url} iconSrc={icon} label={label} />;
	});
}

function renderMarkdownBlock(node: BlockNode): JSX.Element {
	switch (node.type) {
		case "heading":
			return renderHeading(node);
		case "paragraph":
			return <p>{renderInlineNodes(node.children)}</p>;
		case "thematicBreak":
			return <p>&nbsp;</p>;
		case "blockquote":
			return <div class="dim">{node.children.map(renderMarkdownBlock)}</div>;
		default:
			throw new Error(`Unsupported block node type: ${node.type}`);
	}
}

function renderHeading(node: HeadingNode): JSX.Element {
	const content = renderInlineNodes(node.children);
	return <h2>{content}</h2>;
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
