---
title: Formatting Your Code
linktitle: How to use Markdown 
date: 2022-07-06
type: book
toc: true
---
# 



<!--more-->

{{< toc hide_on="xl" >}}

# Writing your code well

### When coding, it is extremelly important to make your code clear and concise.
You are not going to be the only person reading your code and so it must be easy to follow. It is also very easy to forget why you did something when reading back on it yourself days or week after you've written it. This is helped by using markdown cells and commenting your code.

#### Markdown Cells
Markdown cells are what are used to just write text. This is extremely useful to title and explain your code. Markdown cells are created by clicking on the cell and hittting  the 'm' key. An example of how to use a markdown cell can be seen below.



```python
# This will create a title 

### This will create a subtitle

#### This will create a smaller subtitle

#      *this will emphasise a word* (# not needed in the markdown cell for normal text)
```

### Equations

It is also possible to write equations out in a markdown cell, which makes them much clearer than in a code cell. These should be written in between $$, and with LateX. An example of how to write it can be seen below, with how it looks in a markdown cell after it.


*Here is a link to a LateX cheat sheet if you are not familiar with it, https://wch.github.io/latexsheet/*


```python
#### This is the equation 

# $ f(x) = \frac{x^3}{2x + 4} + \sin{(3x)}$ (# is not needed in the markdown cell for the equation)
```

### This is the equation 

 $ f(x) = \frac{x^3}{2x + 4} + \sin{(3x)}$

This is a link to a markdown cheat sheet if you want to expand beyond the basics!
https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

# f-strings

f-strings are an extremely useful tool for string formatting in python. 

#### How to use them?
Begin by starting the string with an f or F and refer to the variables within the string between curly brackets '{}'. An example can be seen below.


```python
# assign a variable

place = 'UCD'

# print out a statement

print(f"I'm studying in {place}") # this gives an output
```

    I'm studying in UCD
    

These are also very useful when dealing with numbers as you can easily print out a desired number of decimal places.


```python
#pi as an example 

import math
pi = math.pi

#print out variable
print(f"pi has a value of {pi}")

```

    pi has a value of 3.141592653589793
    


```python
#to a certain number of decimal places
print(f"pi has a value of {pi: .3f}") #e.g. 3
```

    pi has a value of  3.142
    


```python
#using scientific notation
print(f"pi has a value of {pi:.4e}")
```

    pi has a value of 3.1416e+00
    

There are many different things you can do with f-strings, including easily making things all upper or lower case as well as getting the length of your variable. These are explained in more detail here https://realpython.com/python-f-strings/. 

*note: could also make supplementary material on f-strings and link that instead*


### Lastly, it is extremely important to comment your code as you go
This is easily done by just writing a '#' before your text. It can just be as simple as writing '#importing data' or '#assigning this to a variable' etc. It makes a huge difference in letting other people understand your code and can remind you of things you've forgotten. 


```python

```
