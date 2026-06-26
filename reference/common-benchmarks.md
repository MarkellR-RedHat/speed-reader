# Common Benchmarks: What They Actually Measure and Where They Fall Short

When a paper claims "state-of-the-art results on X," this guide helps you evaluate whether X measures anything you care about.

## ML and LLM Benchmarks

### MMLU (Massive Multitask Language Understanding)
- **What it measures:** Multiple-choice question answering across 57 academic subjects, from elementary math to professional law.
- **What it actually tests:** Pattern matching on academic exam-style questions. Heavily weighted toward memorization and test-taking ability.
- **Known limitations:** Saturated -- top models score above 90%, making it hard to differentiate. Contains known errors in the ground truth labels. Multiple-choice format does not test generative ability. Scores above 85% often reflect benchmark contamination (the test questions appeared in training data) more than genuine capability.
- **When to trust it:** Useful for rough capability comparisons between model families. Not useful for predicting real-world task performance.
- **Red Hat relevance:** Low direct relevance. A model's MMLU score tells you almost nothing about its performance on code generation, infrastructure reasoning, or technical Q&A.

### HumanEval (and HumanEval+)
- **What it measures:** Code generation. 164 Python programming problems with unit tests.
- **What it actually tests:** Whether a model can generate short, self-contained Python functions from docstrings.
- **Known limitations:** Small benchmark (164 problems). Only Python. Problems are algorithmic puzzles, not real-world software engineering tasks (no multi-file context, no debugging, no API integration). Pass@1 vs. pass@k can dramatically change the story. HumanEval+ adds more test cases to reduce false positives but does not fix the scope problem.
- **When to trust it:** Reasonable directional signal for basic code generation capability. Not predictive of performance on production codebases.
- **Red Hat relevance:** Moderate. We care about code generation, but HumanEval does not test the kinds of code tasks we actually need (Kubernetes manifests, Ansible playbooks, system-level programming, multi-file refactoring).

### MBPP (Mostly Basic Python Problems)
- **What it measures:** 974 crowd-sourced Python programming problems, generally simpler than HumanEval.
- **What it actually tests:** Basic Python code generation from natural language descriptions.
- **Known limitations:** Problems are simple enough that the benchmark may be saturated for frontier models. Quality of the crowd-sourced problems and test cases is uneven.
- **When to trust it:** Only as a complement to HumanEval, not standalone.
- **Red Hat relevance:** Low. Same fundamental limitations as HumanEval but with easier problems.

### SWE-bench (and SWE-bench Verified)
- **What it measures:** Real-world software engineering. Models must resolve actual GitHub issues from popular Python repositories.
- **What it actually tests:** End-to-end software engineering: reading code, understanding the issue, writing a fix, and passing existing tests. SWE-bench Verified uses human-validated correct patches as ground truth.
- **Known limitations:** Python-only. Repository-specific -- strong performance on Django does not guarantee strong performance on unfamiliar codebases. The "resolved" metric can be gamed by overfitting to the test suite. Compute-intensive to run. Verified subset is small (500 instances).
- **When to trust it:** The best available benchmark for real-world coding ability. Take percentage claims seriously but check which subset (full vs. lite vs. verified).
- **Red Hat relevance:** High. This is the closest existing benchmark to the code tasks we actually care about, though the Python-only limitation matters.

