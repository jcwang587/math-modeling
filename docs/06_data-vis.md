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

# Data Visualization

Data visualization plays a critical role in understanding and communicating complex information. By transforming raw data into graphical representations, it becomes easier to identify patterns, trends, and outliers that might otherwise remain hidden. In the context of scientific computing, various tools and libraries, such as MATLAB and Plotly, can be used to create compelling, easy to interpret figures.

## MATLAB Plot

MATLAB’s built-in `plot` function is a straightforward yet versatile tool for generating a wide range of basic visualizations. It is most commonly used to create line plots, scatter plots, and other simple chart types. To learn more about using this function, you can type `help plot` or `doc plot` in the MATLAB Command Window for tutorials and examples, or refer to the official documentation at [https://www.mathworks.com/help/matlab/ref/plot.html](https://www.mathworks.com/help/matlab/ref/plot.html).

## Set up Plotly

`Plotly` is an interactive, open-source, and browser-based graphing library that provides powerful functions for creating interactive graphs and conducting statistical analysis in various programming languages, including Python, R, and MATLAB. By using `Plotly`’s MATLAB library, for example, users can produce professional quality charts (such as box plots, histograms, and distribution plots) that enhance both the clarity and engagement of data presentations.

Plotly MATLAB can be installed by downloading the installation package from the [Plotly MATLAB Releases](https://github.com/plotly/plotly_matlab/releases) page on GitHub. Once you have navigated to the directory containing the package, run the following command to complete the setup:

```matlab
plotlysetup_offline()
```

To convert a MATLAB figure to an interactive Plotly figure, use the following command:

```matlab
 p = fig2plotly;
```

This will generate a Plotly figure object that can be further customized or uploaded to the Plotly platform.
