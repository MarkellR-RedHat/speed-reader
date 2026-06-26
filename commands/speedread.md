Speed-read a technical paper, long document, or web page and produce a structured summary.

Input: $ARGUMENTS (a file path to a PDF, markdown, or text file, or a URL)

Read the provided document thoroughly. Then produce a structured summary in the following format. Keep the total output under 500 words unless the user explicitly asks for more detail.

## TL;DR
One paragraph capturing the core contribution, finding, or argument of the document.

## Key Claims
Number each claim. State each in one sentence. Focus on what the authors are actually asserting, not background context.

## Methodology
How did they prove or support their claims? Describe the experimental setup, benchmarks, datasets, or analytical framework. If the document is not a research paper (e.g., a blog post or product doc), skip this section.

## Results
The numbers that matter. Report key metrics, benchmarks, performance figures, or quantitative findings. Use the exact numbers from the document.

## So What for Us
What does this mean for the AI BU, Red Hat, or our products? Connect the findings to our work on inference serving, model optimization, Kubernetes-native AI infrastructure, or open source AI. Be specific and practical.

## Limitations and Caveats
What did the authors acknowledge as limitations? What should we be skeptical about? What conditions or assumptions might not hold in our context?

## Key Figures and Tables
Reference by number (e.g., Figure 3, Table 2). For each, state in one sentence what it shows and why it matters.
