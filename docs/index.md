---
title: Home
description: Welcome to the Official Roblox Mafia Wiki
social_image: /assets/placeholder.png
background: /assets/background.jpg
hide:
  - navigation
  - toc
---

<style>
/* ── Hero ── */
.wiki-hero {
    text-align: center;
    padding: 48px 20px 36px;
}
.wiki-hero h1 {
    font-size: 2.2rem;
    font-weight: 800;
    margin: 0 0 12px;
    letter-spacing: -0.01em;
}
.wiki-hero p {
    font-size: 1.05rem;
    color: rgba(255,255,255,0.7);
    max-width: 620px;
    margin: 0 auto;
    line-height: 1.6;
}
.wiki-hero hr {
    width: 60px;
    border: none;
    border-top: 3px solid #ff4081;
    margin: 20px auto 24px;
}

/* ── Category cards grid ── */
.cat-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 16px;
    max-width: 860px;
    margin: 0 auto 40px;
    padding: 0 12px;
}
.cat-card {
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(255,255,255,0.08);
    border-radius: 10px;
    padding: 24px 20px;
    text-align: center;
    text-decoration: none !important;
    transition: background 0.2s ease, border-color 0.2s ease, transform 0.15s ease;
    display: block;
}
.cat-card:hover {
    background: rgba(255,255,255,0.08);
    border-color: rgba(74,144,226,0.35);
    transform: translateY(-2px);
}
.cat-card .cat-icon {
    font-size: 1.8rem;
    margin-bottom: 10px;
    display: block;
}
.cat-card .cat-name {
    font-weight: 700;
    font-size: 1rem;
    color: #fff !important;
    display: block;
    margin-bottom: 4px;
}
.cat-card .cat-desc {
    font-size: 0.8rem;
    color: rgba(255,255,255,0.5);
    display: block;
    line-height: 1.4;
}

/* ── CTA banner ── */
.cta-banner {
    max-width: 860px;
    margin: 0 auto 32px;
    padding: 28px 32px;
    background: linear-gradient(135deg, rgba(74,144,226,0.12), rgba(255,64,129,0.10));
    border: 1px solid rgba(74,144,226,0.18);
    border-radius: 12px;
    text-align: center;
}
.cta-banner h2 {
    font-size: 1.25rem;
    margin: 0 0 8px;
    font-weight: 700;
}
.cta-banner p {
    color: rgba(255,255,255,0.65);
    margin: 0 0 16px;
    font-size: 0.92rem;
    line-height: 1.5;
}
.cta-btn {
    display: inline-block;
    padding: 10px 28px;
    background: #ff4081;
    color: #fff !important;
    font-weight: 600;
    font-size: 0.88rem;
    border-radius: 50px;
    text-decoration: none !important;
    transition: background 0.2s ease, transform 0.15s ease;
}
.cta-btn:hover {
    background: #e03570;
    transform: translateY(-1px);
}
</style>

<div class="wiki-hero">
    <h1>Welcome to the Mafia Wiki</h1>
    <hr>
    <p>The community-driven encyclopedia for the Roblox game <b>Mafia</b> by Topline Studios. Browse articles by category or use the search bar above.</p>
</div>

<div class="cat-grid">
    <a class="cat-card" href="roles/">
        <span class="cat-icon">🎭</span>
        <span class="cat-name">Roles</span>
        <span class="cat-desc">Playable roles and their abilities</span>
    </a>
    <a class="cat-card" href="maps/">
        <span class="cat-icon">🗺️</span>
        <span class="cat-name">Maps</span>
        <span class="cat-desc">Map layouts and strategies</span>
    </a>
    <a class="cat-card" href="perks/">
        <span class="cat-icon">⚡</span>
        <span class="cat-name">Perks</span>
        <span class="cat-desc">Equippable perks and bonuses</span>
    </a>
    <a class="cat-card" href="disguises/">
        <span class="cat-icon">🥸</span>
        <span class="cat-name">Disguises</span>
        <span class="cat-desc">Available disguises</span>
    </a>
    <a class="cat-card" href="lore/">
        <span class="cat-icon">📖</span>
        <span class="cat-name">Lore</span>
        <span class="cat-desc">Backstory and universe lore</span>
    </a>
    <a class="cat-card" href="meta/">
        <span class="cat-icon">📝</span>
        <span class="cat-name">Meta</span>
        <span class="cat-desc">Guides and wiki info</span>
    </a>
</div>

<div class="cta-banner">
    <h2>Contribute to the Wiki</h2>
    <p>This wiki is open for community contributions. Write articles, earn in-game credits, a Discord role, and an in-game chat tag.</p>
    <a class="cta-btn" href="meta/writing-guide/">Get Started →</a>
</div>
