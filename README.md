# Speed Reader

**You have 15 papers in your to-read pile. You will get to three of them this quarter. Maybe.**

The rest sit there, accumulating guilt and potentially containing the one insight that would have changed your design. Speed Reader gives you the key insight from all fifteen in an afternoon.

## Before and After

**Before:** Someone drops a paper in Slack. You open it, skim the abstract, promise yourself you will read it this weekend. You do not read it this weekend. Three months later you discover it described the exact architecture you just spent two sprints building from scratch.

**After:** Someone drops a paper in Slack. You run `/speedread-verdict paper.pdf`. Sixty seconds later you know whether to read it, skim it, or skip it, and why. You run `/speedread-implement paper.pdf` on the one that matters and walk into standup with a PoC plan and realistic effort estimates.

## Quick Start

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-speed-reader.git
cd ai-bu-speed-reader
bash install.sh
```

Then restart Claude Code and try this on any PDF, markdown file, or URL:

```
/speedread-verdict path/to/paper.pdf
```

That is it. You get a decisive, opinionated verdict in under a minute.

## Example Output

These are not summaries. Summaries give you the gist. These commands give you the insight you would have gotten if you had read the paper carefully: the core contribution, the methodology gaps, the practical implications, and an honest assessment of whether the paper is worth your time at all.

### `/speedread-verdict`

```
## Verdict
Skip this one. The core finding (that prefill and decode benefit from
separate GPU pools) was already demonstrated in Splitwise (Patel et al.,
2024) with stronger methodology and more realistic workloads. The only
new contribution here is the scheduling heuristic in Section 4.2, and it
is evaluated on synthetic traces only.

## The Weakest Argument
They report only mean latency, not P99. The benchmark uses batch size 1,
which flatters their approach. They compare against the previous version
of their own system, not against vLLM or TGI.

## If You Only Remember One Thing
Save your 45 minutes. Read Splitwise instead if you haven't already.
```

### `/speedread-implement`

```
## The Core Idea, Translated
A load balancer that routes inference requests to separate GPU pools for
the "understanding the question" phase and the "generating the answer"
phase. It is gRPC-based request routing with a feedback loop.

## Simplest Proof of Concept
- Build: Memory-pressure-aware router in front of two vLLM instances
- Measure: Throughput (req/s) and P99 latency vs. baseline unified serving
- Use: Existing vLLM + custom router script + our production traces
- Effort: 3-5 engineering days

