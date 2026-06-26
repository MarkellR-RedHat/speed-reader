Extract specific structured information from a document: numbers, tools, future work, and limitations.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then extract and organize the following categories of information. If a category has no relevant items, say "None found" rather than omitting it.

## Numbers and Metrics
List every quantitative claim, benchmark result, performance figure, cost, timeline, or measurable outcome mentioned in the document. For each, include:
- The metric and its value (use the exact numbers from the document)
- The context (what was being measured, under what conditions)
- The baseline or comparison point, if one is given

## Tools, Products, and Technologies
List every tool, product, framework, library, platform, model, or technology mentioned in the document. For each, include:
- Name and version (if specified)
- How it is used in the document (as a subject, baseline, dependency, or passing reference)
- Whether it is open source, proprietary, or unclear

## Future Work and Open Questions
List every item the authors flag as future work, an open problem, or an unresolved question. Include:
- The item itself
- Why the authors say it matters
- Whether it overlaps with anything we are working on in the AI BU

## Limitations and Constraints
List every limitation, caveat, assumption, or constraint the authors acknowledge. Include:
- The limitation itself
- How it affects the validity or applicability of the results
- Whether it would apply in our environment (Red Hat infrastructure, Kubernetes, enterprise workloads)

## People and Organizations
List any authors, research groups, companies, or organizations mentioned as contributors, collaborators, or stakeholders. Note affiliations where available.

### Document-type-specific guidance

**Academic papers:** Pay close attention to the experimental setup section for hardware specs, software versions, and dataset sizes. Check footnotes for additional numbers.

**RFCs and specs:** Extract version numbers, deprecation dates, and compatibility matrices. List all normative references.

**Blog posts:** Separate hard numbers from vague claims like "significantly faster" or "dramatically improved." Flag any numbers given without methodology.

**Product docs:** Extract pricing tiers, rate limits, supported platforms, and SLA figures.