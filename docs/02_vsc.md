---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
---

# Version Source Control

**Git** is a distributed version control system that tracks versions of files. It is often used to control source code by programmers collaboratively developing software. A version control system is essential for modern coding development. You can use Git source control in MATLAB to manage your files and collaborate with others. Using Git, you can track changes to your files and recall specific versions later. From the MATLAB Current Folder browser, you can clone an existing remote repository, add files to the local repository, commit changes, and push and pull changes to and from the remote repository.


```{figure} _static/fig2-1.png
:height: 200px
:name: figure_git

The basic workflow for working with the remote repository.
```

## Join Github

To get started with GitHub, you'll need to create a free personal account and verify your email address.

1. Navigate to GitHub webpage [https://github.com/](https://github.com/).
2. Click {guilabel}`Sign up`.
3. Follow the prompts to create your personal account.

## My First Repository

We will begin by creating a repository where you can store and manage your code projects. A repository serves as a dedicated space in which all your files, along with their version history, are kept.

1. **Access Your GitHub Profile:**
   After signing in, click on your profile icon in the upper-right corner of the GitHub homepage, then select **Your repositories**.

2. **Create a New Repository:**
   On the repositories page, click the {guilabel}`New` button. This action will open a form for creating a new repository.

3. **Name Your Repository:**
   Choose a clear and descriptive name, such as `my-first-repo`. Keep in mind that this name will be part of the repository’s URL.

4. **Add an Optional Description:**
   You can add a short description to help others understand the purpose of your repository.

5. **Set the Repository’s Visibility:**

   - **Public:** Anyone on the internet can view and clone the repository.
   - **Private:** Only you and collaborators you specify can access the repository.

   For most learning exercises, a public repository is appropriate, as it allows you to share your work easily.

6. **Initialize With a README (Recommended):**
   By selecting {guilabel}`Add a README file`, you create a default file that you can edit to introduce your project and provide relevant instructions or documentation.

7. **Add a License (Optional):**
   If you plan to share your code with others, consider adding a license.

8. **Create the Repository:**
   Click {guilabel}`Create repository`. You will be taken to the main page of your newly created repository, where you can add files and explore other GitHub features.

By following these steps, you will have created your first GitHub repository, establishing a foundation for version-controlled development and future collaboration.

## Set Up Git Source Control in MATLAB

The Git [cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf) shows the command line operations such as Add, Commit, Push, Pull and Fetch.

```{tip}
To enable source control integration in MATLAB, you might need to go to {guilabel}`Preferences` tab, navigate to {guilabel}`General`, then select {guilabel}`Source Control`, and activate the MathWorks source control integration.
```
