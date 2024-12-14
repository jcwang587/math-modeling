---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
---

# Flux Balance Analysis

Flux balance analysis (FBA) is a mathematical framework for analyzing the flow of metabolites through a metabolic network. This primer introduces the theoretical foundations of FBA, presents several practical examples, and provides a software toolbox to facilitate the necessary calculations {cite:p}`orth2010flux`.


```{figure} _static/fig3-1.png
:height: 200px
:name: figure-fba

The conceptual basis of constraint-based modeling.
```

## Environment Setup

For performing comprehensive constraint-based metabolic network analyses, several specialized software tools are required. In this section, we will install and configure two key components: the COBRA Toolbox and Gurobi. The COBRA Toolbox is a MATLAB-based software suite specifically designed for the analysis of genome-scale biochemical networks, while Gurobi is a state-of-the-art optimization solver that provides a MATLAB interface for executing linear and mixed-integer linear programming tasks.

The Constraint-Based Reconstruction and Analysis (COBRA) Toolbox is widely recognized for its robust framework, enabling quantitative predictions of cellular and multicellular biochemical networks under various constraints. It implements an extensive range of methodologies, from fundamental reconstruction and model generation techniques to advanced, unbiased approaches for model-driven analysis. By integrating the COBRA Toolbox into a MATLAB environment, researchers gain access to a versatile platform for modeling, analyzing, and predicting diverse metabolic phenotypes at the genome scale. {cite:p}`heirendt2019cobra`

Gurobi is a state-of-the-art mathematical optimization solver, widely recognized for its exceptional performance and reliability in solving a broad spectrum of linear, integer, and mixed-integer linear programming problems. Its advanced algorithms, parallelized computations, and extensive parameter tuning options make it one of the most efficient and user-friendly optimization tools available. {cite:p}`gurobi` By providing a robust MATLAB interface, Gurobi seamlessly integrates with the COBRA Toolbox and other computational frameworks, thereby streamlining model-driven analysis and facilitating rapid, large-scale solution of complex optimization problems.

## BiGG Model

Biochemical, Genetic, and Genomic knowledgebase: Repository of Systems Biology Models (BiGG Models) is an open-source, community-driven resource providing standardized, genome-scale metabolic network models {cite:p}`norsigian2020bigg`. It offers a comprehensive platform for researchers, students, and bioinformatics professionals to access high-quality reconstructions spanning a wide range of organisms. Currently, BiGG Models features 108 published models, as of version 1.6 updated in 2019. For more detailed model information, visit http://bigg.ucsd.edu/models.

## FBA model construction

The mass balance is defined in terms of the flux through each reaction and the stoichiometry of that reaction. This gives rise to a set of coupled ordinary differential equations. The differential equations can be represented using a matrix notation, where ‘**S**’ is the stoichiometric matrix and ‘**V**’ is the matrix of the fluxes. The goal of FBA is to identify the metabolic fluxes in the steady-state operation of the metabolic network. As there are more reactions (hence fluxes) than there are metabolites, the steady-state solution for the metabolic fluxes is underdetermined. Thus, additional constraints are needed to uniquely determine the steady-state flux distribution. {site:p}`kauffman2003fba`


```{figure} _static/fig3-2.png
:height: 200px
:name: figure-fba

Methodology for flux balance analysis.
```

