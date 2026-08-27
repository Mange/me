.PHONY: all

cv.pdf: cv cv/main.typ cv/lib.typ cv/fonts
	@typst compile --font-path cv/fonts cv/main.typ cv.pdf

all: | cv.pdf
