Speed-read a technical paper, long document, or web page and produce a summary worth sharing.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then follow this reasoning process before producing output:

### Step 1: Classify and Orient

Identify the document type (academic paper, RFC/spec, blog post, product documentation, report, or other). Note the publication venue, date, and author affiliations. This context shapes how you evaluate the claims.

### Step 2: Find the Core Contribution

Ask yourself: "What does this document argue or demonstrate that did not exist before it was published?" If you cannot answer that in one sentence, re-read until you can. This is the most important step. Everything else flows from it.

### Step 3: Evaluate the Evidence

Separate what is demonstrated from what is claimed. Check: Are the benchmarks realistic or synthetic? Are the baselines current and fair? Are the numbers presented with enough context to interpret (hardware, software versions, dataset sizes, confidence intervals)? Would these results hold if you changed the hardware, scale, or workload distribution?

### Step 4: Map the Implications

Connect the findings to real engineering work. Ask: "If this paper is right, what should we build, change, or stop doing?" Be specific. Vague implications like "this could be useful" are worthless.

### Step 5: Self-Critique Before Output

Before writing your summary, verify:
- Does your TL;DR capture what makes THIS paper unique, not something that could describe any paper in the field?
- Are you summarizing every section equally, or focusing on what actually matters?
- Have you used the word "interesting" without explaining specifically why something matters?
- Are your implications grounded in specific engineering actions, not vague speculation?
- Have you included the exact numbers, not approximations?
- Would a researcher who already knows this field learn something from your summary, or does it just repeat obvious context?

Fix any failures before proceeding.

### Document-type-specific guidance

**Academic papers:** Identify the novel contribution vs. prior work. Separate what is genuinely new from what is incremental improvement. Call out whether the evaluation uses realistic workloads or synthetic benchmarks. Note if the authors compare against current state-of-the-art or outdated baselines. Check if the paper's own limitations section reveals more than the results section.

**RFCs and technical specs:** Focus on the proposed change and its backward compatibility implications. Identify who the stakeholders are, what migration looks like, and any deprecation timelines. Flag open questions the authors have not resolved. Note the normative language (MUST vs. SHOULD vs. MAY) and what it implies for adoption.

**Blog posts and announcements:** Identify which claims are backed by data, benchmarks, or citations vs. which are opinions, marketing, or speculation. Note the author's affiliation and any obvious conflicts of interest. Call out missing methodology behind any performance claims.

**Product documentation:** Focus on capabilities, limitations, and integration points. Identify what is GA vs. beta vs. roadmap. Note vendor lock-in risks and what happens when you hit the documented limits.

**Reports and whitepapers:** Distinguish findings from recommendations. Note the methodology's rigor and whether the sample size or scope supports the conclusions drawn. Check who funded the report and whether the conclusions conveniently align with the funder's interests.

### Output Format

## TL;DR
One paragraph capturing the core contribution. Start with what is genuinely new. End with why it matters. This paragraph should be specific enough that someone in the field could identify which paper you are summarizing without seeing the title.

## Key Claims
Number each claim. State each in one sentence. For each claim, add a confidence tag:
- **[Strong]** - Backed by rigorous evidence, reproducible methodology
- **[Moderate]** - Evidence exists but has gaps (limited scale, synthetic benchmarks, missing baselines)
- **[Weak]** - Claimed but not adequately supported in the document

## Methodology
How did they prove or support their claims? Describe the experimental setup, benchmarks, datasets, or analytical framework. Call out what is standard practice vs. unusual choices. Note anything that could bias the results. If the document is not a research paper (e.g., a blog post or product doc), replace this section with a "Evidence Quality" assessment.

## Results That Matter
The numbers that define this work. Report key metrics with exact values from the document. For each number, provide enough context to interpret it: what was the baseline, what hardware, what conditions. Skip incremental results and focus on the findings that would change your engineering decisions.

## So What -- Engineering Impact
What does this mean for our work? Connect findings to specific engineering decisions about inference serving, model optimization, Kubernetes-native AI infrastructure, or open source AI. Frame as concrete actions: "We should evaluate X," "This validates our approach to Y," "This challenges our assumption about Z." If the paper is not directly relevant, say so plainly.

## What To Be Skeptical About
Combine author-acknowledged limitations with your own critical assessment. What conditions or assumptions might not hold in production? What did the authors NOT test that matters? What would break at 10x scale? What alternative explanations exist for the results?

## Key Figures and Tables
Reference by number (e.g., Figure 3, Table 2). For each, state what it shows AND what it reveals that the text does not emphasize. The best insight in a paper is often buried in a figure the authors did not fully discuss.

Keep total output under 600 words unless the document is exceptionally dense. Every sentence should earn its place.
