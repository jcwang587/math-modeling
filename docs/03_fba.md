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

The Constraint-Based Reconstruction and Analysis (COBRA) Toolbox is widely recognized for its robust framework, enabling quantitative predictions of cellular and multicellular biochemical networks under various constraints. It implements an extensive range of methodologies, from fundamental reconstruction and model generation techniques to advanced, unbiased approaches for model-driven analysis. By integrating the COBRA Toolbox into a MATLAB environment, researchers gain access to a versatile platform for modeling, analyzing, and predicting diverse metabolic phenotypes at the genome scale {cite:p}`heirendt2019cobra`.

Gurobi is a state-of-the-art mathematical optimization solver, widely recognized for its exceptional performance and reliability in solving a broad spectrum of linear, integer, and mixed-integer linear programming problems. Its advanced algorithms, parallelized computations, and extensive parameter tuning options make it one of the most efficient and user-friendly optimization tools available {cite:p}`gurobi`. By providing a robust MATLAB interface, Gurobi seamlessly integrates with the COBRA Toolbox and other computational frameworks, thereby streamlining model-driven analysis and facilitating rapid, large-scale solution of complex optimization problems.

## FBA model construction

This is a very simple example for an FBA (Flux Balance Analysis) study. As shown in the following figure, this is not an actual cell, but rather a hypothetical one used for illustrative purposes. We refer to the interior of the cell as the intracellular space, and the environment outside the cell as the extracellular space. In this simplified scenario, the cell consumes a substrate from the side labeled “b1,” where “b1” represents the rate of consumption. Once this substrate crosses the membrane—an action referred to as “uptake”—it is designated as metabolite A inside the cell.

Within the cell, there are several reactions involving metabolites A, B, and C. The reactions from A to B and from C to B are irreversible, while the reaction between A and C is reversible. Additionally, the cell can secrete metabolite B back into the extracellular environment, and similarly, it can secrete metabolite C. Thus, we have one uptake process and two secretion processes.

Conceptually, this is essentially a set of kinetic or, more specifically, mass balance equations. In an actual cell, there would be hundreds of such exchanges and reactions, and instead of just three metabolites, a large-scale metabolic model might include thousands. For example, in the iMM904 metabolic reconstruction, there are approximately 4,000 metabolites.


```{figure} _static/fig3-2.jpg
:height: 400px
:name: figure-fba

Methodology for flux balance analysis {cite:p}`kauffman2003fba`.
```

The mass balance is defined in terms of the flux through each reaction and the stoichiometry of that reaction. This gives rise to a set of coupled ordinary differential equations. The differential equations can be represented using a matrix notation, where ‘**S**’ is the stoichiometric matrix and ‘**V**’ is the matrix of the fluxes. The goal of FBA is to identify the metabolic fluxes in the steady-state operation of the metabolic network. As there are more reactions (hence fluxes) than there are metabolites, the steady-state solution for the metabolic fluxes is underdetermined. Thus, additional constraints are needed to uniquely determine the steady-state flux distribution. 

## Genome-Scale Metabolic Model

*Saccharomyces cerevisiae*, a widely used model organism in eukaryotic studies, has long been employed to investigate genetic interactions, to serve as a platform for constructing cell factories that produce high-value compounds, and to deepen our understanding of eukaryotic metabolism. Over the past two decades, the genome-scale metabolic models (GEMs) of *S. cerevisiae* have undergone continuous refinement and enhancement, culminating in a series of models that includes Yeast9 {cite:p}`yeast9`, Yeast8 {cite:p}`yeast8`,  Yeast7 {cite:p}`yeast7`, Yeast5 {cite:p}`yeast5`, Yeast4 {cite:p}`yeast4`, Yeast1 {cite:p}`yeast1`, iMM904 {cite:p}`imm904`, iIN800 {cite:p}`iin800`, iLL672 {cite:p}`ill672`, and iND750 {cite:p}`ind750`. This progression builds on the foundational first-generation model, iFF708, published in 2003 {cite:p}`iff708`. 

Within this chapter, we will apply a classic Yeast GEM model, iMM904, available through the BiGG database. The Biochemical, Genetic, and Genomic knowledgebase (BiGG Models) is an open-source, community-driven resource providing standardized, genome-scale metabolic network models {cite:p}`norsigian2020bigg`. It offers a comprehensive platform for researchers, students, and bioinformatics professionals to access high-quality reconstructions spanning a wide range of organisms. As of version 1.6, updated in 2019, BiGG Models features 108 published models. For more detailed information, please visit [http://bigg.ucsd.edu/models](http://bigg.ucsd.edu/models).
