# Speed Reader

So you've got 15 papers in your to-read pile. You'll get to three of them this quarter. Maybe.

The rest just sit there, accumulating guilt and possibly containing the one insight that would've changed your design. I built this to get the key insight out of all fifteen in an afternoon.

## before and after

**Before:** someone drops a paper in Slack. You open it, skim the abstract, promise yourself you'll read it this weekend. You don't read it this weekend. Three months later you find out it described the exact architecture you just spent two sprints building from scratch.

**After:** someone drops a paper in Slack. You run `/speedread-verdict paper.pdf`. Sixty seconds later you know whether to read it, skim it, or skip it, and why. Run `/speedread-implement paper.pdf` on the one that matters and walk into standup with a PoC plan and realistic effort estimates.

## quick start

```bash
git clone https://github.com/MarkellR-RedHat/speed-reader.git
cd speed-reader
bash install.sh
```

Then restart Claude Code and try this on any PDF, markdown file, or URL:

```
/speedread-verdict path/to/paper.pdf
```

That's it. You get a decisive, opinionated verdict in under a minute.

## example output

These aren't summaries. Summaries give you the gist. These commands give you what you'd have gotten from actually reading the paper carefully: the core contribution, the methodology gaps, the practical implications, and an honest call on whether it's worth your time at all.

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

## commands

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

## usage

Every command takes a file path or URL as input:

```
/speedread path/to/paper.pdf
/speedread https://arxiv.org/abs/2401.12345
/speedread-compare paper-a.pdf paper-b.pdf
/speedread-verdict https://blog.example.com/new-inference-engine
```

Supported formats: PDF, Markdown, plain text, and URLs (web pages, blog posts, online docs).

### typical workflow

1. Triage with `/speedread-verdict` on every paper that lands in your queue.
2. Go deep with `/speedread` on the ones worth reading.
3. Run `/speedread-bias` before you trust a paper enough to build on it.
4. Use `/speedread-implement` to turn the winner into a PoC plan with effort estimates.
5. Extract with `/speedread-bullets` and drop the summary into Slack, a status update, or a [`/status-report`](https://github.com/MarkellR-RedHat/status-report).

Honestly, the triage step alone is the payoff. I once ran `/speedread-verdict` on a backlog of 23 papers before a design review. Eleven got "skip," eight got "skim Section 4 only," and four got "read." The four that mattered went through `/speedread-implement`, and two became sprint items. Total time from backlog to prioritized PoC list: 90 minutes. That backlog had been sitting untouched for six weeks.

### works with my other tools

Speed Reader plays nicely with the rest of my toolkit:

- Run `/speedread-bullets` on a paper, then feed the output to [`/cfp`](https://github.com/MarkellR-RedHat/cfp-generator) when the research inspires a talk proposal.
- Use `/speedread-extract` to pull key numbers, then reference them in a [`/slides`](https://github.com/MarkellR-RedHat/slide-outliner) presentation.
- After `/speedread-implement` produces a PoC plan, track progress with [`/shipped`](https://github.com/MarkellR-RedHat/shipped-digest).
- Feed `/speedread-eli5` output into [`/polish`](https://github.com/MarkellR-RedHat/message-polisher) when briefing stakeholders outside your domain.

## how it works

Every prompt is written from the perspective of a skeptical engineer who's already read the document and is now briefing a busy colleague. The output isn't a summary. It's advice.

- **Opinionated, not diplomatic.** `/speedread-verdict` will tell you to skip a paper. `/speedread-bias` will hand out a 3/10 trust score if the methodology is weak. Being direct is the whole point.
- **Calibrated to production reality.** `/speedread-implement` discounts paper results for real-world conditions. A "3x improvement" on synthetic benchmarks becomes "expect 1.5-2x with real traffic," with specific reasoning for the adjustment.
- **Document-type-aware.** Academic papers get their baselines checked. Blog posts get their marketing claims flagged. RFCs get their migration burden assessed. Product docs get their lock-in risks called out.
- **No academic hedging.** You'll never see "results suggest," "further research is needed," or "it could be argued" in the output. You get a direct assessment from someone reading papers to find what's useful in production, not to admire the methodology.

## reference materials

The `reference/` directory has some practical guides for technical reading:

- `reference/reading-strategies.md` - Six reading strategies matched to different goals: triage reads (2 minutes), three-pass method, adversarial reads, synthesis reads, executive reads, and implementation reads.
- `reference/common-benchmarks.md` - What MLPerf, MMLU, HumanEval, SWE-bench, vLLM benchmarks, and others actually measure, their known limitations, and how to spot inflated claims that cite them.
- `reference/reading-papers.md` - The three-pass method for academic papers, red flags to watch for, and what to check before building on a result.
- `reference/reading-rfcs.md` - How to read RFCs, KEPs, and technical proposals efficiently.

## contributing

Open an issue or PR. If a command gave you bad advice, tell me what it said and why it was wrong.

## license

Apache-2.0
