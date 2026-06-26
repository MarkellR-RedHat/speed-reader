Read a document and produce an annotated version with inline commentary, like a senior colleague reading over your shoulder.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then reproduce the document's key sections with inline annotations. For each major paragraph, claim, or section, add a bracketed comment with your analysis.

Use this annotation format:

> [Original text or key passage from the document]
>
> **[Annotation]:** Your commentary here.

### What to annotate

- **Strong claims:** Flag whether they are well-supported. Note the evidence quality.
- **Numbers and benchmarks:** Contextualize them. Are these numbers good? How do they compare to the state of the art or to our own systems?
- **Methodology choices:** Note when something is standard practice vs. unusual. Call out choices that could bias the results.
- **Gaps and omissions:** Point out what the authors did not address that matters for our use cases.
- **Jargon and assumptions:** Briefly define non-obvious terms or unstated assumptions that a reader might miss.
- **Relevance markers:** Flag sections that are directly relevant to Red Hat AI BU work (inference serving, model optimization, Kubernetes-native AI, open source AI) with a note on why.

### Document-type-specific guidance

**Academic papers:** Annotate the abstract, each key claim in the introduction, the experimental setup, headline results, and the limitations section. Skip related work unless it is directly relevant to our stack.

**RFCs and specs:** Annotate the problem statement, proposed solution, backward compatibility section, and any security considerations. Flag migration requirements.

**Blog posts:** Annotate headline claims, any benchmarks or demos, and the call to action. Be direct about where the post is marketing vs. engineering.

**Product docs:** Annotate capability descriptions, integration requirements, and known limitations.

Keep annotations concise -- one to three sentences each. The goal is to save the reader time, not to write a second document.