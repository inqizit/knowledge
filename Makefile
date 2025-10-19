PORT ?= 8001

.PHONY: serve lint

serve:
	@echo "Serving knowledge at http://localhost:$(PORT)"
	python3 -m http.server $(PORT) --directory .

lint:
	@echo "Linting Markdown in knowledge/..."
	@npx --yes markdownlint-cli@0.39.0 "**/*.md" "!node_modules/**"


