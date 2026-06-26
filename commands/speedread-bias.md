Bias and methodology audit. How much should you trust this document?

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly with a critical eye. Your job is not to summarize -- it is to stress-test the methodology and identify sources of bias that could make the conclusions unreliable.

Before writing, ask yourself: "If I wanted to get these same results on purpose, what experimental choices would I make?" Then check whether the authors made those choices.

### Methodology Checklist

Evaluate each of the following. For each item, state your finding and provide specific evidence from the document. Do not speculate -- base every assessment on what is actually in the document.

## Trust Score: [X/10]
State the score upfront. This is your overall assessment of how much the reader should trust this document's conclusions. Provide a one-sentence justification.

Scoring guide:
- **9-10:** Rigorous methodology, appropriate baselines, results clearly supported, limitations honestly discussed. You would build on this.
- **7-8:** Generally solid but with notable gaps. Usable with caveats.
- **5-6:** Mixed. Some claims are well-supported, others are not. Cherry-pick the reliable parts.
- **3-4:** Significant methodological issues. Use with extreme caution.
- **1-2:** Do not rely on this document's conclusions without independent verification.

## Sample Size and Statistical Rigor
- Is the evaluation conducted on enough data/runs/trials to be meaningful?
- Are error bars, confidence intervals, or variance reported?
- Is the result from a single run, or averaged over multiple trials?
- For ML papers: is the random seed fixed, and are results reported across multiple seeds?

## Benchmark and Dataset Selection
- Are the benchmarks standard and well-understood, or custom and self-selected?
- Do the benchmark choices favor the proposed approach? Would a different benchmark tell a different story?
- Are the datasets representative of real-world conditions, or are they synthetic/toy/curated to make results look good?
- Is there a mix of easy and hard benchmarks, or only ones where the approach excels?

## Baseline Comparisons
- Are the baselines current? Check if the comparison is against the actual state of the art or an outdated version.
- Are the baselines configured fairly? A poorly-tuned baseline makes anything look good.
- Are there obvious baselines that should have been included but were not? This is often the most revealing gap.
- If the paper compares against its own prior work, is the improvement meaningful or within noise?

## Results Presentation
- Are results cherry-picked? Look for: reporting many metrics but highlighting only favorable ones, showing results on some benchmarks but not others, or using unusual metric definitions.
- Are there claims in the abstract or introduction that are not fully supported by the results section?
- Do the figures and tables tell the same story as the text? Sometimes the data contradicts the narrative.
- Are ablation studies present? Without them, you cannot tell which component of the approach actually works.

## Reproducibility
- Is the description detailed enough to reimplement? Could you reproduce these results with what is provided?
- Is code available? Is it the actual experimental code, or a cleaned-up version that may not match the paper's results?
- Are hyperparameters, training details, and hardware specs fully specified?
- Are the datasets publicly available, or would reproduction require private data?

## Conflict of Interest and Incentive Structure
- Who funded this work? Do the conclusions conveniently support the funder's products or agenda?
- Are the authors affiliated with a company that sells something related to the paper's topic?
- Is this work from a team that needs positive results to justify continued funding?
- Does the paper acknowledge these conflicts, or ignore them?

## Failure Mode Discussion
- Do the authors discuss when their approach fails?
- Are failure modes specific ("fails on sequences longer than 8192 tokens with batch sizes above 16") or vague ("may not generalize to all settings")?
- Is there analysis of why failures occur, or just acknowledgment that they exist?

## Overall Bias Assessment
A paragraph summarizing the document's overall reliability. State:
- The direction of any bias (does it overstate or understate results?)
- The severity (minor methodological quirk vs. fundamental flaw that invalidates conclusions)
- What you can still trust from this document despite the issues
- What you should verify independently before acting on

### Document-type-specific guidance

**Academic papers:** Apply the full checklist. Pay special attention to benchmark selection and baseline fairness -- these are the most common sources of inflated results in ML papers.

**RFCs and specs:** Focus on the conflict of interest section (who proposed this and what do they gain?) and whether the alternatives considered section is honest about trade-offs. Check if the proposal was written by someone who already has an implementation.

**Blog posts:** Focus on uncited claims, missing methodology, and the conflict of interest between the author's employer and the blog's conclusions. Blog posts are not peer-reviewed; apply proportional skepticism.

**Product docs:** Focus on benchmark conditions (are they realistic?), what is not documented (silent limitations), and whether the comparison against competitors is fair.

Keep total output under 600 words. The trust score should be the first thing the reader sees.
