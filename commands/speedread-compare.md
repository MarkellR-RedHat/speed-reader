Compare two technical documents and produce a comparison that settles the "which one should we care about" question.

Input: $ARGUMENTS (two file paths or URLs, separated by a space)

Read both documents thoroughly. Before writing the comparison, answer these questions for yourself:
1. Do these documents address the same problem, or are they solving different problems that happen to overlap?
2. If their results conflict, is it because of different methodologies, different assumptions, or different definitions of success?
3. Which document would you cite if you could only cite one?

### Document-type-specific guidance

- **Two academic papers:** Compare experimental rigor, benchmark choices, and whether results are reproducible. Note if they use the same baselines. If one uses stronger baselines or more realistic workloads, say so directly.
- **Paper vs. blog post:** Call out where the blog post simplifies, exaggerates, or omits nuance from the underlying research. Identify what the blog post gets right that the paper buries.
- **Two RFCs or specs:** Focus on compatibility between the two proposals, whether they can coexist, and which has more community traction. Check which one has working implementations.
- **Any combination:** Note the difference in evidence quality. A peer-reviewed paper with reproducible results outranks a blog post with vibes, but a well-benchmarked blog post can outrank a paper with synthetic-only evaluation.

### Output Format

## Documents Compared
List each document by title, authors (if available), source, and document type. One line each.

## The Core Disagreement
If they disagree, state the disagreement in one sentence. If they agree on the core point but differ on details, say that instead. If they are solving different problems, state that clearly so the reader does not waste time looking for a fight that does not exist.

## What They Agree On
Bullet points covering shared findings or compatible conclusions. Only include genuine agreement, not surface-level overlap.

## Where They Diverge
Bullet points covering contradictions, conflicting results, or incompatible conclusions. For each point of divergence, state which document has stronger evidence and why. Do not present both sides as equally valid when one has better methodology.

## Why the Results Differ
Trace divergent results back to their root cause: different hardware, different benchmarks, different assumptions, different definitions of the metric, or different experimental conditions. This section should explain the disagreement, not just describe it.

## Which One Wins for Our Work
Given our focus on inference serving, model optimization, Kubernetes-native AI infrastructure, and open source AI: which document is more actionable and why? Be concrete about what we could use or build on. If neither is clearly better, say what each one offers that the other does not.

## Bottom Line
Two to three sentences. A busy engineer who reads only this section should know: which document matters more, why, and what to do next.
