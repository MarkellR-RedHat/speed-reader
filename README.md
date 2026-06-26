# ai-bu-speed-reader

Claude Code slash commands that turn 30-page PDFs into actionable intelligence in under a minute. Built for engineers who read papers to make decisions, not to write book reports.

## The Two Commands You Will Use Most

### `/speedread-verdict` -- Should I read this?

Someone drops a paper in Slack. You have 30 seconds. Run this.

```
/speedread-verdict path/to/paper.pdf
```

You get: a one-sentence verdict (read it, skim it, or skip it), the strongest and weakest arguments, what is genuinely novel vs. well-known, what is missing, and one takeaway to remember. Decisive, not diplomatic.

### `/speedread-implement` -- How would we use this?

You read a paper and thought "we could build that." Run this.

```
/speedread-implement path/to/paper.pdf
```

You get: the core idea translated into engineering terms, what we would build, the simplest proof of concept (days not months), infrastructure requirements, risks, t-shirt-sized effort estimates, and a go/no-go recommendation.

## All 11 Commands

### Core

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `/speedread` | Full structured summary with chain-of-thought analysis, confidence-tagged claims, and engineering impact assessment | Default starting point for any document |
| `/speedread-verdict` | One-sentence verdict, strongest/weakest arguments, novelty assessment | When someone asks "should I read this?" |
| `/speedread-bullets` | 5-7 bullet points, no headers, no filler | Drop into Slack or a status update |

### Deep Analysis

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `/speedread-implement` | Translates research into PoC specs, effort estimates, and go/no-go recommendations | When you are considering building something based on a paper |
| `/speedread-bias` | Methodology audit with trust score (1-10), covering sample size, benchmark fairness, baseline validity, reproducibility, and conflicts of interest | Before you trust a paper enough to build on it |
| `/speedread-chain` | Maps the 5 most important references, traces the intellectual lineage, produces a reading order for newcomers | When you need to understand a research area, not just one paper |
| `/speedread-annotate` | Annotated version with inline critical commentary on claims, numbers, methodology choices, and gaps | When you want a senior engineer's margin notes |

### Extraction and Comparison

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `/speedread-compare` | Side-by-side comparison of two documents with a clear winner | When you need to choose between two approaches |
| `/speedread-extract` | Extracts every number, tool, limitation, open question, and uncited claim | Building comparison spreadsheets or tracking research tools |
| `/speedread-questions` | 5-7 peer-reviewer-quality questions that probe genuine weaknesses | Meeting prep, reading groups, or pressure-testing before you build |
| `/speedread-eli5` | Plain-language explanation in under 300 words, no jargon | Briefing a PM, director, or someone from another team |

All commands automatically detect document type (academic paper, RFC/spec, blog post, product docs, report) and adjust their analysis accordingly.

## Install

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-speed-reader.git
cd ai-bu-speed-reader
bash install.sh
```

This copies the command files to `~/.claude/commands/`. Restart Claude Code to pick them up.

## Usage

Every command takes a file path or URL as input:

```
/speedread path/to/paper.pdf
/speedread https://arxiv.org/abs/2401.12345
/speedread-compare paper-a.pdf paper-b.pdf
/speedread-verdict https://blog.example.com/new-inference-engine
```

## What Makes These Commands Different

These are not generic summarizers. Every command includes:

- **Chain-of-thought reasoning:** The command walks through a structured analysis process before producing output. It classifies the document, identifies the core contribution, evaluates the evidence, and maps the implications before writing a single word of summary.
- **Self-critique:** Before outputting, the command checks whether its summary captures what makes THIS document unique, whether the implications are grounded in specific engineering actions, and whether it is using exact numbers instead of approximations.
- **Anti-pattern avoidance:** The commands are explicitly told not to summarize every section equally, not to use "interesting" without explaining why, not to miss the core contribution in favor of peripheral details, and not to produce a summary that could describe any paper in the field.
- **Document-type awareness:** Academic papers, RFCs, blog posts, product docs, and reports each get different treatment. A blog post gets its marketing claims flagged. An RFC gets its migration burden assessed. A paper gets its baselines checked.

## Example Output

### `/speedread-verdict` on an inference optimization paper

```
## Verdict
Read this. First rigorous evidence that disaggregated inference scales past 32
GPUs with sub-linear overhead, and we are betting our llm-d architecture on
exactly that claim being true.

