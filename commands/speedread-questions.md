Read a document and generate 5 to 7 questions you should ask after reading it. Good for prep before discussing a paper in a meeting.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then generate 5 to 7 sharp questions that a well-prepared engineer would ask in a discussion about this document.

### Question quality guidelines

Each question should:
- Target a gap, assumption, or implication that the document does not fully address
- Be specific enough to drive a concrete discussion (no generic "what do you think?" questions)
- Be phrased so that someone who read the document can engage with it immediately

### Question categories to draw from

1. **Validity:** Does the evidence actually support the claims? What alternative explanations exist?
2. **Generalizability:** Would these results hold in our environment (different hardware, workloads, scale)?
3. **Reproducibility:** Could we replicate this? What information is missing to do so?
4. **Practical impact:** What would it take to adopt this in our stack? What is the integration cost?
5. **Missing perspectives:** What stakeholders, failure modes, or edge cases are not represented?
6. **Next steps:** What follow-up work does this imply for our team?

### Document-type-specific guidance

**Academic papers:** Focus on experimental validity, whether baselines are fair, and what the authors' own limitations section implies but does not state outright.

**RFCs and specs:** Focus on backward compatibility risks, migration burden, edge cases in the spec, and whether the proposed solution addresses the root cause or just the symptom.

**Blog posts:** Focus on what claims lack supporting evidence, what the author's incentives are, and what the post carefully avoids mentioning.

**Product docs:** Focus on gaps between documented capabilities and real-world requirements, lock-in risks, and what happens at the boundary conditions.

Output the questions as a numbered list. After each question, add one sentence of context explaining why this question matters.