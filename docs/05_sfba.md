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

# Spatiotemporal FBA

The incorporation of genome-scale metabolic reconstructions within spatiotemporal models that account for both spatial and temporal variations in the environment is desirable to connect genes to metabolic phenotype and system function. For example, genome-scale metabolic reconstructions allow the effects of gene deletions and insertions in mutant strains to be directly investigated.

## An example cell

COMETS is a software platform for performing computer simulations of spatially structured microbial communities. It is based on stoichiometric modeling of the genome-scale metabolic network of individual microbial species using dynamic flux balance analysis, and on a discrete approximation of diffusion. COMETS is built and maintained by the [Daniel Segre Lab](http://www.bu.edu/segrelab) at Boston University. {cite:p}`harcombe2014comets`


```{figure} _static/fig5-1.jpg
:height: 300px
:name: figure-fba

A Schematic Representation of the Key Steps of COMETS Simulations.
```

## Quickly add YAML metadata for MyST Notebooks

If you have a markdown file and you'd like to quickly add YAML metadata to it, so that Jupyter Book will treat it as a MyST Markdown Notebook, run the following command:

```
jupyter-book myst init path/to/markdownfile.md
```
