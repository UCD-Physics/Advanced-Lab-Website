---
title: Data Acquistion General Concepts
linktitle: General Concepts

toc: true
type: book
draft: false

weight: 10
--- 


## Analogue and Digital

Computers are digital systems and they must interface with analogue systems
in the real world. This ultimately involves either or both of:
 * sending a digital number from the computer to a device which converts it into an analogue signal

or

 * taking an analogue signal and converting it into a digital signal which is sent to the computer.


The common nomenclature is:

| Term | Acronym | Meaning |
|------|---------|---------|
| Digitial-to-Analogue Converter | DAC | Takes a digital signal (from computer) and convert to an analogue output signal|
| Analogue-Digital Converter | ADC | Converts an analogue signal to digital for recording by the computer  |


<br/>

In addition, sometimes digital signals are sent directy to control
devices which have on/off states or to provide 'clock' signals for example to
move stepper motors.

<br/>

## Bits, Bytes and Binary Numbers

Internally computers manipulate bits, which are voltages that
represent either a '1' or a '0'. Individual bits are grouped together
to store information (a collection of 8 bits is called a 'byte'). For
examples, ADCs may be 8 bit, 12 bit, 16 bit etc. The bits when
combined form a binary number since each location has only two
possible values.

For example, consider a byte consisting of 8 bits as shown below. Each
bit has a weight based on its position; the lowest weight ("least
significant bit") is on the right and the weights double with each
place to the left since each position can have two possibilities (a 1
or 0). The number of possible values is given by $2^8=256$ (0 to 255)

{{< figure src="binary.png" title="Figure: Binary Numbers" lightbox="true" width="500" >}}

<br/>

## Binary in Python

* entering and printing binary numbers

* bit manipulation

test including python code:

```python
sample code!
```

<br/>

## Digital Signal Representation

The process of digitising a signal involves a converting a continuous analogues signal
into a discrete digital signal. This invoves discretisation of the signal size/value and
in time: the digitised signal only has discrete values at discrete times, called _samples_.


<br/>

## Resolution
Since computers only store digital values digitised values are discrete. The number of bits combined with the range of the ADC or DAC determines the resolution. For example, an 8-bit ADC with a range of 5V has a resolution of ~0.0195V (5V/256) while a 12-bit ADC with a range of 5V has a resolution of 0.0012V (5V/4096).



<br/>

## Sampling
Nyquist, sample rate, alasing etc + figure/movie




{{< figure src="DigitalDAQv2.png" title="src: Wikipedia" link="https://en.wikipedia.org/wiki/File:DigitalDAQv2.pdf"
lightbox="false">}}





