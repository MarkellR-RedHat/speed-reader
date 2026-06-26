Extract every concrete, citable fact from a document. Numbers, tools, claims, gaps. The raw material for decision-making.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Extract and organize the following categories of information. If a category has no relevant items, say "None found" rather than omitting it. For every item you extract, include enough context that someone who has not read the document can understand and use the data point.

## Numbers and Metrics
List every quantitative claim, benchmark result, performance figure, cost, timeline, or measurable outcome. For each, include:
- The metric and its exact value (use the numbers from the document, never round or approximate)
- The context: what was being measured, on what hardware, with what software version, under what conditions
- The baseline or comparison point, if one is given. If no baseline is given, flag that explicitly -- a number without a baseline is a number without meaning.
- Your assessment: Is this number impressive, expected, or suspicious given the current state of the field?

## Tools, Products, and Technologies
List every tool, product, framework, library, platform, model, or technology mentioned. For each:
- Name and version (if specified)
- Role in the document: subject of the study, baseline for comparison, dependency, or passing reference
- Open source, proprietary, or unclear. If open source, note the license if mentioned.
- Whether this is something we already use, compete with, or should evaluate

## Future Work and Open Questions
List every item the authors flag as future work, an open problem, or an unresolved question. For each:
- The item itself, stated concretely
- Why it remains unsolved (technical barrier, resource constraint, or out of scope)
- Whether it overlaps with anything we are working on or planning. If it does, this is a potential collaboration or competitive signal.

## Limitations and Constraints
List every limitation, caveat, assumption, or constraint the authors acknowledge. For each:
- The limitation itself
- How it affects the validity or applicability of the results
- Whether this limitation would bite us in our environment (Red Hat infrastructure, Kubernetes, enterprise workloads, commodity hardware)

## People and Organizations
List any authors, research groups, companies, or organizations mentioned as contributors, collaborators, or stakeholders. Note affiliations. Flag anyone we have worked with, should work with, or who is working on competing approaches.

## Uncited Claims
List any significant claims made without supporting evidence, citation, or data. These are potential red flags or areas where the document is relying on the reader's trust rather than proof.

### Document-type-specific extraction guidance

**Academic papers:** Check footnotes, appendices, and supplementary materials for additional numbers. The most revealing data is often not in the main text. Extract hardware specs and software versions from the experimental setup -- these determine whether results transfer to our environment.

**RFCs and specs:** Extract version numbers, deprecation dates, compatibility matrices, and normative requirements. List all normative references. Note the RFC status (draft, proposed, standard).

**Blog posts:** Separate hard numbers from vague claims like "significantly faster" or "dramatically improved." List vague claims in the Uncited Claims section. Flag any numbers given without methodology.

**Product docs:** Extract pricing tiers, rate limits, supported platforms, SLA figures, and API version requirements. Note what is GA vs. beta vs. roadmap.
