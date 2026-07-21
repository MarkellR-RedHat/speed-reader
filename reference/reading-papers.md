# Reading academic papers without wasting your afternoon

How I get useful information out of research papers without reading every word. Most papers have 2-3 sections worth your time. The rest is scaffolding.

## The three-pass method

**First pass (5 minutes):** read the title, abstract, introduction (first and last paragraphs), section headings, conclusion, and scan the figures/tables. After this pass you should know: what the paper claims, whether it's relevant to your work, and whether it deserves a deeper read.

**Second pass (15-20 minutes):** read the full introduction, results, and discussion sections. Skip related work unless you need to understand the landscape. Look at every figure and table carefully. After this pass you should be able to summarize the paper to a colleague.

**Third pass (only if needed):** the full paper, methodology and appendices included. Only worth it if you plan to reproduce the work, build on it directly, or review it formally.

## What to look for first

1. **The abstract's last sentence.** This usually contains the headline result or the strongest claim. Start here.
2. **Table 1 or Table 2.** The main comparison table is often the entire paper distilled into numbers. If the numbers aren't compelling, the paper may not be worth your time.
3. **The limitations section.** Most venues require one. It tells you where the work falls short in the authors' own assessment.
4. **The experimental setup.** Check what hardware, software versions, and datasets were used. Results on A100s with synthetic data may not translate to your environment.

## Red flags

- **No comparison to baselines.** If the paper doesn't compare against existing approaches, the results are hard to interpret.
- **Cherry-picked metrics.** Watch for papers that report many metrics but only highlight the ones where they win.
- **Synthetic-only evaluation.** Results that only use synthetic benchmarks or toy datasets may not generalize.
- **Vague methodology.** "We tuned hyperparameters" without saying which ones or how basically means the results aren't reproducible.
- **Missing error bars or confidence intervals.** A single run doesn't tell you if the result is reliable or lucky.

## Reading with your own stack in mind

If you're reading papers to decide what to build (infra, inference serving, that kind of thing), pay special attention to:

- **Hardware assumptions.** Lots of papers assume high-end datacenter GPUs with NVLink or InfiniBand. Check whether the results hold on more commodity setups.
- **Scale.** Papers that evaluate at small scale (single node, small models) may not reflect behavior at the scale you actually run.
- **Software stack.** Note whether the approach needs custom CUDA kernels, specific framework versions, or proprietary dependencies that clash with what you can actually ship.
- **Deployment model.** Research prototypes and production systems have different requirements. Check whether the paper addresses serving, multi-tenancy, or operational concerns at all.
- **Licensing.** Check the license of any code, models, or datasets used. Matters a lot if you want to contribute the work upstream.

## Useful questions to ask yourself

- Would this approach work with my serving stack?
- Does this require hardware I don't have and won't get?
- Could this be contributed upstream to vLLM or another project I care about?
- Is the improvement big enough to justify the integration effort?
- What would break if I tried this at 10x the scale they tested?
