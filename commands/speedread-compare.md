Compare two technical papers or documents side by side and produce a structured comparison.

Input: $ARGUMENTS (two file paths or URLs, separated by a space)

Read both documents thoroughly. Identify each document's type (academic paper, RFC, blog post, product doc, report, etc.) and adjust your analysis accordingly:

- **Two academic papers:** Compare experimental rigor, benchmark choices, and whether results are reproducible. Note if they use the same baselines.
- **Paper vs. blog post:** Call out where the blog post simplifies, exaggerates, or omits nuance from the underlying research.
- **Two RFCs or specs:** Focus on compatibility between the two proposals, whether they can coexist, and which has more community traction.
- **Any combination:** Note differences in rigor and evidence quality between the two sources.

Then produce a structured comparison in the following format.

## Documents Compared
List each document by title, authors (if available), and source. Note the document type.

## What They Agree On
Bullet points covering shared findings, compatible conclusions, or overlapping claims between the two documents.

## Where They Disagree
Bullet points covering contradictions, conflicting results, different assumptions, or incompatible conclusions. Be specific about the nature of the disagreement.

## Methodology Differences
How do their approaches differ? Different benchmarks, datasets, evaluation criteria, or experimental setups can explain why results diverge.

## Which Is More Relevant to Our Work
Given our focus on inference serving, model optimization, Kubernetes-native AI infrastructure, and open source AI, which document is more actionable for us and why? Be concrete about what we could use or build on.

## Bottom Line
Two to three sentences. If someone only reads this section, they should walk away knowing the key takeaway from comparing these two documents.
