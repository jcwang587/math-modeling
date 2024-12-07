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

# Flux Balance Analysis

Flux balance analysis is a mathematical approach for analyzing the flow of metabolites through a metabolic network. This primer covers the theoretical basis of the approach, several practical examples and a software toolbox for performing the calculations. {cite:p}`orth2010flux`


```{figure} ./figures/fig2-1.png
:height: 200px
:name: figure-example

The conceptual basis of constraint-based modeling.
```

## Environment Setup

For performing comprehensive constraint-based metabolic network analyses, several specialized software tools are required. In this section, we will install and configure two key components: the COBRA Toolbox and Gurobi. The COBRA Toolbox is a MATLAB-based software suite specifically designed for the analysis of genome-scale biochemical networks, while Gurobi is a state-of-the-art optimization solver that provides a MATLAB interface for executing linear and mixed-integer linear programming tasks.

The Constraint-Based Reconstruction and Analysis (COBRA) Toolbox is widely recognized for its robust framework, enabling quantitative predictions of cellular and multicellular biochemical networks under various constraints. It implements an extensive range of methodologies, from fundamental reconstruction and model generation techniques to advanced, unbiased approaches for model-driven analysis. By integrating the COBRA Toolbox into a MATLAB environment, researchers gain access to a versatile platform for modeling, analyzing, and predicting diverse metabolic phenotypes at the genome scale. {cite:p}`heirendt2019cobra`

Gurobi is a state-of-the-art mathematical optimization solver, widely recognized for its exceptional performance and reliability in solving a broad spectrum of linear, integer, and mixed-integer linear programming problems. Its advanced algorithms, parallelized computations, and extensive parameter tuning options make it one of the most efficient and user-friendly optimization tools available. {cite:p}`gurobi` By providing a robust MATLAB interface, Gurobi seamlessly integrates with the COBRA Toolbox and other computational frameworks, thereby streamlining model-driven analysis and facilitating rapid, large-scale solution of complex optimization problems.

## BiGG Model

*BiGG Models* is open source. *BiGG Models* is open source, so you can browse the code, submit issues, and contribute on GitHub. {cite:p}`norsigian2020bigg`
