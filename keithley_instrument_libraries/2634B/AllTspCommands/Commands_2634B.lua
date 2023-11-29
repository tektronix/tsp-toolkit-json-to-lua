---@meta

---@class io_object
io_object={}
---@class script_object
script_object={}
---@class eventID

---@class file_object
file_object ={}

---@class bufferMethods
bufferMethods={}
---@class digio
 digio = {}

---@class tsplink
 tsplink = {}

---@class lan
  lan = {}

---@class tspnetConnectionID
 tspnetConnectionID = {}



--- **This KISweep factory script function performs a linear current sweep with voltage measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for voltage measurements, current source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a linear current sweep with voltage measured at every step (point):The linear step size is automatically calculated as follows:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12177.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- SweepILinMeasureV(smua, -1e-3, 1e-3, 0, 100)
--- 
--- --This function performs a 100-point linear current sweep starting at −1 mA and stopping at +1 mA. Voltage is measured at every step (point) in the sweep. Because stime is set for 0 s, voltage is measured as quickly as possible after each current step.
--- ```
---@param starti number Sweep start current in amperes
---@param stopi number Sweep stop current in amperes
---@param stime number Settling time in seconds; occurs after stepping the source and before making a measurement
---@param points number Number of sweep points (must be ≥ 2)
function SweepILinMeasureV(smuX, starti, stopi, stime, points) end


--- **This KISweep factory script function performs a linear voltage sweep with current measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for current measurements, voltage source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a linear voltage sweep with current measured at every step (point):The linear step size is automatically calculated as follows:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12181.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- SweepVLinMeasureI(smua, -1, 1, 1e-3, 1000)
--- 
--- --This function performs a 1000-point linear voltage sweep starting at -1 V and stopping at +1 V. Current is measured at every step (point) in the sweep after a 1 ms source settling period.
--- ```
---@param startv number Sweep start voltage in volts
---@param stopv number Sweep stop voltage in volts
---@param stime number Settling time in seconds; occurs after stepping the source and before making a measurement
---@param points number Number of sweep points (must be ≥ 2)
function SweepVLinMeasureI(smuX, startv, stopv, stime, points) end


--- **This KISweep factory script function performs a logarithmic current sweep with voltage measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for voltage measurements, current source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a logarithmic current sweep with voltage measured at every step (point):The source level at each step (SourceStepLevel) is automatically calculated as follows:For example, for a five-point sweep (points = 5), a measurement is performed at MeasurePoint 1, 2, 3, 4, and 5.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12184.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MeasurePoint
--- 
--- --LogStepSize
--- ```
---@param starti number Sweep start current in amperes
---@param stopi number Sweep stop current in amperes
---@param stime number Settling time in seconds; occurs after stepping the source and before making a measurement
---@param points number Number of sweep points (must be ≥ 2)
function SweepILogMeasureV(smuX, starti, stopi, stime, points) end


--- **This KISweep factory script function performs a current list sweep with voltage measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for voltage measurements, current source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a current list sweep with voltage measured at every step (point):
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12190.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testilist = {-100e-9, 100e-9, -1e-6, 1e-6, -1e-3, 1e-3}
---  
--- SweepIListMeasureV(smua, testilist, 500e-3, 6)
--- 
--- --This function performs a six‑point current list sweep starting at the first point in testilist. Voltage is measured at every step (point) in the sweep. The source is allowed to settle on each step for 500 ms before a measurement is performed.
--- ```
---@param ilist table Arbitrary list of current source values; ilist = {value1, value2, ...valueN}
---@param stime number Settling time in seconds; occurs after stepping the source and before making a measurement
---@param points number Number of sweep points (must be ≥ 2)
function SweepIListMeasureV(smuX, ilist, stime, points) end


--- **This KISweep factory script function performs a logarithmic voltage sweep with current measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for current measurements, voltage source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a logarithmic voltage sweep with current measured at every step (point):The source level at each step (SourceStepLevel) is automatically calculated as follows:For example, for a five-point sweep (points = 5), a measurement is made at MeasurePoint 1, 2, 3, 4, and 5.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12192.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MeasurePoint
--- 
--- --LogStepSize
--- ```
---@param startv number Sweep start voltage in volts
---@param stopv number Sweep stop voltage in volts
---@param stime number Settling time in seconds; occurs after stepping the source and before making a measurement
---@param points number Number of sweep points (must be ≥ 2)
function SweepVLogMeasureI(smuX, startv, stopv, stime, points) end


--- **This KIPulse factory script function performs a specified number of pulse I, measure V cycles.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements, current levels, and timestamps are stored in smua.nvbuffer1.If any parameters are omitted or nil, the operator is prompted to enter them using the front panel.To perform the specified number of pulse I, measure V cycles, this function:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12918.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- PulseIMeasureV(smua, 0.001, 1.0,
---    20e-3, 40e-3, 10)
--- 
--- --SMU A outputs 1 mA and dwells for 40 ms, outputs 1 A and dwells for 20 ms. The voltage measurements occur during each 20 ms dwell period. After the measurement, the output returns to 1 mA and dwells for 40 ms. This pulse‑measure process repeats nine more times.
--- ```
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in amperes
---@param level number Pulse level in amperes
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
function PulseIMeasureV(smu, bias, level, ton, toff, points) end


