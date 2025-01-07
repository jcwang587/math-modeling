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

```{note}
This section uses Python code as an example to demonstrate how to incorporate interactivity into literate programming. Users can run code and view outputs directly on the page without navigating elsewhere by clicking the {fa}`rocket` --> {guilabel}`Live Code` button at the top of this page. The interactivity is powered by a kernel hosted on the [**MyBinder**](https://mybinder.org) service.
```

- **Example 1: Single Code Cell**

In literate programming, we combine explanatory text and source code to clarify the details of a computation as it is being developed. Jupyter Book, the tool used to create this book, can be viewed as a type of literate programming environment. We can store and execute the code in this chapter directly on this webpage. Here is a simple Python code cell that calculates the factorial of 5.

```{code-cell} python
def factorial(n):
    return 1 if n == 0 else n * factorial(n-1)

factorial(5)
```

- **Example 2: Creating a Plot**

In this example, we introduce a dataset and demonstrate how to visualize it using a histogram. You can also try adjusting various parameters, such as the number of bins or the dataset size, to explore how they affect the plot.

```{code-cell} python
import matplotlib.pyplot as plt
import numpy as np

data = np.random.normal(loc=0, scale=1, size=1000)

plt.hist(data, bins=30)
plt.title('Histogram of Normally Distributed Data')
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.show()
```

As you can see, this example demonstrates how Python code can be combined with descriptive text in a literate programming environment. This allows users to modify parameters and instantly observe their effects on the plot, making this approach ideal for interactive and exploratory data analysis.

## MATLAB Live Editor

**MATLAB**, a popular programming language in STEM research, provides the MATLAB Live Editor as a tool to create MATLAB Live Scripts. These scripts, identified by the `.mlx` file extension, integrate formatted text and computational code into a single, publishable file. Within these scripts, a simplified version of Markdown and LaTeX is used to format text. MATLAB Live Scripts can be created both locally with the desktop version of MATLAB and online using MATLAB Online, making them convenient for instructional use and collaboration. 

The figure below shows an example of the MATLAB Live Editor in action. The left-hand side of the interface allows users to input and edit code, formatted text, and equations using LaTeX, while the right-hand side displays the results of the executed code in real time. This dual-panel layout facilitates a seamless workflow, enabling users to combine narrative descriptions with computational output. MATLAB Live Scripts are particularly useful for creating interactive tutorials, documenting research workflows, and sharing reproducible analyses, as they integrate code, results, and explanatory text into a single, organized document.

```{figure} _static/fig1-1.png
:height: 400px
:name: figure_example

The screenshot for the MATLAB Live Editor.
```

For the usage with MATLAB, the best native literate programming tool would be MATLAB Live Editor, which creates scripts that combine code, output, and formatted text. Divide code into manageable sections that can be run independently. View output and visualizations next to the code that produced them. Enhance your code and results with formatted text, headings, images, and hyperlinks. Insert equations using the interactive editor or create them using LaTeX. Save code, results, and formatted text in a single executable document. 

```{note}
- It is important to note that, in the MATLAB Live Editor, code outputs can be rendered either alongside the text (in line) or to the right. The code itself can also be hidden entirely, a feature particularly relevant when viewing shared MATLAB Live Scripts. Hidden code may be the default, especially if the script’s creator intended to focus the reader’s attention on interactive elements.
- Another key point is that MATLAB code requires functions to be defined at the end of the document. This practice often confuses users familiar with other programming languages, such as Python, where functions are commonly defined before they are called.
```

## Jupyter Notebook

**Jupyter Notebook** offers a free and open-source alternative to MATLAB Live Scripts. Identified by the `.ipynb` file extension, Jupyter Notebooks can be created online through services like Google Colab or locally with standalone clients. By default, Jupyter Notebooks use Markdown and LaTeX to format text cells and Python to execute code cells, though they support over forty programming languages. Unlike MATLAB, Python requires that functions be defined before they are called, necessitating that functions appear earlier in a Jupyter Notebook rather than at the end. Another noteworthy feature is that Jupyter Notebooks render directly on GitHub, a platform widely used in STEM research. The illustrations provided show portions of Jupyter Notebook source code, the rendered results, and an example of how a Jupyter Notebook is displayed on GitHub.
