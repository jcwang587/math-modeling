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

# Preface

Mathematical modeling lies at the heart of modern engineering education, serving as a foundational tool for understanding and solving complex engineering problems. In a standard undergraduate math modeling course, lectures typically introduce theoretical concepts and analytical techniques using pen-and-paper methods, while laboratory sessions focus on applying these theories through computational exercises—often using MATLAB or Python. Despite this balanced approach, a common student concern has been the limited exposure to cutting-edge computational tools that extend beyond traditional environments.

In alignment with the mission of CACHE (Computer Aids for Chemical Engineering)—which is dedicated to bridging the gap between theory and practice by integrating advanced computational tools and simulations—this supplementary course is designed to enhance students’ computational skill sets. It builds upon core concepts from thermodynamics, transport phenomena, kinetics, and differential equations, and moves toward practical, hands-on experiences with state-of-the-art modeling frameworks and optimization solvers.

This book presents a structured set of seven modules centered around metabolic modeling. These modules guide students through topics ranging from flux balance analysis (FBA) to spatiotemporal FBA, culminating in the in silico modeling of a Petri dish environment. To achieve this, we will employ the professional-grade Gurobi optimization solver through MATLAB’s interface, as well as specialized dynamic flux balance analysis (DFBA) toolkits such as DFBALab and COMETS. Students will not only develop proficiency in these software packages, but also refine their literature-searching skills by identifying and applying suitable genome-scale metabolic models (GSMMs).

To further enrich the learning experience, we introduce advanced visualization and interface-building tools. Plotly, a leading interactive graphing library, will be used to transform raw computational results into intuitive, high-quality visualizations. Additional resources, including the MATLAB Live Editor, Machine Learning Toolbox, GUI interfaces, and the actxserver function, are integrated to create a well-rounded computational ecosystem.

We invite readers to explore the accompanying content pages, which provide detailed instructions, sample codes, and troubleshooting tips.

<div style="text-align: right;">
<br><br>Jiacheng Wang<br>Peng Bai
</div>