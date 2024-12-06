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

Literate programming is a programming paradigm introduced in 1984 by Donald Knuth {cite:p}`knuth1984literate`, in which a computer program is presented as an explanation of how it works in natural language, interwoven with the code it describes. By combining prose and source code, literate programming facilitates the communication of computational thinking, making it particularly valuable in educational settings. Typically, a markup language is used to format explanatory text blocks, and a programming language is embedded for executable code blocks.

MATLAB, a popular programming language in STEM research, provides the MATLAB Live Editor as a tool to create MATLAB Live Scripts. These scripts, identified by the `.mlx` file extension, integrate formatted text and computational code into a single, publishable file. Within these scripts, a simplified version of Markdown and LaTeX is used to format text. MATLAB Live Scripts can be created both locally with the desktop version of MATLAB and online using MATLAB Online, making them convenient for instructional use and collaboration. The following screenshot 

```{figure} ./figures/fig1-1.png
:height: 200px
:name: figure-example

The screenshot for the MATLAB Live Editor.
```



```{note}
- It is important to note that, in the MATLAB Live Editor, code outputs can be rendered either alongside the text (in line) or to the right. The code itself can also be hidden entirely, a feature particularly relevant when viewing shared MATLAB Live Scripts. Hidden code may be the default, especially if the script’s creator intended to focus the reader’s attention on interactive elements.
- Another key point is that MATLAB code requires functions to be defined at the end of the document. This practice often confuses users familiar with other programming languages, such as Python, where functions are commonly defined before they are called.
```



Jupyter Notebooks offer a free and open-source alternative to MATLAB Live Scripts. Identified by the `.ipynb` file extension, Jupyter Notebooks can be created online through services like Google Colab or locally with standalone clients. By default, Jupyter Notebooks use Markdown and LaTeX to format text cells and Python to execute code cells, though they support over forty programming languages. Unlike MATLAB, Python requires that functions be defined before they are called, necessitating that functions appear earlier in a Jupyter Notebook rather than at the end. Another noteworthy feature is that Jupyter Notebooks render directly on GitHub, a platform widely used in STEM research. The illustrations provided show portions of Jupyter Notebook source code, the rendered results, and an example of how a Jupyter Notebook is displayed on GitHub.

## MATLAB Live Editor

For the usage with MATLAB, the best native literate programming tool would be MATLAB Live Editor, which creates scripts that combine code, output, and formatted text. Divide code into manageable sections that can be run independently. View output and visualizations next to the code that produced them. Enhance your code and results with formatted text, headings, images, and hyperlinks. Insert equations using the interactive editor or create them using LaTeX. Save code, results, and formatted text in a single executable document. With MyST Markdown, you can define code cells with a directive like so:

```{code-cell}
print(2 + 2)
```

When your book is built, the contents of any `{code-cell}` blocks will be
executed with your default Jupyter kernel, and their outputs will be displayed
in-line with the rest of your content.

```{seealso}
Jupyter Book uses [Jupytext](https://jupytext.readthedocs.io/en/latest/) to convert text-based files to notebooks, and can support [many other text-based notebook files](https://jupyterbook.org/file-types/jupytext.html).
```

