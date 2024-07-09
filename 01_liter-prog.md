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

# Literate Programming and Git

**Literate programming** is a programming paradigm introduced in 1984 by [Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth) in which a computer program is given as an explanation of how it works in a natural language. In this chapter, students will learn to use the MATLAB Live Editor, which integrates code chunks and notes effectively, as their primary tool in subsequent modules. 

**Git** is a distributed version control system that tracks versions of files. It is often used to control source code by programmers collaboratively developing software. A version control system is essential for modern coding development. Students will start a personal GitHub to store their code and set up a Git plugin in MATLAB.

## MATLAB Live Editor

With MyST Markdown, you can define code cells with a directive like so:

```{code-cell}
print(2 + 2)
```

When your book is built, the contents of any `{code-cell}` blocks will be
executed with your default Jupyter kernel, and their outputs will be displayed
in-line with the rest of your content.

```{seealso}
Jupyter Book uses [Jupytext](https://jupytext.readthedocs.io/en/latest/) to convert text-based files to notebooks, and can support [many other text-based notebook files](https://jupyterbook.org/file-types/jupytext.html).
```

## Join Github

MyST Markdown notebooks are defined by two things:

1. YAML metadata that is needed to understand if / how it should convert text files to notebooks (including information about the kernel needed).
   See the YAML at the top of this page for example.
2. The presence of `{code-cell}` directives, which will be executed with your book.

That's all that is needed to get started!

## Set Up Git Source Control

If you have a markdown file and you'd like to quickly add YAML metadata to it, so that Jupyter Book will treat it as a MyST Markdown Notebook, run the following command:

```
jupyter-book myst init path/to/markdownfile.md
```

## My First Repository

If you have a markdown file and you'd like to quickly add YAML metadata to it, so that Jupyter Book will treat it as a MyST Markdown Notebook, run the following command:
