# Reading strategies by document type

How to read different kinds of documents for maximum retention and minimum wasted time. Not every document deserves the same attention. Honestly, most deserve less than you give them.

## The fundamental question

Before reading anything, ask: "what decision will this document help me make?" If you can't answer that, you're reading for curiosity, not for work. Both are valid, but they need different strategies.

## Strategy 1: the triage read (2 minutes)

Use this before committing to a full read. The goal is deciding whether the document is worth your time at all.

1. Read the title and abstract/summary
2. Read the conclusion or final section
3. Scan the figures and tables (the whole paper is often in Table 1)
4. Read the limitations section, if one exists

After triage, you should know:
- What this document claims
- Whether the results are in your problem domain
- Whether the methodology is credible enough to warrant deeper reading

If the answer is "not relevant" or "not credible," stop here. You just saved yourself 30 minutes. `/speedread-verdict` is basically this process, automated.

## Strategy 2: the three-pass method (for academic papers)

**First pass (5 minutes):** title, abstract, introduction (first and last paragraphs), section headings, conclusion, and a figure/table scan. After this pass you should know: what the paper claims, whether it's relevant, and whether it's worth going deeper.

**Second pass (15-20 minutes):** full introduction, results, and discussion sections. Skip related work unless you need to understand the competitive landscape. Read every figure and table carefully -- they often contain information the text doesn't emphasize. After this pass you should be able to explain the paper to a colleague.

**Third pass (only if needed, 45-60 minutes):** the full paper, methodology and appendices included. Only necessary if you plan to reproduce the work, build on it directly, review it formally, or challenge its conclusions.

Most papers don't need a third pass. If you're doing third passes on more than 20% of what you read, your triage isn't selective enough.

## Strategy 3: the adversarial read (for papers you plan to build on)

When you might actually build something based on a document, read as an adversary, not an ally.

1. Read the paper normally (passes 1 and 2)
2. Re-read the experimental setup and ask: "what would I need to reproduce this?"
3. List every assumption that must hold for the results to transfer to your environment
4. Check: do those assumptions hold? Different hardware, different scale, different workloads, different software stack.
5. Read the references the paper depends on most heavily (`/speedread-chain` will identify them)
6. Ask: "if the most favorable result in this paper turned out to be noise, would the paper still matter?"

## Strategy 4: the synthesis read (for multiple documents on one topic)

When you need to understand a research area, not just one paper:

1. Start with the most recent survey or tutorial paper in the area
2. From that survey, identify the 3-5 most-cited papers that defined the field
3. Read those foundational papers using the three-pass method
4. Read the most recent papers to understand current state
5. Use `/speedread-compare` to systematically contrast the approaches

The goal is a mental model of the design space, not memorizing individual papers. After a synthesis read, you should be able to answer: "what are the major approaches to this problem, and what are the trade-offs between them?"

## Strategy 5: the executive read (for documents you need to brief others on)

When you have to explain a document to someone else (a manager, a PM, a different team):

1. Read the full document
2. Use `/speedread-eli5` to draft the plain-language explanation
3. Identify the three things your audience cares about (cost, timeline, risk, competitive advantage -- not technical details)
4. Map the document's findings to those three things
5. Prepare one sentence for each: what this means for us, what we should do, and what could go wrong

The test: could someone who only heard your briefing make the right decision?

## Strategy 6: the implementation read (for documents you plan to act on)

When the question is "how do we build this?":

1. Read the paper with focus on the experimental setup and methodology (the "how" sections)
2. Use `/speedread-implement` to translate findings into engineering actions
3. Identify the minimum viable experiment that would validate the core idea
4. Map the paper's components to your existing infrastructure
5. Estimate the gap between the paper's prototype and your production requirements

## Reading speed vs. retention

What actually works, per the cognitive science research:

- **Speed reading doesn't work** for technical content. Skimming headings and scanning for keywords is effective triage, but comprehension requires slower reading of the sections that matter.
- **Taking notes doubles retention.** Even brief margin notes or a 3-bullet summary after reading dramatically improves recall. Running `/speedread-bullets` after reading forces you to consolidate your understanding.
- **Spaced repetition beats marathon sessions.** Reading a paper twice (once today, once next week) beats reading it twice today.
- **Teaching is the strongest retention tool.** If you need to remember a paper, explain it to someone. `/speedread-eli5` gives you a starting framework; refine it with your own understanding.

## Red flags that save you time

Stop reading and move on if you hit:

- A paper with no comparison baselines. Without baselines, results are uninterpretable.
- A blog post with no methodology behind its performance claims. The numbers are marketing.
- An RFC with no backward compatibility section. The authors haven't thought about adoption.
- A product doc that doesn't discuss limitations. That's advertising, not documentation.
- Any document where the conclusions don't follow from the evidence presented. Trust your judgment.

## The 80/20 rule of technical reading

80% of the value in a document comes from 20% of its content. Your job is to find that 20% as fast as possible, extract it, and move on. That's the whole point of the speedread commands: they force identification of what matters instead of equal-weight summarization of everything.
