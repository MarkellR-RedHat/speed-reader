# ai-bu-speed-reader

Claude Code commands for producing structured summaries of technical papers, long documents, and web pages. Built for engineers who need to extract the signal from a 30-page PDF in under a minute.

## What It Does

Three slash commands for Claude Code:

- `/speedread` - Full structured summary: TL;DR, key claims, methodology, results, relevance to our work, limitations, and key figures/tables. Stays under 500 words unless you ask for more.
- `/speedread-compare` - Takes two papers or docs and produces a side-by-side comparison: where they agree, where they disagree, and which is more relevant to our work.
- `/speedread-bullets` - Ultra-short variant. 5-7 bullet points. For when someone drops a paper in Slack and you need the gist in 30 seconds.

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

## Example Output

Running `/speedread` on a hypothetical inference optimization paper:

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

## Supported Input Formats

- PDF files (research papers, reports, specs)
- Markdown files
- Plain text files
- URLs (web pages, blog posts, online docs)

## License

Apache-2.0
