# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))
from pathlib import Path

# -- Project information -----------------------------------------------------

project = 'Benchpress'
copyright = '2023'
author = 'Felix L. Rios, Giusi Moffa, and Jack Kuipers'

# The full version, including alpha/beta/rc tags


release = '2.0.2'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
# extensions = ['sphinx-jsonschema']
extensions = [
    # other
    'recommonmark',
    'sphinx_copybutton',
    'sphinx-prompt',
    'sphinxcontrib.bibtex',
    'sphinx_last_updated_by_git',
    'versionwarning.extension'
]

paths = [Path("../../workflow/rules/structure_learning_algorithms"),
         Path("../../workflow/rules/parameters"),
         Path("../../workflow/rules/graph"),
         Path("../../workflow/rules/data"),
         Path("../../workflow/rules/evaluation"),
         Path("../../workflow/rules/data/fixed_data")
         ]


bibtex_bibfiles = []
for mod in paths:
    bibtex_bibfiles += [str(p / "bibtex.bib")
                        for p in mod.iterdir() if (p/"bibtex.bib").is_file()]


# source_suffix = {
#     '.rst': 'restructuredtext',
#     '.txt': 'markdown',
#     '.md': 'markdown',
# }
# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []

numfig = True

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'


# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']


html_logo = '_static/benchpress-logo-readthedocs@2x.png'
html_theme_options = {
    'logo_only': True,
    'display_version': False,
}
