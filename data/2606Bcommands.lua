---@meta

---@class io_object
io_object={}
---@class script_object
script_object={}
---@class eventID

---@class bufferMethods
bufferMethods ={}

---@class digio
 digio = {}

---@class tsplink
 tsplink = {}

---@class lan
  lan = {}

digio.TRIG_FALLING = 1
digio.TRIG_RISING = 2
digio.TRIG_EITHER = 3
digio.TRIG_SYNCHRONOUSA = 4
digio.TRIG_SYNCHRONOUS = 5
digio.TRIG_SYNCHRONOUSM = 6
digio.TRIG_RISINGA = 7
digio.TRIG_RISINGM = 8

---@alias DigioTriggerMode
---|`digio.TRIG_BYPASS` #Allows direct control of the line.
---|`digio.TRIG_FALLING` #Detects falling edge triggers as input; asserts a TTL-low pulse for output.
---|`digio.TRIG_RISING` #If the programmed state of the line is high, the digio.TRIG_RISING mode behavior is similar to digio.TRIG_RISINGA. If the programmed state of the line is low, the *digio.TRIG_RISING* mode behavior is similar to *digio.TRIG_RISINGM*.
---|`digio.TRIG_EITHER` #Detects rising- or falling edge triggers as input. Asserts a TTLlow pulse for output.
---|`digio.TRIG_SYNCHRONOUSA` #Detects the falling edge input triggers and automatically latches and drives the trigger line low. Asserting the output trigger releases the latched line.
---|`digio.TRIG_SYNCHRONOUS` #Detects the falling edge input triggers and automatically latches and drives the trigger line low. Asserts a TTL low pulse as an output trigger.
---|`digio.TRIG_SYNCHRONOUSM` #Detects rising edge triggers as input. Asserts a TTL low pulse for output.
---|`digio.TRIG_RISINGA` #Detects rising edge triggers as input. Asserts a TTL low pulse for output.
---|`digio.TRIG_RISINGM` #Asserts a TTL-high pulse for output. Input edge detection is not possible in this mode.

tsplink.TRIG_BYPASS = 0
tsplink.TRIG_FALLING = 1
tsplink.TRIG_RISING = 2
tsplink.TRIG_EITHER = 3
tsplink.TRIG_SYNCHRONOUSA = 4
tsplink.TRIG_SYNCHRONOUS = 5
tsplink.TRIG_SYNCHRONOUSM = 6
tsplink.TRIG_RISINGA = 7
tsplink.TRIG_RISINGM = 8

---@alias TspLinkTriggerMode
---|`tsplink.TRIG_BYPASS` #Allows direct control of the line as a digital I/O line.
---|`tsplink.TRIG_FALLING` #Detects falling edge triggers as input. Asserts a TTL-low pulse for output.
---|`tsplink.TRIG_RISING` #If the programmed state of the line is high, the *tsplink.TRIG_RISING* mode behaves similarly to *tsplink.TRIG_RISINGA.*<br>If the programmed state of the line is low, the tsplink.TRIG_RISING mode behaves similarly to *tsplink.TRIG_RISINGM* <br>Use *tsplink.TRIG_RISINGA* if the line is in the high output state.<br>Use *tsplink.TRIG_RISINGM* if the line is in the low output state.
---|`tsplink.TRIG_EITHER` #Detects rising or falling edge triggers as input. Asserts a TTL low pulse for output.
---|`tsplink.TRIG_SYNCHRONOUSA` #Detects the falling edge input triggers and automatically latches and drives the trigger line low.
---|`tsplink.TRIG_SYNCHRONOUS` #Detects the falling edge input triggers and automatically latches and drives the trigger line low. Asserts a TTL-low pulse as an output trigger.
---|`tsplink.TRIG_SYNCHRONOUSM` #Detects rising edge triggers as an input. Asserts a TTL low pulse for output.
---|`tsplink.TRIG_RISINGA` #Detects rising edge triggers as input. Asserts a TTL low pulse for output.
---|`tsplink.TRIG_RISINGM` #Edge detection as an input is not available. Generates a TTL high pulse as an output trigger.

lan.TRIG_EITHER = 0
lan.TRIG_FALLING = 1
lan.TRIG_RISING = 2
lan.TRIG_RISINGA = 3
lan.TRIG_RISINGM = 4
lan.TRIG_SYNCHRONOUS = 5
lan.TRIG_SYNCHRONOUSA = 4
lan.TRIG_SYNCHRONOUSM = 6

---@alias LanTriggerMode
---|`lan.TRIG_EITHER` #Rising or falling edge (positive or negative state)
---|`lan.TRIG_FALLING` #Falling edge (negative state)
---|`lan.TRIG_RISING` #Rising edge (positive state)
---|`lan.TRIG_RISINGA` #Rising edge (positive state)
---|`lan.TRIG_RISINGM` #Rising edge (positive state)
---|`lan.TRIG_SYNCHRONOUS` #Falling edge (negative state)
---|`lan.TRIG_SYNCHRONOUSA` #Falling edge (negative state)
---|`lan.TRIG_SYNCHRONOUSM` #Rising edge (positive state)

lan.TCP = 0
lan.UDP = 1
lan.MULTICAST = 2

---@alias LanTriggerProtocol
---|`lan.TCP` 
---|`lan.UDP` 
---|`lan.MULTICAST` 

display.DIGITS_4_5 = 4
display.DIGITS_5_5 = 5
display.DIGITS_6_5 = 6
---@alias displaysmubdigits
---|`display.DIGITS_4_5` #Select 4½ digit resolution
---|`display.DIGITS_5_5` #Select 5½ digit resolution
---|`display.DIGITS_6_5` #Select 6½ digit resolution

---@alias displaysmuadigits
---|`display.DIGITS_4_5` #Select 4½ digit resolution
---|`display.DIGITS_5_5` #Select 5½ digit resolution
---|`display.DIGITS_6_5` #Select 6½ digit resolution

serial.PARITY_NONE = "none"serial.PARITY_EVEN = "even"serial.PARITY_ODD = "odd"---@alias serialparity
---|`serial.PARITY_NONE` #Select no parity
---|`serial.PARITY_EVEN` #Select even parity
---|`serial.PARITY_ODD` #Select odd parity
serial.FLOW_NONE = "none"serial.FLOW_HARDWARE = "even"---@alias serialflowcontrol
---|`serial.FLOW_NONE` #selects no flow control
---|`serial.FLOW_HARDWARE` #selects hardware flow control
---@class DigioTrigger
local DigioTrigger = {}

---**This function asserts a trigger pulse on one of the digital I/O lines**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The pulse width that is set determines how long the instrument asserts the trigger.
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[2].assert()
--- --Asserts a trigger on digital I/O line 2.
--- ```
---@return nil
DigioTrigger.assert =  function () end

---**This function clears the trigger event on a digital I/O line**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The event detector of a trigger enters the detected state when an event is detected. It is cleared when ```lua digio.trigger[N].wait()``` or ```lua digio.trigger[N].clear()``` is called. ```lua digio.trigger[N].clear()``` clears the event detector of the specified trigger line, discards the history of the trigger line, and clears the ```lua digio.trigger[N].overrun``` attribute.
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[2].clear()
--- --Clears the trigger event detector on I/O line 2.
--- ```
---@return nil
DigioTrigger.clear = function () end

--- **This constant identifies the trigger event generated by the digital I/O line **
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- To have another trigger object respond to trigger events generated by the trigger line, set the stimulus attribute of the other object to the value of this constant.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[5].stimulus = digio.trigger[3].EVENT_ID
---  --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for digital I/O trigger line 5.
--- ```
---@type eventID
DigioTrigger.EVENT_ID = nil

--- **This attribute sets the mode in which the trigger event detector and the output trigger generator operate on the given trigger line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].mode = 2
--- ```
 --- --Sets the trigger mode for I/O line 4 to```lua digio.TRIG_RISING ```
---@type DigioTriggerMode
DigioTrigger.mode = 'digio.TRIG_BYPASS'

--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = digio.trigger[1].overrun
--- print(overrun)
---  --If there is no trigger overrun, the following text is output: false
---@type boolean Trigger overrun state (true or false)
DigioTrigger.overrun = false

 ---**This attribute describes the length of time that the trigger line is asserted for output triggers. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely. To release the trigger line, use digio.trigger[N].release().
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[4].pulsewidth = 20e-6
--- --Sets the pulse width for trigger line 4 to 20 μs.
--- ```
---@type number
DigioTrigger.pulsewidth = 0.0

--- **This function releases an indefinite length or latched trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>Releases a trigger that was asserted with an indefinite pulsewidth time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].release()
---  --Releases digital I/O trigger line 4.
--- ```
---@return nil
DigioTrigger.release = function () end

 ---**This function resets trigger values to their factory defaults. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[3].mode = 2
--- digio.trigger[3].pulsewidth = 50e-6
--- digio.trigger[3].stimulus = digio.trigger[5].EVENT_ID
--- print(digio.trigger[3].mode, digio.trigger[3].pulsewidth, digio.trigger[3].stimulus)
--- digio.trigger[3].reset()
--- print(digio.trigger[3].mode, digio.trigger[3].pulsewidth, digio.trigger[3].stimulus)
--- --Set the digital I/O trigger line 3 for a falling edge with a pulsewidth of 50 µs. Use digital I/O line 5 to trigger the event on line 3. Reset the line back to factory default values. Output before reset: Output after reset:
--- ```
---@return nil
DigioTrigger.reset = function() end

---**This attribute selects the event that causes a trigger to be asserted on the digital output line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to zero (0) to disable the automatic trigger output. <br> Do not use this attribute to generate output triggers under script control. Use ``` lua digio.trigger[N].assert()``` instead.<br>The trigger stimulus for a digital I/O line may be set to one of the existing trigger event IDs described in the following table.
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[3].stimulus = 0
--- --Clear the trigger stimulus of digital I/O line 3. 
--- digio.trigger[3].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID
--- --Set the trigger stimulus of digital I/O line 3 to be the source complete event. 
--- ```
 ---@type eventID | 0
DigioTrigger.stimulus = 0

---**This function waits for a trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This function pauses trigger operation up to the seconds set by timeout for an input trigger. If one or more trigger events are detected since the last time ``` lua digio.trigger[N].wait()``` or ``` luadigio.trigger[N].clear() ``` was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and ready to detect the next trigger. This is true regardless of the number of events detected.
---
--- *Example:*<br>
--- ```lua
--- triggered = digio.trigger[4].wait(3)
--- --Waits up to three seconds for a trigger to be detected on trigger line 4, then outputs the results. 
--- --Output if no trigger is detected: false 
--- --Output if a trigger is detected: true 
--- ```
---@param timeout number timeout in seconds 
---@return boolean triggered `true` if a trigger is detected, `false` if no triggers are detected during the timeout period 
DigioTrigger.wait = function (timeout) end


---@class TspLinkTrigger
local TspLinkTrigger = {}

---**This function simulates the occurrence of the trigger and generates the corresponding event ID. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The set pulse width determines how long the trigger is asserted.
---
--- *Example:*<br>
--- ```lua
--- tsplink.trigger[2].assert()
--- --Asserts trigger on trigger line 2.
--- ```
---@return nil
TspLinkTrigger.assert =  function () end

---**This function clears the event detector for a LAN trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. ``` lua tsplink.trigger[N].clear() ``` clears a trigger event detector, discards the history of the trigger line, and clears the ``` lua tsplink.trigger[N].overrun ``` attribute.---
--- *Example:*<br>
--- ```lua
--- tsplink.trigger[2].clear()
--- --Clears trigger event on synchronization line 2.
--- ```
---@return nil
TspLinkTrigger.clear = function () end

---**This constant identifies the number that is used for the trigger events. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Constant
---
--- *Details:*<br>
--- This number is used by the TSP-Link trigger line when it detects an input trigger. Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to trigger events from this line.---
--- *Example:*<br>
--- ```lua
--- trigger.timer[1].stimulus = tsplink.trigger[2].EVENT_ID
--- --Sets the trigger stimulus of trigger timer 1 to the TSP-Link trigger 2 event.
--- ```
---@type eventID
TspLinkTrigger.EVENT_ID = nil

--- **This attribute defines the trigger operation and detection mode. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].mode = tsplink.TRIG_RISINGM
--- --Sets the trigger mode for synchronization line 3 to ``` lua tsplink.TRIG_RISINGM ``` 
---@type TspLinkTriggerMode
TspLinkTrigger.mode = 'tsplink.TRIG_BYPASS'

--- **This attribute indicates if the event detector ignored an event while in the detected state. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.
---
---<br>*Examples:*<br>
--- ```lua 
--- print(tsplink.trigger[1].overrun)
---  --If an event was ignored, displays true; if an event was not ignored, displays false.
---@type boolean
TspLinkTrigger.overrun = false

 ---**This attribute describes the length of time that the trigger line is asserted for output triggers. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely.
---
--- *Example:*<br>
--- ```lua
--- tsplink.trigger[3].pulsewidth = 20e-6
--- --Sets pulse width for trigger line 3 to 20 μs.
--- ```
---@type number
TspLinkTrigger.pulsewidth = 0.0

--- **This function releases a latched trigger on the given TSP‑Link trigger line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>Releases a trigger that was asserted with an indefinite pulse width. It also releases a trigger that was latched in response to receiving a synchronous mode trigger.
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].release()
---  --Releases trigger line 3.
--- ```
---@return nil
TspLinkTrigger.release = function () end

 ---**This function resets some of the TSP-Link trigger attributes to their factory defaults. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The tsplink.trigger[N].reset() function resets the following attributes to their factory defaults: <br> ``` lua tsplink.trigger[N].mode ``` <br> ``` lua tsplink.trigger[N].stimulus ``` <br> ``` lua tsplink.trigger[N].pulsewidth ``` <br>  This also clears ``` lua tsplink.trigger[N].overrun. ``` ---
--- *Example:*<br>
--- ```lua
--- tsplink.trigger[3].reset()
--- --Resets TSP-Link trigger line 3 attributes back to factory default values.
--- ```
---@return nil
TspLinkTrigger.reset = function() end

---**This attribute specifies the event that causes the synchronization line to assert a trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- To disable automatic trigger assertion on the synchronization line, set this attribute to zero (0). <br> Do not use this attribute when triggering under script control. Use ``` lua tsplink.trigger[N].assert() ``` instead. <br> The eventID parameter may be one of the existing trigger event IDs shown in the following table.
---
--- *Example:*<br>
--- ```lua
--- print(tsplink.trigger[3].stimulus)
--- --Prints the event that starts TSP-Link trigger line 3 action. 
--- ```
 ---@type eventID|0
TspLinkTrigger.stimulus = 0

---**This function waits for a trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This function waits up to the timeout value for an input trigger. If one or more trigger events were detected since the last time ``` lua tsplink.trigger[N].wait() ``` or ``` lua tsplink.trigger[N].clear() ``` was called, this function returns immediately. <br> After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
--- *Example:*<br>
--- ```lua
--- triggered = tsplink.trigger[3].wait(10)
--- print(triggered)
--- --Waits up to 10 seconds for a trigger on TSP-Link® line 3. 
--- --If false is returned, no trigger was detected during the 10-second timeout. 
--- --If true is returned, a trigger was detected. 
--- ```
---@param timeout number timeout in seconds 
---@return boolean triggered `true` if a trigger is detected, `false` if no triggers are detected during the timeout period 
TspLinkTrigger.wait = function (timeout) end


---@class LanTrigger
local LanTrigger = {}
---**This function simulates the occurrence of the trigger and generates the corresponding event ID.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- Generates and sends a LAN trigger packet for the LAN event number specified.
---
--- *Example:*<br>
--- ```lua
--- lan.trigger[5].assert()
--- --Creates a trigger with LAN packet 5.
--- ```
---@return nil
LanTrigger.assert =  function () end

 ---**This function clears the event detector for a LAN trigger.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. This function clears a trigger event detector and discards the history of the trigger packet. <br> This function clears all overruns associated with this LAN trigger.---
--- *Example:*<br>
--- ```lua
--- lan.trigger[5].clear()
--- --Clears the event detector with LAN packet 5.
--- ```
---@return nil
LanTrigger.clear = function () end

 ---**This function prepares the event generator for outgoing trigger events.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This command prepares the event generator to send event messages. For TCP connections, this opens the TCP connection. <br> The event generator automatically disconnects when either the protocol or IP address for this event is changed.---
--- *Example:*<br>
--- ```lua
--- lan.trigger[1].protocol = lan.MULTICAST
--- lan.trigger[1].connect()
--- lan.trigger[1].assert()
--- --Set the protocol for LAN trigger 1 to be multicast when sending LAN triggers. Then, after connecting the LAN trigger, send a message on LAN trigger 1 by asserting it.
--- ```
---@return nil
LanTrigger.connect = function () end

 ---**This attribute stores the LAN event connection state.**
---
--- *Type:* Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute is set to true when the LAN trigger is connected and ready to send trigger events following a successful ``` lua lan.trigger[N].connect()``` command; if the LAN trigger is not ready to send trigger events, this value is false. <br> This attribute is also false when either ``` lua lan.trigger[N].protocol ``` or ``` lua lan.trigger[N].ipaddress ``` attributes are changed or the remote connection closes the connection.---
--- *Example:*<br>
--- ```lua
--- lan.trigger[1].protocol = lan.MULTICAST
--- print(lan.trigger[1].connected)
--- --Outputs true if connected, or false if not connected. Example output: false
--- ```
---@type boolean
LanTrigger.connected = true

 ---**This function disconnects the LAN trigger.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- For TCP connections, this closes the TCP connection. <br> The LAN trigger automatically disconnects when either the ``` lua lan.trigger[N].protocol ``` or  ``` lua lan.trigger[N].ipaddress `` attributes for this event are changed.--- ```
---@return nil
LanTrigger.disconnect = function () end

 ---**This constant is the event identifier used to route the LAN trigger to other subsystems (using stimulus properties).**
---
--- *Type:* Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to incoming LAN trigger packets.---
--- *Example:*<br>
--- ```lua
--- digio.trigger[14].stimulus = lan.trigger[1].EVENT_ID
--- print(lan.trigger[1].connected)
--- --Route occurrences of triggers on LAN trigger 1 to digital I/O trigger 14.
--- ```
---@type eventID
LanTrigger.EVENT_ID = nil

 ---**This attribute specifies the address (in dotted‑decimal format) of UDP or TCP listeners.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Sets the IP address for outgoing trigger events. <br> Set to 0.0.0.0 for multicast. <br> After changing this setting, the ``` lua lan.trigger[N].connect() ``` command must be called before outgoing messages can be sent.---
--- *Example:*<br>
--- ```lua
--- lan.trigger[3].protocol = lan.TCP
--- lan.trigger[3].ipaddress = 192.168.1.100
--- lan.trigger[3].connect()
--- --Set the protocol for LAN trigger 3 to be lan.TCP when sending LAN triggers. <br> Use IP address 192.168.1.100 to connect the LAN trigger.
--- ```
---@type string
LanTrigger.ipaddress = '0.0.0.0'
---**This attribute sets the trigger operation and detection mode of the specified LAN event.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- This command controls how the trigger event detector and the output trigger generator operate on the given trigger. These settings are intended to provide behavior similar to the digital I/O triggers.
---@type LanTriggerMode
LanTrigger.mode = 'lan.TRIG_EITHER'

 ---**This attribute contains the overrun status of the LAN event detector.**
---
--- *Type:* Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred. <br> This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. <br> It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.
---
--- *Example:*<br>
--- ```lua
--- overrun = lan.trigger[5].overrun
--- print(overrun)
--- --Checks the overrun status of a trigger on LAN5 and outputs the value, such as: false
--- ```
---@type boolean
LanTrigger.overrun = false

 ---**This attribute sets the LAN protocol to use for sending trigger messages.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- The LAN trigger listens for trigger messages on all supported protocols, but uses the designated protocol for sending outgoing messages. After changing this setting, ``` lua lan.trigger[N].connect() ``` must be called before outgoing event messages can be sent. <br> When the lan.MULTICAST protocol is selected, the ``` lua lan.trigger[N].ipaddress ``` attribute is ignored and event messages are sent to the multicast address 224.0.23.159. 
---
--- *Example:*<br>
--- ```lua
--- print(lan.trigger[1].protocol)
--- --Get LAN protocol to use for sending trigger messages for LAN event 1.
--- ```
---@type LanTriggerProtocol
LanTrigger.protocol = lan.TCP

 ---**This attribute sets the simulated line state for the LAN trigger.**
---
--- *Type:* Attribute_RW--- This attribute can be set to initialize the pseudo line state to a known value. <br> Setting this attribute does not cause the LAN trigger to generate any events or output packets. 
---
--- *Example:*<br>
--- ```lua
--- print(lan.trigger[1].pseudostate)
--- --Get the present simulated line state for the LAN event 1.
--- ```
--- @type boolean
LanTrigger.pseudostate = false 

 ---**This attribute specifies events that cause this trigger to assert.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. Set triggerStimulus to one of the trigger event IDs, which are shown in the following table. 
---
--- *Example:*<br>
--- ```lua
--- lan.trigger[5].stimulus = trigger.timer[1].EVENT_ID
--- --Use timer 1 trigger event as the source for LAN packet 5 trigger stimulus.
--- ```
 ---@type eventID|0
LanTrigger.stimulus = 0

--- **This function waits for an input trigger.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- If one or more trigger events have been detected since the last time ``` lua lan.trigger[N].wait() ``` or ``` lua lan.trigger[N].clear() ``` was called, this function returns immediately. <br> After waiting for a LAN trigger event with this function, the event detector is automatically reset and rearmed regardless of the number of events detected.
---
--- *Example:*<br>
--- ```lua
--- triggered = lan.trigger[5].wait(3)
--- --Wait for a trigger with LAN packet 5 with a timeout of 3 seconds.
--- ```
---@param timeout number timeout in seconds 
---@return boolean triggered `true` if a trigger is detected, `false` if no triggers are detected during the timeout period 
LanTrigger.wait = function (timeout) end 

---@class TriggerBlender
local TriggerBlender = {}

---**This function clears the blender event detector and resets blender N.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This function sets the blender event detector to the undetected state and resets the event detector's overrun indicator.
---
--- *Example:*<br>
--- ```lua
--- trigger.blender[2].clear()
--- --Clears the event detector for blender 2.
--- ```
---@return nil
TriggerBlender.clear =  function () end

---**This function resets some of the trigger blender settings to their factory defaults.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The trigger.blender[N].reset() function resets the following attributes to their factory defaults:.
---* trigger.blender[N].orenable
---* trigger.blender[N].stimulus[M]
---* It also clears trigger.blender[N].overrun.
---
--- *Example:*<br>
--- ```lua
--- trigger.blender[2].reset()
--- --Resets the trigger blender 1 settings back to factory defaults.
--- ```
---@return nil
TriggerBlender.reset =  function () end

---**This function waits for a blender trigger event to occur.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This function waits for an event blender trigger event
--- If one or more trigger events were detected since the last time trigger.blender[N].wait() or trigger.blender[N].clear() was called, this function returns immediately.
--- After detecting a trigger with this function, the event detector automatically resets and rearms. This is true regardless of the number of events detected.
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[3].mode = digio.TRIG_FALLING
--- digio.trigger[5].mode = digio.TRIG_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
---
--- print(trigger.blender[1].wait(3))
--- --Resets the trigger blender 1 settings back to factory defaults.
--- ```
---@return boolean 
TriggerBlender.wait =  function () end

--- **This constant identifies the trigger event generated by the digital I/O line **
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- To have another trigger object respond to trigger events generated by the trigger line, set the stimulus attribute of the other object to the value of this constant.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[5].stimulus = digio.trigger[3].EVENT_ID
---  --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for digital I/O trigger line 5.
--- ```
---@type eventID
TriggerBlender.EVENT_ID = nil

--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = digio.trigger[1].overrun
--- print(overrun)
---  --If there is no trigger overrun, the following text is output: false
---@type boolean Trigger overrun state (true or false)
TriggerBlender.overrun = false

--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = digio.trigger[1].overrun
--- print(overrun)
---  --If there is no trigger overrun, the following text is output: false
---@type boolean Trigger overrun state (true or false)
TriggerBlender.orenable = false

---**This attribute selects the event that causes a trigger to be asserted on the digital output line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to zero (0) to disable the automatic trigger output. <br> Do not use this attribute to generate output triggers under script control. Use ``` lua digio.trigger[N].assert()``` instead.<br>The trigger stimulus for a digital I/O line may be set to one of the existing trigger event IDs described in the following table.
---
--- *Example:*<br>
--- ```lua
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
--- ```
 ---@type eventID[]|0
TriggerBlender.stimulus = {}
---@class TriggerTimer
local TriggerTimer = {}

---**This function clears the timer event detector and overrun indicator for the specified trigger timer number.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This function sets the timer event detector to the undetected state and resets the overrun indicator.
---
--- *Example:*<br>
--- ```lua
--- trigger.timer[1].clear()
--- --Clears trigger timer 1.
--- ```
---@return nil
TriggerTimer.clear =  function () end

---**This function resets some of the trigger timer settings to their factory defaults.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The trigger.timer[N].reset() function resets the following attributes to their factory defaults:.
---* trigger.timer[N].count
---* trigger.timer[N].delay
---* trigger.timer[N].delaylist
---* trigger.timer[N].passthrough
---* trigger.timer[N].stimulus
---* It also clears trigger.timer[N].overrun.
---
--- *Example:*<br>
--- ```lua
--- trigger.timer[1].reset()
--- --Resets the attributes associated with timer 1 back to factory default values.
--- ```
---@return nil
TriggerTimer.reset =  function () end

---**This function waits for a trigger.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- If one or more trigger events were detected since the last time trigger
--- timer[N].wait() or trigger.timer[N].clear() was called, this function returns immediately.
--- After waiting for a trigger with this function, the event detector is automatically reset and rearmed.
--- This is true regardless of the number of events detected.
---
--- *Example:*<br>
--- ```lua
--- triggered = trigger.timer[3].wait(10)
--- print(triggered)
--- --Waits up to 10 seconds for a trigger on timer 3.If false is returned, no trigger was detected during the 10-second timeout.If true is returned, a trigger was detected.
--- ```
---@return boolean 
TriggerTimer.wait =  function () end

--- **This attribute sets the number of events to generate each time the timer is triggered.--- ```
TriggerTimer.count = 1

--- **This attribute sets and reads the timer delay..--- ```
TriggerTimer.delay = 10e-6

--- **This attribute sets an array of timer intervals.
--- ```
TriggerTimer.delaylist = 10e-6

--- **This constant specifies the trigger timer event number.
--- ```
---@type eventID
TriggerTimer.EVENT_ID = nil

--- **This attribute indicates if an event was ignored because of the event detector state.
---@type boolean Trigger overrun state (true or false)
TriggerTimer.overrun = false

--- **This attribute enables or disables the timer trigger pass‑through mode.
---@type boolean Trigger overrun state (true or false)
TriggerTimer.passthrough = false

--- **This attribute specifies which event starts the timer.
---@type eventID|0
TriggerTimer.stimulus = 0

---@class TriggerGenerator
local TriggerGenerator = {}

---**This function asserts a trigger pulse on one of the digital I/O lines**
---
--- *Type:* Function
---
--- *Details:*<br>
--- The pulse width that is set determines how long the instrument asserts the trigger.
---
--- *Example:*<br>
--- ```lua
--- digio.trigger[2].assert()
--- --Asserts a trigger on digital I/O line 2.
--- ```
---@return nil
TriggerGenerator.assert =  function () end

--- **This function generates a trigger event.
--- ```
TriggerGenerator.EVENT_ID = nil

---
---
---@class beeper
beeper = {}


--- **This command allows you to turn the beeper on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the beeper. When enabled, a beep signals that a front‑panel key has been pressed. Disabling the beeper also disables front‑panel key clicks.
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.enable = beeper.ON
--- beeper.beep(2, 2400)
---  --Enables the beeper and generates a two‑second, 2400 Hz tone. 
--- ```
beeper.enable = 0
---
---
---@class bit
bit = {}
---
---


--- **This attribute sets the state of the append mode of the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the buffer append mode. This value can only be changed with an empty buffer. Use bufferVar.clear() to empty the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.If the append mode is set to 0, any stored readings in the buffer are cleared before new ones are stored. If append mode is set to 1, any stored readings remain in the buffer and new readings are added to the buffer after the stored readings.With append mode on, the first new measurement is stored at rb[n+1], where n is the number of readings stored in buffer rb.
---
---<br>*Examples:*<br>
--- ```lua
--- buffer1.appendmode = 1
---  --Append new readings to contents of the reading buffer named buffer1. 
--- ```
bufferMethods.appendmode= 0


--- **This attribute contains the timestamp that indicates when the first reading was stored in the buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute contains the timestamp (in seconds) of the first reading stored in a buffer (rb[1] stored in reading buffer rb). The timestamp is the number of seconds since 12:00 am January 1, 1970 (UTC) that the measurement was performed and stored.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.See the smuX.nvbufferY attribute for details on accessing dedicated reading buffers.
---
---<br>*Examples:*<br>
--- ```lua
--- basetime = smua.nvbuffer1.basetimestamp
--- print(basetime)
---  --Read the timestamp for the first reading stored in dedicated reading buffer 1. Output: This output indicates that the timestamp is 1,570,200,000 seconds (which is Friday, October 4, 2019 at 14:40:00 pm). 
--- ```
bufferMethods.basetimestamp= 0


--- **This attribute enables or disables the reading buffer cache (on or off).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the reading buffer cache. When enabled, the reading buffer cache improves access speed to reading buffer data. If you run successive operations that overwrite reading buffer data, the reading buffer may return stale cache data. This can happen when initiating successive sweeps without reconfiguring the sweep measurements or when overwriting data in the reading buffer by setting the bufferVar.fillmode attribute to smuX.FILL_WINDOW. To avoid this, make sure that you include commands that automatically invalidate the cache as needed (for example, explicit calls to the bufferVar.clearcache() function) or disable the cache using this attribute (bufferVar.cachemode).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.cachemode = 1
---  --Enables reading buffer cache of dedicated reading buffer 1 (source‑measure unit (SMU) channel A). 
--- ```
bufferMethods.cachemode= 0


--- **This attribute sets the number of readings a buffer can store.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute reads the number of readings that can be stored in the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.The capacity of the buffer does not change as readings fill the buffer. A dedicated reading buffer that only collects basic items can store over 140,000 readings. Turning on additional collection items, such as timestamps and source values, decreases the capacity of a dedicated reading buffer (for example, smua.nvbuffer1), but does not change the capacity of a user-defined dynamically allocated buffer. A user-defined dynamically allocated buffer has a fixed capacity that is set when the buffer is created.See the smuX.nvbufferY attribute for details on accessing dedicated reading buffers. See the smuX.makebuffer() function for information on creating user-defined dynamically allocated reading buffers.
---
---<br>*Examples:*<br>
--- ```lua
--- bufferCapacity = smua.nvbuffer1.capacity
---  
--- print(bufferCapacity)
---  --Reads the capacity of dedicated readingbuffer 1 (source‑measure unit (SMU) channel A). Output: 1.49789e+05 The above output indicates that the buffer can hold 149789 readings. 
--- ```
bufferMethods.capacity= 0


--- **This attribute sets whether or not source values are stored with the readings in the buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the storage of source values. Reading this attribute returns the state of source value collection. This value can only be changed with an empty buffer. Empty the buffer using the bufferVar.clear() function.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.When on, source values are stored with readings in the buffer. This requires four extra bytes of storage for each reading. Turning on additional collection items, such as source values (this attribute) and timestamps, decreases the capacity of a dedicated reading buffer, but does not change the capacity of a user-defined dynamically allocated buffer.You cannot collect source values when smuX.trigger.measure.action is set to smuX.ASYNC, so bufferVar.collectsourcevalues must be set to 0 when the measurement action is set to be asynchronous.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.collectsourcevalues = 1
---  --Include source values with readings for dedicated reading buffer 1. 
--- ```
bufferMethods.collectsourcevalues= 0


--- **This attribute sets whether or not timestamp values are stored with the readings in the buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the storage of timestamps. Reading this attribute returns the state of timestamp collection. For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.When on, timestamp values are stored with readings in the buffer. This requires four extra bytes of storage for each reading. Turning on additional collection items, such as timestamps (this attribute) and source values, decreases the capacity of a dedicated reading buffer (for example, smua.nvbuffer1), but does not change the capacity of a user-defined dynamically allocated buffer.The state variable can only be changed when the buffer is empty. Empty the buffer using the bufferVar.clear() function.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.collecttimestamps = 1
---  --Include timestamps with readings for dedicated reading buffer 1. 
--- ```
bufferMethods.collecttimestamps= 0


--- **This attribute sets the reading buffer fill count.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The reading buffer fill count sets the number of readings to store before restarting at index 1. If the value is zero (0), then the capacity of the buffer is used. Use this attribute to control when the SMU restarts filling the buffer at index 1, rather than having it restart when the buffer is full. If the bufferVar.fillcount attribute is set to a value higher than the capacity of the buffer, after storing the element at the end of the buffer, the SMU overwrites the reading at index 1, the reading after that overwrites the reading at index 2, and so on.This attribute is only used when the bufferVar.fillmode attribute is set to smuX.FILL_WINDOW.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.fillcount = 50
---  --Sets fill count of dedicated reading buffer 1 to 50. 
--- ```
bufferMethods.fillcount= 0

smua.FILL_ONCE = 0
smub.FILL_ONCE = 0
smua.FILL_WINDOW = 1
smub.FILL_WINDOW = 1
---@alias bufferVarfillmode
---|`smua.FILL_ONCE` #Do not overwrite old data
---|`smub.FILL_ONCE` #Do not overwrite old data
---|`smua.FILL_WINDOW` #New readings restart at index 1 after acquiring reading at index bufferVar.fillcount
---|`smub.FILL_WINDOW` #New readings restart at index 1 after acquiring reading at index bufferVar.fillcount


--- **This attribute sets the reading buffer fill mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to smuX.FILL_ONCE, the reading buffer does not overwrite readings. If the buffer fills up, new readings are discarded. When this attribute is set to smuX.FILL_WINDOW, new readings are added after existing data until the buffer holds bufferVar.fillcount elements. Continuing the sequence, the next reading overwrites the reading at index 1, the reading after that overwrites the reading at index 2, and so on. For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.fillmode = smua.FILL_ONCE
---  --Sets fill mode of dedicated reading buffer 1 to fill once (do not overwrite old data). 
--- ```
bufferMethods.fillmode= 0


--- **This attribute contains the measurement function that was used to acquire a reading stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The measurefunctions buffer recall attribute is like an array (a Lua table) of strings indicating the function measured for the reading.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- measurefunction = smua.nvbuffer1.measurefunctions[5]
---  --Store the measure function used to make reading number 5. 
--- ```
---@type integer[]
bufferMethods.measurefunctions= {}


--- **This attribute contains the measurement range values that were used for readings stored in a specified buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The measureranges buffer recall attribute is like an array (a Lua table) of full-scale range values for the measure range used when the measurement was made.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- measurerange = smua.nvbuffer1.measureranges[1]
---  --Store the measure range that was used to make reading number 1. 
--- ```
---@type integer[]
bufferMethods.measureranges= {}


--- **This attribute contains the number of readings in the buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute contains the number of readings presently stored in the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- numberOfReadings = smua.nvbuffer1.n
--- print(numberOfReadings)
---  --Reads the number of readings stored in dedicated reading buffer 1 (source‑measure unit (SMU) channel A). Output: 1.25000+02 The above output indicates that there are 125 readings stored in the buffer. 
--- ```
bufferMethods.n= 0


--- **This attribute contains the readings stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.readings buffer recall attribute is like an array (a Lua table) of the readings stored in the reading buffer. This array holds the same data that is returned when the reading buffer is accessed directly; that is, rb[2] and rb.readings[2] access the same value.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- print(smua.nvbuffer1.readings[1])
---  --Output the first reading saved in source‑measure unit (SMU) channel A, dedicated reading buffer 1. Output: 
--- ```
---@type integer[]
bufferMethods.readings= {}


--- **This attribute contains the source function that was being used when the readings were stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.sourcefunctions buffer recall attribute is like an array (a Lua table) of strings indicating the source function at the time of the measurement.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- sourcefunction = smua.nvbuffer1.sourcefunctions[3]
--- print(sourcefunction)
---  --Store the source function used to make reading number 3 and output the value. 
--- ```
---@type integer[]
bufferMethods.sourcefunctions= {}


--- **This attribute indicates the state of the source output for readings that are stored in a specified buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.sourceoutputstates buffer recall attribute is similar to an array (a Lua table) of strings. This array indicates the state of the source output (Off or On) at the time of the measurement.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- printbuffer(1, 1, smua.nvbuffer1.sourceoutputstates)
---  --Print the source output for the first reading stored in dedicated reading buffer 1. Example output: On 
--- ```
---@type integer[]
bufferMethods.sourceoutputstates= {}


--- **This attribute contains the source range that was used for readings stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.sourceranges buffer recall attribute is like an array (a Lua table) of full-scale range values for the source range used when the measurement was made.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- sourcerange = smua.nvbuffer1.sourceranges[1]
---  --Store the source range that was used for the first reading stored in dedicated reading buffer 1. 
--- ```
---@type integer[]
bufferMethods.sourceranges= {}


--- **When enabled by the bufferVar.collectsourcevalues attribute, this attribute contains the source levels being output when readings in the reading buffer were acquired.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If the bufferVar.collectsourcevalues attribute is enabled before readings are made, the bufferVar.sourcevalues buffer recall attribute is like an array (a Lua table) of the sourced value in effect at the time of the reading.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- sourcevalue = smua.nvbuffer1.sourcevalues[1]
---  
---  --Get the sourced value of the first reading stored in dedicated reading buffer 1. 
--- ```
---@type integer[]
bufferMethods.sourcevalues= {}


--- **This attribute contains the status values of readings in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read‑only buffer recall attribute is like an array (a Lua table) of the status values for all the readings in the buffer. The status values are floating-point numbers that encode the status value; see the following table for values. For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- smua.source.func = smua.OUTPUT_DCVOLTS
--- smua.source.autorangev = smua.AUTORANGE_ON
--- smua.source.levelv = 5 
--- smua.source.limiti = 10e-3
--- smua.measure.rangei = 10e-3
--- smua.source.output = smua.OUTPUT_ON
--- print(smua.measure.i(smua.nvbuffer1))
--- smua.source.output = smua.OUTPUT_OFF
---  
--- print(smua.nvbuffer1.statuses[1])
---  --Reset the instrument. Set the voltage source function to dc volts. Set the range to auto. Set the voltage source to 5 V. Set current measure limit to 10 mA. Set the current measure range to 10 mA. Turn on the output. Print and place the current reading in the reading buffer. Turn off the output. Output status value of the first measurement in the reading buffer.  Output example: 
--- ```
---@type integer[]
bufferMethods.statuses= {}


--- **This attribute contains the resolution of the timestamp.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute sets the resolution for the timestamps. Reading this attribute returns the timestamp resolution value. This value can only be changed with an empty buffer. Empty the buffer using the bufferVar.clear() function.The finest timestamp resolution is 0.000001 seconds (1 μs). At this resolution, the reading buffer can store unique timestamps for up to 71 minutes. You can increase this value for very long tests.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.timestampresolution = 0.000008
---  
---  --Sets the timestamp resolution of dedicated reading buffer 1 to 8 μs. 
--- ```
bufferMethods.timestampresolution= 0


--- **When enabled by the bufferVar.collecttimestamps attribute, this attribute contains the timestamp when each reading saved in the specified reading buffer occurred.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.timestamps information from a reading buffer is only available if the bufferVar.collecttimestamps attribute is set to 1 (default setting). If it is set to 0, you cannot access any time information from a reading buffer. If enabled, this buffer recall attribute is like an array (a Lua table) that contains timestamps, in seconds, of when each reading occurred. These are relative to the bufferVar.basetimestamp for the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- timestamp = smua.nvbuffer1.timestamps[1]
---  
---  --Get the timestamp of the first reading stored in source‑measure unit (SMU) A, buffer 1. 
--- ```
---@type integer[]
bufferMethods.timestamps= {}
---
---
---@class dataqueue
dataqueue = {}


--- **This constant is the maximum number of entries that you can store in the data queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This constant always returns the maximum number of entries that can be stored in the data queue.
---
---<br>*Examples:*<br>
--- ```lua
--- MaxCount = dataqueue.CAPACITY
--- while dataqueue.count < MaxCount do
---    dataqueue.add(1)
--- end
--- print("There are " .. dataqueue.count .. " items in the data queue")
---  --This example fills the data queue until it is full and prints the number of items in the queue. Output: 
--- ```
dataqueue.CAPACITY = 0


--- **This attribute contains the number of items in the data queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The count is updated as entries are added with dataqueue.add() and read from the data queue with dataqueue.next(). It is also updated when the data queue is cleared with dataqueue.clear().A maximum of dataqueue.CAPACITY items can be stored at any one time in the data queue.
---
---<br>*Examples:*<br>
--- ```lua
--- MaxCount = dataqueue.CAPACITY
--- while dataqueue.count < MaxCount do
---    dataqueue.add(1)
--- end
--- print("There are " .. dataqueue.count
---    .. " items in the data queue")
--- dataqueue.clear()
--- print("There are " .. dataqueue.count
---    .. " items in the data queue")
---  --This example fills the data queue and prints the number of items in the queue. It then clears the queue and prints the number of items again. Output: 
--- ```
dataqueue.count = 0
---
---
---
---
---@class display
display = {}


--- **This attribute describes whether or not the EXIT (LOCAL) key on the instrument front panel is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set display.locallockout to display.LOCK to prevent the user from interrupting remote operation by pressing the EXIT (LOCAL) key.Set this attribute to display.UNLOCK to allow the EXIT (LOCAL) key to interrupt script or remote operation.
---
---<br>*Examples:*<br>
--- ```lua
--- display.locallockout = display.LOCK
---  --Disables the front‑panel EXIT (LOCAL) key. 
--- ```
display.locallockout = 0


--- **This attribute controls whether the front panel keys act as a numeric keypad during value entry.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The numeric keypad feature is only available when editing a numeric value at the same time that the EDIT indicator is lit.
---
---<br>*Examples:*<br>
--- ```lua
--- display.numpad = display.ENABLE
---  --Turn on the numeric keypad feature. 
--- ```
display.numpad = 0

display.SMUA = 0
display.SMUB = 1
display.SMUA_SMUB = 2
display.USER = 3
---@alias displayscreen
---|`display.SMUA` #Displays source-measure and compliance f
---|`display.SMUB` #Displays source-measure and compliance f
---|`display.SMUA_SMUB` #Displays source-measure f
---|`display.USER` #Displays the user screen


--- **This attribute contains the selected display screen.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting this attribute selects the display screen for the front panel. This performs the same action as pressing the DISPLAY key on the front panel. The text for the display screen is set by display.settext().Read this attribute to determine which of the available display screens was last selected.
---
---<br>*Examples:*<br>
--- ```lua
--- display.screen = display.SMUA
---  --Selects the source-measure and compliance limit display for SMU A. 
--- ```
---@type displayscreen
display.screen = 0
---
---
---@class errorqueue
errorqueue = {}


--- **This attribute gets the number of entries in the error queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- count = errorqueue.count
--- print(count)
---  --Returns the number of entries in the error queue. The output below indicates that there are four entries in the error queue: 
--- ```
errorqueue.count = 0
---
---
---@class eventlog
eventlog = {}


--- **This attribute returns the number of unread events in the event log.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.count)
---  --Displays the present number of events in the instrument event log. Output looks similar to: 
--- ```
eventlog.count = 0


--- **This attribute enables or disables the event log.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the event log is disabled (eventlog.DISABLE or 0), no new events are added to the event log. You can, however, read and remove existing events.When the event log is enabled, new events are logged.
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.enable)
--- eventlog.enable = eventlog.DISABLE
--- print(eventlog.enable)
---  --Displays the present status of the 2600B event log. Output: 
--- ```
eventlog.enable = 0

eventlog.DISCARD_NEWEST = 0
eventlog.DISCARD_OLDEST = 1
---@alias eventlogoverwritemethod
---|`eventlog.DISCARD_NEWEST` #New entries are not logged
---|`eventlog.DISCARD_OLDEST` #Old entries are deleted as new events are logged


--- **This attribute controls how the event log processes events if the event log is full.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to eventlog.DISCARD_NEWEST, new entries are not logged.When this attribute is set to eventlog.DISCARD_OLDEST, the oldest entry is discarded when a new entry is added.
---
---<br>*Examples:*<br>
--- ```lua
--- eventlog.overwritemethod = 0
---  --When the log is full, the event log ignores new entries. 
--- ```
---@type eventlogoverwritemethod
eventlog.overwritemethod = 0
---
---
---@class fileVar
fileVar = {}
---
---
---@class format
format = {}


--- **This attribute sets the precision (number of digits) for all numbers returned in the ASCII format.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the precision (number of digits) for numeric data printed with the print(), printbuffer(), and printnumber() functions. The format.asciiprecision attribute is only used with the ASCII format. The precision value must be a number from 0 to 16.Note that the precision is the number of significant digits printed. There is always one digit to the left of the decimal point; be sure to include this digit when setting the precision.
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 2.54
--- printnumber(x)
--- format.asciiprecision = 3
--- printnumber(x)
---  --Output: 
--- ```
format.asciiprecision = 0


--- **This attribute sets the binary byte order for the data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the byte order in which data is written when you are printing data values with the printnumber() and printbuffer() functions. The byte order attribute is only used with the format.SREAL, format.REAL, format.REAL32, and format.REAL64 data formats.format.NORMAL, format.BIGENDIAN, and format.NETWORK select the same byte order. format.SWAPPED and format.LITTLEENDIAN select the same byte order. Selecting which to use is a matter of preference.Select the format.SWAPPED or format.LITTLEENDIAN byte order when sending data to a computer with a Microsoft Windows operating system.
---
---<br>*Examples:*<br>
--- ```lua
--- x = 1.23
--- format.data = format.REAL32
--- format.byteorder = format.LITTLEENDIAN
--- printnumber(x)
--- format.byteorder = format.BIGENDIAN
--- printnumber(x)
---  --The output depends on the terminal program you use, but it looks something like: 
--- ```
format.byteorder = 0


--- **This attribute sets the data format for data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The precision of numeric values can be controlled with the format.asciiprecision attribute. The byte order of format.SREAL, format.REAL, format.REAL32, and format.REAL64 can be selected with the format.byteorder attribute.REAL32 and SREAL select the same single precision format. REAL and REAL64 select the same double‑precision format. They are alternative identifiers. Selecting which to use is a matter of preference.The IEEE Std 754 binary formats use four bytes for single‑precision values and eight bytes for double‑precision values.When data is written with any of the binary formats, the response message starts with #0 and ends with a new line. When data is written with the ASCII format, elements are separated with a comma and space.
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 3.14159265
--- format.data = format.ASCII
--- printnumber(x)
--- format.data = format.REAL64
--- printnumber(x)
---  --Output a number represented by x in ASCII using a precision of 10, then output the same number in binary using double‑precision format. Output: 
--- ```
format.data = 0
---
---
---@class fs
fs = {}
---
---
---@class gpib
gpib = {}


--- **This attribute contains the GPIB address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The address can be set to any address value from 1 to 30. However, the address must be unique in the system. It cannot conflict with an address that is assigned to another instrument or to the GPIB controller.A new GPIB address takes effect when the command to change it is processed. If there are response messages in the output queue when this command is processed, they must be read at the new address.If command messages are being queued (sent before this command has executed), the new settings may take effect in the middle of a subsequent command message, so use care when setting this attribute from the GPIB interface.You should allow sufficient time for the command to be processed before attempting to communicate with the instrument again.The reset() function does not affect the GPIB address.
---
---<br>*Examples:*<br>
--- ```lua
--- gpib.address = 26
--- address = gpib.address
--- print(address)
---  --Sets the GPIB address and reads the address. Output: 
--- ```
gpib.address = 0
---
---
---@class io
io = {}
---
---
---
---
---@class localnode
localnode = {}


--- **This attribute enables or disables automatic power line frequency detection at start‑up.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to true, the power line frequency is detected automatically the next time the 2600B powers up. After the power line frequency is automatically detected at power-up, the localnode.linefreq attribute is set automatically to 50 or 60.If the localnode.linefreq attribute is explicitly set, localnode.autolinefreq is automatically set to false.When using this command from a remote node, replace localnode with the node reference, for example node[5].autolinefreq.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
localnode.autolinefreq = 0


--- **This attribute stores a user-defined description and mDNS service name of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores a string that contains a description of the instrument. This value appears on LXI welcome page of the instrument. The value of this attribute is also used as the mDNS service name of the instrument.The factory default value of this attribute is "Keithley Instruments SMU <model number> - <serial number>", where <model number> and <serial number> are replaced with the actual model number and serial number of the instrument. Setting this attribute to an empty string (in other words, setting this attribute to a string of length zero or a string consisting entirely of whitespace characters) reverts the description to the factory default value.When using this command from a remote node, replace localnode with the node reference, for example node[5].description.
---
---<br>*Examples:*<br>
--- ```lua
--- description = "System in Lab 05"
--- localnode.description = description
---  --Set description to System in Lab 05. 
--- ```
localnode.description = 0


--- **This attribute returns the product license agreements.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.license)
---  --Returns the license agreements for the 2600B. 
--- ```
localnode.license = 0


--- **This attribute contains the power line frequency setting that is used for NPLC calculations.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To achieve optimum noise rejection when performing measurements at integer NPLC apertures, set the line frequency attribute to match the frequency (50 Hz or 60 Hz) of the ac power line. When using this command from a remote node, replace localnode with the node reference, for example node[5].linefreq. When this attribute is set, the localnode.autolinefreq attribute is automatically set to false. You can have the instrument automatically detect the ac power line frequency and set this attribute with the line frequency detected when the instrument power is turned on by setting the localnode.autolinefreq attribute to true.
---
---<br>*Examples:*<br>
--- ```lua
--- frequency = localnode.linefreq
---  --Reads line frequency setting. 
--- ```
localnode.linefreq = 0


--- **This attribute stores the model number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
---  --Outputs the model number of the local node. For example: 
--- ```
localnode.model = 0


--- **This attribute stores the remote access password.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This write-only attribute stores the password that is set for any remote interface. When password usage is enabled (localnode.passwordmode), you must supply a password to change the configuration or to control an instrument from a remote command interface.The instrument continues to use the old password for all interactions until the command to change it executes. When changing the password, give the instrument time to execute the command before attempting to use the new password.You cannot retrieve a lost password from any command interface.You can reset the password by resetting the LAN from the front panel or by sending the lan.reset() command.When using this command from a remote node, localnode should be replaced with the node reference, for example, node[5].password.
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.password = "N3wpa55w0rd"
---  --Changes the remote interface password to N3wpa55w0rd. 
--- ```
localnode.password = 0


--- **This attribute stores the password enable mode for remote access to the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls if and where remote access passwords are required. Set this attribute to one of the values below to enable password checking:When using this command from a remote node, replace localnode with the node reference, for example node[5].passwordmode.If you enable password mode, you must also assign a password.
---
---<br>*Examples:*<br>
--- ```lua
--- mode = localnode.PASSWORD_WEB
--- localnode.passwordmode = mode
--- localnode.password = "SMU1234"
---  --Sets value of mode to PASSWORD_WEB. Allows use of passwords on the web interface only. Set the password to SMU1234. 
--- ```
localnode.passwordmode = 0


--- **This attribute determines if the instrument generates prompts in response to command messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the prompting mode is enabled, the instrument generates prompts when the instrument is ready to take another command. Because the prompt is not generated until the previous command completes, enabling prompts provides handshaking with the instrument to prevent buffer overruns.When prompting is enabled, the instrument might generate the following prompts:Commands do not generate prompts. The instrument generates prompts in response to command completion.Prompts are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable prompts when the LAN connection is active, they are not enabled for a subsequent USB connection.
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts = 1
---  --Enable prompting. 
--- ```
localnode.prompts = 0


--- **This attribute enables and disables the generation of prompts for IEEE Std 488.2 common commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is enabled, the IEEE Std 488.2 common commands generate prompts if prompting is enabled with the localnode.prompts attribute. If localnode.prompts4882 is enabled, limit the number of *trg commands sent to a running script to 50 regardless of the setting of the localnode.prompts attribute.When this attribute is disabled, IEEE Std 488.2 common commands do not generate prompts. When using the *trg command with a script that executes trigger.wait() repeatedly, disable prompting to avoid problems associated with the command interface input queue filling.
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts4882 = 0
---  --Disables IEEE Std 488.2 common command prompting. 
--- ```
localnode.prompts4882 = 0


--- **This attribute stores the firmware revision level.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the revision number of the firmware that is presently running in the instrument.When using this command from a remote node, replace localnode with the node reference. For example, node[5].revision.
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.revision)
---  --Outputs the present revision level. Sample output: 1.0.0 
--- ```
localnode.revision = 0


--- **This attribute stores the serial number of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This indicates the instrument serial number.
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext(localnode.serialno)
---  --Clears the instrument display. Places the serial number of the instrument on the top line of its display. 
--- ```
localnode.serialno = 0


--- **This attribute sets whether or not the instrument automatically sends generated errors.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If this attribute is set to 1, the instrument automatically sends any generated errors stored in the error queue, and then clears the queue. Errors are processed after executing a command message (just before issuing a prompt if prompts are enabled).If this attribute is set to 0, errors are left in the error queue and must be explicitly read or cleared.When using this command from a remote node, replace localnode with the node reference, for example, node[5].showerrors.
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.showerrors = 1
---  --Enables sending of generated errors. 
--- ```
localnode.showerrors = 0
---
---
---@class node
node = {}
---
---
---@class os
os = {}
---
---
---@class script
script = {}


--- **This is a reference to the anonymous script.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You can use the script.anonymous script like any other script. Also, you can save the anonymous script as a user script by giving it a name.This script is replaced by loading a script with the loadscript or loadandrunscript commands when they are used without a name. 
---
---<br>*Examples:*<br>
--- ```lua
--- script.anonymous.list()
---  --Displays the content of the anonymous script. 
--- ```
script.anonymous = 0
---
---
---@class scriptVar
scriptVar = {}


--- **This attribute controls the autorun state of a script.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Autorun scripts run automatically when the instrument is turned on. You can set any number of scripts to autorun.The run order for autorun scripts is arbitrary, so make sure the run order is not important.The default value for scriptVar.autorun depends on how the script was loaded. The default is no if the script was loaded with loadscript or script.new(). It is yes for scripts loaded with loadandrunscript or script.newautorun().
---
---<br>*Examples:*<br>
--- ```lua
--- test5.autorun = "yes"
--- test5.save()
---  --Assume a script named test5 is in the runtime environment. The next time the instrument is turned on, test5 script automatically loads and runs. 
--- ```
script_object.autorun = 0


--- **This attribute contains the name of a script in the runtime environment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When setting the script name, this attribute renames the script that the variable scriptVar references.This attribute must be either a valid Lua identifier or the empty string. Changing the name of a script changes the index that is used to access the script in the script.user.scripts table. Setting the attribute to an empty string removes the script from the table completely, and the script becomes an unnamed script.As long as there are variables referencing an unnamed script, the script can be accessed through those variables. When all variables that reference an unnamed script are removed, the script is removed from the runtime environment.If the new name is the same as a name that is already used for another script, the name of the other script is set to an empty string, and that script becomes unnamed. 
---
---<br>*Examples:*<br>
--- ```lua
--- test7 = script.new("display.clear() display.settext('Hello from my test')", "")
--- test7()
--- print(test7.name)
---  
--- test7.name = "test7"
--- print(test7.name)
--- test7.save()
---  --This example calls the script.new() function to create a script with no name, runs the script, names the script test7, and then saves the script in nonvolatile memory. 
--- ```
script_object.name = 0


--- **This attribute contains the source code of a script.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The loadscript or loadandrunscript and endscript keywords are not included in the source code. The body of the script is a single string with lines separated by the new line character.The instrument automatically stores the source for all scripts that are loaded on the instrument. To free up memory or to obfuscate the code, assign nil to the source attribute of the script. Although this attribute is writable, it can only be set to the nil value.
---
---<br>*Examples:*<br>
--- ```lua
--- test7 = script.new("display.clear() display.settext('Hello from my test')", "")
--- print(test7.source)
---  --This example creates a script called test7 that displays a message on the front panel and retrieves the source code. Output: 
--- ```
script_object.source = 0
---
---
---@class serial
serial = {}


--- **This attribute configures the baud rate for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new baud rate setting takes effect when the command to change it is processed.The reset function has no effect on data bits.
---
---<br>*Examples:*<br>
--- ```lua
--- serial.baud = 1200
---  --Sets the baud rate to 1200. 
--- ```
serial.baud = 0


--- **This attribute configures character width (data bits) for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new data width setting takes effect when the command to change it is processed.The reset function has no effect on data bits.
---
---<br>*Examples:*<br>
--- ```lua
--- serial.databits = 8
---  --Sets data width to 8. 
--- ```
serial.databits = 0


--- **This attribute configures flow control for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new flow control setting takes effect when the command to change it is processed.The reset function has no effect on flow control.
---
---<br>*Examples:*<br>
--- ```lua
--- serial.flowcontrol = serial.FLOW_NONE
---  --Sets flow control to none. 
--- ```
---@type serialflowcontrol
serial.flowcontrol = 0


--- **This attribute configures parity for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new parity setting takes effect when the command to change it is processed.The reset function has no effect on parity.
---
---<br>*Examples:*<br>
--- ```lua
--- serial.parity = serial.PARITY_NONE
---  --Sets parity to none. 
--- ```
---@type serialparity
serial.parity = 0
---
---
---@class setup
setup = {}


--- **This attribute specifies which saved setup to recall when the instrument is turned on.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When id = 0, the instrument uses the factory default setup when it is turned on. When id is set to 1 to 5, it uses the setup saved with setup.save().Only setups stored in nonvolatile memory are available (you cannot recall a script from a USB flash drive with this command).To save a script that is used when the instrument is powered on, you can create a configuration script and name it autoexec.
---
---<br>*Examples:*<br>
--- ```lua
--- setup.poweron = 0
---  --Set the instrument to use the factory default setup when power is turned on. 
--- ```
setup.poweron = 0
---
---
---@class smua
smua = {}

smua.SENSE_LOCAL = 0
smua.SENSE_REMOTE = 1
smua.SENSE_CALA = 3
---@alias smuasense
---|`smua.SENSE_LOCAL` #Selects local sense (2-wire)
---|`smua.SENSE_REMOTE` #Selects remote sense (4-wire)
---|`smua.SENSE_CALA` #Selects calibration sense mode


--- **This attribute contains the state of the sense mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Source-measure operations are performed using either 2-wire local sense connections or 4-wire remote sense connections. Writing to this attribute selects the sense mode.The smuX.SENSE_CALA mode is only used for calibration and may only be selected when calibration is enabled.The sense mode can be changed between local and remote while the output is on.The calibration sense mode cannot be selected while the output is on.Resetting the instrument selects the local sense mode.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.sense = smua.SENSE_REMOTE
---  --Selects remote sensing for SMU channel A. 
--- ```
---@type smuasense
smua.sense = 0
---
---
---@class smub
smub = {}

smub.SENSE_LOCAL = 0
smub.SENSE_REMOTE = 1
smub.SENSE_CALA = 3
---@alias smubsense
---|`smub.SENSE_LOCAL` #Selects local sense (2-wire)
---|`smub.SENSE_REMOTE` #Selects remote sense (4-wire)
---|`smub.SENSE_CALA` #Selects calibration sense mode


--- **This attribute contains the state of the sense mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Source-measure operations are performed using either 2-wire local sense connections or 4-wire remote sense connections. Writing to this attribute selects the sense mode.The smuX.SENSE_CALA mode is only used for calibration and may only be selected when calibration is enabled.The sense mode can be changed between local and remote while the output is on.The calibration sense mode cannot be selected while the output is on.Resetting the instrument selects the local sense mode.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.sense = smua.SENSE_REMOTE
---  --Selects remote sensing for SMU channel A. 
--- ```
---@type smubsense
smub.sense = 0
---
---
---@class status
status = {}


--- **This attribute stores the status byte condition register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the status byte, which is returned as a numeric value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred. When an enabled status event occurs, a summary bit is set in this register to indicate the event occurrence.The individual bits of this register have the following meanings:In addition to the above constants, when more than one bit of the register is set, statusByte equals the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---<br>*Examples:*<br>
--- ```lua
--- status.MEASUREMENT_SUMMARY_BIT
--- status.MSB
--- status.SYSTEM_SUMMARY_BIT
--- status.SSB
--- status.ERROR_AVAILABLE
--- status.EAV
--- status.QUESTIONABLE_SUMMARY_BIT
--- status.QSB
--- status.MESSAGE_AVAILABLE
--- status.MAV
--- status.EVENT_SUMMARY_BIT
--- status.ESB
--- status.MASTER_SUMMARY_STATUS
--- status.MSS
--- status.OPERATION_SUMMARY_BIT
--- status.OSB
---  --
--- ```
status.condition = 0


--- **This attribute stores the system node enable register. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to read or write to the system node enable register. Reading the system node enable register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitAssigning a value to this attribute enables one or more status events. When an enabled status event occurs, a summary bit is set in the appropriate system summary register. The register and bit that is set depends on the TSP-Link node number assigned to this instrument.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set the B0 bit of the system node enable register, set status.node_enable = status.MSB.In addition to the above values, nodeEnableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set nodeEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set nodeEnableRegister to 129 (1 + 128).
---
---<br>*Examples:*<br>
--- ```lua
--- status.MEASUREMENT_SUMMARY_BIT
--- status.MSB
--- status.ERROR_AVAILABLE
--- status.EAV
--- status.QUESTIONABLE_SUMMARY_BIT
--- status.QSB
--- status.MESSAGE_AVAILABLE
--- status.MAV
--- status.EVENT_SUMMARY_BIT
--- status.ESB
--- status.MASTER_SUMMARY_STATUS
--- status.MSS
--- status.OPERATION_SUMMARY_BIT
--- status.OSB
---  --
--- ```
status.node_enable = 0


--- **This attribute stores the status node event register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the status node event register, which is returned as a numeric value (reading this register returns a value). The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred.In addition to the above constants, nodeEventRegister can be set to the decimal equivalent of the bits set. When more than one bit of the register is set, nodeEventRegister contains the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---<br>*Examples:*<br>
--- ```lua
--- status.MEASUREMENT_SUMMARY_BIT
--- status.MSB
--- Bit B0 decimal value: 1
--- status.ERROR_AVAILABLE
--- status.EAV
--- status.QUESTIONABLE_SUMMARY_BIT
--- status.QSB
--- status.MESSAGE_AVAILABLE
--- status.MAV
--- status.EVENT_SUMMARY_BIT
--- status.ESB
--- status.MASTER_SUMMARY_STATUS
--- status.MSS
--- status.OPERATION_SUMMARY_BIT
--- status.OSB
---  --
--- ```
status.node_event = 0


--- **This attribute stores the service request (SRQ) enable register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to read or write to the service request enable register. Reading the service request enable register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the service request enable register, set status.request_enable = status.MSB.In addition to the above values, requestSRQEnableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set requestSRQEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set requestSRQEnableRegister to 129 (1 + 128).
---
---<br>*Examples:*<br>
--- ```lua
--- status.MEASUREMENT_SUMMARY_BIT
--- status.MSB
--- status.SYSTEM_SUMMARY_BIT
--- status.SSB
--- status.ERROR_AVAILABLE
--- status.EAV
--- status.QUESTIONABLE_SUMMARY_BIT
--- status.QSB
--- status.MESSAGE_AVAILABLE
--- status.MAV
--- status.EVENT_SUMMARY_BIT
--- status.ESB
--- status.OPERATION_SUMMARY_BIT
--- status.OSB
---  --
--- ```
status.request_enable = 0


--- **This attribute stores the service request (SRQ) event register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the service request event register, which is returned as a numeric value. Reading this register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, requestEventRegister can be set to the decimal equivalent of the bits set. When more than one bit of the register is set, requestEventRegister contains the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---<br>*Examples:*<br>
--- ```lua
--- requestEventRegister = status.request_event
--- print(requestEventRegister)
---  --Reads the status request event register. Sample output: 1.29000e+02 Converting this output (129) to its binary equivalent yields 1000 0001. Therefore, this output indicates that the set bits of the status request event register are presently B0 (MSB) and B7 (OSB). 
--- ```
status.request_event = 0
---
---
---@class timer
timer = {}
---
---
---@class trigger
trigger = {}


--- **This constant contains the command interface trigger event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You can set the stimulus of any trigger object to the value of this constant to have the trigger object respond to command interface trigger events.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = trigger.EVENT_ID
---  --Sets the trigger stimulus of trigger timer 1 to the command interface trigger event. 
--- ```
---@type eventID
trigger.EVENT_ID= nil
---
---
---
---
---@class tspnet
tspnet = {}


--- **This attribute sets the timeout value for the tspnet.connect(), tspnet.execute(), and tspnet.read() commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the amount of time the tspnet.connect(), tspnet.execute(), and tspnet.read() commands wait for a response.The time is specified in seconds. The timeout may be specified to millisecond resolution but is only accurate to the nearest 10 ms.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.timeout = 2.0
---  --Sets the timeout duration to 2 s. 
--- ```
tspnet.timeout = 0
---
---
---@class userstring
userstring = {}
---
---@type DigioTrigger[]
digio.trigger = {}
---
---
---@class display.loadmenu
display.loadmenu = {}
---
---
---@class display.smua
display.smua = {}


--- **This attribute sets the front‑panel display resolution of the selected measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- SMU A and SMU B can be set for different measurement display resolutions.
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.digits = display.DIGITS_5_5
---  --Select 5½ digit resolution for SMU A. 
--- ```
---@type displaysmuadigits
display.smua.digits = 0
---
---
---@class display.smub
display.smub = {}


--- **This attribute sets the front‑panel display resolution of the selected measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- SMU A and SMU B can be set for different measurement display resolutions.
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.digits = display.DIGITS_5_5
---  --Select 5½ digit resolution for SMU A. 
--- ```
---@type displaysmubdigits
display.smub.digits = 0
---
---
---@class display.trigger
display.trigger = {}


--- **This constant is the event ID of the event generated when the front‑panel TRIG key is pressed.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to front-panel trigger key events.None
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
---@type eventID
display.trigger.EVENT_ID= nil


--- **This attribute contains the event detector overrun status.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates if a trigger event was ignored because the event detector was already in the detected state when the TRIG button was pressed.Indicates the overrun state of the event detector built into the display.This attribute does not indicate whether an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = display.trigger.overrun
---  --Sets the variable overrun equal to the present state of the event detector built into the display.  
--- ```
display.trigger.overrun = 0
---
---
---@class lan.config
lan.config = {}

lan.FULL = 1
lan.HALF = 0
---@alias lanconfigduplex
---|`lan.FULL` #Selects full-duplex operation
---|`lan.HALF` #Selects half-duplex operation


--- **This attribute defines the LAN duplex mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute does not indicate the actual setting currently in effect. Use the lan.status.duplex attribute to determine the present operating state of the LAN.
---
---<br>*Examples:*<br>
--- ```lua
--- lan.config.duplex = lan.FULL
---  --Set the LAN duplex mode to full. 
--- ```
---@type lanconfigduplex
lan.config.duplex = 0


--- **This attribute contains the LAN default gateway address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the default gateway IP address to use when manual or DLLA configuration methods are used to configure the LAN. If DHCP is enabled, this setting is ignored.This attribute does not indicate the actual setting that is presently in effect. Use the lan.status.gateway attribute to determine the present operating state of the LAN.The IP address must be formatted in four groups of numbers, each separated by a decimal.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.gateway)
---  --Outputs the default gateway address. For example, you might see the output: 
--- ```
lan.config.gateway = 0


--- **This command specifies the LAN IP address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the LAN IP address to use when the LAN is configured using the manual configuration method. This setting is ignored when DLLA or DHCP is used. This attribute does not indicate the actual setting that is presently in effect. Use the lan.status.ipaddress attribute to determine the present operating state of the LAN.
---
---<br>*Examples:*<br>
--- ```lua
--- ipaddress = lan.config.ipaddress
---  --Retrieves the presently set LAN IP address. 
--- ```
lan.config.ipaddress = 0

lan.AUTO = 0
lan.MANUAL = 1
---@alias lanconfigmethod
---|`lan.AUTO` #Selects automatic sequencing of configuration methods
---|`lan.MANUAL` #Use only manually specified configuration settings


--- **This attribute contains the LAN settings configuration method.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls how the LAN IP address, subnet mask, default gateway address, and DNS server addresses are determined.When method is lan.AUTO, the instrument first attempts to configure the LAN settings using dynamic host configuration protocol (DHCP). If DHCP fails, it tries dynamic link local addressing (DLLA). If DLLA fails, it uses the manually specified settings.When method is lan.MANUAL, only the manually specified settings are used. Neither DHCP nor DLLA are attempted.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.method)
---  --Outputs the present method. For example: 
--- ```
---@type lanconfigmethod
lan.config.method = 0


--- **This attribute contains the LAN speed used when restarting in manual configuration mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the speed that is used if the LAN is restarted for manual configuration operation.This attribute does not indicate the actual setting presently in effect. Use the lan.status.speed attribute to determine the present operating state of the LAN.The LAN speed is measured in megabits per second (Mbps).
---
---<br>*Examples:*<br>
--- ```lua
--- lan.config.speed = 100
---  --Configure LAN speed for 100. 
--- ```
lan.config.speed = 0


--- **This attribute contains the LAN subnet mask.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the LAN subnet mask that is used when the manual configuration method is used to configure the LAN. This setting is ignored when DLLA or DHCP is used.This attribute does not indicate the actual setting presently in effect. Use the lan.status.subnetmask attribute to determine the present operating state of the LAN.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.subnetmask)
---  --Outputs the LAN subnet mask, such as: 
--- ```
lan.config.subnetmask = 0
---
---
---@class lan.status
lan.status = {}

lan.HALF = 0
lan.FULL = 1
---@alias lanstatusduplex
---|`lan.HALF` #half-duplex operation
---|`lan.FULL` #full-duplex operation


--- **This attribute contains the duplex mode presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.duplex)
---  --Outputs the present LAN duplex mode, such as: 
--- ```
---@type lanstatusduplex
lan.status.duplex = 0


--- **This attribute contains the gateway address presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The value of gatewayAddress is a string that indicates the IP address of the gateway in dotted decimal notation.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.gateway)
---  --Outputs the gateway address, such as: 
--- ```
lan.status.gateway = 0


--- **This attribute contains the LAN IP address presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The IP address is a character string that represents the IP address assigned to the instrument.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.ipaddress)
---  --Outputs the LAN IP address currently in use, such as: 
--- ```
lan.status.ipaddress = 0


--- **This attribute contains the LAN MAC address.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The MAC address is a character string representing the MAC address of the instrument in hexadecimal notation. The string includes colons that separate the address octets (see Example).
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.macaddress)
---  --Outputs the MAC address of the instrument, for example: 
--- ```
lan.status.macaddress = 0


--- **This attribute contains the LAN speed.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the transmission speed currently in use by the LAN interface.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.speed)
---  --Outputs the transmission speed of the instrument presently in use, such as: 
--- ```
lan.status.speed = 0


--- **This attribute contains the LAN subnet mask that is presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Use this attribute to determine the present operating state of the LAN. This attribute returns the present LAN subnet mask value if the LAN is manually configured, or when DLLA or DHCP is used.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.subnetmask)
---  --Outputs the subnet mask of the instrument that is presently in use, such as: 
--- ```
lan.status.subnetmask = 0
---
---@type LanTrigger[]
lan.trigger = {}
---
---
---@class script.factory
script.factory = {}
---
---
---@class script.user
script.user = {}
---
---
---@class smua.buffer
smua.buffer = {}
---
---
---@class smub.buffer
smub.buffer = {}
---
---
---@class smua.cal
smua.cal = {}


--- **This attribute stores the date of the last calibration adjustment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the adjustment date associated with the active calibration set. The adjustment date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function.You cannot change the adjustment date without first making a change to the calibration constants.Once you change any calibration constants, you must set the adjustment date before you can save the calibration data to the nonvolatile memory of the SMU.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.adjustdate must be set to the date the adjustment was done using the UTC time and date. The date is stored as the number of seconds since UTC, 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.adjustdate is only accurate to within a few minutes of the value set.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.adjustdate = os.time()
---  --Sets the adjustment date for SMU channel A to the current time set on the instrument. 
--- ```
smua.cal.adjustdate = 0


--- **This attribute stores the calibration date of the active calibration set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration date that is associated with the active calibration set. The calibration date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the instrument was calibrated.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.date must be set to the date the calibration was done using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.date is accurate to within a few minutes of the value set.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.date = os.time()
---  --Sets calibration date for SMU channel A to the present time set on the instrument. 
--- ```
smua.cal.date = 0


--- **This attribute stores the calibration due date for the next calibration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration due date associated with the active calibration set. The calibration due date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the next calibration should be performed.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the due date stored with that set.smuX.cal.due must be set to the date the next calibration is required using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.due is only accurate to within a few minutes of the value set.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.due = os.time() + 365 * 24 * 60 * 60
---  --Sets the SMU channel A calibration due date equal to one year from the present time set on the instrument. 
--- ```
smua.cal.due = 0


--- **This attribute stores the password required to enable calibration.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- A new password can only be assigned when calibration has been unlocked.The calibration password is write-only and cannot be read.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.password = "LetMeIn"
---  --Assigns a new calibration password for SMU channel A. 
--- ```
smua.cal.password = 0

smua.CAL_AUTO = 0
smua.CAL_POSITIVE = 1
smua.CAL_NEGATIVE = 2
---@alias smuacalpolarity
---|`smua.CAL_AUTO` #Automatic polarity detection
---|`smua.CAL_POSITIVE` #Measure with positive polarity calibration constants
---|`smua.CAL_NEGATIVE` #Measure with negative polarity calibration constants


--- **This attribute controls which calibration constants are used for all subsequent measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls which polarity calibration constants are used to make all subsequent measurements.This attribute does not affect the smuX.measure.calibrateY() command. The polarity for smuX.measure.calibrateY() is dictated by the range parameter that is defined for it. The measurement calibration commands require the measurements provided to have been made using the polarity being calibrated.When making measurements for calibration points far away from zero, the desired polarity constants are inherently used. However, when making measurements near zero, it is possible that the instrument could use the calibration constants from the wrong polarity. Setting smuX.cal.polarity to positive or negative forces measurements to be made using the calibration constants for a given polarity, rather than basing the choice on the raw measurement data.This attribute can only be set to positive or negative when calibration is unlocked. This attribute is automatically set to smuX.CAL_AUTO when calibration is locked.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.polarity = smua.CAL_POSITIVE
---  --Selects positive calibration constants for all subsequent measurements on SMU channel A. 
--- ```
---@type smuacalpolarity
smua.cal.polarity = 0

smua.CALSTATE_LOCKED = 0
smua.CALSTATE_CALIBRATING = 1
smua.CALSTATE_UNLOCKED = 2
---@alias smuacalstate
---|`smua.CALSTATE_LOCKED` #Calibration is locked
---|`smua.CALSTATE_CALIBRATING` #The calibration constants 
---|`smua.CALSTATE_UNLOCKED` #Calibration is unlocked but none of the calibration constants 


--- **This attribute returns the present calibration state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute indicates the calibration state of the instrument: Locked, calibrating, or unlocked.
---
---<br>*Examples:*<br>
--- ```lua
--- calstate = smua.cal.state
--- print(calstate)
---  --Reads calibration state for SMU channel A. Output: 0.000000e+00 The above output indicates that calibration is locked. 
--- ```
---@type smuacalstate
smua.cal.state = 0
---
---
---@class smub.cal
smub.cal = {}


--- **This attribute stores the date of the last calibration adjustment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the adjustment date associated with the active calibration set. The adjustment date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function.You cannot change the adjustment date without first making a change to the calibration constants.Once you change any calibration constants, you must set the adjustment date before you can save the calibration data to the nonvolatile memory of the SMU.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.adjustdate must be set to the date the adjustment was done using the UTC time and date. The date is stored as the number of seconds since UTC, 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.adjustdate is only accurate to within a few minutes of the value set.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.adjustdate = os.time()
---  --Sets the adjustment date for SMU channel A to the current time set on the instrument. 
--- ```
smub.cal.adjustdate = 0


--- **This attribute stores the calibration date of the active calibration set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration date that is associated with the active calibration set. The calibration date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the instrument was calibrated.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.date must be set to the date the calibration was done using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.date is accurate to within a few minutes of the value set.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.date = os.time()
---  --Sets calibration date for SMU channel A to the present time set on the instrument. 
--- ```
smub.cal.date = 0


--- **This attribute stores the calibration due date for the next calibration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration due date associated with the active calibration set. The calibration due date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the next calibration should be performed.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the due date stored with that set.smuX.cal.due must be set to the date the next calibration is required using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.due is only accurate to within a few minutes of the value set.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.due = os.time() + 365 * 24 * 60 * 60
---  --Sets the SMU channel A calibration due date equal to one year from the present time set on the instrument. 
--- ```
smub.cal.due = 0


--- **This attribute stores the password required to enable calibration.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- A new password can only be assigned when calibration has been unlocked.The calibration password is write-only and cannot be read.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.password = "LetMeIn"
---  --Assigns a new calibration password for SMU channel A. 
--- ```
smub.cal.password = 0

smub.CAL_AUTO = 0
smub.CAL_POSITIVE = 1
smub.CAL_NEGATIVE = 2
---@alias smubcalpolarity
---|`smub.CAL_AUTO` #Automatic polarity detection
---|`smub.CAL_POSITIVE` #Measure with positive polarity calibration constants
---|`smub.CAL_NEGATIVE` #Measure with negative polarity calibration constants


--- **This attribute controls which calibration constants are used for all subsequent measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls which polarity calibration constants are used to make all subsequent measurements.This attribute does not affect the smuX.measure.calibrateY() command. The polarity for smuX.measure.calibrateY() is dictated by the range parameter that is defined for it. The measurement calibration commands require the measurements provided to have been made using the polarity being calibrated.When making measurements for calibration points far away from zero, the desired polarity constants are inherently used. However, when making measurements near zero, it is possible that the instrument could use the calibration constants from the wrong polarity. Setting smuX.cal.polarity to positive or negative forces measurements to be made using the calibration constants for a given polarity, rather than basing the choice on the raw measurement data.This attribute can only be set to positive or negative when calibration is unlocked. This attribute is automatically set to smuX.CAL_AUTO when calibration is locked.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.polarity = smua.CAL_POSITIVE
---  --Selects positive calibration constants for all subsequent measurements on SMU channel A. 
--- ```
---@type smubcalpolarity
smub.cal.polarity = 0

smub.CALSTATE_LOCKED = 0
smub.CALSTATE_CALIBRATING = 1
smub.CALSTATE_UNLOCKED = 2
---@alias smubcalstate
---|`smub.CALSTATE_LOCKED` #Calibration is locked
---|`smub.CALSTATE_CALIBRATING` #The calibration constants 
---|`smub.CALSTATE_UNLOCKED` #Calibration is unlocked but none of the calibration constants 


--- **This attribute returns the present calibration state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute indicates the calibration state of the instrument: Locked, calibrating, or unlocked.
---
---<br>*Examples:*<br>
--- ```lua
--- calstate = smua.cal.state
--- print(calstate)
---  --Reads calibration state for SMU channel A. Output: 0.000000e+00 The above output indicates that calibration is locked. 
--- ```
---@type smubcalstate
smub.cal.state = 0
---
---
---@class smua.contact
smua.contact = {}

smua.CONTACT_FAST = 0
smua.CONTACT_MEDIUM = 1
smua.CONTACT_SLOW = 2
---@alias smuacontactspeed
---|`smua.CONTACT_FAST` #
---|`smua.CONTACT_MEDIUM` #
---|`smua.CONTACT_SLOW` #


--- **This attribute stores the speed setting for contact check measurements. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting controls the aperture of measurements made for contact check. It does not affect the smuX.measure.nplc aperture setting.The speed setting can have a dramatic effect on the accuracy of the measurement (see specifications).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.speed = smua.CONTACT_SLOW
---  --Configure contact check for higher accuracy on SMU channel A. 
--- ```
---@type smuacontactspeed
smua.contact.speed = 0


--- **This attribute stores the resistance threshold for the smuX.contact.check() function. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the threshold to less than 1 kΩ.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.threshold = 5
---  --Set the contact check threshold for SMU channel A to 5 Ω. 
--- ```
smua.contact.threshold = 0
---
---
---@class smub.contact
smub.contact = {}

smub.CONTACT_FAST = 0
smub.CONTACT_MEDIUM = 1
smub.CONTACT_SLOW = 2
---@alias smubcontactspeed
---|`smub.CONTACT_FAST` #
---|`smub.CONTACT_MEDIUM` #
---|`smub.CONTACT_SLOW` #


--- **This attribute stores the speed setting for contact check measurements. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting controls the aperture of measurements made for contact check. It does not affect the smuX.measure.nplc aperture setting.The speed setting can have a dramatic effect on the accuracy of the measurement (see specifications).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.speed = smua.CONTACT_SLOW
---  --Configure contact check for higher accuracy on SMU channel A. 
--- ```
---@type smubcontactspeed
smub.contact.speed = 0


--- **This attribute stores the resistance threshold for the smuX.contact.check() function. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the threshold to less than 1 kΩ.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.threshold = 5
---  --Set the contact check threshold for SMU channel A to 5 Ω. 
--- ```
smub.contact.threshold = 0
---
---
---@class smua.measure
smua.measure = {}


--- **This attribute controls the use of an analog filter when measuring on the lowest current ranges (2634B, 2635B, and 2636B only).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute engages an approximately 1 Hz analog filter across the current range elements.The analog filter is only active when using the 1 nA and 100 pA measurement ranges.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.analogfilter = 0
---  --Turns off the SMU channel A analog filter. 
--- ```
smua.measure.analogfilter = 0

smua.AUTORANGE_OFF = 0
smua.AUTORANGE_ON = 1
smua.AUTORANGE_FOLLOW_LIMIT = 2
---@alias smuameasureautorangev
---|`smua.AUTORANGE_OFF` #Disabled
---|`smua.AUTORANGE_ON` #Enabled
---|`smua.AUTORANGE_FOLLOW_LIMIT` #Measure range automatically set to the limit range


--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
---  --Enables voltage measurement autoranging for SMU channel A. 
--- ```
---@type smuameasureautorangev
smua.measure.autorangev = 0

smua.AUTORANGE_OFF = 0
smua.AUTORANGE_ON = 1
smua.AUTORANGE_FOLLOW_LIMIT = 2
---@alias smuameasureautorangei
---|`smua.AUTORANGE_OFF` #Disabled
---|`smua.AUTORANGE_ON` #Enabled
---|`smua.AUTORANGE_FOLLOW_LIMIT` #Measure range automatically set to the limit range


--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
---  --Enables voltage measurement autoranging for SMU channel A. 
--- ```
---@type smuameasureautorangei
smua.measure.autorangei = 0

smua.AUTOZERO_OFF = 0
smua.AUTOZERO_ONCE = 1
smua.AUTOZERO_AUTO = 2
---@alias smuameasureautozero
---|`smua.AUTOZERO_OFF` #Autozero disabled
---|`smua.AUTOZERO_ONCE` #Perf
---|`smua.AUTOZERO_AUTO` #Automatic checking of reference and zero measurements; an autozero is perf


--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The analog-to-digital converter (ADC) uses a ratiometric A/D conversion technique. To ensure the accuracy of readings, the instrument must periodically obtain new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture being used for measurements. The 2600B uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made. If the reference measurements have expired when a signal measurement is made, the instrument automatically takes two more A/D conversions, one for the reference and one for the zero, before returning the result. Thus, occasionally, a measurement takes more time than normal.This additional time can cause problems in sweeps and other test sequences in which measurement timing is critical. To avoid the time that is needed for the reference measurements in these situations, you can use the smuX.measure.autozero attribute to disable the automatic reference measurements.Disabling automatic reference measurements may allow the instrument to gradually drift out of specification. To minimize the drift, make a reference and zero measurement immediately before any critical test sequences. You can use the smuX.AUTOZERO_ONCE setting to force a refresh of the reference and zero measurements that are used for the present aperture setting.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autozero = smua.AUTOZERO_ONCE
---  --Performs autozero once for SMU channel A. 
--- ```
---@type smuameasureautozero
smua.measure.autozero = 0


--- **This attribute sets the number of measurements made when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the number of measurements made any time a measurement is requested. When using a reading buffer with a measure command, this attribute also controls the number of readings to be stored.If the count is set to a value greater than 1, any measurement delay set by smuX.measure.delay only occurs before the first measurement, while the smuX.measure.interval controls the interval between successive measurements.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
---  --Sets the SMU channel A measure count to 10. 
--- ```
smua.measure.count = 0

smua.DELAY_OFF = 0
smua.DELAY_AUTO = -1
---@alias smuameasuredelay
---|`smua.DELAY_OFF` #No delay
---|`smua.DELAY_AUTO` #Automatic delay value


--- **This attribute controls the measurement delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) before making a measurement. If you define the value instead of using the automatic delay value, the delay you set is used regardless of the range.The smuX.DELAY_AUTO setting causes a current range-dependent delay to be inserted when a current measurement is requested. This happens when a current measurement command is executed, when the measure action is being performed in a sweep, or after changing ranges during an autoranged measurement.If smuX.measure.count is greater than 1, the measurement delay is only inserted before the first measurement.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delay = 0.010
---  --Sets a 10 ms measurement delay for SMU channel A. 
--- ```
---@type smuameasuredelay
smua.measure.delay = 0


--- **This attribute stores a multiplier to the delays that are used when smuX.measure.delay is set to smuX.DELAY_AUTO.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The delay factor is only applied when smuX.measure.delay = smuX.DELAY_AUTO.This attribute can be set to a value less than 1 (for example, 0.5) to decrease the automatic delay.This attribute can be set to a value greater than 1 (for example, 1.5 or 2.0) to increase the automatic delay.Setting this attribute to zero disables delays when smuX.measure.delay = smuX.DELAY_AUTO.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delayfactor = 2.0
---  --Doubles the measure delay for SMU channel A. 
--- ```
smua.measure.delayfactor = 0


--- **This attribute contains a delay multiplier that is only used during range changes when the high-capacitance mode is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This delay multiplier is only active when the high-capacitance mode is active.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.highcrangedelayfactor = 5
---  --Increases the delay used during range changes for SMU channel A by a factor of 5. 
--- ```
smua.measure.highcrangedelayfactor = 0


--- **This attribute sets the interval between multiple measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the time interval between measurements when smuX.measure.count is set to a value greater than 1. The SMU attempts to start each measurement when scheduled. If the SMU cannot keep up with the interval setting, measurements are made as quickly as possible.If filtered measurements are being made, the time interval is from the start of the first measurement for the filtered reading to the first measurement for a subsequent filtered reading. Extra measurements made to satisfy a filtered reading are not paced by this interval.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.interval = 0.5
---  --Sets the measure interval for SMU channel A to 0.5 s. 
--- ```
smua.measure.interval = 0


--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
---  --Sets voltage low range for SMU channel A to 1 V. 
--- ```
smua.measure.lowrangev = 0


--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
---  --Sets voltage low range for SMU channel A to 1 V. 
--- ```
smua.measure.lowrangei = 0


--- **This command sets the integration aperture for measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the integration aperture for the analog‑to‑digital converter (ADC).The integration aperture is based on the number of power line cycles (NPLC), where 1 PLC for 60 Hz is 16.67 ms (1/60) and 1 PLC for 50 Hz is 20 ms (1/50).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.nplc = 0.5
---  --Sets the integration time for SMU channel A to 0.5. 
--- ```
smua.measure.nplc = 0


--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
---  --Selects the 1 V measurement range for SMU channel A. 
--- ```
smua.measure.rangev = 0


--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
---  --Selects the 1 V measurement range for SMU channel A. 
--- ```
smua.measure.rangei = 0
---
---
---@class smub.measure
smub.measure = {}


--- **This attribute controls the use of an analog filter when measuring on the lowest current ranges (2634B, 2635B, and 2636B only).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute engages an approximately 1 Hz analog filter across the current range elements.The analog filter is only active when using the 1 nA and 100 pA measurement ranges.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.analogfilter = 0
---  --Turns off the SMU channel A analog filter. 
--- ```
smub.measure.analogfilter = 0

smub.AUTORANGE_OFF = 0
smub.AUTORANGE_ON = 1
smub.AUTORANGE_FOLLOW_LIMIT = 2
---@alias smubmeasureautorangev
---|`smub.AUTORANGE_OFF` #Disabled
---|`smub.AUTORANGE_ON` #Enabled
---|`smub.AUTORANGE_FOLLOW_LIMIT` #Measure range automatically set to the limit range


--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
---  --Enables voltage measurement autoranging for SMU channel A. 
--- ```
---@type smubmeasureautorangev
smub.measure.autorangev = 0

smub.AUTORANGE_OFF = 0
smub.AUTORANGE_ON = 1
smub.AUTORANGE_FOLLOW_LIMIT = 2
---@alias smubmeasureautorangei
---|`smub.AUTORANGE_OFF` #Disabled
---|`smub.AUTORANGE_ON` #Enabled
---|`smub.AUTORANGE_FOLLOW_LIMIT` #Measure range automatically set to the limit range


--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
---  --Enables voltage measurement autoranging for SMU channel A. 
--- ```
---@type smubmeasureautorangei
smub.measure.autorangei = 0

smub.AUTOZERO_OFF = 0
smub.AUTOZERO_ONCE = 1
smub.AUTOZERO_AUTO = 2
---@alias smubmeasureautozero
---|`smub.AUTOZERO_OFF` #Autozero disabled
---|`smub.AUTOZERO_ONCE` #Perf
---|`smub.AUTOZERO_AUTO` #Automatic checking of reference and zero measurements; an autozero is perf


--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The analog-to-digital converter (ADC) uses a ratiometric A/D conversion technique. To ensure the accuracy of readings, the instrument must periodically obtain new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture being used for measurements. The 2600B uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made. If the reference measurements have expired when a signal measurement is made, the instrument automatically takes two more A/D conversions, one for the reference and one for the zero, before returning the result. Thus, occasionally, a measurement takes more time than normal.This additional time can cause problems in sweeps and other test sequences in which measurement timing is critical. To avoid the time that is needed for the reference measurements in these situations, you can use the smuX.measure.autozero attribute to disable the automatic reference measurements.Disabling automatic reference measurements may allow the instrument to gradually drift out of specification. To minimize the drift, make a reference and zero measurement immediately before any critical test sequences. You can use the smuX.AUTOZERO_ONCE setting to force a refresh of the reference and zero measurements that are used for the present aperture setting.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autozero = smua.AUTOZERO_ONCE
---  --Performs autozero once for SMU channel A. 
--- ```
---@type smubmeasureautozero
smub.measure.autozero = 0


--- **This attribute sets the number of measurements made when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the number of measurements made any time a measurement is requested. When using a reading buffer with a measure command, this attribute also controls the number of readings to be stored.If the count is set to a value greater than 1, any measurement delay set by smuX.measure.delay only occurs before the first measurement, while the smuX.measure.interval controls the interval between successive measurements.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
---  --Sets the SMU channel A measure count to 10. 
--- ```
smub.measure.count = 0

smub.DELAY_OFF = 0
smub.DELAY_AUTO = -1
---@alias smubmeasuredelay
---|`smub.DELAY_OFF` #No delay
---|`smub.DELAY_AUTO` #Automatic delay value


--- **This attribute controls the measurement delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) before making a measurement. If you define the value instead of using the automatic delay value, the delay you set is used regardless of the range.The smuX.DELAY_AUTO setting causes a current range-dependent delay to be inserted when a current measurement is requested. This happens when a current measurement command is executed, when the measure action is being performed in a sweep, or after changing ranges during an autoranged measurement.If smuX.measure.count is greater than 1, the measurement delay is only inserted before the first measurement.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delay = 0.010
---  --Sets a 10 ms measurement delay for SMU channel A. 
--- ```
---@type smubmeasuredelay
smub.measure.delay = 0


--- **This attribute stores a multiplier to the delays that are used when smuX.measure.delay is set to smuX.DELAY_AUTO.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The delay factor is only applied when smuX.measure.delay = smuX.DELAY_AUTO.This attribute can be set to a value less than 1 (for example, 0.5) to decrease the automatic delay.This attribute can be set to a value greater than 1 (for example, 1.5 or 2.0) to increase the automatic delay.Setting this attribute to zero disables delays when smuX.measure.delay = smuX.DELAY_AUTO.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delayfactor = 2.0
---  --Doubles the measure delay for SMU channel A. 
--- ```
smub.measure.delayfactor = 0


--- **This attribute contains a delay multiplier that is only used during range changes when the high-capacitance mode is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This delay multiplier is only active when the high-capacitance mode is active.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.highcrangedelayfactor = 5
---  --Increases the delay used during range changes for SMU channel A by a factor of 5. 
--- ```
smub.measure.highcrangedelayfactor = 0


--- **This attribute sets the interval between multiple measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the time interval between measurements when smuX.measure.count is set to a value greater than 1. The SMU attempts to start each measurement when scheduled. If the SMU cannot keep up with the interval setting, measurements are made as quickly as possible.If filtered measurements are being made, the time interval is from the start of the first measurement for the filtered reading to the first measurement for a subsequent filtered reading. Extra measurements made to satisfy a filtered reading are not paced by this interval.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.interval = 0.5
---  --Sets the measure interval for SMU channel A to 0.5 s. 
--- ```
smub.measure.interval = 0


--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
---  --Sets voltage low range for SMU channel A to 1 V. 
--- ```
smub.measure.lowrangev = 0


--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
---  --Sets voltage low range for SMU channel A to 1 V. 
--- ```
smub.measure.lowrangei = 0


--- **This command sets the integration aperture for measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the integration aperture for the analog‑to‑digital converter (ADC).The integration aperture is based on the number of power line cycles (NPLC), where 1 PLC for 60 Hz is 16.67 ms (1/60) and 1 PLC for 50 Hz is 20 ms (1/50).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.nplc = 0.5
---  --Sets the integration time for SMU channel A to 0.5. 
--- ```
smub.measure.nplc = 0


--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
---  --Selects the 1 V measurement range for SMU channel A. 
--- ```
smub.measure.rangev = 0


--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
---  --Selects the 1 V measurement range for SMU channel A. 
--- ```
smub.measure.rangei = 0
---
---
---@class smua.source
smua.source = {}

smua.AUTORANGE_OFF = 0
smua.AUTORANGE_ON = 1
---@alias smuasourceautorangev
---|`smua.AUTORANGE_OFF` #Disables source aut
---|`smua.AUTORANGE_ON` #Enables source aut


--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
---  --Enables volts source autorange for SMU channel A. 
--- ```
---@type smuasourceautorangev
smua.source.autorangev = 0

smua.AUTORANGE_OFF = 0
smua.AUTORANGE_ON = 1
---@alias smuasourceautorangei
---|`smua.AUTORANGE_OFF` #Disables source aut
---|`smua.AUTORANGE_ON` #Enables source aut


--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
---  --Enables volts source autorange for SMU channel A. 
--- ```
---@type smuasourceautorangei
smua.source.autorangei = 0


--- **This attribute contains the state of source compliance. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Reading this attribute updates the status model and the front panel with generated compliance information. See Current Limit (ILMT) in the status model diagram for the Measurement event registers. The Voltage Limit (VLMT) is not shown in the status model diagram for the Measurement event registers but is similar to the Current Limit (ILMT).
---
---<br>*Examples:*<br>
--- ```lua
--- compliance = smua.source.compliance
---  
--- print(compliance)
---  --Reads the source compliance state for SMU channel A. Output: true This output indicates that a configured limit has been reached (voltage, current, or power limit). 
--- ```
smua.source.compliance = 0

smua.DELAY_OFF = 0
smua.DELAY_AUTO = -1
---@alias smuasourcedelay
---|`smua.DELAY_OFF` #No delay
---|`smua.DELAY_AUTO` #Automatic delay value


--- **This attribute contains the source delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) after an output step.The smuX.DELAY_AUTO setting causes a range-dependent delay to be inserted when the source is changed. Range-dependent delays are based on the output settling time values as defined in the 2600B specifications.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.delay = smua.DELAY_AUTO
---  --Sets the delay for SMU channel A to automatic (a range-dependent delay is inserted whenever the source is changed). 
--- ```
---@type smuasourcedelay
smua.source.delay = 0

smua.OUTPUT_DCAMPS = 0
smua.OUTPUT_DCVOLTS = 1
---@alias smuasourcefunc
---|`smua.OUTPUT_DCAMPS` #Selects the current source function
---|`smua.OUTPUT_DCVOLTS` #Selects the voltage source function


--- **This attribute contains the source function, which can be voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute indicates the output function of the source for the specified SMU channel. Setting this attribute configures the SMU channel as either a voltage source or a current source.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.func = smua.OUTPUT_DCAMPS
---  --Sets the source function of SMU channel A to be a current source. 
--- ```
---@type smuasourcefunc
smua.source.func = 0

smua.DISABLE = 0
smua.ENABLE = 1
---@alias smuasourcehighc
---|`smua.DISABLE` #Disables high-capacitance mode
---|`smua.ENABLE` #Enables high-capacitance mode


--- **This attribute enables or disables high-capacitance mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When enabled, the high-capacitance mode has the following effects on the SMU settings:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
---  --Activates high-capacitance mode for SMU channel A. 
--- ```
---@type smuasourcehighc
smua.source.highc = 0


--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
---  --Sets voltage source of SMU channel A to 1 V. 
--- ```
smua.source.levelv = 0


--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
---  --Sets voltage source of SMU channel A to 1 V. 
--- ```
smua.source.leveli = 0


--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
---  --Sets the voltage limit of SMU channel A to 15 V. 
--- ```
smua.source.limitv = 0


--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
---  --Sets the voltage limit of SMU channel A to 15 V. 
--- ```
smua.source.limiti = 0


--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
---  --Sets the voltage limit of SMU channel A to 15 V. 
--- ```
smua.source.limitp = 0


--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
---  --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage. 
--- ```
smua.source.lowrangev = 0


--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
---  --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage. 
--- ```
smua.source.lowrangei = 0

smua.OUTPUT_DCAMPS = 0
smua.OUTPUT_DCVOLTS = 1
---@alias smuasourceofffunc
---|`smua.OUTPUT_DCAMPS` #Source 0 A
---|`smua.OUTPUT_DCVOLTS` #Source 0 V


--- **This attribute sets the source function that is used (source 0 A or 0 V) when the output is turned off and the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the source function used when the output is turned off and smuX.source.offmode is set to smuX.OUTPUT_NORMAL.Set this attribute to smuX.OUTPUT_DCVOLTS for the source to be a 0 V source when the output is off (smuX.source.offlimiti is used).Set it to smuX.OUTPUT_DCAMPS for the source to be a 0 A source when the output is off (smuX.source.offlimitv is used).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_NORMAL
--- smua.source.offfunc = smua.OUTPUT_DCVOLTS
---  --Sets the normal output-off mode to source 0 V when the output is turned off for SMU channel A. 
--- ```
---@type smuasourceofffunc
smua.source.offfunc = 0


--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
---  --Changes the normal output-off mode limit to 10 mA for SMU channel A. 
--- ```
smua.source.offlimitv = 0


--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
---  --Changes the normal output-off mode limit to 10 mA for SMU channel A. 
--- ```
smua.source.offlimiti = 0

smua.OUTPUT_NORMAL = 0
smua.OUTPUT_ZERO = 1
smua.OUTPUT_HIGH_Z = 2
---@alias smuasourceoffmode
---|`smua.OUTPUT_NORMAL` #Configures the source function acc
---|`smua.OUTPUT_ZERO` #Configures source to output 0 V as smuX.OUTPUT_NORMAL with different compliance handling (see the Details below)
---|`smua.OUTPUT_HIGH_Z` #Opens the output relay when the output is turned off


--- **This attribute sets the source output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output-off mode of the source. Setting this attribute configures the SMU output-off mode.The default sourceOffMode is smuX.OUTPUT_NORMAL. In this mode, the source function is configured according to the smuX.source.offfunc attribute. The smuX.source.offfunc attribute controls whether the SMU is configured as a 0 V voltage source or a 0 A current source. When the SMU is operating as a 0 A current source, the smuX.source.offlimitv attribute sets the voltage limit (similar to how the smuX.source.offlimiti attribute sets the current limit when the SMU is operating as a 0 V voltage source).When the sourceOffMode is set to smuX.OUTPUT_ZERO, the source is configured to output 0 V just as smuX.OUTPUT_NORMAL mode with smuX.source.offfunc = smuX.OUTPUT_DCVOLTS. If the source function is voltage, the current limit is not changed. If the source function is current, the current limit is set to the current source level or 10 percent of the current source range, whichever is greater.When sourceOffMode is set to smuX.OUTPUT_HIGH_Z, the SMU opens the output relay when the output is turned off.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_HIGH_Z
---  --Sets the output‑off mode for SMU channel A to open the output relay when the output is turned off. 
--- ```
---@type smuasourceoffmode
smua.source.offmode = 0

smua.OUTPUT_OFF = 0
smua.OUTPUT_ON = 1
smua.OUTPUT_HIGH_Z = 2
---@alias smuasourceoutput
---|`smua.OUTPUT_OFF` #Turns off the source output
---|`smua.OUTPUT_ON` #Turns on the source output
---|`smua.OUTPUT_HIGH_Z` #Turns off the output in high Z mode (allows you to go to high Z mode without first setting the smuX.source.offmode attribute to smuX.OUTPUT_HIGH_Z)


--- **This attribute enables or disables the source output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output state of the source. Setting this attribute switches the output of the source on or off.When the output is switched on, the SMU sources either voltage or current, as set by smuX.source.func.Setting this attribute to smuX.OUTPUT_HIGH_Z causes the output to turn off and go to the High Z mode. If the smuX.source.output is read after setting this attribute to smuX.OUTPUT_HIGH_Z, it returns 0.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.output = smua.OUTPUT_ON
---  --Turns on the SMU channel A source output. 
--- ```
---@type smuasourceoutput
smua.source.output = 0

smua.OE_NONE = 0
smua.OE_OUTPUT_OFF = 1
---@alias smuasourceoutputenableaction
---|`smua.OE_NONE` #No action
---|`smua.OE_OUTPUT_OFF` #Turns the source output off


--- **This attribute controls output enable action of the source.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For 2601B, 2602B, or 2604B, this attribute controls the action the SMU takes when the output enable line is deasserted.When set to smuX.OE_NONE, the SMU takes no action when the output enable line goes low (deasserted).When set to smuX.OE_OUTPUT_OFF and the output enable line is de-asserted, the SMU turns its output off as if the smuX.source.output = smuX.OUTPUT_OFF command had been received.The SMU does not automatically turn its output on when the output enable line returns to the high state.If the output enable line is not asserted when this attribute is set to smuX.OE_OUTPUT_OFF and the output is on, the output turns off immediately.Detection of the output enable line going low does not abort any running scripts. This may cause execution errors.For models that have a safety interlock (2611B, 2612B, 2614B, 2635B, 2636B, and 2634B), this attribute dictates the source output behavior when the interlock line is not engaged and the source is configured for safe operation. In the following situations, source output automatically turns off when the interlock is disengaged and the output cannot be turned on unless the interlock is engaged:In the following situations, the source ignores the state of the interlock signal and the output can be turned on regardless of the interlock state:In the following situations, the source output automatically turns off when the interlock is disengaged, the output cannot be turned on unless the interlock is engaged, and the smuX.source.outputenableaction attribute is ignored:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.outputenableaction = smua.OE_OUTPUT_OFF
---  --Sets SMU channel A to turn off the output if the output enable line goes low (deasserted). 
--- ```
---@type smuasourceoutputenableaction
smua.source.outputenableaction = 0


--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
---  --Selects the 1 V source range for SMU channel A. 
--- ```
smua.source.rangev = 0


--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
---  --Selects the 1 V source range for SMU channel A. 
--- ```
smua.source.rangei = 0


--- **This attribute contains the source settling mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Using smuX.SETTLE_FAST_RANGE may cause the SMU to exceed the range change overshoot specification.smuX.SETTLE_FAST_POLARITY does not go to zero when changing polarity and may create inconsistencies at the zero crossing.smuX.SETTLE_DIRECT_IRANGE switches the SMU directly to the target range instead of the default “range-by-range” method. This option is mutually exclusive of any other smuX.SETTLE_FAST_* commands.smuX.SETTLE_SMOOTH_100NA is disabled by default in the 2601B, 2602B, 2604B, 2611B, 2612B, and 2614B. In the 2634B, 2635B, and 2636B, it is always enabled.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.settling = smua.SETTLE_FAST_POLARITY
---  --Selects fast polarity changing for SMU channel A. 
--- ```
smua.source.settling = 0

smua.DISABLE = 0
smua.ENABLE = 1
---@alias smuasourcesink
---|`smua.DISABLE` #Turns off sink mode
---|`smua.ENABLE` #Turns on sink mode


--- **This attribute turns sink mode on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables sink mode. When sink mode is enabled, it reduces the source limit inaccuracy that occurs when operating in quadrants II and IV (quadrants I and III show this source limit inaccuracy).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.sink = smua.ENABLE
---  --Enables sink mode for SMU channel A. 
--- ```
---@type smuasourcesink
smua.source.sink = 0
---
---
---@class smub.source
smub.source = {}

smub.AUTORANGE_OFF = 0
smub.AUTORANGE_ON = 1
---@alias smubsourceautorangev
---|`smub.AUTORANGE_OFF` #Disables source aut
---|`smub.AUTORANGE_ON` #Enables source aut


--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
---  --Enables volts source autorange for SMU channel A. 
--- ```
---@type smubsourceautorangev
smub.source.autorangev = 0

smub.AUTORANGE_OFF = 0
smub.AUTORANGE_ON = 1
---@alias smubsourceautorangei
---|`smub.AUTORANGE_OFF` #Disables source aut
---|`smub.AUTORANGE_ON` #Enables source aut


--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
---  --Enables volts source autorange for SMU channel A. 
--- ```
---@type smubsourceautorangei
smub.source.autorangei = 0


--- **This attribute contains the state of source compliance. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Reading this attribute updates the status model and the front panel with generated compliance information. See Current Limit (ILMT) in the status model diagram for the Measurement event registers. The Voltage Limit (VLMT) is not shown in the status model diagram for the Measurement event registers but is similar to the Current Limit (ILMT).
---
---<br>*Examples:*<br>
--- ```lua
--- compliance = smua.source.compliance
---  
--- print(compliance)
---  --Reads the source compliance state for SMU channel A. Output: true This output indicates that a configured limit has been reached (voltage, current, or power limit). 
--- ```
smub.source.compliance = 0

smub.DELAY_OFF = 0
smub.DELAY_AUTO = -1
---@alias smubsourcedelay
---|`smub.DELAY_OFF` #No delay
---|`smub.DELAY_AUTO` #Automatic delay value


--- **This attribute contains the source delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) after an output step.The smuX.DELAY_AUTO setting causes a range-dependent delay to be inserted when the source is changed. Range-dependent delays are based on the output settling time values as defined in the 2600B specifications.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.delay = smua.DELAY_AUTO
---  --Sets the delay for SMU channel A to automatic (a range-dependent delay is inserted whenever the source is changed). 
--- ```
---@type smubsourcedelay
smub.source.delay = 0

smub.OUTPUT_DCAMPS = 0
smub.OUTPUT_DCVOLTS = 1
---@alias smubsourcefunc
---|`smub.OUTPUT_DCAMPS` #Selects the current source function
---|`smub.OUTPUT_DCVOLTS` #Selects the voltage source function


--- **This attribute contains the source function, which can be voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute indicates the output function of the source for the specified SMU channel. Setting this attribute configures the SMU channel as either a voltage source or a current source.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.func = smua.OUTPUT_DCAMPS
---  --Sets the source function of SMU channel A to be a current source. 
--- ```
---@type smubsourcefunc
smub.source.func = 0

smub.DISABLE = 0
smub.ENABLE = 1
---@alias smubsourcehighc
---|`smub.DISABLE` #Disables high-capacitance mode
---|`smub.ENABLE` #Enables high-capacitance mode


--- **This attribute enables or disables high-capacitance mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When enabled, the high-capacitance mode has the following effects on the SMU settings:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
---  --Activates high-capacitance mode for SMU channel A. 
--- ```
---@type smubsourcehighc
smub.source.highc = 0


--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
---  --Sets voltage source of SMU channel A to 1 V. 
--- ```
smub.source.levelv = 0


--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
---  --Sets voltage source of SMU channel A to 1 V. 
--- ```
smub.source.leveli = 0


--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
---  --Sets the voltage limit of SMU channel A to 15 V. 
--- ```
smub.source.limitv = 0


--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
---  --Sets the voltage limit of SMU channel A to 15 V. 
--- ```
smub.source.limiti = 0


--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
---  --Sets the voltage limit of SMU channel A to 15 V. 
--- ```
smub.source.limitp = 0


--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
---  --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage. 
--- ```
smub.source.lowrangev = 0


--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
---  --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage. 
--- ```
smub.source.lowrangei = 0

smub.OUTPUT_DCAMPS = 0
smub.OUTPUT_DCVOLTS = 1
---@alias smubsourceofffunc
---|`smub.OUTPUT_DCAMPS` #Source 0 A
---|`smub.OUTPUT_DCVOLTS` #Source 0 V


--- **This attribute sets the source function that is used (source 0 A or 0 V) when the output is turned off and the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the source function used when the output is turned off and smuX.source.offmode is set to smuX.OUTPUT_NORMAL.Set this attribute to smuX.OUTPUT_DCVOLTS for the source to be a 0 V source when the output is off (smuX.source.offlimiti is used).Set it to smuX.OUTPUT_DCAMPS for the source to be a 0 A source when the output is off (smuX.source.offlimitv is used).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_NORMAL
--- smua.source.offfunc = smua.OUTPUT_DCVOLTS
---  --Sets the normal output-off mode to source 0 V when the output is turned off for SMU channel A. 
--- ```
---@type smubsourceofffunc
smub.source.offfunc = 0


--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
---  --Changes the normal output-off mode limit to 10 mA for SMU channel A. 
--- ```
smub.source.offlimitv = 0


--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
---  --Changes the normal output-off mode limit to 10 mA for SMU channel A. 
--- ```
smub.source.offlimiti = 0

smub.OUTPUT_NORMAL = 0
smub.OUTPUT_ZERO = 1
smub.OUTPUT_HIGH_Z = 2
---@alias smubsourceoffmode
---|`smub.OUTPUT_NORMAL` #Configures the source function acc
---|`smub.OUTPUT_ZERO` #Configures source to output 0 V as smuX.OUTPUT_NORMAL with different compliance handling (see the Details below)
---|`smub.OUTPUT_HIGH_Z` #Opens the output relay when the output is turned off


--- **This attribute sets the source output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output-off mode of the source. Setting this attribute configures the SMU output-off mode.The default sourceOffMode is smuX.OUTPUT_NORMAL. In this mode, the source function is configured according to the smuX.source.offfunc attribute. The smuX.source.offfunc attribute controls whether the SMU is configured as a 0 V voltage source or a 0 A current source. When the SMU is operating as a 0 A current source, the smuX.source.offlimitv attribute sets the voltage limit (similar to how the smuX.source.offlimiti attribute sets the current limit when the SMU is operating as a 0 V voltage source).When the sourceOffMode is set to smuX.OUTPUT_ZERO, the source is configured to output 0 V just as smuX.OUTPUT_NORMAL mode with smuX.source.offfunc = smuX.OUTPUT_DCVOLTS. If the source function is voltage, the current limit is not changed. If the source function is current, the current limit is set to the current source level or 10 percent of the current source range, whichever is greater.When sourceOffMode is set to smuX.OUTPUT_HIGH_Z, the SMU opens the output relay when the output is turned off.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_HIGH_Z
---  --Sets the output‑off mode for SMU channel A to open the output relay when the output is turned off. 
--- ```
---@type smubsourceoffmode
smub.source.offmode = 0

smub.OUTPUT_OFF = 0
smub.OUTPUT_ON = 1
smub.OUTPUT_HIGH_Z = 2
---@alias smubsourceoutput
---|`smub.OUTPUT_OFF` #Turns off the source output
---|`smub.OUTPUT_ON` #Turns on the source output
---|`smub.OUTPUT_HIGH_Z` #Turns off the output in high Z mode (allows you to go to high Z mode without first setting the smuX.source.offmode attribute to smuX.OUTPUT_HIGH_Z)


--- **This attribute enables or disables the source output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output state of the source. Setting this attribute switches the output of the source on or off.When the output is switched on, the SMU sources either voltage or current, as set by smuX.source.func.Setting this attribute to smuX.OUTPUT_HIGH_Z causes the output to turn off and go to the High Z mode. If the smuX.source.output is read after setting this attribute to smuX.OUTPUT_HIGH_Z, it returns 0.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.output = smua.OUTPUT_ON
---  --Turns on the SMU channel A source output. 
--- ```
---@type smubsourceoutput
smub.source.output = 0

smub.OE_NONE = 0
smub.OE_OUTPUT_OFF = 1
---@alias smubsourceoutputenableaction
---|`smub.OE_NONE` #No action
---|`smub.OE_OUTPUT_OFF` #Turns the source output off


--- **This attribute controls output enable action of the source.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For 2601B, 2602B, or 2604B, this attribute controls the action the SMU takes when the output enable line is deasserted.When set to smuX.OE_NONE, the SMU takes no action when the output enable line goes low (deasserted).When set to smuX.OE_OUTPUT_OFF and the output enable line is de-asserted, the SMU turns its output off as if the smuX.source.output = smuX.OUTPUT_OFF command had been received.The SMU does not automatically turn its output on when the output enable line returns to the high state.If the output enable line is not asserted when this attribute is set to smuX.OE_OUTPUT_OFF and the output is on, the output turns off immediately.Detection of the output enable line going low does not abort any running scripts. This may cause execution errors.For models that have a safety interlock (2611B, 2612B, 2614B, 2635B, 2636B, and 2634B), this attribute dictates the source output behavior when the interlock line is not engaged and the source is configured for safe operation. In the following situations, source output automatically turns off when the interlock is disengaged and the output cannot be turned on unless the interlock is engaged:In the following situations, the source ignores the state of the interlock signal and the output can be turned on regardless of the interlock state:In the following situations, the source output automatically turns off when the interlock is disengaged, the output cannot be turned on unless the interlock is engaged, and the smuX.source.outputenableaction attribute is ignored:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.outputenableaction = smua.OE_OUTPUT_OFF
---  --Sets SMU channel A to turn off the output if the output enable line goes low (deasserted). 
--- ```
---@type smubsourceoutputenableaction
smub.source.outputenableaction = 0


--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
---  --Selects the 1 V source range for SMU channel A. 
--- ```
smub.source.rangev = 0


--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
---  --Selects the 1 V source range for SMU channel A. 
--- ```
smub.source.rangei = 0


--- **This attribute contains the source settling mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Using smuX.SETTLE_FAST_RANGE may cause the SMU to exceed the range change overshoot specification.smuX.SETTLE_FAST_POLARITY does not go to zero when changing polarity and may create inconsistencies at the zero crossing.smuX.SETTLE_DIRECT_IRANGE switches the SMU directly to the target range instead of the default “range-by-range” method. This option is mutually exclusive of any other smuX.SETTLE_FAST_* commands.smuX.SETTLE_SMOOTH_100NA is disabled by default in the 2601B, 2602B, 2604B, 2611B, 2612B, and 2614B. In the 2634B, 2635B, and 2636B, it is always enabled.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.settling = smua.SETTLE_FAST_POLARITY
---  --Selects fast polarity changing for SMU channel A. 
--- ```
smub.source.settling = 0

smub.DISABLE = 0
smub.ENABLE = 1
---@alias smubsourcesink
---|`smub.DISABLE` #Turns off sink mode
---|`smub.ENABLE` #Turns on sink mode


--- **This attribute turns sink mode on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables sink mode. When sink mode is enabled, it reduces the source limit inaccuracy that occurs when operating in quadrants II and IV (quadrants I and III show this source limit inaccuracy).
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.sink = smua.ENABLE
---  --Enables sink mode for SMU channel A. 
--- ```
---@type smubsourcesink
smub.source.sink = 0
---
---
---@class smua.trigger
smua.trigger = {}


--- **This constant contains the number of the armed event.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to armed events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.ARMED_EVENT_ID
---  --Trigger timer when the SMU passes through the arm layer. 
--- ```
---@type eventID
smua.trigger.ARMED_EVENT_ID= nil

smua.DISABLE = 0
smua.ENABLE = 1
---@alias smuatriggerautoclear
---|`smua.DISABLE` #Turns off automatic clearing of the event detect
---|`smua.ENABLE` #Turns on automatic clearing of the event detect


--- **This attribute turns automatic clearing of the event detectors on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables automatic clearing of the trigger model state machine event detectors when the SMU transitions from the arm layer to the trigger layer.Only the detected states of the event detectors are cleared.The overrun statuses of the event detectors are not automatically cleared when the SMU transitions from the arm layer to the trigger layer.The event detectors are always cleared when a sweep is initiated.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.autoclear = smua.ENABLE
---  --Automatically clear the event detectors for the trigger mode state. 
--- ```
---@type smuatriggerautoclear
smua.trigger.autoclear = 0


--- **This attribute sets the trigger count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the trigger layer of the trigger model the number of times set by this attribute. After performing the iterations, the SMU returns to the arm layer.If this count is set to zero (0), the SMU stays in the trigger model indefinitely until aborted.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- period_timer = trigger.timer[1]
--- pulse_timer = trigger.timer[2]
--- smua.trigger.source.listv( {5} )
--- smua.trigger.source.action = smua.ENABLE
--- smua.source.rangev = 5
--- smua.trigger.measure.action = smua.DISABLE
--- pulse_timer.delay = 0.0006
--- pulse_timer.stimulus = period_timer.EVENT_ID
--- pulse_timer.count = 1
--- period_timer.delay = 0.005
--- period_timer.count = 9
--- period_timer.stimulus = smua.trigger.SWEEPING_EVENT_ID
--- period_timer.passthrough = true
--- smua.trigger.source.stimulus = period_timer.EVENT_ID
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = pulse_timer.EVENT_ID
--- smua.trigger.count = 1
--- smua.trigger.arm.count = 10
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- waitcomplete()
--- smua.source.output = smua.OUTPUT_OFF
---  --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms. Alias the trigger timers to use for pulse width and period. Create a fixed level voltage sweep. Set the pulse width and trigger the pulse width timer with a period timer. Set the pulse period to output one pulse per period and the count to generate 10 pulses. Trigger the pulse period timer when a sweep is initiated. Configure the timer to output a trigger event when it starts the first delay. Trigger the SMU source action using pulse period timer. Trigger the SMU end pulse action using pulse width timer. Set the trigger model counts. Configure the SMU to execute a 10-point pulse train. Start the trigger model. Wait for the sweep to complete. 
--- ```
smua.trigger.count = 0


--- **This constant contains the idle event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to idle events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.IDLE_EVENT_ID
---  --Trigger timer 1 when the SMU returns to the idle layer. 
--- ```
---@type eventID
smua.trigger.IDLE_EVENT_ID= nil


--- **This constant contains the measurement complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to measure complete events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smuX.trigger.MEASURE_COMPLETE_EVENT_ID
---  --Trigger the timer when the SMU completes a measurement. 
--- ```
---@type eventID
smua.trigger.MEASURE_COMPLETE_EVENT_ID= nil


--- **This constant contains the pulse complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to pulse complete events.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.PULSE_COMPLETE_EVENT_ID
---  --Trigger a timer when the SMU completes a pulse. 
--- ```
---@type eventID
smua.trigger.PULSE_COMPLETE_EVENT_ID= nil


--- **This constant contains the source complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to source complete events from this source‑measure unit (SMU).
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID
---  --Trigger the timer when the SMU updates the source level or starts a pulse. 
--- ```
---@type eventID
smua.trigger.SOURCE_COMPLETE_EVENT_ID= nil


--- **This constant contains the sweep complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweep complete events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].mode = digio.TRIG_RISINGA
--- digio.trigger[2].clear()
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
--- digio.trigger[4].mode = digio.TRIG_RISINGM
--- digio.trigger[4].pulsewidth = 0.001
--- digio.trigger[4].stimulus = smua.trigger.SWEEP_COMPLETE_EVENT_ID
---  --Configure the 2600B to detect a rising edge on digital I/O line 2. Configure SMU A to start its source action when a  trigger event occurs on digital I/O line 2. Configure digital I/O line 4 to output a 1 ms rising-edge trigger pulse at the completion of the SMU sweep. 
--- ```
---@type eventID
smua.trigger.SWEEP_COMPLETE_EVENT_ID= nil


--- **This constant contains the sweeping event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweeping events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- period_timer = trigger.timer[1]
--- pulse_timer = trigger.timer[2]
--- smua.trigger.source.listv( {5} )
--- smua.trigger.source.action = smua.ENABLE
--- smua.source.rangev = 5
--- smua.trigger.measure.action = smua.DISABLE
--- pulse_timer.delay = 0.0006
--- pulse_timer.stimulus = period_timer.EVENT_ID
--- pulse_timer.count = 1
--- period_timer.delay = 0.005
--- period_timer.count = 9
--- period_timer.stimulus = smua.trigger.SWEEPING_EVENT_ID
--- period_timer.passthrough = true
--- smua.trigger.source.stimulus = period_timer.EVENT_ID
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = pulse_timer.EVENT_ID
--- smua.trigger.count = 1
--- smua.trigger.arm.count = 10
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- waitcomplete()
--- smua.source.output = smua.OUTPUT_OFF
---  --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms. Alias the trigger timers to use for pulse width and period. Create a fixed level voltage sweep. Set the pulse width and trigger the pulse width timer with a period timer. Set the pulse period to output one pulse per period and the count to generate 10 pulses. Trigger the pulse period timer when a sweep is initiated. Configure the timer to output a trigger event when it starts the first delay. Trigger the SMU source action using pulse period timer. Trigger the SMU end pulse action using pulse width timer. Set the trigger model counts. Configure the SMU to execute a 10-point pulse train. Start the trigger model. Wait for the sweep to complete. 
--- ```
---@type eventID
smua.trigger.SWEEPING_EVENT_ID= nil
---
---
---@class smub.trigger
smub.trigger = {}


--- **This constant contains the number of the armed event.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to armed events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.ARMED_EVENT_ID
---  --Trigger timer when the SMU passes through the arm layer. 
--- ```
---@type eventID
smub.trigger.ARMED_EVENT_ID= nil

smub.DISABLE = 0
smub.ENABLE = 1
---@alias smubtriggerautoclear
---|`smub.DISABLE` #Turns off automatic clearing of the event detect
---|`smub.ENABLE` #Turns on automatic clearing of the event detect


--- **This attribute turns automatic clearing of the event detectors on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables automatic clearing of the trigger model state machine event detectors when the SMU transitions from the arm layer to the trigger layer.Only the detected states of the event detectors are cleared.The overrun statuses of the event detectors are not automatically cleared when the SMU transitions from the arm layer to the trigger layer.The event detectors are always cleared when a sweep is initiated.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.autoclear = smua.ENABLE
---  --Automatically clear the event detectors for the trigger mode state. 
--- ```
---@type smubtriggerautoclear
smub.trigger.autoclear = 0


--- **This attribute sets the trigger count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the trigger layer of the trigger model the number of times set by this attribute. After performing the iterations, the SMU returns to the arm layer.If this count is set to zero (0), the SMU stays in the trigger model indefinitely until aborted.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- period_timer = trigger.timer[1]
--- pulse_timer = trigger.timer[2]
--- smua.trigger.source.listv( {5} )
--- smua.trigger.source.action = smua.ENABLE
--- smua.source.rangev = 5
--- smua.trigger.measure.action = smua.DISABLE
--- pulse_timer.delay = 0.0006
--- pulse_timer.stimulus = period_timer.EVENT_ID
--- pulse_timer.count = 1
--- period_timer.delay = 0.005
--- period_timer.count = 9
--- period_timer.stimulus = smua.trigger.SWEEPING_EVENT_ID
--- period_timer.passthrough = true
--- smua.trigger.source.stimulus = period_timer.EVENT_ID
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = pulse_timer.EVENT_ID
--- smua.trigger.count = 1
--- smua.trigger.arm.count = 10
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- waitcomplete()
--- smua.source.output = smua.OUTPUT_OFF
---  --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms. Alias the trigger timers to use for pulse width and period. Create a fixed level voltage sweep. Set the pulse width and trigger the pulse width timer with a period timer. Set the pulse period to output one pulse per period and the count to generate 10 pulses. Trigger the pulse period timer when a sweep is initiated. Configure the timer to output a trigger event when it starts the first delay. Trigger the SMU source action using pulse period timer. Trigger the SMU end pulse action using pulse width timer. Set the trigger model counts. Configure the SMU to execute a 10-point pulse train. Start the trigger model. Wait for the sweep to complete. 
--- ```
smub.trigger.count = 0


--- **This constant contains the idle event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to idle events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.IDLE_EVENT_ID
---  --Trigger timer 1 when the SMU returns to the idle layer. 
--- ```
---@type eventID
smub.trigger.IDLE_EVENT_ID= nil


--- **This constant contains the measurement complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to measure complete events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smuX.trigger.MEASURE_COMPLETE_EVENT_ID
---  --Trigger the timer when the SMU completes a measurement. 
--- ```
---@type eventID
smub.trigger.MEASURE_COMPLETE_EVENT_ID= nil


--- **This constant contains the pulse complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to pulse complete events.
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.PULSE_COMPLETE_EVENT_ID
---  --Trigger a timer when the SMU completes a pulse. 
--- ```
---@type eventID
smub.trigger.PULSE_COMPLETE_EVENT_ID= nil


--- **This constant contains the source complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to source complete events from this source‑measure unit (SMU).
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID
---  --Trigger the timer when the SMU updates the source level or starts a pulse. 
--- ```
---@type eventID
smub.trigger.SOURCE_COMPLETE_EVENT_ID= nil


--- **This constant contains the sweep complete event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweep complete events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].mode = digio.TRIG_RISINGA
--- digio.trigger[2].clear()
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
--- digio.trigger[4].mode = digio.TRIG_RISINGM
--- digio.trigger[4].pulsewidth = 0.001
--- digio.trigger[4].stimulus = smua.trigger.SWEEP_COMPLETE_EVENT_ID
---  --Configure the 2600B to detect a rising edge on digital I/O line 2. Configure SMU A to start its source action when a  trigger event occurs on digital I/O line 2. Configure digital I/O line 4 to output a 1 ms rising-edge trigger pulse at the completion of the SMU sweep. 
--- ```
---@type eventID
smub.trigger.SWEEP_COMPLETE_EVENT_ID= nil


--- **This constant contains the sweeping event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweeping events from this SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- period_timer = trigger.timer[1]
--- pulse_timer = trigger.timer[2]
--- smua.trigger.source.listv( {5} )
--- smua.trigger.source.action = smua.ENABLE
--- smua.source.rangev = 5
--- smua.trigger.measure.action = smua.DISABLE
--- pulse_timer.delay = 0.0006
--- pulse_timer.stimulus = period_timer.EVENT_ID
--- pulse_timer.count = 1
--- period_timer.delay = 0.005
--- period_timer.count = 9
--- period_timer.stimulus = smua.trigger.SWEEPING_EVENT_ID
--- period_timer.passthrough = true
--- smua.trigger.source.stimulus = period_timer.EVENT_ID
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = pulse_timer.EVENT_ID
--- smua.trigger.count = 1
--- smua.trigger.arm.count = 10
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- waitcomplete()
--- smua.source.output = smua.OUTPUT_OFF
---  --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms. Alias the trigger timers to use for pulse width and period. Create a fixed level voltage sweep. Set the pulse width and trigger the pulse width timer with a period timer. Set the pulse period to output one pulse per period and the count to generate 10 pulses. Trigger the pulse period timer when a sweep is initiated. Configure the timer to output a trigger event when it starts the first delay. Trigger the SMU source action using pulse period timer. Trigger the SMU end pulse action using pulse width timer. Set the trigger model counts. Configure the SMU to execute a 10-point pulse train. Start the trigger model. Wait for the sweep to complete. 
--- ```
---@type eventID
smub.trigger.SWEEPING_EVENT_ID= nil
---
---
---@class status.measurement
status.measurement = {}


--- **This attribute contains the measurement event register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.VOLTAGE_LIMIT
--- status.measurement.VLMT
--- status.measurement.CURRENT_LIMIT
--- status.measurement.ILMT
--- status.measurement.READING_OVERFLOW
--- status.measurement.ROF
--- status.measurement.BUFFER_AVAILABLE
--- status.measurement.BAV
--- status.measurement.OUTPUT_ENABLE
--- status.measurement.OE
--- status.measurement.INTERLOCK
--- status.measurement.INT
--- status.measurement.INSTRUMENT_SUMMARY
--- status.measurement.INST
---  --Set bit indicates that a bit in the measurement instrument summary register is set. Bit B13 decimal value: 8,192 
--- ```
status.measurement.condition = 0


--- **This attribute contains the measurement event register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.VOLTAGE_LIMIT
--- status.measurement.VLMT
--- status.measurement.CURRENT_LIMIT
--- status.measurement.ILMT
--- status.measurement.READING_OVERFLOW
--- status.measurement.ROF
--- status.measurement.BUFFER_AVAILABLE
--- status.measurement.BAV
--- status.measurement.OUTPUT_ENABLE
--- status.measurement.OE
--- status.measurement.INTERLOCK
--- status.measurement.INT
--- status.measurement.INSTRUMENT_SUMMARY
--- status.measurement.INST
---  --Set bit indicates that a bit in the measurement instrument summary register is set. Bit B13 decimal value: 8,192 
--- ```
status.measurement.enable = 0


--- **This attribute contains the measurement event register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.VOLTAGE_LIMIT
--- status.measurement.VLMT
--- status.measurement.CURRENT_LIMIT
--- status.measurement.ILMT
--- status.measurement.READING_OVERFLOW
--- status.measurement.ROF
--- status.measurement.BUFFER_AVAILABLE
--- status.measurement.BAV
--- status.measurement.OUTPUT_ENABLE
--- status.measurement.OE
--- status.measurement.INTERLOCK
--- status.measurement.INT
--- status.measurement.INSTRUMENT_SUMMARY
--- status.measurement.INST
---  --Set bit indicates that a bit in the measurement instrument summary register is set. Bit B13 decimal value: 8,192 
--- ```
status.measurement.event = 0


--- **This attribute contains the measurement event register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.VOLTAGE_LIMIT
--- status.measurement.VLMT
--- status.measurement.CURRENT_LIMIT
--- status.measurement.ILMT
--- status.measurement.READING_OVERFLOW
--- status.measurement.ROF
--- status.measurement.BUFFER_AVAILABLE
--- status.measurement.BAV
--- status.measurement.OUTPUT_ENABLE
--- status.measurement.OE
--- status.measurement.INTERLOCK
--- status.measurement.INT
--- status.measurement.INSTRUMENT_SUMMARY
--- status.measurement.INST
---  --Set bit indicates that a bit in the measurement instrument summary register is set. Bit B13 decimal value: 8,192 
--- ```
status.measurement.ntr = 0


--- **This attribute contains the measurement event register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.VOLTAGE_LIMIT
--- status.measurement.VLMT
--- status.measurement.CURRENT_LIMIT
--- status.measurement.ILMT
--- status.measurement.READING_OVERFLOW
--- status.measurement.ROF
--- status.measurement.BUFFER_AVAILABLE
--- status.measurement.BAV
--- status.measurement.OUTPUT_ENABLE
--- status.measurement.OE
--- status.measurement.INTERLOCK
--- status.measurement.INT
--- status.measurement.INSTRUMENT_SUMMARY
--- status.measurement.INST
---  --Set bit indicates that a bit in the measurement instrument summary register is set. Bit B13 decimal value: 8,192 
--- ```
status.measurement.ptr = 0
---
---
---@class status.operation
status.operation = {}


--- **These attributes manage the operation status register set of the status model. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.CALIBRATING
--- status.operation.CAL
--- status.operation.SWEEPING
--- status.operation.SWE
--- status.operation.MEASURING
--- status.operation.MEAS
--- status.operation.TRIGGER_OVERRUN
--- status.operation.TRGOVR
--- status.operation.REMOTE_SUMMARY
--- status.operation.REM
--- status.operation.USER
--- status.operation.INSTRUMENT_SUMMARY
--- status.operation.INST
--- status.operation.PROGRAM_RUNNING
--- status.operation.PROG
---  --
--- ```
status.operation.condition = 0


--- **These attributes manage the operation status register set of the status model.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.CALIBRATING
--- status.operation.CAL
--- status.operation.SWEEPING
--- status.operation.SWE
--- status.operation.MEASURING
--- status.operation.MEAS
--- status.operation.TRIGGER_OVERRUN
--- status.operation.TRGOVR
--- status.operation.REMOTE_SUMMARY
--- status.operation.REM
--- status.operation.USER
--- status.operation.INSTRUMENT_SUMMARY
--- status.operation.INST
--- status.operation.PROGRAM_RUNNING
--- status.operation.PROG
---  --
--- ```
status.operation.enable = 0


--- **These attributes manage the operation status register set of the status model.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.CALIBRATING
--- status.operation.CAL
--- status.operation.SWEEPING
--- status.operation.SWE
--- status.operation.MEASURING
--- status.operation.MEAS
--- status.operation.TRIGGER_OVERRUN
--- status.operation.TRGOVR
--- status.operation.REMOTE_SUMMARY
--- status.operation.REM
--- status.operation.USER
--- status.operation.INSTRUMENT_SUMMARY
--- status.operation.INST
--- status.operation.PROGRAM_RUNNING
--- status.operation.PROG
---  --
--- ```
status.operation.event = 0


--- **These attributes manage the operation status register set of the status model.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.CALIBRATING
--- status.operation.CAL
--- status.operation.SWEEPING
--- status.operation.SWE
--- status.operation.MEASURING
--- status.operation.MEAS
--- status.operation.TRIGGER_OVERRUN
--- status.operation.TRGOVR
--- status.operation.REMOTE_SUMMARY
--- status.operation.REM
--- status.operation.USER
--- status.operation.INSTRUMENT_SUMMARY
--- status.operation.INST
--- status.operation.PROGRAM_RUNNING
--- status.operation.PROG
---  --
--- ```
status.operation.ntr = 0


--- **These attributes manage the operation status register set of the status model.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.CALIBRATING
--- status.operation.CAL
--- status.operation.SWEEPING
--- status.operation.SWE
--- status.operation.MEASURING
--- status.operation.MEAS
--- status.operation.TRIGGER_OVERRUN
--- status.operation.TRGOVR
--- status.operation.REMOTE_SUMMARY
--- status.operation.REM
--- status.operation.USER
--- status.operation.INSTRUMENT_SUMMARY
--- status.operation.INST
--- status.operation.PROGRAM_RUNNING
--- status.operation.PROG
---  --
--- ```
status.operation.ptr = 0
---
---
---@class status.questionable
status.questionable = {}


--- **These attributes manage the questionable status register set of the status model. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.CALIBRATION
--- status.questionable.CAL
--- status.questionable.UNSTABLE_OUTPUT
--- status.questionable.UO
--- status.questionable.HIGHV_NOT_READY
--- status.questionable.OVER_TEMPERATURE
--- status.questionable.OTEMP
--- status.questionable.INSTRUMENT_SUMMARY
--- status.questionable.INST
---  --An enabled bit in the questionable status instrument summary event register is set. Bit B13 decimal value: 8,192 
--- ```
status.questionable.condition = 0


--- **These attributes manage the questionable status register set of the status model.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.CALIBRATION
--- status.questionable.CAL
--- status.questionable.UNSTABLE_OUTPUT
--- status.questionable.UO
--- status.questionable.HIGHV_NOT_READY
--- status.questionable.OVER_TEMPERATURE
--- status.questionable.OTEMP
--- status.questionable.INSTRUMENT_SUMMARY
--- status.questionable.INST
---  --An enabled bit in the questionable status instrument summary event register is set. Bit B13 decimal value: 8,192 
--- ```
status.questionable.enable = 0


--- **These attributes manage the questionable status register set of the status model.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.CALIBRATION
--- status.questionable.CAL
--- status.questionable.UNSTABLE_OUTPUT
--- status.questionable.UO
--- status.questionable.HIGHV_NOT_READY
--- status.questionable.OVER_TEMPERATURE
--- status.questionable.OTEMP
--- status.questionable.INSTRUMENT_SUMMARY
--- status.questionable.INST
---  --An enabled bit in the questionable status instrument summary event register is set. Bit B13 decimal value: 8,192 
--- ```
status.questionable.event = 0


--- **These attributes manage the questionable status register set of the status model.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.CALIBRATION
--- status.questionable.CAL
--- status.questionable.UNSTABLE_OUTPUT
--- status.questionable.UO
--- status.questionable.HIGHV_NOT_READY
--- status.questionable.OVER_TEMPERATURE
--- status.questionable.OTEMP
--- status.questionable.INSTRUMENT_SUMMARY
--- status.questionable.INST
---  --An enabled bit in the questionable status instrument summary event register is set. Bit B13 decimal value: 8,192 
--- ```
status.questionable.ntr = 0


--- **These attributes manage the questionable status register set of the status model.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.CALIBRATION
--- status.questionable.CAL
--- status.questionable.UNSTABLE_OUTPUT
--- status.questionable.UO
--- status.questionable.HIGHV_NOT_READY
--- status.questionable.OVER_TEMPERATURE
--- status.questionable.OTEMP
--- status.questionable.INSTRUMENT_SUMMARY
--- status.questionable.INST
---  --An enabled bit in the questionable status instrument summary event register is set. Bit B13 decimal value: 8,192 
--- ```
status.questionable.ptr = 0
---
---
---@class status.standard
status.standard = {}


--- **These attributes manage the standard event status register set of the status model. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.standard.OPERATION_COMPLETE
--- status.standard.OPC
--- status.standard.QUERY_ERROR
--- status.standard.QYE
--- status.standard.DEVICE_DEPENDENT_ERROR
--- status.standard.DDE
--- status.standard.EXECUTION_ERROR
--- status.standard.EXE
--- status.standard.COMMAND_ERROR
--- status.standard.CME
--- status.standard.USER_REQUEST
--- status.standard.URQ
--- status.standard.POWER_ON
--- status.standard.PON
---  --
--- ```
status.standard.condition = 0


--- **These attributes manage the standard event status register set of the status model.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.standard.OPERATION_COMPLETE
--- status.standard.OPC
--- status.standard.QUERY_ERROR
--- status.standard.QYE
--- status.standard.DEVICE_DEPENDENT_ERROR
--- status.standard.DDE
--- status.standard.EXECUTION_ERROR
--- status.standard.EXE
--- status.standard.COMMAND_ERROR
--- status.standard.CME
--- status.standard.USER_REQUEST
--- status.standard.URQ
--- status.standard.POWER_ON
--- status.standard.PON
---  --
--- ```
status.standard.enable = 0


--- **These attributes manage the standard event status register set of the status model.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.standard.OPERATION_COMPLETE
--- status.standard.OPC
--- status.standard.QUERY_ERROR
--- status.standard.QYE
--- status.standard.DEVICE_DEPENDENT_ERROR
--- status.standard.DDE
--- status.standard.EXECUTION_ERROR
--- status.standard.EXE
--- status.standard.COMMAND_ERROR
--- status.standard.CME
--- status.standard.USER_REQUEST
--- status.standard.URQ
--- status.standard.POWER_ON
--- status.standard.PON
---  --
--- ```
status.standard.event = 0


--- **These attributes manage the standard event status register set of the status model.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.standard.OPERATION_COMPLETE
--- status.standard.OPC
--- status.standard.QUERY_ERROR
--- status.standard.QYE
--- status.standard.DEVICE_DEPENDENT_ERROR
--- status.standard.DDE
--- status.standard.EXECUTION_ERROR
--- status.standard.EXE
--- status.standard.COMMAND_ERROR
--- status.standard.CME
--- status.standard.USER_REQUEST
--- status.standard.URQ
--- status.standard.POWER_ON
--- status.standard.PON
---  --
--- ```
status.standard.ntr = 0


--- **These attributes manage the standard event status register set of the status model.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.standard.OPERATION_COMPLETE
--- status.standard.OPC
--- status.standard.QUERY_ERROR
--- status.standard.QYE
--- status.standard.DEVICE_DEPENDENT_ERROR
--- status.standard.DDE
--- status.standard.EXECUTION_ERROR
--- status.standard.EXE
--- status.standard.COMMAND_ERROR
--- status.standard.CME
--- status.standard.USER_REQUEST
--- status.standard.URQ
--- status.standard.POWER_ON
--- status.standard.PON
---  --
--- ```
status.standard.ptr = 0
---
---
---@class status.system
status.system = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system.EXTENSION_BIT
--- status.system.EXT
--- status.system.NODE1
--- status.system.NODE2
--- status.system.NODE3
--- status.system.NODE4
--- status.system.NODE5
--- status.system.NODE6
--- status.system.NODE7
--- status.system.NODE8
--- status.system.NODE9
--- status.system.NODE10
--- status.system.NODE11
--- status.system.NODE12
--- status.system.NODE13
--- status.system.NODE14
---  --16,384 
--- ```
status.system.condition = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system.EXTENSION_BIT
--- status.system.EXT
--- status.system.NODE1
--- status.system.NODE2
--- status.system.NODE3
--- status.system.NODE4
--- status.system.NODE5
--- status.system.NODE6
--- status.system.NODE7
--- status.system.NODE8
--- status.system.NODE9
--- status.system.NODE10
--- status.system.NODE11
--- status.system.NODE12
--- status.system.NODE13
--- status.system.NODE14
---  --16,384 
--- ```
status.system.enable = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system.EXTENSION_BIT
--- status.system.EXT
--- status.system.NODE1
--- status.system.NODE2
--- status.system.NODE3
--- status.system.NODE4
--- status.system.NODE5
--- status.system.NODE6
--- status.system.NODE7
--- status.system.NODE8
--- status.system.NODE9
--- status.system.NODE10
--- status.system.NODE11
--- status.system.NODE12
--- status.system.NODE13
--- status.system.NODE14
---  --16,384 
--- ```
status.system.event = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system.EXTENSION_BIT
--- status.system.EXT
--- status.system.NODE1
--- status.system.NODE2
--- status.system.NODE3
--- status.system.NODE4
--- status.system.NODE5
--- status.system.NODE6
--- status.system.NODE7
--- status.system.NODE8
--- status.system.NODE9
--- status.system.NODE10
--- status.system.NODE11
--- status.system.NODE12
--- status.system.NODE13
--- status.system.NODE14
---  --16,384 
--- ```
status.system.ntr = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system.EXTENSION_BIT
--- status.system.EXT
--- status.system.NODE1
--- status.system.NODE2
--- status.system.NODE3
--- status.system.NODE4
--- status.system.NODE5
--- status.system.NODE6
--- status.system.NODE7
--- status.system.NODE8
--- status.system.NODE9
--- status.system.NODE10
--- status.system.NODE11
--- status.system.NODE12
--- status.system.NODE13
--- status.system.NODE14
---  --16,384 
--- ```
status.system.ptr = 0
---
---
---@class status.system2
status.system2 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system2.EXTENSION_BIT
--- status.system2.EXT
--- status.system2.NODE15
--- status.system2.NODE16
--- status.system2.NODE17
--- status.system2.NODE18
--- status.system2.NODE19
--- status.system2.NODE20
--- status.system2.NODE21
--- status.system2.NODE22
--- status.system2.NODE23
--- status.system2.NODE24
--- status.system2.NODE25
--- status.system2.NODE26
--- status.system2.NODE27
--- status.system2.NODE28
---  --16,384 
--- ```
status.system2.condition = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system2.EXTENSION_BIT
--- status.system2.EXT
--- status.system2.NODE15
--- status.system2.NODE16
--- status.system2.NODE17
--- status.system2.NODE18
--- status.system2.NODE19
--- status.system2.NODE20
--- status.system2.NODE21
--- status.system2.NODE22
--- status.system2.NODE23
--- status.system2.NODE24
--- status.system2.NODE25
--- status.system2.NODE26
--- status.system2.NODE27
--- status.system2.NODE28
---  --16,384 
--- ```
status.system2.enable = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system2.EXTENSION_BIT
--- status.system2.EXT
--- status.system2.NODE15
--- status.system2.NODE16
--- status.system2.NODE17
--- status.system2.NODE18
--- status.system2.NODE19
--- status.system2.NODE20
--- status.system2.NODE21
--- status.system2.NODE22
--- status.system2.NODE23
--- status.system2.NODE24
--- status.system2.NODE25
--- status.system2.NODE26
--- status.system2.NODE27
--- status.system2.NODE28
---  --16,384 
--- ```
status.system2.event = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system2.EXTENSION_BIT
--- status.system2.EXT
--- status.system2.NODE15
--- status.system2.NODE16
--- status.system2.NODE17
--- status.system2.NODE18
--- status.system2.NODE19
--- status.system2.NODE20
--- status.system2.NODE21
--- status.system2.NODE22
--- status.system2.NODE23
--- status.system2.NODE24
--- status.system2.NODE25
--- status.system2.NODE26
--- status.system2.NODE27
--- status.system2.NODE28
---  --16,384 
--- ```
status.system2.ntr = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system2.EXTENSION_BIT
--- status.system2.EXT
--- status.system2.NODE15
--- status.system2.NODE16
--- status.system2.NODE17
--- status.system2.NODE18
--- status.system2.NODE19
--- status.system2.NODE20
--- status.system2.NODE21
--- status.system2.NODE22
--- status.system2.NODE23
--- status.system2.NODE24
--- status.system2.NODE25
--- status.system2.NODE26
--- status.system2.NODE27
--- status.system2.NODE28
---  --16,384 
--- ```
status.system2.ptr = 0
---
---
---@class status.system3
status.system3 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system3.EXTENSION_BIT
--- status.system3.EXT
--- status.system3.NODE29
--- status.system3.NODE30
--- status.system3.NODE31
--- status.system3.NODE32
--- status.system3.NODE33
--- status.system3.NODE34
--- status.system3.NODE35
--- status.system3.NODE36
--- status.system3.NODE37
--- status.system3.NODE38
--- status.system3.NODE39
--- status.system3.NODE40
--- status.system3.NODE41
--- status.system3.NODE42
---  --16,384 
--- ```
status.system3.condition = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system3.EXTENSION_BIT
--- status.system3.EXT
--- status.system3.NODE29
--- status.system3.NODE30
--- status.system3.NODE31
--- status.system3.NODE32
--- status.system3.NODE33
--- status.system3.NODE34
--- status.system3.NODE35
--- status.system3.NODE36
--- status.system3.NODE37
--- status.system3.NODE38
--- status.system3.NODE39
--- status.system3.NODE40
--- status.system3.NODE41
--- status.system3.NODE42
---  --16,384 
--- ```
status.system3.enable = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system3.EXTENSION_BIT
--- status.system3.EXT
--- status.system3.NODE29
--- status.system3.NODE30
--- status.system3.NODE31
--- status.system3.NODE32
--- status.system3.NODE33
--- status.system3.NODE34
--- status.system3.NODE35
--- status.system3.NODE36
--- status.system3.NODE37
--- status.system3.NODE38
--- status.system3.NODE39
--- status.system3.NODE40
--- status.system3.NODE41
--- status.system3.NODE42
---  --16,384 
--- ```
status.system3.event = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system3.EXTENSION_BIT
--- status.system3.EXT
--- status.system3.NODE29
--- status.system3.NODE30
--- status.system3.NODE31
--- status.system3.NODE32
--- status.system3.NODE33
--- status.system3.NODE34
--- status.system3.NODE35
--- status.system3.NODE36
--- status.system3.NODE37
--- status.system3.NODE38
--- status.system3.NODE39
--- status.system3.NODE40
--- status.system3.NODE41
--- status.system3.NODE42
---  --16,384 
--- ```
status.system3.ntr = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system3.EXTENSION_BIT
--- status.system3.EXT
--- status.system3.NODE29
--- status.system3.NODE30
--- status.system3.NODE31
--- status.system3.NODE32
--- status.system3.NODE33
--- status.system3.NODE34
--- status.system3.NODE35
--- status.system3.NODE36
--- status.system3.NODE37
--- status.system3.NODE38
--- status.system3.NODE39
--- status.system3.NODE40
--- status.system3.NODE41
--- status.system3.NODE42
---  --16,384 
--- ```
status.system3.ptr = 0
---
---
---@class status.system4
status.system4 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system4.EXTENSION_BIT
--- status.system4.EXT
--- status.system4.NODE43
--- status.system4.NODE44
--- status.system4.NODE45
--- status.system4.NODE46
--- status.system4.NODE47
--- status.system4.NODE48
--- status.system4.NODE49
--- status.system4.NODE50
--- status.system4.NODE51
--- status.system4.NODE52
--- status.system4.NODE53
--- status.system4.NODE54
--- status.system4.NODE55
--- status.system4.NODE56
---  --16,384 
--- ```
status.system4.condition = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system4.EXTENSION_BIT
--- status.system4.EXT
--- status.system4.NODE43
--- status.system4.NODE44
--- status.system4.NODE45
--- status.system4.NODE46
--- status.system4.NODE47
--- status.system4.NODE48
--- status.system4.NODE49
--- status.system4.NODE50
--- status.system4.NODE51
--- status.system4.NODE52
--- status.system4.NODE53
--- status.system4.NODE54
--- status.system4.NODE55
--- status.system4.NODE56
---  --16,384 
--- ```
status.system4.enable = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system4.EXTENSION_BIT
--- status.system4.EXT
--- status.system4.NODE43
--- status.system4.NODE44
--- status.system4.NODE45
--- status.system4.NODE46
--- status.system4.NODE47
--- status.system4.NODE48
--- status.system4.NODE49
--- status.system4.NODE50
--- status.system4.NODE51
--- status.system4.NODE52
--- status.system4.NODE53
--- status.system4.NODE54
--- status.system4.NODE55
--- status.system4.NODE56
---  --16,384 
--- ```
status.system4.event = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system4.EXTENSION_BIT
--- status.system4.EXT
--- status.system4.NODE43
--- status.system4.NODE44
--- status.system4.NODE45
--- status.system4.NODE46
--- status.system4.NODE47
--- status.system4.NODE48
--- status.system4.NODE49
--- status.system4.NODE50
--- status.system4.NODE51
--- status.system4.NODE52
--- status.system4.NODE53
--- status.system4.NODE54
--- status.system4.NODE55
--- status.system4.NODE56
---  --16,384 
--- ```
status.system4.ntr = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.system4.EXTENSION_BIT
--- status.system4.EXT
--- status.system4.NODE43
--- status.system4.NODE44
--- status.system4.NODE45
--- status.system4.NODE46
--- status.system4.NODE47
--- status.system4.NODE48
--- status.system4.NODE49
--- status.system4.NODE50
--- status.system4.NODE51
--- status.system4.NODE52
--- status.system4.NODE53
--- status.system4.NODE54
--- status.system4.NODE55
--- status.system4.NODE56
---  --16,384 
--- ```
status.system4.ptr = 0
---
---
---@class status.system5
status.system5 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.system5.NODE57
--- status.system5.NODE58
--- status.system5.NODE59
--- status.system5.NODE60
--- status.system5.NODE61
--- status.system5.NODE62
--- status.system5.NODE63
--- status.system5.NODE64
---  --256 
--- ```
status.system5.condition = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.system5.NODE57
--- status.system5.NODE58
--- status.system5.NODE59
--- status.system5.NODE60
--- status.system5.NODE61
--- status.system5.NODE62
--- status.system5.NODE63
--- status.system5.NODE64
---  --256 
--- ```
status.system5.enable = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.system5.NODE57
--- status.system5.NODE58
--- status.system5.NODE59
--- status.system5.NODE60
--- status.system5.NODE61
--- status.system5.NODE62
--- status.system5.NODE63
--- status.system5.NODE64
---  --256 
--- ```
status.system5.event = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.system5.NODE57
--- status.system5.NODE58
--- status.system5.NODE59
--- status.system5.NODE60
--- status.system5.NODE61
--- status.system5.NODE62
--- status.system5.NODE63
--- status.system5.NODE64
---  --256 
--- ```
status.system5.ntr = 0


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.system5.NODE57
--- status.system5.NODE58
--- status.system5.NODE59
--- status.system5.NODE60
--- status.system5.NODE61
--- status.system5.NODE62
--- status.system5.NODE63
--- status.system5.NODE64
---  --256 
--- ```
status.system5.ptr = 0
---
---
---@class timer.measure
timer.measure = {}
---
---@type TriggerBlender[]
trigger.blender = {}
---
---@type TriggerGenerator[]
trigger.generator = {}
---
---@type TriggerTimer[]
trigger.timer = {}
---
---@type TspLinkTrigger[]
tsplink.trigger = {}
---
---
---@class tspnet.tsp
tspnet.tsp = {}


--- **This attribute contains the setting for abort on connect to a TSP-enabled instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting determines if the instrument sends an abort message when it attempts to connect to a TSP‑enabled instrument using the tspnet.connect() function.When you send the abort command on an interface, it causes any other active interface on that instrument to close. If you do not send an abort command (or if tspnet.tsp.abortonconnect is set to 0) and another interface is active, connecting to a TSP‑enabled remote instrument results in a connection. However, the instrument does not respond to subsequent reads or executes because control of the instrument is not obtained until an abort command has been sent.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abortonconnect = 0
---  --Configure the instrument so that it does not send an abort command when connecting to a TSP‑enabled instrument. 
--- ```
tspnet.tsp.abortonconnect = 0
---
---
---@class display.smua.limit
display.smua.limit = {}

display.LIMIT_IV = 0
display.LIMIT_P = 1
---@alias displaysmualimitfunc
---|`display.LIMIT_IV` #Displays the primary limit setting
---|`display.LIMIT_P` #Displays the power limit setting


--- **If you are using a display mode that shows a single channel, this attribute specifies the type of limit value setting displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the displayed limit function: primary (IV) or power (P).SMU A and SMU B can be set for different display functions.
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.limit.func = display.LIMIT_P
---  --Specifies the power limit value is displayed for SMU Channel A. 
--- ```
---@type displaysmualimitfunc
display.smua.limit.func = 0
---
---
---@class display.smub.limit
display.smub.limit = {}

display.LIMIT_IV = 0
display.LIMIT_P = 1
---@alias displaysmublimitfunc
---|`display.LIMIT_IV` #Displays the primary limit setting
---|`display.LIMIT_P` #Displays the power limit setting


--- **If you are using a display mode that shows a single channel, this attribute specifies the type of limit value setting displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the displayed limit function: primary (IV) or power (P).SMU A and SMU B can be set for different display functions.
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.limit.func = display.LIMIT_P
---  --Specifies the power limit value is displayed for SMU Channel A. 
--- ```
---@type displaysmublimitfunc
display.smub.limit.func = 0
---
---
---@class display.smua.measure
display.smua.measure = {}

display.MEASURE_DCAMPS = 0
display.MEASURE_DCVOLTS = 1
display.MEASURE_OHMS = 2
display.MEASURE_WATTS = 3
---@alias displaysmuameasurefunc
---|`display.MEASURE_DCAMPS` #Current measurement function
---|`display.MEASURE_DCVOLTS` #Voltage measurement function
---|`display.MEASURE_OHMS` #Resistance measurement function
---|`display.MEASURE_WATTS` #Power measurement function


--- **This attribute specifies the type of measurement that is being displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the measurement function that is displayed on the front panel: Amps, volts, ohms, or watts.SMU A and SMU B can be set for different measurement functions.
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.measure.func = display.MEASURE_DCAMPS
---  --Selects the current measure function for SMU A. 
--- ```
---@type displaysmuameasurefunc
display.smua.measure.func = 0
---
---
---@class display.smub.measure
display.smub.measure = {}

display.MEASURE_DCAMPS = 0
display.MEASURE_DCVOLTS = 1
display.MEASURE_OHMS = 2
display.MEASURE_WATTS = 3
---@alias displaysmubmeasurefunc
---|`display.MEASURE_DCAMPS` #Current measurement function
---|`display.MEASURE_DCVOLTS` #Voltage measurement function
---|`display.MEASURE_OHMS` #Resistance measurement function
---|`display.MEASURE_WATTS` #Power measurement function


--- **This attribute specifies the type of measurement that is being displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the measurement function that is displayed on the front panel: Amps, volts, ohms, or watts.SMU A and SMU B can be set for different measurement functions.
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.measure.func = display.MEASURE_DCAMPS
---  --Selects the current measure function for SMU A. 
--- ```
---@type displaysmubmeasurefunc
display.smub.measure.func = 0
---
---
---@class lan.config.dns
lan.config.dns = {}


--- **Configures DNS server IP addresses.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is an array of Domain Name System (DNS) server addresses. These addresses take priority for DNS lookups and are consulted before any server addresses that are obtained using DHCP. This allows local DNS servers to be specified that take priority over DHCP‑configured global DNS servers.You can specify up to two addresses. The address specified by 1 is consulted first for DNS lookups. dnsAddress must be a string specifying the IP address of the DNS server in dotted decimal notation.Unused entries are returned as "0.0.0.0" when read. To disable an entry, set its value to "0.0.0.0" or the empty string "".Although only two addresses may be manually specified here, the instrument uses up to three DNS server addresses. If two are specified here, only one that is given by a DHCP server is used. If no entries are specified here, up to three addresses that are given by a DHCP server are used.
---
---<br>*Examples:*<br>
--- ```lua
--- dnsaddress = "164.109.48.173"
--- lan.config.dns.address[1] = dnsaddress
---  --Set the DNS address 1 to 164.109.48.173. 
--- ```
---@type integer[]
lan.config.dns.address = 0


--- **Configures the dynamic DNS domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute holds the domain to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the domain specified in this attribute with the DNS server.The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 255 characters are allowed, you must make sure the combined length is also no more than 255 characters.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.domain)
---  --Outputs the present dynamic DNS domain. For example, if the domain is "Matrix", the response is: 
--- ```
lan.config.dns.domain = 0

lan.ENABLE = 1
lan.DISABLE = 0
---@alias lanconfigdnsdynamic
---|`lan.ENABLE` #Enabled
---|`lan.DISABLE` #Disabled


--- **Enables or disables the dynamic DNS registration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Dynamic DNS registration works with DHCP to register the host name with the DNS server. The host name is specified in the lan.config.dns.hostname attribute.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.dynamic)
---  --Outputs the dynamic registration state. If dynamic DNS registration is enabled, the response is: 
--- ```
---@type lanconfigdnsdynamic
lan.config.dns.dynamic = 0


--- **This attribute defines the dynamic DNS host name.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute holds the host name to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the host name specified in this attribute with the DNS server.The factory default value for hostName is "k‑<model number>‑<serial number>", where <model number> and <serial number> are replaced with the actual model number and serial number of the instrument (for example, "k‑2602B‑1234567"). Note that hyphens separate the characters of hostName. The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 63 characters can be entered here, you must make sure the combined length is no more than 255 characters.Setting this attribute to an empty string (in other words, setting this attribute to a string of length zero or a string that consists entirely of whitespace characters) reverts the host name to the factory default value.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.hostname)
---  --Outputs the present dynamic DNS host name. 
--- ```
lan.config.dns.hostname = 0

lan.ENABLE = 1
lan.DISABLE = 0
---@alias lanconfigdnsverify
---|`lan.ENABLE` #DNS host name verification enabled
---|`lan.DISABLE` #DNS host name verification disabled


--- **This attribute defines the DNS host name verification state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is enabled, the instrument performs DNS lookups to verify that the DNS host name matches the value specified by lan.config.dns.hostname.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.verify)
---  --Outputs the present DNS host name verification state. If it is enabled, the output is: 
--- ```
---@type lanconfigdnsverify
lan.config.dns.verify = 0
---
---
---@class lan.status.dns
lan.status.dns = {}


--- **This attribute contains the DNS server IP addresses.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is an array of DNS server addresses. The instrument can use up to three addresses.Unused or disabled entries are returned as "0.0.0.0" when read. The dnsAddress returned is a string specifying the IP address of the DNS server in dotted decimal notation.You can only specify two addresses manually. However, the instrument uses up to three DNS server addresses. If two are specified, only the one given by a DHCP server is used. If no entries are specified, up to three address given by a DHCP server are used.The value of lan.status.dns.address[1] is referenced first for all DNS lookups. The values of lan.status.dns.address[2] and lan.status.dns.address[3] are referenced second and third, respectively.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.dns.address[1])
---  --Outputs DNS server address 1, for example: 
--- ```
---@type integer[]
lan.status.dns.address = 0


--- **This attribute contains the present DNS fully qualified host name.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- A fully qualified domain name (FQDN) specifies its exact location in the tree hierarchy of the Domain Name System (DNS).A FQDN is the complete domain name for a specific computer or host on the LAN. The FQDN consists of two parts: The host name and the domain name.If the DNS host name for an instrument is not found, this attribute stores the IP address in dotted decimal notation.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.dns.name)
---  --Outputs the dynamic DNS host name. 
--- ```
lan.status.dns.name = 0
---
---
---@class lan.status.port
lan.status.port = {}


--- **This attribute contains the LAN dead socket termination port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute holds the TCP port number used to reset all other LAN socket connections.To reset all LAN connections, open a connection to the DST port number.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.dst)
---  --Outputs the LAN dead socket termination port number, such as: 
--- ```
lan.status.port.dst = 0


--- **This attribute contains the LAN raw socket connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The TCP port number used to connect the instrument and to control the instrument over a raw socket communication interface.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.rawsocket)
---  --Outputs the LAN raw socket port number, such as: 
--- ```
lan.status.port.rawsocket = 0


--- **This attribute contains the LAN Telnet connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute holds the TCP port number used to connect to the instrument to control it over a Telnet interface.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.telnet)
---  --Get the LAN Telnet connection port number. Output: 
--- ```
lan.status.port.telnet = 0


--- **This attribute contains the LAN VXI-11 connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute stores the TCP port number used to connect to the instrument over a VXI-11 interface.
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.vxi11)
---  --Outputs the VXI-11 number, such as: 
--- ```
lan.status.port.vxi11 = 0
---
---
---@class smua.measure.filter
smua.measure.filter = {}


--- **This command sets the number of measured readings that are required to yield one filtered measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the size of the stack used for filtered measurements.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
---  --Sets the filter count for SMU channel A to 10. Sets the filter type to moving average. Enables the filter. 
--- ```
smua.measure.filter.count = 0

smua.FILTER_OFF = 0
smua.FILTER_ON = 1
---@alias smuameasurefilterenable
---|`smua.FILTER_OFF` #Disables the filter
---|`smua.FILTER_ON` #Enables the filter


--- **This command enables or disables filtered measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the filter.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
---  --Sets the filter count for SMU channel A to 10. Sets the filter type to moving average. Enables the filter. 
--- ```
---@type smuameasurefilterenable
smua.measure.filter.enable = 0

smua.FILTER_MOVING_AVG = 0
smua.FILTER_REPEAT_AVG = 1
smua.FILTER_MEDIAN = 2
---@alias smuameasurefiltertype
---|`smua.FILTER_MOVING_AVG` #Selects the moving filter
---|`smua.FILTER_REPEAT_AVG` #Selects the repeat filter
---|`smua.FILTER_MEDIAN` #Selects the median filter


--- **This command sets the type of filter used for measurements when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The 2600B provides a moving average, repeating average, and median filter type.For the repeating filter, the stack (filter count) is filled, and the conversions are averaged to yield a reading. The stack is then cleared, and the process starts over. The moving average filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the measurement conversions are averaged, yielding a reading. For each subsequent conversion placed into the stack, the oldest conversion is discarded. The stack is re-averaged, yielding a new reading.The median filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the reading nearest to the middle is returned. For each subsequent conversion placed into the stack, the oldest reading is discarded. The stack is then re-sorted, yielding a new reading. If the filter count is an even number, the reading returned is the average of the two middle readings.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
---  --Sets the filter count for SMU channel A to 10. Sets the filter type to moving average. Enables the filter. 
--- ```
---@type smuameasurefiltertype
smua.measure.filter.type = 0
---
---
---@class smub.measure.filter
smub.measure.filter = {}


--- **This command sets the number of measured readings that are required to yield one filtered measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the size of the stack used for filtered measurements.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
---  --Sets the filter count for SMU channel A to 10. Sets the filter type to moving average. Enables the filter. 
--- ```
smub.measure.filter.count = 0

smub.FILTER_OFF = 0
smub.FILTER_ON = 1
---@alias smubmeasurefilterenable
---|`smub.FILTER_OFF` #Disables the filter
---|`smub.FILTER_ON` #Enables the filter


--- **This command enables or disables filtered measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the filter.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
---  --Sets the filter count for SMU channel A to 10. Sets the filter type to moving average. Enables the filter. 
--- ```
---@type smubmeasurefilterenable
smub.measure.filter.enable = 0

smub.FILTER_MOVING_AVG = 0
smub.FILTER_REPEAT_AVG = 1
smub.FILTER_MEDIAN = 2
---@alias smubmeasurefiltertype
---|`smub.FILTER_MOVING_AVG` #Selects the moving filter
---|`smub.FILTER_REPEAT_AVG` #Selects the repeat filter
---|`smub.FILTER_MEDIAN` #Selects the median filter


--- **This command sets the type of filter used for measurements when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The 2600B provides a moving average, repeating average, and median filter type.For the repeating filter, the stack (filter count) is filled, and the conversions are averaged to yield a reading. The stack is then cleared, and the process starts over. The moving average filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the measurement conversions are averaged, yielding a reading. For each subsequent conversion placed into the stack, the oldest conversion is discarded. The stack is re-averaged, yielding a new reading.The median filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the reading nearest to the middle is returned. For each subsequent conversion placed into the stack, the oldest reading is discarded. The stack is then re-sorted, yielding a new reading. If the filter count is an even number, the reading returned is the average of the two middle readings.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
---  --Sets the filter count for SMU channel A to 10. Sets the filter type to moving average. Enables the filter. 
--- ```
---@type smubmeasurefiltertype
smub.measure.filter.type = 0
---
---
---@class smua.measure.rel
smua.measure.rel = {}

smua.REL_OFF = 0
smua.REL_ON = 1
---@alias smuameasurerelenablev
---|`smua.REL_OFF` #Disables relative measurements
---|`smua.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smuameasurerelenablev
smua.measure.rel.enablev = 0

smua.REL_OFF = 0
smua.REL_ON = 1
---@alias smuameasurerelenablei
---|`smua.REL_OFF` #Disables relative measurements
---|`smua.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smuameasurerelenablei
smua.measure.rel.enablei = 0

smua.REL_OFF = 0
smua.REL_ON = 1
---@alias smuameasurerelenabler
---|`smua.REL_OFF` #Disables relative measurements
---|`smua.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smuameasurerelenabler
smua.measure.rel.enabler = 0

smua.REL_OFF = 0
smua.REL_ON = 1
---@alias smuameasurerelenablep
---|`smua.REL_OFF` #Disables relative measurements
---|`smua.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smuameasurerelenablep
smua.measure.rel.enablep = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smua.measure.rel.levelv = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smua.measure.rel.leveli = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smua.measure.rel.levelr = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smua.measure.rel.levelp = 0
---
---
---@class smub.measure.rel
smub.measure.rel = {}

smub.REL_OFF = 0
smub.REL_ON = 1
---@alias smubmeasurerelenablev
---|`smub.REL_OFF` #Disables relative measurements
---|`smub.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smubmeasurerelenablev
smub.measure.rel.enablev = 0

smub.REL_OFF = 0
smub.REL_ON = 1
---@alias smubmeasurerelenablei
---|`smub.REL_OFF` #Disables relative measurements
---|`smub.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smubmeasurerelenablei
smub.measure.rel.enablei = 0

smub.REL_OFF = 0
smub.REL_ON = 1
---@alias smubmeasurerelenabler
---|`smub.REL_OFF` #Disables relative measurements
---|`smub.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smubmeasurerelenabler
smub.measure.rel.enabler = 0

smub.REL_OFF = 0
smub.REL_ON = 1
---@alias smubmeasurerelenablep
---|`smub.REL_OFF` #Disables relative measurements
---|`smub.REL_ON` #Enables relative measurements


--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
---  --Enables relative voltage measurements for SMU channel A. 
--- ```
---@type smubmeasurerelenablep
smub.measure.rel.enablep = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smub.measure.rel.levelv = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smub.measure.rel.leveli = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smub.measure.rel.levelr = 0


--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
---  --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value. 
--- ```
smub.measure.rel.levelp = 0
---
---
---@class smua.trigger.arm
smua.trigger.arm = {}


--- **This attribute sets the arm count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the arm layer of the trigger model this many times. After performing this many iterations, the SMU returns to an idle state.If this count is set to zero, the SMU stays in the trigger model indefinitely until aborted.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.count = 5
---  --Sets the SMU channel A to iterate through the arm layer of the trigger model five times and then return to the idle state. 
--- ```
smua.trigger.arm.count = 0


--- **This attribute selects the event that causes the arm event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event.Set this attribute to zero to bypass waiting for events at the arm event detector (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.stimulus = trigger.timer[1].EVENT_ID
---  --An event on trigger timer 1 causes the arm event detector to enter the detected state. 
--- ```
---@type eventID|0
smua.trigger.arm.stimulus= 0
---
---
---@class smub.trigger.arm
smub.trigger.arm = {}


--- **This attribute sets the arm count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the arm layer of the trigger model this many times. After performing this many iterations, the SMU returns to an idle state.If this count is set to zero, the SMU stays in the trigger model indefinitely until aborted.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.count = 5
---  --Sets the SMU channel A to iterate through the arm layer of the trigger model five times and then return to the idle state. 
--- ```
smub.trigger.arm.count = 0


--- **This attribute selects the event that causes the arm event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event.Set this attribute to zero to bypass waiting for events at the arm event detector (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.stimulus = trigger.timer[1].EVENT_ID
---  --An event on trigger timer 1 causes the arm event detector to enter the detected state. 
--- ```
---@type eventID|0
smub.trigger.arm.stimulus= 0
---
---
---@class smua.trigger.endpulse
smua.trigger.endpulse = {}

smua.SOURCE_IDLE = 0
smua.SOURCE_HOLD = 1
---@alias smuatriggerendpulseaction
---|`smua.SOURCE_IDLE` #
---|`smua.SOURCE_HOLD` #


--- **This attribute enables or disables pulse mode sweeps.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When set to smuX.SOURCE_HOLD, this attribute disables pulse mode sweeps, holding the source level for the remainder of the step. When set to smuX.SOURCE_IDLE, this attribute enables pulse mode sweeps, setting the source level to the programmed (idle) level at the end of the pulse.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
---  --Configure the end pulse action to achieve a pulse and configure trigger timer 1 to control the end of pulse. 
--- ```
---@type smuatriggerendpulseaction
smua.trigger.endpulse.action = 0


--- **This attribute defines which event causes the end pulse event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. To bypass waiting for an event, set this value of this attribute to 0. Set eventID to one of the existing trigger event IDs, which are shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
---  --Configure the end pulse action to achieve a pulse and select the event, trigger.timer[1].EVENT_ID, that causes the arm event detector to enter the detected state. 
--- ```
---@type eventID|0
smua.trigger.endpulse.stimulus= 0
---
---
---@class smub.trigger.endpulse
smub.trigger.endpulse = {}

smub.SOURCE_IDLE = 0
smub.SOURCE_HOLD = 1
---@alias smubtriggerendpulseaction
---|`smub.SOURCE_IDLE` #
---|`smub.SOURCE_HOLD` #


--- **This attribute enables or disables pulse mode sweeps.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When set to smuX.SOURCE_HOLD, this attribute disables pulse mode sweeps, holding the source level for the remainder of the step. When set to smuX.SOURCE_IDLE, this attribute enables pulse mode sweeps, setting the source level to the programmed (idle) level at the end of the pulse.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
---  --Configure the end pulse action to achieve a pulse and configure trigger timer 1 to control the end of pulse. 
--- ```
---@type smubtriggerendpulseaction
smub.trigger.endpulse.action = 0


--- **This attribute defines which event causes the end pulse event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. To bypass waiting for an event, set this value of this attribute to 0. Set eventID to one of the existing trigger event IDs, which are shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
---  --Configure the end pulse action to achieve a pulse and select the event, trigger.timer[1].EVENT_ID, that causes the arm event detector to enter the detected state. 
--- ```
---@type eventID|0
smub.trigger.endpulse.stimulus= 0
---
---
---@class smua.trigger.endsweep
smua.trigger.endsweep = {}

smua.SOURCE_IDLE = 0
smua.SOURCE_HOLD = 1
---@alias smuatriggerendsweepaction
---|`smua.SOURCE_IDLE` #Sets the source level to the programmed (idle) level at the end of the sweep
---|`smua.SOURCE_HOLD` #Sets the source level to stay at the level of the last step


--- **This attribute sets the action of the source at the end of a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to configure the source action at the end of the sweep. The SMU can be programmed to return to the idle source level or hold the last value of the sweep.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endsweep.action = smua.SOURCE_IDLE
---  --Sets SMU channel A to return the source back to the idle source level at the end of a sweep. 
--- ```
---@type smuatriggerendsweepaction
smua.trigger.endsweep.action = 0
---
---
---@class smub.trigger.endsweep
smub.trigger.endsweep = {}

smub.SOURCE_IDLE = 0
smub.SOURCE_HOLD = 1
---@alias smubtriggerendsweepaction
---|`smub.SOURCE_IDLE` #Sets the source level to the programmed (idle) level at the end of the sweep
---|`smub.SOURCE_HOLD` #Sets the source level to stay at the level of the last step


--- **This attribute sets the action of the source at the end of a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to configure the source action at the end of the sweep. The SMU can be programmed to return to the idle source level or hold the last value of the sweep.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endsweep.action = smua.SOURCE_IDLE
---  --Sets SMU channel A to return the source back to the idle source level at the end of a sweep. 
--- ```
---@type smubtriggerendsweepaction
smub.trigger.endsweep.action = 0
---
---
---@class smua.trigger.measure
smua.trigger.measure = {}

smua.DISABLE = 0
smua.ENABLE = 1
smua.ASYNC = 2
---@alias smuatriggermeasureaction
---|`smua.DISABLE` #Do not make measurements during the sweep
---|`smua.ENABLE` #Make measurements during the sweep
---|`smua.ASYNC` #Make measurements during the sweep, but asynchronously with the source area of the trigger model


--- **This attribute controls measurement actions during a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- With this attribute enabled (setting action to smuX.ENABLE or smuX.ASYNC), configure the measurement with one of the smuX.trigger.measure.Y() functions.If this attribute is set to smuX.ASYNC:If any of the above items is incorrectly configured, the smuX.trigger.initiate() function generates an error.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(smua.nvbuffer1)
--- smua.trigger.measure.action = smua.ENABLE
---  --Configure sweep voltage measurements. Enable voltage measurements during the sweep. 
--- ```
---@type smuatriggermeasureaction
smua.trigger.measure.action = 0


--- **This attribute selects the event that causes the measure event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the measurement event detector portion of the trigger model.Set this attribute to zero to bypass waiting for an event (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.stimulus = trigger.timer[1].EVENT_ID
---  --Sets delay before measurement begins on SMU channel A. 
--- ```
---@type eventID|0
smua.trigger.measure.stimulus= 0
---
---
---@class smub.trigger.measure
smub.trigger.measure = {}

smub.DISABLE = 0
smub.ENABLE = 1
smub.ASYNC = 2
---@alias smubtriggermeasureaction
---|`smub.DISABLE` #Do not make measurements during the sweep
---|`smub.ENABLE` #Make measurements during the sweep
---|`smub.ASYNC` #Make measurements during the sweep, but asynchronously with the source area of the trigger model


--- **This attribute controls measurement actions during a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- With this attribute enabled (setting action to smuX.ENABLE or smuX.ASYNC), configure the measurement with one of the smuX.trigger.measure.Y() functions.If this attribute is set to smuX.ASYNC:If any of the above items is incorrectly configured, the smuX.trigger.initiate() function generates an error.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(smua.nvbuffer1)
--- smua.trigger.measure.action = smua.ENABLE
---  --Configure sweep voltage measurements. Enable voltage measurements during the sweep. 
--- ```
---@type smubtriggermeasureaction
smub.trigger.measure.action = 0


--- **This attribute selects the event that causes the measure event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the measurement event detector portion of the trigger model.Set this attribute to zero to bypass waiting for an event (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.stimulus = trigger.timer[1].EVENT_ID
---  --Sets delay before measurement begins on SMU channel A. 
--- ```
---@type eventID|0
smub.trigger.measure.stimulus= 0
---
---
---@class smua.trigger.source
smua.trigger.source = {}

smua.DISABLE = 0
smua.ENABLE = 1
---@alias smuatriggersourceaction
---|`smua.DISABLE` #Do not sweep the source
---|`smua.ENABLE` #Sweep the source


--- **This attribute enables or disables sweeping the source (on or off).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to enable or disable source level changes during a sweep. In addition to enabling the action before initiating the sweep, make sure to configure it using smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- smua.trigger.source.action = smua.ENABLE
---  --Configure list sweep for SMU channel A (sweep through 3 V, 1 V, 4 V, 5 V, and 2 V). Enable the source action. 
--- ```
---@type smuatriggersourceaction
smua.trigger.source.action = 0


--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
---  --Sets the voltage sweep limit to 10 V. 
--- ```
smua.trigger.source.limitv = 0


--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
---  --Sets the voltage sweep limit to 10 V. 
--- ```
smua.trigger.source.limiti = 0


--- **This attribute defines which event causes the source event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the source event detector portion of the trigger model. To bypass waiting for an event, set the value of this attribute to zero (0). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
---  --Configure SMU channel A to start its source action when a trigger event occurs on digital I/O line 2. 
--- ```
---@type eventID|0
smua.trigger.source.stimulus= 0
---
---
---@class smub.trigger.source
smub.trigger.source = {}

smub.DISABLE = 0
smub.ENABLE = 1
---@alias smubtriggersourceaction
---|`smub.DISABLE` #Do not sweep the source
---|`smub.ENABLE` #Sweep the source


--- **This attribute enables or disables sweeping the source (on or off).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to enable or disable source level changes during a sweep. In addition to enabling the action before initiating the sweep, make sure to configure it using smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- smua.trigger.source.action = smua.ENABLE
---  --Configure list sweep for SMU channel A (sweep through 3 V, 1 V, 4 V, 5 V, and 2 V). Enable the source action. 
--- ```
---@type smubtriggersourceaction
smub.trigger.source.action = 0


--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
---  --Sets the voltage sweep limit to 10 V. 
--- ```
smub.trigger.source.limitv = 0


--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
---  --Sets the voltage sweep limit to 10 V. 
--- ```
smub.trigger.source.limiti = 0


--- **This attribute defines which event causes the source event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the source event detector portion of the trigger model. To bypass waiting for an event, set the value of this attribute to zero (0). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
---  --Configure SMU channel A to start its source action when a trigger event occurs on digital I/O line 2. 
--- ```
---@type eventID|0
smub.trigger.source.stimulus= 0
---
---
---@class status.measurement.buffer_available
status.measurement.buffer_available = {}


--- **This attribute contains the measurement event buffer available summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
---  --Sets the SMUA bit of the measurement event buffer available summary enable register. 
--- ```
status.measurement.buffer_available.condition = 0


--- **This attribute contains the measurement event buffer available summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
---  --Sets the SMUA bit of the measurement event buffer available summary enable register. 
--- ```
status.measurement.buffer_available.enable = 0


--- **This attribute contains the measurement event buffer available summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
---  --Sets the SMUA bit of the measurement event buffer available summary enable register. 
--- ```
status.measurement.buffer_available.event = 0


--- **This attribute contains the measurement event buffer available summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
---  --Sets the SMUA bit of the measurement event buffer available summary enable register. 
--- ```
status.measurement.buffer_available.ntr = 0


--- **This attribute contains the measurement event buffer available summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
---  --Sets the SMUA bit of the measurement event buffer available summary enable register. 
--- ```
status.measurement.buffer_available.ptr = 0
---
---
---@class status.measurement.current_limit
status.measurement.current_limit = {}


--- **This attribute contains the measurement event current limit summary registers. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
---  --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register. 
--- ```
status.measurement.current_limit.condition = 0


--- **This attribute contains the measurement event current limit summary registers.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
---  --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register. 
--- ```
status.measurement.current_limit.enable = 0


--- **This attribute contains the measurement event current limit summary registers.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
---  --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register. 
--- ```
status.measurement.current_limit.event = 0


--- **This attribute contains the measurement event current limit summary registers.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
---  --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register. 
--- ```
status.measurement.current_limit.ntr = 0


--- **This attribute contains the measurement event current limit summary registers.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
---  --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register. 
--- ```
status.measurement.current_limit.ptr = 0
---
---
---@class status.measurement.instrument
status.measurement.instrument = {}


--- **This attribute contains the registers of the measurement event instrument summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
---  --Sets the SMU A bit of the measurement event instrument summary enable register using a constant. 
--- ```
status.measurement.instrument.condition = 0


--- **This attribute contains the registers of the measurement event instrument summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
---  --Sets the SMU A bit of the measurement event instrument summary enable register using a constant. 
--- ```
status.measurement.instrument.enable = 0


--- **This attribute contains the registers of the measurement event instrument summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
---  --Sets the SMU A bit of the measurement event instrument summary enable register using a constant. 
--- ```
status.measurement.instrument.event = 0


--- **This attribute contains the registers of the measurement event instrument summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
---  --Sets the SMU A bit of the measurement event instrument summary enable register using a constant. 
--- ```
status.measurement.instrument.ntr = 0


--- **This attribute contains the registers of the measurement event instrument summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
---  --Sets the SMU A bit of the measurement event instrument summary enable register using a constant. 
--- ```
status.measurement.instrument.ptr = 0
---
---
---@class status.measurement.reading_overflow
status.measurement.reading_overflow = {}


--- **This attribute contains the measurement event reading overflow summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
---  --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant. 
--- ```
status.measurement.reading_overflow.condition = 0


--- **This attribute contains the measurement event reading overflow summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
---  --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant. 
--- ```
status.measurement.reading_overflow.enable = 0


--- **This attribute contains the measurement event reading overflow summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
---  --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant. 
--- ```
status.measurement.reading_overflow.event = 0


--- **This attribute contains the measurement event reading overflow summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
---  --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant. 
--- ```
status.measurement.reading_overflow.ntr = 0


--- **This attribute contains the measurement event reading overflow summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
---  --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant. 
--- ```
status.measurement.reading_overflow.ptr = 0
---
---
---@class status.measurement.voltage_limit
status.measurement.voltage_limit = {}


--- **This attribute contains the measurement event voltage limit summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
---  --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant. 
--- ```
status.measurement.voltage_limit.condition = 0


--- **This attribute contains the measurement event voltage limit summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
---  --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant. 
--- ```
status.measurement.voltage_limit.enable = 0


--- **This attribute contains the measurement event voltage limit summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
---  --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant. 
--- ```
status.measurement.voltage_limit.event = 0


--- **This attribute contains the measurement event voltage limit summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
---  --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant. 
--- ```
status.measurement.voltage_limit.ntr = 0


--- **This attribute contains the measurement event voltage limit summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
---  --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant. 
--- ```
status.measurement.voltage_limit.ptr = 0
---
---
---@class status.operation.calibrating
status.operation.calibrating = {}


--- **This attribute contains the operation status calibration summary register set.   A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
---  --Sets the SMUA bit of the operation status calibration summary enable register using a constant. 
--- ```
status.operation.calibrating.condition = 0


--- **This attribute contains the operation status calibration summary register set.  A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
---  --Sets the SMUA bit of the operation status calibration summary enable register using a constant. 
--- ```
status.operation.calibrating.enable = 0


--- **This attribute contains the operation status calibration summary register set.  A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
---  --Sets the SMUA bit of the operation status calibration summary enable register using a constant. 
--- ```
status.operation.calibrating.event = 0


--- **This attribute contains the operation status calibration summary register set.  When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
---  --Sets the SMUA bit of the operation status calibration summary enable register using a constant. 
--- ```
status.operation.calibrating.ntr = 0


--- **This attribute contains the operation status calibration summary register set.  When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
---  --Sets the SMUA bit of the operation status calibration summary enable register using a constant. 
--- ```
status.operation.calibrating.ptr = 0
---
---
---@class status.operation.instrument
status.operation.instrument = {}


--- **This attribute contains the operation status instrument summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
---  --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants. 
--- ```
status.operation.instrument.condition = 0


--- **This attribute contains the operation status instrument summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
---  --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants. 
--- ```
status.operation.instrument.enable = 0


--- **This attribute contains the operation status instrument summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
---  --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants. 
--- ```
status.operation.instrument.event = 0


--- **This attribute contains the operation status instrument summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
---  --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants. 
--- ```
status.operation.instrument.ntr = 0


--- **This attribute contains the operation status instrument summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
---  --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants. 
--- ```
status.operation.instrument.ptr = 0
---
---
---@class status.operation.measuring
status.operation.measuring = {}


--- **This attribute contains the operation status measuring summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.SMUA
--- status.operation.measuring.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. This bit is set when SMU B is making an overlapped measurement, but it is not set when making a normal synchronous measurement. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.measuring.condition = 0


--- **This attribute contains the operation status measuring summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.SMUA
--- status.operation.measuring.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. This bit is set when SMU B is making an overlapped measurement, but it is not set when making a normal synchronous measurement. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.measuring.enable = 0


--- **This attribute contains the operation status measuring summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.SMUA
--- status.operation.measuring.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. This bit is set when SMU B is making an overlapped measurement, but it is not set when making a normal synchronous measurement. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.measuring.event = 0


--- **This attribute contains the operation status measuring summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.SMUA
--- status.operation.measuring.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. This bit is set when SMU B is making an overlapped measurement, but it is not set when making a normal synchronous measurement. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.measuring.ntr = 0


--- **This attribute contains the operation status measuring summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.SMUA
--- status.operation.measuring.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. This bit is set when SMU B is making an overlapped measurement, but it is not set when making a normal synchronous measurement. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.measuring.ptr = 0
---
---
---@class status.operation.remote
status.operation.remote = {}


--- **This attribute contains the operation status remote summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.COMMAND_AVAILABLE
--- status.operation.remote.CAV
--- status.operation.remote.PROMPTS_ENABLED
--- status.operation.remote.PRMPT
---  --
--- ```
status.operation.remote.condition = 0


--- **This attribute contains the operation status remote summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.COMMAND_AVAILABLE
--- status.operation.remote.CAV
--- status.operation.remote.PROMPTS_ENABLED
--- status.operation.remote.PRMPT
---  --
--- ```
status.operation.remote.enable = 0


--- **This attribute contains the operation status remote summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.COMMAND_AVAILABLE
--- status.operation.remote.CAV
--- status.operation.remote.PROMPTS_ENABLED
--- status.operation.remote.PRMPT
---  --
--- ```
status.operation.remote.event = 0


--- **This attribute contains the operation status remote summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.COMMAND_AVAILABLE
--- status.operation.remote.CAV
--- status.operation.remote.PROMPTS_ENABLED
--- status.operation.remote.PRMPT
---  --
--- ```
status.operation.remote.ntr = 0


--- **This attribute contains the operation status remote summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.COMMAND_AVAILABLE
--- status.operation.remote.CAV
--- status.operation.remote.PROMPTS_ENABLED
--- status.operation.remote.PRMPT
---  --
--- ```
status.operation.remote.ptr = 0
---
---
---@class status.operation.sweeping
status.operation.sweeping = {}


--- **This attribute contains the operation status sweeping summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.SMUA
--- status.operation.sweeping.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates SMU B is sweeping. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.sweeping.condition = 0


--- **This attribute contains the operation status sweeping summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.SMUA
--- status.operation.sweeping.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates SMU B is sweeping. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.sweeping.enable = 0


--- **This attribute contains the operation status sweeping summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.SMUA
--- status.operation.sweeping.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates SMU B is sweeping. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.sweeping.event = 0


--- **This attribute contains the operation status sweeping summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.SMUA
--- status.operation.sweeping.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates SMU B is sweeping. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.sweeping.ntr = 0


--- **This attribute contains the operation status sweeping summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.SMUA
--- status.operation.sweeping.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates SMU B is sweeping. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.operation.sweeping.ptr = 0
---
---
---@class status.operation.trigger_overrun
status.operation.trigger_overrun = {}


--- **This attribute contains the operation status trigger overrun summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.trigger_overrun.SMUA
--- status.operation.trigger_overrun.SMUB
--- status.operation.trigger_overrun.TRIGGER_BLENDER
--- status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.TRIGGER_TIMER
--- status.operation.trigger_overrun.TRGTMR
--- status.operation.trigger_overrun.DIGITAL_IO
--- status.operation.trigger_overrun.DIGIO
--- status.operation.trigger_overrun.TSPLINK
--- status.operation.trigger_overrun.LAN
---  --Set bit indicates one of the enabled bits in the operation status LAN trigger overrun event register is set. Bit B14 decimal value: 16,384 
--- ```
status.operation.trigger_overrun.condition = 0


--- **This attribute contains the operation status trigger overrun summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.trigger_overrun.SMUA
--- status.operation.trigger_overrun.SMUB
--- status.operation.trigger_overrun.TRIGGER_BLENDER
--- status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.TRIGGER_TIMER
--- status.operation.trigger_overrun.TRGTMR
--- status.operation.trigger_overrun.DIGITAL_IO
--- status.operation.trigger_overrun.DIGIO
--- status.operation.trigger_overrun.TSPLINK
--- status.operation.trigger_overrun.LAN
---  --Set bit indicates one of the enabled bits in the operation status LAN trigger overrun event register is set. Bit B14 decimal value: 16,384 
--- ```
status.operation.trigger_overrun.enable = 0


--- **This attribute contains the operation status trigger overrun summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.trigger_overrun.SMUA
--- status.operation.trigger_overrun.SMUB
--- status.operation.trigger_overrun.TRIGGER_BLENDER
--- status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.TRIGGER_TIMER
--- status.operation.trigger_overrun.TRGTMR
--- status.operation.trigger_overrun.DIGITAL_IO
--- status.operation.trigger_overrun.DIGIO
--- status.operation.trigger_overrun.TSPLINK
--- status.operation.trigger_overrun.LAN
---  --Set bit indicates one of the enabled bits in the operation status LAN trigger overrun event register is set. Bit B14 decimal value: 16,384 
--- ```
status.operation.trigger_overrun.event = 0


--- **This attribute contains the operation status trigger overrun summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.trigger_overrun.SMUA
--- status.operation.trigger_overrun.SMUB
--- status.operation.trigger_overrun.TRIGGER_BLENDER
--- status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.TRIGGER_TIMER
--- status.operation.trigger_overrun.TRGTMR
--- status.operation.trigger_overrun.DIGITAL_IO
--- status.operation.trigger_overrun.DIGIO
--- status.operation.trigger_overrun.TSPLINK
--- status.operation.trigger_overrun.LAN
---  --Set bit indicates one of the enabled bits in the operation status LAN trigger overrun event register is set. Bit B14 decimal value: 16,384 
--- ```
status.operation.trigger_overrun.ntr = 0


--- **This attribute contains the operation status trigger overrun summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.trigger_overrun.SMUA
--- status.operation.trigger_overrun.SMUB
--- status.operation.trigger_overrun.TRIGGER_BLENDER
--- status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.TRIGGER_TIMER
--- status.operation.trigger_overrun.TRGTMR
--- status.operation.trigger_overrun.DIGITAL_IO
--- status.operation.trigger_overrun.DIGIO
--- status.operation.trigger_overrun.TSPLINK
--- status.operation.trigger_overrun.LAN
---  --Set bit indicates one of the enabled bits in the operation status LAN trigger overrun event register is set. Bit B14 decimal value: 16,384 
--- ```
status.operation.trigger_overrun.ptr = 0
---
---
---@class status.operation.user
status.operation.user = {}


--- **These attributes manage the operation status user register set of the status model. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.user.BIT0
--- status.operation.user.BIT1
--- status.operation.user.BIT2
--- status.operation.user.BIT3
--- status.operation.user.BIT4
--- status.operation.user.BIT5
--- status.operation.user.BIT6
--- status.operation.user.BIT7
--- status.operation.user.BIT8
--- status.operation.user.BIT9
--- status.operation.user.BIT10
--- status.operation.user.BIT11
--- status.operation.user.BIT12
--- status.operation.user.BIT13
--- status.operation.user.BIT14
---  --16,384 
--- ```
status.operation.user.condition = 0


--- **These attributes manage the operation status user register set of the status model.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.user.BIT0
--- status.operation.user.BIT1
--- status.operation.user.BIT2
--- status.operation.user.BIT3
--- status.operation.user.BIT4
--- status.operation.user.BIT5
--- status.operation.user.BIT6
--- status.operation.user.BIT7
--- status.operation.user.BIT8
--- status.operation.user.BIT9
--- status.operation.user.BIT10
--- status.operation.user.BIT11
--- status.operation.user.BIT12
--- status.operation.user.BIT13
--- status.operation.user.BIT14
---  --16,384 
--- ```
status.operation.user.enable = 0


--- **These attributes manage the operation status user register set of the status model.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.user.BIT0
--- status.operation.user.BIT1
--- status.operation.user.BIT2
--- status.operation.user.BIT3
--- status.operation.user.BIT4
--- status.operation.user.BIT5
--- status.operation.user.BIT6
--- status.operation.user.BIT7
--- status.operation.user.BIT8
--- status.operation.user.BIT9
--- status.operation.user.BIT10
--- status.operation.user.BIT11
--- status.operation.user.BIT12
--- status.operation.user.BIT13
--- status.operation.user.BIT14
---  --16,384 
--- ```
status.operation.user.event = 0


--- **These attributes manage the operation status user register set of the status model.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.user.BIT0
--- status.operation.user.BIT1
--- status.operation.user.BIT2
--- status.operation.user.BIT3
--- status.operation.user.BIT4
--- status.operation.user.BIT5
--- status.operation.user.BIT6
--- status.operation.user.BIT7
--- status.operation.user.BIT8
--- status.operation.user.BIT9
--- status.operation.user.BIT10
--- status.operation.user.BIT11
--- status.operation.user.BIT12
--- status.operation.user.BIT13
--- status.operation.user.BIT14
---  --16,384 
--- ```
status.operation.user.ntr = 0


--- **These attributes manage the operation status user register set of the status model.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.user.BIT0
--- status.operation.user.BIT1
--- status.operation.user.BIT2
--- status.operation.user.BIT3
--- status.operation.user.BIT4
--- status.operation.user.BIT5
--- status.operation.user.BIT6
--- status.operation.user.BIT7
--- status.operation.user.BIT8
--- status.operation.user.BIT9
--- status.operation.user.BIT10
--- status.operation.user.BIT11
--- status.operation.user.BIT12
--- status.operation.user.BIT13
--- status.operation.user.BIT14
---  --16,384 
--- ```
status.operation.user.ptr = 0
---
---
---@class status.questionable.calibration
status.questionable.calibration = {}


--- **This attribute contains the questionable status calibration summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.SMUA
--- status.questionable.calibration.SMUB
---  --
--- ```
status.questionable.calibration.condition = 0


--- **This attribute contains the questionable status calibration summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.SMUA
--- status.questionable.calibration.SMUB
---  --
--- ```
status.questionable.calibration.enable = 0


--- **This attribute contains the questionable status calibration summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.SMUA
--- status.questionable.calibration.SMUB
---  --
--- ```
status.questionable.calibration.event = 0


--- **This attribute contains the questionable status calibration summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.SMUA
--- status.questionable.calibration.SMUB
---  --
--- ```
status.questionable.calibration.ntr = 0


--- **This attribute contains the questionable status calibration summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.SMUA
--- status.questionable.calibration.SMUB
---  --
--- ```
status.questionable.calibration.ptr = 0
---
---
---@class status.questionable.instrument
status.questionable.instrument = {}


--- **This attribute contains the questionable status instrument summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.SMUA
--- status.questionable.instrument.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates one or more enabled bits for the SMU B questionable register are set. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.instrument.condition = 0


--- **This attribute contains the questionable status instrument summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.SMUA
--- status.questionable.instrument.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates one or more enabled bits for the SMU B questionable register are set. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.instrument.enable = 0


--- **This attribute contains the questionable status instrument summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.SMUA
--- status.questionable.instrument.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates one or more enabled bits for the SMU B questionable register are set. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.instrument.event = 0


--- **This attribute contains the questionable status instrument summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.SMUA
--- status.questionable.instrument.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates one or more enabled bits for the SMU B questionable register are set. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.instrument.ntr = 0


--- **This attribute contains the questionable status instrument summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.SMUA
--- status.questionable.instrument.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates one or more enabled bits for the SMU B questionable register are set. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.instrument.ptr = 0
---
---
---@class status.questionable.over_temperature
status.questionable.over_temperature = {}


--- **This attribute contains the questionable status over temperature summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.SMUA
--- status.questionable.over_temperature.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates that an over temperature condition was detected on SMU B. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.over_temperature.condition = 0


--- **This attribute contains the questionable status over temperature summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.SMUA
--- status.questionable.over_temperature.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates that an over temperature condition was detected on SMU B. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.over_temperature.enable = 0


--- **This attribute contains the questionable status over temperature summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.SMUA
--- status.questionable.over_temperature.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates that an over temperature condition was detected on SMU B. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.over_temperature.event = 0


--- **This attribute contains the questionable status over temperature summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.SMUA
--- status.questionable.over_temperature.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates that an over temperature condition was detected on SMU B. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.over_temperature.ntr = 0


--- **This attribute contains the questionable status over temperature summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.SMUA
--- status.questionable.over_temperature.SMUB
---  --This bit is only available on 2602B, 2604B, 2612B, 2614B, 2634B, 2636B. Set bit indicates that an over temperature condition was detected on SMU B. Bit B2 decimal value: 4 Binary value: 0000 0100 
--- ```
status.questionable.over_temperature.ptr = 0
---
---
---@class status.questionable.unstable_output
status.questionable.unstable_output = {}


--- **This attribute contains the questionable status unstable output summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
---  --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit. 
--- ```
status.questionable.unstable_output.condition = 0


--- **This attribute contains the questionable status unstable output summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
---  --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit. 
--- ```
status.questionable.unstable_output.enable = 0


--- **This attribute contains the questionable status unstable output summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
---  --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit. 
--- ```
status.questionable.unstable_output.event = 0


--- **This attribute contains the questionable status unstable output summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
---  --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit. 
--- ```
status.questionable.unstable_output.ntr = 0


--- **This attribute contains the questionable status unstable output summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
---  --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit. 
--- ```
status.questionable.unstable_output.ptr = 0
---
---
---@class status.measurement.instrument.smuX
status.measurement.instrument.smuX = {}


--- **This attribute contains the registers of the measurement event SMU X summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smuX.VOLTAGE_LIMIT
--- status.measurement.instrument.smuX.VLMT
--- status.measurement.instrument.smuX.CURRENT_LIMIT
--- status.measurement.instrument.smuX.ILMT
--- status.measurement.instrument.smuX.READING_OVERFLOW
--- status.measurement.instrument.smuX.ROF
--- status.measurement.instrument.smuX.BUFFER_AVAILABLE
--- status.measurement.instrument.smuX.BAV
---  --Set bit indicates that there is at least one reading stored in either or both dedicated reading buffers. Bit B8 decimal value: 256 
--- ```
status.measurement.instrument.smuX.condition = 0


--- **This attribute contains the registers of the measurement event SMU X summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smuX.VOLTAGE_LIMIT
--- status.measurement.instrument.smuX.VLMT
--- status.measurement.instrument.smuX.CURRENT_LIMIT
--- status.measurement.instrument.smuX.ILMT
--- status.measurement.instrument.smuX.READING_OVERFLOW
--- status.measurement.instrument.smuX.ROF
--- status.measurement.instrument.smuX.BUFFER_AVAILABLE
--- status.measurement.instrument.smuX.BAV
---  --Set bit indicates that there is at least one reading stored in either or both dedicated reading buffers. Bit B8 decimal value: 256 
--- ```
status.measurement.instrument.smuX.enable = 0


--- **This attribute contains the registers of the measurement event SMU X summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smuX.VOLTAGE_LIMIT
--- status.measurement.instrument.smuX.VLMT
--- status.measurement.instrument.smuX.CURRENT_LIMIT
--- status.measurement.instrument.smuX.ILMT
--- status.measurement.instrument.smuX.READING_OVERFLOW
--- status.measurement.instrument.smuX.ROF
--- status.measurement.instrument.smuX.BUFFER_AVAILABLE
--- status.measurement.instrument.smuX.BAV
---  --Set bit indicates that there is at least one reading stored in either or both dedicated reading buffers. Bit B8 decimal value: 256 
--- ```
status.measurement.instrument.smuX.event = 0


--- **This attribute contains the registers of the measurement event SMU X summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smuX.VOLTAGE_LIMIT
--- status.measurement.instrument.smuX.VLMT
--- status.measurement.instrument.smuX.CURRENT_LIMIT
--- status.measurement.instrument.smuX.ILMT
--- status.measurement.instrument.smuX.READING_OVERFLOW
--- status.measurement.instrument.smuX.ROF
--- status.measurement.instrument.smuX.BUFFER_AVAILABLE
--- status.measurement.instrument.smuX.BAV
---  --Set bit indicates that there is at least one reading stored in either or both dedicated reading buffers. Bit B8 decimal value: 256 
--- ```
status.measurement.instrument.smuX.ntr = 0


--- **This attribute contains the registers of the measurement event SMU X summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smuX.VOLTAGE_LIMIT
--- status.measurement.instrument.smuX.VLMT
--- status.measurement.instrument.smuX.CURRENT_LIMIT
--- status.measurement.instrument.smuX.ILMT
--- status.measurement.instrument.smuX.READING_OVERFLOW
--- status.measurement.instrument.smuX.ROF
--- status.measurement.instrument.smuX.BUFFER_AVAILABLE
--- status.measurement.instrument.smuX.BAV
---  --Set bit indicates that there is at least one reading stored in either or both dedicated reading buffers. Bit B8 decimal value: 256 
--- ```
status.measurement.instrument.smuX.ptr = 0
---
---
---@class status.operation.instrument.digio
status.operation.instrument.digio = {}


--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.TRIGGER_OVERRUN
--- status.operation.instrument.digio.TRGOVR
---  --
--- ```
status.operation.instrument.digio.condition = 0


--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.TRIGGER_OVERRUN
--- status.operation.instrument.digio.TRGOVR
---  --
--- ```
status.operation.instrument.digio.enable = 0


--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.TRIGGER_OVERRUN
--- status.operation.instrument.digio.TRGOVR
---  --
--- ```
status.operation.instrument.digio.event = 0


--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.TRIGGER_OVERRUN
--- status.operation.instrument.digio.TRGOVR
---  --
--- ```
status.operation.instrument.digio.ntr = 0


--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.TRIGGER_OVERRUN
--- status.operation.instrument.digio.TRGOVR
---  --
--- ```
status.operation.instrument.digio.ptr = 0
---
---
---@class status.operation.instrument.lan
status.operation.instrument.lan = {}


--- **This attribute contains the operation status LAN summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.CONNECTION
--- status.operation.instrument.lan.CON
--- status.operation.instrument.lan.CONFIGURING
--- status.operation.instrument.lan.CONF
--- status.operation.instrument.lan.TRIGGER_OVERRUN
--- status.operation.instrument.lan.TRGOVR
---  --
--- ```
status.operation.instrument.lan.condition = 0


--- **This attribute contains the operation status LAN summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.CONNECTION
--- status.operation.instrument.lan.CON
--- status.operation.instrument.lan.CONFIGURING
--- status.operation.instrument.lan.CONF
--- status.operation.instrument.lan.TRIGGER_OVERRUN
--- status.operation.instrument.lan.TRGOVR
---  --
--- ```
status.operation.instrument.lan.enable = 0


--- **This attribute contains the operation status LAN summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.CONNECTION
--- status.operation.instrument.lan.CON
--- status.operation.instrument.lan.CONFIGURING
--- status.operation.instrument.lan.CONF
--- status.operation.instrument.lan.TRIGGER_OVERRUN
--- status.operation.instrument.lan.TRGOVR
---  --
--- ```
status.operation.instrument.lan.event = 0


--- **This attribute contains the operation status LAN summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.CONNECTION
--- status.operation.instrument.lan.CON
--- status.operation.instrument.lan.CONFIGURING
--- status.operation.instrument.lan.CONF
--- status.operation.instrument.lan.TRIGGER_OVERRUN
--- status.operation.instrument.lan.TRGOVR
---  --
--- ```
status.operation.instrument.lan.ntr = 0


--- **This attribute contains the operation status LAN summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.CONNECTION
--- status.operation.instrument.lan.CON
--- status.operation.instrument.lan.CONFIGURING
--- status.operation.instrument.lan.CONF
--- status.operation.instrument.lan.TRIGGER_OVERRUN
--- status.operation.instrument.lan.TRGOVR
---  --
--- ```
status.operation.instrument.lan.ptr = 0
---
---
---@class status.operation.instrument.smuX
status.operation.instrument.smuX = {}


--- **This attribute contains the operation status SMU X summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.CALIBRATING
--- status.operation.instrument.smuX.CAL
--- status.operation.instrument.smuX.SWEEPING
--- status.operation.instrument.smuX.SWE
--- status.operation.instrument.smuX.MEASURING
--- status.operation.instrument.smuX.MEAS
--- status.operation.instrument.smuX.TRIGGER_OVERRUN
--- status.operation.instrument.smuX.TRGOVR
---  --
--- ```
status.operation.instrument.smuX.condition = 0


--- **This attribute contains the operation status SMU X summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.CALIBRATING
--- status.operation.instrument.smuX.CAL
--- status.operation.instrument.smuX.SWEEPING
--- status.operation.instrument.smuX.SWE
--- status.operation.instrument.smuX.MEASURING
--- status.operation.instrument.smuX.MEAS
--- status.operation.instrument.smuX.TRIGGER_OVERRUN
--- status.operation.instrument.smuX.TRGOVR
---  --
--- ```
status.operation.instrument.smuX.enable = 0


--- **This attribute contains the operation status SMU X summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.CALIBRATING
--- status.operation.instrument.smuX.CAL
--- status.operation.instrument.smuX.SWEEPING
--- status.operation.instrument.smuX.SWE
--- status.operation.instrument.smuX.MEASURING
--- status.operation.instrument.smuX.MEAS
--- status.operation.instrument.smuX.TRIGGER_OVERRUN
--- status.operation.instrument.smuX.TRGOVR
---  --
--- ```
status.operation.instrument.smuX.event = 0


--- **This attribute contains the operation status SMU X summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.CALIBRATING
--- status.operation.instrument.smuX.CAL
--- status.operation.instrument.smuX.SWEEPING
--- status.operation.instrument.smuX.SWE
--- status.operation.instrument.smuX.MEASURING
--- status.operation.instrument.smuX.MEAS
--- status.operation.instrument.smuX.TRIGGER_OVERRUN
--- status.operation.instrument.smuX.TRGOVR
---  --
--- ```
status.operation.instrument.smuX.ntr = 0


--- **This attribute contains the operation status SMU X summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.CALIBRATING
--- status.operation.instrument.smuX.CAL
--- status.operation.instrument.smuX.SWEEPING
--- status.operation.instrument.smuX.SWE
--- status.operation.instrument.smuX.MEASURING
--- status.operation.instrument.smuX.MEAS
--- status.operation.instrument.smuX.TRIGGER_OVERRUN
--- status.operation.instrument.smuX.TRGOVR
---  --
--- ```
status.operation.instrument.smuX.ptr = 0
---
---
---@class status.operation.instrument.trigger_blender
status.operation.instrument.trigger_blender = {}


--- **This attribute contains the operation status trigger blender summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_blender.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_blender.condition = 0


--- **This attribute contains the operation status trigger blender summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_blender.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_blender.enable = 0


--- **This attribute contains the operation status trigger blender summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_blender.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_blender.event = 0


--- **This attribute contains the operation status trigger blender summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_blender.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_blender.ntr = 0


--- **This attribute contains the operation status trigger blender summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_blender.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_blender.ptr = 0
---
---
---@class status.operation.instrument.trigger_timer
status.operation.instrument.trigger_timer = {}


--- **This attribute contains the operation status trigger timer summary register set.  A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_timer.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_timer.condition = 0


--- **This attribute contains the operation status trigger timer summary register set. A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_timer.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_timer.enable = 0


--- **This attribute contains the operation status trigger timer summary register set. A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_timer.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_timer.event = 0


--- **This attribute contains the operation status trigger timer summary register set. When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_timer.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_timer.ntr = 0


--- **This attribute contains the operation status trigger timer summary register set. When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.TRIGGER_OVERRUN
--- status.operation.instrument.trigger_timer.TRGOVR
---  --
--- ```
status.operation.instrument.trigger_timer.ptr = 0
---
---
---@class status.operation.instrument.tsplink
status.operation.instrument.tsplink = {}


--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.TRIGGER_OVERRUN
--- status.operation.instrument.tsplink.TRGOVR
---  --
--- ```
status.operation.instrument.tsplink.condition = 0


--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.TRIGGER_OVERRUN
--- status.operation.instrument.tsplink.TRGOVR
---  --
--- ```
status.operation.instrument.tsplink.enable = 0


--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.TRIGGER_OVERRUN
--- status.operation.instrument.tsplink.TRGOVR
---  --
--- ```
status.operation.instrument.tsplink.event = 0


--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.TRIGGER_OVERRUN
--- status.operation.instrument.tsplink.TRGOVR
---  --
--- ```
status.operation.instrument.tsplink.ntr = 0


--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.TRIGGER_OVERRUN
--- status.operation.instrument.tsplink.TRGOVR
---  --
--- ```
status.operation.instrument.tsplink.ptr = 0
---
---
---@class status.questionable.instrument.smuX
status.questionable.instrument.smuX = {}


--- **This attribute contains the questionable status SMU X summary register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.smuX.CALIBRATION
--- status.questionable.instrument.smuX.CAL
--- status.questionable.instrument.smuX.UNSTABLE_OUTPUT
--- status.questionable.instrument.smuX.UO
--- status.questionable.instrument.smuX.OVER_TEMPERATURE
--- status.questionable.instrument.smuX.OTEMP
---  --Set bit indicates that an over temperature condition was detected. Bit B12 decimal value: 4,096 
--- ```
status.questionable.instrument.smuX.condition = 0


--- **This attribute contains the questionable status SMU X summary register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.smuX.CALIBRATION
--- status.questionable.instrument.smuX.CAL
--- status.questionable.instrument.smuX.UNSTABLE_OUTPUT
--- status.questionable.instrument.smuX.UO
--- status.questionable.instrument.smuX.OVER_TEMPERATURE
--- status.questionable.instrument.smuX.OTEMP
---  --Set bit indicates that an over temperature condition was detected. Bit B12 decimal value: 4,096 
--- ```
status.questionable.instrument.smuX.enable = 0


--- **This attribute contains the questionable status SMU X summary register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.smuX.CALIBRATION
--- status.questionable.instrument.smuX.CAL
--- status.questionable.instrument.smuX.UNSTABLE_OUTPUT
--- status.questionable.instrument.smuX.UO
--- status.questionable.instrument.smuX.OVER_TEMPERATURE
--- status.questionable.instrument.smuX.OTEMP
---  --Set bit indicates that an over temperature condition was detected. Bit B12 decimal value: 4,096 
--- ```
status.questionable.instrument.smuX.event = 0


--- **This attribute contains the questionable status SMU X summary register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.smuX.CALIBRATION
--- status.questionable.instrument.smuX.CAL
--- status.questionable.instrument.smuX.UNSTABLE_OUTPUT
--- status.questionable.instrument.smuX.UO
--- status.questionable.instrument.smuX.OVER_TEMPERATURE
--- status.questionable.instrument.smuX.OTEMP
---  --Set bit indicates that an over temperature condition was detected. Bit B12 decimal value: 4,096 
--- ```
status.questionable.instrument.smuX.ntr = 0


--- **This attribute contains the questionable status SMU X summary register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.smuX.CALIBRATION
--- status.questionable.instrument.smuX.CAL
--- status.questionable.instrument.smuX.UNSTABLE_OUTPUT
--- status.questionable.instrument.smuX.UO
--- status.questionable.instrument.smuX.OVER_TEMPERATURE
--- status.questionable.instrument.smuX.OTEMP
---  --Set bit indicates that an over temperature condition was detected. Bit B12 decimal value: 4,096 
--- ```
status.questionable.instrument.smuX.ptr = 0
---
---
---@class status.operation.instrument.digio.trigger_overrun
status.operation.instrument.digio.trigger_overrun = {}


--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.trigger_overrun.LINE1
--- status.operation.instrument.digio.trigger_overrun.LINE2
--- status.operation.instrument.digio.trigger_overrun.LINE3
--- status.operation.instrument.digio.trigger_overrun.LINE4
--- status.operation.instrument.digio.trigger_overrun.LINE5
--- status.operation.instrument.digio.trigger_overrun.LINE6
--- status.operation.instrument.digio.trigger_overrun.LINE7
--- status.operation.instrument.digio.trigger_overrun.LINE8
--- status.operation.instrument.digio.trigger_overrun.LINE9
--- status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.LINE11
--- status.operation.instrument.digio.trigger_overrun.LINE12
--- status.operation.instrument.digio.trigger_overrun.LINE13
--- status.operation.instrument.digio.trigger_overrun.LINE14
---  --16,384 
--- ```
status.operation.instrument.digio.trigger_overrun.condition = 0


--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.trigger_overrun.LINE1
--- status.operation.instrument.digio.trigger_overrun.LINE2
--- status.operation.instrument.digio.trigger_overrun.LINE3
--- status.operation.instrument.digio.trigger_overrun.LINE4
--- status.operation.instrument.digio.trigger_overrun.LINE5
--- status.operation.instrument.digio.trigger_overrun.LINE6
--- status.operation.instrument.digio.trigger_overrun.LINE7
--- status.operation.instrument.digio.trigger_overrun.LINE8
--- status.operation.instrument.digio.trigger_overrun.LINE9
--- status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.LINE11
--- status.operation.instrument.digio.trigger_overrun.LINE12
--- status.operation.instrument.digio.trigger_overrun.LINE13
--- status.operation.instrument.digio.trigger_overrun.LINE14
---  --16,384 
--- ```
status.operation.instrument.digio.trigger_overrun.enable = 0


--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.trigger_overrun.LINE1
--- status.operation.instrument.digio.trigger_overrun.LINE2
--- status.operation.instrument.digio.trigger_overrun.LINE3
--- status.operation.instrument.digio.trigger_overrun.LINE4
--- status.operation.instrument.digio.trigger_overrun.LINE5
--- status.operation.instrument.digio.trigger_overrun.LINE6
--- status.operation.instrument.digio.trigger_overrun.LINE7
--- status.operation.instrument.digio.trigger_overrun.LINE8
--- status.operation.instrument.digio.trigger_overrun.LINE9
--- status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.LINE11
--- status.operation.instrument.digio.trigger_overrun.LINE12
--- status.operation.instrument.digio.trigger_overrun.LINE13
--- status.operation.instrument.digio.trigger_overrun.LINE14
---  --16,384 
--- ```
status.operation.instrument.digio.trigger_overrun.event = 0


--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.trigger_overrun.LINE1
--- status.operation.instrument.digio.trigger_overrun.LINE2
--- status.operation.instrument.digio.trigger_overrun.LINE3
--- status.operation.instrument.digio.trigger_overrun.LINE4
--- status.operation.instrument.digio.trigger_overrun.LINE5
--- status.operation.instrument.digio.trigger_overrun.LINE6
--- status.operation.instrument.digio.trigger_overrun.LINE7
--- status.operation.instrument.digio.trigger_overrun.LINE8
--- status.operation.instrument.digio.trigger_overrun.LINE9
--- status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.LINE11
--- status.operation.instrument.digio.trigger_overrun.LINE12
--- status.operation.instrument.digio.trigger_overrun.LINE13
--- status.operation.instrument.digio.trigger_overrun.LINE14
---  --16,384 
--- ```
status.operation.instrument.digio.trigger_overrun.ntr = 0


--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.trigger_overrun.LINE1
--- status.operation.instrument.digio.trigger_overrun.LINE2
--- status.operation.instrument.digio.trigger_overrun.LINE3
--- status.operation.instrument.digio.trigger_overrun.LINE4
--- status.operation.instrument.digio.trigger_overrun.LINE5
--- status.operation.instrument.digio.trigger_overrun.LINE6
--- status.operation.instrument.digio.trigger_overrun.LINE7
--- status.operation.instrument.digio.trigger_overrun.LINE8
--- status.operation.instrument.digio.trigger_overrun.LINE9
--- status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.LINE11
--- status.operation.instrument.digio.trigger_overrun.LINE12
--- status.operation.instrument.digio.trigger_overrun.LINE13
--- status.operation.instrument.digio.trigger_overrun.LINE14
---  --16,384 
--- ```
status.operation.instrument.digio.trigger_overrun.ptr = 0
---
---
---@class status.operation.instrument.lan.trigger_overrun
status.operation.instrument.lan.trigger_overrun = {}


--- **This attribute contains the operation status LAN trigger overrun register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.trigger_overrun.LAN1
--- status.operation.instrument.lan.trigger_overrun.LAN2
--- status.operation.instrument.lan.trigger_overrun.LAN3
--- status.operation.instrument.lan.trigger_overrun.LAN4
--- status.operation.instrument.lan.trigger_overrun.LAN5
--- status.operation.instrument.lan.trigger_overrun.LAN6
--- status.operation.instrument.lan.trigger_overrun.LAN7
--- status.operation.instrument.lan.trigger_overrun.LAN8
---  --256 
--- ```
status.operation.instrument.lan.trigger_overrun.condition = 0


--- **This attribute contains the operation status LAN trigger overrun register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.trigger_overrun.LAN1
--- status.operation.instrument.lan.trigger_overrun.LAN2
--- status.operation.instrument.lan.trigger_overrun.LAN3
--- status.operation.instrument.lan.trigger_overrun.LAN4
--- status.operation.instrument.lan.trigger_overrun.LAN5
--- status.operation.instrument.lan.trigger_overrun.LAN6
--- status.operation.instrument.lan.trigger_overrun.LAN7
--- status.operation.instrument.lan.trigger_overrun.LAN8
---  --256 
--- ```
status.operation.instrument.lan.trigger_overrun.enable = 0


--- **This attribute contains the operation status LAN trigger overrun register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.trigger_overrun.LAN1
--- status.operation.instrument.lan.trigger_overrun.LAN2
--- status.operation.instrument.lan.trigger_overrun.LAN3
--- status.operation.instrument.lan.trigger_overrun.LAN4
--- status.operation.instrument.lan.trigger_overrun.LAN5
--- status.operation.instrument.lan.trigger_overrun.LAN6
--- status.operation.instrument.lan.trigger_overrun.LAN7
--- status.operation.instrument.lan.trigger_overrun.LAN8
---  --256 
--- ```
status.operation.instrument.lan.trigger_overrun.event = 0


--- **This attribute contains the operation status LAN trigger overrun register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.trigger_overrun.LAN1
--- status.operation.instrument.lan.trigger_overrun.LAN2
--- status.operation.instrument.lan.trigger_overrun.LAN3
--- status.operation.instrument.lan.trigger_overrun.LAN4
--- status.operation.instrument.lan.trigger_overrun.LAN5
--- status.operation.instrument.lan.trigger_overrun.LAN6
--- status.operation.instrument.lan.trigger_overrun.LAN7
--- status.operation.instrument.lan.trigger_overrun.LAN8
---  --256 
--- ```
status.operation.instrument.lan.trigger_overrun.ntr = 0


--- **This attribute contains the operation status LAN trigger overrun register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.lan.trigger_overrun.LAN1
--- status.operation.instrument.lan.trigger_overrun.LAN2
--- status.operation.instrument.lan.trigger_overrun.LAN3
--- status.operation.instrument.lan.trigger_overrun.LAN4
--- status.operation.instrument.lan.trigger_overrun.LAN5
--- status.operation.instrument.lan.trigger_overrun.LAN6
--- status.operation.instrument.lan.trigger_overrun.LAN7
--- status.operation.instrument.lan.trigger_overrun.LAN8
---  --256 
--- ```
status.operation.instrument.lan.trigger_overrun.ptr = 0
---
---
---@class status.operation.instrument.smuX.trigger_overrrun
status.operation.instrument.smuX.trigger_overrrun = {}


--- **This attribute contains the operation status SMU X trigger overrun register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.trigger_overrun.ARM
--- status.operation.instrument.smuX.trigger_overrun.SRC
--- status.operation.instrument.smuX.trigger_overrun.MEAS
--- status.operation.instrument.smuX.trigger_overrun.ENDP
---  --
--- ```
status.operation.instrument.smuX.trigger_overrrun.condition = 0


--- **This attribute contains the operation status SMU X trigger overrun register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.trigger_overrun.ARM
--- status.operation.instrument.smuX.trigger_overrun.SRC
--- status.operation.instrument.smuX.trigger_overrun.MEAS
--- status.operation.instrument.smuX.trigger_overrun.ENDP
---  --
--- ```
status.operation.instrument.smuX.trigger_overrrun.enable = 0


--- **This attribute contains the operation status SMU X trigger overrun register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.trigger_overrun.ARM
--- status.operation.instrument.smuX.trigger_overrun.SRC
--- status.operation.instrument.smuX.trigger_overrun.MEAS
--- status.operation.instrument.smuX.trigger_overrun.ENDP
---  --
--- ```
status.operation.instrument.smuX.trigger_overrrun.event = 0


--- **This attribute contains the operation status SMU X trigger overrun register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.trigger_overrun.ARM
--- status.operation.instrument.smuX.trigger_overrun.SRC
--- status.operation.instrument.smuX.trigger_overrun.MEAS
--- status.operation.instrument.smuX.trigger_overrun.ENDP
---  --
--- ```
status.operation.instrument.smuX.trigger_overrrun.ntr = 0


--- **This attribute contains the operation status SMU X trigger overrun register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smuX.trigger_overrun.ARM
--- status.operation.instrument.smuX.trigger_overrun.SRC
--- status.operation.instrument.smuX.trigger_overrun.MEAS
--- status.operation.instrument.smuX.trigger_overrun.ENDP
---  --
--- ```
status.operation.instrument.smuX.trigger_overrrun.ptr = 0
---
---
---@class status.operation.instrument.trigger_blender.trigger_overrun
status.operation.instrument.trigger_blender.trigger_overrun = {}


--- **This attribute contains the operation status trigger blender overrun register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND2
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND3
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND4
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND5
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND6
---  -- 64 
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.condition = 0


--- **This attribute contains the operation status trigger blender overrun register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND2
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND3
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND4
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND5
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND6
---  -- 64 
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.enable = 0


--- **This attribute contains the operation status trigger blender overrun register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND2
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND3
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND4
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND5
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND6
---  -- 64 
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.event = 0


--- **This attribute contains the operation status trigger blender overrun register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND2
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND3
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND4
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND5
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND6
---  -- 64 
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.ntr = 0


--- **This attribute contains the operation status trigger blender overrun register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND2
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND3
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND4
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND5
--- status.operation.instrument.trigger_blender.trigger_overrun.BLND6
---  -- 64 
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.ptr = 0
---
---
---@class status.operation.instrument.trigger_timer.trigger_overrun
status.operation.instrument.trigger_timer.trigger_overrun = {}


--- **This attribute contains the operation status trigger timer overrun register set. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR1
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR2
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR4
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR5
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR6
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR7
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR8
---  --256 
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.condition = 0


--- **This attribute contains the operation status trigger timer overrun register set.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR1
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR2
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR4
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR5
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR6
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR7
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR8
---  --256 
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.enable = 0


--- **This attribute contains the operation status trigger timer overrun register set.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR1
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR2
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR4
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR5
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR6
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR7
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR8
---  --256 
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.event = 0


--- **This attribute contains the operation status trigger timer overrun register set.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR1
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR2
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR4
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR5
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR6
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR7
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR8
---  --256 
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.ntr = 0


--- **This attribute contains the operation status trigger timer overrun register set.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR1
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR2
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR4
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR5
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR6
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR7
--- status.operation.instrument.trigger_timer.trigger_overrun.TMR8
---  --256 
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.ptr = 0
---
---
---@class status.operation.instrument.tsplink.trigger_overrun
status.operation.instrument.tsplink.trigger_overrun = {}


--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B. A read-only register that is constantly updated to reflect the present operating conditions of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.LINE1
--- status.operation.instrument.tsplink.trigger_overrun.LINE2
--- status.operation.instrument.tsplink.trigger_overrun.LINE3
---  --8 
--- ```
status.operation.instrument.tsplink.trigger_overrun.condition = 0


--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.A read-write register that allows a summary bit to be set when an enabled event occurs.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.LINE1
--- status.operation.instrument.tsplink.trigger_overrun.LINE2
--- status.operation.instrument.tsplink.trigger_overrun.LINE3
---  --8 
--- ```
status.operation.instrument.tsplink.trigger_overrun.enable = 0


--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.A read-only register that sets a bit to 1 when the applicable event occurs. If the enable register bit for that event is also set, the summary bit of the register is set to 1.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.LINE1
--- status.operation.instrument.tsplink.trigger_overrun.LINE2
--- status.operation.instrument.tsplink.trigger_overrun.LINE3
---  --8 
--- ```
status.operation.instrument.tsplink.trigger_overrun.event = 0


--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 1 to 0 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.LINE1
--- status.operation.instrument.tsplink.trigger_overrun.LINE2
--- status.operation.instrument.tsplink.trigger_overrun.LINE3
---  --8 
--- ```
status.operation.instrument.tsplink.trigger_overrun.ntr = 0


--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.When a bit is set in this read-write register, it enables a 0 to 1 change in the corresponding bit of the condition register to cause the corresponding bit in the event register to be set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.LINE1
--- status.operation.instrument.tsplink.trigger_overrun.LINE2
--- status.operation.instrument.tsplink.trigger_overrun.LINE3
---  --8 
--- ```
status.operation.instrument.tsplink.trigger_overrun.ptr = 0


--- **This function generates an audible tone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use the beeper of the 2600B to provide an audible signal at a specified frequency and time duration. For example, you can use the beeper to signal the end of a lengthy sweep.The beeper does not sound if it is disabled. It can be disabled or enabled with the beeper enable command, or through the front panel.
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.enable = beeper.ON
--- beeper.beep(2, 2400)
---  --Enables the beeper and generates a two‑second, 2400 Hz tone. 
--- ```
---@param duration any The amount of time to play the tone (0.001 s to 100 s) 
---@param frequency any The frequency of the tone in Hertz (Hz) 
function beeper.beep(duration, frequency) end


--- **This function performs a bitwise logical AND operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to form integers. The returned result is also an integer.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitand(10, 9)
--- print(testResult)
---  --Performs a logical AND operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 8 (binary 1000). Output: 
--- ```
---@return any result Result of the logical AND operation 
---@param value1 any Operand for the logical AND operation 
---@param value2 any Operand for the logical AND operation 
function bit.bitand(value1,value2) end


--- **This function performs a bitwise logical OR operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to make them integers. The returned result is also an integer.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitor(10, 9)
--- print(testResult)
---  --Performs a bitwise logical OR operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 11 (binary 1011). Output: 1.10000e+01 
--- ```
---@return any result Result of the logical OR operation 
---@param value1 any Operand for the logical OR operation 
---@param value2 any Operand for the logical OR operation 
function bit.bitor(value1,value2) end


--- **This function performs a bitwise logical XOR (exclusive OR) operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to make them integers. The returned result is also an integer.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitxor(10, 9)
--- print(testResult)
---  --Performs a logical XOR operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 3 (binary 0011). Output: 3.00000e+00 
--- ```
---@return any result Result of the logical XOR operation 
---@param value1 any Operand for the logical XOR operation 
---@param value2 any Operand for the logical XOR operation 
function bit.bitxor(value1,value2) end


--- **This function clears a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional part of value is truncated to make it an integer. The returned result is also an integer.The least significant bit of value is at index position 1; the most significant bit is at index position 32.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.clear(15, 2)
--- print(testResult)
---  --The binary equivalent of decimal 15 is 1111. If you clear the bit at index position 2, the returned decimal value is 13 (binary 1101). Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position within value to clear (1 to 32) 
function bit.clear(value,index) end


--- **This function retrieves the weighted value of a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns the value of the bit in value at index. This is the same as returning value with all other bits set to zero (0).The least significant bit of value is at index position 1; the most significant bit is at index position 32.If the indexed bit for the number is set to zero (0), the result is zero (0).
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.get(10, 4)
--- print(testResult)
---  --The binary equivalent of decimal 10 is 1010. If you get the bit at index position 4, the returned decimal value is 8. Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position within value to get (1 to 32) 
function bit.get(value,index) end


--- **This function returns a field of bits from the value starting at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A field of bits is a contiguous group of bits. This function retrieves a field of bits from value starting at index.The index position is the least significant bit of the retrieved field. The number of bits to return is specified by width.The least significant bit of value is at index position 1; the most significant bit is at index position 32.
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.getfield(13, 2, 3)
--- print(myResult)
---  --The binary equivalent of decimal 13 is 1101.  The field at index position 2 and width 3 consists of the binary bits 110. The returned value is decimal 6 (binary 110). Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position within value to get (1 to 32) 
---@param width any The number of bits to include in the field (1 to 32) 
function bit.getfield(value,index,width) end


--- **This function sets a bit at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is value with the indexed bit set. The index must be between 1 and 32.The least significant bit of value is at index position 1; the most significant bit is at index position 32.Any fractional part of value is truncated to make it an integer.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.set(8, 3)
---  
--- print(testResult)
---  --The binary equivalent of decimal 8 is 1000. If the bit at index position 3 is set to 1, the returned value is decimal 12 (binary 1100). Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position within value to set (1 to 32) 
function bit.set(value,index) end


--- **This function overwrites a bit field at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is value with a field of bits overwritten, starting at index. The index specifies the position of the least significant bit of value. The width bits starting at index are set to fieldValue.The least significant bit of value is at index position 1; the most significant bit is at index position 32.Before setting the field of bits, any fractional parts of value and fieldValue are truncated to form integers.If fieldValue is wider than width, the most significant bits of the fieldValue that exceed the width are truncated. For example, if width is 4 bits and the binary value for fieldValue is 11110 (5 bits), the most significant bit of fieldValue is truncated and a binary value of 1110 is used.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.setfield(15, 2, 3, 5)
--- print(testResult)
---  --The binary equivalent of decimal 15 is 1111. After overwriting it with a decimal 5 (binary 101) at index position 2, the returned value is decimal 11 (binary 1011). Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position in value to set (1 to 32) 
---@param width any The number of bits to include in the field (1 to 32) 
---@param fieldValue any Value to write to the field 
function bit.setfield(value,index,width,fieldValue) end


--- **This function returns the Boolean value (true or false) of a bit at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is the result of the tested bit. The least significant bit of value is at index position 1; the most significant bit is at index position 32.If the indexed bit for value is 0, result is false. If the bit of value at index is 1, the returned value is true.If index is bigger than the number of bits in value, the result is false.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.test(10, 4)
--- print(testResult)
---  --The binary equivalent of decimal 10 is 1010. Testing the bit at index position 4 returns a Boolean value of true. Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position within value to test (1 to 32) 
function bit.test(value,index) end


--- **This function toggles the value of a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is the result of toggling the bit index in value.Any fractional part of value is truncated to make it an integer. The returned value is also an integer.The least significant bit of value is at index position 1; the most significant bit is at index position 32.The indexed bit for value is toggled from 0 to 1, or 1 to 0.
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.toggle(10, 3)
--- print(testResult)
---  --The binary equivalent of decimal 10 is 1010. Toggling the bit at index position 3 returns a decimal value of 14 (binary 1110). Output: 
--- ```
---@return any result Result of the bit manipulation 
---@param value any Specified number 
---@param index any One‑based bit position within value to toggle (1 to 32) 
function bit.toggle(value,index) end


--- **This function empties the buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all readings and related recall attributes from the buffer (for example, bufferVar.timestamps and bufferVar.statuses) from the specified buffer.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.clear()
---  --Clears dedicated reading buffer 1 (source‑measure unit (SMU) channel A). 
--- ```
function bufferMethods.clear() end


--- **This function clears the cache.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all readings from the specified cache. If you run successive operations that overwrite reading buffer data, the reading buffer may return stale cache data. This can happen when you:To avoid this, you can include explicit calls to the bufferVar.clearcache() function to remove stale values from the reading buffer cache.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.clearcache()
---  --Clears the reading buffer cache for dedicated reading buffer 1. 
--- ```
function bufferMethods.clearcache() end


--- **This KIPulse factory script function configures a current pulse train with a voltage measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a current pulse train with a voltage measurement at each point. Measurements are made at the end of the ton time. This function does not cause the specified smu to output a pulse train. It simply checks to see if all the pulse dimensions can be achieved, and if they are, assigns the indicated tag or index to the pulse train. The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag.
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseIMeasureV(smua, 0, 5, 10, 0.001, 0.080, 1, smua.nvbuffer1, 1)
---  --Set up a pulse train that uses channel A. The pulse amplitude is 5 A and returns to 0 A after 1 ms. The pulse remains at 0 A for 80 ms and the voltage limit is 10 V during the pulse. The pulse train consists of only 1 pulse, and this pulse is assigned a tag index of 1. 
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
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag)
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in)
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out)
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout)
function  ConfigPulseIMeasureV(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a linear pulsed current sweep with a voltage measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a linear pulsed current sweep with a voltage measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start amperes; the magnitude of the last pulse is stop amperes. The magnitude of each pulse in between is step amperes larger than the previous pulse, where:step = (stop - start) / (points - 1)This function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag.
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseIMeasureVSweepLin(smua, 0, 0.01, 0.05, 1, 1e-3, 0.1, 20, smua.nvbuffer2, 3)
---  --Set up a pulsed sweep that uses channel A. The pulsed sweep starts at 10 mA, ends at 50 mA, and returns to a 0 mA bias level between pulses. Each pulsed step is on for 1 ms, and then at the bias level for 100 ms. The voltage limit is 1 V during the entire pulsed sweep. The pulse train is comprised of 20 pulsed steps and the pulse train is assigned a tag index of 3. 
--- ```
---@return any f A Boolean flag; this flag is true if the pulse was successfully configured, false when errors were encountered 
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in amperes 
---@param start any Pulse sweep start level in amperes 
---@param stop any Pulse sweep stop level in amperes 
---@param limit any Voltage limit (for example, compliance) in volts 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
---@param buffer any Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated 
---@param tag any Numeric identifier to be assigned to the defined pulse train 
---@param sync_in any Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse 
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton 
---@param sync_in_timeout any Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s 
---@param sync_in_abort any Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false 
---@overload fun(smu, bias, start, stop, limit, ton, toff,points, buffer, tag)
---@overload fun(smu, bias, start, stop, limit, ton, toff,points, buffer, tag, sync_in)
---@overload fun(smu, bias, start, stop, limit, ton, toff,points, buffer, tag, sync_in, sync_out)
---@overload fun(smu, bias, start, stop, limit, ton, toff,points, buffer, tag, sync_in, sync_out, sync_in_timeout)
function  ConfigPulseIMeasureVSweepLin(smu, bias, start, stop, limit, ton, toff,points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a logarithmic pulsed current sweep with a voltage measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start amperes; the magnitude of the last pulse is stop amperes. The magnitude of each pulse in between is LogStepn amperes larger than the previous pulse, where:LogStepSize = (log10(stop) - log10(start)) / (points -1)LogStepn = (n - 1) * (LogStepSize), where n = [2, points]SourceStepLeveln = antilog(LogStepn) * startThis function does not cause the specified smu to output a pulse train. It simply checks to see if all of the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. To initiate a pulse train assigned to a valid tag, use InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2).
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseIMeasureVSweepLog(smua, 0, 1e-3, 0.01, 1, 1e-3, 10e-3, 10,   smua.nvbuffer1, 5)
---  --Set up a pulsed logarithmic sweep that uses channel A. The pulsed sweep starts at 1 mA, ends at 10 mA, and returns to a 0 A bias level between pulses. Each pulsed step is on for 1 ms, and then at the bias level for 10 ms. The voltage limit is 1 V during the entire pulsed sweep. The pulse train is comprised of 10 pulsed steps, and the pulse train is assigned a tag index of 5. 
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered  
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in amperes 
---@param start any Pulse sweep start level in amperes 
---@param stop any Pulse sweep stop level in amperes 
---@param limit any Voltage limit (for example, compliance) in volts 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
---@param buffer any Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated 
---@param tag any Numeric identifier to be assigned to the defined pulse train 
---@param sync_in any Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse 
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton 
---@param sync_in_timeout any Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s 
---@param sync_in_abort any Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false  
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout)
function  ConfigPulseIMeasureVSweepLog(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed current measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a voltage pulse train with a current measurement at each point. Measurements are made at the end of the ton time. This function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. To initiate a pulse train assigned to a valid tag, use InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) .
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseVMeasureI(smua, 0, 20, 1, 0.001, 0.080, 10, smua.nvbuffer1, 2)
---  --Set up a pulse train that uses channel A. The pulse amplitude is 20 V and returns to 0 V after 1 ms. The pulse remains at 0 V for 80 ms, and the current limit is 1 A during the pulse. The pulse train consists of 10 pulses, and the pulse train is assigned a tag index of 2. 
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered  
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in volts 
---@param level any Pulse level in volts 
---@param limit any Current limit (for example, compliance) in amperes 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
---@param buffer any Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated 
---@param tag any Numeric identifier to be assigned to the defined pulse train 
---@param sync_in any Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse 
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton 
---@param sync_in_timeout any Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s 
---@param sync_in_abort any Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false 
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag)
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in)
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out)
---@overload fun(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout)
function  ConfigPulseVMeasureI(smu, bias, level, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed current measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a linear pulsed voltage sweep with a current measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start volts; the magnitude of the last pulse is stop volts. The magnitude of each pulse in between is step volts larger than the previous pulse, where:step = (stop - start) / (points - 1)This function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train.The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag. 
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseVMeasureISweepLin(smua, 0, 1, 10, 1, 10e-3, 20e-3, 16, smua.nvbuffer1, 4)
---  --Set up a pulsed sweep that uses channel A. The pulsed sweep starts at 1 V, ends at 10 V, and returns to a 0 V bias level between pulses. Each pulsed step is on for 10 ms, and then at the bias level for 20 ms.  The current limit is 1 A during the entire pulsed sweep. The pulse train is comprised of 16 pulsed steps, and the pulse train is assigned a tag index of 4. 
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered  
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in volts 
---@param start any Pulse sweep start level in volts 
---@param stop any Pulse sweep stop level in volts 
---@param limit any Current limit (for example, compliance) in amperes 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
---@param buffer any Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated 
---@param tag any Numeric identifier to be assigned to the defined pulse train 
---@param sync_in any Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse 
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton 
---@param sync_in_timeout any Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s 
---@param sync_in_abort any Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false 
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout)
function  ConfigPulseVMeasureISweepLin(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This KIPulse factory script function configures a voltage pulse train with a current measurement at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed current measurements are stored in the reading buffer specified by the buffer input parameter.This function configures a logarithmic pulsed voltage sweep with a current measurement at each point. Measurements are made at the end of the ton time.The magnitude of the first pulse is start volts; the magnitude of the last pulse is stop volts. The magnitude of each pulse in between is LogStepn volts larger than the previous pulse, where:LogStepSize = (log10(stop) - log10(start)) / (points -1)LogStepn = (n - 1) * (LogStepSize), where n = [2, points]SourceStepLeveln = antilog(LogStepn) * startThis function does not cause the specified smu to output a pulse train. It does check to see if all the pulse dimensions can be achieved, and if they can, assigns the indicated tag or index to the pulse train. The InitiatePulseTest(tag) and InitiatePulseTestDual(tag1, tag2) functions are used to initiate a pulse train assigned to a valid tag.
---
---<br>*Examples:*<br>
--- ```lua
--- ConfigPulseVMeasureISweepLog(smua, 0, 1, 10, 1, 10e-3, 20e-3, 10, smua.nvbuffer1, 6)
---  --Set up a pulsed logarithmic sweep that uses SMU channel A. The pulsed sweep starts at 1 V, ends at 10 V, and returns to a 0 V bias level between pulses. Each pulsed step is on for 10 ms, and then at the bias level for 20 ms.  The current limit is 1 A during the entire pulsed sweep. The pulse train is comprised of 10 pulsed steps, and the pulse train is assigned a tag index of 6. 
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered 
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in volts 
---@param start any Pulse sweep start level in volts 
---@param stop any Pulse sweep stop level in volts 
---@param limit any Current limit (for example, compliance) in amperes 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
---@param buffer any Reading buffer where pulsed measurements are stored; if this is nil when the function is called, no measurements are made when the pulse train is initiated 
---@param tag any Numeric identifier to be assigned to the defined pulse train 
---@param sync_in any Defines a digital I/O trigger input line; if programmed, the pulse train waits for a trigger input before executing each pulse 
---@param sync_out any Defines a digital I/O trigger output line; if programmed, the pulse train generates a trigger output immediately before the start of ton 
---@param sync_in_timeout any Specifies the length of time (in seconds) to wait for input trigger; default value is 10 s 
---@param sync_in_abort any Specifies whether or not to abort pulse if input trigger is not received; if pulse aborts because of a missed trigger, a timer timeout message is returned; true or false 
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out)
---@overload fun(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout)
function  ConfigPulseVMeasureISweepLog(smu, bias, start, stop, limit, ton, toff, points, buffer, tag, sync_in, sync_out, sync_in_timeout, sync_in_abort) end


--- **This function adds an entry to the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot use the timeout value when accessing the data queue from a remote node (you can only use the timeout value while adding data to the local data queue).The timeout value is ignored if the data queue is not full.The dataqueue.add() function returns false:If the value is a table, a duplicate of the table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---<br>*Examples:*<br>
--- ```lua
--- dataqueue.clear()
--- dataqueue.add(10)
--- dataqueue.add(11, 2)
--- result = dataqueue.add(12, 3)
--- if result == false then
---    print("Failed to add 12 to the dataqueue")
--- end
--- print("The dataqueue contains:")
--- while dataqueue.count > 0 do
---    print(dataqueue.next())
--- end
---  --Clear the data queue. Each line adds one item to the data queue. Output: 
--- ```
---@return any result The resulting value of true or false based on the success of the function 
---@param value any The data item to add; value can be of any type 
---@param timeout any The maximum number of seconds to wait for space in the data queue 
---@overload fun(value)
function  dataqueue.add(value, timeout) end


--- **This function clears the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function forces all dataqueue.add() commands that are in progress to time out and deletes all data from the data queue.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function dataqueue.clear() end


--- **This function removes the next entry from the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the data queue is empty, the function waits up to the timeout value.If data is not available in the data queue before the timeout expires, the return value is nil.The entries in the data queue are removed in first-in, first-out (FIFO) order.If the value is a table, a duplicate of the original table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---<br>*Examples:*<br>
--- ```lua
--- dataqueue.clear()
--- for i = 1, 10 do
---    dataqueue.add(i)
--- end
--- print("There are " .. dataqueue.count .. " items in the data queue")
---  
--- while dataqueue.count > 0 do
---    x = dataqueue.next()
---    print(x)
--- end
--- print("There are " .. dataqueue.count .. " items in the data queue")
---  --Clears the data queue, adds ten entries, then reads the entries from the data queue. Note that your output may differ depending on the setting of format.asciiprecision. Output: 
--- ```
---@return any value The next entry in the data queue 
---@param timeout any The number of seconds to wait for data in the queue 
---@overload fun()
function  dataqueue.next(timeout) end


--- **This function delays the execution of the commands that follow it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The instrument delays execution of the commands for at least the specified number of seconds and fractional seconds. However, the processing time may cause the instrument to delay 5 μs to 10 μs (typical) more than the requested delay.
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.beep(0.5, 2400)
--- delay(0.250)
--- beeper.beep(0.5, 2400)
---  --Emit a double‑beep at 2400 Hz. The sequence is 0.5 s on, 0.25 s off, 0.5 s on. 
--- ```
---@param seconds any The number of seconds to delay (0 s to 100 ks) 
function delay(seconds) end


--- **This function reads one digital I/O line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A returned value of zero (0) indicates that the line is low. A returned value of one (1) indicates that the line is high.
---
---<br>*Examples:*<br>
--- ```lua
--- print(digio.readbit(4))
---  --Assume line 4 is set high, and it is then read. Output: 
--- ```
---@return any data The state of the I/O line 
---@param N any Digital I/O line number to be read (1 to 14) 
function digio.readbit(N) end


--- **This function reads the digital I/O port. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the value of the input lines on the I/O port. The least significant bit (bit B1) of the binary number corresponds to line 1; bit B14 corresponds to line 14.For example, a returned value of 170 has a binary equivalent of 000000010101010, which indicates that lines 2, 4, 6, and 8 are high (1), and the other 10 lines are low (0).
---
---<br>*Examples:*<br>
--- ```lua
--- data = digio.readport()
--- print(data)
---  --Assume lines 2, 4, 6, and 8 are set high when the I/O port is read. Output: This is binary 10101010. 
--- ```
---@return any data The present value of the input lines on the digital I/O port 
function digio.readport() end


--- **This function sets a digital I/O line high or low. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the output line is write‑protected using the digio.writeprotect attribute, the command is ignored.The reset() function does not affect the present state of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.The data must be zero (0) to clear the bit. Any value other than zero (0) sets the bit.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writebit(4, 0)
---  --Sets digital I/O line 4 low (0). 
--- ```
---@param N any Digital I/O trigger line (1 to 14) 
---@param data any The value to write to the bit: 0 (low) Non‑zero (high) 
function digio.writebit(N, data) end


--- **This function writes to all digital I/O lines. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern to be written to the I/O port. For example, a data value of 170 has a binary equivalent of 00000010101010. Lines 2, 4, 6, and 8 are set high (1), and the other 10 lines are set low (0).Write‑protected lines are not changed.The reset() function does not affect the present states of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeport(255)
---  --Sets digital I/O Lines 1 through 8 high (binary 00000011111111). 
--- ```
---@param data any Value to write to the port (0 to 16383) 
function digio.writeport(data) end


--- **This function clears all lines of the front‑panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function switches to the user screen and then clears the front‑panel display.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function display.clear() end


--- **This function reads the annunciators (indicators) that are presently turned on.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a bitmasked value showing which indicators are turned on. The 16‑bit binary equivalent of the returned value is the bitmask. The return value is a sum of set annunciators, based on the weighted value, as shown in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- display.ANNUNCIATOR_FILTER
--- display.ANNUNCIATOR_MATH
--- display.ANNUNCIATOR_4_WIRE
--- display.ANNUNCIATOR_AUTO
--- display.ANNUNCIATOR_ARM
--- display.ANNUNCIATOR_TRIGGER
--- display.ANNUNCIATOR_STAR
--- display.ANNUNCIATOR_SAMPLE
--- display.ANNUNCIATOR_EDIT
--- display.ANNUNCIATOR_ERROR
--- display.ANNUNCIATOR_REMOTE
--- display.ANNUNCIATOR_TALK 
--- display.ANNUNCIATOR_LISTEN
--- display.ANNUNCIATOR_SRQ
--- display.ANNUNCIATOR_REAR
--- display.ANNUNCIATOR_REL
---  --REL 
--- ```
---@return any annunciators The bitmasked value that shows which indicators are turned on 
function display.getannunciators() end


--- **This function reads the present position of the cursor on the front‑panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function switches the front‑panel display to the user screen (the text set by display.settext()), and then returns values to indicate the row that contains the cursor and the column position and cursor style.Columns are numbered from left to right on the display.
---
---<br>*Examples:*<br>
--- ```lua
--- testRow, testColumn = display.getcursor()
--- print(testRow, testColumn)
---  --This example reads the cursor position into local variables and prints them. Example output: 
--- ```
---@return any row The row where the cursor is: 1 (top row); 2 (bottom row) 
---@return any column The column where the cursor is: If the cursor is in the top row: 1 to 20 If the cursor is in the bottom row: 1 to 32 
---@return any style Visibility of the cursor: Invisible: 0 Blinking: 1 
function display.getcursor() end


--- **This function retrieves the key code for the last pressed key.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A history of the key code for the last pressed front‑panel key is maintained by the instrument. When the instrument is turned on, or when it is transitioning from local to remote operation, the key code is set to 0 (display.KEY_NONE).Pressing the EXIT (LOCAL) key normally aborts a script. To use this function with the EXIT (LOCAL) key, you must set display.locallockout to display.LOCK.The table below lists the keyCode value for each front‑panel action.You cannot use this function to track the OUTPUT ON/OFF controls for SMU A or SMU B.
---
---<br>*Examples:*<br>
--- ```lua
--- display.KEY_NONE
--- display.KEY_ENTER
--- display.KEY_RANGEUP
--- display.KEY_MEASB
--- display.KEY_RELB
--- display.DIGITSB
--- display.KEY_MENU
--- display.KEY_RECALL
--- display.KEY_MODEA
--- display.KEY_MEASA
--- display.KEY_RELA
--- display.KEY_DIGITSA
--- display.KEY_RUN
--- display.KEY_LIMITB
--- display.KEY_DISPLAY
--- display.KEY_SPEEDB
--- display.KEY_AUTO
--- display.KEY_TRIG
--- display.KEY_FILTERB
--- display.KEY_LIMITA
--- display.KEY_EXIT
--- display.KEY_SPEEDA
--- display.KEY_SRCB
--- display.KEY_LOAD
--- display.KEY_FILTERA
--- display.WHEEL_ENTER
--- display.KEY_STORE
--- display.KEY_RIGHT
--- display.KEY_SRCA
--- display.KEY_LEFT
--- display.KEY_CONFIG
--- display.WHEEL_LEFT
--- display.KEY_RANGEDOWN
--- display.WHEEL_RIGHT
---  --
--- ```
---@return any keyCode A returned value that represents the last front-panel key pressed; see Details for more information 
function display.getlastkey() end


--- **This function reads the text displayed on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Using the command without any parameters returns both lines of the front‑panel display.The $N character code is included in the returned value to show where the top line ends and the bottom line begins. This is not affected by the value of embellished.When embellished is set to true, all other character codes are returned along with the message. When embellished is set to false, only the message and the $N character code is returned. For information on the embedded character codes, see display.settext().The display is not switched to the user screen (the screen set using display.settext()). Text is read from the active screen.
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.setcursor(1, 1)
--- display.settext("ABCDEFGHIJ$DKLMNOPQRST")
--- display.setcursor(2, 1)
--- display.settext("abcdefghijklm$Bnopqrstuvwxyz$F123456")
--- print(display.gettext())
--- print(display.gettext(true))
--- print(display.gettext(false, 2))
--- print(display.gettext(true, 2, 9))
--- print(display.gettext(false, 2, 9, 10))
---  --This example shows how to retrieve the display text in multiple ways. The output is:   
--- ```
---@return any text The returned value, which contains the text that is presently displayed 
---@param embellished any Indicates type of returned text: false (simple text); true (text with embedded character codes) 
---@param row any Selects the row from which to read the text: 1 (row 1); 2 (row 2). If row is not included, both rows of text are read 
---@param columnStart any Selects the first column from which to read text; for row 1, the valid column numbers are 1 to 20; for row 2, the valid column numbers are 1 to 32; if nothing is selected, 1 is used 
---@param columnEnd any Selects the last column from which to read text; for row 1, the valid column numbers are 1 to 20; for row 2, the valid column numbers are 1 to 32; the default is 20 for row 1, and 32 for row 2 
---@overload fun()
---@overload fun(embellished)
---@overload fun(embellished, row)
---@overload fun(embellished, row, columnStart)
function  display.gettext(embellished, row, columnStart, columnEnd) end


--- **This function displays a formatted input field on the front‑panel display that the operator can edit.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The format parameter uses zeros (0), the decimal point, polarity sign, and exponents to define how the input field is formatted. The format parameter can include the options shown in the following table.The default parameter is the value shown when the value is first displayed.You can use the minimum and maximum parameters to limit the values that can be entered. When + is not selected for format, the minimum limit must be more than or equal to zero (0). When limits are used, you cannot enter values above or below these limits.The input value is limited to ±1e37.Before calling display.inputvalue(), you should send a message prompt to the operator using display.prompt(). Make sure to position the cursor where the edit field should appear.After this command is sent, script execution pauses until you enter a value and press the ENTER key.For positive and negative entry (plus sign (+) used for the value field and the exponent field), polarity of a nonzero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel. Polarity is also toggled when using the navigation wheel to decrease or increase the value or exponent past zero. A zero (0) value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After executing this command and pressing the EXIT (LOCAL) key, the function returns nil.
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext("Enter value between$N  -0.10 and 2.00:  ")
--- value = display.inputvalue("+0.00", 0.5, -0.1, 2.0)
--- print("Value entered = ", value)
---  --Displays an editable field (+0.50) for operator input. The valid input range is −0.10 to +2.00, with a default of 0.50. Output: 
--- ```
---@param format any A string that defines how the input field is formatted; see Details for more information 
---@param default any The default value for the input value 
---@param minimum any The minimum input value 
---@param maximum any The maximum input value 
---@overload fun(format)
---@overload fun(format, default)
---@overload fun(format, default, minimum)
function display.inputvalue(format, default, minimum, maximum) end


--- **This function adds an entry to the USER menu, which can be accessed by pressing the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After adding code to the load menu, you can run it from the front panel by pressing the LOAD key, then selecting USER to select from the available code to load. Pressing the RUN key then runs the script.You can add items in any order. They are always displayed in alphabetical order when the menu is selected.Any Lua code can be included in the code parameter. If memory is set to display.SAVE, the entry (name and code) is saved in nonvolatile memory. Scripts, functions, and variables used in the code are not saved by display.SAVE. Functions and variables need to be saved with the code. If the code is not saved in nonvolatile memory, it is lost when the 2600B is turned off. See Example 2 below.If you do not make a selection for memory, the code is automatically saved to nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.add("Test9", "Test9()")
---  --Assume a user script named Test9 is loaded into the runtime environment. Adds the menu entry to the USER menu to run the script after loading. 
--- ```
---@param displayName any The name that is added to the USER menu 
---@param code any The code that is run from the USER menu 
---@param memory any Determines if code is saved to nonvolatile memory: 0 or display.DONT_SAVE: Does not save the code to nonvolatile memory 1 or display.SAVE: Saves the code to nonvolatile memory (default) 
---@overload fun(displayName, code)
function display.loadmenu.add(displayName, code, memory) end


--- **This function removes an entry from the USER menu, which can be accessed using the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you delete an entry from the USER menu, you can no longer run it by pressing the LOAD key.
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.delete("Test9")
--- for displayName, code in display.loadmenu.catalog() do
---    print(displayName, code)
--- end
---  --Deletes the entry named Test9. Output: 
--- ```
---@param displayName any The name to be deleted from the USER menu 
function display.loadmenu.delete(displayName) end


--- **This function presents a menu on the front‑panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The menu consists of the menu name string on the top line, and a selectable list of items on the bottom line. The menu items must be a single string with each item separated by whitespace. The name for the top line is limited to 20 characters.After sending this command, script execution pauses for the operator to select a menu item. An item is selected by rotating the navigation wheel to place the blinking cursor on the item, and then pressing the navigation wheel (or the ENTER key). When an item is selected, the text of that selection is returned.Pressing the EXIT (LOCAL) key does not abort the script while the menu is displayed, but it does return nil. The script can be aborted by calling the exit function when nil is returned.
---
---<br>*Examples:*<br>
--- ```lua
--- selection = display.menu("Menu", "Test1 Test2 Test3")
--- print(selection)
---  --Displays a menu with three menu items. If the second menu item is selected, selection is given the value Test2. Output: 
--- ```
---@return any selection Name of the variable that holds the selected menu item 
---@param name any Menu name to display on the top line 
---@param items any Menu items to display on the bottom line 
function display.menu(name,items) end


--- **This function prompts the user to enter a parameter from the front panel of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function creates an editable input field at the present cursor position, and an input prompt message on the bottom line. Example of a displayed input field and prompt:0.00VInput 0 to +2VThe format parameter uses zeros (0), the decimal point, polarity sign, and exponents to define how the input field is formatted.The format parameter can include the options shown in the following table.You can use the minimum and maximum parameters to limit the values that can be entered. When a plus sign (+) is not selected for format, the minimum limit must be greater than or equal to zero (0). When limits are used, the operator cannot enter values above or below these limits.The input value is limited to ±1e37.After sending this command, script execution pauses for the operator to enter a value and press ENTER.For positive and negative entry (plus sign (+) used for the value field and the exponent field), polarity of a nonzero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel. Polarity also toggles when using the navigation wheel to decrease or increase the value or exponent past zero. A zero value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After executing this command and pressing the EXIT (LOCAL) key, the value returns nil.
---
---<br>*Examples:*<br>
--- ```lua
---  
--- 0.00000E+0
--- +0.00
--- +00.0000E+00
--- +0.00
---  --
--- ```
---@param format any A string that defines how the input field is formatted; see Details for more information 
---@param units any Set the units text string for the top line (eight characters maximum); this indicates the units (for example, "V" or "A") for the value 
---@param help any Text string to display on the bottom line (32 characters maximum) 
---@param default any The value that is shown when the value is first displayed 
---@param minimum any The minimum input value that can be entered 
---@param maximum any The maximum input value that can be entered (must be more than minimum) 
---@overload fun(format, units, help)
---@overload fun(format, units, help, default)
---@overload fun(format, units, help, default, minimum)
function display.prompt(format, units, help, default, minimum, maximum) end


--- **This function sends a code that simulates the action of a front‑panel control.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command simulates pressing a front‑panel key or navigation wheel, or turning the navigation wheel one click to the left or right.
---
---<br>*Examples:*<br>
--- ```lua
--- display.KEY_RANGEUP
--- display.KEY_MEASB
--- display.KEY_MODEB
--- display.KEY_DIGITSB
--- display.KEY_RELB
--- display.KEY_RECALL
--- display.KEY_MENU
--- display.KEY_MEASA
--- display.KEY_MODEA
--- display.KEY_DIGITSA
--- display.KEY_RELA
--- display.KEY_OUTPUTA
--- display.KEY_RUN
--- display.KEY_LIMITB
--- display.KEY_DISPLAY
--- display.KEY_SPEEDB
--- display.KEY_AUTO
--- display.KEY_TRIG
--- display.KEY_FILTERB
--- display.KEY_LIMITA
--- display.KEY_EXIT
--- display.KEY_SPEEDA
--- display.KEY_SRCB
--- display.KEY_LOAD
--- display.KEY_FILTERA
--- display.KEY_OUTPUTB
--- display.KEY_STORE
--- display.WHEEL_ENTER
--- display.KEY_SRCA
--- display.KEY_RIGHT
--- display.KEY_CONFIG
--- display.KEY_LEFT
--- display.KEY_RANGEDOWN
--- display.WHEEL_LEFT
--- display.KEY_ENTER
--- display.WHEEL_RIGHT
---  --
--- ```
---@param keyCode any A parameter that specifies the key press to simulate; see Details for more information 
function display.sendkey(keyCode) end


--- **This function sets the position of the cursor.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Sending this command selects the user screen and then moves the cursor to the given location.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.An out‑of-range parameter for row sets the cursor to row 2. An out‑of‑range parameter for column sets the cursor to column 20 for row 1, or 32 for row 2.An out‑of‑range parameter for style sets it to 0 (invisible).A blinking cursor is only visible when it is positioned over displayed text. It cannot be seen when positioned over a space character.
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.setcursor(1, 8)
--- display.settext("Hello")
--- display.setcursor(2, 14)
--- display.settext("World")
---  --This example displays a message on the front panel, approximately center. Note that the top line of text is larger than the bottom line of text. The front panel of the instrument displays Hello on the top line and World on the second line. 
--- ```
---@param row any The row number for the cursor (1 or 2) 
---@param column any The active column position to set; row 1 has columns 1 to 20, row 2 has columns 1 to 32 
---@param style any Set the cursor to invisible (0, default) or blinking (1) 
---@overload fun(row, column)
function display.setcursor(row, column, style) end


--- **This function displays text on the front‑panel user screen.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function selects the user display screen and displays the given text.After the instrument is turned on, the first time you use a display command to write to the display, the message "User Screen" is cleared. After the first write, you need to use display.clear() to clear the message.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.The text starts at the present cursor position. After the text is displayed, the cursor is after the last character in the display message.Top line text does not wrap to the bottom line of the display automatically. Any text that does not fit on the current line is truncated. If the text is truncated, the cursor remains at the end of the line.The text remains on the display until replaced or cleared.The character codes described in the following table can also be included in the text string.
---
---<br>*Examples:*<br>
--- ```lua
--- $N
--- $R
--- $B
--- $D
--- $F
--- $$
---  --Escape sequence to display a single dollar symbol ($) 
--- ```
---@param text any Text message to be displayed, with optional character codes 
function display.settext(text) end


--- **This function clears the front‑panel trigger event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector remembers if an event has been detected since the last display.trigger.wait() call. This function clears the trigger event detector and discards the previous history of TRIG key presses.This attribute also clears the display.trigger.overrun attribute.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function display.trigger.clear() end


--- **This function waits for the TRIG key on the front panel to be pressed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the trigger key was previously pressed and one or more trigger events were detected, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.Use the display.trigger.clear() call to clear the trigger event detector.
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = display.trigger.wait(5)
--- print(triggered)
---  --Waits up to five seconds for the TRIG key to be pressed. If TRIG is pressed within five seconds, the output is true. If not, the output is false. 
--- ```
---@return any triggered true: Trigger was detected false: The operation timed out 
---@param timeout any Timeout in seconds 
function display.trigger.wait(timeout) end


--- **This function captures the key code value for the next front‑panel action.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After you send this function, script execution pauses until a front‑panel action (for example, pressing a key or the navigation wheel, or turning the navigation wheel). After the action, the value of the key (or action) is returned.If the EXIT (LOCAL) key is pressed while this function is waiting for a front‑panel action, the script is not aborted.A typical use for this function is to prompt the user to press the EXIT (LOCAL) key to abort the script or press any other key to continue. For example, if the keyCode value 75 is returned (the EXIT (LOCAL) key was pressed), you can call the exit() function to abort the script.The table below lists the keyCode values for each front panel action.
---
---<br>*Examples:*<br>
--- ```lua
--- display.KEY_RANGEUP
--- display.KEY_MEASB
--- display.KEY_MODEB
--- display.KEY_DIGITSB
--- display.KEY_RELB
--- display.KEY_RECALL
--- display.KEY_MENU
--- display.KEY_MEASA
--- display.KEY_MODEA
--- display.KEY_DIGITSA
--- display.KEY_RELA
--- display.KEY_OUTPUTA
--- display.KEY_RUN
--- display.KEY_LIMITB
--- display.KEY_DISPLAY
--- display.KEY_SPEEDB
--- display.KEY_AUTO
--- display.KEY_TRIG
--- display.KEY_FILTERB
--- display.KEY_LIMITA
--- display.KEY_EXIT
--- display.KEY_SPEEDA
--- display.KEY_SRCB
--- display.KEY_LOAD
--- display.KEY_FILTERA
--- display.KEY_OUTPUTB
--- display.KEY_STORE
--- display.WHEEL_ENTER
--- display.KEY_SRCA
--- display.KEY_RIGHT
--- display.KEY_CONFIG
--- display.KEY_LEFT
--- display.KEY_RANGEDOWN
--- display.WHEEL_LEFT
--- display.KEY_ENTER
--- display.WHEEL_RIGHT
---  --  
--- ```
---@return any keyCode See Details for more information 
function display.waitkey() end


--- **This function clears all entries out of the error queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function errorqueue.clear() end


--- **This function reads the oldest entry from the error queue and removes it from the queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Entries are stored in a first-in, first-out (FIFO) queue. This function reads the oldest entry and removes it from the queue.Error codes and messages are listed in the Error summary list.If there are no entries in the queue, code 0, Queue is Empty, is returned.In an expanded system, each TSP‑Link enabled instrument is assigned a node number. The variable errorNode stores the node number where the error originated. The errorNode is always 1 on the 2604B/2614B/2634B.
---
---<br>*Examples:*<br>
--- ```lua
--- errorcode, message = errorqueue.next()
--- print(errorcode, message)
---  --Reads the oldest entry in the error queue. The output below indicates that the queue is empty. Output: 
--- ```
---@return any errorCode The error code number for the entry 
---@return any message The message that describes the error code 
---@return any severity The severity level (0, 10, 20, 30, or 40); see Details for more information 
---@return any errorNode The node number where the error originated 
function errorqueue.next() end


--- **This function returns all entries from the event log as a single string and removes them from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns all events in the event log. Logged items are shown from oldest to newest. The response is a string that has the messages delimited with a new line character.This function also clears the event log.If there are no entries in the event log, this function returns the value nil.
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.all())
---  --Get and print all entries from the event log and remove the entries from the log. Output: 
--- ```
---@return any logString A listing of all event log entries 
function eventlog.all() end


--- **This function clears the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command removes all messages from the event log.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function eventlog.clear() end


--- **This function returns the oldest unread event message from the event log and removes it from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the next entry from the event log and removes it from the log.If there are no entries in the event log, returns the value nil.
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.next())
---  --Get the oldest message in the event log and remove that entry from the log. Output: 
--- ```
---@return any logString The next log entry 
function eventlog.next() end


--- **This function stops a script that is presently running.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Terminates script execution when called from a script that is being executed.This command does not wait for overlapped commands to complete before terminating script execution. If overlapped commands are required to finish, use the waitcomplete() function before calling exit().
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function exit() end


--- **This function closes the file that is represented by the fileVar variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is equivalent to io.close(fileVar).Note that files are automatically closed when the file descriptors are garbage collected.
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
---  --Opens file myfile.txt for writing. If no errors were found while opening, writes Removing file and closes the file. 
--- ```
function io_object:close() end


--- **This function writes buffered data to a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The fileVar:write() or io.write() functions buffer data, which may not be written immediately to the USB flash drive. Use fileVar:flush() to flush this data. Using this function removes the need to close a file after writing to it, allowing the file to be left open to write more data. Data may be lost if the file is not closed or flushed before a script ends. If there is going to be a time delay before more data is written to a file, and you want to keep the file open, flush the file after you write to it to prevent loss of data.
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
---  --Writes data to a USB flash drive. 
--- ```
function io_object:flush() end


--- **This function reads data from a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The format parameters may be any of the following:"*n": Returns a number."*a": Returns the whole file, starting at the current position (returns an empty string if the current file position is at the end of the file)."*l": Returns the next line, skipping the end of line; returns nil if the current file position is at the end of file.n: Returns a string with up to n characters; returns an empty string if n is zero; returns nil if the current file position is at the end of file.If no format parameters are provided, the function performs as if the function is passed the value "*l".Any number of format parameters may be passed to this command, each corresponding to a returned data value.
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
---  --Reads data from the input file. 
--- ```
---@return any data1 First data read from the file 
---@return any data2 Second data read from the file 
---@param format1 any A string or number indicating the first type of data to be read 
---@param format2 any A string or number indicating the second type of data to be read 
---@overload fun()	
---@overload fun(format1)
---@overload fun(format1, ...)
function  io_object:read(format1, format2) end


--- **This function sets and gets the present position of a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The whence parameters may be any of the following:"set": Beginning of file"cur": Current position"end": End of fileIf an error is encountered, it is logged to the error queue, and the command returns nil and the error string.
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
---  --Get the present position of a file. 
--- ```
---@return any position The new file position, measured in bytes from the beginning of the file 
---@return any errorMsg A string containing the error message 
---@param whence any A string indicating the base against which offset is applied; the default is "cur" 
---@param offset any The intended new position, measured in bytes from a base indicated by whence (default is 0) 
---@overload fun()
---@overload fun(whence)
function  io_object:seek(whence, offset) end


--- **This function writes data to a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function may buffer data until a flush (fileVar:flush() or io.flush()) or close (fileVar:close() or io.close()) operation is performed.
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
---  --Write data to a file. 
--- ```
---@param data1 any The first data to write to the file 
---@param data2 any The second data to write to the file 
---@overload fun(data)
---@overload fun(data1, ...)
function io_object:write(data1, data2) end


--- **This function sets the current working directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The new working directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the given path does not exist.
---
---<br>*Examples:*<br>
--- ```lua
--- if fs.is_dir("/usb1/temp") == true then
---   fs.chdir("/usb1/temp")
---   testPath = fs.cwd()
---   print(testPath)
--- else
---   testPath = fs.cwd()
---   print(testPath)
--- end
---  --Insert a USB flash drive into the front panel of the instrument. Verify that /usb1/temp is a directory and change it to be the current working directory. Set the variable for the current working directory to be testPath. The return should be: If /usb1/temp is not a directory, set the variable for the current working directory to be testPath. The return is: 
--- ```
---@return any workingDirectory Returned value containing the working path 
---@param path any A string indicating the new working directory path 
function fs.chdir(path) end


--- **This function returns the absolute path of the current working directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- if fs.is_dir("/usb1/temp") == true then
---   fs.chdir("/usb1/temp")
---   testPath = fs.cwd()
---   print(testPath)
--- else
---   testPath = fs.cwd()
---   print(testPath)
--- end
---  --Insert a USB flash drive into the front panel of the instrument. Verify that /usb1/temp is a directory and change it to be the current working directory. Set the variable for the current working directory to be testPath. The return should be: If /usb1/temp is not a directory, set the variable for the current working directory to be testPath. The return is: 
--- ```
---@return any path The absolute path of the current working directory 
function fs.cwd() end


--- **This function tests whether or not the specified path refers to a directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file system path may be absolute or relative to the current working system path.
---
---<br>*Examples:*<br>
--- ```lua
--- print("Is directory: ", fs.is_dir("/usb1/"))
---  --Because /usb1/ is always the root directory of an inserted flash drive, you can use this command to verify that USB flash drive is inserted. 
--- ```
---@return any status Whether or not the given path is a directory (true or false) 
---@param path any The path of the file system entry to test 
function fs.is_dir(path) end


--- **Tests whether the specified path refers to a file (as opposed to a directory).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file system path may be absolute or relative to the current working system path.
---
---<br>*Examples:*<br>
--- ```lua
--- rootDirectory = "/usb1/"
--- print("Is file: ", fs.is_file(rootDirectory))
---  --Insert a USB flash drive into the front panel of the instrument. Set rootDirectory to be the USB port. Check to see if rootDirectory is a file. Because rootDirectory was set up as a directory, the return is false. 
--- ```
---@return any status true if the given path is a file; otherwise, false 
---@param path any The path of the file system entry to test 
function fs.is_file(path) end


--- **This function creates a directory at the specified path.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the parent folder of the new directory does not exist, or if a file system entry already exists at the given path.
---
---<br>*Examples:*<br>
--- ```lua
--- if fs.is_dir("/usb1/temp") == false then
---     fs.mkdir("/usb1/temp")
--- end
---  --Insert a USB flash drive into the front panel of the instrument. Check to see if the temp directory exists. If it does not exist, create a directory named temp. 
--- ```
---@return any path The returned path of the new directory 
function fs.mkdir(newPath) end


--- **This function returns a list of the file system entries in the directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The directory path may be absolute or relative to the current working directory.This command is nonrecursive. For example, entries in subfolders are not returned.An error is logged to the error queue if the given path does not exist or does not represent a directory.
---
---<br>*Examples:*<br>
--- ```lua
--- rootDirectory = "/usb1/"
--- entries = fs.readdir(rootDirectory)
--- count = table.getn(entries)
--- print("Found a total of "..count.." files and directories")
--- for i = 1, count do
---    print(entries[i])
--- end
---  --Insert a USB flash drive into the front panel of the instrument. Set rootDirectory to be the USB port. Set entries as the variable for the file system entries in rootDirectory. Return the number of files and directories in the directory. 
--- ```
---@return any files A table containing the names of all the file system entries in the specified directory 
---@param path any The directory path 
function fs.readdir(path) end


--- **This function removes a directory from the file system.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This path may be absolute or relative to the present working directory.An error is logged to the error queue if the given path does not exist or does not represent a directory. An error is also logged if the directory is not empty.
---
---<br>*Examples:*<br>
--- ```lua
--- rootDirectory = "/usb1/"
--- tempDirectoryName = "temp"
--- if fs.is_dir(rootDirectory..tempDirectoryName) == false then
---     fs.mkdir(rootDirectory..tempDirectoryName)
--- end
--- fs.rmdir(rootDirectory..tempDirectoryName)
---  --Insert a USB flash drive into the front panel of the instrument. Set rootDirectory to be the USB port. Set tempDirectoryName to be equivalent to temp. Check to see if tempDirectoryName exists. If it does not exist, create a directory named temp. Remove the directory. 
--- ```
---@param path any The path of the directory to remove 
function fs.rmdir(path) end


--- **This function retrieves the local time zone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- See settimezone() for additional details about the time zone format and a description of the fields.timeZone can be in either of the following formats:
---
---<br>*Examples:*<br>
--- ```lua
--- timezone = gettimezone()
---  --Reads the value of the local time zone. 
--- ```
---@return any timeZone The local time zone of the instrument 
function gettimezone() end


--- **This KIParlib factory script function performs a linear current sweep and calculates the transconductance (Gm) at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Output data includes transconductance values, reading buffer with measured voltages, reading buffer with measured voltages and currents.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.The gm_isweep() function performs a linear current sweep, measuring voltage and current, and then calculating the transconductance (Gm) at each point using the central difference method. It can return an array of Gm values, a reading buffer with the measured voltages, and a reading buffer with the measured currents.
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
---  --Source‑measure unit (SMU) A returns Gm values only.   SMU A returns Gm and reading buffer with measured voltages.   SMU A returns Gm and reading buffers with measured voltages and currents. 
--- ```
---@return any gm_array A Lua table containing the calculated Gm values at each point 
---@return any vbuf A reading buffer containing the measured voltage at each point 
---@return any ibuf A reading buffer containing the measured current at each point 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param start_i any Starting current level of the sweep  
---@param stop_i any Ending current level of the sweep  
---@param points any Number of measurements between start_i and stop_i (must be ≥2) 
function gm_isweep(smu,start_i,stop_i,points) end


--- **This KIParlib factory script function performs a linear voltage sweep and calculates the transconductance (Gm) at each point.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Output data includes transconductance values, reading buffer with measured currents, reading buffer with measured currents and voltages.The gm_vsweep() function performs a linear voltage sweep, measuring voltage and current, and then calculating the transconductance (Gm) at each point using the central difference method. It can return an array of Gm values, a reading buffer with the measured currents, and a reading buffer with the measured voltages.
---
---<br>*Examples:*<br>
--- ```lua
--- gm_array = gm_vsweep(smua, 0, 5, 20)
---  
--- gm_array, ibuf = gm_vsweep(smua, 0, 5, 20)
---  
---  
--- gm_array, ibuf, vbuf = gm_vsweep(smua, 0, 5, 20)
---  --SMU A returns Gm values only.   SMU A returns Gm and reading buffer with measured currents.   SMU A returns Gm and reading buffers with measured currents and voltages. 
--- ```
---@return any gm_array A Lua table containing the calculated Gm values at each point 
---@return any ibuf A reading buffer containing the measured current at each point 
---@return any vbuf A reading buffer containing the measured voltage at each point 
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param start_v any Starting voltage level of the sweep  
---@param stop_v any Ending voltage level of the sweep  
---@param points any Number of measurements between start_v and stop_v (must be ≥ 2) 
function gm_vsweep(smu,start_v,stop_v,points) end


--- **This KIHighC factory script function performs a current leakage measurement after stepping the output voltage.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to:When measuring leakage current:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
--- smua.source.levelv = 5
--- smua.source.output = smua.OUTPUT_ON
--- delay(1)
--- imeas = i_leakage_measure(smua, 0, 1, 300e-3, 10e-6, 0.1)
---  --Enable high-capacitance mode. Charge the capacitor at 5 V for 1 second set by delay(1).   The parameters passed on to the i_leakage_measure() function in this example are: The levels and delays depend on the value and type of capacitor used. 
--- ```
---@return any imeas The measured current 
---@param smuX any Instrument channel (for example, smua refers to SMU channel A) 
---@param levelv any Voltage level to step to when this function is called 
---@param limiti any Current limit setting for the voltage step 
---@param sourcedelay any Delay to wait before lowering the current limit for measurement 
---@param measurei any Current limit (and measure range); the current limit is lower at this level and because high-capacitance mode is active, the measure range follows 
---@param measuredelay any Delay to wait after lowering the current limit before making the measurement 
function i_leakage_measure(smuX,levelv,limiti,sourcedelay,measurei,measuredelay) end


--- **This KIHighC factory script function measures the current and compares it to a threshold. This continues until either the measured current drops below the threshold or the timeout expires.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to:When testing the leakage current threshold:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
--- smua.source.levelv = 5
--- smua.source.output = smua.OUTPUT_ON
--- delay(1)
--- pass = i_leakage_threshold(smua, 0, 1, 300e-3, 10e-6, 100e-3, 1e-6, 1)
---  --Enable high-capacitance mode. Charge the capacitor.    The parameters passed on to the i_threshold_measure() function in this example are: The levels and delays depend on the value and type of capacitor used. Sets pass = true if the current is measured below 1 µA in less than 1 second. 
--- ```
---@return any f A Boolean flag; this flag is true when the current is below the threshold, false if threshold is not reached before timeout expires 
---@param smuX any Source‑measure unit (SMU) channel (for example, smua applies to SMU channel A) 
---@param levelv any Voltage level to step to when this function is called 
---@param limiti any Current limit setting for the voltage step 
---@param sourcedelay any Delay to wait before lowering the current limit for measurement 
---@param measurei any Current limit (and measure range); the current limit is lower at this level and because high-capacitance mode is active, the measure range follows 
---@param measuredelay any Delay before the first measurement after measure range is changed 
---@param threshold any The specified current that establishes the test limit 
---@param timeout any Amount of time (in seconds) to wait for the current to drop to threshold after all the delays have occurred 
function i_leakage_threshold(smuX,levelv,limiti,sourcedelay,measurei,measuredelay,threshold,timeout) end


--- **This KIPulse factory script function initiates the pulse configuration assigned to tag.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function only initiates configured pulse trains assigned to a valid tag. Configure the pulse before initiating it using one of the ConfigurePulse* functions (refer to the Also see section).
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
---  --Configure channel A to generate a pulse train. If no errors are encountered, initiate the pulse train. Channel A pulses voltage from a bias level of 0 V to a pulse level of 5 V. The pulse level is present for 2 ms and the bias level for 200 ms, with a 1 A limit setting. A total of 10 pulses is generated, and the measurement data is stored in smua.nvbuffer1. This pulse train is assigned to tag = 1. 
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors are encountered 
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string that indicates successful configuration 
---@param tag any Numeric identifier of the pulse configuration to be initiated 
function InitiatePulseTest(tag) end


--- **This KIPulse factory script function initiates the pulse configuration assigned tag1 and tag2.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The pulse trains associated with the indicated tags are generated simultaneously. This is useful when testing devices such as voltage regulators, where the input signal and output load must be applied to the instrument at the same time. When using this function, each tag1 pulse encapsulates each tag2 pulse in time. Specifically, the tag1 pulse transitions from its bias level to its pulse level before the tag2 pulse. Both the tag1 and tag2 pulses return to their respective bias levels at approximately the same time. Measurements for both pulse trains occur at the same time (see the waveform in the figure below).To provide this encapsulation, the following rules are enforced:
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
---  --Set up channels A and B for pulse operation, configure pulse trains for each channel, and then initiate the pulse trains if no errors are encountered. Channel A pulses voltage from a bias level of 0 V to pulse level of 5 V. The pulse level is present for 2 ms, and the bias level for 200 ms with a 1 A limit setting. A total of 10 pulses is generated on channel A and the measurement data is stored in smua.nvbuffer1. This pulse train is assigned to tag = 1. Channel B pulses current from a bias level of 0 A to pulse level of 1 A. The pulse level is present for 1 ms, and the bias level for 200 ms with a 5 V limit setting. A total of 10 pulses is generated on channel B, and the measurement data is stored in smub.nvbuffer1. This pulse train is assigned to tag = 2. 
--- ```
---@return any f A Boolean flag; this flag is true when the pulse was successfully configured, false when errors were encountered  
---@return any msg A string message; if the f flag is false, msg contains an error message; if it is true, msg contains a string indicating successful configuration 
---@param tag1 any Numeric identifier of the first pulse configuration to be initiated 
---@param tag2 any Numeric identifier of the second pulse configuration to be initiated 
function InitiatePulseTestDual(tag1,tag2) end


--- **This function closes a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If a file is not specified, the default output file closes.Only io.close(), used without specifying a parameter, can be accessed from a remote node.
---
---<br>*Examples:*<br>
--- ```lua
--- testFile, testError = io.open("testfile.txt", "w")
--- if nil == testError then
---    testFile:write("This is my test file")
---    io.close(testFile)
--- end
---  --Opens file testfile.txt for writing. If no errors were found while opening, writes "This is my test file" and closes the file. 
--- ```
---@param file any The descriptor of the file to close 
---@overload fun()
function io.close(file) end


--- **This function saves buffered data to a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must use the io.flush() or io.close() functions to write data to the file system.This function only flushes the default output file.Using this command removes the need to close a file after writing to it and allows it to be left open to write more data. Data may be lost if the file is not closed or flushed before an application ends. To prevent the loss of data if there is going to be a time delay before more data is written (and when you want to keep the file open and not close it), flush the file after writing to it.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function io.flush() end


--- **This function assigns a previously opened file, or opens a new file, as the default input file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The newfile path may be absolute or relative to the current working directory.When using this function from a remote TSP-Link® node, this command does not accept a file descriptor and does not return a value.If the function fails, an error message is returned.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
---@return io_object fileVar The descriptor of the input file or an error message (if the function fails) 
---@param newfile any A string representing the path of a file to open as the default input file, or the file descriptor of an open file to use as the default input file 
---@overload fun()
function  io.input(newfile) end


--- **This function opens a file for later reference.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path to the file to open may be absolute or relative to the current working directory. If you successfully open the file, errorMsg is nil and fileVar has the descriptor used to access the file.If an error is encountered, the command returns nil for fileVar and an error string.
---
---<br>*Examples:*<br>
--- ```lua
--- testFile, testError = io.open("testfile.txt", "w")
--- if testError == nil then
---    testFile:write("This is my test file")
---    io.close(testFile)
--- end
---  --Opens file testfile.txt for writing. If no errors were found while opening, writes "This is my test file" and closes the file. 
--- ```
---@return io_object fileVar The descriptor of the opened file 
---@return any errorMsg Indicates whether an error was encountered while processing the function 
---@param path any The path of the file to open 
---@param mode any A string representing the intended access mode ("r" = read, "w" = write, and "a" = append) 
---@overload fun(path)
function  io.open(path, mode) end


--- **This function assigns a previously opened file or opens a new file as the default output file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path of the file to open may be absolute or relative to the current working directory.When accessed from a remote node using the TSP-Link network, this command does not accept a file descriptor parameter and does not return a value.If the function fails, an error message is returned.
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
--- print("\n*** io.output")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1")
--- myfile:close()
--- do
--- fileHandle = io.output(fileName)
--- print(fileHandle)
--- end
--- io.close(fileHandle)
--- print(fileHandle)
--- os.remove(fileName)
---  --Assign the file to be the default output file. 
--- ```
---@return io_object fileVar The descriptor of the output file or an error message (if the function fails) 
---@param newfile any A file descriptor to assign (or the path of a file to open) as the default output file 
---@overload fun()
function  io.output(newfile) end


--- **This function reads data from the default input file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The format parameters may be any of the following:Any number of format parameters may be passed to this command, each corresponding to a returned data value.
---
---<br>*Examples:*<br>
--- ```lua
--- "*n"
--- "*a"
--- "*l"
--- N
---  --Returns a string with up to N characters; returns an empty string if N is zero (0); returns nil if the present file position is at the end of file 
--- ```
---@return any data1 The data read from the file 
---@return any data2 The data read from the file 
---@param format1 any A string or number indicating the type of data to be read 
---@param format2 any A string or number indicating the type of data to be read 
---@overload fun()
---@overload fun(format1)
---@overload fun(format1, ...)
function  io.read(format1, format2) end


--- **This function checks whether or not a given object is a file handle.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the string "file" if the object is an open file handle. If it is not an open file handle, nil is returned.
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
--- print("\n*** io.type")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1")
--- myfile:close()
--- do
--- fileHandle = io.output(fileName)
--- state = io.type(fileHandle)
--- print(state)
--- end
--- io.close(fileHandle)
--- local state = io.type(fileHandle)
--- print(state)
--- os.remove(fileName)
---  --Check whether or not fileName is a file handle. 
--- ```
---@return any type Indicates whether the object is an open file handle 
---@param obj any Object to check 
function io.type(obj) end


--- **This function writes data to the default output file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- All data parameters must be either strings or numbers.
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
--- print("\n*** io.write")
--- myfile, myfile_err, myfile_errnum = io.open(fileName, "w")
--- myfile:write("Line 1")
--- myfile:close()
--- do
--- fileHandle = io.output(fileName)
--- io.write("Line 2")
--- end
--- io.close(fileHandle)
--- os.remove(fileName)
---  --Writes data to the default output file. 
--- ```
---@param data1 any The data to be written 
---@param data2 any The data to be written 
---@overload fun()
---@overload fun(data1)
---@overload fun(data1, ...)
function io.write(data1, data2) end


--- **This function re-initializes the LAN interface with new settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Disconnects all existing LAN connections to the instrument and re-initializes the LAN with the present configuration settings.This function initiates a background operation. LAN configuration could be a lengthy operation. Although the function returns immediately, the LAN initialization continues to run in the background.Even though the LAN configuration settings may not have changed since the LAN was last connected, new settings may take effect due to the dynamic nature of dynamic host configuration protocol (DHCP) or dynamic link local addressing (DLLA) configuration.Re-initialization takes effect even if the configuration has not changed since the last time the instrument connected to the LAN.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function lan.applysettings() end


--- **This function resets the LAN interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the LAN interface. It performs the commands lan.restoredefaults() and lan.applysettings(). It also resets the LAN password.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function lan.reset() end


--- **This function resets LAN settings to default values.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The settings that are restored are shown in the following table.This command is run when lan.reset() is sent.
---
---<br>*Examples:*<br>
--- ```lua
--- lan.restoredefaults()
---  --Restores the LAN defaults. 
--- ```
function lan.restoredefaults() end


--- **This function resets the local node instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you want to reset a specific instrument or a subordinate node, use the node[X].reset() command.A local node reset includes:A localnode.reset() is different than a reset() because reset() resets the entire system. When using this command from a remote node, localnode should be replaced with the node reference, for example node[5].reset().
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function localnode.reset() end


--- **This function creates a function to get the value of an attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful for aliasing attributes to improve execution speed. Calling the function created with makegetter() executes more quickly than accessing the attribute directly.Creating a getter function is only useful if it is going to be called several times. Otherwise, the overhead of creating the getter function outweighs the overhead of accessing the attribute directly.
---
---<br>*Examples:*<br>
--- ```lua
--- getlevel = makegetter(smua.source, "levelv")
--- v = getlevel()
---  --Creates a getter function called getlevel. When getlevel() is called, it returns the value of smua.source.levelv.  
--- ```
---@return any getter The return value 
---@param table any Read‑only table where the attribute is located 
---@param attributeName any A string representing the name of the attribute 
function makegetter(table,attributeName) end


--- **This function creates a function that, when called, sets the value of an attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful for aliasing attributes to improve execution speed. Calling the setter function execute more quickly than accessing the attribute directly.Creating a setter function is only useful if it is going to be called several times. If you are not calling the setter function several times, it is more efficient to access the attribute directly. 
---
---<br>*Examples:*<br>
--- ```lua
--- setlevel = makesetter(smua.source, "levelv")for v = 1, 10 do
---    setlevel(v)
--- end
---  --Creates a setter function called setlevel. Using setlevel() in the loop sets the value of smua.source.levelv, performing a source sweep. 
--- ```
---@return any setter Function that sets the value of the attribute 
---@param table any Read-only table where the attribute is located 
---@param attributeName any The string name of the attribute 
function makesetter(table,attributeName) end


--- **This function returns the present amount of available memory and the total amount of memory in the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns two values:The difference between the two values is the amount presently used.
---
---<br>*Examples:*<br>
--- ```lua
--- print(meminfo())
---  --Retrieve the amount of free and total memory in the instrument. Output: 
--- ```
---@return any freeMem The amount of free dynamically allocated memory available 
---@return any totalMem The total amount of dynamically allocated memory in the instrument 
function meminfo() end


--- **This function sets the operation complete status bit when all overlapped commands are completed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the operation complete bit in the Standard Event Status Register to be set when all previously started local overlapped commands are complete. Note that each node independently sets its operation complete bits in its own status model. Any nodes that are not actively performing overlapped commands set their bits immediately. All remaining nodes set their own bits as they complete their own overlapped commands.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function opc() end


--- **This function deletes the file or directory with a given name.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Directories must be empty before using the os.remove() function to delete them.If this function fails, it returns nil (for success) and an error message string (for msg).
---
---<br>*Examples:*<br>
--- ```lua
--- os.remove("testFile")
---  --Delete the file named testFile. 
--- ```
---@return any success A success indicator (true or nil) 
---@return any msg A message value (nil or an error message) 
---@param filename any A string representing the name of the file or directory to delete 
function os.remove(filename) end


--- **This function renames an existing file or directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If this function fails, it returns nil (for success) and an error message string (for msg).
---
---<br>*Examples:*<br>
--- ```lua
--- os.rename("testFile", "exampleFile")
---  
---  --Changes the name of the existing file testFile to the name exampleFile. 
--- ```
---@return any success A success indicator (true or nil) 
---@return any msg A message value (nil or an error message) 
---@param oldname any String representing the name of the file or directory to rename 
---@param newname any String representing the new name of the file or directory 
function os.rename(oldname,newname) end


--- **This function generates a time value in UTC time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The timespec is a table using the fields listed in the table below.If the time (hour, minute, and second) options are not used, they default to noon for that day. When called without a parameter (the first form), the function returns the current time.Set the time zone before calling the os.time() function.
---
---<br>*Examples:*<br>
--- ```lua
--- systemTime = os.time({year = 2019,
---        month = 3,
---        day = 31,
---        hour = 14,
---        min = 25})
--- settime(systemTime)
---  --Sets the date and time to Mar 31, 2019 at 2:25 pm. 
--- ```
---@return any utcTime Time value in UTC time 
---@param timespec any The date and time (year, month, day, hour, and minute) 
---@overload fun()
function  os.time(timespec) end


--- **This function generates a response message.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- TSP-enabled instruments do not have inherent query commands. Like other scripting environments, the print() command and other related print() commands generate output. The print() command creates one response message.The output from multiple arguments is separated with a tab character.Numbers are printed using the format.asciiprecision attribute. If you want use Lua formatting, print the return value from the tostring() function.
---
---<br>*Examples:*<br>
--- ```lua
--- x = 10
--- print(x)
---  --Example of an output response message: Note that your output might be different if you set your ASCII precision setting to a different value. 
--- ```
---@param value1 any The first argument to output 
---@param value2 any The second argument to output 
---@overload fun(value1)
---@overload fun(value1, ...)
function print(value1, value2) end


--- **This function prints data from tables or reading buffer subtables.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If startIndex ≤ 1, 1 is used as startIndex. If n < endIndex, n is used as endIndex.When any given reading buffers are used in overlapped commands that have not yet completed (at least to the specified index), this function outputs data as it becomes available.When there are outstanding overlapped commands to acquire data, n refers to the index that the last entry in the table has after all the measurements have completed.If you pass a reading buffer instead of a reading buffer subtable, the default subtable for that reading buffer is used.This command generates a single response message that contains all data. The response message is stored in the output queue.The format.data attribute controls the format of the response message.
---
---<br>*Examples:*<br>
--- ```lua
--- format.data = format.ASCII
--- format.asciiprecision = 6
--- printbuffer(1, rb1.n, rb1)
---  --This assumes that rb1 is a valid reading buffer in the runtime environment. The use of rb1.n (bufferVar.n) indicates that the instrument should output all readings in the reading buffer. In this example, rb1.n equals 10. Example of output data (rb1.readings): 
--- ```
---@param startIndex any Beginning index of the buffer to print; this must be more than one and less than endIndex 
---@param endIndex any Ending index of the buffer to print; this must be more than startIndex and less than the index of the last entry in the tables 
---@param bufferVar bufferMethods First table or reading buffer subtable to print 
---@param bufferVar2 bufferMethods Second table or reading buffer subtable to print 
---@overload fun(startIndex, endIndex, bufferVar)
---@overload fun(startIndex, endIndex, bufferVar, ...)
function printbuffer(startIndex, endIndex, bufferVar, bufferVar2) end


--- **This function prints numbers using the configured format.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are multiple ways to use this function, depending on how many numbers are to be printed.This function prints the given numbers using the data format specified by format.data and format.asciiprecision.
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 2.54
--- printnumber(x)
--- format.asciiprecision = 3
--- printnumber(x, 2.54321, 3.1)
---  --Configure the ASCII precision to 10 and set x to 2.54. Read the value of x based on these settings. Change the ASCII precision to 3. View how the change affects the output of x and some numbers. Output: 
--- ```
---@param value1 any First value to print in the configured format 
---@param value2 any Second value to print in the configured format 
---@overload fun(value1)
---@overload fun(value1, ...)
function printnumber(value1, value2) end


--- **This KIPulse factory script function performs a specified number of pulse I, measure V cycles.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for pulsed voltage measurements, current levels, and timestamps are stored in smua.nvbuffer1.If any parameters are omitted or nil, the operator is prompted to enter them using the front panel.To perform the specified number of pulse I, measure V cycles, this function:
---
---<br>*Examples:*<br>
--- ```lua
--- PulseIMeasureV(smua, 0.001, 1.0,
---    20e-3, 40e-3, 10)
---  --SMU A outputs 1 mA and dwells for 40 ms, outputs 1 A and dwells for 20 ms. The voltage measurements occur during each 20 ms dwell period. After the measurement, the output returns to 1 mA and dwells for 40 ms. This pulse‑measure process repeats nine more times. 
--- ```
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in amperes 
---@param level any Pulse level in amperes 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
function PulseIMeasureV(smu, bias, level, ton, toff, points) end


--- **This KIPulse factory script function performs a specified number of pulse V, measure I cycles.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If any parameters are omitted or nil, the operator is prompted to enter them using the front panel. Data for pulsed current measurements, voltage levels, and timestamps are stored in smuX.nvbuffer1.To perform the specified number of pulse V, measure I cycles, this function:
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.nplc = 0.001
--- PulseVMeasureI(smua, -1, 1, 1E-3, 2E-3, 20)
---  --SMU A outputs −1 V and dwells for 2 ms, outputs 1 V and dwells for 1 ms. The current measurements occur during each 1 ms dwell period. After the measurement, the output returns to −1 V and dwells for 2 ms. This pulse-measure process repeats 19 more times. 
--- ```
---@param smu any Instrument channel (for example, smua refers to SMU channel A) 
---@param bias any Bias level in volts 
---@param level any Pulse level in volts 
---@param ton any Pulse on time in seconds 
---@param toff any Pulse off time in seconds 
---@param points any Number of pulse-measure cycles 
function PulseVMeasureI(smu, bias, level, ton, toff, points) end


--- **This KIPulse factory script function allows you to inspect the settings of the preconfigured pulse train assigned to tag.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Once a pulse train is configured and assigned to a tag, you can use the QueryPulseConfig() command to inspect the settings of this preconfigured pulse train.This function returns a table that contains the settings associated with the tag input parameter.
---
---<br>*Examples:*<br>
--- ```lua
--- tostring()
--- tag
--- smu
--- func
--- bias
--- level
--- start
--- stop
--- limit
--- ton
--- toff
--- points
--- buf
--- sync_in
--- sync_out
--- sourcevalues
---  --A table containing the source value for each point in the pulse train 
--- ```
---@param tag any Numeric identifier to be assigned to the defined pulse train 
---@return any tbl Returned table 
function QueryPulseConfig(tag) end


--- **This function resets commands to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The reset() command in its simplest form resets the entire TSP‑enabled system, including the controlling node and all subordinate nodes.If you want to reset a specific instrument, use either the localnode.reset() or node[X].reset() command. Use the localnode.reset() command for the local instrument. Use the node[X].reset() command to reset an instrument on a subordinate node.You can only reset the entire system using reset(true) if the node is the master. If the node is not the master node, executing this command generates an error.
---
---<br>*Examples:*<br>
--- ```lua
--- reset(true)
---  --If the node is the master node, the entire system is reset; if the node is not the master node, an error is generated. 
--- ```
---@param system any What to reset: true: If the node is the master, the entire system is reset (default) false: Only the local group is reset 
---@overload fun()
function reset(system) end


--- **This KISavebuffer factory script function saves a specified reading buffer as either a CSV file or an XML file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to save the specified buffer to a USB flash drive.This function only saves to a USB flash drive. You are not required to qualify the path to the USB flash drive, but you can add /usb1/ before the fileName (see Example 2).
---
---<br>*Examples:*<br>
--- ```lua
--- savebuffer(smua.nvbuffer1, "csv", "mybuffer.csv")
---  --Save smua dedicated reading buffer 1 as a CSV file named mybuffer.csv. 
--- ```
---@param buffer any The reading buffer to save 
---@param formatType any A string indicating which file type to use: csv or xml 
---@param fileName any The file name of the saved buffer 
function savebuffer(buffer, formatType, fileName) end


--- **This function deletes a script from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- script.delete("test8")
---  --Deletes a user script named test8 from nonvolatile memory. 
--- ```
---@param scriptName any The string that represents the name of the script 
function script.delete(scriptName) end


--- **This function returns an iterator that can be used in a for loop to iterate over all the factory scripts.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Accessing this catalog of scripts allows you to process the factory scripts. The entries are enumerated in no particular order.Each time the body of the function executes, name takes on the name of one of the factory scripts. The for loop repeats until all scripts have been iterated.
---
---<br>*Examples:*<br>
--- ```lua
--- for name in script.factory.catalog() do
---    print(name)
--- end
---  --Retrieve the catalog listing for factory scripts. 
--- ```
function script.factory.catalog() end


--- **This function creates a script from a specified file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file path may be absolute or relative to the current working directory. The root folder of the USB flash drive has the absolute path "/usb1/". Both the forward slash (/) and backslash (\) are supported as directory separators.The file to be loaded must start with the loadscript or loadandrunscript keywords, contain the body of the script, and end with the endscript keyword.Script naming:
---
---<br>*Examples:*<br>
--- ```lua
--- myTest8 =    script.load("/usb1/filename.tsp", "myTest8")
---  --Loads the script myTest8 from the USB flash drive. 
--- ```
---@return script_object scriptVar The created script; this is nil if an error is encountered 
---@param file any The path and file name of the script file to load 
---@param name any The name of the script to be created 
---@overload fun(file)
function  script.load(file, name) end


--- **This function creates a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The name parameter is the name that is added to the script.user.scripts table. If name is not provided, an empty string is used, and the script is unnamed. If the name already exists in script.user.scripts, the name attribute of the existing script is set to an empty string before it is replaced by the new script.Note that name is the value that is used for the instrument front‑panel display. If this value is not defined, the script is not available from the front panel.You must save the new script into nonvolatile memory to keep it when the instrument is turned off.
---
---<br>*Examples:*<br>
--- ```lua
--- myTest8 = script.new(
---    "display.clear() display.settext('Hello from myTest8')", "myTest8")
--- myTest8()
---  --Creates a new script referenced by the variable myTest8 with the name myTest8. Runs the script. The instrument displays Hello from myTest8. 
--- ```
---@return script_object scriptVar The name of the variable that references the script 
---@param code any A string containing the body of the script 
---@param name any The name of the script 
---@overload fun(code)
function  script.new(code, name) end


--- **This function creates a script and enables autorun.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The name parameter is the name that is added to the script.user.scripts table. If name is not provided, an empty string is used, and the script is unnamed. If the name already exists in script.user.scripts, the name attribute of the existing script is set to an empty string before it is replaced by the new script.Note that name is the value that is used for the instrument front‑panel display. If this value is not defined, the script is not available from the front panel.You must save the new script into nonvolatile memory to keep it when the instrument is turned off.The script is run automatically immediately after it is created.This command is the same as the script.new() function except that the script is automatically run.
---
---<br>*Examples:*<br>
--- ```lua
--- NewAuto = script.newautorun("print('Hello from new auto run command')", 'NewAuto')
--- print(NewAuto.autorun)
--- print(NewAuto.name)
---  --Creates a new script called NewAuto that automatically has the autorun attribute set to yes after it is created. The name is set to NewAuto. Output: 
--- ```
---@return script_object scriptVar The name of the variable that references the script 
---@param code any A string that contains the body of the script 
---@param name any The name of the script 
---@overload fun(code)
function  script.newautorun(code, name) end


--- **This function restores a script that was removed from the runtime environment.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command copies the script from nonvolatile memory into the runtime environment. It also creates a global variable with the same name as the name of the script.
---
---<br>*Examples:*<br>
--- ```lua
--- script.restore("test9")
---  --Restores a script named test9 from nonvolatile memory. 
--- ```
---@param name any The name of the script to be restored 
function script.restore(name) end


--- **This function runs the anonymous script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Each time the script.run() command is given, the anonymous script is executed. This script can be run using this command many times without having to re-send it. 
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function script.run() end


--- **This function returns an iterator that can be used in a for loop to iterate over all the scripts stored in nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function accesses the catalog of scripts stored in nonvolatile memory, which allows you to process all scripts in nonvolatile memory. The entries are enumerated in no particular order.Each time the body of the function executes, name takes on the name of one of the scripts stored in nonvolatile memory. The for loop repeats until all scripts have been iterated.
---
---<br>*Examples:*<br>
--- ```lua
--- for name in script.user.catalog() do
---    print(name)
--- end
---  --Retrieve the catalog listing for user scripts. 
--- ```
function script.user.catalog() end


--- **This function generates a script listing.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates output in the form of a sequence of response messages (one message for each line of the script). It also generates output of the script control messages (loadscript or loadandrunscript and endscript).
---
---<br>*Examples:*<br>
--- ```lua
--- test7 = script.new("display.clear() display.settext('Hello from my test')",    "test7")
--- test7()
--- test7.save()
--- test7.list()
---  --The above example code creates a script named test7 that displays text on the front panel and lists the script with the following output: 
--- ```
function script_object.list() end


--- **This function runs a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scriptVar.run() function runs the script referenced by scriptVar. You can also run the script by using scriptVar().To run a factory script, use script.factory.scripts.scriptName(), replacing scriptName with the name of the factory script.
---
---<br>*Examples:*<br>
--- ```lua
--- test8.run()
---  --Runs the script referenced by the variable test8. 
--- ```
function script_object.run() end


--- **This function saves the script to nonvolatile memory or to a USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scriptVar.save() function saves a script to nonvolatile memory or a USB flash drive. The root folder of the USB flash drive has the absolute path /usb1/.If no filename is specified (the file name parameter is an empty string), the script is saved to internal nonvolatile memory. Only a script with filename defined can be saved to internal nonvolatile memory. If a filename is given, the script is saved to the USB flash drive.You can add the file extension, but it is not required. The only allowed extension is .tsp (see Example 2).
---
---<br>*Examples:*<br>
--- ```lua
--- test8.save()
---  --Saves the script referenced by the variable test8 to nonvolatile memory. 
--- ```
---@param filename any A string that contains the file name to use when saving the script to a USB flash drive 
---@overload fun()
function script_object.save(filename) end


--- **This function reads available characters (data) from the serial port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function reads available characters from the serial port. It does not wait for new characters to arrive. As long as maxchars is less than 200 characters, all characters that are received by the serial port (before the serial.read() command is executed) are returned. If too many characters are received between calls to this function, the RS-232 buffers overflow and some characters may be lost.Call this function as many times as necessary to receive the required number of characters. For optimal performance, use a small delay between repeated calls to this function.The data returned is the raw data stream read from the port. No characters, such as control characters or terminator characters, are interpreted.If you attempt to use this function when the serial port is enabled as a command interface, a settings conflict error is generated.
---
---<br>*Examples:*<br>
--- ```lua
--- data = serial.read(200)
---  
--- print(data)
---  --Read data from the serial port. Output: John Doe The above output indicates that the string "John Doe" was read from the serial port. 
--- ```
---@return any data A string that consists of all data read from the serial port 
---@param maxchars any An integer that specifies the maximum number of characters to read 
function serial.read(maxchars) end


--- **This function writes data to the serial port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function writes the specified string to the serial port, where it can be read by connected equipment (for example, a component handler). No terminator characters are added to the data, and data is written exactly as specified by the data parameter.
---
---<br>*Examples:*<br>
--- ```lua
--- serial.write("1 2 3 4")
---  --Write data string "1 2 3 4" to the serial port. 
--- ```
---@param data any A string representing the data to write 
function serial.write(data) end


--- **This function sets the real-time clock (sets present time of the system).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the date and time of the instrument based on the time parameter (specified in UTC time). UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).
---
---<br>*Examples:*<br>
--- ```lua
--- systemTime = os.time({year = 2020,
---        month = 3,
---        day = 31,
---        hour = 14,
---        min = 25})
--- settime(systemTime)
---  --Sets the date and time to Mar 31, 2020 at 2:25 pm. 
--- ```
---@param time any The time in seconds since January 1, 1970 UTC 
function settime(time) end


--- **This function sets the local time zone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You only need to set the time zone if you use the os.time() and os.date() functions. If only one parameter is given, the same time offset is used throughout the year. If four parameters are given, time is adjusted twice during the year for daylight savings time.offset and dstOffset are strings of the form "[+|-]hh[:mm[:ss]]" that indicate how much time must be added to the local time to get UTC time:The minute, second, +, and − fields are optional.For example, to set the UTC-5 time zone, you specify the string "5", because UTC-5 is 5 hours behind UTC and you must add 5 hours to the local time to determine UTC time. To specify the time zone UTC4, you specify "-4", because UTC4 is 4 hours ahead of UTC and 4 hours must be subtracted from the local time to determine UTC.dstStart and dstEnd are strings of the form "MM.w.dw/hh[:mm[:ss]]" that indicate when daylight savings time begins and ends respectively:The rest of the fields represent the time of day that the change takes effect:The minutes and seconds fields are optional.The week of the month and day of the week fields are not specific dates.
---
---<br>*Examples:*<br>
--- ```lua
--- settimezone("8", "1", "3.3.0/02", "11.2.0/02")settimezone(offset)
---  --Sets offset to equal +8 hours, +1 hour for DST, starts on Mar 14 at 2:00 am, ends on Nov 7 at 2:00 am. Sets local time zone to offset. 
--- ```
---@param offset any String representing offset from UTC 
---@param dstOffset any String representing the daylight savings offset from UTC 
---@param dstStart any String representing when daylight savings time starts 
---@param dstEnd any String representing when daylight savings time ends 
---@overload fun(offset)
function settimezone(offset, dstOffset, dstStart, dstEnd) end


--- **This function recalls settings from a saved setup.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the id parameter is an integer (n), it is interpreted as the setup number to restore from the instrument's nonvolatile memory. When n = 0, the instrument recalls the factory default setup; when n = 1 to 5, the instrument recalls a user-saved setup.When the id parameter is a string, it is interpreted as the path and file name of the setup to restore from a file on a USB flash drive. The path may be absolute or relative to the current working directory.Before a setup is recalled, an instrument reset is performed.
---
---<br>*Examples:*<br>
--- ```lua
--- setup.recall(1)
---  --Recall the user-saved setup at location 1. 
--- ```
---@param id any An integer or string that specifies the location of the setup to recall: Factory default setup: 0 User-saved setup in nonvolatile memory: 1 to 5 User-saved setup on a USB flash drive: "/path/filename" 
function setup.recall(id) end


--- **This function saves the present setup as a user-saved setup.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the id parameter is an integer (n), it is interpreted as the setup number to save to the nonvolatile memory of the instrument.When the id parameter is a string, it is interpreted as the path and file name of the location to save the present setup on a USB flash drive. The path may be absolute or relative to the current working directory.
---
---<br>*Examples:*<br>
--- ```lua
--- setup.save(5)
---  --Saves the present setup to the internal memory of the instrument at location 5. 
--- ```
---@param id any An integer or string specifying where to save the user setup: Save in nonvolatile memory (1 to 5) Save as user-saved setup on a USB flash drive ("/path/filename") 
function setup.save(id) end


--- **This function terminates all overlapped operations on the specified source‑measure unit (SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.abort() function does not turn the output off or change any settings.If this function is used to abort a sweep, when it is executed, the SMU exits its trigger model immediately and returns to the idle state of the trigger model.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.abort()
---  --Terminates all overlapped operations on SMU channel A. 
--- ```
function smua.abort() end


--- **This function terminates all overlapped operations on the specified source‑measure unit (SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.abort() function does not turn the output off or change any settings.If this function is used to abort a sweep, when it is executed, the SMU exits its trigger model immediately and returns to the idle state of the trigger model.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.abort()
---  --Terminates all overlapped operations on SMU channel A. 
--- ```
function smub.abort() end


--- **This function returns the statistics for a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that is placed in the buffer.The SMU automatically updates reading buffer statistics as data is added to the reading buffer. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten.The table returned from this function is a snapshot. Although the SMU continues to update the statistics, the table returned is not updated. To get fresh statistics, call this function again.The statistics parameter has the attributes described in the following table.If n equals zero (0), all other attributes are nil. If n equals 1, the stddev attribute is nil because the standard deviation of a sample size of 1 is undefined.The min and max entries each have the attributes defined in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- n
--- mean
--- stddev
--- min
--- max
---  --When n > 0 
--- ```
---@return any statistics The statistical data about the data in the reading buffer 
---@param bufferVar bufferMethods The reading buffer to process 
function smua.buffer.getstats(bufferVar) end


--- **This function returns the statistics for a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that is placed in the buffer.The SMU automatically updates reading buffer statistics as data is added to the reading buffer. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten.The table returned from this function is a snapshot. Although the SMU continues to update the statistics, the table returned is not updated. To get fresh statistics, call this function again.The statistics parameter has the attributes described in the following table.If n equals zero (0), all other attributes are nil. If n equals 1, the stddev attribute is nil because the standard deviation of a sample size of 1 is undefined.The min and max entries each have the attributes defined in the following table.
---
---<br>*Examples:*<br>
--- ```lua
--- n
--- mean
--- stddev
--- min
--- max
---  --When n > 0 
--- ```
---@return any statistics The statistical data about the data in the reading buffer 
---@param bufferVar bufferMethods The reading buffer to process 
function smub.buffer.getstats(bufferVar) end


--- **This function recalculates the statistics of the specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to regenerate the reading buffer statistics about the specified reading buffer. Because the SMU automatically updates reading buffer statistics when data is added to the reading buffer, this function is generally not needed. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten. Use this function to recalculate the statistics that include only the data that is presently stored in the buffer.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.buffer.recalculatestats(smua.nvbuffer1)
---  --Recalculates the statistics of buffer smua.nvbuffer1. 
--- ```
---@param bufferVar bufferMethods The reading buffer to process 
function smua.buffer.recalculatestats(bufferVar) end


--- **This function recalculates the statistics of the specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to regenerate the reading buffer statistics about the specified reading buffer. Because the SMU automatically updates reading buffer statistics when data is added to the reading buffer, this function is generally not needed. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten. Use this function to recalculate the statistics that include only the data that is presently stored in the buffer.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.buffer.recalculatestats(smua.nvbuffer1)
---  --Recalculates the statistics of buffer smua.nvbuffer1. 
--- ```
---@param bufferVar bufferMethods The reading buffer to process 
function smub.buffer.recalculatestats(bufferVar) end


--- **This function disables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before you can lock calibration, the calibration constants must be written to nonvolatile memory or a previous calibration set must be restored. Error code 5012, "Cal data not saved - save or restore before lock," results if this function is called when the calibration state is smuX.CALSTATE_CALIBRATING.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.lock()
---  --Disables calibration functions for SMU channel A. 
--- ```
function smua.cal.lock() end


--- **This function disables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before you can lock calibration, the calibration constants must be written to nonvolatile memory or a previous calibration set must be restored. Error code 5012, "Cal data not saved - save or restore before lock," results if this function is called when the calibration state is smuX.CALSTATE_CALIBRATING.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.lock()
---  --Disables calibration functions for SMU channel A. 
--- ```
function smub.cal.lock() end


--- **This function loads a stored set of calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function overwrites the present set of calibration constants with constants read from nonvolatile memory.This function is disabled until a successful call to smuX.cal.unlock() is made.If calset is not specified, smuX.CALSET_DEFAULT is used.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.restore()
---  --Restores factory calibration constants for SMU channel A. 
--- ```
---@param calset any The calibration set to be loaded; set calset to one of the following values: 0 or smuX.CALSET_NOMINAL: A set of calibration constants that are uncalibrated, but set to nominal values to allow rudimentary functioning of the instrument 1 or smuX.CALSET_FACTORY: The calibration constants when the instrument left the factory 2 or smuX.CALSET_DEFAULT: The normal calibration set 3 or smuX.CALSET_PREVIOUS: The calibration set that was used before the last default set was overwritten 
---@overload fun()
function smua.cal.restore(calset) end


--- **This function loads a stored set of calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function overwrites the present set of calibration constants with constants read from nonvolatile memory.This function is disabled until a successful call to smuX.cal.unlock() is made.If calset is not specified, smuX.CALSET_DEFAULT is used.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.restore()
---  --Restores factory calibration constants for SMU channel A. 
--- ```
---@param calset any The calibration set to be loaded; set calset to one of the following values: 0 or smuX.CALSET_NOMINAL: A set of calibration constants that are uncalibrated, but set to nominal values to allow rudimentary functioning of the instrument 1 or smuX.CALSET_FACTORY: The calibration constants when the instrument left the factory 2 or smuX.CALSET_DEFAULT: The normal calibration set 3 or smuX.CALSET_PREVIOUS: The calibration set that was used before the last default set was overwritten 
---@overload fun()
function smub.cal.restore(calset) end


--- **This function stores the active calibration constants to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function stores the active set of calibration constants to nonvolatile memory. The previous calibration constants (from the default calibration set) are copied to the previous calibration set (smuX.CALSET_PREVIOUS) before overwriting the default calibration set.This function is disabled until a successful call to smuX.cal.unlock() is made.If any of the calibration constants have been changed, this function is disabled unless the calibration date, the calibration due date, and the calibration adjust date have been assigned new values.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.save()
---  --Stores calibration constants for SMU channel A in nonvolatile memory. 
--- ```
function smua.cal.save() end


--- **This function stores the active calibration constants to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function stores the active set of calibration constants to nonvolatile memory. The previous calibration constants (from the default calibration set) are copied to the previous calibration set (smuX.CALSET_PREVIOUS) before overwriting the default calibration set.This function is disabled until a successful call to smuX.cal.unlock() is made.If any of the calibration constants have been changed, this function is disabled unless the calibration date, the calibration due date, and the calibration adjust date have been assigned new values.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.save()
---  --Stores calibration constants for SMU channel A in nonvolatile memory. 
--- ```
function smub.cal.save() end


--- **This function enables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function enables the calibration functions to change the calibration settings.The password when the instrument is shipped from the factory is "KI0026XX".
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.unlock("KI0026XX")
---  --Unlocks calibration for SMU channel A. 
--- ```
---@param password any Calibration password 
function smua.cal.unlock(password) end


--- **This function enables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function enables the calibration functions to change the calibration settings.The password when the instrument is shipped from the factory is "KI0026XX".
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.unlock("KI0026XX")
---  --Unlocks calibration for SMU channel A. 
--- ```
---@param password any Calibration password 
function smub.cal.unlock(password) end


--- **This function adjusts the high/sense high contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement calibration does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---<br>*Examples:*<br>
--- ```lua
--- -- Short SENSE LO and LO terminals.
--- -- Short SENSE HI and HI terminals.
--- -- Allow readings to settle, then get measurements.
--- r0_hi, r0_lo = smua.contact.r()
---  
--- -- Connect 50 OHM resistor between SENSE LO and LO.
--- -- Connect 50 OHM resistor between SENSE HI and HI.
--- -- Allow readings to settle, then get measurements.
--- r50_hi, r50_lo = smua.contact.r()
--- smua.contact.calibratelo(r0_lo, Z_actual_lo, r50_lo, 50_ohm_actual_lo)
--- smua.contact.calibratehi(r0_hi, Z_actual_hi, r50_hi, 50_ohm_actual_hi)
---  --The instrument performs a contact check. Install and measure two resistors. The user sends the contact check LO calibration command. The user sends the contact check HI calibration command. 
--- ```
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Measured any The value measured by this SMU for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smua.contact.calibratehi(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function adjusts the high/sense high contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement calibration does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---<br>*Examples:*<br>
--- ```lua
--- -- Short SENSE LO and LO terminals.
--- -- Short SENSE HI and HI terminals.
--- -- Allow readings to settle, then get measurements.
--- r0_hi, r0_lo = smua.contact.r()
---  
--- -- Connect 50 OHM resistor between SENSE LO and LO.
--- -- Connect 50 OHM resistor between SENSE HI and HI.
--- -- Allow readings to settle, then get measurements.
--- r50_hi, r50_lo = smua.contact.r()
--- smua.contact.calibratelo(r0_lo, Z_actual_lo, r50_lo, 50_ohm_actual_lo)
--- smua.contact.calibratehi(r0_hi, Z_actual_hi, r50_hi, 50_ohm_actual_hi)
---  --The instrument performs a contact check. Install and measure two resistors. The user sends the contact check LO calibration command. The user sends the contact check HI calibration command. 
--- ```
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Measured any The value measured by this SMU for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smub.contact.calibratehi(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function adjusts the low/sense low contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement adjustment does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the active calibration set. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---<br>*Examples:*<br>
--- ```lua
--- -- Short SENSE LO and LO terminals.
--- -- Short SENSE HI and HI terminals.
--- -- Allow readings to settle, then get measurements.
--- r0_hi, r0_lo = smua.contact.r()
---  
--- -- Connect 50 OHM resistor between SENSE LO and LO.
--- -- Connect 50 OHM resistor between SENSE HI and HI.
--- -- Allow readings to settle, then get measurements.
--- r50_hi, r50_lo = smua.contact.r()
--- smua.contact.calibratelo(r0_lo, Z_actual_lo, r50_lo, 50_ohm_actual_lo)
--- smua.contact.calibratehi(r0_hi, Z_actual_hi, r50_hi, 50_ohm_actual_hi)
---  --The instrument performs a contact check. Install and measure two resistors. The user sends the contact check LO calibration command. The user sends the contact check HI calibration command. 
--- ```
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Measured any The value measured by this SMU for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smua.contact.calibratelo(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function adjusts the low/sense low contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement adjustment does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the active calibration set. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---<br>*Examples:*<br>
--- ```lua
--- -- Short SENSE LO and LO terminals.
--- -- Short SENSE HI and HI terminals.
--- -- Allow readings to settle, then get measurements.
--- r0_hi, r0_lo = smua.contact.r()
---  
--- -- Connect 50 OHM resistor between SENSE LO and LO.
--- -- Connect 50 OHM resistor between SENSE HI and HI.
--- -- Allow readings to settle, then get measurements.
--- r50_hi, r50_lo = smua.contact.r()
--- smua.contact.calibratelo(r0_lo, Z_actual_lo, r50_lo, 50_ohm_actual_lo)
--- smua.contact.calibratehi(r0_hi, Z_actual_hi, r50_hi, 50_ohm_actual_hi)
---  --The instrument performs a contact check. Install and measure two resistors. The user sends the contact check LO calibration command. The user sends the contact check HI calibration command. 
--- ```
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Measured any The value measured by this SMU for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smub.contact.calibratelo(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function determines if contact resistance is lower than the threshold. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns true if the contact resistance is below the threshold; this function returns false if it is above the threshold. The threshold value is set by the smuX.contact.threshold attribute.An error is generated when the output is on and:An error is generated when the output is off and:
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    -- take action
--- end
---  --Takes action if contact check on SMU channel A fails. 
--- ```
function smua.contact.check() end


--- **This function determines if contact resistance is lower than the threshold. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns true if the contact resistance is below the threshold; this function returns false if it is above the threshold. The threshold value is set by the smuX.contact.threshold attribute.An error is generated when the output is on and:An error is generated when the output is off and:
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    -- take action
--- end
---  --Takes action if contact check on SMU channel A fails. 
--- ```
function smub.contact.check() end


--- **This function measures aggregate contact resistance. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you attempt to perform a contact resistance measurement when any of the following conditions exist, an error is generated.
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    smua.contact.speed = smua.CONTACT_SLOW
---    rhi, rlo = smua.contact.r()
---    print(rhi, rlo)
---    exit()
--- end
---  --Check contacts against threshold. Set speed for SMU channel A to slow. Get resistance readings. Output contact resistances to the host. Terminate execution. 
--- ```
---@return any rhi The measured aggregate contact resistance on the HI/sense HI side 
---@return any rlo The measured aggregate contact resistance on the LO/sense LO side 
function smua.contact.r() end


--- **This function measures aggregate contact resistance. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you attempt to perform a contact resistance measurement when any of the following conditions exist, an error is generated.
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    smua.contact.speed = smua.CONTACT_SLOW
---    rhi, rlo = smua.contact.r()
---    print(rhi, rlo)
---    exit()
--- end
---  --Check contacts against threshold. Set speed for SMU channel A to slow. Get resistance readings. Output contact resistances to the host. Terminate execution. 
--- ```
---@return any rhi The measured aggregate contact resistance on the HI/sense HI side 
---@return any rlo The measured aggregate contact resistance on the LO/sense LO side 
function smub.contact.r() end


--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
---  --Adjust SMU channel A voltage measurement using the following values: 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
function smua.measure.calibratev(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
---  --Adjust SMU channel A voltage measurement using the following values: 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
function smua.measure.calibratei(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
---  --Adjust SMU channel A voltage measurement using the following values: 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
function smub.measure.calibratev(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
---  --Adjust SMU channel A voltage measurement using the following values: 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Measured any The value measured by this SMU for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
function smub.measure.calibratei(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.measure.overlappedv(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.measure.overlappedi(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.measure.overlappedr(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.measure.overlappedp(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.measure.overlappedv(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.measure.overlappedi(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.measure.overlappedr(rbuffer) end


--- **This function starts an asynchronous (background) measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
---  --Starts background voltage measurements for SMU channel A. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.measure.overlappedp(rbuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smua.measure.v(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smua.measure.i(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smua.measure.r(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smua.measure.p(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smub.measure.v(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smub.measure.i(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smub.measure.r(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
---  --Makes 10 voltage measurements using SMU channel A and stores them in a buffer. 
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process 
---@param readingBuffer any A reading buffer object where all readings are stored 
---@overload fun()
function  smub.measure.p(readingBuffer) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smua.measurevandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smua.measureiandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smua.measurerandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smua.measurepandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smub.measurevandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smub.measureiandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smub.measurerandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---<br>*Examples:*<br>
--- ```lua
--- local ivalues = {}
--- smua.source.rangev = 1
--- smua.source.levelv = 0
--- smua.measure.rangei = 0.01
--- smua.source.output = smua.OUTPUT_ON
--- for index = 1, 10 do
---    ivalues[index] = smua.measureiandstep(index / 10)
--- end
--- ivalues[11] = smua.measure.i()
---  --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured.    
--- ```
---@return any reading The measured reading before stepping the source 
---@param sourceValue any Source value to be set after the measurement is made 
function  smub.measurepandstep(sourceValue) end


--- **This function turns off the output and resets the commands that begin with smuX. to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function turns off the output and returns the specified SMU to its default settings.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
---  --Turns off the output and resets SMU channel A to its default settings. 
--- ```
function smua.reset() end


--- **This function turns off the output and resets the commands that begin with smuX. to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function turns off the output and returns the specified SMU to its default settings.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
---  --Turns off the output and resets SMU channel A to its default settings. 
--- ```
function smub.reset() end


--- **This function saves one source‑measure unit (SMU) dedicated reading buffer to nonvolatile memory (there are two dedicated reading buffers for each SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the instrument is turned off and back on, the dedicated reading buffers are restored from nonvolatile memory to their last saved values.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.savebuffer(smua.nvbuffer1)
---  
---  --Saves buffer 1 (SMU channel A) to internal memory. 
--- ```
---@param buffer bufferMethods
function smua.savebuffer(buffer) end


--- **This function saves one source‑measure unit (SMU) dedicated reading buffer to nonvolatile memory (there are two dedicated reading buffers for each SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the instrument is turned off and back on, the dedicated reading buffers are restored from nonvolatile memory to their last saved values.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.savebuffer(smua.nvbuffer1)
---  
---  --Saves buffer 1 (SMU channel A) to internal memory. 
--- ```
---@param buffer bufferMethods
function smub.savebuffer(buffer) end


--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
---  --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement. 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Expected any The source value set for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Expected any The source value set for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smua.source.calibratev(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end


--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
---  --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement. 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Expected any The source value set for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Expected any The source value set for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smua.source.calibratei(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end


--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
---  --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement. 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Expected any The source value set for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Expected any The source value set for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smub.source.calibratev(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end


--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
---  --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement. 
--- ```
---@param range any The measurement range to adjust 
---@param cp1Expected any The source value set for point 1 
---@param cp1Reference any The reference measurement for point 1 as measured externally 
---@param cp2Expected any The source value set for point 2 
---@param cp2Reference any The reference measurement for point 2 as measured externally 
function smub.source.calibratei(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end


--- **This function sets the arm event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.A typical example that uses this function is when you want the SMU to immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur. This function start actions on the SMU if a trigger event is missed.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.set()
---  --Sets the arm event detector to the detected state for SMU channel A. 
--- ```
function smua.trigger.arm.set() end


--- **This function sets the arm event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.A typical example that uses this function is when you want the SMU to immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur. This function start actions on the SMU if a trigger event is missed.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.set()
---  --Sets the arm event detector to the detected state for SMU channel A. 
--- ```
function smub.trigger.arm.set() end


--- **This function sets the end pulse event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the end pulse event detector to the detected state.The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Therefore, call smuX.trigger.endpulse.set() after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.endpulse.set() is issued after the SMU has entered the trigger layer.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- period_timer = trigger.timer[1]
--- pulse_timer = trigger.timer[2]
--- smua.trigger.source.listv( {5} )
--- smua.trigger.source.action = smua.ENABLE
--- smua.source.rangev = 5
--- smua.trigger.measure.action = smua.DISABLE
--- pulse_timer.delay = 0.0006
--- pulse_timer.stimulus = period_timer.EVENT_ID
--- pulse_timer.count = 1
--- period_timer.delay = 0.005
--- period_timer.count = 9
--- period_timer.stimulus = smua.trigger.SWEEPING_EVENT_ID
--- period_timer.passthrough = true
--- smua.trigger.source.stimulus = period_timer.EVENT_ID
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = pulse_timer.EVENT_ID
--- smua.trigger.count = 1
--- smua.trigger.arm.count = 10
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- waitcomplete()
--- smua.source.output = smua.OUTPUT_OFF
---  --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms. Alias the trigger timers to use for pulse width and period. Create a fixed level voltage sweep. Set the pulse width and trigger the pulse width timer with a period timer. Set the pulse period to output one pulse per period and the count to generate 10 pulses. Trigger the pulse period timer when a sweep is initiated. Configure the timer to output a trigger event when it starts the first delay. Trigger the SMU source action using pulse period timer. Trigger the SMU end pulse action using pulse width timer. Set the trigger model counts. Configure the SMU to execute a 10-point pulse train. Start the trigger model. Wait for the sweep to complete. 
--- ```
function smua.trigger.endpulse.set() end


--- **This function sets the end pulse event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the end pulse event detector to the detected state.The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Therefore, call smuX.trigger.endpulse.set() after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.endpulse.set() is issued after the SMU has entered the trigger layer.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- period_timer = trigger.timer[1]
--- pulse_timer = trigger.timer[2]
--- smua.trigger.source.listv( {5} )
--- smua.trigger.source.action = smua.ENABLE
--- smua.source.rangev = 5
--- smua.trigger.measure.action = smua.DISABLE
--- pulse_timer.delay = 0.0006
--- pulse_timer.stimulus = period_timer.EVENT_ID
--- pulse_timer.count = 1
--- period_timer.delay = 0.005
--- period_timer.count = 9
--- period_timer.stimulus = smua.trigger.SWEEPING_EVENT_ID
--- period_timer.passthrough = true
--- smua.trigger.source.stimulus = period_timer.EVENT_ID
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = pulse_timer.EVENT_ID
--- smua.trigger.count = 1
--- smua.trigger.arm.count = 10
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- waitcomplete()
--- smua.source.output = smua.OUTPUT_OFF
---  --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms. Alias the trigger timers to use for pulse width and period. Create a fixed level voltage sweep. Set the pulse width and trigger the pulse width timer with a period timer. Set the pulse period to output one pulse per period and the count to generate 10 pulses. Trigger the pulse period timer when a sweep is initiated. Configure the timer to output a trigger event when it starts the first delay. Trigger the SMU source action using pulse period timer. Trigger the SMU end pulse action using pulse width timer. Set the trigger model counts. Configure the SMU to execute a 10-point pulse train. Start the trigger model. Wait for the sweep to complete. 
--- ```
function smub.trigger.endpulse.set() end


--- **This function initiates a sweep operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to clear the four trigger model event detectors and enter its trigger model (moves the SMU from the idle state into the arm layer).To perform source actions during the sweep, before calling this function, it is necessary to configure and enable one of the following sweep source actions:To make measurements during the sweep, you must also configure and enable the measure action using smuX.trigger.measure.Y().If you run this function more than once without reconfiguring the sweep measurements, the caches on the configured measurement reading buffers hold stale data. Use the bufferVar.clearcache() function to remove stale values from the reading buffer cache.This function initiates an overlapped operation.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.initiate()
---  --Starts a preconfigured sweep and clears the event detectors for SMU channel A. 
--- ```
function smua.trigger.initiate() end


--- **This function initiates a sweep operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to clear the four trigger model event detectors and enter its trigger model (moves the SMU from the idle state into the arm layer).To perform source actions during the sweep, before calling this function, it is necessary to configure and enable one of the following sweep source actions:To make measurements during the sweep, you must also configure and enable the measure action using smuX.trigger.measure.Y().If you run this function more than once without reconfiguring the sweep measurements, the caches on the configured measurement reading buffers hold stale data. Use the bufferVar.clearcache() function to remove stale values from the reading buffer cache.This function initiates an overlapped operation.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.initiate()
---  --Starts a preconfigured sweep and clears the event detectors for SMU channel A. 
--- ```
function smub.trigger.initiate() end


--- **This function sets the measurement event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful whenever you want the SMU to continue operation without waiting for a programmed trigger event. When called, this function immediately satisfies the event detector, allowing the SMU to continue through the trigger model.For example, you might use this function to have the SMU immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur.If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.measure.set() is issued after the SMU has entered the trigger layer. This function can also be used to start actions on the SMU in case of a missed trigger event.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.set()
---  --Sets the measure event detector of SMU channel A. 
--- ```
function smua.trigger.measure.set() end


--- **This function sets the measurement event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful whenever you want the SMU to continue operation without waiting for a programmed trigger event. When called, this function immediately satisfies the event detector, allowing the SMU to continue through the trigger model.For example, you might use this function to have the SMU immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur.If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.measure.set() is issued after the SMU has entered the trigger layer. This function can also be used to start actions on the SMU in case of a missed trigger event.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.set()
---  --Sets the measure event detector of SMU channel A. 
--- ```
function smub.trigger.measure.set() end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.trigger.measure.v(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.trigger.measure.i(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.trigger.measure.r(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smua.trigger.measure.p(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.trigger.measure.v(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.trigger.measure.i(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.trigger.measure.r(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
---  --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername. 
--- ```
---@param rbuffer any A reading buffer object where the readings are stored 
function smub.trigger.measure.p(rbuffer) end


--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
---  --Sweeps from 0 V to 10 V in 1 V steps. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
function smua.trigger.source.linearv(startValue, endValue, points) end


--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
---  --Sweeps from 0 V to 10 V in 1 V steps. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
function smua.trigger.source.lineari(startValue, endValue, points) end


--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
---  --Sweeps from 0 V to 10 V in 1 V steps. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
function smub.trigger.source.linearv(startValue, endValue, points) end


--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
---  --Sweeps from 0 V to 10 V in 1 V steps. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
function smub.trigger.source.lineari(startValue, endValue, points) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
---  --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V. 
--- ```
---@param sweepList any An array of source values 
function smua.trigger.source.listv(sweepList) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
---  --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V. 
--- ```
---@param sweepList any An array of source values 
function smua.trigger.source.listi(sweepList) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
---  --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V. 
--- ```
---@param sweepList any An array of source values 
function smub.trigger.source.listv(sweepList) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
---  --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V. 
--- ```
---@param sweepList any An array of source values 
function smub.trigger.source.listi(sweepList) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
---  --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
---@param asymptote any The asymptotic offset value 
function smua.trigger.source.logv(startValue, endValue, points, asymptote) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
---  --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
---@param asymptote any The asymptotic offset value 
function smua.trigger.source.logi(startValue, endValue, points, asymptote) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
---  --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
---@param asymptote any The asymptotic offset value 
function smub.trigger.source.logv(startValue, endValue, points, asymptote) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
---  --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V. 
--- ```
---@param startValue any Source value of the first point 
---@param endValue any Source value of the last point 
---@param points any The number of points used to calculate the step size 
---@param asymptote any The asymptotic offset value 
function smub.trigger.source.logi(startValue, endValue, points, asymptote) end


--- **This function sets the source event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the source event detector to the detected state.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.source.set() is issued after the SMU has entered the trigger layer.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smua.trigger.source.listv({5})
--- smua.trigger.source.stimulus = display.trigger.EVENT_ID
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- delay(1)
--- -- Continue even if the display trigger key was not pressed.
--- smua.trigger.source.set()
--- waitcomplete()
---  --Sets the source event detector. 
--- ```
function smua.trigger.source.set() end


--- **This function sets the source event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the source event detector to the detected state.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.source.set() is issued after the SMU has entered the trigger layer.
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smua.trigger.source.listv({5})
--- smua.trigger.source.stimulus = display.trigger.EVENT_ID
--- smua.source.output = smua.OUTPUT_ON
--- smua.trigger.initiate()
--- delay(1)
--- -- Continue even if the display trigger key was not pressed.
--- smua.trigger.source.set()
--- waitcomplete()
---  --Sets the source event detector. 
--- ```
function smub.trigger.source.set() end


--- **This function resets all bits in the status model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all status data structure registers (enable, event, NTR, and PTR) to their default values. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function status.reset() end


--- **This KISweep factory script function performs a linear current sweep with voltage measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for voltage measurements, current source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a linear current sweep with voltage measured at every step (point):The linear step size is automatically calculated as follows:
---
---<br>*Examples:*<br>
--- ```lua
--- SweepILinMeasureV(smua, -1e-3, 1e-3, 0, 100)
---  --This function performs a 100-point linear current sweep starting at −1 mA and stopping at +1 mA. Voltage is measured at every step (point) in the sweep. Because stime is set for 0 s, voltage is measured as quickly as possible after each current step. 
--- ```
---@param smuX any Source‑measure unit (SMU) channel (for example, smua refers to SMU channel A) 
---@param starti any Sweep start current in amperes 
---@param stopi any Sweep stop current in amperes 
---@param stime any Settling time in seconds; occurs after stepping the source and before making a measurement 
---@param points any Number of sweep points (must be ≥ 2) 
function SweepILinMeasureV(smuX, starti, stopi, stime, points) end


--- **This KISweep factory script function performs a current list sweep with voltage measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for voltage measurements, current source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a current list sweep with voltage measured at every step (point):
---
---<br>*Examples:*<br>
--- ```lua
--- testilist = {-100e-9, 100e-9, -1e-6, 1e-6, -1e-3, 1e-3}
---  
--- SweepIListMeasureV(smua, testilist, 500e-3, 6)
---  --This function performs a six‑point current list sweep starting at the first point in testilist. Voltage is measured at every step (point) in the sweep. The source is allowed to settle on each step for 500 ms before a measurement is performed. 
--- ```
---@param smuX any Source‑measure unit (SMU) channel (for example, smua refers to SMU channel A) 
---@param ilist any Arbitrary list of current source values; ilist = {value1, value2, ...valueN} 
---@param stime any Settling time in seconds; occurs after stepping the source and before making a measurement 
---@param points any Number of sweep points (must be ≥ 2) 
function SweepIListMeasureV(smuX, ilist, stime, points) end


--- **This KISweep factory script function performs a logarithmic current sweep with voltage measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for voltage measurements, current source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a logarithmic current sweep with voltage measured at every step (point):The source level at each step (SourceStepLevel) is automatically calculated as follows:For example, for a five-point sweep (points = 5), a measurement is performed at MeasurePoint 1, 2, 3, 4, and 5.
---
---<br>*Examples:*<br>
--- ```lua
--- SweepILogMeasureV(smua, 0.01, 0.1, 0.001, 5)
---  --This function performs a five‑point linear current sweep starting at 10 mA and stopping at 100 mA. Voltage is measured at every step (point) in the sweep. The source is allowed to settle on each step for 1 ms before a measurement is made.   The following table contains log values and corresponding source levels for the five‑point logarithmic sweep:   
--- ```
---@param smuX any Source‑measure unit (SMU) channel (for example, smua.reset() applies to SMU channel A) 
---@param starti any Sweep start current in amperes 
---@param stopi any Sweep stop current in amperes 
---@param stime any Settling time in seconds; occurs after stepping the source and before making a measurement 
---@param points any Number of sweep points (must be ≥ 2) 
function SweepILogMeasureV(smuX, starti, stopi, stime, points) end


--- **This KISweep factory script function performs a linear voltage sweep with current measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for current measurements, voltage source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a linear voltage sweep with current measured at every step (point):The linear step size is automatically calculated as follows:
---
---<br>*Examples:*<br>
--- ```lua
--- SweepVLinMeasureI(smua, -1, 1, 1e-3, 1000)
---  --This function performs a 1000-point linear voltage sweep starting at -1 V and stopping at +1 V. Current is measured at every step (point) in the sweep after a 1 ms source settling period. 
--- ```
---@param smuX any Source‑measure unit (SMU) channel (for example, smua.reset() applies to SMU channel A) 
---@param startv any Sweep start voltage in volts 
---@param stopv any Sweep stop voltage in volts 
---@param stime any Settling time in seconds; occurs after stepping the source and before making a measurement 
---@param points any Number of sweep points (must be ≥ 2) 
function SweepVLinMeasureI(smuX, startv, stopv, stime, points) end


--- **This KISweep factory script function performs a voltage list sweep with current measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for current measurements, voltage source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a voltage list sweep with current measured at every step (point):
---
---<br>*Examples:*<br>
--- ```lua
--- myvlist = {-0.1, 0.1, -1, 1, -6, 6, -40, 40, 0, 0}
--- SweepVListMeasureI(smua, myvlist, 500E-3, 10)
---  --This function performs a 10‑point voltage list sweep starting at the first point in myvlist. Current is measured at every step (point) in the sweep. The source is allowed to settle on each step for 500 ms before a measurement is performed. 
--- ```
---@param smuX any Source‑measure unit (SMU) channel (for example, smua.reset() applies to SMU channel A) 
---@param vlist any Arbitrary list of voltage source values; vlist = {value1, value2, ... valueN} 
---@param stime any Settling time in seconds; occurs after stepping the source and before making a measurement 
---@param points any Number of sweep points (must be ≥ 2) 
function SweepVListMeasureI(smuX, vlist, stime, points) end


--- **This KISweep factory script function performs a logarithmic voltage sweep with current measured at every step (point).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Data for current measurements, voltage source values, and timestamps are stored in smuX.nvbuffer1.If all parameters are omitted when this function is called, this function is executed with the parameters set to the default values.Performs a logarithmic voltage sweep with current measured at every step (point):The source level at each step (SourceStepLevel) is automatically calculated as follows:For example, for a five-point sweep (points = 5), a measurement is made at MeasurePoint 1, 2, 3, 4, and 5.
---
---<br>*Examples:*<br>
--- ```lua
--- SweepVLogMeasureI(smua, 1, 10, 0.001, 5)
---  --This function performs a five‑point logarithmic voltage sweep starting at 1 V and stopping at 10 V. Current is measured at every step (point) in the sweep after a 1 ms source settling period.   The following table contains log values and corresponding source levels for the five‑point logarithmic sweep:     
--- ```
---@param smuX any Source‑measure unit (SMU) channel (for example, smua applies to SMU channel A) 
---@param startv any Sweep start voltage in volts 
---@param stopv any Sweep stop voltage in volts 
---@param stime any Settling time in seconds; occurs after stepping the source and before making a measurement 
---@param points any Number of sweep points (must be ≥ 2) 
function SweepVLogMeasureI(smuX, startv, stopv, stime, points) end


--- **This function measures the elapsed time since the timer was last reset.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua
--- timer.reset()
--- -- (intervening code)
--- time = timer.measure.t()
--- print(time)
---  --This example resets the timer and measures the time since the reset. Output: The output varies. The above output indicates that timer.measure.t() was executed 14.69077 seconds after timer.reset(). 
--- ```
---@return any time The elapsed time in seconds (1 µs resolution) 
function timer.measure.t() end


--- **This function resets the timer to zero (0) seconds.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function timer.reset() end


--- **This function clears the command interface trigger event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector indicates if a trigger event has been detected since the last trigger.wait() call. trigger.clear() clears the trigger event detector and discards the history of command interface trigger events.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function trigger.clear() end


--- **This function waits for a command interface trigger event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to timeout seconds for a trigger on the active command interface. A command interface trigger occurs when:If one or more of these trigger events were previously detected, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.wait(10)
--- print(triggered)
---  --Waits up to 10 seconds for a trigger. If false is returned, no trigger was detected during the 10‑second timeout. If true is returned, a trigger was detected. 
--- ```
---@return any triggered true: A trigger was detected during the timeout period false: No triggers were detected during the timeout period 
---@param timeout any Maximum amount of time in seconds to wait for the trigger 
function trigger.wait(timeout) end


--- **This function reads the state of a TSP-Link synchronization line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns a value of zero (0) if the line is low and 1 if the line is high.
---
---<br>*Examples:*<br>
--- ```lua
--- data = tsplink.readbit(3)
--- print(data)
---  --Assume line 3 is set high, and it is then read. Output: 
--- ```
---@return any data The state of the synchronization line 
---@param N any The trigger line (1 to 3) 
function tsplink.readbit(N) end


--- **This function reads the TSP-Link trigger lines as a digital I/O port. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the input pattern on the I/O port. The least significant bit of the binary number corresponds to line 1 and the value of bit 3 corresponds to line 3. For example, a returned value of 2 has a binary equivalent of 010. This indicates that line 2 is high (1), and that the other two lines are low (0).
---
---<br>*Examples:*<br>
--- ```lua
--- data = tsplink.readport()
--- print(data)
---  --Reads state of all three TSP-Link lines. Assuming line 2 is set high, the output is: (binary 010) The format of the output may vary depending on the ASCII precision setting. 
--- ```
---@return any data Numeric value that indicates which lines are set 
function tsplink.readport() end


--- **This function initializes (resets) all nodes (instruments) in the TSP‑Link system. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function erases all information regarding other nodes connected on the TSP-Link system and regenerates the system configuration. This function must be called at least once before any remote nodes can be accessed. If the node number for any instrument is changed, the TSP-Link must be reset again.If expectedNodes is not given, this function generates an error if no other nodes are found on the TSP‑Link network.If nodesFound is less than expectedNodes, an error is generated. Note that the node on which the command is running is counted as a node. For example, giving an expected node count of 1 does not generate any errors, even if there are no other nodes on the TSP-Link network.Also returns the number of nodes found.
---
---<br>*Examples:*<br>
--- ```lua
--- nodesFound = tsplink.reset(2)
--- print("Nodes found = " .. nodesFound)
---  --Perform a TSP-Link reset and indicate how many nodes are found. Sample output if two nodes are found:Nodes found = 2 Sample output if fewer nodes are found and if localnode.showerrors = 1:1219, TSP-Link found fewer nodes than expectedNodes found = 1 
--- ```
---@return any nodesFound The number of nodes actually found on the system 
---@param expectedNodes any The number of nodes expected on the system (1 to 64) 
---@overload fun()
function  tsplink.reset(expectedNodes) end


--- **This function sets a TSP-Link trigger line high or low. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use tsplink.writebit() and tsplink.writeport() to control the output state of the trigger line when trigger operation is set to tsplink.TRIG_BYPASS.If the output line is write‑protected by the tsplink.writeprotect attribute, this command is ignored.The reset function does not affect the present states of the TSP-Link trigger lines.
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writebit(3, 0)
---  --Sets trigger line 3 low (0). 
--- ```
---@param N any The trigger line (1 to 3) 
---@param data any The value to write to the bit: Low: 0 High: 1 
function tsplink.writebit(N, data) end


--- **This function writes to all TSP‑Link synchronization lines. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern that is written to the I/O port. For example, a data value of 2 has a binary equivalent of 010. Line 2 is set high (1), and the other two lines are set low (0).Write‑protected lines are not changed.Use the tsplink.writebit() and tsplink.writeport() commands to control the output state of the synchronization line when trigger operation is set to tsplink.TRIG_BYPASS.The reset() function does not affect the present states of the trigger lines.
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
---  --Sets the synchronization lines 1 and 2 high (binary 011). 
--- ```
---@param data any Value to write to the port (0 to 7) 
function tsplink.writeport(data) end


--- **This function clears any pending output data from the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears any pending output data from the device. No data is returned to the caller and no data is processed.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(testdevice, "print([[hello]])")
--- print(tspnet.readavailable(testdevice))
--- tspnet.clear(testdevice)
--- print(tspnet.readavailable(testdevice))
---  --Write data to a device, then print how much is available. Output: Clear data and print how much data is available again. Output: 
--- ```
---@param connectionID any The connection ID returned from tspnet.connect() 
function tspnet.clear(connectionID) end


--- **This function establishes a network connection with another LAN instrument or device through the LAN interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command connects a device to another device through the LAN interface. If the portNumber is 23, the interface uses the Telnet protocol and sets appropriate termination characters to communicate with the device.If a portNumber and initString are provided, it is assumed that the remote device is not TSP‑enabled. The 2600B does not perform any extra processing, prompt handling, error handling, or sending of commands. In addition, the tspnet.tsp.* commands cannot be used on devices that are not TSP‑enabled.If neither a portNumber nor an initString is provided, the remote device is assumed to be a Keithley Instruments TSP‑enabled device. Depending on the state of the tspnet.tsp.abortonconnect attribute, the 2600B sends an abort command to the remote device on connection. The 2600B also enables TSP prompts on the remote device and error management. The 2600B places remote errors from the TSP‑enabled device in its own error queue and prefaces these errors with Remote Error, followed by an error description. Do not manually change either the prompt functionality (localnode.prompts) or show errors by changing localnode.showerrors on the remote TSP-enabled device. If you do this, subsequent tspnet.tsp.* commands using the connection may fail.You can simultaneously connect to a maximum of 32 remote devices.
---
---<br>*Examples:*<br>
--- ```lua
--- instrumentID = tspnet.connect("192.0.2.1")
--- if instrumentID then
---    -- Use instrumentID as needed here
---    tspnet.disconnect(instrumentID)
--- end
---  --Connect to a TSP-enabled device. 
--- ```
---@return any connectionID The connection ID to be used as a handle in all other tspnet function calls 
---@param ipAddress any IP address to which to connect in a string; accepts IP address or host name when trying to connect 
---@param portNumber any Port number (default 5025) 
---@param initString any Initialization string to send to ipAddress 
---@overload fun(ipAddress)
function  tspnet.connect(ipAddress, portNumber, initString) end


--- **This function disconnects a specified TSP-Net session.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function disconnects the two devices by closing the connection. The connectionID is the session handle returned by tspnet.connect().For TSP-enabled devices, this aborts any remotely running commands or scripts.
---
---<br>*Examples:*<br>
--- ```lua
--- testID = tspnet.connect("192.0.2.0")
--- -- Use the connection
--- tspnet.disconnect(testID)
---  --Create a TSP‑Net session. Close the session. 
--- ```
---@param connectionID any The connection ID returned from tspnet.connect() 
function tspnet.disconnect(connectionID) end


--- **This function sends a command string to the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sends a command string to the remote instrument. A termination is added to the command string when it is sent to the remote instrument (tspnet.termination()). You can also specify a format string, which causes the command to wait for a response from the remote instrument. The 2600B decodes the response message according to the format specified in the format string and returns the message as return values from the function (see tspnet.read() for format specifiers).When this command is sent to a TSP-enabled instrument, the 2600B suspends operation until a timeout error is generated or until the instrument responds. The TSP prompt from the remote instrument is read and discarded. The 2600B places any remotely generated errors into its error queue. When the optional format string is not specified, this command is equivalent to tspnet.write(), except that a termination is automatically added to the end of the command.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.execute(instrumentID, "runScript()")
---  --Command the remote device to run a script named runScript. 
--- ```
---@param connectionID any The connection ID returned from tspnet.connect() 
---@param commandString any The command to send to the remote device 
---@return any value1 The first value decoded from the response message 
---@return any value2 The second value decoded from the response message 
---@param formatString any Format string for the output 
---@overload fun(connectionID, commandString)
---@overload fun(connectionID, commandString, formatString)
---@overload fun(connectionID, commandString, formatString)
function  tspnet.execute(connectionID, commandString, formatString) end


--- **This function retrieves the response of the remote device to *IDN?.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the response of the remote device to *IDN?.
---
---<br>*Examples:*<br>
--- ```lua
--- deviceID = tspnet.connect("192.0.2.1")
--- print(tspnet.idn(deviceID))
--- tspnet.disconnect(deviceID)
---  --Assume the instrument is at IP address 192.0.2.1. The output that is produced when you connect to the instrument and read the identification string may appear as: 
--- ```
---@return any idnString The returned *IDN? string 
---@param connectionID any The connection ID returned from tspnet.connect() 
function tspnet.idn(connectionID) end


--- **This function reads data from a remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads available data from the remote instrument and returns responses for the specified number of arguments.The format string can contain the following specifiers:A maximum of 10 format specifiers can be used for a maximum of 10 return values.If formatString is not provided, the command returns a string that contains the data until a new line is reached. If no data is available, the 2600B pauses operation until the requested data is available or until a timeout error is generated. Use tspnet.timeout to specify the timeout period.When the 2600B reads from a TSP-enabled remote instrument, the 2600B removes Test Script Processor (TSP®) prompts and places any errors it receives from the remote instrument into its own error queue. The 2600B prefaces errors from the remote device with "Remote Error," followed by the error number and error description.
---
---<br>*Examples:*<br>
--- ```lua
--- %[width]s
--- %[max width]t
--- %[max width]n
--- %d
---  --Read a number (delimited by punctuation) 
--- ```
---@return any value1 The first value decoded from the response message 
---@return any value2 The second value decoded from the response message 
---@param connectionID any The connection ID returned from tspnet.connect() 
---@param formatString any Format string for the output, maximum of 10 specifiers 
---@overload fun(connectionID)
---@overload fun(connectionID, formatString)
---@overload fun(connectionID, formatString)
function  tspnet.read(connectionID, formatString) end


--- **This function checks to see if data is available from the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command checks to see if any output data is available from the device. No data is read from the instrument. This allows TSP scripts to continue to run without waiting on a remote command to finish.
---
---<br>*Examples:*<br>
--- ```lua
--- ID = tspnet.connect("192.0.2.1")
--- tspnet.write(ID, "*idn?\r\n")
--- repeat bytes = tspnet.readavailable(ID) until bytes > 0
--- print(tspnet.read(ID))
--- tspnet.disconnect(ID)
---  --Send commands that create data. Wait for data to be available. 
--- ```
---@return any bytesAvailable The number of bytes available to be read from the connection 
---@param connectionID any The connection ID returned from tspnet.connect() 
function tspnet.readavailable(connectionID) end


--- **This function disconnects all TSP-Net sessions.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command disconnects all remote instruments connected through TSP-Net. For TSP-enabled devices, this causes any commands or scripts running remotely to be terminated.
---
---<br>*Examples:*<br>
--- ```lua --
--- ```
function tspnet.reset() end


--- **This function sets the device line termination sequence.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets and gets the termination character sequence that is used to indicate the end of a line for a TSP-Net connection.Using the termSequence parameter sets the termination sequence. The present termination sequence is always returned.For the termSequence parameter, use the same values listed in the table above for type. There are four possible combinations, all of which are made up of line feeds (LF or 0x10) and carriage returns (CR or 0x13). For TSP-enabled devices, the default is tspnet.TERM_LF. For devices that are not TSP‑enabled, the default is tspnet.TERM_CRLF.
---
---<br>*Examples:*<br>
--- ```lua
--- deviceID = tspnet.connect("192.0.2.1")
--- if deviceID then
---    tspnet.termination(deviceID, tspnet.TERM_LF)
--- end
---  --Sets termination type for IP address 192.0.2.1 to TERM_LF. 
--- ```
---@return any type An enumerated value indicating the termination type: 1 or tspnet.TERM_LF 4 or tspnet.TERM_CR 2 or tspnet.TERM_CRLF 3 or tspnet.TERM_LFCR 
---@param connectionID any The connection ID returned from tspnet.connect() 
---@param termSequence any The termination sequence 
---@overload fun(connectionID)
function  tspnet.termination(connectionID, termSequence) end


--- **This function causes the TSP-enabled instrument to stop executing any of the commands that were sent to it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.Sends an abort command to the remote instrument.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abort(testConnection)
---  --Stops remote instrument execution on testConnection. 
--- ```
---@param connectionID any Integer value used as a handle for other tspnet commands 
function tspnet.tsp.abort(connectionID) end


--- **This function copies a reading buffer synchronous table from a remote instrument to a TSP-enabled instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is only appropriate for TSP-enabled instruments.This function reads the data from a reading buffer on a remote instrument and returns an array of numbers or a string representing the data. The startIndex and endIndex parameters specify the portion of the reading buffer to read. If no index is specified, the entire buffer is copied. The function returns a table if the table is an array of numbers; otherwise a comma‑delimited string is returned.This command is limited to transferring 50,000 readings at a time.
---
---<br>*Examples:*<br>
--- ```lua
--- t = tspnet.tsp.rbtablecopy(testConnection, "testRemotebuffername.readings", 1, 3)
--- print(t[1], t[2], t[3])
---  --Copy the specified readings table for buffer items 1 through 3, then display the first three readings. Example output: 
--- ```
---@return any table A copy of the synchronous table or a string 
---@param connectionID any Integer value used as a handle for other tspnet commands 
---@param name any The full name of the reading buffer name and synchronous table to copy 
---@param startIndex any Integer start value 
---@param endIndex any Integer end value 
---@overload fun(connectionID, name)
function  tspnet.tsp.rbtablecopy(connectionID, name, startIndex, endIndex) end


--- **This function loads and runs a script on a remote TSP-enabled instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.This function downloads a script to a remote instrument and runs it. It automatically adds the appropriate loadscript and endscript commands around the script, captures any errors, and reads back any prompts. No additional substitutions are done on the text.The script is automatically loaded, compiled, and run.Any output from previous commands is discarded.This command does not wait for the script to complete.If you do not want the script to do anything immediately, make sure the script only defines functions for later use. Use the tspnet.execute() function to execute those functions later.If no name is specified, the script is loaded as the anonymous script.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.runscript(myconnection, "mytest",
--- "print([[start]]) for d = 1, 10 do print([[work]]) end print([[end]])")
---  --Load and run a script entitled mytest on the TSP‑enabled instrument connected with myconnection. 
--- ```
---@param connectionID any Integer value used as an identifier for other tspnet commands 
---@param name any The name that is assigned to the script 
---@param script any The body of the script as a string 
---@overload fun(connectionID, script)
function tspnet.tsp.runscript(connectionID, name, script) end


--- **This function writes a string to the remote instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tspnet.write() function sends inputString to the remote instrument. It does not wait for command completion on the remote instrument.The 2600B sends inputString to the remote instrument exactly as indicated. The inputString must contain any necessary new lines, termination, or other syntax elements needed to complete properly.Because tspnet.write() does not process output from the remote instrument, do not send commands that generate too much output without processing the output. This command can stop executing if there is too much unprocessed output from previous commands.
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(myID, "runscript()\r\n")
---  --Commands the remote instrument to execute a command or script named runscript() on a remote device identified in the system as myID. 
--- ```
---@param connectionID any The connection ID returned from tspnet.connect() 
---@param inputString any The string to be written 
function tspnet.write(connectionID, inputString) end


--- **This function adds a user-defined string to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function associates the string value with the string name and stores this key-value pair in nonvolatile memory.Use the userstring.get() function to retrieve the value associated with the specified name.You can use the userstring functions to store custom, instrument-specific information in the instrument, such as department number, asset number, or manufacturing plant location.
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.add("assetnumber", "236")
--- userstring.add("product", "Widgets")
--- userstring.add("contact", "John Doe")
--- for name in userstring.catalog() do
---    print(name .. " = " ..
---       userstring.get(name))
--- end
---  --Stores user-defined strings in nonvolatile memory and recalls them from the instrument using a for loop. Example output: 
--- ```
---@param name any The name of the string; the key of the key-value pair 
---@param value any The string to associate with name; the value of the key-value pair 
function userstring.add(name, value) end


--- **This function creates an iterator for the user‑defined string catalog.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The catalog provides access for user‑defined string pairs, allowing you to manipulate all the key-value pairs in nonvolatile memory. The entries are enumerated in no particular order.
---
---<br>*Examples:*<br>
--- ```lua
--- for name in userstring.catalog() do
---    userstring.delete(name)
--- end
---  --Deletes all user‑defined strings in nonvolatile memory. 
--- ```
function userstring.catalog() end


--- **This function deletes a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function deletes the string that is associated with name from nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.delete("assetnumber")
--- userstring.delete("product")
--- userstring.delete("contact")
---  --Deletes the user-defined strings associated with the assetnumber, product, and contact names. 
--- ```
---@param name any The name (key) of the key-value pair of the user‑defined string to delete 
function userstring.delete(name) end


--- **This function retrieves a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the string that is associated with name from nonvolatile memory.
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.add("assetnumber", "236")
--- value = userstring.get("assetnumber")
--- print(value)
---  --Create the user-defined string assetnumber, set to a value of 236. Read the value associated with the user-defined string named assetnumber. Store it in a variable called value, then print the variable value. Output: 
--- ```
---@return any value The value of the user‑defined string key-value pair 
---@param name any The name (key) of the user‑defined string 
function userstring.get(name) end


--- **This function waits for all previously started overlapped commands to complete.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are two types of instrument commands:The waitcomplete() command suspends the execution of commands until the instrument operations of all previous overlapped commands are finished. This command is not needed for sequential commands.A group number may only be specified when this node is the master node.If no group is specified, the local group is used.If zero (0) is specified for the group, this function waits for all nodes in the system.
---
---<br>*Examples:*<br>
--- ```lua
--- waitcomplete()
---  --Waits for all nodes in the local group. 
--- ```
---@param group any Specifies which TSP-Link group on which to wait 
---@overload fun()
function waitcomplete(group) end
---**buffer 1 for channel A**
---
--- *Type:* Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. 
---
--- *Example:*<br>
--- ```lua
---  smua.measure.overlappedv(smua.nvbuffer1)
--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 1.
--- ```
---@type bufferMethods
smua.nvbuffer1 = {}

---**buffer 2 for channel A**
---
--- *Type:* Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. 
---
--- *Example:*<br>
--- ```lua
---  smua.measure.overlappedv(smua.nvbuffer2)
--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 2.
--- ```
---@type bufferMethods
smua.nvbuffer2 = {}

---**buffer 1 for channel B**
---
--- *Type:* Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. 
---
--- *Example:*<br>
--- ```lua
---  smua.measure.overlappedv(smub.nvbuffer1)
--- --Store voltage readings from SMU channel B into SMU channel B dedicated reading buffer 1.
--- ```
---@type bufferMethods
smub.nvbuffer1 = {}

---**buffer 2 for channel B**
---
--- *Type:* Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. 
---
--- *Example:*<br>
--- ```lua
---  smua.measure.overlappedv(smub.nvbuffer2)
--- --Store voltage readings from SMU channel B into SMU channel B dedicated reading buffer 2.
--- ```
---@type bufferMethods
smub.nvbuffer2 = {}

---**This function creates a reading buffer.**---
--- *Type:* Function
---
--- *Details:*<br>
--- You can use this function to create and dynamically allocate reading buffers. Use bufferSize to designate the number of readings the buffer can store.You can use dynamically allocated reading buffers interchangeably with the smuX.nvbufferY buffers.
---
--- *Example:*<br>
--- ```lua
--- mybuffer2 = smua.makebuffer(200)
--- --Creates a 200 element reading buffer (mybuffer2) for SMU channel A.
--- ```
---@return bufferMethods
---@param bufferSize integer any Maximum number of readings that can be stored.
function  smua.makebuffer(bufferSize) end

---**This function creates a reading buffer.**---
--- *Type:* Function
---
--- *Details:*<br>
--- You can use this function to create and dynamically allocate reading buffers. Use bufferSize to designate the number of readings the buffer can store.You can use dynamically allocated reading buffers interchangeably with the smuX.nvbufferY buffers.
---
--- *Example:*<br>
--- ```lua
--- mybuffer2 = smub.makebuffer(200)
--- --Creates a 200 element reading buffer (mybuffer2) for SMU channel B.
--- ```
---@return bufferMethods
---@param bufferSize integer any Maximum number of readings that can be stored.
function  smub.makebuffer(bufferSize) end

---**This function creates an iterator for the user menu items accessed using the LOAD key on the front panel**
---
--- *Type:* Function
---
--- *Details:*<br>
--- Each time through the loop, displayName and code take on the values in the USER menu.The instrument goes through the list in random order.
---
--- *Example:*<br>
--- ```lua
--- for displayName, code in display.loadmenu.catalog() do
---    print(displayName, code) --- --Asserts a trigger on digital I/O line 2.
--- end--- ```
---@return nil
function display.loadmenu.catalog() end

---@class nodeclass
local nodeclass = {}
--- **This function starts test scripts from a remote node. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- Only the remote master node can use the execute command to run a script on this node. This function does not run test scripts on the master node; only on this node when initiated by the master node.<br>This function may only be called when the group number of the node is different than the node of the master.<br>This function does not wait for the script to finish execution.<br>This command should only be used from a remote master when controlling this instrument over a TSP-Link®.
---
--- *Example:*<br>
--- ```lua
--- node[2].execute(sourcecode)
--- --Runs script code on node 2. The code is in a string variable called **sourcecode**
--- node[3].execute("x = 5")--- --Runs script code in string constant ("x = 5") to set x equal to 5 on node 3.
--- node[32].execute(TestDut.source)--- --Runs the test script stored in the variable **TestDut** (previously stored on the master node) on node 32.
--- ```
nodeclass.execute = function () end 

--- **This function returns the value of a global variable. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- This function retrieves the value of a global variable from the runtime environment of this node.<br>Do not use this command to retrieve the value of a global variable from the local node. Instead, access the global variable directly. This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
--- *Example:*<br>
--- ```lua
--- print(node[5].getglobal("test_val"))
--- --Retrieves and outputs the value of the global variable named test_val from node 5.
--- ```
nodeclass.getglobal = function () end 

--- **This function sets the value of a global variable. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:* Function
---
--- *Details:*<br>
--- From a remote node, use this function to assign the given value to a global variable.<br>Do not use this command to create or set the value of a global variable from the local node (set the global variable directly instead). This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
--- *Example:*<br>
--- ```lua
--- node[3].setglobal("x", 5)
--- --Sets the global variable x on node 3 to the value of 5.
--- ```
nodeclass.setglobal = function () end 

---@class node
---@type nodeclass[]
local node = {}
---**Occurs when the source‑measure unit (SMU) transitions from the idle state to the arm layer of the trigger model**--- *Type:* Constant---@type eventID
smua.trigger.SWEEPING_EVENT_ID = 0---**Occurs when the source‑measure unit (SMU) transitions from the idle state to the arm layer of the trigger model**--- *Type:* Constant---@type eventID
smub.trigger.SWEEPING_EVENT_ID = 0---**Occurs when the SMU moves from the arm layer to the trigger layer of the trigger model**--- *Type:* Constant---@type eventID
smua.trigger.ARMED_EVENT_ID = 0---**Occurs when the SMU moves from the arm layer to the trigger layer of the trigger model**--- *Type:* Constant---@type eventID
smub.trigger.ARMED_EVENT_ID = 0---**Occurs when the SMU completes a source action**--- *Type:* Constant---@type eventID
smua.trigger.SOURCE_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a source action**--- *Type:* Constant---@type eventID
smub.trigger.SOURCE_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a measurement action**--- *Type:* Constant---@type eventID
smua.trigger.MEASURE_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a measurement action**--- *Type:* Constant---@type eventID
smub.trigger.MEASURE_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a pulse**--- *Type:* Constant---@type eventID
smua.trigger.PULSE_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a pulse**--- *Type:* Constant---@type eventID
smub.trigger.PULSE_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a sweep**--- *Type:* Constant---@type eventID
smua.trigger.SWEEP_COMPLETE_EVENT_ID = 0---**Occurs when the SMU completes a sweep**--- *Type:* Constant---@type eventID
smub.trigger.SWEEP_COMPLETE_EVENT_ID = 0---**Occurs when the SMU returns to the idle state**--- *Type:* Constant---@type eventID
smua.trigger.IDLE_EVENT_ID = 0---**Occurs when the SMU returns to the idle state**--- *Type:* Constant---@type eventID
smub.trigger.IDLE_EVENT_ID = 0---**Occurs when the TRIG key on the front panel is pressed**--- *Type:* Constant---@type eventID
smua.display.trigger.EVENT_ID = 0---**Occurs when the TRIG key on the front panel is pressed**--- *Type:* Constant---@type eventID
smub.display.trigger.EVENT_ID = 0---**Occurs when a *TRG command is received on the remote interface**<br>---GPIB only: Occurs when a GET bus command is received<br>---USB only: Occurs when a USBTMC TRIGGER message is received<br>---VXI-11 only: Occurs with the VXI-11 command device_trigger; reference the VXI-11 standard for additional details on the device trigger operation--- *Type:* Constant---@type eventID
smua.trigger.EVENT_ID = 0---**Occurs when a *TRG command is received on the remote interface**<br>---GPIB only: Occurs when a GET bus command is received<br>---USB only: Occurs when a USBTMC TRIGGER message is received<br>---VXI-11 only: Occurs with the VXI-11 command device_trigger; reference the VXI-11 standard for additional details on the device trigger operation--- *Type:* Constant---@type eventID
smub.trigger.EVENT_ID = 0