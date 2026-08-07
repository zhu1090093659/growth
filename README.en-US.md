

# growth

> **A radically counter-trend skill for the AI era: It doesn't think for you; it forces you to think.**

**Chinese** | [English](./README.en.md)

[![Stars](https://img.shields.io/github/stars/zhu1090093659/growth?style=flat&logo=github&label=Stars)](https://github.com/zhu1090093659/growth/stargazers)
[![Forks](https://img.shields.io/github/forks/zhu1090093659/growth?style=flat&logo=github&label=Forks)](https://github.com/zhu1090093659/growth/network/members)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Claude%20Code%20%7C%20Codex%20%7C%20Gemini%20%7C%20Cursor-e74c3c)

When every AI tool is telling you "I'll help you write code faster, write docs faster, and make decisions faster," growth does the exact opposite: **It makes you slow down and ask the questions you're unwilling to ask yourself.**

Because in a future where AI is reliable, what's truly scarce isn't productivity, but **your own judgment, taste, intent clarity, and abstraction skills**. These capabilities cannot be distilled; they can only grow within your own brain. growth was built to train them.

---

## Table of Contents

- [What is this](#what-is-this)
- [Four Skills](#four-skills)
- [Example Output](#example-output)
- [Platform Compatibility](#platform-compatibility)
- [Installation](#installation)
- [Design Philosophy](#design-philosophy)
- [Honest Boundaries](#honest-boundaries)
- [Usage Recommendations](#usage-recommendations)
- [Honest Version Notes](#honest-version-notes)
- [Roadmap](#roadmap)
- [Contribution](#contribution)
- [Related Projects](#related-projects)
- [Links](#links)
- [License](#license)

---

## What is this

growth is a set of **thinking training skills**. Once installed in your AI coding tool, it won't write code for you. Instead, it will force you to clarify the questions you haven't fully thought through before, during, and after you write code.

The four skills each tackle four cognitive bottlenecks: whether the code/design is good, what the requirements really are, where a decision might be wrong, and whether the abstraction is solid. They don't provide answers; they only provide increasingly sharp questions.

---

## Four Skills

| Skill | Trigger Scenario | Core Question |
|---|---|---|
| **taste-audit** | Already have code/design in hand, want to judge if it's good | Is this beautiful? Where is the ugliness? |
| **intent-refine** | Want to do something but description is vague, defining requirements | What do you really want? Why? |
| **judgment-redteam** | Made a decision, leaning towards a specific solution | Where might you be wrong? |
| **abstraction-uplift** | Code already works, wondering "can it be better?" | Is the current abstraction reasonable? |

---

## Example Output

Unlike nuwa-skill, which distills "how others think," growth does the opposite: **it makes you think for yourself**. Below is a real interaction example of taste-audit:

```
User      ❯ Help me review this code.
            [Pasted a 200-line Python class]

Claude    ❯ Phase 1 → Activate Intuition

            Let's not talk about the technicalities yet—what's your first impression when reading this code?
            Describe it in one word.

User      ❯ It's okay, it runs.

Claude    ❯ "Okay" means you truly have no feeling, or you haven't thought it through?
            Read it again. In these 200 lines, is there any single line you wouldn't want others to see?
            Specifically, which line?
```

This isn't about helping the user "critique"; it's about pushing the responsibility of judgment back **to the user**. Claude acts as a mirror, not a reviewer.

---

## Platform Compatibility

| Platform | Installation Method | Skill Location | Notes |
|---|---|---|---|
| Claude Code | Official Plugin Marketplace | `~/.claude/plugins/cache/…` | Namespaced: `/growth:taste-audit` |
| Codex CLI | `./install.sh codex` | `~/.codex/skills/` | SKILL.md interoperable with Claude Code |
| Gemini CLI | `gemini extensions install` | Gemini extension | Includes `GEMINI.md` context |
| Cursor | `./install.sh cursor` | `.cursor/rules/` | `.mdc` format |

---

## Installation

All four platforms are supported. Choose one based on your tool:

### Claude Code

Install via the official plugin marketplace ([docs](https://code.claude.com/docs/en/plugin-marketplaces)):

```
/plugin marketplace add YOUR_USERNAME/growth
/plugin install growth@growth
```

After installation, the four skills will appear with the `/growth:` namespace prefix: `/growth:taste-audit`, `/growth:intent-refine`, `/growth:judgment-redteam`, `/growth:abstraction-uplift`.

Update: `/plugin marketplace update growth`. Uninstall: `/plugin uninstall growth@growth`.

> For local debugging, you can `git clone` it and then run `/plugin marketplace add ./growth`, or use `claude --plugin-dir ./growth` to load it directly.

### Codex CLI

Codex's SKILL.md format is fully compatible with Claude Code. Simply run:

```bash
./install.sh codex
```

Or manually copy to `~/.codex/skills/` (Codex's Agent Skills location).

### Gemini CLI

Install Gemini via extension:

```bash
gemini extensions install https://github.com/YOUR_USERNAME/growth/tree/main/platforms/gemini-cli
```

Or local path:

```bash
gemini extensions install ./platforms/gemini-cli
```

### Cursor

```bash
./install.sh cursor
```

This copies `platforms/cursor/rules/*.mdc` to the current project's `.cursor/rules/` directory. You can also copy it to the user-wide location (`~/.cursor/rules/`).

---

## Design Philosophy

### Three Core Principles

The beginning of each skill's SKILL.md outlines these three rules, which Claude must follow:

**1. Mirror Principle**
A skill is not a consultant; it's a mirror. Never say "I think this should be..." Only ask "How do you feel about this?"

**2. Socratic Discipline**
Only ask questions; never give answers. Questions have three levels of sharpness: Activate → Piercing → Reframe.

**3. Anti-Sycophancy Principle**
**User feels comfortable = skill fails. User feels challenged = skill succeeds.**
Does not accept "it's good enough" as an exit unless it has truly been thoroughly thought through.

### Why Distill "Questions" Instead of "Answers"

There are many excellent skills on the market that distill **how others think** (e.g., [nuwa-skill](https://github.com/alchaincyf/nuwa-skill) distills Musk, Munger). The value of such skills is **giving you a better consultant**.

growth does the opposite: **it helps you become a better version of yourself**.

Here is a trade-off:
- Distilling others → You get better advice, but your own skills don't grow
- Distilling questions → You don't get answers, but you're forced to find them yourself, and over time your own judgment grows

Both paths are valid; it depends on your choice. growth chooses the latter.

---

## Honest Boundaries

Here's what this skill set **cannot** do, stated upfront:

- **Cannot give you taste** — Taste can only grow as you build things yourself and observe feedback
- **Cannot give you judgment** — Judgment requires you to make mistakes in real decisions, review them, and internalize them
- **Cannot give you intent clarity** — Intent clarity comes from your honesty with yourself
- **Cannot give you abstraction skills** — Abstraction skills come from internalizing a vast amount of specifics

This skill set **can only** do this: **when you're ready to think, it forces you to think one level deeper.**

If you lack the willingness to think, the skill can't help you. If you have it, the skill will improve your thinking quality by 30%-50%. That's enough.

---

## Usage Recommendations

1. **Don't use multiple skills at once** — They operate on different mental models and will conflict. Use one at a time.
2. **Give yourself time to think** — When the skill stumps you, don't rush to answer. Walk away, reflect, and come back.
3. **Record your "blind spot moments"** — When the skill asks about something you hadn't considered before, write it down. This is the true trajectory of your skill growth.
4. **Periodically retire the skill** — Every once in a while, run through the workflow without the skill. If you can ask the same questions yourself, it means successful internalization.

**The ultimate goal is to discard the skill** — The day comes when you look at these four SKILL.md files and say "I already have these questions in my head automatically," that's when it has truly taken root.

---

## Honest Version Notes

This skill set is currently a **v0.1 public experiment**. The question bank was designed by the author based on experience but hasn't been heavily validated in practice. Major updates are expected within 3 months based on real-world feedback.

If you try it out and find some questions highly accurate while others are useless, feel free to open an issue or PR to let me know. v0.2 will evolve based on feedback.

---

## Roadmap

- [x] v0.1: Claude Code version for the four skills
- [x] v0.1: Codex CLI compatibility (interoperable SKILL.md format)
- [x] v0.1: Cursor rules adaptation (.mdc format)
- [x] v0.1: Gemini CLI extension
- [ ] v0.2: Question bank iteration based on 3 months of usage feedback
- [ ] v0.2: English version of SKILL.md (currently Chinese only)
- [ ] v0.3: "taste-audit for prose" (reviewing writing taste, not just code)
- [ ] v0.3: More thinking training skills (potential: first-principles drill, analogy-finder)

---

## Contribution

PRs and issues are welcome. Specifically, contributions like:
- A question hit home for you → Tell me (so I can keep it)
- A question felt like nonsense to you → Tell me (so I can remove it)
- You added a new question that worked well → PR it over
- Adaptation for other CLI/IDE platforms → PR

**Unwelcome** PRs:
- Making the skill "more friendly", "milder", or "more encouraging to the user" — this violates the Anti-Sycophancy Principle
- Having Claude provide candidate answers within the skill — this violates the Mirror Principle

---

## Related Projects

- [nuwa-skill](https://github.com/alchaincyf/nuwa-skill) - Distills how others think (Munger, Musk, Naval)
- [colleague-skill](https://github.com/titanwings/colleague-skill) - Distills your colleagues
- **growth** (this project) - Distills your own thinking (in the opposite direction)

The three projects form a spectrum:
- **Others' answers** ← nuwa-skill ← colleague-skill ← growth → **Your own answers**

---

## Links

- [linxin.do](https://linxin.do)

---

## License

MIT — Feel free to use, modify, and build upon it. If growth strengthens your judgment, remember to **stop relying on growth**. That's when you've graduated.
