The hot take. Should you read this, or move on with your life?

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then deliver a verdict that respects the reader's time.

Before writing, answer these questions for yourself:
1. If I had read this document six months ago, would it have changed any decision I made? If not, it is not worth the reader's time either.
2. Does this document contain a genuinely new idea, or is it a well-written restatement of known things?
3. What is the single strongest piece of evidence in this document? Is it strong enough to matter?

### Output Format

## Verdict
One sentence. Is this worth the reader's time? Be direct. Examples of good verdicts:
- "Read this. It is the first rigorous evidence that disaggregated inference scales past 32 GPUs, and we are betting our architecture on that being true."
- "Skip it. The headline result is 2% better than the current baseline, achieved on synthetic data with custom hardware we will never use."
- "Skim sections 3 and 5 only. The rest is review material, but the KV cache migration analysis is the best available."

## The Strongest Argument
What is the best thing about this document? The most compelling evidence, the most novel insight, or the most useful contribution. State it in two to three sentences. If the strongest argument is weak, say that.

## The Weakest Argument
What does not hold up? The least convincing claim, the biggest methodological gap, or the most unsupported assertion. State it in two to three sentences. Explain why it is weak -- do not just say "this needs more work."

## What Is Genuinely Novel
Separate the new from the known. What does this document contribute that did not exist before? Be ruthless: if the "novel contribution" is an incremental improvement on a known technique, say that. If it is genuinely new, explain what makes it new in the context of what already exists.

## What Is Well-Known But Presented as Novel
If the document presents established ideas, techniques, or results as if they are new contributions, call that out. This is not a criticism of the authors' integrity -- it is a service to the reader who might otherwise overestimate the novelty.

## What Is Missing
What did the authors not address that they should have? This is not about future work they acknowledged -- it is about gaps they either did not notice or chose not to discuss. What question does the document raise but not answer?

## If You Only Remember One Thing
One sentence. The single most important takeaway. Make it specific enough to be useful and memorable enough to stick. This sentence should survive being forwarded three times in a Slack thread and still make sense without context.

### Document-type-specific guidance

**Academic papers:** Assess novelty relative to the last 2 years of work in the area, not just the references the authors chose to cite. Check if the "novel" contribution has already appeared in concurrent or prior work the authors may have missed.

**RFCs and specs:** The verdict should focus on whether this proposal will actually get adopted. Technical merit is necessary but not sufficient. Assess community support, implementation complexity, and migration burden.

**Blog posts:** The verdict should separate the announcement from the analysis. A product launch wrapped in a blog post is news, not insight. Rate the technical content independent of the marketing.

**Product docs:** The verdict should focus on whether this product solves a problem we actually have, at a price and integration cost we can accept, without creating dependencies we cannot escape.

Keep total output under 400 words. This is the command for when someone says "should I read this?" -- respect that question by being decisive, not diplomatic.
