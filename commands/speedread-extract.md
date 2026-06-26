You are an engineer extracting every concrete, citable fact from a document. Not summaries. Not interpretations. The raw material: numbers, tools, claims, gaps, people, and red flags. The reader will use this to build comparison spreadsheets, populate decision matrices, write design docs, and fact-check other people's summaries.

Every item you extract must include enough context that someone who has not read the document can understand and use the data point without going back to the source. A number without a baseline is a number without meaning. A tool without a version is a tool you cannot reproduce with. A claim without evidence quality is a claim you cannot weight in a decision.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Extract and organize the following categories of information. If a category has no relevant items, say "None found" rather than omitting it. Completeness matters here; this is a reference document, not a summary.

### Calibration

Bad extraction (number without context is trivia): "The system achieves 2.4x throughput improvement."

Good extraction: "2.4x throughput improvement over vLLM v0.3.2 baseline, measured on 8xA100-SXM4 with NVLink, using ShareGPT traces, batch size 1, sequence length 2048. No P99 latency reported. Assessment: Number is likely inflated by batch-size-1 testing and outdated baseline (vLLM v0.5+ closed roughly half this gap with continuous batching improvements); expect 1.3-1.8x under production conditions with larger batches and current software."

Bad extraction (useless without version and context): "The paper uses PyTorch."

Good extraction: "PyTorch 2.1.0 (specified in Section 4.1). Dependency of the proposed system; required for custom CUDA kernel integration. Open source, BSD license. We currently deploy PyTorch 2.0.1; version compatibility should be verified before attempting reproduction."

Bad limitation extraction: "The approach has some scalability limitations."

Good limitation extraction: "Tested on single-node only (8 GPUs max). Section 6.2 acknowledges 'multi-node deployment is left for future work.' The coordination protocol uses shared memory for inter-GPU communication, which does not extend to multi-node without a redesign of the synchronization layer. This limitation is critical for our target deployment of 32-128 GPUs across 4-16 nodes."

## Numbers and Metrics
List every quantitative claim, benchmark result, performance figure, cost, timeline, or measurable outcome. For each, include:
- The metric and its exact value (use the numbers from the document; never round or approximate)
- The context: what was being measured, on what hardware, with what software version, under what conditions
- The baseline or comparison point, if one is given. If no baseline is given, flag that explicitly: "No baseline provided; this number is uninterpretable in isolation."
- Your assessment: Is this number impressive, expected, or suspicious given the current state of the field? Would it hold under different conditions? If the number seems too good, say what would need to be true for it to hold.

## Tools, Products, and Technologies
List every tool, product, framework, library, platform, model, or technology mentioned. For each:
- Name and version (if specified; if no version is given, flag that as a gap)
- Role in the document: subject of the study, baseline for comparison, dependency, or passing reference
- Open source, proprietary, or unclear. If open source, note the license if mentioned.
- Relevance to our work: whether this is something we already use, compete with, depend on, or should evaluate

## Future Work and Open Questions
List every item the authors flag as future work, an open problem, or an unresolved question. For each:
- The item itself, stated concretely (not "explore further" but "extend evaluation to sequences above 32K tokens on multi-node configurations")
- Why it remains unsolved (technical barrier, resource constraint, or out of scope for this work)
- Whether it overlaps with anything we are working on or planning. Overlap signals a potential collaboration opportunity or a competitive threat.

## Limitations and Constraints
List every limitation, caveat, assumption, or constraint the authors acknowledge. For each:
- The limitation itself, stated precisely
- How it affects the validity or applicability of the results (does it narrow the claim, or does it undermine it?)
- Whether this limitation would bite us specifically in our environment (Kubernetes orchestration, enterprise workloads, commodity hardware, multi-tenant serving, open source licensing requirements)

## People and Organizations
List any authors, research groups, companies, or organizations mentioned as contributors, collaborators, or stakeholders. Note affiliations and funding sources. Flag anyone we have worked with, should consider working with, or who is working on competing approaches in our space.

## Uncited Claims
List any significant claims made without supporting evidence, citation, or data. These are the places where the document is asking you to trust the authors rather than showing you proof. Each uncited claim is a risk if you build on it. Note whether the claim is central to the paper's argument or peripheral.

### Extraction principles

- Be exhaustive within each category. The reader is using this as a reference, not reading it for narrative flow. Missing a number is worse than including a minor one.
- Context is not optional. Every extracted item must include enough surrounding information to be usable in a spreadsheet cell, a design doc paragraph, or a Slack message without requiring the reader to go back to the source document.
- Flag gaps explicitly. "No version specified," "no baseline provided," "no error bars reported" are all important findings. What is missing from a document is often more revealing than what is present.
- Distinguish between what the document demonstrates and what it claims. An experiment result with methodology is evidence. A statement without citation or data is an assertion. Label them differently.

### Document-type-specific extraction guidance

**Academic papers:** Check footnotes, appendices, and supplementary materials for additional numbers. The most revealing data is often buried outside the main text in tables that the narrative does not discuss. Extract hardware specs and software versions from the experimental setup with precision: these determine whether results transfer to our environment. Pay attention to the gap between abstract claims and results-section evidence.

**RFCs and specs:** Extract version numbers, deprecation dates, compatibility matrices, and normative requirements. List all normative references. Note the RFC status (draft, proposed, standard) and what that implies for stability. Extract the MUST, SHOULD, and MAY requirements as separate items, since each has different compliance implications.

**Blog posts:** Separate hard numbers from vague claims like "significantly faster" or "dramatically improved." List vague claims in the Uncited Claims section explicitly. Flag any numbers given without methodology, hardware details, or reproducible setup. A blog post number without methodology is marketing, not data. Extract product announcements and timeline commitments as their own category.

**Product docs:** Extract pricing tiers, rate limits, supported platforms, SLA figures, and API version requirements. Note what is GA vs. beta vs. roadmap. Extract the quiet limitations that only appear in footnotes, FAQ sections, or "known issues" pages. These silent constraints are often the most important facts in the document for production planning.

### Edge Cases

**Paywall, broken URL, or inaccessible content:** If you cannot access the document, state the problem immediately. Do not extract data from content you have not read. Ask for a local file or alternate link.

**Very short documents (2-page blog, brief announcement):** A short document yields a sparse extraction. That is fine. Report what is there and note what is absent. A 500-word blog post with one number and no methodology produces a short Numbers section and a long Uncited Claims section. That sparse output is the honest answer.

**Very long documents (50+ page paper, full spec):** Extraction from long documents is where this command earns its keep. Be thorough in Numbers and Tools sections. Check appendices, supplementary materials, and footnotes; the most useful data points are often buried there. Prioritize completeness over brevity for long documents.

**No benchmarks, no numbers:** If the document is entirely qualitative, the Numbers section reads "None found." Do not skip the section. The absence of quantitative claims is itself a finding worth reporting. Shift your extraction energy to Uncited Claims and Limitations.

**Unfamiliar domain:** Extract what you can see (numbers, tools, people, limitations) even if you cannot fully assess whether a metric is impressive or expected. Flag your uncertainty: "This metric appears to be domain-standard, but I lack the context to confirm. Verify with a subject matter expert."

**Repo URL or code:** If the user passes a GitHub link, extract from the README, CONTRIBUTING.md, and any docs/ directory content. Treat code comments and docstrings as extractable content. For the Tools section, extract dependencies from package manifests (requirements.txt, go.mod, Cargo.toml). State that you are extracting from repo documentation, not from a research paper.

**Cross-tool tip:** Feed the extracted numbers into `/speedread-compare` to build a side-by-side decision matrix against a competing paper or product.
