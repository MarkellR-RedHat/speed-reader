Map the intellectual lineage. What came before this, what it builds on, and what to read next.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly, paying special attention to the references, related work section, and any inline citations that the authors rely on heavily (not just cite in passing).

Before writing, identify:
1. Which references does this document depend on most heavily? Not which ones are cited most often, but which ones would make this document impossible if they did not exist.
2. What is the intellectual thread that connects the foundational work to this document?
3. If someone wanted to deeply understand this document, what is the minimum set of prior reading they need?

### Output Format

## This Document's Place in the Field
Two to three sentences. Where does this document sit in the research landscape? Is it foundational, incremental, a synthesis of prior threads, or a contrarian challenge to established ideas? State the research lineage plainly: "This builds on X's work on Y, extends it to Z, and challenges the assumption that W."

## The 5 Most Important References
For each of the 5 references this document depends on most heavily:

### [N]. [Title] ([Authors], [Year])
- **What it contributed:** One to two sentences on the key idea or result from this reference.
- **How this document uses it:** One sentence on what the current document borrows, extends, or challenges from this reference.
- **Should you read it?** One sentence. Yes (and why), or no (and what you would gain is not worth the time).

Rank these by importance to understanding the current document, not by publication date.

## The Intellectual Thread
A narrative paragraph (4-6 sentences) that tells the story of how this research area evolved. Start from the earliest foundational idea among the key references, trace through the key developments, and arrive at the current document. This should read like a brief history that someone new to the field could follow. Name the key turns: "First, [team] showed X was possible. Then [team] demonstrated it could scale to Y. The current paper asks whether it works when Z."

## Reading Order for Someone New
A numbered list of 3 to 5 documents (drawn from the references or the intellectual thread) in the order someone new to this area should read them. For each, one sentence on why it belongs at that position in the sequence. End the list with the current document.

The order should build understanding progressively: start with the foundational concept, then the key technique, then the most relevant prior result, then the current document. Do not order chronologically unless that happens to be the best learning sequence.

## What Comes Next
Based on the current document's results, limitations, and open questions: what research would logically follow? If you are aware of papers that have already followed up on this work, mention them. If not, describe what the next paper in this thread would need to address.

### Document-type-specific guidance

**Academic papers:** Focus on the references that provide the theoretical foundation, the methodological approach, and the baselines that define success. Distinguish between references that are genuinely important and references cited for completeness or political reasons.

**RFCs and specs:** Trace the chain of prior proposals, superseded specs, and related standards. Identify which earlier decisions constrain the current proposal. Note any competing proposals that address the same problem space.

**Blog posts:** If the blog post references research, trace those references. If it does not cite sources, note that the intellectual lineage is unclear and assess whether the ideas have identifiable origins in the literature.

**Product docs:** Trace the technology stack's lineage. What open source projects, research papers, or standards does this product build on? Understanding the foundation helps assess the product's trajectory.

Keep total output under 600 words.
