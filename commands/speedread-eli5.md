Explain a document like I'm five. For when you need to explain a dense technical paper to a non-technical stakeholder.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then explain it in plain language that someone without a technical background can understand and act on. No jargon. No acronyms without explanation. Use analogies where they help.

### Structure

## What Is This About?
One to two sentences. What problem does this document address, in everyday language?

## What Did They Do?
Three to four sentences. What approach did they take? Use a concrete analogy if the method is abstract. For example: "Instead of having one chef cook an entire meal, they split the kitchen into stations" is better than "they disaggregated the inference pipeline."

## What Did They Find?
Two to three sentences. What are the key results? Translate numbers into relatable comparisons. For example: "2.3x faster" becomes "what used to take an hour now takes about 26 minutes."

## Why Should We Care?
Two to three sentences. Why does this matter for our team or our company? Connect it to business outcomes, not technical architecture.

## What Is the Catch?
One to two sentences. What are the main limitations or risks, stated plainly?

## One-Sentence Version
If you had to explain this document in a single sentence to someone in an elevator, what would you say?

### Guidelines

- Keep the total output under 300 words.
- Do not use words like "leverage," "utilize," "paradigm," "synergy," or "ecosystem." Say what you mean directly.
- If you must use a technical term, define it inline the first time. Example: "KV cache (a temporary memory that stores previous conversation context so the model does not have to reprocess it)."
- Aim for language that works in an executive summary, a Slack message to a PM, or a quick explainer to someone from a different department.
- Do not oversimplify to the point of being wrong. If something is genuinely complex, say so and explain why.