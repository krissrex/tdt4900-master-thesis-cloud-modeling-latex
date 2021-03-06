# Master Thesis - "A Modeling Environment in the Cloud for Education"

The source code for the VSCode extension is located in https://github.com/krissrex/tdt4900-master-thesis-ecore-tree-editor.

---

## Latex

This thesis is based on [COPCSE-NTNU/thesis-NTNU](https://github.com/COPCSE-NTNU/thesis-NTNU).
### thesis-NTNU

An NTNU thesis LaTeX document class for bachelor, master, and PhD theses. It replaces previous templates like https://github.com/COPCSE-NTNU/bachelor-thesis-NTNU and https://github.com/COPCSE-NTNU/master-theses-NTNU and provides a single template for theses at all study levels.

#### Setting up

You can use the template with [Overleaf](http://overleaf.com), and you are strongly encouraged to do so. The alternative is to install local copy of LaTeX on your laptop (not adviced, huge, difficult).

You should **fork** the CoPCSE repo so that you have your own files to edit and you can always merge with the upstream changes to the template, in case the template is updated. 

##### Setup using Overleaf

There are two ways for setting up the [**Overleaf**](http://overleaf.com) project with the template:

* Use the `.zip` copy and upload.
* Fork the the CoPCSE repo so that you have your own files to edit.

##### Building document locally

The template also provides a simple `Makefile` which allows you to build the document locally. This requires that you have a LaTeX compiler, such as [`texlive`](https://www.tug.org/texlive/), installed locally, which has to provide the commands `pdflatex` and `biber`.

Run make with `make thesis.pdf` to compile pdf. 
The `make clean` command will remove temporary files.