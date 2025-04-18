---
title: Example Article
description: This is an example article for the Mafia Wiki.
social_image: /assets/placeholder.png
background: /assets/background.jpg
---

# **Example Article**
---

<style>
@media (max-width: 768px) { /* For mobile users */
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
        This is the <b>introduction</b> paragraph on the wiki page. Here you should state what the article is about and what the reader can expect to learn from it. Note that you'll need to use HTML tags to style your text, as Markdown doesn't support inline styling. <p> Thankfully, this only applies to the introduction paragraph, as the rest of the article can be written in Markdown, more on Markdown in the next section. You can modify the infobox by changing the values in the table below. If you'd like to add more attributes, you can simply copy and paste the last row and change the values accordingly. </p>
    </div>
    <div class="infobox" style="flex: 0 0 200px; margin-left: 20px;">
        <table>
            <tr>
                <td colspan="2" style="text-align: center; font-weight: bold;">Infobox Title</td>
            </tr>
            <tr>
                <td colspan="2">
                    <img src="https://mafiawiki.astrofare.xyz/assets/placeholder.png" alt="Image Description" class="infobox-image" style="width: 100%;">
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

## **Introduction**
---

Welcome to the example article. Writing an article for this wiki might look difficult given the fact that there's no built-in editor like Fandom has, but once you see how the source file of this page looks like and study it enough, you'll soon find writing articles pretty easy. In fact, you're given far greater artistic liberty this way, so in the long term it should be benefitial for you.

## **Using Markdown**
---

Markdown is a lightweight markup language used for creating formatted text. The Mafia Wiki uses **[Material for mkdocs](https://squidfunk.github.io/mkdocs-material/)**, a wiki generator that converts Markdown (`.md`) files to a wiki page, which makes writing and adding new articles easy. Another benefit is that the entire site is static, meaning that setting the wiki up is not only easier but cheaper for us on our behalf.

A great way to get started with writing markdown is installing the note app **[Obsidian](https://obsidian.md/)**. Obsidian uses Markdown and saves its files as `.md` files, which also makes it convenient as you can just upload the `.md` file to the wiki and it'll generate a webpage for you.
If you'd like to avoid downloading any software or using Obsidian in general, you can also use [stackedit.io](https://stackedit.io).

Now, about writing articles. The best way to write an article is to use this example article as a template. You can copy the [source code of this page](https://github.com/OctaNebula/mafia-wiki/blob/main/docs/meta/exampleArticle.md?plain=1) and paste it into your own `.md` file, then modify the content to fit your article. You can also use the [Markdown Guide](https://www.markdownguide.org/) to learn more about Markdown. When modifying the article, **make sure to not mess around with the introduction paragraph, except where you can see plain text**, as it's styled with HTML tags and not Markdown, and modifying it might break the infobox that can be seen on the right side of the page (or at the top if you're on mobile). After you've completed the introduction paragraph, you can write the rest of the article in Markdown.

Additionally, there's an page on this Wiki that contains an example of every Markdown feature you can use. You can find it [here](https://mafiawiki.astrofare.xyz/meta/formatting).

## **Frontmatter**
---

At the beginning of every article, you can see a section that looks like this:

`title: Example Article`
`description: This is an example article for the Mafia Wiki.`
`social_image: /assets/placeholder.png`
`background: /assets/background.jpg`

This is what we call the **YAML frontmatter** of the article. To sum everything up, this part gives some special instructions to the wiki generator on how to display the article. The first `title`, `description` and `social_image` attributes are used to manage the article's social media embed. The `title` is the title of the article, the `description` is the description that will be shown when sharing the article on social media, and the `social_image` is the image that will be used as a thumbnail when sharing the article. On the other hand, the `background` attribute is used to set the background image of the article. You can use any image you want, but make sure it's at least 1920x1080 pixels in size for best results. You can also use a solid color instead of an image by using a hex color code (e.g., `#ff0000` for red).

## **Submitting Articles**
---

Once you've finished writing your article, you can submit it in the #wiki-submissions channel on the Mafia Discord server, preferably in a `.zip` file containing the `.md` file and any images you'd like to include in the article. Submitted articles will be reviewed by staff and added to the wiki if they meet the quality standards. Any minor mistakes you make will be corrected by us, so don't worry about making a formatting mistake or two - it's the content that matters the most. 
If you successfully contribute to the wiki (by submitting a new article, not editing an existing one) for the first time, you'll be rewarded with the following:

 - 500 Credits
 - Wiki Contributor role on Discord
 - Wiki Contributor chat tag in the game
 - Being credited on the [Contributors](https://mafiawiki.astrofare.xyz/meta/contributors) page
 - Our eternal gratitude

Good luck with writing your article!