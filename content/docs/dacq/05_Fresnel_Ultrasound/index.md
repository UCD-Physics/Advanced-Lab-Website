---
title: Fresnel w/ Ultrasound 
#linktitle: Fresnel

toc: true
type: book
weight: 60
--- 

Documentation for the control and data acquisition for the Fresnel Diffraction with Ultrasound experiment.

<!--more-->



## Introduction

In 2022 as part of a final year Physics project the experiemnt to
investigate Fresnel Diffraction using Ultrasound was upgraded to allow
fine position of the diffraction screen(s) an automated readout of the
traces using a USB oscillosopce.

Please see the [GitHub repository](https://github.com/JohnQuinn1/Fresnel_Ultrasound)  for documentation and a useful Python library (picoserial.py).

A [Jupyter notebook](https://github.com/JohnQuinn1/Fresnel_Ultrasound/blob/main/Fresnel%20DACQ.ipynb)  with documentation is included in the repository and is repeted below 

<hr/>

# Data Acquisition for the Fresnel Diffraction with Ultrasound Experiment 

In this lab a microstepped motor is used to precisely move an ultrasound receiver mounted on a linear slider rail. One-sixteenth microstepping is used and with the lead-screw system very smooth and fine movements are achiavable. **It was measured that 200,000 steps moves the recevier through 50 cm.**

The motor is controlled by a Raspberry Pi Pico, which can be communicated with over Python using PySerial. 

The data acquisition is carried out in Python using a Picoscope, which is a USB oscilloscope.


## Raspberry Pi Pico

The [Raspberry Pi Pico](https://www.raspberrypi.com/products/raspberry-pi-pico/) is a microcontroller that runs [Micropython](https://micropython.org). 

A limit switch is installed at one end of the slider rail, which is used to set the home zero position of the slider and prevent the motor driving too far. The limit is implemented in the software installed on the Pi Pico - for safety reasons you should only use the supplied functions and not directly manipulate the motor. The limit at the opposite end is based on a maximum number of steps from the limit switch. At any point the limit switch can be pressed by hand to stop the motor moving.

The code to control the motor is installed in a file called `main.py` which is executed when the Pi Pico boots up. One can interact directly with the Pi Pico using the Thonny program and execute MicroPython commands including the functions to move the motor defined in `main.py`. However, for the purpose of automating the experiment, we want to issue commands to the Pi Pico directly from Python running on a standard PC. The is achieved by sending commands and receiving responses over the USB connection using PySerial. 


A class (`PicoSerial`) is provided in this GitHub repository to facilitate easy communication with the Pi Pico.
The serial over USB approach basically sends the commands over a serial line and reads back the response that would have been seen in Thonny. Thus, there are extra characters like `'>>>'` which are handled. Also, Python strings must be encoded as UTF8 for sending and decoded from UTF8 for receiving - this is handled automatically by the `PicoSerial` class.

There is also an issue with timing - to read blocks of text a timeout must be specified and  if a command takes longer than the timeout (default is 1 s) to execute on the Pi Pico then a black line is returned and a re-read must happen. The PicoSerial class has a function which re-reads until a non-empty response is received.

Note: sometimes the Pi Pico needs to be re-started after using Thonny so that it can communicate with the PC using Python and PySerial. If you need to restart it you must turn off the power to the power supply and also disconnect the USB cable from the computer.  

### Stepper Motor functions on the Pi Pico

The functions for moving the stepped motor defined in `main.py` on the Pi Pico are:


| Function | 
|----------|
| `initialise()` | 
| `move(steps: int)` | 
| `get_current_pos()`|

These commands print responses and do not return any values. They are explained below:

**`intialise()`**:
* must be called when system is first powered up or if limit switch is accidentally hit
* it moves the slider until the limit switch is activated and then backs away until the limit switch is released. This is defined to be the zero position. Note: on some rare occasions this can be on the edge and the limit switch can activate in the zero position
* It prints `'Initialising'` immediately once called and then prints `'Initialised'` once finished. If the slider is a long way from the limit switch it can take considerably  more than one second and hence the serial may time out.
* if the slider is moved so that the limit switch is accidentally activated the `initialise()` must be called again.



**`move(steps: int)`**:
* moves the motor some number of steps.
* the only argument, `steps` is an integer and if it is positive then the slider moves away from the limit switch whereas if it is negative the slider moves towards the limit switch..
* The function immediately prints `'Moving'` when called and then `'Success'` when it successfully finishes moving the slider.
* It may also print one of the following errors if there is a problem:
    * `'Error: Not initialised!'`
    * `'Error: Beyond limit requested - not moved'` (if attempt to move beyond the maximum limit of 200,000 steps set in software)
    * `'Error: Limit switch hit - you must re-initilise() before moving again.'`


**`get_current_pos()`**:

* returns the current position of the slider in terms of the number of steps the motor has taken from the zero position.


1.``intialise()`` - must be called before movement, moves the motor back to the limit switch  
2.``move(number_of_steps(int), direction(1=away from motor, 0=towards motor))`` -moves the recevier in the specified direction and number of steps  
3.``get_current_pos()`` - returns the position in number of steps from the limit switch

### `PicoSerial` class

A class called `PicoSerial` was developed to aid communications with the stepper motor code on the Pi Pico.
It is in a filed called `picoserial.py` in this repository and you can either copy that file into your working directory or copy and paste the code into a cell in a Jupyter notebook.

Import and make an instance with:

```python
import picoserial
motor =  picoserial.PicoSerial()  # use default constructor values
```
The PicoSerial constructor allows the following arguments to be specified (they all have default values which should generally be fine.):
```python
picoserial.PicoSerial(device='COM4', baud=9600, timeout=1.0)
```


The methods (functions) defined in the class are:

| PicoSerial method|
|------------------|
|`receive() -> str`|
|`receive_reply(max_reply_attempts: int = 1) -> str`|
|`send(text: str) -> bool`|
|`set_timeout(timeout: float) -> None`|


Below is an explanation of the PicoSerial methods:

**`receive() -> str`**:
* read one line ('\n' terminated) from the serial bus and decode it, removing any `>>>`. Will wait forever unless Serial timeout specified.
* takes no arguments and returns a string, which may be empty if timed out.

**`receive_reply(max_reply_attempts: int = 1) -> str`**:
* Repeatedly calls `receive()` until a non-empty string is returned
* `max_reply_attempts` is the maximum number of attempts t make before returning.
* it returns a string, which may be empty if timed out. 

**`send(text: str) -> bool`**:
* encode provided text and send over serial line.
* The Pi Pico first echos whatever is sent to it - thus it is read back and compared to what was sent as a check that everything is working ok.
* the method returns either `True` or `False` depending on whether the response matched what was sent or not - it is not an indication of whether the command sent to the Pi Pico succeeded, nor related to the output of that command.


Example:
```python
import picoserial
motor =  picoserial.PicoSerial()

motor.send("initialise()")
print(motor.receive())            # should print 'Initialising'
print(motor.receive_reply(1000))
```
produces:
```
Initialising
Initialised
```


## The USB Picoscope

The device used to take data is a USB oscilloscope ([Picoscope 2204a](https://www.picotech.com/oscilloscope/2000/picoscope-2000-overview)). It functions in the same way as a regular oscilloscope, with channels that read voltage data, however it is controlled using a PC. There is a PicoScope program that shows the traces, and this should be used to check the trace before taking data in Python. The appropriate timebase and voltage range may be determined by viewing the traces in this application.

The Picoscope is used to collect data in Python, where amplitude values may be recorded over a specified timebase.

The steps to use the Picoscope 2204a in Python are:
1. Import libraries
2. Open connection to the device
3. Configure sampling interval
4. Specify and configure channels to be read out
5. Set up trigger
6. Run the acquisition and wait for ready
7. Read out data and make time array.


### Import libraries

The libraries to interface with it must be imported:
````Python 
from picoscope import ps2000
````

### Open connection to the device
The scope must then be set up, specifying parameters such as the sampling interval and the duration of the recording  
Setting up the Picoscope device is shown in the following example:
```Python

ps = ps2000.PS2000()
```

### Configure sampling interval
```python
waveform_desired_duration = 50E-6
obs_duration = 3 * waveform_desired_duration #range plotted
sampling_interval = obs_duration / 4096 #sampling interval

(actualSamplingInterval, nSamples, maxSamples) = \
    ps.setSamplingInterval(sampling_interval, obs_duration)

```
The ``waveform_desired_duration`` value is specified in seconds, and can help in choosing a timebase. If the period of the waveform is known, a time should be included here that allows for an appropriate trace to be recorded. The actual duration over which the trace is recorded is given by ``obs_duration`` which in this case is 3 times the waveform duration. These numbers should be adjusted depending on the waveform observed to avoid aliasing of the signal.

The ``sampling_interval`` ensures 4096 samples are taken within the observation window, this divisor may be changed depending on the number of samples required.

### Specify and configure channels to be read out

The channels must be set up using setChannel, with their sampling voltage range, in the case below it is 10V. The ``setChannel`` command will chose the next largest amplitude.     
Then the trigger is set using ``setSimpleTrigger()``, in this case on the falling edge of channel A.  
To collect data from the picoscope, a function called ``runBlock()`` is used. Then the data can collected using ``getDataV()``.  

To take data from two channels, called A and B, the following code can be run:
```Python
ps.setChannel('A', 'DC', 10.0, 0.0, enabled=True,BWLimited=False)
    
ps.setChannel('B', 'DC', 10.0, 0.0, enabled=True,BWLimited=False)

```

`setChannel()` takes the following arguments:
```Python
setChannel(self, channel='A', coupling='AC', VRange=2.0, VOffset=0.0, enabled=True, BWLimited=0, probeAttenuation=1.0). 
```
where the voltage range is set in the example above. This should be chosen based on the signal that you are viewing.


### Set up trigger
```python
ps.setSimpleTrigger('A', 1.0, 'Falling', timeout_ms=100, enabled=True) 
```

The trigger function takes the following arguments:
````Python
setSimpleTrigger(self, trigSrc, threshold_V=0, direction='Rising', delay=0, timeout_ms=100, enabled=True)
````
Where the channel the scope triggers on and which edge can be chosen.  

### Run the acquisition and wait for ready

```python   
ps.runBlock()
ps.waitReady()
```

### Readout data and make time array

```python
dataA = ps.getDataV('A', nSamples, returnOverflow=False)     #collecting data for both channels 
dataB = ps.getDataV('B', nSamples, returnOverflow=False)
    
dataTimeAxis = np.arange(nSamples) * actualSamplingInterval

```

Record a data set and then plot using dataTimeAxis as your time axis, check that the plot returns the expected trace.


### Summary of some useful Picoscope Python commands

Below is a table that provides commands that may be send to the PicoScope and what is returned:

| Command | Returned | 
:-|-:
|**setChannel(self, channel='A', coupling='AC', VRange=2.0, VOffset=0.0, enabled=True, BWLimited=0, probeAttenuation=1.0)**| This sets up a channel on the Scope | 
|**setSimpleTrigger(self, trigSrc, threshold_V=0, direction='Rising', delay=0, timeout_ms=100, enabled=True)**|This triggers the Scope on a certain channel|
|**runBlock(self, pretrig=0.0, segmentIndex=0)**|Runs a block read of data|
|**setSamplingInterval(self, sampleInterval, duration, oversample=0, segmentIndex=0)**|(actualSampleInterval, noSamples, maxSamples)|
|**waitReady(self, spin_delay=0.01)**|waits until the scope is ready to collect data|
|**getDataV(self, channel, numSamples=0, startIndex=0, downSampleRatio=1, downSampleMode=0, segmentIndex=0, returnOverflow=False, exceptOverflow=False, dataV=None, dataRaw=None, dtype=<class 'numpy.float64'>)**|Return the data as an array of voltage values. It returns (dataV, overflow) if returnOverflow = True, else, it returns dataV. dataV is an array with size numSamplesReturned|
|**getDataRaw(self, channel='A', numSamples=0, startIndex=0, downSampleRatio=1, downSampleMode=0, segmentIndex=0, data=None)**|It returns a tuple containing: (data, numSamplesReturned, overflow)|
|**getAllUnitInfo(self)**| Human readable unit information as a string|





```python

```