## The Strongest Argument
The KV cache transfer overhead measurements are comprehensive: tested across
5 sequence lengths, 3 network configurations, and 2 model architectures,
consistently showing sub-15ms transfer times. This is the hardest data point
in the paper and the most useful for our work.

## The Weakest Argument
The "linear scaling" claim is based on throughput measurements up to 32 GPUs
only, then extrapolated. The one data point they have at 64 GPUs shows 15%
lower efficiency than the linear projection, but they describe this as
"approximately linear." It is not.

## What Is Genuinely Novel
The cross-pool scheduling algorithm that balances prefill and decode load
based on real-time memory pressure. Prior disaggregated systems used static
allocation or simple round-robin.

## What Is Well-Known But Presented as Novel
The observation that prefill and decode have different compute profiles. This
has been established since Orca (2022) and is the foundation of most
disaggregated serving work.

## What Is Missing
No evaluation under bursty traffic patterns. All tests use Poisson arrival
rates, which undersells the challenge of real-world request distributions.

## If You Only Remember One Thing
KV cache transfer between disaggregated prefill and decode pools costs less
than 15ms for sequences under 4096 tokens on 100Gbps interconnect -- that is
the number that validates our llm-d architecture.
```

### `/speedread-implement` on the same paper

```
## The Core Idea, Translated
A load balancer that routes inference requests to separate GPU pools for the
"understanding the question" phase and the "generating the answer" phase,
with a lightweight RPC mechanism to transfer cached state between pools.

## What We Would Build
A scheduling component in llm-d that dynamically assigns requests to prefill
or decode pools based on current GPU memory utilization, queried via a sidecar
on each serving node. This would replace the static pool assignment we
currently use.

## Simplest Proof of Concept
- Build: Memory-pressure-aware router in front of two vLLM instances (one
  prefill, one decode) on a single node with simulated network delay
- Measure: Throughput (req/s) and P99 latency vs. baseline unified serving
- Use: Existing vLLM + custom router script + ShareGPT traces
- Effort: 3-5 engineering days

## Infrastructure Requirements
- Hardware: Minimum 100Gbps networking between prefill and decode pools (the
  paper shows 25Gbps adds 40ms to transfers -- too slow for production)
- Software: KV cache serialization/deserialization hooks in vLLM (partially
  available in v0.4+)
- Data: ShareGPT traces for initial validation; enterprise traces for
  production readiness
- Expertise: vLLM internals, gRPC performance tuning

## Risks and Gotchas
- Integration risk: KV cache format changes between vLLM versions could
  break the transfer mechanism
- Scale risk: Paper tested up to 32 GPUs; our target is 128+
- Maintenance risk: Two pool types means two scaling policies, two monitoring
  dashboards, two failure domains
- Dependency risk: Tight coupling to vLLM's KV cache internals

## Estimated Effort
- PoC: 1 engineer, 1 week. "Works" means demonstrating throughput improvement
  on a 2-node setup.
- MVP: 2 engineers, 6 weeks. "Useful" means handling real traffic on a
  staging cluster with automated pool sizing.
- Production-ready: 3 engineers, 1 quarter. Adds monitoring, alerting,
  graceful degradation, and multi-model support.

## The Decision
Pursue as a PoC next sprint. The core technique directly applies to llm-d,
the PoC is cheap (1 week), and the paper's KV cache transfer numbers suggest
the overhead is acceptable for our latency targets. If the PoC shows even
1.5x throughput improvement on our hardware, the MVP is worth funding.
Next step: file a Jira ticket and assign to the llm-d scheduling team.
```

## Reference Materials

The `reference/` directory includes guides for effective technical reading:

- `reference/reading-strategies.md` -- How to read different document types for maximum retention. Covers triage reads (2 minutes), the three-pass method, adversarial reads for papers you plan to build on, and synthesis reads for understanding a research area.
- `reference/common-benchmarks.md` -- What MLPerf, MMLU, HumanEval, SWE-bench, vLLM benchmarks, and others actually measure, their known limitations, and how to interpret claims that cite them.
- `reference/reading-papers.md` -- The three-pass method for academic papers, red flags, and what to look for in our context.
- `reference/reading-rfcs.md` -- How to read RFCs, KEPs, and technical proposals efficiently.

## Supported Input Formats

- PDF files (research papers, reports, specs)
- Markdown files
- Plain text files
- URLs (web pages, blog posts, online docs)

## License

Apache-2.0
