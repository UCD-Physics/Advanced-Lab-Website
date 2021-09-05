---
title: Containers
# linktitle:

toc: true
type: book
weight: 20
--- 

Information on standard Python containers

<!--more-->

{{< toc hide_on="xl" >}}

## Introduction

In general, variables store single values which containers are
collections of values.

Python contains several types of containers that are used extensively,
such as strings, tuples, lists and dictionaries.

Strings and tuples are <span style="color: red"> *immutable*</span>,
i.e. once created they cannot be changed, while lists dictionaries and
sets are <span style="color: green"> *mutable* </span> and can be
changed. (**Note: one needs to be careful when passing mutable objects
to functions as any changes which are made inside the function also
appear outside**).

The main containers are:

| Container | Description |
|:----------|:------------|
| **strings** | ordered sequence of characters, fast access, repeatable values, immutable |
| **tuples**  | ordered sequence, fast access, repeatable values, immutable, faster than lists, use if data is not to be changed |  
| **lists**   | ordered sequence, fast access, repeatable values, mutable |
| **dictionaries**  | no a priori order, unique key, fast key access, mutable.|
| **sets**  | unordered collection with no duplicate elements, mutable  |


In addition, the Python standard
[collections](https://docs.python.org/3/library/collections.html#module-collections)
library contains onder container types such as namedtuples which are
useful as program complexity grows.

## Strings

Strings:
- are sequences of characters.
- are not changeable (“immutable”)
- are made with:
   - single quotes ('), e.g.
      -  `'This is a string with single quotes'`
   - double quotes ("). e.g. 
     - `"Obama's dog is called Bo"`
   - triple quotes, both single (''') and ("""), e.g. 
     - `'''String in triple quotes can extend  over multiple lines, like this on, and can contain  'single' and "double" quotes.'''`.
     - The triple quotes method is very useful for documenting functions.
- can be compared with "==" (true if every character including white space match)
- can be concatented with "+", e.g.
  - `'Hello ' + 'World'`
  - `'Hello World'`
- can be repeated with "*", e.g.
  - `'hello '*5`
  - `'hello hello hello hello hello'`
- have many methods (class functions) to manipulate them [online documentation](https://docs.python.org/3/library/stdtypes.html#string-methods), examples:
  - the method upper()/lower() returns upper/lower-case copies of the string
  - the method count(sub) counts the occurrances of substring sub in a string
  - the method find(sub) finds the first occurrance of substring sub in a string
  - the method split(sep=None) returns a list of strings with the string split by the separator sep (if sep not given as an argument defaults to white spaces)

String examples:
```python
>>> s="Hello World"

>>> s.lower()
'hello world'

>>> s.upper()
'HELLO WORLD'

>>> s.count('o')
2

>>> s.find('w')
-1

>>> s.find('W')
6

>>> "-".join(["one", "dog", "orange"]
'one-dog-orange'

>>> "words with   spaces".split()
['words', 'with', 'spaces']

>>> '1,2,3'.split(',')
['1', '2', '3']
```


