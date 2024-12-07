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

# Literate Programming

**Literate programming** is a programming paradigm introduced in 1984 by Donald Knuth {cite:p}`knuth1984literate`, in which a computer program is presented as an explanation of how it works in natural language, interwoven with the code it describes. By combining prose and source code, literate programming facilitates the communication of computational thinking, making it particularly valuable in educational settings. Typically, a markup language is used to format explanatory text blocks, and a programming language is embedded for executable code blocks.

- Example 1: Simple Narrative with a Single Code Cell

In literate programming, we mix text and code to explain what is happening in a computation as we develop it. Here is a simple Python code cell that calculates the factorial of 5:

```{code-cell} ipython3
def factorial(n):
    return 1 if n == 0 else n * factorial(n-1)

factorial(5)
```

- Example 2: Using Directive Options and Cross-Referencing

In this example, we introduce a dataset and then compute basic statistical measures (mean and standard deviation). We'll start by generating some random data:

```{code-cell} ipython3
import numpy as np

data = np.random.normal(loc=0, scale=1, size=1000)
data[:10]
```

We can reference this code cell as {ref}`stats-data-gen`. In {ref}`stats-computation` we’ll compute some statistics.

```{code-cell} ipython3
---
tags: [remove-input]
name: stats-data-gen
---
# Generate summary statistics: mean and standard deviation
mean_val = np.mean(data)
std_val = np.std(data)
mean_val, std_val
```

In the cell below, we show the computation of these statistics explicitly, and we will reference this cell as {ref}`stats-computation`.

```{code-cell} ipython3
---
name: stats-computation
---
print(f"Mean: {mean_val}, Standard Deviation: {std_val}")
```

As you can see, we have defined named cells (`stats-data-gen`, `stats-computation`) and can refer to them in our text. This allows us to build a cohesive narrative around the code, mentioning where data is generated and where it is used.

## MATLAB Live Editor

**MATLAB**, a popular programming language in STEM research, provides the MATLAB Live Editor as a tool to create MATLAB Live Scripts. These scripts, identified by the `.mlx` file extension, integrate formatted text and computational code into a single, publishable file. Within these scripts, a simplified version of Markdown and LaTeX is used to format text. MATLAB Live Scripts can be created both locally with the desktop version of MATLAB and online using MATLAB Online, making them convenient for instructional use and collaboration. 

The figure below shows an example of the MATLAB Live Editor in action. The left-hand side of the interface allows users to input and edit code, formatted text, and equations using LaTeX, while the right-hand side displays the results of the executed code in real time. This dual-panel layout facilitates a seamless workflow, enabling users to combine narrative descriptions with computational output. MATLAB Live Scripts are particularly useful for creating interactive tutorials, documenting research workflows, and sharing reproducible analyses, as they integrate code, results, and explanatory text into a single, organized document.

```{figure} ./figures/fig1-1.png
:height: 400px
:name: figure-example

The screenshot for the MATLAB Live Editor.
```

For the usage with MATLAB, the best native literate programming tool would be MATLAB Live Editor, which creates scripts that combine code, output, and formatted text. Divide code into manageable sections that can be run independently. View output and visualizations next to the code that produced them. Enhance your code and results with formatted text, headings, images, and hyperlinks. Insert equations using the interactive editor or create them using LaTeX. Save code, results, and formatted text in a single executable document. 

```{note}
- It is important to note that, in the MATLAB Live Editor, code outputs can be rendered either alongside the text (in line) or to the right. The code itself can also be hidden entirely, a feature particularly relevant when viewing shared MATLAB Live Scripts. Hidden code may be the default, especially if the script’s creator intended to focus the reader’s attention on interactive elements.
- Another key point is that MATLAB code requires functions to be defined at the end of the document. This practice often confuses users familiar with other programming languages, such as Python, where functions are commonly defined before they are called.
```

## Jupyter Notebook

**Jupyter Notebook** offers a free and open-source alternative to MATLAB Live Scripts. Identified by the `.ipynb` file extension, Jupyter Notebooks can be created online through services like Google Colab or locally with standalone clients. By default, Jupyter Notebooks use Markdown and LaTeX to format text cells and Python to execute code cells, though they support over forty programming languages. Unlike MATLAB, Python requires that functions be defined before they are called, necessitating that functions appear earlier in a Jupyter Notebook rather than at the end. Another noteworthy feature is that Jupyter Notebooks render directly on GitHub, a platform widely used in STEM research. The illustrations provided show portions of Jupyter Notebook source code, the rendered results, and an example of how a Jupyter Notebook is displayed on GitHub.