--- **This KIPulse factory script function performs a specified number of pulse V, measure I cycles.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If any parameters are omitted or nil, the operator is prompted to enter them using the front panel. Data for pulsed current measurements, voltage levels, and timestamps are stored in smuX.nvbuffer1.To perform the specified number of pulse V, measure I cycles, this function:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12923.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.nplc = 0.001
--- PulseVMeasureI(smua, -1, 1, 1E-3, 2E-3, 20)
--- 
--- --SMU A outputs −1 V and dwells for 2 ms, outputs 1 V and dwells for 1 ms. The current measurements occur during each 1 ms dwell period. After the measurement, the output returns to −1 V and dwells for 2 ms. This pulse-measure process repeats 19 more times.
--- ```
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in volts
---@param level number Pulse level in volts
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
function PulseVMeasureI(smu, bias, level, ton, toff, points) end


--- **This KIPulse factory script function configures a current pulse train with a voltage measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a current pulse train with a voltage measurement at each point. Measurements are made at the end of the ton time. This function does not cause the specified smu to output a pulse train. It simply checks to see if all the pulse dimensions can be achieved, and if they are, assigns the indicated tag or index to the pulse train. The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12926.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseIMeasureV(smua, 0, 5, 10, 0.001, 0.080, 1, smua.nvbuffer1, 1)
--- 
--- --Set up a pulse train that uses channel A. The pulse amplitude is 5 A and returns to 0 A after 1 ms. The pulse remains at 0 A for 80 ms and the voltage limit is 10 V during the pulse. The pulse train consists of only 1 pulse, and this pulse is assigned a tag index of 1.
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered 
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string that indicates successful configuration
---@param smu any Instrument channel (for example, smua refers to SMU channel A)
---@param bias any Bias level in amperes
---@param level any Pulse level in amperes
---@param limit any Voltage limit (for example, compliance) in volts
---@param ton any Pulse on time in seconds
---@param toff any Pulse off time in seconds
---@param points any Number of pulse-measure cycles
---@param buffer any Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated
---@param tag any Numeric identifier to be assigned to the defined pulse train
---@param sync_in any Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton
---@param sync_in_timeout any Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s
---@param sync_in_abort any Specifies whether or not to abort the pulse if an input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false
---@overload fun(smu:any,bias:any,level:any,limit:any,ton:any,toff:any,points:any,buffer:any,tag:any):any
---@overload fun(smu:any,bias:any,level:any,limit:any,ton:any,toff:any,points:any,buffer:any,tag:any,sync_in:any):any
---@overload fun(smu:any,bias:any,level:any,limit:any,ton:any,toff:any,points:any,buffer:any,tag:any,sync_in:any,sync_out:any):any
---@overload fun(smu:any,bias:any,level:any,limit:any,ton:any,toff:any,points:any,buffer:any,tag:any,sync_in:any,sync_out:any,sync_in_timeout:any):any
function ConfigPulseIMeasureV(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function initiates the pulse configuration assigned to tag.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function only initiates configured pulse trains assigned to a valid tag. Configure the pulse before initiating it using one of the ConfigurePulse* functions (refer to the Also see section).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12929.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
---  
--- smua.source.rangev = 5
--- smua.source.rangei = 1
--- smua.source.levelv = 0
---  
--- smua.measure.rangev = 5
--- smua.measure.rangei = 1
--- smua.measure.nplc = 0.01
--- smua.measure.autozero = smua.AUTOZERO_ONCE
---  
--- smua.nvbuffer1.clear()
--- smua.nvbuffer1.appendmode = 1
---  
--- smua.source.output = smua.OUTPUT_ON
---  
--- f1, msg1 = ConfigPulseVMeasureI(smua, 0, 5, 1, 0.002, 0.2, 10, smua.nvbuffer1, 1)
---  
--- if f1 == true then
---    f2, msg2 = InitiatePulseTest(1)
---    print("Initiate message:", msg2)
--- else
---    print("Config errors:", msg1)
--- end
--- 
--- --Configure channel A to generate a pulse train. If no errors are encountered, initiate the pulse train. Channel A pulses voltage from a bias level of 0 V to a pulse level of 5 V. The pulse level is present for 2 ms and the bias level for 200 ms, with a 1 A limit setting. A total of 10 pulses is generated, and the measurement data is stored in smua.nvbuffer1. This pulse train is assigned to tag = 1.
--- ```
---@return boolean f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors are encountered
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string that indicates successful configuration
---@param tag number Numeric identifier of the pulse configuration to be initiated
function InitiatePulseTest(tag) end


