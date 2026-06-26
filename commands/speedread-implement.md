Translate research into engineering. "How would we actually use this?"

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then shift from researcher mode to engineer mode. The question is not "is this true?" but "if it is true, what do we build?"

Before writing, answer these questions for yourself:
1. What is the core technique or finding that has engineering value?
2. What would a minimal proof of concept look like? Not the full system -- the smallest thing that demonstrates the value.
3. What existing infrastructure would this touch, require, or replace?
4. What is the gap between the paper's prototype and a production system?

### Output Format

## The Core Idea, Translated
Two to three sentences explaining the key technique or finding in engineering terms, not research terms. Strip the academic framing and state what this actually does. Example: "The paper's 'dynamic resource-aware scheduling policy' is a load balancer that routes requests based on current GPU memory utilization and estimated completion time, queried via a sidecar agent on each serving node."

## What We Would Build
A concrete description (one paragraph) of what a system or feature based on this work would look like in our environment. Be specific about where it would fit: is this a new component in llm-d, a modification to vLLM, a Kubernetes operator, a scheduler plugin, a monitoring tool? Name the actual projects and components it would integrate with.

## Simplest Proof of Concept
Describe the minimum viable experiment to validate whether this approach works for us. Include:
- What to build (the smallest possible implementation)
- What to measure (the metric that proves or disproves the value)
- What existing tools or infrastructure to use
- Estimated effort (days, not months -- if it takes months for a PoC, the scope is wrong)

This should be something one engineer could start next sprint, not a quarter-long research project.

## Infrastructure Requirements
What would we need that we do not have today? Be specific:
- Hardware: Does this require specific GPUs, networking, or memory configurations?
- Software: New dependencies, framework changes, or version requirements?
- Data: Training data, benchmark suites, or workload traces we would need to acquire?
- Expertise: Skills or domain knowledge the team would need to develop?

If the answer is "nothing new, we can do this with what we have," that is a strong signal in favor of trying it.

## Risks and Gotchas
What could go wrong when moving this from paper to production?
- **Integration risk:** What breaks when this meets our existing systems?
- **Scale risk:** Does the paper's approach work at our scale, or does it assume conditions we do not have?
- **Maintenance risk:** Does this add operational complexity? What is the ongoing cost of running this?
- **Dependency risk:** Does this create a dependency on a specific vendor, framework version, or hardware generation?

## Estimated Effort
A rough t-shirt sizing for three scenarios:
- **PoC (prove it works):** Time, people, and what "works" means
- **MVP (ship something useful):** Time, people, and what "useful" means
- **Production-ready:** Time, people, and what additional work is needed (monitoring, testing, documentation, on-call runbooks)

Be honest. If the gap between paper and production is 6+ months of work, say so. Engineers respect accurate estimates, not optimistic ones.

## The Decision
One paragraph. Given the effort, risk, and potential value: should we pursue this, park it for later, or pass? Support your recommendation with the specific numbers and constraints from the sections above. End with the concrete next step if the answer is "yes."

### Document-type-specific guidance

**Academic papers:** Focus on translating the novel technique into implementable components. Note where the paper's experimental code (if available) could be reused vs. where we would need to rewrite from scratch.

**RFCs and specs:** Focus on the implementation requirements for compliance. What do we need to change in our systems to support this spec? What is the timeline pressure based on the spec's adoption schedule?

**Blog posts:** Focus on the product or feature being announced. What competitive pressure does this create? Can we build an equivalent, adopt their approach, or is this irrelevant to our roadmap?

**Product docs:** Focus on build-vs-buy analysis. Can we get this capability cheaper by using their product, or is building our own the right call given our requirements and constraints?

Keep total output under 500 words. Every sentence should help an engineering manager decide whether to put this on the roadmap.
