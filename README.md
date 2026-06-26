# ai-bu-speed-reader

You have 15 papers in your to-read pile. You will get to three of them this quarter. Maybe. The rest sit there, accumulating guilt and potentially containing the one insight that would have changed your design.

What if you could get the key insight from all fifteen in an afternoon?

## Before and After

**Before speed-reader:** Someone drops a paper in Slack. You open it, skim the abstract, promise yourself you will read it this weekend. You do not read it this weekend. Three months later you discover it described the exact architecture you just spent two sprints building from scratch.

**After speed-reader:** Someone drops a paper in Slack. You run `/speedread-verdict paper.pdf`. Sixty seconds later you know whether to read it, skim it, or skip it, and why. You run `/speedread-implement paper.pdf` on the one that matters and walk into standup with a PoC plan and realistic effort estimates.

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

That is it. You will get a decisive, opinionated verdict in under a minute.

## What You Get

These are not summaries. A summary gives you the gist. These commands give you the insight you would have gotten if you had read the paper carefully: the core contribution, the methodology gaps, the practical implications, and an honest assessment of whether the paper is worth your time at all.

### Example: `/speedread-verdict`

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

### Example: `/speedread-implement`

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

## All 11 Commands

### Core

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `/speedread` | Full structured analysis with chain-of-thought reasoning, confidence-tagged claims, and engineering impact assessment | Default starting point for any document |
| `/speedread-verdict` | Decisive verdict: read it, skim it, or skip it, with the strongest and weakest arguments | When someone asks "should I read this?" |
| `/speedread-bullets` | 5-7 bullet points, no headers, no filler | Drop into Slack or a status update |

### Deep Analysis

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `/speedread-implement` | Translates research into PoC specs, realistic effort estimates, and go/no-go recommendations | When you are considering building something from a paper |
| `/speedread-bias` | Skeptical peer review with trust score (1-10), covering baselines, benchmarks, statistics, and conflicts of interest | Before you trust a paper enough to build on it |
| `/speedread-chain` | Maps the intellectual lineage, traces the 5 most important references, produces a pedagogical reading order | When you need to understand a research area, not just one paper |
| `/speedread-annotate` | Inline margin notes from a skeptical senior engineer on every major claim, number, and methodology choice | When you want someone experienced reading over your shoulder |

### Extraction and Comparison

| Command | What it does | When to use it |
|---------|-------------|----------------|
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

## What Makes These Different

Every prompt is written from the perspective of a skeptical engineer who has already read the document and is now briefing a busy colleague. The output is not a summary. It is advice.

- **Opinionated, not diplomatic.** `/speedread-verdict` will tell you to skip a paper. `/speedread-bias` will give a trust score of 3/10 if the methodology is weak. These commands respect your time by being direct.
- **Calibrated to production reality.** `/speedread-implement` automatically discounts paper results for real-world conditions. A "3x improvement" on synthetic benchmarks becomes "expect 1.5-2x with real traffic" with specific reasoning for the adjustment.
- **Self-critical before output.** Every command checks whether its analysis captures what makes THIS document unique, whether implications are grounded in specific engineering actions, and whether it is using exact numbers from the source.
- **Document-type-aware.** Academic papers get their baselines checked. Blog posts get their marketing claims flagged. RFCs get their migration burden assessed. Product docs get their lock-in risks called out.
- **No academic hedging.** You will never see "results suggest," "further research is needed," or "it could be argued" in the output. You get a direct assessment from someone who reads papers to find what is useful for production, not to admire the methodology.

## Reference Materials

The `reference/` directory includes practical guides for technical reading:

- `reference/reading-strategies.md` - Six reading strategies matched to different goals: triage reads (2 minutes), three-pass method, adversarial reads, synthesis reads, executive reads, and implementation reads.
- `reference/common-benchmarks.md` - What MLPerf, MMLU, HumanEval, SWE-bench, vLLM benchmarks, and others actually measure, their known limitations, and how to spot inflated claims that cite them.
- `reference/reading-papers.md` - The three-pass method for academic papers, red flags to watch for, and what to look for in our specific context.
- `reference/reading-rfcs.md` - How to read RFCs, KEPs, and technical proposals efficiently.

## Supported Input Formats

- PDF files (research papers, reports, specs)
- Markdown files
- Plain text files
- URLs (web pages, blog posts, online docs)

## License

Apache-2.0