--- **This KIPulse factory script function initiates the pulse configuration assigned tag1 and tag2.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The pulse trains associated with the indicated tags are generated simultaneously. This is useful when testing devices such as voltage regulators, where the input signal and output load must be applied to the instrument at the same time. When using this function, each tag1 pulse encapsulates each tag2 pulse in time. Specifically, the tag1 pulse transitions from its bias level to its pulse level before the tag2 pulse. Both the tag1 and tag2 pulses return to their respective bias levels at approximately the same time. Measurements for both pulse trains occur at the same time (see the waveform in the figure below).To provide this encapsulation, the following rules are enforced:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12934.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
---  
--- smua.source.rangev = 5
--- smua.source.rangei = 1
--- smua.source.levelv = 0
---  
--- smua.measure.rangev = 5
--- smua.measure.rangei = 1
--- smua.measure.nplc = 0.01
--- smua.measure.autozero = smua.AUTOZERO_ONCE
---  
--- smua.nvbuffer1.clear()
--- smua.nvbuffer1.appendmode = 1
---  
--- smua.source.output = smua.OUTPUT_ON
---  
--- smub.reset()
--- smub.source.func = smub.OUTPUT_DCAMPS
--- smub.source.rangei = 1
--- smub.source.rangev = 5
--- smub.source.leveli = 0
--- smub.measure.rangei = 1
--- smub.measure.rangev = 5
--- smub.measure.nplc = 0.01
--- smub.measure.autozero = smub.AUTOZERO_ONCE
--- smub.nvbuffer1.clear()
--- smub.nvbuffer1.appendmode = 1
--- smub.source.output = smub.OUTPUT_ON
---  
--- f1, msg1 = ConfigPulseVMeasureI(smua, 0, 5, 1, 0.002, 0.2, 10, smua.nvbuffer1, 1)
--- f2, msg2 = ConfigPulseIMeasureV(smub, 0,-1, 5, 0.001, 0.2, 10, smub.nvbuffer1, 2)
--- if (f1 == true) and (f2 == true) then
---    f3, msg3 = InitiatePulseTestDual(1, 2)
---    print("Initiate message:", msg3)
--- else
---    print("Config errors:", msg1, msg2)
--- end
--- 
--- --Set up channels A and B for pulse operation, configure pulse trains for each channel, and then initiate the pulse trains if no errors are encountered.
--- --Channel A pulses voltage from a bias level of 0 V to pulse level of 5 V. The pulse level is present for 2 ms, and the bias level for 200 ms with a 1 A limit setting.
--- --A total of 10 pulses is generated on channel A and the measurement data is stored in smua.nvbuffer1. This pulse train is assigned to tag = 1.
--- --Channel B pulses current from a bias level of 0 A to pulse level of 1 A. The pulse level is present for 1 ms, and the bias level for 200 ms with a 5 V limit setting.
--- --A total of 10 pulses is generated on channel B, and the measurement data is stored in smub.nvbuffer1. This pulse train is assigned to tag = 2.
--- ```
---@return boolean f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered 
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration
---@param tag1 number Numeric identifier of the first pulse configuration to be initiated
---@param tag2 number Numeric identifier of the second pulse configuration to be initiated
function InitiatePulseTestDual(tag1, tag2) end


--- **This KIPulse factory script function configures a linear pulsed current sweep with a voltage measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a linear pulsed current sweep with a voltage measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start amperes; the magnitude of the last pulse is stop amperes. The magnitude of each pulse in between is step amperes larger than the previous pulse, where:step = (stop - start) / (points - 1)This function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12937.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseIMeasureVSweepLin(smua, 0, 0.01, 0.05, 1, 1e-3, 0.1, 20, smua.nvbuffer2, 3)
--- 
--- --Set up a pulsed sweep that uses channel A. The pulsed sweep starts at 10 mA, ends at 50 mA, and returns to a 0 mA bias level between pulses. Each pulsed step is on for 1 ms, and then at the bias level for 100 ms. The voltage limit is 1 V during the entire pulsed sweep. The pulse train is comprised of 20 pulsed steps and the pulse train is assigned a tag index of 3.
--- ```
---@return boolean f A Boolean flag; this flag is true if the pulse was successfully configured, false when errors were encountered
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in amperes
---@param start any Pulse sweep start level in amperes
---@param stop any Pulse sweep stop level in amperes
---@param limit number Voltage limit (for example, compliance) in volts
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
---@param buffer table Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated
---@param tag number Numeric identifier to be assigned to the defined pulse train
---@param sync_in number Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton
---@param sync_in_timeout number Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s
---@param sync_in_abort number Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any,sync_in_timeout:number):string
function ConfigPulseIMeasureVSweepLin(smu, bias, start, stop, limit, ton, toff,points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed current measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a linear pulsed voltage sweep with a current measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start volts; the magnitude of the last pulse is stop volts. The magnitude of each pulse in between is step volts larger than the previous pulse, where:step = (stop - start) / (points - 1)This function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train.The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12940.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseVMeasureISweepLin(smua, 0, 1, 10, 1, 10e-3, 20e-3, 16, smua.nvbuffer1, 4)
--- 
--- --Set up a pulsed sweep that uses channel A. The pulsed sweep starts at 1 V, ends at 10 V, and returns to a 0 V bias level between pulses. Each pulsed step is on for 10 ms, and then at the bias level for 20 ms. 
--- --The current limit is 1 A during the entire pulsed sweep. The pulse train is comprised of 16 pulsed steps, and the pulse train is assigned a tag index of 4.
--- ```
---@return boolean f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered 
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in volts
---@param start any Pulse sweep start level in volts
---@param stop any Pulse sweep stop level in volts
---@param limit number Current limit (for example, compliance) in amperes
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
---@param buffer table Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated
---@param tag number Numeric identifier to be assigned to the defined pulse train
---@param sync_in number Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton
---@param sync_in_timeout number Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s
---@param sync_in_abort number Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any,sync_in_timeout:number):string
function ConfigPulseVMeasureISweepLin(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed current measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a logarithmic pulsed voltage sweep with a current measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start volts; the magnitude of the last pulse is stop volts. The magnitude of each pulse in between is LogStepn volts larger than the previous pulse, where:LogStepSize = (log10(stop) - log10(start)) / (points -1)LogStepn = (n - 1) * (LogStepSize), where n = [2, points]SourceStepLeveln = antilog(LogStepn) * startThis function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12946.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseVMeasureISweepLog(smua, 0, 1, 10, 1, 10e-3, 20e-3, 10, smua.nvbuffer1, 6)
--- 
--- --Set up a pulsed logarithmic sweep that uses SMU channel A. The pulsed sweep starts at 1 V, ends at 10 V, and returns to a 0 V bias level between pulses. Each pulsed step is on for 10 ms, and then at the bias level for 20 ms. 
--- --The current limit is 1 A during the entire pulsed sweep. The pulse train is comprised of 10 pulsed steps, and the pulse train is assigned a tag index of 6.
--- ```
---@return boolean f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in volts
---@param start any Pulse sweep start level in volts
---@param stop any Pulse sweep stop level in volts
---@param limit number Current limit (for example, compliance) in amperes
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
---@param buffer table Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated
---@param tag number Numeric identifier to be assigned to the defined pulse train
---@param sync_in number Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton
---@param sync_in_timeout number Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s
---@param sync_in_abort number Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any,sync_in_timeout:number):string
function ConfigPulseVMeasureISweepLog(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function allows you to inspect the settings of the preconfigured pulse train assigned to tag.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Once a pulse train is configured and assigned to a tag, you can use the QueryPulseConfig() command to inspect the settings of this preconfigured pulse train.This function returns a table that contains the settings associated with the tag input parameter.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12949.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
---  
--- smua.source.rangev = 5
--- smua.source.rangei = 1
--- smua.source.levelv = 0
---  
--- smua.measure.rangev = 5
--- smua.measure.rangei = 1
--- smua.measure.nplc = 0.01
--- smua.measure.autozero = smua.AUTOZERO_ONCE
---  
--- smua.nvbuffer1.clear()
--- smua.nvbuffer1.appendmode = 1
---  
--- smua.source.output = smua.OUTPUT_ON
---  
--- f1, msg1 = ConfigPulseVMeasureI(smua, 0, 5,
---    1, 0.002, 0.2, 10, smua.nvbuffer1, 1)
---  
--- print(QueryPulseConfig(1).tostring())
--- 
--- --Configure channel A to generate a pulse train, query configuration, and then display as a string. Channel A pulses voltage from a bias level of 0 V to a pulse level of 5 V. The pulse level is present for 2 ms, and the bias level for 200 ms with a 1 A limit setting. A total of 10 pulses is generated, and the measurement data is stored in smua.nvbuffer1. This pulse train is assigned to tag = 1.
--- --Output:
--- -->> tag = 1
--- -->> smu = smua
--- -->> func = volts
--- -->> type = pulse
--- -->> bias = 0
--- -->> level = 5
--- -->> limit = 1
--- -->> time on = 0.002
--- -->> time off = 0.2
--- -->> points = 10
--- -->> measure = yes
--- -->> sync_in = 0
--- -->> sync_out = 0
--- -->> sync_in_timeout = 0
--- -->> sync_out_abort = 0
--- -->> { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 }
--- ```
---@param tag number Numeric identifier to be assigned to the defined pulse train
---@return any tbl Returned table
function QueryPulseConfig(tag) end


--- **This KIHighC factory script function performs a current leakage measurement after stepping the output voltage.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to:When measuring leakage current:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12951.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
--- smua.source.levelv = 5
--- smua.source.output = smua.OUTPUT_ON
--- delay(1)
--- imeas = i_leakage_measure(smua, 0, 1, 300e-3, 10e-6, 0.1)
--- 
--- --Enable high-capacitance mode. Charge the capacitor at 5 V for 1 second set by delay(1).
--- -- 
--- --The parameters passed on to the i_leakage_measure() function in this example are:
--- --smu = smua
--- --levelv = 0 V
--- --limiti = 1 A
--- --sourcedelay = 300 ms
--- --measurei = 10 µA range
--- --measuredelay = 100 ms
--- --The levels and delays depend on the value and type of capacitor used.
--- ```
---@return number imeas The measured current
---@param levelv number Voltage level to step to when this function is called
---@param limiti number Current limit setting for the voltage step
---@param sourcedelay number Delay to wait before lowering the current limit for measurement
---@param measurei number Current limit (and measure range); the current limit is lower at this level and because high-capacitance mode is active, the measure range follows
---@param measuredelay number Delay to wait after lowering the current limit before making the measurement
function i_leakage_measure(smuX, levelv, limiti, sourcedelay, measurei, measuredelay) end


--- **This KIHighC factory script function measures the current and compares it to a threshold. This continues until either the measured current drops below the threshold or the timeout expires.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to:When testing the leakage current threshold:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12953.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
--- smua.source.levelv = 5
--- smua.source.output = smua.OUTPUT_ON
--- delay(1)
--- pass = i_leakage_threshold(smua, 0, 1, 300e-3, 10e-6, 100e-3, 1e-6, 1)
--- 
--- --Enable high-capacitance mode.
--- --Charge the capacitor. 
--- -- 
--- --The parameters passed on to the i_threshold_measure() function in this example are:
--- --smu = smua
--- --levelv = 0 V
--- --limiti = 1 A
--- --sourcedelay = 300 ms
--- --measurei = 10 µA range
--- --measuredelay = 100 ms
--- --threshold = 1 µA
--- --timeout = 1 s
--- --The levels and delays depend on the value and type of capacitor used.
--- --Sets pass = true if the current is measured below 1 µA in less than 1 second.
--- ```
---@return boolean f A Boolean flag; this flag is true when the current is below the threshold, false if threshold is not reached before timeout expires
---@param levelv number Voltage level to step to when this function is called
---@param limiti number Current limit setting for the voltage step
---@param sourcedelay number Delay to wait before lowering the current limit for measurement
---@param measurei number Current limit (and measure range); the current limit is lower at this level and because high-capacitance mode is active, the measure range follows
---@param measuredelay number Delay before the first measurement after measure range is changed
---@param threshold number The specified current that establishes the test limit
---@param timeout number Amount of time (in seconds) to wait for the current to drop to threshold after all the delays have occurred
function i_leakage_threshold(smuX, levelv, limiti, sourcedelay, measurei, measuredelay, threshold, timeout) end


--- **This KIParlib factory script function performs a linear voltage sweep and calculates the transconductance (Gm) at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Output data includes transconductance values, reading buffer with measured currents, reading buffer with measured currents and voltages.The gm_vsweep() function performs a linear voltage sweep, measuring voltage and current, and then calculating the transconductance (Gm) at each point using the central difference method. It can return an array of Gm values, a reading buffer with the measured currents, and a reading buffer with the measured voltages.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12955.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- gm_array = gm_vsweep(smua, 0, 5, 20)
---  
--- gm_array, ibuf = gm_vsweep(smua, 0, 5, 20)
---  
---  
--- gm_array, ibuf, vbuf = gm_vsweep(smua, 0, 5, 20)
--- 
--- --SMU A returns Gm values only.
--- -- 
--- --SMU A returns Gm and reading buffer with measured currents.
--- -- 
--- --SMU A returns Gm and reading buffers with measured currents and voltages.
--- ```
---@return any gm_array A Lua table containing the calculated Gm values at each point
---@return any ibuf A reading buffer containing the measured current at each point
---@return any vbuf A reading buffer containing the measured voltage at each point
---@param smu any Instrument channel (for example, smua refers to SMU channel A)
---@param start_v any Starting voltage level of the sweep 
---@param stop_v any Ending voltage level of the sweep 
---@param points any Number of measurements between start_v and stop_v (must be ≥ 2)
function gm_vsweep(smu, start_v, stop_v, points) end


--- **This KIParlib factory script function performs a linear current sweep and calculates the transconductance (Gm) at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Output data includes transconductance values, reading buffer with measured voltages, reading buffer with measured voltages and currents.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.The gm_isweep() function performs a linear current sweep, measuring voltage and current, and then calculating the transconductance (Gm) at each point using the central difference method. It can return an array of Gm values, a reading buffer with the measured voltages, and a reading buffer with the measured currents.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12957.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- gm_array = gm_isweep(smua, 0, 0.01, 20)
---  
---  
--- gm_array, vbuf = gm_isweep(smua, 0, 0.01, 20)
---  
---  
--- gm_array, vbuf, ibuf = gm_isweep(smua, 0,
---    0.01, 20)
--- 
--- --Source‑measure unit (SMU) A returns Gm values only.
--- -- 
--- --SMU A returns Gm and reading buffer with measured voltages.
--- -- 
--- --SMU A returns Gm and reading buffers with measured voltages and currents.
--- ```
---@return any gm_array A Lua table containing the calculated Gm values at each point
---@return number vbuf A reading buffer containing the measured voltage at each point
---@return number ibuf A reading buffer containing the measured current at each point
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param start_i number Starting current level of the sweep 
---@param stop_i number Ending current level of the sweep 
---@param points number Number of measurements between start_i and stop_i (must be ≥2)
function gm_isweep(smu, start_i, stop_i, points) end


--- **This KISavebuffer factory script function saves a specified reading buffer as either a CSV file or an XML file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to save the specified buffer to a USB flash drive.This function only saves to a USB flash drive. You are not required to qualify the path to the USB flash drive, but you can add /usb1/ before the fileName (see Example 2).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/12959.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- savebuffer(smua.nvbuffer1, "csv", "mybuffer.csv")
--- 
--- --Save smua dedicated reading buffer 1 as a CSV file named mybuffer.csv.
--- savebuffer(smua.nvbuffer1, "csv", "/usb1/mybuffer.csv")
--- 
--- --Save smua dedicated reading buffer 1 to an installed USB flash drive as a CSV file named mybuffer.csv.
--- ```
---@param buffer any The reading buffer to save
---@param formatType string A string indicating which file type to use
---@param fileName string The file name of the saved buffer
function savebuffer(buffer, formatType, fileName) end


--- **This function resets commands to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The reset() command in its simplest form resets the entire TSP‑enabled system, including the controlling node and all subordinate nodes.If you want to reset a specific instrument, use either the localnode.reset() or node[X].reset() command. Use the localnode.reset() command for the local instrument. Use the node[X].reset() command to reset an instrument on a subordinate node.You can only reset the entire system using reset(true) if the node is the master. If the node is not the master node, executing this command generates an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/13933.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset(true)
--- 
--- --If the node is the master node, the entire system is reset; if the node is not the master node, an error is generated.
--- ```
---@param system boolean What to reset
---@overload fun()
function reset(system) end


--- **This function sets the real-time clock (sets present time of the system).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the date and time of the instrument based on the time parameter (specified in UTC time). UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/13943.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- systemTime = os.time({year = 2020,
---        month = 3,
---        day = 31,
---        hour = 14,
---        min = 25})
--- settime(systemTime)
--- 
--- --Sets the date and time to Mar 31, 2020 at 2:25 pm.
--- ```
---@param time any The time in seconds since January 1, 1970 UTC
function settime(time) end


--- **This function delays the execution of the commands that follow it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The instrument delays execution of the commands for at least the specified number of seconds and fractional seconds. However, the processing time may cause the instrument to delay 5 μs to 10 μs (typical) more than the requested delay.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/13949.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.beep(0.5, 2400)
--- delay(0.250)
--- beeper.beep(0.5, 2400)
--- 
--- --Emit a double‑beep at 2400 Hz. The sequence is 0.5 s on, 0.25 s off, 0.5 s on.
--- ```
---@param seconds number The number of seconds to delay (0 s to 100 ks)
function delay(seconds) end


--- **This function waits for all previously started overlapped commands to complete.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are two types of instrument commands:The waitcomplete() command suspends the execution of commands until the instrument operations of all previous overlapped commands are finished. This command is not needed for sequential commands.A group number may only be specified when this node is the master node.If no group is specified, the local group is used.If zero (0) is specified for the group, this function waits for all nodes in the system.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/13986.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- waitcomplete()
--- 
--- --Waits for all nodes in the local group.
--- waitcomplete(G)
--- 
--- --Waits for all nodes in group G.
--- waitcomplete(0)
--- 
--- --Waits for all nodes on the TSP-Link network.
--- ```
---@param group any Specifies which TSP-Link group on which to wait
---@overload fun()
function waitcomplete(group) end


--- **This function stops a script that is presently running.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Terminates script execution when called from a script that is being executed.This command does not wait for overlapped commands to complete before terminating script execution. If overlapped commands are required to finish, use the waitcomplete() function before calling exit().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14769.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function exit() end


--- **This function closes the file that is represented by the fileVar variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is equivalent to io.close(fileVar).Note that files are automatically closed when the file descriptors are garbage collected.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14772.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local fileName = "/usb1/myfile.txt"
---  
--- if fs.is_file(fileName) then
--- 	os.remove(fileName)
--- 	print("Removing file")
--- else
--- 	print("Nothing removed")
--- end
---  
--- print("\n*** fileVar:close")
--- do
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1")
--- myfile:close()
--- end
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "r")
--- myfile:close()
--- os.remove(fileName)
--- 
--- --Opens file myfile.txt for writing. If no errors were found while opening, writes Removing file and closes the file.
--- ```
function file_object:close() end


--- **This function writes buffered data to a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The fileVar:write() or io.write() functions buffer data, which may not be written immediately to the USB flash drive. Use fileVar:flush() to flush this data. Using this function removes the need to close a file after writing to it, allowing the file to be left open to write more data. Data may be lost if the file is not closed or flushed before a script ends. If there is going to be a time delay before more data is written to a file, and you want to keep the file open, flush the file after you write to it to prevent loss of data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14786.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local fileName = "/usb1/myfile.txt"
---  
--- if fs.is_file(fileName) then
--- 	os.remove(fileName)
--- 	print("Removing file")
--- else
--- 	print("Nothing removed")
--- end
---  
--- errorqueue.clear()
--- print("\n*** io.read")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1\n")
--- myfile:flush()
--- myfile:close()
--- do
--- fileHandle = io.input(fileName)
--- value = io.read("*a")
--- print(value)
--- end
--- fileHandle:close()
---  
--- print(errorqueue.next())
--- 
--- --Writes data to a USB flash drive.
--- ```
function file_object:flush() end


