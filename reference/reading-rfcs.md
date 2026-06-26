# Tips for Reading Technical RFCs Efficiently

A practical guide for engineers who need to evaluate RFCs, KEPs, or technical proposals without getting lost in specification details.

## What Is an RFC in This Context

This guide covers formal RFCs (IETF, W3C), Kubernetes Enhancement Proposals (KEPs), Python PEPs, and similar structured technical proposals. The reading strategies apply to any document that proposes a change to a shared system or standard.

## The Four Things to Read First

1. **The summary or abstract.** What is being proposed, in one paragraph.
2. **The motivation section.** Why does the current state of things need to change? If the motivation is weak or does not match your use cases, the RFC may not be relevant regardless of its technical merits.
3. **The backward compatibility section.** What breaks? What needs migration? This is where the real cost of adoption lives.
4. **The alternatives considered section.** This tells you what other approaches were evaluated and rejected, and why. Often more informative than the proposal itself.

## What to Pay Attention To

### Normative Language
RFC-style documents use specific keywords defined in RFC 2119: MUST, SHOULD, MAY, MUST NOT, SHOULD NOT. These are not casual word choices. "MUST" means mandatory for compliance. "SHOULD" means recommended but not required. "MAY" means optional. When scanning an RFC, the MUST statements tell you the hard requirements.

### Scope Boundaries
Good RFCs clearly state what they cover and what they do not. Pay attention to explicit out-of-scope statements. These often flag areas where problems exist but no one has proposed a solution yet.

### Status and Maturity
- **Draft/Provisional:** Still changing. Do not build on this without expecting rewrites.
- **Accepted/Approved:** The design is stable but may not be implemented yet.
- **Implemented/Final:** Shipping in a release. Safe to depend on.
- **Deprecated/Rejected:** Do not use. Understand why it was rejected if a similar need arises.

### Versioning and Timelines
Look for target release versions, deprecation schedules, and migration windows. These determine how urgently you need to act.

## Red Flags

- **No backward compatibility section.** The authors either have not thought about migration or are avoiding the topic.
- **Vague migration path.** "Users should update their configurations" without specifying how is a sign the migration cost is not well understood.
- **Missing security considerations.** Required by IETF RFC format and expected in KEPs. If absent, the proposal may not have been thoroughly reviewed.
- **No alternatives considered.** Either the authors did not explore the design space, or they are not being transparent about trade-offs.
- **Overly broad scope.** Proposals that try to solve too many problems at once tend to stall or ship incomplete.

## Reading for Our Context

When evaluating RFCs and proposals relevant to Red Hat AI BU work:

- **Kubernetes KEPs:** Check which SIG owns the KEP and whether it affects the APIs we depend on for AI workload orchestration. Look at the graduation criteria to understand when features move from alpha to beta to GA.
- **Networking specs:** Anything affecting gRPC, HTTP/2, or service mesh routing may impact inference serving latency. Check performance implications sections carefully.
- **Storage and data specs:** Proposals affecting CSI, object storage APIs, or data formats may affect model loading and checkpoint management.
- **Upstream project proposals:** For projects like vLLM, check whether the proposal's design assumptions align with our disaggregated architecture goals.

## Useful Questions to Ask Yourself

- Does this proposal affect any API surface we depend on?
- What is the migration timeline, and does it align with our release schedule?
- Are there open questions in the proposal that could resolve in a way that hurts us?
- Should we be participating in this RFC's review process?
- Does this create an opportunity for us to contribute or influence the direction?