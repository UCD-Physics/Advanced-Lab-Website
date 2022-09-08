---
title: Coding Guidelines
date: 2021-09-05
type: book
weight: 40

toc: true
icon: file-code
icon_pack: fas

toc: true
---

 {{< toc hide_on="xl" >}}

## Introduction
Whilst the most important apsect of coding is that your code works
correctly and does what it is supposed to do, it is just as important
to write code that is clear, well structured and easy to follow.
It is often said that "*code is written once and read many times*",
with a ratio of 10 to 1 sometime [quoted](https://www.goodreads.com/quotes/835238-indeed-the-ratio-of-time-spent-reading-versus-writing-is).
**Code readabilty is of the utmost importance.**

Also, this is not easy to get right and the only way to improve is to practice and gain experience!

## Don't try to be too clever!

In the Advanced Lab Python is a tool to enable us to do Physics - the
aim of Python in the lab is not to write the cleverest code possible.
Often clever coding (including trying to completley automate analyses)
leads to code that is difficult to understand and hard to debug.

> “Debugging is twice as hard as writing the code in the first
  place. Therefore, if you write the code as cleverly as possible, you
  are, by definition, not smart enough to debug it.”
  [(Kernighan's Law)](https://github.com/dwmkerr/hacker-laws#kernighans-law)


## Good Practice: PEP 8

Good program structure, including splitting code across multiples
lines if appropriate, chosing good names for variables, adding helpful
comments etc. can really aid the readability of code.

It is highly recommended to have a look at and try to follow the [PEP
 8 -- Style Guide for Python
 Code](https://www.python.org/dev/peps/pep-0008/).  A shorter
 introduction is available here: [How to Write Beautiful Python Code
 With PEP 8](https://realpython.com/python-pep8/). Ultimately, be
 critical of how you present your code (try to view it from the
 perspective of someone else reading it) and apply common sense!

Here is a link to a document advising [Best practices for writing code
comments](https://stackoverflow.blog/2021/07/05/best-practices-for-writing-code-comments/)
(examples are not Python but C/C++). 

### Black

There is a software package called
[Black](https://black.readthedocs.io/en/stable/) which you can run on
your code to automatically re-format to mostly confrom to PEP 8 (it does not
do calculations very well, unfortunately). It
can also be installed into Jupyter Notebooks so that cells can be
reformatted - [see this
page](https://github.com/drillan/jupyter-black).

## Advanced Lab Reports

From the perspective of the Advanced Lab reports, please always check the code
in the PDF document that you submit as, in many cases, lines that are
too long are often truncated. Care should really be taken to split
long lines across multiple lines instead.

If you are using a Jypyter Notebook and you are coding up a Physics
equations, it can be very helpful to have the equation displayed using
LaTeX in a Markdown cell impediately before the code cell, and to
structure the Python code similar to the mathematical form.

## Using Python Libraries

In general you should use standard Python libraries (Numpy, SciPy,
AstroPy) for the majority of mathematical operations. However, there
are many many more Python libraries available and use of these should
be discussed with the staff member responsible for your laboratory
experiment.

If additional libraries is used then an
explanation should be given of what exactly the functions you are
calling do, with links to some documentation (the staff cannot be
expected to be familiar with every Python library out there!)

## Code Plagiarism

Code plagiarism can be a serious issue and blindly copying code off
the internet and incorporating it into your own code should not be
done. Code snippets beyond short trivial examples (e.g. how to call
some particular function) should also not be used verbatim and should
be properly referenced. The Brightspace plagiarism checker does
include internet resources and forums such as Stackoverflow and will
flag code that is viewed as highly similar.


{{< list_children >}}