--- **This function reads data from a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The format parameters may be any of the following:"*n": Returns a number."*a": Returns the whole file, starting at the current position (returns an empty string if the current file position is at the end of the file)."*l": Returns the next line, skipping the end of line; returns nil if the current file position is at the end of file.n: Returns a string with up to n characters; returns an empty string if n is zero; returns nil if the current file position is at the end of file.If no format parameters are provided, the function performs as if the function is passed the value "*l".Any number of format parameters may be passed to this command, each corresponding to a returned data value.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14787.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local fileName = "/usb1/myfile.txt"
---  
--- if fs.is_file(fileName) then
--- 	os.remove(fileName)
--- 	print("Removing file")
--- else
--- 	print("Nothing removed")
--- end
---  
--- print("fileVar:read")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1")
--- myfile:close()
--- do
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "r")
--- contents = myfile:read("*a")
--- print(contents)
--- end
--- myfile:close()
--- os.remove(fileName)
--- 
--- --Reads data from the input file.
--- ```
---@return number data1 First data read from the file
---@return number data2 Second data read from the file
---@param format1 string A string or number indicating the first type of data to be read
---@param format2 string A string or number indicating the second type of data to be read
---@overload fun():number
---@overload fun(format1:string):number
---@overload fun(format1:string,...:any):number
function file_object:read(format1, format2) end


--- **This function sets and gets the present position of a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The whence parameters may be any of the following:"set": Beginning of file"cur": Current position"end": End of fileIf an error is encountered, it is logged to the error queue, and the command returns nil and the error string.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14788.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local fileName = "/usb1/myfile.txt"
---  
--- if fs.is_file(fileName) then
--- 	os.remove(fileName)
--- 	print("Removing file")
--- else
--- 	print("Nothing removed")
--- end
---  
--- errorqueue.clear()
---  
--- print("\n*** fileVar:seek")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1")
--- myfile:close()
--- do
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "r")
--- position = myfile:seek("end", -1)
--- print(position)
--- end
--- myfile:close()
--- os.remove(fileName)
--- 
--- --Get the present position of a file.
--- ```
---@return any position The new file position, measured in bytes from the beginning of the file
---@return string errorMsg A string containing the error message
---@param whence string A string indicating the base against which offset is applied; the default is "cur"
---@param offset number The intended new position, measured in bytes from a base indicated by whence (default is 0)
---@overload fun():string
---@overload fun(whence:string):string
function file_object:seek(whence, offset) end


