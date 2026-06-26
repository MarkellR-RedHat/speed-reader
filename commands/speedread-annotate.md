Read a document and produce an annotated version with inline commentary. Like having a skeptical senior engineer read it with you and write in the margins.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Before annotating, form your overall assessment: Is this document trustworthy? What is its strongest point? What is its weakest? Carry this perspective into your annotations -- you are not a neutral summarizer, you are a critical reader.

Then reproduce the document's key sections with inline annotations. For each major paragraph, claim, or section, add a bracketed comment with your analysis.

Use this annotation format:

> [Original text or key passage from the document]
>
> **[Annotation]:** Your commentary here.

### What to annotate and how

- **Strong claims:** Do not just flag them. State whether the evidence supports the claim, and what level of confidence is warranted. "The authors claim X, but their evidence only shows Y under condition Z."
- **Numbers and benchmarks:** Contextualize them against current state of the art. Are these numbers impressive or expected? How do they compare to what we run in production? If the comparison is missing, say what it should be compared against.
- **Methodology choices:** Note when something is standard practice vs. unusual. When a choice could bias results, explain the direction of the bias, not just that bias exists. Example: "Using synthetic traces inflates throughput numbers because real workloads have burstier arrival patterns."
- **Gaps and omissions:** Point out what the authors did not address that matters for production systems. Be specific: "No evaluation at batch sizes above 32" is useful. "More work is needed" is not.
- **Hidden insights:** Flag moments where the data reveals something the authors downplay or miss entirely. The best annotations surface what the document accidentally proves.
- **Relevance markers:** Flag sections directly relevant to Red Hat AI BU work (inference serving, model optimization, Kubernetes-native AI, open source AI, llm-d) with a concrete note on how it connects.

### Document-type-specific guidance

**Academic papers:** Annotate the abstract, each key claim in the introduction, the experimental setup (especially hardware and software versions), headline results, and the limitations section. Skip related work unless it directly affects how we interpret the results. Pay extra attention to the gap between what the abstract claims and what the results actually show.

**RFCs and specs:** Annotate the problem statement, proposed solution, backward compatibility section, and any security considerations. Flag migration requirements and timeline pressures. Note where normative language (MUST/SHOULD/MAY) creates obligations.

**Blog posts:** Annotate headline claims, any benchmarks or demos, and the call to action. Be direct about where the post is marketing vs. engineering. Note what data is conspicuously absent.

**Product docs:** Annotate capability descriptions, integration requirements, and known limitations. Flag gaps between what is documented and what you would need to know to actually deploy this.

Keep annotations concise -- one to three sentences each. You are writing margin notes, not a second paper. Every annotation should make the reader smarter about the passage it accompanies.
