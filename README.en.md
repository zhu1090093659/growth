# growth

> **The most counter-cultural skill set of the AI era: doesn't think for you, forces you to think.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blueviolet)](https://claude.ai/code)
[![Codex CLI](https://img.shields.io/badge/Codex%20CLI-Compatible-black)](https://developers.openai.com/codex/cli)
[![Gemini CLI](https://img.shields.io/badge/Gemini%20CLI-Compatible-4285F4)](https://github.com/google-gemini/gemini-cli)
[![Cursor](https://img.shields.io/badge/Cursor-Compatible-000000)](https://cursor.com)

While every AI tool promises to help you write code, docs, and decisions **faster**, growth does the opposite: **it slows you down and asks questions you don't want to ask yourself.**

Because in a future where AI is reliable, the real scarcity isn't productivity — it's **your own judgment, taste, intent clarity, and abstraction ability.** These cannot be distilled. They can only grow inside your own brain. growth is built to train them.

[**中文**](./README.md) · [Four Skills](#four-skills) · [Install](#install) · [Philosophy](#philosophy) · [Roadmap](#roadmap)

---

## Four Skills

| Skill | When to use | Core question |
|---|---|---|
| 🎨 **taste-audit** | You have code/design in hand, want to know if it's good | Is this beautiful? Where is it ugly? |
| 🎯 **intent-refine** | You want to do something but your description is fuzzy | What exactly do you want? Why? |
| 🗡️ **judgment-redteam** | You've made a decision, leaning toward a plan | Where are you most likely wrong? |
| 🏗️ **abstraction-uplift** | Your code works, but you wonder "could it be better?" | Is the current abstraction right? |

---

## Example interaction

Unlike [nuwa-skill](https://github.com/alchaincyf/nuwa-skill), which distills how others think (Munger, Musk, Naval), growth makes **you** think. Here's a real taste-audit session:

```
User      ❯ Can you review this code for me?
            [pastes a 200-line Python class]

Claude    ❯ 📍 Phase 1 → Awareness

            Before we get technical — what's your first gut reaction
            reading this code? One word.

User      ❯ It's fine, it works.

Claude    ❯ "Fine" as in you don't feel anything, or fine as in you
            haven't looked closely? Read it again. In those 200 lines,
            is there a single line you wouldn't want to show someone
            you admire? Which line number?
```

Claude isn't reviewing the code. Claude is pushing the judgment **back onto you**. The skill's role is to be a mirror, not a critic.

---

## Install

Four platforms supported — pick yours:

### 🤖 Claude Code

```bash
git clone https://github.com/YOUR_USERNAME/growth.git
cd growth
./install.sh claude-code
```

Or manually copy the four subdirectories in `skills/` to `~/.claude/skills/`.

### 🧬 Codex CLI

Codex uses the same `SKILL.md` format as Claude Code, so:

```bash
./install.sh codex
```

Or manually copy to `~/.codex/skills/`.

### ✨ Gemini CLI

Install as a Gemini CLI extension:

```bash
gemini extensions install https://github.com/YOUR_USERNAME/growth/tree/main/platforms/gemini-cli
```

Or via local path:

```bash
gemini extensions install ./platforms/gemini-cli
```

### 🖱️ Cursor

```bash
./install.sh cursor
```

This copies `platforms/cursor/rules/*.mdc` into your current project's `.cursor/rules/` directory.

---

## Philosophy

### Three Iron Rules

Every SKILL.md opens with these three rules. Claude must follow them:

**1. Mirror Principle**
The skill is a mirror, not a consultant. Forbidden: "I think you should…". Allowed: "How do you feel about this?"

**2. Socratic Discipline**
Questions only, no answers. Three levels of sharpness: **activate → pierce → reframe.**

**3. Anti-Sycophancy**
**If the user feels comfortable, the skill has failed. If they feel challenged, it succeeded.**
"Good enough" is not an exit signal unless it's genuinely earned.

### Why distill questions, not answers?

Many great skills out there distill **how others think** (like [nuwa-skill](https://github.com/alchaincyf/nuwa-skill) with Munger, Musk, Naval). Their value: **giving you better advisors.**

growth does the opposite: **making you a better thinker.**

The tradeoff:
- **Distilling others** → you get better advice, but your own capability doesn't grow
- **Distilling questions** → you don't get answers, but you're forced to find your own, and long-term your judgment compounds

Both paths are valid. growth picks the latter.

---

## Honest Limitations

Borrowing nuwa-skill's honesty-first approach — here's what this skill set **cannot** do:

- **Can't give you taste** — taste only grows from making things and getting feedback
- **Can't give you judgment** — judgment requires real decisions, real mistakes, real reflection
- **Can't give you intent clarity** — that comes from your honesty with yourself
- **Can't give you abstraction ability** — it comes from internalizing many concrete cases

What this skill **can** do: **when you're ready to think, force you to think one layer deeper.**

If you have no intent to think, the skill can't save you. If you do, it lifts your thinking quality by 30-50%. That's enough.

---

## Usage Tips

1. **Don't use multiple skills at once** — they have different mental models and will conflict.
2. **Give yourself time to think** — when a skill stumps you, don't rush to answer. Walk away and come back.
3. **Record your "blind spot moments"** — when a skill surfaces something you'd never considered, write it down. This is your real growth trajectory.
4. **Periodically drop the skill** — every so often, try walking through the process without the skill. If you can ask yourself the same questions, you've internalized it.

**The goal is to outgrow the skill.** The day you look at these four `SKILL.md` files and think "I already ask myself these questions automatically" — that's graduation.

---

## Version Honesty

This is **v0.1, a public experiment**. The question bank reflects the author's experience but hasn't been battle-tested yet. Expect major revisions within 3 months based on real usage feedback.

Tried it? Found a question that nailed you? Or one that felt useless? Open an issue or PR. v0.2 will evolve from feedback.

---

## Roadmap

- [x] v0.1: Four skills in Claude Code format
- [x] v0.1: Codex CLI compatibility (SKILL.md format is shared)
- [x] v0.1: Cursor rules adaptation (.mdc format)
- [x] v0.1: Gemini CLI extension
- [ ] v0.2: Question bank iteration based on 3 months of usage
- [ ] v0.2: Full English `SKILL.md` versions (currently Chinese only)
- [ ] v0.3: "taste-audit for prose" (for writing, not just code)
- [ ] v0.3: More thinking-training skills (possibly: first-principles drill, analogy-finder)

---

## Contributing

PRs and issues welcome. Especially:
- A question hit you → tell me (so I keep it)
- A question felt useless → tell me (so I cut it)
- You wrote a new question that works → PR it
- Adaptation to other CLI/IDE tools → PR

**Not welcome**:
- PRs that make the skill "friendlier", "gentler", "more encouraging" — that violates Anti-Sycophancy
- PRs that make Claude offer candidate answers — that violates Mirror Principle

---

## Related Projects

- [nuwa-skill](https://github.com/alchaincyf/nuwa-skill) – distills how famous minds think (Munger, Musk, Naval)
- [colleague-skill](https://github.com/titanwings/colleague-skill) – distills your colleagues
- **growth** (this project) – distills your own thinking (opposite direction)

Three projects form a spectrum:
- **Others' answers** ← nuwa-skill ← colleague-skill ← growth → **Your own answers**

---

## Friendly Links

- [linxin.do](https://linxin.do)

---

## License

MIT — use it, modify it, build on it. And if growth makes your judgment sharper, **stop relying on growth**. That's the graduation.
