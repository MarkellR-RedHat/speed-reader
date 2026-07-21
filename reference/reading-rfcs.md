# Reading RFCs without getting lost in the spec

How I evaluate RFCs, KEPs, and technical proposals and figure out what actually matters, without reading all forty pages.

## What counts as an RFC here

This covers formal RFCs (IETF, W3C), Kubernetes Enhancement Proposals (KEPs), Python PEPs, and similar structured technical proposals. The reading strategies apply to any document that proposes a change to a shared system or standard.

## The four things to read first

1. **The summary or abstract.** What's being proposed, in one paragraph.
2. **The motivation section.** Why does the current state of things need to change? If the motivation is weak or doesn't match your use cases, the RFC probably isn't relevant regardless of its technical merits.
3. **The backward compatibility section.** What breaks? What needs migration? This is where the real cost of adoption lives.
4. **The alternatives considered section.** This tells you what other approaches were evaluated and rejected, and why. Honestly, often more informative than the proposal itself.

## What to pay attention to

### Normative language
RFC-style documents use specific keywords defined in RFC 2119: MUST, SHOULD, MAY, MUST NOT, SHOULD NOT. These aren't casual word choices. "MUST" means mandatory for compliance. "SHOULD" means recommended but not required. "MAY" means optional. When scanning an RFC, the MUST statements tell you the hard requirements.

### Scope boundaries
Good RFCs clearly state what they cover and what they don't. Pay attention to explicit out-of-scope statements. These often flag areas where problems exist but no one has proposed a solution yet.

### Status and maturity
- **Draft/Provisional:** still changing. Don't build on this without expecting rewrites.
- **Accepted/Approved:** the design is stable but may not be implemented yet.
- **Implemented/Final:** shipping in a release. Safe to depend on.
- **Deprecated/Rejected:** don't use. But do understand why it was rejected, in case a similar need comes up.

### Versioning and timelines
Look for target release versions, deprecation schedules, and migration windows. These determine how urgently you need to act.

## Red flags

- **No backward compatibility section.** The authors either haven't thought about migration or are avoiding the topic. Both are bad.
- **Vague migration path.** "Users should update their configurations" without saying how means nobody has actually tried the migration yet.
- **Missing security considerations.** Required by IETF RFC format and expected in KEPs. If it's absent, the proposal hasn't been seriously reviewed.
- **No alternatives considered.** Either the authors didn't explore the design space, or they're hiding the trade-offs.
- **Overly broad scope.** Proposals that try to solve too many problems at once stall or ship incomplete. Every time.

## Reading with your own stack in mind

If you run AI or infra workloads, here's where I'd focus:

- **Kubernetes KEPs:** check which SIG owns the KEP and whether it touches APIs you depend on for workload orchestration. Look at the graduation criteria to understand when features move from alpha to beta to GA.
- **Networking specs:** anything affecting gRPC, HTTP/2, or service mesh routing can impact inference serving latency. Read the performance implications sections carefully.
- **Storage and data specs:** proposals affecting CSI, object storage APIs, or data formats can affect model loading and checkpoint management.
- **Upstream project proposals:** for projects like vLLM, check whether the proposal's design assumptions line up with the architecture you're actually building toward.

## Useful questions to ask yourself

- Does this proposal affect any API surface I depend on?
- What's the migration timeline, and does it line up with my release schedule?
- Are there open questions in the proposal that could resolve in a way that hurts me?
- Should I be participating in this RFC's review process?
- Is there an opening here to contribute or influence the direction?
