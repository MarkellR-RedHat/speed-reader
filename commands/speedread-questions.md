Generate the questions a rigorous peer reviewer would ask. For meeting prep, reading groups, or pressure-testing a paper before you build on it.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Before generating questions, do this analysis:
1. What is the document's central claim?
2. What is the strongest piece of evidence for that claim?
3. What is the weakest link in the argument chain?
4. What did the authors carefully avoid discussing?
5. If you had to reject this paper, what would your reason be?

Then generate 5 to 7 questions that would make the authors uncomfortable in the best way -- questions that probe genuine weaknesses, untested assumptions, or implications they have not thought through.

### What makes a good question

A good question:
- Targets a specific gap, not a general area. "What happens to KV cache transfer latency when sequence length exceeds 8192 tokens?" beats "Have you considered longer sequences?"
- Cannot be answered with "yes" or "no." It forces explanation.
- Reveals something about the document's validity that is not obvious from a casual read.
- Would still be relevant if asked by someone from a different subfield.

A bad question:
- Is generic enough to ask about any paper ("What are the limitations?")
- Asks about something the document already addresses clearly
- Is really a comment disguised as a question
- Starts with "Don't you think..." or "Wouldn't it be interesting if..."

### Question categories to draw from

1. **Validity:** Does the evidence actually support the claims? What alternative explanations exist? If you removed the most favorable benchmark result, would the conclusion still hold?
2. **Hidden assumptions:** What must be true for these results to generalize? What hardware, software, or workload assumptions are baked in but not stated?
3. **Failure modes:** Under what conditions would this approach fail? What does the failure look like? Is it graceful degradation or catastrophic?
4. **Scale and generalization:** Would these results hold at 10x scale? On different hardware? With production workloads instead of benchmarks?
5. **Missing comparisons:** What baseline or competing approach should have been included but was not? Why might the authors have omitted it?
6. **Engineering reality:** What would it take to actually deploy this? What operational costs and complexity does the paper not account for?

### Document-type-specific guidance

**Academic papers:** Focus on experimental validity, whether baselines are fair and current, and what the authors' own limitations section implies but does not state outright. Ask the question that would have killed this paper at review.

**RFCs and specs:** Focus on backward compatibility risks that are glossed over, migration burden on existing users, edge cases the spec does not address, and whether the proposed solution matches the stated problem.

**Blog posts:** Focus on what claims lack supporting evidence, what the author's commercial incentives are, and what the post carefully avoids mentioning. Ask for the data behind the marketing.

**Product docs:** Focus on gaps between documented capabilities and real-world requirements, lock-in risks, what happens at boundary conditions, and what the support model looks like when things break.

Output the questions as a numbered list. After each question, add one sentence explaining why this question matters -- what it would reveal about the document's reliability or applicability if answered honestly.
