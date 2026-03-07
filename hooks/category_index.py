"""
MkDocs hook: Auto-generate alphabetical article listings on category index pages.

Any index.md containing the marker <!-- ARTICLE_LIST --> will have it replaced
with a sorted, linked list of every other .md file in the same directory.
If the directory has no articles yet, a friendly placeholder is shown instead.
"""

import os
import re


def on_page_markdown(markdown, page, config, files, **kwargs):
    if "<!-- ARTICLE_LIST -->" not in markdown:
        return markdown

    src_path = page.file.src_path  # e.g. "roles/index.md"
    cat_dir = os.path.dirname(src_path)  # e.g. "roles"

    if not cat_dir:
        return markdown

    docs_dir = config["docs_dir"]
    full_dir = os.path.join(docs_dir, cat_dir)

    if not os.path.isdir(full_dir):
        return markdown.replace("<!-- ARTICLE_LIST -->",
                                "*No articles in this category yet.*")

    articles = []
    for fname in os.listdir(full_dir):
        if not fname.endswith(".md") or fname == "index.md":
            continue

        filepath = os.path.join(full_dir, fname)
        with open(filepath, "r", encoding="utf-8") as fh:
            content = fh.read(2048)  # only need the frontmatter

        # Extract title from YAML frontmatter
        title_match = re.search(r"^title:\s*(.+)$", content, re.MULTILINE)
        if title_match:
            title = title_match.group(1).strip().strip("\"'")
        else:
            title = fname.replace(".md", "").replace("-", " ").title()

        slug = fname.replace(".md", "")
        articles.append((title, slug))

    # Sort alphabetically (case-insensitive)
    articles.sort(key=lambda x: x[0].lower())

    if articles:
        listing_lines = []
        for title, slug in articles:
            listing_lines.append(f"<tr><td><a href=\"{slug}/\">{title}</a></td></tr>")
        listing = (
            '<table class="category-index">\n'
            "  <thead><tr><th>Article</th></tr></thead>\n"
            "  <tbody>\n"
            + "\n".join(f"    {line}" for line in listing_lines)
            + "\n  </tbody>\n</table>"
        )
    else:
        listing = (
            "!!! info \"No articles yet\"\n"
            "    This category doesn't have any articles yet. "
            "Be the first to contribute! Check the "
            "[Writing Guide](/meta/writing-guide/) for how to get started."
        )

    return markdown.replace("<!-- ARTICLE_LIST -->", listing)
