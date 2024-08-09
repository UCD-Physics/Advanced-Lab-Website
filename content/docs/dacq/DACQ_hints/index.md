---
title: Data Acquistion Hints and Tips

toc: true
type: docs
draft: false

weight: 5
---

A quick overview of how to structure your DACQ code and some other
things to look out for.

<!--more-->


{{< toc hide_on="xl" >}}

## Please save your data!

{{% callout note %}}

Please save your data to a file! <br> If you analyse the data in the
notebook in which it was acquired without saving it then you will be
unable to analyse it on a different machine. To make even a minor
change (e.g. adding a title to the graph) in the notebook in which it
was acquired after a restart will require you to take the data again!

{{% /callout %}}


## General DACQ program structure

While different experiments may have different data acquisition and
control requirements, the general structre is pretty similar. Below is
the outline of what a program to send out voltages (DACQ) and read back
corresponding voltages (ADC) looks like. 

1. Load necessary libraries
2. Define range(s) of interest (e.g. range of voltages to be sent out)
3. Initialise and configure data acquisition interface.
4. Initialise where data will be stored (e.g. lists) and other necessary variables 
5. Loop of range of interest:
   1. Write out voltage to DACQ
   2. Pause
   3. Read back corresponding voltage from ADC
   4. Append voltage from ADC to a list
6. Plot data to see if everything looks good
7. Save data and metadate to a file.

#### Example skeleton code:

Here is sample code do to this using the National Instrument USB 6008
where we send out some voltage and measure the corresponding current
through a resistor.:

```python

# Load standard libraries
import matplotlib.pyplot as plt
import numpy as np
from time import sleep

# Load NIDACQ libraries
from pydaqmx_helper.adc import ADC
from pydaqmx_helper.dac import DAC

# Define range of interest
voltages = np.linspace(0, +5, 50)

# Initialise DACQ interface:
myDAC = DAC(0)

myADC = ADC()
myADC.addChannels([1], minRange=0, maxRange=5)

# Initialse lists and other variables
R = 1_000         # 1 kOhm resistor use
delay_s = 0.1
currents = []

# Main DACQ loop:
for vout in voltages:
    myDAC.writeVoltage(vout)
    sleep(delay_s)
    vin = myADC.readVoltage()
    currents.append(vin/R)

# plot results
plt.plot(voltages, currents, "ro")
plt.title("I-V Curve of x")
plt.xlabel("Voltage (V)")
plt.xlabel("Current (A)")

# save data
filename = input("Please enter filename, blank to not save")
if filename:   
   np.savetxt(filename, np_c[voltages, currents],
             header="Columns are Voltages (V) and Currents (I)")
```

## DACQ things to look out for:

#### ADC range
When used in differential mode the USB 6008/6009 ADCs have programmable ranges
which should be matched to the signal you are measuring. See the [NI USB 6008/6009documentation]({{< relref "/docs/dacq/DACQ_NI" >}})

#### Sampling Voltages from one or more channels

If we need to take a lot of points quickly or with good timing or
readings from more than one channel then the National Instruments USB
6008/6009 have a `sampleVoltages()` command where the module samples
at a give rate (10 kHz max for USB 6008) and returns all of the
values (i.e. yo do not need to do a loop but the downside is
that Python blocks while sampleVoltages() is active). See the [NI USB 6008/6009 documentation]({{< relref
"/docs/dacq/DACQ_NI" >}})

#### Checking for Errors

Some modules, such as the [RBD 9103 Picoammeter]({{< relref
"/docs/dacq/RBD9103_Picoammeter" >}}) may return unstable readings
when they change ranges - make sure to check for instability and
re-read if necessary.

#### Delays

You may pause your code using the `sleep()` command from the `time` library.
The sleeps are specified in seconds (floats - fractional seconds allowed).
```python
from time import sleep
sleep(1.0)
```

#### High Performance timing

Python has high-performance timers for measuring small time intervals
(useful for e.g. the Electrical Noise experiment for measuring the
time between pulses). See: [time.perf_counter()](https://docs.python.org/3/library/time.html#time.perf_counter) and [time.perf_counter_ns()](https://docs.python.org/3/library/time.html#time.perf_counter_ns)

#### Monitoring slow DACQ

If your DACQ code takes a long time to run because a lot of points are
needed or large delays then it may be useful to monitor activity with
a progress bar. See the [HowTo on TQDM](https://github.com/UCD-Physics/Python-HowTos/blob/main/tqdm.ipynb)