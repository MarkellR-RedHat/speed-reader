# Reading Academic Papers Without Wasting Your Afternoon

A practical guide for engineers who need to extract useful information from research papers without reading every word. Most papers have 2-3 sections worth your time. The rest is scaffolding.

## The Three-Pass Method

**First pass (5 minutes):** Read the title, abstract, introduction (first and last paragraphs), section headings, conclusion, and scan the figures/tables. After this pass, you should know: what the paper claims, whether it is relevant to your work, and whether it is worth a deeper read.

**Second pass (15-20 minutes):** Read the full introduction, results, and discussion sections. Skip the related work section unless you need to understand the landscape. Look at every figure and table carefully. After this pass, you should be able to summarize the paper to a colleague.

**Third pass (only if needed):** Read the full paper including methodology and appendices. This is only necessary if you plan to reproduce the work, build on it directly, or review it formally.

## What to Look for First

1. **The abstract's last sentence.** This usually contains the headline result or the strongest claim. Start here.
2. **Table 1 or Table 2.** The main comparison table is often the entire paper distilled into numbers. If the numbers are not compelling, the paper may not be worth your time.
3. **The limitations section.** Authors are required to include this for most venues. It tells you where the work falls short in the authors' own assessment.
4. **The experimental setup.** Check what hardware, software versions, and datasets were used. Results on A100s with synthetic data may not translate to your environment.

## Red Flags

- **No comparison to baselines.** If the paper does not compare against existing approaches, the results are hard to interpret.
- **Cherry-picked metrics.** Watch for papers that report many metrics but only highlight the ones where they win.
- **Synthetic-only evaluation.** Results that only use synthetic benchmarks or toy datasets may not generalize.
- **Vague methodology.** Phrases like "we tuned hyperparameters" without specifying which ones or how means the results are probably not reproducible.
- **Missing error bars or confidence intervals.** A single run does not tell you if the result is reliable or lucky.

## Reading for Our Context

When reading papers relevant to Red Hat AI BU work, pay special attention to:

- **Hardware assumptions.** Many papers assume high-end datacenter GPUs with NVLink or InfiniBand. Check whether results hold on more commodity setups.
- **Scale.** Papers that evaluate at small scale (single node, small models) may not reflect behavior at the scale we operate.
- **Software stack.** Note whether the approach requires custom CUDA kernels, specific framework versions, or proprietary dependencies that conflict with open source goals.
- **Deployment model.** Research prototypes and production systems have different requirements. Check whether the paper addresses serving, multi-tenancy, or operational concerns.
- **Licensing.** Check the license of any code, models, or datasets used. This matters for upstream contributions.

## Useful Questions to Ask Yourself

- Would this approach work with our inference serving stack?
- Does this require hardware we do not have or plan to have?
- Could we contribute this upstream to vLLM, llm-d, or another project we maintain?
- Is the improvement large enough to justify the integration effort?
- What would break if we tried this at 10x the scale they tested?