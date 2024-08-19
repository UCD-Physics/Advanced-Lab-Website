---
title: Get Python
#linktitle: Download Python
date: 2020-09-04
weight: 10
type: docs
icon: download
icon_pack: fas
---

## Python distribution and version
Information on the Python distribution and version to download...

### Python 3

Python 3 is the [officially-supported](https://www.python.org) version
and is the one that is used in the Advanced Laboratories. 

There are different releases of Python 3 (e.g. 3.12) and it is
recommened to use the most recent release, but in particular a release
of 3.6 or later.

<br/>

### Python Distribution

#### Conda-forge

<center>
<a href="https://conda-forge.org">
<img src="conda-forge.png" alt="conda-forge logo" width="200"/></a>
</center>

The recommended way to install Python and associated packages such as
[Scipy](https://www.scipy.org), [Numpy](https://numpy.org),
[Matplotlib](https://matplotlib.org), [AstroPy](https://www.astropy.org) etc.
is from [Conda-forge](https://conda-forge.org).

Conda-forge provides Python packages for a range of operating systems including Windows, Linux and Mac OS.

The Conda-forge installer is [miniforge](https://github.com/conda-forge/miniforge). There are various guides to miniforge online, such as
[here](https://kirenz.github.io/codelabs/codelabs/miniforge-setup/#0)
which guide you through the process.


#### Anaconda Python Distribution

<center>
<a href="https://anaconda.org">
<img src="anaconda.png" alt="anaconda logo" width="200"/></a>
</center>

Alternatively [Anaconda Python Distribution](https://anaconda.org) can
be installed. Note that this is from a commercial company which now
requires an email address to obtain the download link and the
distribution includes many additional packages by Anaconda which
require an Anaconda account to use.


### Do not use Python 2!

Python 2 was officially [sunset](https://www.python.org/doc/sunset-python-2/) in early 2020. 

{{% callout warning %}}
A lot of basic Python 3 code will run in Python 2 but subtle differences can cause unexpected behaviour, especially with division of integers!
{{% /callout %}}