--- **This function writes data to a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function may buffer data until a flush (fileVar:flush() or io.flush()) or close (fileVar:close() or io.close()) operation is performed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14789.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local fileName = "/usb1/myfile.txt"
---  
--- if fs.is_file(fileName) then
--- 	os.remove(fileName)
--- 	print("Removing file")
--- else
--- 	print("Nothing removed")
--- end
---  
--- errorqueue.clear()
---  
--- print("\n*** fileVar:write")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- do
--- myfile:write("Line 1")
--- end
--- myfile:close()
--- os.remove(fileName)
--- 
--- --Write data to a file.
--- ```
---@param data1 string The first data to write to the file
---@param data2 string The second data to write to the file
---@overload fun(data:any)
---@overload fun(data1:string,...:any)
function file_object:write(data1, data2) end


--- **This function retrieves the local time zone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- See settimezone() for additional details about the time zone format and a description of the fields.timeZone can be in either of the following formats:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15011.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- timezone = gettimezone()
--- 
--- --Reads the value of the local time zone.
--- ```
---@return string timeZone The local time zone of the instrument
function gettimezone() end


--- **This function sets the local time zone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You only need to set the time zone if you use the os.time() and os.date() functions. If only one parameter is given, the same time offset is used throughout the year. If four parameters are given, time is adjusted twice during the year for daylight savings time.offset and dstOffset are strings of the form "[+|-]hh[:mm[:ss]]" that indicate how much time must be added to the local time to get UTC time:The minute, second, +, and − fields are optional.For example, to set the UTC-5 time zone, you specify the string "5", because UTC-5 is 5 hours behind UTC and you must add 5 hours to the local time to determine UTC time. To specify the time zone UTC4, you specify "-4", because UTC4 is 4 hours ahead of UTC and 4 hours must be subtracted from the local time to determine UTC.dstStart and dstEnd are strings of the form "MM.w.dw/hh[:mm[:ss]]" that indicate when daylight savings time begins and ends respectively:The rest of the fields represent the time of day that the change takes effect:The minutes and seconds fields are optional.The week of the month and day of the week fields are not specific dates.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15021.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- settimezone("8", "1", "3.3.0/02", "11.2.0/02")settimezone(offset)
--- 
--- --Sets offset to equal +8 hours, +1 hour for DST, starts on Mar 14 at 2:00 am, ends on Nov 7 at 2:00 am.
--- --Sets local time zone to offset.
--- ```
---@param offset string String representing offset from UTC
---@param dstOffset string String representing the daylight savings offset from UTC
---@param dstStart string String representing when daylight savings time starts
---@param dstEnd string String representing when daylight savings time ends
---@overload fun(offset:string)
function settimezone(offset, dstOffset, dstStart, dstEnd) end


--- **This function creates a function to get the value of an attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful for aliasing attributes to improve execution speed. Calling the function created with makegetter() executes more quickly than accessing the attribute directly.Creating a getter function is only useful if it is going to be called several times. Otherwise, the overhead of creating the getter function outweighs the overhead of accessing the attribute directly.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15041.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- getlevel = makegetter(smua.source, "levelv")
--- v = getlevel()
--- 
--- --Creates a getter function called getlevel.
--- --When getlevel() is called, it returns the value of smua.source.levelv. 
--- ```
---@return function getter The return value
---@param table table Read‑only table where the attribute is located
---@param attributeName string A string representing the name of the attribute
function makegetter(table, attributeName) end