### MT-Bench
- **What it measures:** Multi-turn conversation quality, scored by GPT-4 as a judge.
- **What it actually tests:** Whether a model can follow instructions, maintain context across turns, and produce responses that another LLM rates highly.
- **Known limitations:** LLM-as-judge introduces bias (models tend to rate their own family's outputs higher). Only 80 questions. The scoring rubric is not transparent. Multi-turn only goes to 2 turns.
- **When to trust it:** Directional signal for conversational ability. Do not compare scores within 0.5 points of each other.
- **Red Hat relevance:** Low unless you are evaluating chatbot-style interfaces.

### GPQA (Graduate-Level Google-Proof Questions)
- **What it measures:** Expert-level reasoning in biology, physics, and chemistry.
- **What it actually tests:** Whether a model can answer questions that PhD students in other subfields cannot answer, even with internet access.
- **Known limitations:** Very small (448 questions). Narrow domain coverage. "Google-proof" claim depends on when it was last checked.
- **When to trust it:** Useful for assessing deep reasoning capability, but the small size means score differences need to be large to be meaningful.
- **Red Hat relevance:** Low. Interesting for understanding model capabilities but not aligned with our workloads.

## Systems and Inference Benchmarks

### MLPerf Inference
- **What it measures:** Inference performance across multiple models and scenarios (offline, server, single-stream, multi-stream).
- **What it actually tests:** How fast a specific hardware/software stack can run inference on standardized models under specified conditions. Tests both throughput and latency.
- **Known limitations:** Results are heavily optimized for the benchmark -- vendors spend months tuning for MLPerf submissions. Real-world performance is typically 30-50% lower. The submission process is expensive, so only well-resourced organizations participate. Model choices lag behind the frontier.
- **When to trust it:** Good for comparing hardware platforms against each other. Not predictive of your production performance. Useful as a ceiling: your best case is probably worse.
- **Red Hat relevance:** High. Directly relevant to our inference serving work. When evaluating hardware or software stacks, MLPerf results provide a useful (if optimistic) comparison point. Always adjust downward for production conditions.

### MLPerf Training
- **What it measures:** Time to train standard models to a target quality level.
- **What it actually tests:** Training throughput at scale, including distributed training efficiency.
- **Known limitations:** Same optimization caveat as Inference. Training benchmarks measure a capability most of us will rarely use -- fine-tuning and serving are more common than training from scratch.
- **When to trust it:** For understanding hardware scaling behavior. Less directly useful than Inference benchmarks for most AI BU work.
- **Red Hat relevance:** Moderate. Relevant when evaluating training infrastructure, but most of our focus is on serving.

### vLLM Benchmark Suite
- **What it measures:** LLM serving throughput and latency using standardized request patterns.
- **What it actually tests:** Requests per second, time to first token (TTFT), inter-token latency (ITL), and end-to-end latency under various concurrency levels.
- **Known limitations:** Results depend heavily on the request distribution (input/output length, arrival pattern). ShareGPT traces are commonly used but may not match your workload. Single-node results do not predict multi-node behavior.
- **When to trust it:** Highly relevant when comparing serving frameworks or evaluating optimization techniques. Check the request distribution carefully.
- **Red Hat relevance:** Very high. This is our ecosystem. When papers benchmark against vLLM, check the version -- performance has improved substantially across releases.

### ShareGPT Traces
- **What it measures:** Not a benchmark itself, but a dataset of real conversation request patterns commonly used to drive inference benchmarks.
- **What it actually tests:** Provides realistic input/output length distributions from actual ChatGPT usage.
- **Known limitations:** Reflects ChatGPT usage patterns, not enterprise workloads. Conversations tend to be shorter and more varied than enterprise use cases (long documents, code generation, RAG pipelines). Overused to the point that some systems may be implicitly optimized for ShareGPT distributions.
- **When to trust it:** Reasonable default for general-purpose chatbot workloads. Not representative of enterprise or specialized inference workloads.
- **Red Hat relevance:** Moderate. Useful baseline, but we should push for benchmarks on enterprise-representative traces.

## How to Read Benchmark Claims

### Questions to ask when a paper cites benchmark results:

1. **Which subset?** MMLU has 57 subjects. HumanEval has pass@1 and pass@10. SWE-bench has full, lite, and verified. The subset matters enormously.
2. **What was the baseline?** "State-of-the-art" means "best at the time of writing." Check the date. SOTA from six months ago may already be outdated.
3. **What was the evaluation setup?** Temperature, number of samples, prompt format, and few-shot examples all affect results. A model's score at temperature 0 with 5-shot prompts is a different number than temperature 0.7 with zero-shot.
4. **Is the benchmark saturated?** When top models all score above 90%, differences are noise, not signal.
5. **Is the benchmark contaminated?** If the test questions appeared in the training data, the score measures memorization, not capability. This is an increasing problem for popular benchmarks.
6. **Does the benchmark match your use case?** A model that scores 95% on MMLU and 30% on SWE-bench is a great test-taker and a mediocre engineer. Know which one you need.

### The Benchmark Hierarchy for AI BU Work

When evaluating models or systems for our use cases, weight benchmarks in this order:

1. **Your own evaluation on your workload.** Nothing beats testing on your actual use case.
2. **SWE-bench Verified** for code generation capability
3. **vLLM benchmark suite** for serving performance
4. **MLPerf Inference** for hardware/platform comparison
5. **Domain-specific benchmarks** relevant to the specific task
6. **General benchmarks (MMLU, MT-Bench)** as rough capability filters only

General benchmarks are useful for eliminating obviously inadequate models. They are not useful for choosing between the top 3 candidates. For that, you need your own evaluation.