## The Decision
Pursue as a PoC next sprint. Even if the paper's 3x number drops to 1.5x
in our environment, that is still worth the MVP investment. If the PoC
shows less than 1.3x, stop.
```

## Commands

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `/speedread` | Full structured analysis with chain-of-thought reasoning, confidence-tagged claims, and engineering impact assessment | Default starting point for any document |
| `/speedread-verdict` | Decisive verdict: read it, skim it, or skip it, with the strongest and weakest arguments | When someone asks "should I read this?" |
| `/speedread-bullets` | 5-7 bullet points, no headers, no filler | Drop into Slack or a status update |
| `/speedread-implement` | Translates research into PoC specs, realistic effort estimates, and go/no-go recommendations | When you are considering building something from a paper |
| `/speedread-bias` | Skeptical peer review with trust score (1-10), covering baselines, benchmarks, statistics, and conflicts of interest | Before you trust a paper enough to build on it |
| `/speedread-chain` | Maps the intellectual lineage, traces the 5 most important references, produces a pedagogical reading order | When you need to understand a research area, not just one paper |
| `/speedread-annotate` | Inline margin notes from a skeptical senior engineer on every major claim, number, and methodology choice | When you want someone experienced reading over your shoulder |
| `/speedread-compare` | Side-by-side comparison of two documents with a clear winner and the reasoning behind it | When you need to choose between two approaches |
| `/speedread-extract` | Extracts every number, tool, limitation, open question, and uncited claim with full context | Building comparison spreadsheets or populating decision matrices |
| `/speedread-questions` | 5-7 peer-reviewer-quality questions that target specific gaps, not general areas | Meeting prep, reading groups, or pressure-testing before you build |
| `/speedread-eli5` | Plain-language explanation in under 300 words that a PM could brief to leadership | Briefing someone from another team who is smart but not in your field |

All commands automatically detect document type (academic paper, RFC/spec, blog post, product docs, report) and adjust their analysis accordingly.

## Usage

Every command takes a file path or URL as input:

```
/speedread path/to/paper.pdf
/speedread https://arxiv.org/abs/2401.12345
/speedread-compare paper-a.pdf paper-b.pdf
/speedread-verdict https://blog.example.com/new-inference-engine
```

Supported formats: PDF, Markdown, plain text, and URLs (web pages, blog posts, online docs).

### Typical workflow

1. **Triage with `/speedread-verdict`** on every paper that lands in your queue.
2. **Go deep with `/speedread`** on the ones worth reading.
3. **Run `/speedread-bias`** before you trust a paper enough to build on it.
4. **Use `/speedread-implement`** to turn the winner into a PoC plan with effort estimates.
5. **Extract with `/speedread-bullets`** and drop the summary into Slack, a status update, or a [`/status-report`](https://github.com/MarkellR-RedHat/ai-bu-status-report).

**Tip:** One engineer ran `/speedread-verdict` on a backlog of 23 papers before a design review. Eleven got "skip," eight got "skim Section 4 only," and four got "read." The four that mattered went through `/speedread-implement`, and two became sprint items. Total time from backlog to prioritized PoC list: 90 minutes. That backlog had been sitting untouched for six weeks.

### Cross-tool workflows

Speed Reader pairs well with other tools in the suite:

- Run `/speedread-bullets` on a paper, then feed the output to [`/cfp-generator`](https://github.com/MarkellR-RedHat/ai-bu-cfp-generator) when the research inspires a talk proposal.
- Use `/speedread-extract` to pull key numbers, then reference them in a [`/slide-outliner`](https://github.com/MarkellR-RedHat/ai-bu-slide-outliner) presentation.
- After `/speedread-implement` produces a PoC plan, track progress with [`/shipped-digest`](https://github.com/MarkellR-RedHat/ai-bu-shipped-digest).
- Feed `/speedread-eli5` output into [`/message-polisher`](https://github.com/MarkellR-RedHat/ai-bu-message-polisher) when briefing stakeholders outside your domain.

## How It Works

Every prompt is written from the perspective of a skeptical engineer who has already read the document and is now briefing a busy colleague. The output is not a summary. It is advice.

- **Opinionated, not diplomatic.** `/speedread-verdict` will tell you to skip a paper. `/speedread-bias` will give a trust score of 3/10 if the methodology is weak. These commands respect your time by being direct.
- **Calibrated to production reality.** `/speedread-implement` automatically discounts paper results for real-world conditions. A "3x improvement" on synthetic benchmarks becomes "expect 1.5-2x with real traffic" with specific reasoning for the adjustment.
- **Document-type-aware.** Academic papers get their baselines checked. Blog posts get their marketing claims flagged. RFCs get their migration burden assessed. Product docs get their lock-in risks called out.
- **No academic hedging.** You will never see "results suggest," "further research is needed," or "it could be argued" in the output. You get a direct assessment from someone who reads papers to find what is useful for production, not to admire the methodology.

## Reference Materials

The `reference/` directory includes practical guides for technical reading:

- `reference/reading-strategies.md` - Six reading strategies matched to different goals: triage reads (2 minutes), three-pass method, adversarial reads, synthesis reads, executive reads, and implementation reads.
- `reference/common-benchmarks.md` - What MLPerf, MMLU, HumanEval, SWE-bench, vLLM benchmarks, and others actually measure, their known limitations, and how to spot inflated claims that cite them.
- `reference/reading-papers.md` - The three-pass method for academic papers, red flags to watch for, and what to look for in our specific context.
- `reference/reading-rfcs.md` - How to read RFCs, KEPs, and technical proposals efficiently.

## Contributing

Open an issue or PR. If a command gave you bad advice, tell us what it said and why it was wrong.

## License

Apache-2.0
