.PHONY: all website

all: | cv.pdf website

cv.pdf: cv cv/main.typ cv/lib.typ cv/fonts
	@typst compile --font-path cv/fonts cv/main.typ cv.pdf

website:
	@cd website && pnpm install && pnpm run build
