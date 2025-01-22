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

The incorporation of genome-scale metabolic reconstructions within spatiotemporal models that account for both spatial and temporal variations in the environment is desirable to connect genes to metabolic phenotype and system function {cite:p}`sfba`.

## COMETS and COMETSpy

COMETS is a software platform for performing computer simulations of spatially structured microbial communities. It is based on stoichiometric modeling of the genome-scale metabolic network of individual microbial species using dynamic flux balance analysis, and on a discrete approximation of diffusion. COMETS is built and maintained by the [Daniel Segre Lab](http://www.bu.edu/segrelab) at Boston University {cite:p}`harcombe2014comets`.


```{figure} _static/fig5-1.jpg
:height: 300px
:name: figure-fba

A Schematic Representation of the Key Steps of COMETS Simulations.
```

Since the MATLAB toolbox for COMETS is no longer actively maintained, we recommend installing its Python counterpart, [COMETSPy](https://github.com/segrelab/cometspy), which serves as the Python interface for running COMETS simulations. Similar to the MATLAB interface for Gurobi, COMETSPy is not a standalone package. It is intended to be used alongside COMETS, which must be installed on the user's computer beforehand. Additionally, Gurobi is required as a dependency for running COMETS simulations.