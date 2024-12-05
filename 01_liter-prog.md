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

**Literate programming** is a programming paradigm introduced in 1984 by [Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth) in which a computer program is given as an explanation of how it works in a natural language. In this chapter, students will learn to use the MATLAB Live Editor, which integrates code chunks and notes effectively, as their primary tool in subsequent modules. 

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

