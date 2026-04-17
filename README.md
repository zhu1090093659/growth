# growth

> **AI 时代最反潮流的一套 skill：不替你思考，只逼你思考。**

**中文** | [English](./README.en.md)

[![Stars](https://img.shields.io/github/stars/zhu1090093659/growth?style=flat&logo=github&label=Stars)](https://github.com/zhu1090093659/growth/stargazers)
[![Forks](https://img.shields.io/github/forks/zhu1090093659/growth?style=flat&logo=github&label=Forks)](https://github.com/zhu1090093659/growth/network/members)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Claude%20Code%20%7C%20Codex%20%7C%20Gemini%20%7C%20Cursor-e74c3c)

当所有 AI 工具都在告诉你"我帮你更快写代码、更快写文档、更快做判断"时，growth 做的是完全相反的事：**它让你慢下来，问出那些你不愿意问自己的问题。**

因为在 AI 可靠的未来，真正稀缺的不是生产力，是**你自己的判断力、品味、意图清晰度和抽象能力**。这些能力无法被蒸馏，只能在你自己的大脑里长出来。growth 是为了训练它们而做的。

---

## 目录

- [这是什么](#这是什么)
- [四个 skill](#四个-skill)
- [效果示例](#效果示例)
- [平台兼容性](#平台兼容性)
- [安装](#安装)
- [设计哲学](#设计哲学)
- [诚实边界](#诚实边界)
- [用法建议](#用法建议)
- [诚实的版本说明](#诚实的版本说明)
- [Roadmap](#roadmap)
- [贡献](#贡献)
- [相关项目](#相关项目)
- [友情链接](#友情链接)
- [License](#license)

---

## 这是什么

growth 是一套**思考训练 skill**，装到你的 AI 编程工具里，不会替你写代码，只会在你准备写代码之前、之中、之后，逼你把那些没想清楚的问题想清楚。

四个 skill 分别处理四种心智卡点：代码/设计好不好、需求到底要什么、决策哪里可能错、抽象是否够好。它们不提供答案，只提供越来越锋利的问题。

---

## 四个 skill

| Skill | 触发场景 | 核心问题 |
|---|---|---|
| **taste-audit** | 已经有代码/设计在手，想判断好不好 | 这东西美不美？丑在哪？ |
| **intent-refine** | 想做某事但描述模糊，在定义需求 | 你到底想要什么？为什么？ |
| **judgment-redteam** | 做出了决策，倾向某个方案 | 你哪里可能是错的？ |
| **abstraction-uplift** | 代码已经 work，想问"还能不能更好" | 当前抽象合理吗？ |

---

## 效果示例

跟 nuwa-skill 蒸馏"别人怎么想"不同，growth 做的是**让你自己想**。下面是一段真实的 taste-audit 交互示例：

```
用户      ❯ 帮我看看这段代码写得怎么样？
            [贴了一段 200 行的 Python 类]

Claude    ❯ Phase 1 → 激活感受

            先不谈技术——你读这段代码的第一感觉是什么？
            一个词形容。

用户      ❯ 还行吧，能跑

Claude    ❯ "还行"是真没感觉，还是感觉没想清楚？
            你再读一遍，这 200 行里，有没有一行你其实不想让别人看到？
            具体是第几行？
```

这不是在帮用户"点评"，是在把判断的责任**推回给用户**。Claude 的角色是镜子，不是评审员。

---

## 平台兼容性

| 平台 | 安装方式 | Skill 位置 | 备注 |
|---|---|---|---|
| Claude Code | 官方插件市场 | `~/.claude/plugins/cache/…` | 带命名空间：`/growth:taste-audit` |
| Codex CLI | `./install.sh codex` | `~/.codex/skills/` | SKILL.md 与 Claude Code 互通 |
| Gemini CLI | `gemini extensions install` | Gemini extension | 带 `GEMINI.md` context |
| Cursor | `./install.sh cursor` | `.cursor/rules/` | `.mdc` 格式 |

---

## 安装

四个平台都支持，根据你用的工具选一个：

### Claude Code

通过官方插件市场安装（[docs](https://code.claude.com/docs/en/plugin-marketplaces)）：

```
/plugin marketplace add YOUR_USERNAME/growth
/plugin install growth@growth
```

装好后，四个 skill 会带命名空间前缀出现：`/growth:taste-audit`、`/growth:intent-refine`、`/growth:judgment-redteam`、`/growth:abstraction-uplift`。

更新：`/plugin marketplace update growth`。卸载：`/plugin uninstall growth@growth`。

> 本地调试可以 `git clone` 后用 `/plugin marketplace add ./growth`，或 `claude --plugin-dir ./growth` 直接加载。

### Codex CLI

Codex 的 SKILL.md 格式和 Claude Code 完全兼容，直接：

```bash
./install.sh codex
```

或手动复制到 `~/.codex/skills/`（Codex 的 Agent Skills 位置）。

### Gemini CLI

Gemini 以 extension 的方式安装：

```bash
gemini extensions install https://github.com/YOUR_USERNAME/growth/tree/main/platforms/gemini-cli
```

或本地路径：

```bash
gemini extensions install ./platforms/gemini-cli
```

### Cursor

```bash
./install.sh cursor
```

会把 `platforms/cursor/rules/*.mdc` 复制到当前项目的 `.cursor/rules/` 目录。也可以复制到用户全局位置（`~/.cursor/rules/`）。

---

## 设计哲学

### 三条铁律

每个 skill 的 SKILL.md 开头都写着这三条，Claude 必须遵守：

**1. 镜子原则（Mirror Principle）**
Skill 不是顾问，是镜子。禁止说"我觉得这里应该……"，只说"你觉得这里怎么样？"

**2. 苏格拉底纪律（Socratic Discipline）**
只问问题，不给答案。问题分三层锋利度：激活 → 刺破 → 重构。

**3. 抗柔顺原则（Anti-Sycophancy）**
**用户感到舒适 = skill 失败。用户感到被挑战 = skill 成功。**
不接受"差不多就这样吧"作为退出，除非它真的已经被想透了。

### 为什么不蒸馏"答案"而是蒸馏"问题"

市面上有很多很棒的 skill 在蒸馏**别人怎么想**（比如 [nuwa-skill](https://github.com/alchaincyf/nuwa-skill) 蒸馏马斯克、芒格）。这类 skill 的价值是**让你拥有一个更好的顾问**。

growth 做的是相反的事：**让你成为更好的自己**。

这里有一个取舍：
- 蒸馏别人 → 你得到更好的建议，但你自己的能力不长
- 蒸馏问题 → 你得不到答案，但你被迫自己找答案，长期下来你自己的判断力在长

两条路都对，看你选什么。growth 选后者。

---

## 诚实边界

这套 skill 做不到的事，先说在前面：

- **给不了品味** —— 品味只能在你自己做东西、看反馈中长出来
- **给不了判断** —— 判断需要你在真实决策里犯错、复盘、内化
- **给不了意图清晰度** —— 意图清晰度来自你对自己的诚实
- **给不了抽象能力** —— 抽象能力来自你对大量具体的内化

这套 skill **只能**做到：**在你准备思考的时候，逼你思考得更狠一层。**

如果你没有思考的意愿，skill 帮不了你。如果你有，skill 会让你的思考质量提高 30%-50%。就够了。

---

## 用法建议

1. **不要同时用多个 skill**——它们心智模式不一样，混用会打架。一次一个。
2. **留时间让自己想**——被 skill 问住的时候不要急着答，先走一圈再回来。
3. **记录你的"盲点时刻"**——skill 问出你之前没想过的东西时，写下来。这是你能力增长的真实轨迹。
4. **定期扔掉 skill**——每隔一段时间不用 skill 自己走一遍流程。如果你能自己问出同样的问题，说明内化成功。

**终极目标是扔掉 skill**——哪天你看着这四个 SKILL.md 说"这些问题我脑子里自动就有"，就是真的长出来了。

---

## 诚实的版本说明

这套 skill 目前是 **v0.1 公开实验**。问题库是作者根据经验设计的，但还没有经过大量实战验证。预计 3 个月内会基于真实使用反馈做大改。

如果你试用后发现某个问题很准、某个问题很废，欢迎开 issue 或 PR 告诉我。v0.2 会根据反馈演进。

---

## Roadmap

- [x] v0.1: 四个 skill 的 Claude Code 版本
- [x] v0.1: Codex CLI 兼容（SKILL.md 格式互通）
- [x] v0.1: Cursor rules 适配（.mdc 格式）
- [x] v0.1: Gemini CLI extension
- [ ] v0.2: 基于 3 个月使用反馈的问题库迭代
- [ ] v0.2: 英文版 SKILL.md（目前仅中文）
- [ ] v0.3: "taste-audit for prose"（审查写作品味，不只是代码）
- [ ] v0.3: 更多思考训练 skill（可能：first-principles drill、analogy-finder）

---

## 贡献

欢迎 PR 和 issue。特别欢迎：
- 某个问题击中了你 → 告诉我（为了保留它）
- 某个问题让你觉得废话 → 告诉我（为了删掉它）
- 你加的新问题效果很好 → PR 过来
- 其他 CLI/IDE 平台的适配 → PR

**不欢迎**的 PR：
- 让 skill 变得"更友好"、"更温和"、"更鼓励用户" —— 这违反抗柔顺原则
- 让 Claude 在 skill 中给出候选答案 —— 这违反镜子原则

---

## 相关项目

- [nuwa-skill](https://github.com/alchaincyf/nuwa-skill) - 蒸馏别人怎么想（芒格、马斯克、Naval）
- [colleague-skill](https://github.com/titanwings/colleague-skill) - 蒸馏你的同事
- **growth**（本项目）- 蒸馏你自己的思考（反方向）

三个项目组成一个光谱：
- **别人的答案** ← nuwa-skill ← colleague-skill ← growth → **你自己的答案**

---

## 友情链接

- [linxin.do](https://linxin.do)

---

## License

MIT — 随便用，随便改，随便造。如果 growth 让你的判断力变强了，记得**别再依赖 growth**，那是毕业的时候。
