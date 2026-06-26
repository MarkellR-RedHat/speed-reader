The fastest possible summary. Just the signal.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document. Before writing bullets, identify: (1) what is the single most important thing in this document, (2) what would change an engineer's decisions, and (3) what is the document's weakest point.

Then produce exactly 5 to 7 bullet points. Each bullet must be one sentence that a busy engineer can act on or remember. No filler. No background. No "this paper explores" or "the authors propose" throat-clearing.

Rules for each bullet:
- Lead with the finding, decision, or number. Not the context.
- If a bullet could apply to any paper in the field, it is too generic. Rewrite it.
- Include at least one bullet with a specific number (performance gain, latency, cost, scale).
- Include at least one bullet that states a limitation or reason for skepticism.
- The last bullet should answer: "What should we do with this information?"

Adapt your focus based on document type:
- **Academic papers:** Lead with the novel result and the headline number. State what the baseline was so the number has meaning. Skip background entirely.
- **RFCs and specs:** Lead with what changes, what breaks, and the timeline. State the migration cost plainly.
- **Blog posts:** Lead with any concrete claims or announcements backed by data. Flag unsubstantiated claims by noting the missing evidence.
- **Product docs:** Lead with what it does, what it does not do, and integration requirements. Note lock-in risks.

Do not include headers, section labels, or any formatting beyond the bullet list. This output is meant to be dropped into a Slack message or a quick status update. If you cannot make someone smarter about this document in 60 seconds of reading, you have failed.
