---
title: Article Template
description: A copy-paste template for writing wiki articles manually.
social_image: /assets/placeholder.png
background: /assets/background.jpg
---

# Article Template

This page contains a ready-to-use template for writing wiki articles. If you're using the [Wiki Editor](https://wikieditor.octanebula.dev), you don't need this — the editor generates the correct format for you. This template is for contributors who prefer writing Markdown directly.

---

## How to Use

Copy the source code of the template below (available on [GitHub](https://github.com/OctaNebula/mafia-wiki/blob/main/docs/meta/article-template.md?plain=1)) and paste it into a new `.md` file. Replace the placeholder values with your own content.

---

## Template

````markdown
---
title: Page Title
description: A brief description of the page.
social_image: /assets/placeholder.png
background: /assets/background.jpg
---

# Page Title
---

<style>
@media (max-width: 768px) {
    .flex-container {
        flex-direction: column;
        align-items: center;
    }
    .infobox {
        align-self: center;
        order: -1;
        margin-left: 0;
        margin-bottom: 20px;
        width: 100%;
        max-width: 300px;
    }
}
</style>

<div class="flex-container" style="display: flex; align-items: flex-start;">
    <div style="flex: 1;">
        <p>The <b>Page Title</b> is a short introductory paragraph. Use HTML tags
        (<code>&lt;b&gt;</code>, <code>&lt;i&gt;</code>) for formatting here, since this
        section sits alongside the infobox.</p>
    </div>
    <div class="infobox" style="flex: 0 0 200px; margin-left: 20px;">
        <table>
            <tr>
                <td colspan="2" style="text-align: center; font-weight: bold;">Page Title</td>
            </tr>
            <tr>
                <td colspan="2">
                    <img src="https://mafiawiki.astrofare.xyz/assets/placeholder.png"
                         alt="Page Title" class="infobox-image" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <th>Attribute</th>
                <td>Value</td>
            </tr>
            <tr>
                <th>Another Attribute</th>
                <td>Another Value</td>
            </tr>
        </table>
    </div>
</div>

## **Section Title**
---

Write your content here in regular Markdown. You can use **bold**, *italics*,
[links](https://example.com), images, lists, and all other Markdown features.

## **Another Section**
---

Add as many sections as needed for the article.

!!! tip
    You can use admonitions (callouts) like this one for tips, warnings, and notes.
````

---

## Notes

- The **introduction paragraph** uses HTML because it shares a row with the infobox. The rest of the article is written in standard Markdown.
- If your article doesn't need an infobox, you can omit the entire `<div class="flex-container">` block and write the introduction in plain Markdown instead.
- Make sure your frontmatter `title` matches the `# Page Title` heading.
- See the [Writing Guide](writing-guide.md) for a full walkthrough of the article creation process.
- See the [Markdown Formatting Showcase](markdown-formatting-showcase.md) for examples of every formatting feature available.
