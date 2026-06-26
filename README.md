# ai-bu-speed-reader

Claude Code commands for producing structured summaries of technical papers, long documents, and web pages. Built for engineers who need to extract the signal from a 30-page PDF in under a minute.

## What It Does

Seven slash commands for Claude Code, each tuned for a different reading task:

- `/speedread` - Full structured summary: TL;DR, key claims, methodology, results, relevance to our work, limitations, and key figures/tables. Stays under 500 words unless you ask for more. Adapts its analysis based on document type (academic paper, RFC, blog post, product doc).
- `/speedread-compare` - Takes two papers or docs and produces a side-by-side comparison: where they agree, where they disagree, and which is more relevant to our work.
- `/speedread-bullets` - Ultra-short variant. 5-7 bullet points. For when someone drops a paper in Slack and you need the gist in 30 seconds.
- `/speedread-annotate` - Produces an annotated version of the document with inline commentary. Like having a senior colleague read it over your shoulder and mark it up.
- `/speedread-questions` - Generates 5-7 sharp discussion questions. Use this to prep before a paper review meeting or reading group.
- `/speedread-extract` - Pulls out structured data: all numbers/metrics, all cited tools/products, all future work items, all limitations. Good for building comparison spreadsheets or tracking what tools a paper uses.
- `/speedread-eli5` - Explains the document in plain language for non-technical stakeholders. No jargon, no acronyms without definitions, concrete analogies.

All commands automatically detect the document type (academic paper, RFC/spec, blog post, product docs, report) and adjust their analysis accordingly.

## Install

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-speed-reader.git
cd ai-bu-speed-reader
bash install.sh
```

This copies the command files to `~/.claude/commands/`. Restart Claude Code to pick them up.

## Usage

### Full summary

```
/speedread path/to/paper.pdf
/speedread https://arxiv.org/abs/2401.12345
```

### Compare two documents

```
/speedread-compare paper-a.pdf paper-b.pdf
```

### Quick bullets

```
/speedread-bullets path/to/paper.pdf
```

### Annotated reading

```
/speedread-annotate path/to/paper.pdf
```

### Meeting prep questions

```
/speedread-questions path/to/paper.pdf
```

### Extract structured data

```
/speedread-extract path/to/paper.pdf
```

### Plain-language explanation

```
/speedread-eli5 path/to/paper.pdf
```

## Example Output

### `/speedread` on an inference optimization paper

```
## TL;DR
This paper introduces a disaggregated serving architecture that separates prefill
and decode phases across GPU pools, achieving 2.3x higher throughput on LLaMA-70B
compared to standard vLLM deployments while maintaining P99 latency under 500ms.

## Key Claims
1. Disaggregating prefill and decode onto separate GPU pools improves throughput
   by 2.3x at equivalent latency targets.
2. KV cache transfer overhead between pools is negligible at less than 3% of
   total request time for sequences under 4096 tokens.
3. The architecture scales linearly with additional decode nodes up to 32 GPUs.

## Methodology
Benchmarked on LLaMA-70B and Mixtral-8x7B using ShareGPT request traces.
Compared against vLLM v0.3.1 baseline on A100-80GB clusters with 100Gbps
interconnect. Measured throughput (requests/sec) and latency (P50, P95, P99).

## Results
- 2.3x throughput improvement on LLaMA-70B at P99 < 500ms
- 1.8x improvement on Mixtral-8x7B
- KV cache transfer: 12ms average for 2048-token sequences
- Linear scaling up to 32 decode GPUs, sublinear beyond that

## So What for Us
Directly relevant to llm-d and our disaggregated inference work. The KV cache
transfer numbers validate our architecture choices. The scaling ceiling at 32
GPUs is worth investigating as we plan larger deployments.

## Limitations and Caveats
- Tested only on A100s with high-bandwidth interconnect. Results on commodity
  networking are unknown.
- ShareGPT traces may not represent enterprise workloads.
- No evaluation of long-context scenarios beyond 4096 tokens.

