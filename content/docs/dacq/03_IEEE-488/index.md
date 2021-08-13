---
title: IEEE-488
linktitle: IEEE-488

toc: true
type: book
weight: 40
--- 

Learn how to use the IEEE-488 interface to communicate with compatible devices.

<!--more-->

## Introduction

IEEE-488 is a venerable interface standard for communication between
computers and scientific instruments such as multimeters and
picoammeters. In particular, a Keithley 485 Picoammeter is used in
the APL for experiments on th ephotoelectric affect and Nuvistor Triode.


{{< figure src="Keithley_485.png" title="Figure: Keithley 485 IEEE-488 Picoammeter front and back" lightbox="true" width="600" >}}

In the IEEE-488 system devices are daisy chained used a special cable and connected
to a computer using an IEEE-488 interface card. Each device has
a unique address (number), often set using DIP switches on the back, as shown
in the right side of the figure above. In your Python code you must use the set address
to communicate with the instrument in question.

## IEEE-488 from Python

The steps for communicating with an IEEE-488 device from Python are:

* import the IEEEInterface class:
    ```python
       from ieeeinterface import IEEEInterface
    ```
* make an instance of the IEEEInterface class:
    ```python
       myIEEE=IEEEInterface()
    ```

* Open connection to the card:
    ```python
       cardhandle=myIEEE.openCard()
    ```

* Check if the card opened successfully. `cardhandle` will have a value of 0 if an error occurred. Note: opening the card and checking needs to be done only once per program.

* Read from the device (example assumes device address is '5'): 
   ```python
      device=5
      response=myIEEE.readDevice(device)
   ```

* The `IEEE readDevice()` command returns a string (in the above example stored in a variable called `response`).
    * If `response` is empty then an arror occurred and you should attempt a re-read.
    * if `response` is not empty then it will contain the reading you are interested, along with some other information about the device settings and/or scale. *Extract the part of the string that corresponds to the value you are interested in and convert it to a `float` for calculation, plotting etc*

