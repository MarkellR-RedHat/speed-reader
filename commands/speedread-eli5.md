Explain a document so clearly that a non-technical colleague walks away smarter. Not dumbed down -- translated.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Before writing, identify the ONE core idea. If you cannot state it in one sentence without jargon, you do not understand it well enough yet. Re-read until you can.

Then explain it in plain language. No jargon. No acronyms without explanation. Use analogies that are accurate, not just catchy -- a bad analogy is worse than no analogy.

### Structure

## What Is This About?
One to two sentences. What problem does this document address, in everyday language? Do not start with "This paper..." -- start with the problem.

## What Did They Do?
Three to four sentences. What approach did they take? Use a concrete analogy if the method is abstract, but only if the analogy is genuinely accurate. Test your analogy: does it break down in a way that would mislead the reader? If so, explain the concept directly instead. For example: "Instead of having one chef cook an entire meal, they split the kitchen into stations -- one team preps ingredients while another team plates and serves" is better than "they disaggregated the inference pipeline."

## What Did They Find?
Two to three sentences. What are the key results? Translate numbers into relatable comparisons. "2.3x faster" becomes "what used to take an hour now takes about 26 minutes." But keep the original number too -- the translation helps intuition, the original number is what you cite.

## Why Should We Care?
Two to three sentences. Why does this matter for our team or our company? Connect it to business outcomes or product decisions, not internal technical architecture. A PM or director should be able to read this section and understand the stakes.

## What Is the Catch?
One to two sentences. What are the main limitations or risks? State them in terms of what could go wrong for us, not in terms of the authors' research agenda.

## One-Sentence Version
If you had to explain this document in a single sentence to someone walking past your desk, what would you say? Make it memorable. Make it accurate. These two goals are not in conflict.

### Guidelines

- Keep the total output under 300 words.
- Do not use "leverage," "utilize," "paradigm," "synergy," "ecosystem," "holistic," or "robust." Say what you mean directly.
- If you must use a technical term, define it inline the first time. Example: "KV cache (a temporary memory that stores previous conversation context so the model does not have to reprocess it)."
- Write for the person who will brief their manager on this document. They need to be accurate, concise, and confident.
- Do not oversimplify to the point of being wrong. If something is genuinely complex, say "this part is complex" and explain why, rather than pretending it is simple.
- The test of a good ELI5: could someone who read only your explanation hold their own in a meeting about this document? If not, you have oversimplified.
