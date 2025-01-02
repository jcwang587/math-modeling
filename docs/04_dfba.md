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

Dynamic flux balance analysis (dFBA) is a computational approach that extends traditional flux balance analysis to incorporate temporal dynamics into the study of metabolic networks. By allowing reaction fluxes to vary with time in response to changing environmental or cellular conditions, dFBA provides deeper insights into system behavior and regulatory mechanisms. This primer covers the theoretical foundations of dFBA, includes several practical examples, and introduces software tools designed to perform these calculations {cite:p}`gomez2014dfbalab`.

Dynamic model predictions for anaerobic batch growth of wild-type *E. coli* and recombinant *S. cerevisiae* strain RWB218 mono-cultures on glucose/xylose media are shown in the following {cite:p}`hanly2011coculture`.


```{figure} _static/fig4-1.png
:height: 300px
:name: figure-dfba

Comparison of DFBALab model predictions and experimental data {cite:p}`mark2008exp` for wild-type *E. coli* aerobically consuming a mixture of glucose and xylose.
```

## Environment Setup

For performing comprehensive constraint-based metabolic network analyses, several specialized software tools are required. In this section, we will install and configure two key components: the COBRA Toolbox and Gurobi. The COBRA Toolbox is a MATLAB-based software suite specifically designed for the analysis of genome-scale biochemical networks, while Gurobi is a state-of-the-art optimization solver that provides a MATLAB interface for executing linear and mixed-integer linear programming tasks.

The Constraint-Based Reconstruction and Analysis (COBRA) Toolbox is widely recognized for its robust framework, enabling quantitative predictions of cellular and multicellular biochemical networks under various constraints. It implements an extensive range of methodologies, from fundamental reconstruction and model generation techniques to advanced, unbiased approaches for model-driven analysis. By integrating the COBRA Toolbox into a MATLAB environment, researchers gain access to a versatile platform for modeling, analyzing, and predicting diverse metabolic phenotypes at the genome scale {cite:p}`heirendt2019cobra`.

Gurobi is a state-of-the-art mathematical optimization solver, widely recognized for its exceptional performance and reliability in solving a broad spectrum of linear, integer, and mixed-integer linear programming problems. Its advanced algorithms, parallelized computations, and extensive parameter tuning options make it one of the most efficient and user-friendly optimization tools available. {cite:p}`gurobi` By providing a robust MATLAB interface, Gurobi seamlessly integrates with the COBRA Toolbox and other computational frameworks, thereby streamlining model-driven analysis and facilitating rapid, large-scale solution of complex optimization problems.

## A CSTR Model for Microbial Growth

In a continuous stirred-tank reactor (CSTR) designed for a yeast microbial fermentation, as shown in {numref}`figure_cstr`, four extracellular components are typically tracked: biomass, glucose, oxygen, and ethanol. The reactor is operated at a constant volume with a continuous feed of nutrients (media) that supports cell growth. Below is a concise overview of the main material balances, highlighting how each component is added, consumed, or removed from the system.


```{figure} _static/fig4-2.svg
:height: 300px
:name: figure-cstr

Comparison of DFBALab model predictions and experimental data for wild-type *E. coli* aerobically consuming a mixture of glucose and xylose.
```