## Key Figures and Tables
- Figure 2: Throughput vs. latency curves showing the 2.3x improvement window.
- Table 3: KV cache transfer times by sequence length, confirming sub-15ms for
  typical requests.
- Figure 5: Scaling efficiency chart showing the 32-GPU inflection point.
```

### `/speedread-bullets` on a Kubernetes KEP

```
- KEP-4381 proposes DRA (Dynamic Resource Allocation) structured parameters for
  GPU scheduling, replacing the opaque claim-parameter approach with a vendor-neutral
  schema.
- Backward compatible with existing DRA implementations; old-style opaque parameters
  continue to work during the migration window through Kubernetes 1.34.
- GPU topology awareness is now expressible at the API level, which enables the
  scheduler to make placement decisions without vendor-specific plugins.
- Alpha in 1.32, targeted beta in 1.33, with GA graduation criteria requiring at
  least two conformant vendor implementations.
- The main risk is that the structured parameter schema may not capture all
  vendor-specific GPU features, forcing fallback to opaque parameters for advanced
  use cases.
- Directly relevant to our AI workload scheduling work: this would let us express
  multi-GPU topology constraints for inference serving without custom scheduler plugins.
```

### `/speedread-eli5` on a dense ML systems paper

```
## What Is This About?
When AI models answer questions, there is a two-step process: first understanding
the question (prefill), then generating the answer word by word (decode). This
paper asks: what if we used different computers for each step?

## What Did They Do?
Instead of having one computer do both steps, they split the work across two
groups of computers. Think of it like a restaurant where one team takes orders
and a separate team cooks the food, instead of having each waiter also be the chef.

## What Did They Find?
The split approach handled 2.3x more requests in the same amount of time. The
handoff between the two groups added very little delay -- less than 3% of the
total time per request.

## Why Should We Care?
This is basically the architecture we are building with llm-d. Their results
suggest our approach is on the right track and give us real numbers to benchmark
against.

## What Is the Catch?
They only tested on expensive, high-end hardware with fast networking between
machines. We do not know if the results hold on more typical setups.

## One-Sentence Version
Splitting AI inference into two specialized stages on separate hardware doubles
throughput with minimal overhead, which validates the direction of our llm-d project.
```

### `/speedread-extract` on a blog post

```
## Numbers and Metrics
- "3x faster cold start times" - for serverless inference endpoints, compared
  to their previous generation (no specific baseline version given)
- "150ms P99 latency" - for Llama 3 8B at 512 token output length
- "$0.24 per million tokens" - pricing for the standard tier
- "99.9% uptime SLA" - for the enterprise tier only

## Tools, Products, and Technologies
- Llama 3 8B and 70B - used as benchmark models, open source (Meta license)
- vLLM v0.4.1 - mentioned as the baseline they outperform, open source (Apache-2.0)
- NVIDIA TensorRT-LLM - used internally for optimization, proprietary
- Custom CUDA kernels - referenced but not released, proprietary

## Future Work and Open Questions
- Multi-model serving on a single endpoint (described as "coming soon," no date)
- Support for mixture-of-experts architectures (listed on public roadmap)

## Limitations and Constraints
- P99 latency numbers are for batch size 1 only; no data on concurrent requests
- Pricing does not include egress or storage costs
- "3x faster cold start" claim has no methodology or measurement details

## People and Organizations
- No individual authors credited; published by the company's engineering blog
```

## Reference Materials

The `reference/` directory includes reading guides for common document types:

- `reference/reading-papers.md` - Tips for reading academic papers efficiently, including the three-pass method and red flags to watch for.
- `reference/reading-rfcs.md` - Tips for reading RFCs, KEPs, and technical proposals, including what to read first and how to assess migration risk.

## Supported Input Formats

- PDF files (research papers, reports, specs)
- Markdown files
- Plain text files
- URLs (web pages, blog posts, online docs)

## License

Apache-2.0
