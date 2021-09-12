---

widget: portfolio
headless: true  # This file represents a page section.

# ... Put Your Section Options Here (title etc.) ...

title: Quicklinks...

weight: 30

content:

  page_type: book

  filter_default: 0
  # Uncomment to only show content with specific tags
  filters:
     tags:
       - featured 


  # Filter toolbar (optional).
  # Add or remove as many filters (`filter_button` instances) as you like.
  # To show all items, set `tag` to "*".
  # To filter by a specific tag, set `tag` to an existing tag name.
  # To remove toolbar, delete/comment all instances of `filter_button` below.
  #filter_button:
  #  - name: All
  #    tag: '*'
  #  - name: Deep Learning
  #    tag: Deep Learning
  #  - name: Other
  #    tag: Demo

design:
  columns: 3

  # Toggle between the various page layout types.
  #   1 = List
  #   2 = Compact  
  #   3 = Card
  #   4 = Citation
  #   5 = Showcase
  view: 3
  # For Showcase view, flip alternate rows?
  flip_alt_rows: true

  background:
    gradient_angle: 0
    gradient_start: 'rgb(134,134,154)'
    gradient_end: 'rgb(153,204,255)'
    


---