--- **This function creates a function that, when called, sets the value of an attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful for aliasing attributes to improve execution speed. Calling the setter function execute more quickly than accessing the attribute directly.Creating a setter function is only useful if it is going to be called several times. If you are not calling the setter function several times, it is more efficient to access the attribute directly. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15042.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setlevel = makesetter(smua.source, "levelv")for v = 1, 10 do
---    setlevel(v)
--- end
--- 
--- --Creates a setter function called setlevel.
--- --Using setlevel() in the loop sets the value of smua.source.levelv, performing a source sweep.
--- ```
---@return function setter Function that sets the value of the attribute
---@param table table Read-only table where the attribute is located
---@param attributeName string The string name of the attribute
function makesetter(table, attributeName) end


--- **This function returns the present amount of available memory and the total amount of memory in the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns two values:The difference between the two values is the amount presently used.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15050.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(meminfo())
--- 
--- --Retrieve the amount of free and total memory in the instrument.
--- --Output:
--- --2.89840e+04	3.27680e+04
--- ```
---@return number freeMem The amount of free dynamically allocated memory available
---@return number totalMem The total amount of dynamically allocated memory in the instrument
function meminfo() end


--- **This function sets the operation complete status bit when all overlapped commands are completed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the operation complete bit in the Standard Event Status Register to be set when all previously started local overlapped commands are complete. Note that each node independently sets its operation complete bits in its own status model. Any nodes that are not actively performing overlapped commands set their bits immediately. All remaining nodes set their own bits as they complete their own overlapped commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15054.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- opc()
--- waitcomplete()
--- print("1")
--- 
--- --Output:
--- --1
--- ```
function opc() end


--- **This function prints numbers using the configured format.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are multiple ways to use this function, depending on how many numbers are to be printed.This function prints the given numbers using the data format specified by format.data and format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15058.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 2.54
--- printnumber(x)
--- format.asciiprecision = 3
--- printnumber(x, 2.54321, 3.1)
--- 
--- --Configure the ASCII precision to 10 and set x to 2.54.
--- --Read the value of x based on these settings.
--- --Change the ASCII precision to 3.
--- --View how the change affects the output of x and some numbers.
--- --Output:
--- --2.540000000e+00
--- --2.54e+00, 2.54e+00, 3.10e+00
--- ```
---@param value1 number First value to print in the configured format
---@param value2 number Second value to print in the configured format
---@overload fun(value1:number)
---@overload fun(value1:number,...:any)
function printnumber(value1, value2) end


