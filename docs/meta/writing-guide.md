---
title: Writing Guide
description: Everything you need to know to write and submit articles for the Mafia Wiki.
social_image: /assets/placeholder.png
background: /assets/background.jpg
---

# Writing Guide

This guide covers everything you need to know to write and submit articles for the Mafia Wiki — from using the Wiki Editor to formatting tips and the submission process.

---

## Getting Started

There are two ways to write an article:

1. **Wiki Editor** (recommended) — A web-based editor that handles formatting and export for you.
2. **Manual writing** — Write Markdown files directly for full control.

Both methods produce the same result: a `.mwp` file that you submit for review.

---

## Using the Wiki Editor

The [Wiki Editor](https://wikieditor.octanebula.dev) is the easiest way to create articles. It runs entirely in your browser — no downloads or accounts required.

### Walkthrough

When you open the editor, you'll see a panel on the left for editing and a live preview on the right. The editor is split into several collapsible sections:

#### 1. Metadata

| Field | Required | Description |
|-------|----------|-------------|
| **Page Title** | Yes | The main heading of your article. |
| **Description** | No | A short summary shown in social media embeds. Auto-generated from the title if left blank. |
| **Category** | Yes | The wiki section your article belongs to: Roles, Maps, Perks, Disguises, Lore, or Meta. |
| **Social Image** | No | Thumbnail for social media links. Defaults to the wiki placeholder. |
| **Background Image** | No | The page background. Defaults to the standard wiki background. |

#### 2. Infobox

The infobox is the summary panel that appears in the top-right corner of an article (or at the top on mobile). It's toggled on by default and is expected for most articles.

- **Infobox Title** — Defaults to the page title if left blank.
- **Infobox Image** — Upload or drag-and-drop an image.
- **Custom Attributes** — Add key-value pairs using the "Add Attribute" button. For example, a role article might have `Team → Civilian` and `Alignment → Good`.

#### 3. Introduction

A plain text box for the opening paragraph of your article. This text appears alongside the infobox. You can use `**bold**` and `*italic*` markup here — the editor converts it to the appropriate HTML automatically.

!!! tip "Writing a good introduction"
    The introduction should briefly state what the subject is and its significance in the game. Keep it to 2-3 sentences. For example: *"The **Detective** is a role on the Good team in **Mafia**. The Detective is tasked with investigating other players to find members of the Mafia."*

#### 4. Sections

Below the introduction, you can add as many content sections as you need using the "Add Section" button. Each section has:

- A **title** (becomes a heading on the page)
- A full **Markdown editor** with a toolbar for bold, italic, lists, links, images, and admonitions

Common sections for a role article might include **Abilities**, **Strategy**, **Tips & Tricks**, and **Trivia**.

#### 5. Admonitions

The section editor toolbar includes an admonition (callout) button. Admonitions are coloured boxes used to highlight tips, warnings, and other important information. The available types are:

| Type | Use for |
|------|---------|
| `note` | General information |
| `tip` | Helpful advice |
| `warning` | Things to watch out for |
| `danger` | Critical warnings |
| `info` | Supplementary details |
| `question` | Open questions or FAQs |
| `example` | Worked examples |
| `success` | Positive outcomes |
| `failure` | Negative outcomes |
| `bug` | Known bugs or glitches |
| `abstract` | Summaries |
| `quote` | Quotations |

You can also make admonitions **collapsible** (click to expand) and choose whether they start open or closed.

### Previewing Your Work

The right panel has two tabs:

- **Visual** — A rendered preview that approximates how the article will look on the wiki.
- **Source** — The raw Markdown that will be generated. Useful for catching formatting issues.

The preview updates in real time as you type.

### Exporting

When you're happy with your article, click the **Export .mwp** button in the top bar. This downloads a `.mwp` file — a ZIP archive containing your article and any uploaded images.

### Re-editing

Need to make changes after exporting? Click the **Import** button in the top bar and select your `.mwp` file. The editor will restore all your fields so you can continue editing, then export again.

---

## Writing Manually

If you prefer to write Markdown directly (or need to do something the editor doesn't support), you can create articles by hand.

### Page Structure

Every article follows this structure:

```
1. YAML frontmatter
2. Page title (H1 heading)
3. Introduction paragraph + infobox (HTML)
4. Content sections (Markdown)
```

See the [Article Template](article-template.md) for a ready-to-copy template with the full HTML structure.

### YAML Frontmatter

Every article starts with a YAML frontmatter block between `---` markers:

```yaml
---
title: Detective
description: This article is about the Detective role in Mafia.
social_image: /assets/detective.png
background: /assets/background.jpg
---
```

| Field | Description |
|-------|-------------|
| `title` | The article title. Must match the H1 heading below. |
| `description` | Social media embed description. |
| `social_image` | Path to the social media thumbnail image. |
| `background` | Path to the page background image. |

!!! warning "Only one frontmatter block"
    Make sure your file has exactly **one** frontmatter block at the very top. Duplicate frontmatter blocks will cause rendering issues.

### Introduction and Infobox

The introduction paragraph and infobox sit side-by-side using a flex container. Because of the HTML layout, the introduction uses HTML tags (`<b>`, `<i>`, `<p>`) rather than Markdown.

The infobox is an HTML `<table>` with:

- A title row
- An image row
- Attribute rows (key-value pairs using `<th>` and `<td>`)

The `<style>` block above the flex container handles mobile responsiveness — on small screens, the infobox moves above the introduction text.

If your article **doesn't need an infobox**, skip the entire flex container and write the introduction in plain Markdown.

### Content Sections

After the introduction, the rest of the article is written in standard Markdown. Each section uses this format:

```markdown
## **Section Title**
---

Your content here. You can use **bold**, *italics*, [links](https://example.com),
images, lists, tables, and all other Markdown features.
```

### Admonition Syntax

Admonitions use MkDocs syntax:

```markdown
!!! tip "Optional custom title"
    Content inside the admonition.
    Indented with 4 spaces.
```

For collapsible admonitions:

```markdown
??? note "Click to expand"
    This content is hidden by default.

???+ note "Open by default"
    This content starts expanded but can be collapsed.
```

### Images

Place image files in the `docs/assets/` directory (or in a subdirectory). Reference them in Markdown:

```markdown
![Alt text](/assets/your-image.png)
```

Or in the infobox HTML:

```html
<img src="https://mafiawiki.astrofare.xyz/assets/your-image.png"
     alt="Description" class="infobox-image" style="width: 100%;">
```

---

## Formatting Reference

For a full demonstration of every Markdown feature supported by the wiki, see the [Markdown Formatting Showcase](markdown-formatting-showcase.md).

Key features available:

- **Text formatting** — Bold, italic, strikethrough, highlighting
- **Lists** — Ordered, unordered, nested, task lists
- **Tables** — Standard Markdown tables
- **Code blocks** — Inline code and fenced code blocks with syntax highlighting
- **Blockquotes** — Standard and cited quotations
- **Footnotes** — Reference-style footnotes
- **Admonitions** — Callout boxes (note, tip, warning, danger, etc.)
- **Emojis** — GitHub-style emoji shortcodes

---

## Style Guidelines

To keep the wiki consistent, follow these conventions:

- **Article titles** should be the in-game name of the subject (e.g., "Detective", not "The Detective Role").
- **Introduction paragraphs** should be factual and concise — state what the subject is and its role in the game.
- **Use third person** — Write "The Detective can investigate players", not "You can investigate players".
- **Section headings** should use title case: "Tips & Tricks", not "tips & tricks".
- **Avoid speculation** — Only document confirmed game mechanics.
- **Keep strategy sections practical** — Focus on actionable advice rather than lengthy theorycrafting.
- **Attribute names in infoboxes** should be consistent across articles of the same category (e.g., all role articles should use "Team", "Alignment", "Max Players" as attribute names).
- **One article per subject** — Don't combine multiple topics into a single article.

---

## Submitting Your Article

1. **Export** your article as a `.mwp` file from the Wiki Editor (or manually ZIP your `.md` file and any images into a `.zip` and rename it to `.mwp`).
2. **Post** the `.mwp` file in the **#wiki-submissions** channel on the [Mafia Discord server](https://discord.gg/mafia).
3. **Wait for review** — Staff will review your submission and may suggest edits. Minor formatting mistakes will be corrected for you.
4. Once approved, your article will be published on the wiki.

### Manual `.mwp` Structure

If you're packaging manually, your `.mwp` file (a ZIP archive) should contain:

```
your-article.mwp
├── manifest.json
├── page.md
└── assets/
    ├── your-image.png
    └── ...
```

The `manifest.json` should follow this format:

```json
{
    "version": "1.0",
    "title": "Your Article Title",
    "category": "roles",
    "suggestedPath": "roles/your-article",
    "fileName": "your-article.md",
    "infoboxEnabled": true,
    "createdAt": "2026-01-01T00:00:00.000Z",
    "assets": ["your-image.png"]
}
```

Valid categories: `roles`, `maps`, `perks`, `disguises`, `lore`, `meta`.

---

## Rewards

If you successfully contribute a **new article** to the wiki, you'll receive:

- **150 Credits** in-game
- **Wiki Contributor** role on Discord
- **Wiki Contributor** chat tag in-game
- Credit on the [Contributors](contributors.md) page
