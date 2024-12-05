---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Dynamic FBA

Jupyter Book also lets you write text-based notebooks using MyST Markdown.
See [the Notebooks with MyST Markdown documentation](https://jupyterbook.org/file-types/myst-notebooks.html) for more detailed instructions.
This page shows off a notebook written in MyST Markdown.

## DFBALab

The Dynamic Flux Balance Analysis laboratory (DFBAlab) is a MATLAB-based code that performs numerical integration of dynamic flux balance analysis (dFBA) systems. It provides efficient simulation of multi-culture of microbial species based on genome-scale metabolic network reconstructions for analysis, control and optimization of biochemical processes. As such, it generates dynamic predictions of substrate, biomass, and product concentrations for growth in batch or fed-batch cultures.

dFBA provides a structured model of a biochemical process, where the reaction pathways within the microorganism change depending on the environmental conditions, which is effectively represented by changes in the functional dependency on the substrate concentrations. These predictions result from the solution of linear programs (LPs). Common challenges involve the LPs becoming infeasible or nonunique solution sets. DFBAlab addresses both difficulties using the LP feasibility problem and lexicographic optimization, respectively. {cite:p}`gomez2014dfbalab`

## Create a notebook with MyST Markdown

MyST Markdown notebooks are defined by two things:

1. YAML metadata that is needed to understand if / how it should convert text files to notebooks (including information about the kernel needed).
   See the YAML at the top of this page for example.
2. The presence of `{code-cell}` directives, which will be executed with your book.

That's all that is needed to get started!

## Quickly add YAML metadata for MyST Notebooks

If you have a markdown file and you'd like to quickly add YAML metadata to it, so that Jupyter Book will treat it as a MyST Markdown Notebook, run the following command:

```
jupyter-book myst init path/to/markdownfile.md
```