--- **This function generates a response message.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- TSP-enabled instruments do not have inherent query commands. Like other scripting environments, the print() command and other related print() commands generate output. The print() command creates one response message.The output from multiple arguments is separated with a tab character.Numbers are printed using the format.asciiprecision attribute. If you want use Lua formatting, print the return value from the tostring() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17645.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- x = 10
--- print(x)
--- 
--- --Example of an output response message:
--- --10
--- --Note that your output might be different if you set your ASCII precision setting to a different value.
--- x = true
--- print(tostring(x))
--- 
--- --Example of an output response message:
--- --true
--- ```
---@param value1 any The first argument to output
---@param value2 any The second argument to output
---@overload fun(value1:any)
---@overload fun(value1:any,...:any)
function print(value1, value2) end


--- **This KISweep factory script function performs a voltage list sweep with current measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for current measurements, voltage source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a voltage list sweep with current measured at every step (point):
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19138.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- myvlist = {-0.1, 0.1, -1, 1, -6, 6, -40, 40, 0, 0}
--- SweepVListMeasureI(smua, myvlist, 500E-3, 10)
--- 
--- --This function performs a 10‑point voltage list sweep starting at the first point in myvlist. Current is measured at every step (point) in the sweep. The source is allowed to settle on each step for 500 ms before a measurement is performed.
--- ```
---@param vlist table Arbitrary list of voltage source values; vlist = {value1, value2, ... valueN}
---@param stime number Settling time in seconds; occurs after stepping the source and before making a measurement
---@param points number Number of sweep points (must be ≥ 2)
function SweepVListMeasureI(smuX, vlist, stime, points) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a logarithmic pulsed current sweep with a voltage measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start amperes; the magnitude of the last pulse is stop amperes. The magnitude of each pulse in between is LogStepn amperes larger than the previous pulse, where:LogStepSize = (log10(stop) - log10(start)) / (points -1)LogStepn = (n - 1) * (LogStepSize), where n = [2, points]SourceStepLeveln = antilog(LogStepn) * startThis function does not cause the specified smu to output a pulse train. It simply checks to see if all of the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. To initiate a pulse train assigned to a valid tag, use InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29313.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseIMeasureVSweepLog(smua, 0, 1e-3, 0.01, 1, 1e-3, 10e-3, 10,   smua.nvbuffer1, 5)
--- 
--- --Set up a pulsed logarithmic sweep that uses channel A. The pulsed sweep starts at 1 mA, ends at 10 mA, and returns to a 0 A bias level between pulses. Each pulsed step is on for 1 ms, and then at the bias level for 10 ms. The voltage limit is 1 V during the entire pulsed sweep. The pulse train is comprised of 10 pulsed steps, and the pulse train is assigned a tag index of 5.
--- ```
---@return boolean f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered 
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in amperes
---@param start any Pulse sweep start level in amperes
---@param stop any Pulse sweep stop level in amperes
---@param limit number Voltage limit (for example, compliance) in volts
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
---@param buffer table Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated
---@param tag number Numeric identifier to be assigned to the defined pulse train
---@param sync_in number Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton
---@param sync_in_timeout number Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s
---@param sync_in_abort number Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false 
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any):string
---@overload fun(smu:table,bias:number,start:any,stop:any,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any,sync_in_timeout:number):string
function ConfigPulseIMeasureVSweepLog(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed current measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a voltage pulse train with a current measurement at each point. Measurements are made at the end of the ton time. This function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. To initiate a pulse train assigned to a valid tag, use InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) .
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29314.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseVMeasureI(smua, 0, 20, 1, 0.001, 0.080, 10, smua.nvbuffer1, 2)
--- 
--- --Set up a pulse train that uses channel A. The pulse amplitude is 20 V and returns to 0 V after 1 ms. The pulse remains at 0 V for 80 ms, and the current limit is 1 A during the pulse. The pulse train consists of 10 pulses, and the pulse train is assigned a tag index of 2.
--- local timelist = { 1, 2, 3, 4, 5 }
---  
--- f, msg = ConfigPulseVMeasureI(smua, 0, 1,
---    100e-3, 1, timelist, 5, nil, 1)
--- 
--- --Variable off time between pulses in a pulse train.
--- --Configure a pulse with 1 second on-time and variable off-time, no measurement.
--- rbi = smua.makebuffer(10)
--- rbv = smua.makebuffer(10)
--- rbi.appendmode = 1
--- rbv.appendmode = 1
--- rbs = { i = rbi, v = rbv }
---  
--- f, msg = ConfigPulseVMeasureI(smua, 0, 10, 1e-3, 1e-3, 1e-3, 2, rbs, 1)
--- 
--- --Simultaneous IV measurement during pulse.
--- ```
---@return boolean f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered 
---@return string msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration
---@param smu table Instrument channel (for example, smua refers to SMU channel A)
---@param bias number Bias level in volts
---@param level number Pulse level in volts
---@param limit number Current limit (for example, compliance) in amperes
---@param ton number Pulse on time in seconds
---@param toff number Pulse off time in seconds
---@param points number Number of pulse-measure cycles
---@param buffer table Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated
---@param tag number Numeric identifier to be assigned to the defined pulse train
---@param sync_in number Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton
---@param sync_in_timeout number Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s
---@param sync_in_abort number Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false
---@overload fun(smu:table,bias:number,level:number,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number):string
---@overload fun(smu:table,bias:number,level:number,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number):string
---@overload fun(smu:table,bias:number,level:number,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any):string
---@overload fun(smu:table,bias:number,level:number,limit:number,ton:number,toff:number,points:number,buffer:table,tag:number,sync_in:number,sync_out:any,sync_in_timeout:number):string
function ConfigPulseVMeasureI(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This function prints data from tables or reading buffer subtables.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If startIndex ≤ 1, 1 is used as startIndex. If n < endIndex, n is used as endIndex.When any given reading buffers are used in overlapped commands that have not yet completed (at least to the specified index), this function outputs data as it becomes available.When there are outstanding overlapped commands to acquire data, n refers to the index that the last entry in the table has after all the measurements have completed.If you pass a reading buffer instead of a reading buffer subtable, the default subtable for that reading buffer is used.This command generates a single response message that contains all data. The response message is stored in the output queue.The format.data attribute controls the format of the response message.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/80596.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- format.data = format.ASCII
--- format.asciiprecision = 6
--- printbuffer(1, rb1.n, rb1)
--- 
--- --This assumes that rb1 is a valid reading buffer in the runtime environment. The use of rb1.n
--- --(bufferVar.n) indicates that the instrument should output all readings in the reading buffer. In this example, rb1.n equals 10.
--- --Example of output data (rb1.readings):
--- --4.07205e-05, 4.10966e-05, 4.06867e-05, 4.08865e-05, 4.08220e-05, 4.08988e-05, 4.08250e-05, 4.09741e-05, 4.07174e-05, 4.07881e-05
--- ```
---@param startIndex number Beginning index of the buffer to print; this must be more than one and less than endIndex
---@param endPointIndex any Ending index of the buffer to print; this must be more than startIndex and less than the index of the last entry in the tables
---@param bufferVar bufferMethods First table or reading buffer subtable to print
---@param bufferVar2 any Second table or reading buffer subtable to print
---@overload fun(startIndex:number,endPointIndex:any,bufferVar:bufferMethods)
---@overload fun(startIndex:number,endPointIndex:any,bufferVar:bufferMethods,...:any)
function printbuffer(startIndex, endPointIndex, bufferVar, bufferVar2) end
