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

---@class slotArr
slotArr = {}

---@type slotArr[]
slot = {}

slot.PSEUDO_NONE = nil

---@alias slotpseudocardpseudoCard
---|`slot.PSEUDO_NONE`



--- **This attribute specifies a pseudocard to implement for the designated slot.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Pseudocards allow you to configure your system without having an actual switching module installed in your system. You can perform open, close, and scan operations and configure your system with pseudocards.This command is only applicable to a slot that does not have a switching module or pseudocard installed. If a pseudocard is presently assigned to the slot, you must set the slot to no pseudocard before assigning the new pseudocard.After assigning a pseudocard, you can use valid commands for the switching module for that slot.Changing the pseudocard assignment from a pseudocard to no pseudocard invalidates scan lists that include that slot.If a module is installed in the slot, this command returns nil. If the slot is empty and no pseudocard is installed, the return is 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/13964.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- slot[1].pseudocard = slot.PSEUDO_NONE
--- slot[1].pseudocard = 7702
--- print(slot[1].idn)
--- 
--- --Sets slot 1 to no pseudocard, then sets slot 1 to simulate a 7702 switching module. Output is similar to:
--- --7702,Pseudo 40Ch Mux,???????,???????????
--- ```
---@type slotpseudocardpseudoCard
slotArr.pseudocard= 0



--- **This attribute indicates whether a card in the specified slot supports commonside channels for 4-wire resistance measurements.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If commonside 4-wire resistance channels are supported, the returned value is 1.If commonside 4-wire resistance channels are not supported, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16320.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].commonsideohms)
--- 
--- --Query if slot 1 supports commonside 4-wire ohms channels.
--- ```


--- **This attribute returns a string that contains information about the switching module.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The information that is returned depends on whether the switching module in the slot is a physical card or pseudocard.For physical cards, this returns a comma-separated string that contains the model number, description, firmware revision, and serial number of the switching module installed in the specified slot.For pseudocards, the response is Pseudo, followed by the model number, description, and ??? for the firmware revision and serial number.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16328.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].idn)
--- 
--- --If a 7706 module is installed in slot 1, the response is:
--- --7706,25Ch ALL-IN-ONE w/DIO,01.40e,1243657
--- ```


--- **This attribute returns the maximum voltage of all channels on a switching module in the specified slot.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command is only available for a slot if the installed switching module supports voltage settings.This command is not available for the 7709 switching module.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16333.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- maxVolts2 = slot[2].maxvoltage
--- print(maxVolts2)
--- 
--- --Query the maximum voltage on slot 2. The output is similar to:
--- --3.0000000000e+02 
--- ```


--- **This attribute indicates if the module in the specified slot supports temperature sensor channels.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command is only available for a slot if the installed module supports temperature sensor channels. If temperature sensor channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16345.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- TempSensor = slot[1].tempsensor
--- print(TempSensor)
--- 
--- --Query to determine if slot 1 supports temperature sensor channels. If it does support temperature sensor channels, the output is:
--- --1
--- ```
---@class channel
channel = {}


--- **This function reads a value from a totalizer, DAC, or digital I/O channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For totalizer channels, if the mode is set to a reset mode, the count is reset when this command is sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/13984.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.read("125"))
--- 
--- --Assuming a 7706, read the count from the totalizer channel.
--- ```
---@return string value Return string that lists the comma-delimited read values for the channels in channelList
---@param channelList string String that specifies a list of channels, using channel list notation
---@param readingBuffer bufferMethods Reading buffer in which to store read values
---@overload fun(channelList:string):string
function channel.read(channelList, readingBuffer) end


--- **This function returns the present mode of digital and totalizer channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For digital channels, the return is:For totalizer channels, the return is:For DAC channels, the return is 17.This command is not available for other types of channels. If other channels are included in a range, they are ignored. If they are specified directly, an error is generated. If you are querying a slot and the slot does not contain any channels with these types, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15927.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getmode("slot1"))
--- 
--- --Query the configuration of the channels on slot 1. Assuming a 7706, channels 21 and 22 are digital I/O, 23 and 24 are DAC, and channel 25 is a totalizer.
--- --Output:
--- --[1]=1, [2]=1, [3]=17, [4]=17, [5]=2
--- ```
---@return string mode Return string of a comma-delimited list of modes
---@param channelList string String that specifies the channels to query, using normal channel list syntax
function channel.getmode(channelList) end


--- **This function writes a value to a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For a channel with a power state of OFF, an error is generated. No action is taken on any channel in the specified channel list.For DAC channels, the value is expected to be the set floating-point voltage or current. Also, an error is generated if the value is out of range. No action is taken on any channel in the specified channel list.For digital I/O channels, the value becomes the setting of the digital output.The time it takes to execute the write command is affected by the channel delay setting.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15956.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.write("121", 33)
--- 
--- --Output a value of 33 to digital I/O channel 1.
--- ```
---@param channelList string The channels to set, using standard channel naming
---@param value number The value to be written to the channel (must be decimal value)
function channel.write(channelList, value) end


--- **This function queries for the closed channels indicated by the channel list parameter.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to return a list of closed measurement channels, including the paired channel for 4-wire measurements. It does not return non-measurement channels.If more than one channel is closed, they are delimited in the string. If none of the channels in the channel list is closed, nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/17247.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channelList = "101:103"
--- channel.close("101")
--- print(channel.getclose(channelList))
--- channel.close("103")
--- print(channel.getclose(channelList))
--- 
--- --For this example, assume there is a card or pseudocard in slot 1 with no previously closed channels. The output is:
--- --[1]=101
--- --[1]=101, [2]=103
--- ```
---@return string closed A string that lists the channels that are presently closed in the specified channel list
---@param channelList string A string that lists the channels to be queried (including allslots, slot1, or slot2 to get information on all channels in both slots or a specific slot); returns all slots if nothing is specified
---@overload fun():string
function channel.getclose(channelList) end


--- **This function returns the number of times the relays have been closed for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The DAQ6510 keeps an internal count of the number of times each relay has been closed. This count can help you determine when relays require replacement. Refer to the switching module documentation for the contact life specifications for the relays.If channels are specified, the count values are returned in the order in which the channels are specified. If slots are specified, the response lists the channels starting from lowest to highest. Because each slot is processed completely before going to the next, all slot 1 channels are listed before slot 2 channels.Relay closures are counted only when a relay cycles from open to closed state.It is good practice to get the relay count at the end of a program. This saves the latest count to memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/17384.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- counts = channel.getcount("201:205")
--- print(counts)
--- 
--- --Gets the close counts for channels 1 to 5 on slot 2.
--- --Example output for channels 201, 202, 203, 204, and 205:
--- --[1]=201, [2]=202, [3]=203, [4]=204, [5]=205
--- ```
---@return string counts A comma-delimited string that lists the number of times the specified channels have closed
---@param channelList string A string listing the items to query, which can include
function channel.getcount(channelList) end


--- **This function gets the match value on a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command returns the match value that was set for the specified channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/17540.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getmatch("slot1"))
--- 
--- --Assuming a 7706, query the match values set for digital I/O channels and totalizer on slot 1.
--- --Output (assuming defaults):
--- --[1]=0, [2]=0, [3]=0
--- ```
---@return string matchValue The match values set for the channels in channelList
---@param channelList string String specifying digital I/O or totalizer channels to query, using normal channel list syntax
function channel.getmatch(channelList) end


--- **This function sets the match value on a digital input or totalizer channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use matching to set a state or generate an event when the digital I/O or totalizer count matches a value, instead of continually reading the digital input or totalizer.The default mask is all bits.Switch channels are not supported. If they are included in a range or slot specifier, they are ignored. If they are specified directly, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/17541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setmatchtype("121", channel.MATCH_EXACT)
--- channel.setmatch("121", 32)
--- 
--- --Assuming a 7706 is installed, set the match type for digital I/O channel 21 on slot 1 to exact. Set the match value to 32.
--- ```
---@param channelList string String that specifies the channels to query, using normal channel list syntax
---@param matchValue number Channel value to compare on the specified channel
---@param mask number Value to specify the bits used to mask matchValue
---@overload fun(channelList:string,matchValue:number)
function channel.setmatch(channelList, matchValue, mask) end


--- **This function returns the type associated with a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channel type is defined by the physical hardware of the card on which the channel exists. The following are valid channel types:Refer to the card-specific documentation for more information about the channel types available for your card.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/17547.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.gettype("101, 125"))
--- 
--- --Query the channel type of channels 1 and 25 in slot 1, assuming a 7706.
--- --Output:
--- --[1]=channel.TYPE_SWITCH, [2]=channel.TYPE_TOTALIZER
--- ```
---@return string type Returns a comma-delimited list of the type of channels in channelList
---@param channelList string String specifying the channels to query, using normal channelList syntax
function channel.gettype(channelList) end

channel.COUNT_INTERVAL_1M5 = nil
channel.COUNT_INTERVAL_5M10 = nil
channel.COUNT_INTERVAL_10M15 = nil
channel.COUNT_INTERVAL_15M30 = nil
channel.COUNT_INTERVAL_30M60 = nil
channel.COUNT_INTERVAL_60M24 = nil
channel.COUNT_INTERVAL_24H = nil

---@alias channelsetcountintervalinterval
---|`channel.COUNT_INTERVAL_1M5`
---|`channel.COUNT_INTERVAL_5M10`
---|`channel.COUNT_INTERVAL_10M15`
---|`channel.COUNT_INTERVAL_15M30`
---|`channel.COUNT_INTERVAL_30M60`
---|`channel.COUNT_INTERVAL_60M24`
---|`channel.COUNT_INTERVAL_24H`



--- **This function determines how often the instrument stores the channel relay closure count.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command determines how often channel relay closure counts are stored in nonvolatile memory. If the DAQ6510 is turned off before the count is stored, the counts are lost.The DAQ6510 stores relay closure counts:Relay closure counts are updated in temporary memory every time a channel is closed regardless of how it was closed.The lower the interval, the less chance there is of losing relay counts due to power failures. However, writing to memory more often may reduce scan throughput.It is good practice to query the count at the end of a program to manually update the count.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72225.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setcountinterval(channel.COUNT_INTERVAL_30M)
--- 
--- --Sets the channel count save interval to 30 minutes.
--- ```
---@param interval channelsetcountintervalinterval The count update interval
function channel.setcountinterval(interval) end

channel.COUNT_INTERVAL_1M5 = nil
channel.COUNT_INTERVAL_5M10 = nil
channel.COUNT_INTERVAL_10M15 = nil
channel.COUNT_INTERVAL_15M30 = nil
channel.COUNT_INTERVAL_30M60 = nil
channel.COUNT_INTERVAL_60M24 = nil
channel.COUNT_INTERVAL_24H = nil

---@alias channelgetcountintervalupdate
---|`channel.COUNT_INTERVAL_1M5`
---|`channel.COUNT_INTERVAL_5M10`
---|`channel.COUNT_INTERVAL_10M15`
---|`channel.COUNT_INTERVAL_15M30`
---|`channel.COUNT_INTERVAL_30M60`
---|`channel.COUNT_INTERVAL_60M24`
---|`channel.COUNT_INTERVAL_24H`



--- **This function returns the interval that is presently set for storage of channel relay closure counts.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72230.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getcountinterval())
--- 
--- --If the interval was set to 24 hours, the return is:
--- --channel.COUNT_INTERVAL_24H
--- ```
---@return channelgetcountintervalupdate update The count update interval
function channel.getcountinterval() end


--- **This function configures the DMM for a channel or group of channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must use this command to set the measure or digitize function before using it to set the parameters for the selected function. You can send up to four setting and value pairs for this command.To set up a measure function, assign setting to dmm.ATTR_MEAS_FUNCTION and set the value to one of the options in the table below. For example, to set channel 1 in slot 1 to the DC voltage function, you send:When a function is assigned to a channel, the default values of the new function are assigned to the channel.Options for dmm.ATTR_MEAS_FUNCTIONTo set up a digitize function, assign setting to dmm.ATTR_DIGI_FUNCTION. Set the value to either dmm.FUNC_DIGITIZE_CURRENT or dmm.FUNC_DIGITIZE_VOLTAGE. For example, to set channel 3 in slot 1 to the digitize voltage function, you send:Once the function is set, you can set the parameters and settings for that function. The following lists describe the settings that are available for each function, with links to the descriptions of the corresponding TSP command descriptions. The options for each function setting are the same as the settings for the TSP commands.Aperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZEROdB reference: dmm.ATTR_MEAS_DB_REFERENCEdBm reference: dmm.ATTR_MEAS_DBM_REFERENCEDisplay digits: dmm.ATTR_MEAS_DIGITSInput impedance: dmm.ATTR_MEAS_INPUT_IMPEDANCELine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOdB reference: dmm.ATTR_MEAS_DB_REFERENCEdBm reference: dmm.ATTR_MEAS_DBM_REFERENCEDetector bandwidth: dmm.ATTR_MEAS_DETECTBWDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTODetector bandwidth: dmm.ATTR_MEAS_DETECTBWDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_N2-wire RTD type: dmm.ATTR_MEAS_TWO_RTD3-wire RTD type: dmm.ATTR_MEAS_THREE_RTD4-wire RTD type: dmm.ATTR_MEAS_FOUR_RTDAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCOffset Compensation: dmm.ATTR_MEAS_OFFCOMP_ENABLEOpen lead detector: dmm.ATTR_MEAS_OPEN_DETECTORReference junction: dmm.ATTR_MEAS_REF_JUNCTIONRTD Alpha: dmm.ATTR_MEAS_RTD_ALPHARTD Beta: dmm.ATTR_MEAS_RTD_BETARTD Delta: dmm.ATTR_MEAS_RTD_DELTARTD Zero: dmm.ATTR_MEAS_RTD_ZEROSimulated reference temperature: dmm.ATTR_MEAS_SIM_REF_TEMPThermistor: dmm.ATTR_MEAS_THERMISTORThermocouple: dmm.ATTR_MEAS_THERMOCOUPLETransducer: dmm.ATTR_MEAS_TRANSDUCERUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCOffset compensation: dmm.ATTR_MEAS_OFFCOMP_ENABLEOpen lead detector: dmm.ATTR_MEAS_OPEN_DETECTORRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto zero: dmm.ATTR_MEAS_AUTO_ZEROBias level: dmm.ATTR_MEAS_BIAS_LEVELDisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTODisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYDisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTThreshold autorange: dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTOThreshold range: dmm.ATTR_MEAS_THRESHOLD_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYMeasure count: dmm.ATTR_MEAS_COUNTThreshold autorange: dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTOThreshold range: dmm.ATTR_MEAS_THRESHOLD_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGESense range (read only): dmm.ATTR_MEAS_SENSE_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_DIGI_APERTURECount: dmm.ATTR_DIGI_COUNTDisplay digits: dmm.ATTR_DIGI_DIGITSRange: dmm.ATTR_DIGI_RANGESample rate: dmm.ATTR_DIGI_SAMPLE_RATEUnit: dmm.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): dmm.ATTR_DIGI_USER_DELAY_NAperture: dmm.ATTR_DIGI_APERTURECount: dmm.ATTR_DIGI_COUNTDecibel reference: dmm.ATTR_DIGI_DB_REFERENCEDecibel-milliwatts reference: dmm.ATTR_DIGI_DBM_REFERENCEDisplay digits: dmm.ATTR_DIGI_DIGITSInput impedance: dmm.ATTR_DIGI_INPUT_IMPEDANCERange: dmm.ATTR_DIGI_RANGERelative enable: dmm.ATTR_DIGI_REL_ENABLERelative level: dmm.ATTR_DIGI_REL_LEVELSample rate: dmm.ATTR_DIGI_SAMPLE_RATEUnit: dmm.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): dmm.ATTR_DIGI_USER_DELAY_NEnable math: dmm.ATTR_MEAS_MATH_ENABLEb (offset) value: dmm.ATTR_MEAS_MATH_MXB_BFm (scalar) value: dmm.ATTR_MEAS_MATH_MXB_MFMath format: dmm.ATTR_MEAS_MATH_FORMATPercent: dmm.ATTR_MEAS_MATH_PERCENTEnable math: dmm.ATTR_DIGI_MATH_ENABLEb (offset) value: dmm.ATTR_DIGI_MATH_MXB_BFm (scalar) value: dmm.ATTR_DIGI_MATH_MXB_MFMath format: dmm.ATTR_DIGI_MATH_FORMATPercent: dmm.ATTR_DIGI_MATH_PERCENTLimit 1 audible: dmm.ATTR_MEAS_LIMIT_AUDIBLE_1Limit 1 auto clear: dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_1Limit 1 enable: dmm.ATTR_MEAS_LIMIT_ENABLE_1Limit 1 fail: dmm.ATTR_MEAS_LIMIT_FAIL_1Limit 1 high value: dmm.ATTR_MEAS_LIMIT_HIGH_1Limit 1 low value: dmm.ATTR_MEAS_LIMIT_LOW_1Limit 2 audible: dmm.ATTR_MEAS_LIMIT_AUDIBLE_2Limit 2 auto clear: dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_2Limit 2 enable: dmm.ATTR_MEAS_LIMIT_ENABLE_2Limit 2 fail: dmm.ATTR_MEAS_LIMIT_FAIL_2Limit 2 high value: dmm.ATTR_MEAS_LIMIT_HIGH_2Limit 2 low value: dmm.ATTR_MEAS_LIMIT_LOW_2Limit 1 audible: dmm.ATTR_DIGI_LIMIT_AUDIBLE_1Limit 1 auto clear: dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_1Limit 1 enable: dmm.ATTR_DIGI_LIMIT_ENABLE_1Limit 1 fail: dmm.ATTR_DIGI_LIMIT_FAIL_1Limit 1 high value: dmm.ATTR_DIGI_LIMIT_HIGH_1Limit 1 low value: dmm.ATTR_DIGI_LIMIT_LOW_1Limit 2 audible: dmm.ATTR_DIGI_LIMIT_AUDIBLE_2Limit 2 auto clear: dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_2Limit 2 enable: dmm.ATTR_DIGI_LIMIT_ENABLE_2Limit 2 fail: dmm.ATTR_DIGI_LIMIT_FAIL_2Limit 2 high value: dmm.ATTR_DIGI_LIMIT_HIGH_2Limit 2 low value: dmm.ATTR_DIGI_LIMIT_LOW_2Edge level: dmm.ATTR_MEAS_ATRIG_EDGE_LEVELEdge slope: dmm.ATTR_MEAS_ATRIG_EDGE_SLOPEMode: dmm.ATTR_DIGI_ATRIG_MODEWindow direction: dmm.ATTR_MEAS_ATRIG_WINDOW_DIRECTIONWindow level high: dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_HIGHWindow level low: dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_LOWEdge level: dmm.ATTR_DIGI_ATRIG_EDGE_LEVELEdge slope: dmm.ATTR_DIGI_ATRIG_EDGE_SLOPEMode: dmm.ATTR_DIGI_ATRIG_MODEWindow direction: dmm.ATTR_DIGI_ATRIG_WINDOW_DIRECTIONWindow level high: dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_HIGHWindow level low: dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_LOWFilter enable: dmm.ATTR_MEAS_FILTER_ENABLEFilter count: dmm.ATTR_MEAS_FILTER_COUNTFilter type: dmm.ATTR_MEAS_FILTER_TYPEFilter window: dmm.ATTR_MEAS_FILTER_WINDOWRelative offset enable: dmm.ATTR_MEAS_REL_ENABLERelative offset method (DCV ratio measurements only): dmm.ATTR_MEAS_REL_METHODRelative offset value: dmm.ATTR_MEAS_REL_LEVELRelative offset enable: dmm.ATTR_DIGI_REL_ENABLERelative offset value: dmm.ATTR_DIGI_REL_LEVEL
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72237.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101", dmm.ATTR_MEAS_NPLC, 1)
--- channel.setdmm("102", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_RESISTANCE)
--- channel.setdmm("102", dmm.ATTR_MEAS_NPLC, 1)
--- channel.close("101")
--- print(dmm.measure.read())
--- channel.close("102")
--- print(dmm.measure.read())
--- 
--- --Set up channel 1 on slot 1 to measure DC voltage and channel 2 to measure 2-wire resistance. Close each channel and make a measurement.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 1)
--- channel.close("101")
--- print(dmm.measure.read())
--- channel.close("102")
--- print(dmm.measure.read())
--- 
--- --Set channels 1 to 9 on slot 1 to measure DC voltage.
--- --Set channels 1 to 9 to use an NPLC of 1.
--- --Close channel 1 and make a measurement.
--- --Close channel 2 and make a measurement.
--- channel.setdmm("101:109",
---    dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE,
---    dmm.ATTR_MEAS_NPLC, 1,
---    dmm.ATTR_MEAS_RANGE_AUTO, dmm.ON,
---    dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_4_5)
--- 
--- --This command sets channels 1 to 9 on slot 1 to measure DC voltage using an NPLC of 1, with autorange on, and at 4½ digit resolution.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 1)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE_AUTO, dmm.ON)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_4_5)
--- 
--- --These commands set the same values as Example 3, except that each value is sent in a separate command.
--- ```
---@param channelList string List of channels for which to set the DMM
---@param setting functionAttributes | functions The DMM function or the parameter for the function to be applied to the channelList; refer to Details and the tables following the examples
---@param value any The function or attribute value
---@overload fun(channelList:string,setting:functionAttributes | functions,value:any)
function channel.setdmm(channelList, setting, value, ...) end


--- **This function returns the setting for a channel DMM attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can retrieve one attribute at a time.For detail on the options for setting, see the examples and lists in the channel.setdmm command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getdmm("101", dmm.ATTR_MEAS_AUTO_DELAY))
--- 
--- --Retrieve the auto delay setting for channel 1 in slot 1.
--- --Example return:
--- --[1]=dmm.DELAY_ON
--- ```
---@param channelList string List of channels to get from the DMM
---@param setting functionAttributes | functions The DMM function or the parameter values to return for the selected channels 
function channel.getdmm(channelList, setting) end


--- **This function returns the label associated with the specified channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns nil if no label is set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72277.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabel('101', 'First')
--- channel.setlabel('102', 'Second')
--- channel.setlabel('103', 'Third')
--- print(channel.getlabel('101'))
--- print(channel.getlabel('102'))
--- print(channel.getlabel('103'))
--- 
--- --Set the labels to First, Second, and Third.
--- --Return the new labels.
--- --Output:
--- --First
--- --Second
--- --Third
--- ```
---@return string label A string that lists the comma-delimited label for the channel specified in channelNumber
---@param channelNumber string A string that lists the channel to query for the associated label
function channel.getlabel(channelNumber) end


--- **This function allows you to control multiple digital I/O channels as one channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Changing the width allows for multiple sequential digital I/O channels to be linked. This option only applies to digital I/O channels, such as channels 21 and 22 on the 7706 and channels 11 to 14 on the 7707.For widths greater than 1, the specified channel occupies the least significant byte. For example, writing the value of 4278255360 (hexadecimal FF00FF00) to channel 1 with a width of 4 sets channel 1 to 0, channel 2 to 255 (hexadecimal FF), channel 3 to 0, and channel 4 to 255 (hexadecimal FF). Writing the value of 4278255360 to channel 1 with a width of 1 sets channel 1 to 0 and leaves other channels untouched.The maximum width is the number of digital I/O channels available on the card. If a width crosses channels, then only the channels set to output are affected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72404.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setwidth("121", 2)
--- 
--- --Assuming a 7706 in slot 1, sets the digital I/O channels starting at channel 21 to be handled as one channel.
--- ```
---@param channelNumber string The first channel number of the channels to be combined
---@param width number The number of channels to combine
function channel.setwidth(channelNumber, width) end


--- **This function gets the width used by the channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Changing the width allows for multiple sequential digital I/O channels to be linked. This option only applies to digital I/O channels, such as channels 21 and 22 on the 7706 and channels 11 to 14 on the 7707.For widths greater than 1, the specified channel occupies the least significant byte. For example, writing the value of 4278255360 (hexadecimal FF00FF00) to channel 1 with a width of 4 sets channel 1 to 0, channel 2 to 255 (hexadecimal FF), channel 3 to 0, and channel 4 to 255 (hexadecimal FF). Writing the value of 4278255360 to channel 1 with a width of 1 sets channel 1 to 0 and leaves other channels untouched.The maximum width is the number of digital I/O channels available on the card. If a width crosses channels, then only the channels set to output are affected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72408.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getwidth("121"))
--- 
--- --Returns the width setting for channel 21 of slot 1. If the width was set to 2, the return is:
--- --[1]=2
--- ```
---@return string width The width used by the channel
---@param channelNumber string The first channel number of the channels to be combined
function channel.getwidth(channelNumber) end

channel.MODE_INPUT = nil
channel.MODE_OUTPUTF = nil
channel.MODE_RISING_EDGE = nil
channel.MODE_FALLING_EDGE = nil
channel.MODE_RISING_EDGE_READ_RESET = nil
channel.MODE_FALLING_EDGE_READ_RESET = nil

---@alias channelsetmodemode
---|`channel.MODE_INPUT`
---|`channel.MODE_OUTPUTF`
---|`channel.MODE_RISING_EDGE`
---|`channel.MODE_FALLING_EDGE`
---|`channel.MODE_RISING_EDGE_READ_RESET`
---|`channel.MODE_FALLING_EDGE_READ_RESET`



--- **This function sets the mode of operation of a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can set digital I/O channels to be input or output channels. Changing the mode from input to output adds an additional channel delay if a channel delay is set.For totalizer channels, you can set which side of the input signal to count on and whether or not to reset the count when the count is read. To clear the totalizer count at a specific step in a scan, set the mode to either rising reset or falling reset, then use the add scan command to add the totalizer channel.The specified channel list must define only one channel type. For example, channel list "121:125" is only valid if channels 21, 22, 23, 24, and 25 are the same type. If one of the channels is a different type of channel, the channel list is invalid and an error is generated.Changing the mode setting can impact the power consumption of the card. The instrument verifies that power is available before changing the mode. If there is not enough power, the command generates an error.This command is not available for DAC, switch, and backplane channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72420.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setmode("125", channel.MODE_FALLING_EDGE)
--- print(channel.getmode("125"))
--- 
--- --Assuming a 7706, set totalizer 25 on slot 1 to be configured to count on the falling edge.
--- --Print the setting to verify it. The return is:
--- --[1]=0
--- ```
---@param channelList string String specifying the channels to set, using normal channel list syntax
---@param mode channelsetmodemode The mode of operation for a channel; for digital channels, the options are
function channel.setmode(channelList, mode) end


--- **This function closes the channels and channel pairs that are specified by the channel list parameter.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The action of the close command depends on which, if any, function is set for the DMM.If no function is set, the listed channels or channel pairs are closed. You can select multiple channels.If the DMM for the channel is set to a function, the listed channels or channel pairs are closed. In addition, it opens channels or channel pairs that could affect the measurements. When a channel is set to a function, only one channel can be specified in the channel list.When you close a channel or channel pair, the instrument:This command is not available for digital I/O, digital-to-analog converter (DAC analog output), and totalizer channels. If the digital I/O, DAC analog output, or totalizer channel is in a range of channels, the unavailable channel is ignored. If you try to close it individually, an error is generated.Use the channel.getclose() command to return a list of closed measurement channels, including the paired channels for 4-wire measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72855.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.close("101")
--- channel.close("102")
--- print(channel.getstate("101:105"))
--- 
--- --This example assumes a 7706 module is installed with no functions set. This example closes channels 101, then closes 102 without opening 101. The state of channels 1 to 5 is as follows, indicating that channels 1 and 2 are closed and the others are open:
--- --[1]=channel.IND_CLOSED, [2]=channel.IND_CLOSED, [3]=0, [4]=0, [5]=0
--- reset()
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- print(channel.getdmm("101:105", dmm.ATTR_MEAS_FUNCTION))
---  
--- channel.close("101")
--- print(channel.getstate("101:105"))
---  
--- channel.close("102")
--- print(channel.getstate("101:105"))
--- 
--- --This example assumes a 7706 module is installed. This example sets channels 1 to 5 on slot 1 to measure DC voltage.
--- --Verify the DMM function settings. The output is:
--- --[1]=dmm.FUNC_DC_VOLTAGE, [2]=dmm.FUNC_DC_VOLTAGE, [3]=dmm.FUNC_DC_VOLTAGE, [4]=dmm.FUNC_DC_VOLTAGE, [5]=dmm.FUNC_DC_VOLTAGE
--- --Close channel 101, then get the states of channels 101 to 105. The return is:
--- --[1]=channel.IND_CLOSED, [2]=0, [3]=0, [4]=0, [5]=0
--- --Close 102. Channel 101 is automatically opened, and the return is:
--- --[1]=0, [2]=channel.IND_CLOSED, [3]=0, [4]=0, [5]=0
--- ```
---@param channelList string A string that lists the channels and channel pairs to close
function channel.close(channelList) end


--- **This command opens the specified channels and channel pairs.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the specified channels are not set to a measurement function, this command opens the specified channels without affecting other channels.If the specified channels are set to a measurement function, their paired channels and backplane channels are also opened.The settling time associated with a channel must elapse before the command completes. User delay is not added when a relay opens.You cannot open digital I/O, DAC, and totalizer channels. If you include one of these channels in the channel list, the invalid channel is ignored but other channels open normally.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72860.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.close("101")
--- channel.close("102")
--- channel.open("allslots")
--- 
--- --This example closes channels 101 and 102, then opens all channels.
--- channel.open("slot1")
--- 
--- --Opens all channels on slot 1.
--- channel.open("allslots")
--- 
--- --Opens all channels on all slots.
--- ```
---@param channelList string String listing the channels to open; allslots, slot1, and slot2 available, which open all channels on all slots, all channels on slot 1, or all channels on slot 2
function channel.open(channelList) end

channel.ON = nil
channel.OFF = nil

---@alias channelsetcommonsidestate
---|`channel.ON`
---|`channel.OFF`



--- **This function sets up the specified slot to have a common side path.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Set commonside ohms before setting the function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/74344.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.open("allslots")
--- channel.setcommonside("slot1", channel.ON)
--- channel.setdmm("slot1", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_4W_RESISTANCE) 
--- channel.close("101") 
--- print(dmm.measure.read())
--- channel.close("132") 
--- print(dmm.measure.read()) 
--- printbuffer(1, defbuffer1.n, defbuffer1)
--- channel.open("allslots")
--- 
--- --Open all slots.
--- --Set the channels on slot 1 to have a common side path.
--- --Set slot 1 to measure 4-wire resistance.
--- --Close channel 101.
--- --Make a measurement.
--- --Repeat closing and reading channels for each DUT (channels 102 to 131). 
--- ```
---@param slot string A string that lists the slot number; can be allslots, slot1, or slot2
---@param state channelsetcommonsidestate channel.ON or channel.OFF
function channel.setcommonside(slot, state) end


--- **This function returns the state indicators of the channels in the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command returns the overload, match, closed, or open state of a channel. The states that can be returned depend on the type of channel.All channels can report an open or closed channel.Totalizer and digital I/O channels can report that a value has been matched.Totalizer channels can also report that the count has overflowed, which means the last value read was less than the previous value read. This occurs when the totalizer reaches 4,294,967,295 and automatically resets to zero between reads.Cards are returned sequentially by channel number.Each bit in the return represents a different indicator. Therefore, multiple indicators can be present (the OR operation is performed bitwise).Possible returns are:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/74635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.close("105")
--- State = channel.getstate("101:120")
--- print(State)
--- 
--- --Close channel 5 on slot 1.
--- --Query the state of the first 20 channels on slot 1.
--- --View the response assigned to State.
--- --Output (assuming a 7706):
--- --[1]=0, [2]=0, [3]=0, [4]=0, [5]=channel.IND_CLOSED, [6]=0, [7]=0, [8]=0, [9]=0, [10]=0, [11]=0, [12]=0, [13]=0, [14]=0, [15]=0, [16]=0, [17]=0, [18]=0, [19]=0, [20]=0
--- ```
---@return any state Return a comma-delimited string that lists the states for the channels in channelList; refer to Details
---@param channelList any String specifying the channels to query; use normal channel list syntax; if no channels are defined, all slots are returned
---@overload fun():any
function channel.getstate(channelList) end


--- **This function queries for the additional delay time for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The delay times are returned in a comma-delimited list in the same order that the channels are specified in the channel list parameter. A value of zero (0) indicates that no additional delay time is incurred before a close command completes.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/75072.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdelay("slot1", 3.1)
--- DelayTimes = channel.getdelay("107,105,103")
--- print(DelayTimes)
--- 
--- --Set a delay of 3.1 s for all channels in slot 1. Query channels 7, 5, and 3 on that slot.
--- ```
---@return string delayTimes A comma-delimited string consisting of the delay times (in seconds) for channels specified in channelList
---@param channelList string A string listing the channels to query for their delay times; slot1, slot2, or allslots allowed
function channel.getdelay(channelList) end


--- **This function sets additional delay time for specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After a channel closes, a command incurs the delay time indicated in the response for a channel before it completes. However, the internal settling time must elapse before the user delay is incurred. Therefore, the sequence is:The channel delay is an additional delay that is added after a channel is closed. You can use this delay to allow additional settling time for a signal on that channel. For most cards, the resolution of the delay is 10 us. However, check the documentation for your card to verify. To see if the delay value was modified after setting, query the value.Setting a delay only applies to switch channels.The delay being specified may be updated based on the delay resolution of the card.To query the delay value, use the channel.getdelay() command. Pseudocards do not replicate the additional delay time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/75075.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdelay("103, 105", 50e-6)
--- 
--- --Sets channel 3 and 5 of slot 1 for a delay time of 50 µs.
--- ```
---@param channelList string A string listing the channels for which to add delay time
---@param delay number Delay time for the selected channels; minimum is 0 seconds
function channel.setdelay(channelList, delay) end


--- **This function sets the label associated with a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the label of the specified channel to the label value. The label must be unique; you cannot assign the same label to more than one channel. Labels cannot start with a digit. They can be up to 19 characters. On the front panel of the instrument, only the first few characters are displayed.To clear a label, set it to an empty string ("").After defining a label, you can use it to specify the channel instead of using the channel number in commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/75086.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabel('101', 'First')
--- channel.setlabel('102', 'Second')
--- channel.setlabel('103', 'Third')
--- print(channel.getlabel('101'))
--- print(channel.getlabel('102'))
--- print(channel.getlabel('103'))
--- print(channel.getlabel('First'))
--- 
--- --Set the labels to First, Second, and Third.
--- --Return the new labels.
--- --Output:
--- --First
--- --Second
--- --Third
--- --First
--- ```
---@param channelNumber string A string that lists the channel for which to set the label
---@param labelname string A string that contains the label for the channel in channelNumber, up to 19 characters
function channel.setlabel(channelNumber, labelname) end


--- **This function sets the match type on a digital I/O or totalizer channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The types of match values include:For an exact match, the state match indicator only becomes true when the match value equals the channel-read value.For an any match, a match is when the match value equals the channel-read value.For an unchanged match, the value should be the same as the original. If not, a match is declared.When none is set, matching is disabled.This command is not supported on DAC and switch channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/76230.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setmatchtype("121", channel.MATCH_EXACT)
--- 
--- --Assuming a 7706 is installed, set the match type for digital I/O channel 21 on slot 1 to MATCH_EXACT.
--- ```
---@param channelList string String specifying the channels to set, using normal channel list syntax
---@param type channelMatchType A value for setting the match operation used on this specific channel
function channel.setmatchtype(channelList, type) end


--- **This function returns the match type for digital I/O and totalizer channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channel match types are:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/76231.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getmatchtype("121, 122, 125"))
--- 
--- --Assuming a 7706, query the match type for channels 21, 22, and 25 on slot 1, which includes digital I/O and totalizer channels. 
--- --Example output: 
--- --[1]=channel.MATCH_NONE, [2]=channel.MATCH_NONE, [3]=channel.MATCH_UNCHANGED
--- ```
---@return string matchType The comma-delimited states for channels in channelList
---@param channelList string String specifying the digital I/O or totalizer channels to query, using normal channel list syntax
function channel.getmatchtype(channelList) end


--- **This function lists the commonside setting for the specified slot.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/76246.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getcommonside("slot1"))
--- 
--- --Check the settings of channels 1 to 10 on slot 1. If common side is enabled, return is similar to:
--- --[1]=1, [2]=1, [3]=1, [4]=1, [5]=1, [6]=1, [7]=1, [8]=1, [9]=1, [10]=1
--- ```
---@return string state The state of the slot
---@param slot string A string that lists the slot number; can be allslots, slot1, or slot2
function channel.getcommonside(slot) end
---@class dataqueue
dataqueue = {}


--- **This function adds an entry to the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot use the timeout value when accessing the data queue from a remote node (you can only use the timeout value while adding data to the local data queue).The timeout value is ignored if the data queue is not full.The dataqueue.add() function returns false:If the value is a table, a duplicate of the table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14654.htm"])
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
--- 
--- --Clear the data queue.
--- --Each line adds one item to the data queue.
--- --Output:
--- --The dataqueue contains:
--- --10
--- --11
--- --12
--- ```
---@return boolean result The resulting value of true or false based on the success of the function
---@param value any The data item to add; value can be of any type
---@param timeout number The maximum number of seconds to wait for space in the data queue
---@overload fun(value:any):boolean
function dataqueue.add(value, timeout) end


--- **This function clears the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function forces all dataqueue.add() commands that are in progress to time out and deletes all data from the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14655.htm"])
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
--- 
--- --This example fills the data queue and prints the number of items in the queue. It then clears the queue and prints the number of items again.
--- --Output:
--- --There are 128 items in the dataqueue
--- --There are 0 items in the data queue
--- ```
function dataqueue.clear() end

dataqueue.CAPACITY = nil

---@alias dataqueueCAPACITYcount
---|`dataqueue.CAPACITY`



--- **This constant is the maximum number of entries that you can store in the data queue.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This constant always returns the maximum number of entries that can be stored in the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14656.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MaxCount = dataqueue.CAPACITY
--- while dataqueue.count < MaxCount do
---    dataqueue.add(1)
--- end
--- print("There are " .. dataqueue.count
---    .. " items in the data queue")
--- 
--- --This example fills the data queue until it is full and prints the number of items in the queue.
--- --Output:
--- --There are 128 items in the data queue
--- ```


--- **This attribute contains the number of items in the data queue.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The count is updated as entries are added with dataqueue.add() and read from the data queue with dataqueue.next(). It is also updated when the data queue is cleared with dataqueue.clear().A maximum of dataqueue.CAPACITY items can be stored at any one time in the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14657.htm"])
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
--- 
--- --This example fills the data queue and prints the number of items in the queue. It then clears the queue and prints the number of items again.
--- --Output:
--- --There are 128 items in the data queue
--- --There are 0 items in the data queue
--- ```


--- **This function removes the next entry from the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the data queue is empty, the function waits up to the timeout value.If data is not available in the data queue before the timeout expires, the return value is nil.The entries in the data queue are removed in first-in, first-out (FIFO) order.If the value is a table, a duplicate of the original table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14658.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dataqueue.clear()
--- for i = 1, 10 do
---    dataqueue.add(i)
--- end
--- print("There are " .. dataqueue.count
---    .. " items in the data queue")
---  
--- while dataqueue.count > 0 do
---    x = dataqueue.next()
---    print(x)
--- end
--- print("There are " .. dataqueue.count
---    .. " items in the data queue")
--- 
--- --Clears the data queue, adds ten entries, then reads the entries from the data queue. Note that your output may differ depending on the setting of format.asciiprecision.
--- --Output:
--- --There are 10 items in the data queue
--- --1
--- --2
--- --3
--- --4
--- --5
--- --6
--- --7
--- --8
--- --9
--- --10
--- --There are 0 items in the data queue
--- ```
---@return any value The next entry in the data queue
---@param timeout number The number of seconds to wait for data in the queue
---@overload fun():any
function dataqueue.next(timeout) end
---@class fs
fs = {}


--- **This function sets the current working directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The new working directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the given path does not exist.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14808.htm"])
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
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Verify that /usb1/temp is a directory and change it to be the current working directory.
--- --Set the variable for the current working directory to be testPath.
--- --The return should be:
--- --/usb1/temp
--- --If /usb1/temp is not a directory, set the variable for the current working directory to be testPath.
--- --The return should be:
--- --/usb1
--- ```
---@return string workingDirectory Returned value containing the working path
---@param path string A string indicating the new working directory path
function fs.chdir(path) end


--- **This function returns the absolute path of the current working directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14810.htm"])
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
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Verify that /usb1/temp is a directory and change it to be the current working directory.
--- --Set the variable for the current working directory to be testPath.
--- --The return should be:
--- --/usb1/temp
--- --If /usb1/temp is not a directory, set the variable for the current working directory to be testPath.
--- --The return should be:
--- --/usb1
--- ```
---@return string path The absolute path of the current working directory
function fs.cwd() end


--- **This function tests whether or not the specified path refers to a directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file system path may be absolute or relative to the current working system path.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14811.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print("Is directory: ", fs.is_dir("/usb1/"))
--- 
--- --Because /usb1/ is always the root directory of an inserted flash drive, you can use this command to verify that USB flash drive is inserted.
--- if fs.is_dir("/usb1/temp") == false then
---     fs.mkdir("/usb1/temp")
--- end
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Check to see if the temp directory exists.
--- --If it does not exist, create a directory named temp.
--- ```
---@return boolean status Whether or not the given path is a directory (true or false)
---@param path string The path of the file system entry to test
function is_dir(path) end


--- **This function creates a directory at the specified path.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the parent folder of the new directory does not exist, or if a file system entry already exists at the given path.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14812.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- if fs.is_dir("/usb1/temp") == false then
---     fs.mkdir("/usb1/temp")
--- end
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Check to see if the temp directory exists.
--- --If it does not exist, create a directory named temp.
--- ```
---@return string path The returned path of the new directory
function fs.mkdir(newPath) end


--- **This function returns a list of the file system entries in the directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The directory path may be absolute or relative to the current working directory.This command is nonrecursive. For example, entries in subfolders are not returned.An error is logged to the error queue if the given path does not exist or does not represent a directory.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14814.htm"])
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
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Set rootDirectory to be the USB port.
--- --Set entries as the variable for the file system entries in rootDirectory.
--- --Return the number of files and directories in the directory.
--- ```
---@return any files A table containing the names of all the file system entries in the specified directory
---@param path string The directory path
function fs.readdir(path) end


--- **This function removes a directory from the file system.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This path may be absolute or relative to the present working directory.An error is logged to the error queue if the given path does not exist or does not represent a directory. An error is also logged if the directory is not empty.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14815.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- rootDirectory = "/usb1/"
--- tempDirectoryName = "temp"
--- if fs.is_dir(rootDirectory..tempDirectoryName) == false then
---     fs.mkdir(rootDirectory..tempDirectoryName)
--- end
--- fs.rmdir(rootDirectory..tempDirectoryName)
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Set rootDirectory to be the USB port.
--- --Set tempDirectoryName to be equivalent to temp.
--- --Check to see if tempDirectoryName exists.
--- --If it does not exist, create a directory named temp.
--- --Remove the directory.
--- ```
---@param path string The path of the directory to remove
function fs.rmdir(path) end


--- **Tests whether the specified path refers to a file (as opposed to a directory).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file system path may be absolute or relative to the current working system path.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14824.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- rootDirectory = "/usb1/"
--- print("Is file: ", fs.is_file(rootDirectory))
--- 
--- --Insert a USB flash drive into the front panel of the instrument.
--- --Set rootDirectory to be the USB port.
--- --Check to see if rootDirectory is a file. Because rootDirectory was set up as a directory, the return is false.
--- ```
---@return boolean status true if the given path is a file; otherwise, false
---@param path string The path of the file system entry to test
function is_file(path) end
---@class lan
lan = {}


--- **This attribute contains the LXI domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the LXI domain number.All outgoing LXI packets are generated with this domain number. All inbound LXI packets are ignored unless they have this domain number.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/14893.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.lxidomain)
--- 
--- --Displays the LXI domain.
--- ```
lan.lxidomain = 0

---@class nodeArr
nodeArr = {}

---@type nodeArr[]
node = {}


--- **This function starts test scripts on a remote TSP-Link node. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is only applicable to TSP-Link systems. You can use this command to use the remote master node to run a script on the specified node. This function does not run test scripts on the master node; only on the subordinate node when initiated by the master node.This function may only be called when the group number of the node is different than the node of the master.This function does not wait for the script to finish execution.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15009.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[2].execute(sourcecode)
--- 
--- --Runs script code on node 2. The code is in a string variable called sourcecode.
--- node[3].execute("x = 5")
--- 
--- --Runs script code in string constant ("x = 5") to set x equal to 5 on node 3.
--- node[32].execute(TestDut.source)
--- 
--- --Runs the test script stored in the variable TestDut
--- --(previously stored on the master node) on node 32.
--- ```
---@param scriptCode string A string containing the source code
function nodeArr.execute(scriptCode) end



--- **This function returns the value of a global variable. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the value of a global variable from the run-time environment of this node.Do not use this command to retrieve the value of a global variable from the local node. Instead, access the global variable directly. This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15010.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(node[5].getglobal("test_val"))
--- 
--- --Retrieves and outputs the value of the global variable named test_val from node 5.
--- ```
---@return any value The value of the variable
---@param name string The global variable name
function nodeArr.getglobal(name) end



--- **This function sets the value of a global variable. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- From a remote node, use this function to assign the given value to a global variable.Do not use this command to create or set the value of a global variable from the local node (set the global variable directly instead). This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15020.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[3].setglobal("x", 5)
--- 
--- --Sets the global variable x on node 3 to the value of 5.
--- ```
---@param name string The global variable name to set
---@param value number The value to assign to the variable
function nodeArr.setglobal(name, value) end

---@class localnode
localnode = {}


--- **This attribute stores the model number.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
--- 
--- --Outputs the model number of the local node. For example:
--- --DAQ6510 
--- ```


--- **This function sets the date and time of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Internally, the instrument bases time in UTC time. UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).When called without a parameter (the first form), the function returns the current time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25726.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.settime(2017, 12, 5, 15, 48, 20)
--- print(localnode.settime())
--- 
--- --Sets the date and time to December 5, 2017 at 3:48:20 pm and verifies the time.
--- --Output:
--- --Tue Dec  5 15:48:20 2017
--- systemTime = os.time({year = 2018,
---        month = 3,
---        day = 31,
---        hour = 14,
---        min = 25})
--- localnode.settime(systemTime)
--- print(os.date('%c', gettime()))
--- 
--- --Sets the date and time to Mar 31, 2018 at 2:25 pm.
--- --Output:
--- --Sat Mar 31 14:25:00 2018
--- ```
---@param year number Year; must be more than 1970
---@param month number Month (1 to 12)
---@param day number Day (1 to 31)
---@param hour number Hour in 24-hour time format (0 to 23)
---@param minute number Minute (0 to 59)
---@param second number Second (0 to 59)
---@overload fun()
---@overload fun(hour:number,minute:number,second:number)
---@overload fun(month:number)
---@overload fun(year:number,month:number,day:number,hour:number,minute:number,second:number)
---@overload fun()
function localnode.settime(year, month, day, hour, minute, second) end


--- **This function retrieves the instrument date and time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The time is returned in UTC time. UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32416.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(os.date('%c', gettime()))
--- 
--- --Example output:
--- --Tue Dec  5 03:44:37 2017
--- ```
function localnode.gettime() end


--- **This attribute stores the firmware version of the instrument.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This attribute indicates the version number of the firmware that is presently running in the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32595.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.version)
--- 
--- --Outputs the present version level. Example output:
--- --1.0.0a
--- ```


--- **This attribute stores the instrument's serial number.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This indicates the instrument serial number.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32597.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext(display.TEXT2, "Serial #: " ..localnode.serialno)
--- display.changescreen(display.SCREEN_USER_SWIPE)
--- 
--- --Clears the instrument display.
--- --Places the serial number of this instrument on the bottom line of the USER swipe screen display. Displays the USER swipe screen.
--- ```


--- **This attribute contains the power line frequency setting that is used for NPLC calculations.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The instrument automatically detects the power line frequency when the instrument is powered on. Power line frequency can be 50 Hz, 60 Hz, or 400 Hz. If the line frequency is 400 Hz, 50 is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32628.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- frequency = localnode.linefreq
--- print(frequency)
--- 
--- --Reads the line frequency setting.
--- ```

localnode.ACCESS_FULLA = nil
localnode.ACCESS_EXCLUSIVEA = nil
localnode.ACCESS_PROTECTEDA = nil
localnode.ACCESS_LOCKOUT = nil

---@alias localnodeaccessaccessType
---|`localnode.ACCESS_FULLA`
---|`localnode.ACCESS_EXCLUSIVEA`
---|`localnode.ACCESS_PROTECTEDA`
---|`localnode.ACCESS_LOCKOUT`



--- **This attribute contains the type of access users have to the instrument through different interfaces.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When access is set to full, the instrument accepts commands from any interface with no login or password.When access is set to exclusive, you must log out of one remote interface and log into another one to change interfaces. You do not need a password with this access.Protected access is similar to exclusive access, except that you must enter a password when logging in.When the access is set to locked out, a password is required to change interfaces, including the front-panel interface.Under any access type, if a script is running on one remote interface when a command comes in from another remote interface, the command is ignored and the message "FAILURE: A script is running, use ABORT to stop it" is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33140.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.access = localnode.ACCESS_LOCKOUT
--- login admin
--- logout
--- 
--- --Set the instrument access to locked out.
--- --Log into the interface using the default password.
--- --Log out of the interface.
--- ```
---@type localnodeaccessaccessType
localnode.access = 0

---@class tsplink
tsplink = {}


--- **This attribute contains the group number of a TSP-Link node. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To remove the node from all groups, set the attribute value to 0.When the node is turned off, the group number for that node changes to 0.The master node can be assigned to any group. You can also include other nodes in the group that includes the master. Note that any nodes that are set to 0 are automatically included in the group that contains the master node, regardless of the group that is assigned to the master node.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15285.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.group = 3
--- 
--- --Assign the instrument to TSP-Link group number 3.
--- ```
tsplink.group = 0



--- **This attribute defines the node number. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the TSP-Link node number and saves the value in nonvolatile memory.Changes to the node number do not take effect until tsplink.reset() from an earlier TSP-Link instrument or tsplink.initialize() is executed on any node in the system.Each node connected to the TSP-Link system must be assigned a different node number.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15287.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.node = 3
--- 
--- --Sets the TSP-Link node for this instrument to number 3.
--- ```
tsplink.node = 0



--- **This function reads the TSP-Link trigger lines as a digital I/O port. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the input pattern on the I/O port. The least significant bit of the binary number corresponds to line 1 and the value of bit 3 corresponds to line 3. For example, a returned value of 2 has a binary equivalent of 010. This indicates that line 2 is high (1), and that the other two lines are low (0).
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15289.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = tsplink.readport()
--- print(data)
--- 
--- --Reads state of all three TSP-Link lines.
--- --Assuming line 2 is set high, the output is:
--- --2.000000e+00
--- --(binary 010)
--- --The format of the output may vary depending on the ASCII precision setting.
--- ```
---@return number data Numeric value that indicates which lines are set
function tsplink.readport() end


--- **This attribute describes the TSP-Link online state. **
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When the instrument power is first turned on, the state is offline. After tsplink.initialize() or tsplink.reset() is successful, the state is online.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15291.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state = tsplink.state
--- print(state)
--- 
--- --Read the state of the TSP-Link system. If it is online, the output is:
--- --online
--- ```


--- **This function writes to all TSP-Link synchronization lines as a digital I/O port. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern that is written to the I/O port. For example, a data value of 2 has a binary equivalent of 010. Line 2 is set high (1), and the other two lines are set low (0).The reset() function does not affect the present states of the trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15302.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
--- 
--- --Sets the synchronization lines 1 and 2 high (binary 011).
--- ```
---@param data number Value to write to the port (0 to 7)
function tsplink.writeport(data) end


--- **This attribute reads the node number assigned to the master node.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This attribute returns the node number of the master in a set of instruments connected using TSP-Link.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32565.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- LinkMaster = tsplink.master
--- 
--- --Store the TSP-Link master node number in a variable called LinkMaster.
--- ```


--- **This function defines a trigger model block that clears the reading buffer.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When trigger model execution reaches the buffer clear trigger block, the instrument empties the specified reading buffer. The specified buffer can be the default buffer or a buffer that you defined.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30574.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(3, trigger.BLOCK_BUFFER_CLEAR, capTest2)
--- 
--- --Assign trigger block 3 to buffer clear; when the trigger model reaches block 3, it clears the reading buffer named capTest2.
--- ```
--- Additional paramteres are:
--- - *bufferName*: The name of the buffer, which must be an existing buffer; if no buffer is defined, defbuffer1 is used<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_BUFFER_CLEAR)
trigger.BLOCK_BUFFER_CLEAR = 0


trigger.COUNT_INFINITES = nil
trigger.COUNT_STOPU = nil
trigger.COUNT_AUTO = nil

---@alias triggermodelsetblocktriggerBLOCK_MEASURE_DIGITIZEcount
---|`trigger.COUNT_INFINITES`
---|`trigger.COUNT_STOPU`
---|`trigger.COUNT_AUTO`



--- **This function defines a trigger block that makes or digitizes a measurement.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When you set the count to auto, the trigger model uses the count value that is active for the selected function instead of a specific value. You can use this with configuration lists to change the count value each time a measure/digitize block is encountered.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31094.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- trigger.model.setblock(1, trigger.BLOCK_BUFFER_CLEAR, defbuffer1)
--- trigger.model.setblock(2, trigger.BLOCK_DELAY_CONSTANT, 0)
--- trigger.model.setblock(3, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_INFINITE)
--- trigger.model.setblock(4, trigger.BLOCK_WAIT, trigger.EVENT_DISPLAY)
--- trigger.model.setblock(5, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_STOP)
--- trigger.model.setblock(6, trigger.BLOCK_NOTIFY, trigger.EVENT_NOTIFY1)
--- trigger.model.initiate()
--- waitcomplete()
--- print(defbuffer1.n)
--- 
--- --Reset the instrument.
--- --Set the function to measure DC voltage.
--- --Set block 1 to clear defbuffer1.
--- --Set block 2 to set a delay of 0.
--- --Set block 3 to make measurements infinitely.
--- --Set block 4 to wait until the front-panel TRIGGER key is pressed.
--- --Set block 5 to stop making measurements.
--- --Set block 6 to send a notification.
--- --Start the trigger model.
--- --You must press the front-panel TRIGGER key to stop measurements.
--- --Output the number of readings.
--- reset()
--- dmm.measure.configlist.create("countactive")
--- dmm.measure.count = 2
--- dmm.measure.configlist.store("countactive")  -- index1
--- dmm.measure.count = 10
--- dmm.measure.configlist.store("countactive")  -- index2
--- dmm.measure.count = 3
--- dmm.measure.configlist.store("countactive")  -- index3
---  
--- trigger.model.setblock(1, trigger.BLOCK_CONFIG_NEXT, "countactive")
--- trigger.model.setblock(2, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_AUTO)
--- trigger.model.setblock(3, trigger.BLOCK_DELAY_CONSTANT, 1)
--- trigger.model.setblock(4, trigger.BLOCK_BRANCH_COUNTER, 3, 1)
--- trigger.model.initiate()
--- waitcomplete()
--- print(defbuffer1.n)
--- 
--- --Reset the instrument.
--- --Set up a configuration list named countactive.
--- --Set the measure count to 2 (replace dmm.measure.count with dmm.digitize.count if using a digitize function.)
--- --Store the count in index 1.
--- --Set the measure count to 10.
--- --Store the count in index 2.
--- --Set the measure count to 3.
--- --Store the count in index 3.
--- --Set up trigger model block 1 to call the next index from the countactive configuration list.
--- --Set block 2 to measure or digitize and store the readings in defbuffer1, using the most recent count value.
--- --Set block 3 to add a delay of 1 s.
--- --Set block 4 to iterate through the trigger model 3 times, returning to block 1.
--- --Start the trigger model.
--- --Output the number of readings. There should be 15 readings.
--- ```
--- Additional paramteres are:
--- - *bufferName*: The name of the buffer, which must be an existing buffer; if no buffer is defined, defbuffer1 is used<br>
--- - *count*: The number of measure or digitize readings to make before moving to the next block in the trigger model; set to<br>
---    ```trigger.COUNT_INFINITES```<br>
---    ```trigger.COUNT_STOPU```<br>
---    ```trigger.COUNT_AUTO```<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_MEASURE_DIGITIZE)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_MEASURE_DIGITIZE, bufferName)
trigger.BLOCK_MEASURE_DIGITIZE = 0



--- **This function recalls the system settings that are stored in a configuration list.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When the trigger model reaches a configuration recall block, the settings in the specified configuration list are recalled.You can restore a specific set of configuration settings in the configuration list by defining the index.The configuration list must be defined before you can use this block. If the configuration list changes, verify that the trigger model count is still accurate.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31096.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(3, trigger.BLOCK_CONFIG_RECALL, "measTrigList", 5)
--- 
--- --Configure trigger block 3 to load index 5 from the configuration list named measTrigList.
--- ```
--- Additional paramteres are:
--- - *configurationList*: A string that defines the configuration list to recall<br>
--- - *index*: The index in the configuration list to recall; default is 1<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_CONFIG_RECALL, configurationList)
trigger.BLOCK_CONFIG_RECALL = 0



--- **This function recalls the settings at the next index of a configuration list.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31097.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(5, trigger.BLOCK_CONFIG_NEXT, "measTrigList")
--- 
--- --Configure trigger block 5 to load the next index in the configuration list named measTrigList.
--- ```
--- Additional paramteres are:
--- - *configurationList*: A string that defines the configuration list to recall<br>
trigger.BLOCK_CONFIG_NEXT = 0



--- **This function defines a trigger model block that recalls the settings stored at the previous index in a configuration list.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The Config List Prev block defines a trigger model block that recalls the settings stored at the previous index in a configuration list.The configuration list previous index trigger block type recalls the previous index in a configuration list. It configures the settings of the instrument based on the settings at that index. The trigger model executes the settings at that index before the next block is executed.The first time the trigger model encounters this block, the last index in the configuration list is recalled. Each subsequent time trigger model execution reaches a configuration list previous block for this configuration list, it goes backward one index. When the first index in the list is reached, it goes to the last index in the configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31098.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(8, trigger.BLOCK_CONFIG_PREV, "measTrigList")
--- 
--- --Configure trigger block 8 to load the previous index in the configuration list named measTrigList.
--- ```
--- Additional paramteres are:
--- - *configurationList*: A string that defines the configuration list to recall<br>
trigger.BLOCK_CONFIG_PREV = 0



--- **This function adds a user delay to the execution of the trigger model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- Each measure function can have up to five unique user delay times (M1 to M5). Digitize user delays are handled as measure user delays, so you can have a total of five measure and digitize user delays. The delay time is set by the user-delay command, which is only available over a remote interface. Though the trigger model can be used with any function, the user delay is set per function. Make sure you are setting the delay for the function you intend to use with the trigger model. The measure user-delay settings are used with measure functions; the digitize user-delay functions are used with digitize functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31101.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("Empty")
--- dmm.measure.userdelay[1] = 5
--- trigger.model.setblock(1, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M1)
--- trigger.model.setblock(2, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(3, trigger.BLOCK_BRANCH_COUNTER, 10, 1)
--- trigger.model.initiate()
--- 
--- --Set user delay 1 for measurements to 5 s.
--- --Set trigger block 1 to a dynamic delay that calls user delay 1.
--- --Set trigger block 2 to make or digitize a measurement.
--- --Set trigger block 3 to branch to block 1 ten times.
--- --Start the trigger model.
--- ```
--- Additional paramteres are:
--- - *n*: The number of the user delay, 1 to 5, set by dmm.measure.userdelay[N] or dmm.digitize.userdelay[N]<br>
trigger.BLOCK_DELAY_DYNAMIC = 0



--- **This function defines a trigger model block that sets the lines on the digital I/O port high or low.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The bit mask defines the bits in the pattern that are driven high or low. A binary 1 in the bit mask indicates that the corresponding I/O line should be driven according to the bit pattern. To drive all lines, specify all ones (63, 0x3F, 0b111111) or omit this parameter. If the bit for a line in the bit pattern is set to 1, the line is driven high. If the bit is set to 0 in the bit pattern, the line is driven low.For this block to work as expected, make sure you configure the trigger type and line state of the digital line for use with the trigger model (use the digital line mode command).
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31102.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for x = 3, 6 do digio.line[x].mode = digio.MODE_DIGITAL_OUT end
--- trigger.model.setblock(4, trigger.BLOCK_DIGITAL_IO, 20, 60)
--- 
--- --The for loop configures digital I./O lines 3 through 6 as digital outputs. Trigger block 4 is then configured with a bit pattern of 20 (digital I/O lines 3 and 5 high). The optional bit mask is specified as 60 (lines 3 through 6), so both lines 3 and 5 are driven high.
--- ```
--- Additional paramteres are:
--- - *bitPattern*: Sets the value that specifies the output line bit pattern (0 to 63)<br>
--- - *bitMask*: Specifies the bit mask; if omitted, all lines are driven (0 to 63)<br>
trigger.BLOCK_DIGITAL_IO = 0



--- **This function defines a trigger model block that branches to a specified block a specified number of times.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command defines a trigger model building block that branches to another block using a counter to iterate a specified number of times.Counters increment every time the trigger model reaches them until they are more than or equal to the count value. At that point, the trigger model continues to the next building block in the sequence.The counter is reset to 0 when the trigger model starts. It is incremented each time trigger model execution reaches the counter block.If you are using remote commands, you can query the counter. The counter is incremented immediately before the branch compares the actual counter value to the set counter value. Therefore, the counter is at 0 until the first comparison. When the trigger model reaches the set counter value, branching stops and the counter value is one greater than the setting. Use trigger.model.getbranchcount() to query the counter.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31103.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(4, trigger.BLOCK_BRANCH_COUNTER, 10, 2)
--- print(trigger.model.getbranchcount(4))
--- 
--- --When the trigger model reaches this block, the trigger model returns to block 2. This repeats 10 times.
--- --An example of the return if the trigger model has reached this block 5 times is:
--- --5
--- ```
--- Additional paramteres are:
--- - *targetCount*: The number of times to repeat<br>
--- - *branchToBlock*: The block number of the trigger model block to execute when the counter is less than the targetCount value<br>
trigger.BLOCK_BRANCH_COUNTER = 0


trigger.LIMIT_ABOVE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_INSIDE = nil
trigger.LIMIT_OUTSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_CONSTANTlimitType
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_INSIDE`
---|`trigger.LIMIT_OUTSIDE`


trigger.LIMIT_ABOVE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_INSIDE = nil
trigger.LIMIT_OUTSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_CONSTANTlimitA
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_INSIDE`
---|`trigger.LIMIT_OUTSIDE`


trigger.LIMIT_ABOVE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_INSIDE = nil
trigger.LIMIT_OUTSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_CONSTANTlimitB
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_INSIDE`
---|`trigger.LIMIT_OUTSIDE`



--- **This function defines a trigger model block that goes to a specified block if a measurement meets preset criteria.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The type of limit can be:The measurement block must be a measure/digitize block that occurs in the trigger model before the branch-on-constant-limits block. The last measurement from a measure/digitize block is used.If the limit A is more than the limit B, the values are automatically swapped so that the lesser value is used as the lower limit.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31105.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_LIMIT_CONSTANT, trigger.LIMIT_ABOVE, 0.1, 1, 2)
--- 
--- --Sets trigger block 5 to be a constant limit that branches to block 2 when the measurement is above the value set for limit B (which is set to 1). Note that limit A must be set but is ignored. 
--- ```
--- Additional paramteres are:
--- - *limitType*: The type of limit, which can be one of the following types<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_INSIDE```<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
--- - *limitA*: The lower limit that the measurement is tested against; if limitType is set to<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_INSIDE```<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
--- - *limitB*: The upper limit that the measurement is tested against; if limitType is set to<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_INSIDE```<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
--- - *branchToBlock*: The block number of the trigger model block to execute when the measurement meets the defined criteria<br>
--- - *measureBlock*: The block number of the measure/digitize block that makes the measurements to be compared; if this is 0 or undefined, the trigger model uses the previous measure/digitize block<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_BRANCH_LIMIT_CONSTANT, limitType, limitA, limitB, branchToBlock)
trigger.BLOCK_BRANCH_LIMIT_CONSTANT = 0



--- **This function defines a trigger model block that goes to a specified block if the difference of two measurements meets preset criteria.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This block calculates the difference between the last two measurements from a measure/digitize block. It subtracts the most recent measurement from the previous measurement.The difference between the measurements is compared to the target difference. If the difference is less than the target difference, the trigger model goes to the specified branching block. If the difference is more than the target difference, the trigger model proceeds to the next block in the trigger block sequence.If you do not define the measure/digitize block, it will compare measurements of a measure/digitize block that precedes the branch delta block. For example, if you have a measure/digitize block, a wait block, another measure/digitize block, another wait block, and then the branch delta block, the delta block compares the measurements from the second measure/digitize block. If a preceding measure/digitize block does not exist, an error occurs.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_DELTA, 0.35, 8, 3)
--- 
--- --Configure trigger block 5 to branch to block 8 when the measurement difference from block 3 is less than 0.35.
--- ```
--- Additional paramteres are:
--- - *targetDifference*: The value against which the block compares the difference between the measurements<br>
--- - *branchToBlock*: The block number of the trigger model block to execute when the difference between the measurements is less than or equal to the targetDifference<br>
--- - *measureBlock*: The block number of the measure/digitize block that makes the measurements to be compared; if this is 0 or undefined, the trigger model uses the previous measure/digitize block<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_BRANCH_DELTA, targetDifference, branchToBlock)
trigger.BLOCK_BRANCH_DELTA = 0



--- **This function causes the trigger model to branch to a specified building block the first time it is encountered in the trigger model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The branch-once building block branches to a specified block the first time trigger model execution encounters the branch-once block. If it is encountered again, the trigger model ignores the block and continues in the normal sequence.The once block is reset when trigger model execution reaches the idle state. Therefore, the branch-once block always executes the first time the trigger model execution encounters this block.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31108.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(2, trigger.BLOCK_BRANCH_ONCE, 4)
--- 
--- --When the trigger model reaches block 2, the trigger model goes to block 4 instead of going in the default sequence of block 3.
--- ```
--- Additional paramteres are:
--- - *branchToBlock*: The block number of the trigger model block to execute when the trigger model first encounters this block<br>
trigger.BLOCK_BRANCH_ONCE = 0



--- **This function defines a trigger model block that causes the trigger model to go to a specified building block every time the trigger model encounters it, except for the first time.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The branch-once-excluded block is ignored the first time the trigger model encounters it. After the first encounter, the trigger model goes to the specified branching block.The branch-once-excluded block is reset when the trigger model starts or is placed in idle.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(2, trigger.BLOCK_BRANCH_ONCE_EXCLUDED, 4)
--- 
--- --When the trigger model reaches block 2 the first time, the trigger model goes to block 3. If the trigger model reaches this block again, the trigger model goes to block 4.
--- ```
--- Additional paramteres are:
--- - *branchToBlock*: The block number of the trigger model block to execute when the trigger model encounters this block after the first encounter<br>
trigger.BLOCK_BRANCH_ONCE_EXCLUDED = 0



--- **This function defines a trigger model block that generates a trigger event and immediately continues to the next block.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31110.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[3].mode = digio.MODE_TRIGGER_OUT
--- trigger.model.setblock(5, trigger.BLOCK_NOTIFY, trigger.EVENT_NOTIFY2)
--- trigger.digout[3].stimulus = trigger.EVENT_NOTIFY2
--- 
--- --Define trigger model block 5 to be the notify 2 event. Assign the notify 2 event to be the stimulus for digital output line 3.
--- ```
--- Additional paramteres are:
--- - *N*: The identification number of the notification; 1 to 8<br>
trigger.BLOCK_NOTIFY = 0



--- **This function defines a trigger model block that always goes to a specific block.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When the trigger model reaches a branch-always building block, it goes to the building block set by branchToBlock.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31112.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(6, trigger.BLOCK_BRANCH_ALWAYS, 20)
--- 
--- --When the trigger model reaches block 6, always branch to block 20.
--- ```
--- Additional paramteres are:
--- - *branchToBlock*: The block number to execute when the trigger model reaches the Branch Always block<br>
trigger.BLOCK_BRANCH_ALWAYS = 0


trigger.LIMIT_ABOVE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_INSIDE = nil
trigger.LIMIT_OUTSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_DYNAMIClimitType
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_INSIDE`
---|`trigger.LIMIT_OUTSIDE`



--- **This function defines a trigger model block that goes to a specified block in the trigger model if a measurement meets user-defined criteria.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The measure/digitize block must occur in the trigger model before the branch-on-dynamic-limits block. If no block is defined, the measurement from the previous measure/digitize block is used. If no previous measure/digitize block exists, an error is reported.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31114.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(7, trigger.BLOCK_BRANCH_LIMIT_DYNAMIC, trigger.LIMIT_OUTSIDE, 2, 10, 5)
--- 
--- --Configure block 7 to check if limit 2 is outside its limit values, based on the measurements made in block 5. If values are outside the measurements, branch to block 10. If the values are not outside the measurements, trigger model execution continues to block 8.
--- ```
--- Additional paramteres are:
--- - *limitType*: The type of limit, which can be one of the following types<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_INSIDE```<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
--- - *limitNumber*: The limit number (1 or 2)<br>
--- - *branchToBlock*: The block number of the trigger model block to execute when the measurement meets the criteria set in the configuration list<br>
--- - *measureBlock*: The block number of the measure/digitize block that makes the measurements to be compared; if this is 0 or undefined, the trigger model uses the previous measure/digitize block<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_BRANCH_LIMIT_DYNAMIC, limitType, limitNumber, branchToBlock)
trigger.BLOCK_BRANCH_LIMIT_DYNAMIC = 0



--- **This function adds a constant delay to the execution of a trigger model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When trigger model execution reaches a delay block, it stops normal measurement and trigger model operation for the time set by the delay. Background measurements continue to be made, and if any previously executed block started infinite measurements, they also continue to be made.If other delays have been set, this delay is in addition to the other delays.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31347.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(7, trigger.BLOCK_DELAY_CONSTANT, 30e-3)
--- 
--- --Configure trigger block 7 to delay the trigger model before the next block until a delay of 30 ms elapses.
--- ```
--- Additional paramteres are:
--- - *time*: The amount of time to delay in seconds (167 ns to 10 ks, or 0 for no delay)<br>
trigger.BLOCK_DELAY_CONSTANT = 0


trigger.LOG_INFON = nil
trigger.LOG_WARNN = nil
trigger.LOG_ERRORNW = nil
trigger.LOG_WARN_ABORT = nil

---@alias triggermodelsetblocktriggerBLOCK_LOG_EVENTeventNumber
---|`trigger.LOG_INFON`
---|`trigger.LOG_WARNN`
---|`trigger.LOG_ERRORNW`
---|`trigger.LOG_WARN_ABORT`



--- **This function allows you to log an event in the event log when the trigger model is running.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- Note that using this block too often in a trigger model could overflow the event log. It may also take away from the time needed to process more critical trigger model blocks.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35428.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(9, trigger.BLOCK_LOG_EVENT, trigger.LOG_INFO2, "Trigger model complete.")
--- 
--- --Set trigger model block 9 to log an event when the trigger model completes. In the event log, the message is:
--- --TM #1 block #9 logged: Trigger model complete.
--- ```
--- Additional paramteres are:
--- - *eventNumber*: The event number<br>
---    ```trigger.LOG_INFON```<br>
---    ```trigger.LOG_WARNN```<br>
---    ```trigger.LOG_ERRORNW```<br>
---    ```trigger.LOG_WARN_ABORT```<br>
--- - *message*: A string up to 31 characters<br>
trigger.BLOCK_LOG_EVENT = 0



--- **This function creates a placeholder that performs no action in the trigger model; available only using remote commands.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If you remove a trigger model block, you can use this block as a placeholder for the block number so that you do not need to renumber the other blocks.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35431.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(4, trigger.BLOCK_NOP)
--- 
--- --Set block number 4 to be a no operation block.
--- ```
--- Additional paramteres are:
trigger.BLOCK_NOP = 0



--- **This function creates a block in the trigger model that resets a branch counter to 0.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When the trigger model reaches the Counter Reset block, it resets the count of the specified Branch on Counter block to zero.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41689.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("Empty")
--- trigger.model.setblock(1, trigger.BLOCK_BUFFER_CLEAR)
--- trigger.model.setblock(2, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(3, trigger.BLOCK_BRANCH_COUNTER, 5, 2)
--- trigger.model.setblock(4, trigger.BLOCK_DELAY_CONSTANT, 1)
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_COUNTER, 3, 2)
--- trigger.model.setblock(6, trigger.BLOCK_RESET_BRANCH_COUNT, 3)
--- trigger.model.initiate()
--- waitcomplete()
--- print(defbuffer1.n)
--- 
--- --Reset trigger model settings.
--- --Clear defbuffer1 at the beginning of the trigger model.
--- --Loop and take 5 readings.
--- --Delay a second.
--- --Loop three more times back to block 2.
--- --Reset block 3 to 0.
--- --Start the trigger model and wait for measurements to complete.
--- --Print the number of readings in the buffer.
--- --Output:
--- --15
--- ```
--- Additional paramteres are:
--- - *counter*: The block number of the counter that is to be reset<br>
trigger.BLOCK_RESET_BRANCH_COUNT = 0


trigger.CLEAR_ENTERT = nil
trigger.CLEAR_NEVER = nil

---@alias triggermodelsetblocktriggerBLOCK_WAITclear
---|`trigger.CLEAR_ENTERT`
---|`trigger.CLEAR_NEVER`


trigger.WAIT_ANDI = nil
trigger.WAIT_OR = nil

---@alias triggermodelsetblocktriggerBLOCK_WAITlogic
---|`trigger.WAIT_ANDI`
---|`trigger.WAIT_OR`



--- **This function defines a trigger model block that waits for an event before allowing the trigger model to continue.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- You can use the wait block to synchronize measurements with other instruments and devices.You can set the instrument to wait for the events shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/75110.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(9, trigger.BLOCK_WAIT, trigger.EVENT_DISPLAY)
--- 
--- --Set trigger model block 9 to wait for a user to press the TRIGGER key on the front panel before continuing.
--- ```
--- Additional paramteres are:
--- - *event*: The event that must occur before the trigger block allows trigger execution to continue (see Details)<br>
--- - *clear*: To clear previously detected trigger events when entering the wait block<br>
---    ```trigger.CLEAR_ENTERT```<br>
---    ```trigger.CLEAR_NEVER```<br>
--- - *logic*: If each event must occur before the trigger model continues<br>
---    ```trigger.WAIT_ANDI```<br>
---    ```trigger.WAIT_OR```<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_WAIT, event)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_WAIT, event, clear)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_WAIT, event, clear, logic, event)
trigger.BLOCK_WAIT = 0



--- **This function branches to a specified block when a specified trigger event occurs.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If you are using a timer, it must be started before it can expire. One method to start the timer in the trigger model is to include a Notify block before the On Event block. Set the Notify block to use the same timer as the On Event block.The following table shows the constants for the events.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/75112.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(6, trigger.BLOCK_BRANCH_ON_EVENT, trigger.EVENT_DISPLAY, 2)
--- 
--- --When the trigger model reaches this block, if the front-panel TRIGGER key has been pressed, the trigger model returns to block 2. If the TRIGGER key has not been pressed, the trigger model continues to block 7 (the next block in the trigger model).
--- ```
--- Additional paramteres are:
--- - *event*: The event that must occur before the trigger model branches the specified block<br>
--- - *branchToBlock*: The block number of the trigger model block to execute when the specified event occurs<br>
trigger.BLOCK_BRANCH_ON_EVENT = 0


trigger.CONT_OFFS = nil
trigger.CONT_AUTOP = nil
trigger.CONT_RESTART = nil

---@alias triggercontinuoussetting
---|`trigger.CONT_OFFS`
---|`trigger.CONT_AUTOP`
---|`trigger.CONT_RESTART`



--- **This attribute determines the trigger mode setting after bootup.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Conditions must be valid before continuous measurements can start.When the restart parameter is selected, the instrument is placed in local mode, aborts any running scripts, and aborts any trigger models that are running. If the command is in a script, it is the last command that runs before the script is aborted. The restart parameter is not stored in nonvolatile memory, so it does not affect start up behavior.The off and automatic parameters are stored in nonvolatile memory, so they affect start up behavior.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/88463.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.continuous = trigger.CONT_OFF
--- 
--- --When the instrument starts up, the measurement method is set to idle.
--- ```
---@type triggercontinuoussetting
trigger.continuous = 0

---@class dmm
dmm = {}


--- **This function resets commands that begin with dmm. to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35753.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.reset()
--- 
--- --Resets the DMM commands to their default settings.
--- ```
function dmm.reset() end

dmm.TERMINALS_FRONTU = nil
dmm.TERMINALS_REAR = nil

---@alias dmmterminalsterminals
---|`dmm.TERMINALS_FRONTU`
---|`dmm.TERMINALS_REAR`



--- **This attribute describes which set of input and output terminals the instrument is using.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- You must use the front-panel TERMINALS switch to change which set of terminals the instrument reads.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41309.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.terminals)
--- 
--- --Request information on which terminals are used.
--- --Output if the instrument is using the front terminals:
--- --dmm.TERMINALS_FRONT
--- ```
---@class scan
scan = {}


--- **This function writes a specified value to a channel at the added step in the scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is similar to issuing channel.write() at the scan step. Specifying multiple channels in channelList causes multiple steps to be added to the scan. Allows you to write the DAC or digital I/O in a scan.For DAC channels, if the channel mode is changed after the scan is created, the scan is rebuilt. If the write value is no longer compatible with the new mode, an error is generated and the scan becomes invalid.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16242.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.addwrite("124", 2)
--- 
--- --Assume a 7706 in slot 1.
--- --Add a write step to DAC channel 24 to output 2 V.
--- ```
---@param channelList string String specifying channels to add using normal channel list syntax
---@param writeValue number The value to write to the channel for this scan step
function scan.addwrite(channelList, writeValue) end

scan.EMPTY = nil
scan.BUILDING = nil
scan.RUNNING = nil
scan.STEPPING = nil
scan.ABORTED = nil
scan.PAUSED = nil
scan.FAILED = nil
scan.SUCCESS = nil

---@alias scanstatescanState
---|`scan.EMPTY`
---|`scan.BUILDING`
---|`scan.RUNNING`
---|`scan.STEPPING`
---|`scan.ABORTED`
---|`scan.PAUSED`
---|`scan.FAILED`
---|`scan.SUCCESS`



--- **This function provides the present state of a running background scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the state of the present scan, the scan count, and the step count.The scan count is the number of the present iteration through the scan portion of the trigger model. This number does not increment until the scan begins. Therefore, if the instrument is waiting for an input to trigger a scan start, the scan count represents the previous number of scan iterations. If no scan has begun, the scan count is zero.The step count is the number of times the scan has completed a pass through the channel action portion of the trigger model. This number does not increment until after the action completes. Therefore, if the instrument is waiting for an input to trigger a channel action, the step count represents the previous step. If no step has yet completed, the step count is zero. If the step count has yet to complete the first step in a subsequent pass through a scan, the scan count represents the last step in the previous scan pass.The information from the scan state command may be delayed up to 100 ms from the actual state of the scan because of system resources used by the scan.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16254.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.initiate()
--- scanState, scanCount, stepCount = scan.state()
--- print(scanState, scanCount, stepCount)
--- 
--- --Runs a scan in the background.
--- --Check the present scan state.
--- --View returned values.
--- --Output shows that scan is running:
--- --scan.RUNNING, 1, 2
--- -- 
--- ```
---@return scanstatescanState scanState The present state of the scan running in the background. Possible states include
---@return number scanCount The number of scans that have completed
---@return number stepCount The number of steps that have completed
function scan.state() end


--- **This attribute returns the number of steps in the present scan.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This is set by the number of steps in the active scan list.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16255.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(scan.stepcount)
--- 
--- --Responds with the present step count.
--- --Output assuming there are five steps in the scan list:
--- --5
--- -- 
--- ```

scan.OFFE = nil
scan.ON = nil

---@alias scanbypassbypass
---|`scan.OFFE`
---|`scan.ON`



--- **This attribute indicates whether the first channel of the scan waits for the channel stimulus event to be satisfied before closing.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When bypass is set to on and the channel stimulus for the scan is set to wait for a stimulus, the first channel of the scan closes when the scan starts (the stimulus setting is ignored).For other channels, the channel stimulus must be satisfied before the channel action takes place.When bypass is set to off, every channel (including the first) must satisfy the channel stimulus setting before the channel action occurs for that step.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16973.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.bypass = scan.ON
--- print(scan.bypass)
--- 
--- --Enables the bypass option for scanning and displays the present bypass state.
--- --Output:
--- --scan.ON
--- ```
---@type scanbypassbypass
scan.bypass = 0


scan.COUNT_INFINITE = 0

---@alias scanscancountscanCount
---|`scan.COUNT_INFINITE`



--- **This attribute sets the number of times the scan is repeated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The scan count attribute setting indicates how many times the scan list is iterated through before the scan completes.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16974.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("101:109")
--- scan.scancount = 100
--- scan.scaninterval = 1.0 -- delay between scans
--- 
--- --Create a scan that includes channels 1 to 9 of slot 1.
--- --Set the scan count to 100.
--- --Set the delay between scans to 1 s.
--- ```
---@type scanscancountscanCount
scan.scancount = 0



--- **This function allows you to include multiple channels in a single scan step.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command adds a list of channels to be closed simultaneously in a single step of a scan.If you need to make measurements using multiple functions on these channels, you can use the configuration list parameter to call the function settings. The configuration list must be created before calling it in this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72434.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("101:104")
--- scan.addsinglestep("109, 106, 103")
--- scan.add("107")
--- print(scan.list())
--- 
--- --Replaces the existing scan list with a scan list that scans channels 1 to 4 on slot 1.
--- --Adds channels 9, 6, and 3 to the end of the scan list, to be scanned in that order.
--- --Adds channel 7 to the end of the scan list.
--- --The scan list returns:
--- --INIT:   OPEN: 101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,125,124,123       CLOSE:
--- --1:      OPEN:   CLOSE: 101      None
--- --2:      OPEN: 101       CLOSE: 102      None
--- --3:      OPEN: 102       CLOSE: 103      None
--- --4:      OPEN: 103       CLOSE: 104      None
--- --5:      OPEN: 104       CLOSE: 109,106,103      None
--- --6:      OPEN: 109,106,103       CLOSE: 107      None
--- ```
---@param channelList string List of channels to add, in the order in which they should occur in the scan
---@param configList string A string that defines the configuration list to recall
---@param index number The index in the configuration list to recall; default is 1
---@overload fun(channelList:string)
---@overload fun(channelList:string,configList:string)
function scan.addsinglestep(channelList, configList, index) end

scan.ON = nil
scan.OFF = nil

---@alias scanrestartstate
---|`scan.ON`
---|`scan.OFF`



--- **This function causes a scan to automatically restart if it was interrupted by a power failure.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If the restart option is enabled, the scan settings are saved in memory immediately after the scan is triggered and before the scan operation begins. All scan settings, including watched channels, need to be set before the scan starts. Any changes that are made after the scan starts are not recalled if power is lost and the scan needs to restart.If the restart option is enabled and power is lost, the scan restarts when power is restored. The scan setup that was in place when the scan started becomes the power-up setup. It takes precedence over any other power-up setup. If the scan completes successfully, the scan setup is removed as the power-up setup.If the DAQ6510 detects that a card was changed during the power-up sequence, restart is set to off, the interrupted scan is not resumed, and an event is generated. The instrument starts up normally.When a scan is automatically restarted, it is logged in the event log.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72474.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.restart = scan.ON
--- 
--- --Set scan to restart when power to the instrument is restored.
--- ```
---@type scanrestartstate
scan.restart = 0



--- **This attribute specifies the interval time between scan starts when the scan count is more than one.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If the scan interval is less than the time the scan takes to run, the next scan starts immediately when the first scan finishes.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.scaninterval = 5
--- 
--- --Sets the scan count to 5 s.
--- ```
scan.scaninterval = 0



--- **This attribute defines which buffer is used with the scan.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This selects the buffer that stores the data generated by the scan.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72544.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- channel.setdmm("101:107", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- scan.create("101:107")
--- scan.buffer = defbuffer2
--- trigger.model.initiate()
--- waitcomplete()
---  
--- if scan.buffer == defbuffer1 then
---    print("defbuffer1")
--- else if scan.buffer == defbuffer2 then
---    print("defbuffer2")
--- end
--- 
--- --Sets the buffer for the scan to defbuffer2.
--- --Verifies buffer name.
--- ```
scan.buffer = 0


scan.WRITE_AFTER_STEP = nil
scan.WRITE_AFTER_SCAN = nil
scan.WRITE_AT_END = nil
scan.WRITE_NEVER = nil

---@alias scanexportwhen
---|`scan.WRITE_AFTER_STEP`
---|`scan.WRITE_AFTER_SCAN`
---|`scan.WRITE_AT_END`
---|`scan.WRITE_NEVER`



--- **This command stores data from a scan to a file on a USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets up the instrument to export scan data. If an option to export data is selected, data is sent to a USB flash drive inserted into the USB port on the front panel of the instrument. Export files are limited to 500 MB. When data exceeds 500 MB, another file is created with _n added to the file name, where n starts at 1 and is incremented for each additional file. The file name must specify the full path (including /usb1/). If included, the file extension must be set to .csv. If no file extension is specified, .csv is added.The exported data is time-stamped.Exporting data can impact scan performance. The more often exports occur, the more the impact on performance. Therefore, exporting data at completion of each step results in the slowest performance.The DAQ6510 does not check for existing files when you save. Verify that you are using a unique name to avoid overwriting any existing CSV files on the flash drive.You can OR the buffer.COL_CHANNEL, buffer.COL_CSV_CHAN_COLS, and buffer.COL_CSV_EASY_GRAPH options with the timestamp options (buffer.COL_TIME_ABSOLUTE, buffer.COL_TIME_PARTS, buffer.COL_TIME_RAW, buffer.COL_TIME_RELATIVE, and buffer.COL_TIMESTAMP_READING).You cannot use buffer.COL_CSV_CHAN_COLS if when is set to scan.WRITE_AFTER_STEP.You cannot use buffer.COL_CSV_EASY_GRAPH if when is set to scan.WRITE_AFTER_STEP or scan.WRITE_AFTER_SCAN.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72548.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.export("/usb1/scandata", scan.WRITE_AFTER_STEP)
--- trigger.model.initiate()
--- 
--- --Set up the instrument to export data from a scan to a file named scandata at the completion of each scan step.
--- --Start the scan.
--- ```
---@param when scanexportwhen When to write the data to the file
---@param what bufferFileSaveDetails Which data to include; see Details for options
---@overload fun(when:scanexportwhen)
function scan.export(usb1filename, when, what) end


--- **This function calculates alarm limits based on the present configuration of the system.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Auto Learn runs a scan and establishes alarm limits based on the measurements from the scan. Make sure your system is in a stable state before running Auto Learn.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73677.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("101:105")
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- scan.learnlimits(1, 5)
--- print(channel.getdmm("101:105", dmm.ATTR_MEAS_LIMIT_HIGH_1))
--- print(channel.getdmm("101:105", dmm.ATTR_MEAS_LIMIT_LOW_1))
--- 
--- --Create a scan on channels 101 to 105. Set up the channels to measure DC voltage.
--- --Start the learn limits calculation, with a 1% window and 5 iterations.
--- --Output the values for limit 1 high and low.
--- ```
---@param window number Percentage of deviation from the measurement that is within limits
---@param iterations number Number of times to run the scan to set limits
---@overload fun(window:number)
function scan.learnlimits(window, iterations) end


--- **This function deletes the existing scan list and creates a new list of channels to scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The items in the channel list are scanned in the order listed.Sending this command with no parameters clears the existing scan list.Using a configuration list allows you to set multiple functions for the channels using the settings in the configuration list. The configuration list must exist before you send this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/74579.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("101:109")
--- 
--- --Replaces the active scan list with an empty scan list.
--- --Adds channels 1 through 9 on slot 1. Uses the existing DMM configuration.
--- scan.create()
---  
--- for chan = 101, 109 do
---    scan.add(tostring(chan))
--- end
--- 
--- --Replaces the active scan list with an empty scan list.
--- --Loops through channels 1 to 9, and then adds 9 channels to the scan list. The parameter (tostring(chan)) converts the channel number to a string.
--- --The scan list now has, in order, channels 1 through 9 on slot 1.
--- --Uses the existing DMM configuration.
--- reset()
--- defbuffer1.clear()
--- defbuffer1.capacity = 100
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.1)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
---  
--- scan.create("101:109")
--- scan.scancount = 10
--- scan.scaninterval = 1.0
---  
--- trigger.model.initiate()
--- waitcomplete()
---  
--- dmm.measure.read(defbuffer1)
--- printbuffer(1, defbuffer1.n, defbuffer1)
--- 
--- --Reset the instrument.
--- --Clear defbuffer1 and set it to 100 readings.
--- --Set channels 1 to 9 on slot 1 to make DC voltage measurements on the 10 V range at 0.1 PLC.
--- --Display 5.5 digits.
--- -- 
--- --Create a scan of channels 1 to 9.
--- --Set the scan count to 10.
--- --Provide a one second delay between each scan.
--- -- 
--- --Start the scan.
--- -- 
--- --Read and output the data from the scan.
--- reset()
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 1)
--- dmm.measure.configlist.create("dmm_active")
--- dmm.measure.configlist.store("dmm_active")
---  
--- dmm.measure.func = dmm.FUNC_RESISTANCE
--- dmm.measure.nplc = 0.5
--- dmm.measure.configlist.store("dmm_active")
---  
--- scan.create("101:109")
--- scan.add("101:109", "dmm_active", 2)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, defbuffer1.n, defbuffer1, defbuffer1.units)
--- 
--- --This example demonstrates how to use a configuration list to change the scan settings.
--- --Set nine channels to DC voltage with an NPLC of 1.
--- --Create a configuration list named dmm_active.
--- --Save the settings to dmm_active.
--- --Set the function to 2-wire resistance and the NPLC to 0.5.
--- --Save the settings to dmm_active.
--- --Create a scan of channels 1 to 9.
--- --Add channels 1 to 9 to the scan, using the settings in dmm_active, index 2.
--- --Start the scan and output the data.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 1)
---  
--- channel.setdmm("111:120", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_RESISTANCE)
--- channel.setdmm("111:120", dmm.ATTR_MEAS_NPLC, 1)
---  
--- scan.create("101,111,120")
--- trigger.model.initiate()
--- 
--- --This example sets DMM settings on twenty channels and then creates a scan for three of the channels.
--- ```
---@param channelList string String specifying channels to add to the new scan list
---@param configList string A string that defines the configuration list to recall
---@param index number The index in the configuration list to recall; default is 1
---@overload fun()
---@overload fun(channelList:string)
---@overload fun(channelList:string,configList:string)
function scan.create(channelList, configList, index) end


--- **This function adds channels to the scan list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to add channels to the present scan list. If the scan list does not exist, it also creates a scan list.Channels are added to the end of the present list in the order in which they are specified in the channel list.If you include a configuration list, the configuration list must exist before you send this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/74583.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("101:104")
--- scan.add("111, 110, 109")
--- scan.add("107")
--- 
--- --Replaces the existing scan list with a scan list that scans channels 1 to 4 on slot 1. Adds channels 11, 10, and 9 to the end of the scan list, to be scanned in that order.
--- --Adds channel 7 to the end of the scan list.
--- reset()
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.nplc = 10
---  
--- dmm.measure.configlist.create("scanconfig")
--- dmm.measure.configlist.store("scanconfig")
--- dmm.measure.nplc = 0.01
--- dmm.measure.configlist.store("scanconfig")
---  
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_NPLC, 0.1)
--- scan.create("101:104")
--- scan.add("111, 110, 109", "scanconfig")
--- scan.add("107", "scanconfig", 2)
--- 
--- --Set up the DMM for the settings you want to use in the scan. This example shows the function set to DC voltage, with a measurement range of 10 V and the NPLCs set to 10.
--- --Create a configuration list named scanconfig.
--- --Store the present configuration to scanconfig.
--- --Set NPLC to 0.01.
--- --Store the present configuration to scanconfig. This configuration is stored in index 2.
--- -- 
--- --Set up channels 1 to 4 on slot 1 for DC voltage with NPLC set to 0.1.
--- -- 
--- --Create a scan list with a scan list that includes channels 1 to 4.
--- -- 
--- --Adds channels 11, 10, and 9 to the end of the scan list, to be scanned in that order. The settings in the configuration list scanconfig are used for these channels.
--- --Adds channel 7 to the end of the scan list. The settings in index 2 of scanconfig are used for this channel.
--- ```
---@param channelList string List of channels to add, in the order in which they should occur in the scan
---@param configList string A string that defines the configuration list to recall
---@param index number The index in the configuration list to recall; default is 1
---@overload fun(channelList:string)
---@overload fun(channelList:string,configList:string)
function scan.add(channelList, configList, index) end

scan.MODE_OPEN_ALL = nil
scan.MODE_OPEN_USED = nil
scan.MODE_FIXED_ABR = nil

---@alias scanmodescanModeSetting
---|`scan.MODE_OPEN_ALL`
---|`scan.MODE_OPEN_USED`
---|`scan.MODE_FIXED_ABR`



--- **This attribute sets the relay action when the scan starts.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to open all, all channels on all slots are opened before a scan starts. When the mode is set to open used, an intelligent open is performed. For channels that are not set to a function:If any step is set to a function:When this attribute is set to automatic backplane relay, it is equivalent to setting open used, except that all required backplane relays are closed before the start of the scan. These backplane relays are not opened or closed during the scan and do not open at the end of the scan.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/78668.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.mode = scan.MODE_OPEN_USED
--- 
--- --Sets the scan mode setting to open channels that are used in the scan.
--- ```
---@type scanmodescanModeSetting
scan.mode = 0



--- **This attribute determines if the scan sends a trigger event when a value is out of limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is set on, a trigger is generated when the measurements exceed the limits set for the channels in the scan. To use this trigger, set a stimulus to trigger.EVENT_SCAN_ALARM_LIMIT.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/81331.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- scan.add("101:129")
--- scan.learnlimits(0.25, 3)
--- trigger.extout.stimulus = trigger.EVENT_SCAN_ALARM_LIMIT
--- scan.alarmnotify = scan.ON
--- 
--- --Reset the instrument.
--- --Set channels 1 to 9 to the DCV measure function.
--- --Create a scan that includes channels 1 to 9.
--- --Use learn limits to establish the limits to within 25% over three iterations of scan limits.
--- --Enable alarm notification on the external trigger out line.
--- ```
scan.alarmnotify = 0



--- **This attribute contains the source code of a script.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The body of the script is a single string with lines separated by the new line character.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33395.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(test7.source)
--- 
--- --Assuming a script named test7 was created on the instrument, this example retrieves the source code.
--- --Output:
--- --reset()
--- --display.settext(display.TEXT1, "Text on line 1")
--- --display.settext(display.TEXT2, "Text on line 2")
--- ```
---@class buffer
buffer = {}


--- **This function returns statistics from a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that was placed in the reading buffer.The instrument automatically updates reading buffer statistics as data is added to the reading buffer.When the reading buffer is configured to fill continuously and overwrite old data with new data, the buffer statistics include the data that was overwritten. To get statistics that do not include data that has been overwritten, define a large buffer size that will accommodate the number of readings you will make. The table returned from this function provides statistics at the time the function is called. Although the instrument continues to update the statistics, the table that is returned is not updated. To get fresh statistics, call this function again.The statsVar parameter contains the values described in the following table.If n equals zero (0), all other values are nil. If n equals 1, stddev is nil because the standard deviation of a sample size of 1 is undefined.Use the following command to get values from statsVar; a table with the following entries in it: n, min, max, mean, and stddev:Use the following commands to print these entries:To print all the entries, send:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25624.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- trigger.model.load("SimpleLoop", 12, 0.001, defbuffer1)
--- trigger.model.initiate()
--- waitcomplete()
---  
--- stats = buffer.getstats(defbuffer1)
--- print(stats)
--- 
--- --Reset the instrument.
--- --Set up the SimpleLoop trigger-model template to make 12 readings with a 0.001 s delay. Readings are stored in defbuffer1.
--- --Start the trigger model.
--- --Assign the name stats to the table.
--- --Get statistics for the default reading buffer named defbuffer1.
--- --Example output:
--- --["min"]={["seconds"]=1561123956, ["fractionalseconds"]=0.010184587, ["timestamp"]=1561123956, ["reading"]=8.4974199416e-05}, ["mean"]=0.000132948335, ["stddev"]=4.4270141937e-05, ["max"]={["seconds"]=1561123955, ["fractionalseconds"]=0.833083981, ["timestamp"]=1561123955.8, ["reading"]=0.0002192359033}, ["n"]=12
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
---  
--- scan.create("101:105")
--- scan.scancount = 5
---  
--- trigger.model.initiate()
--- waitcomplete()
---  
--- stats = buffer.getstats(defbuffer1)
--- print(stats.min.reading)
--- print(stats.max.reading)
--- 
--- --Set up channels 1 to 5 to measure DC voltage with an NPLC of 0.01.
--- --Create a scan with these channels.
--- --Set the scan count to 5 (make five measurements on each channel).
--- --Start the scan.
--- --Assign the name stats to the table.
--- --Return the minimum and maximum readings from the buffer.
--- -- This example shows how to use extra parameters, such as relative time.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
--- scan.create("101:105")
--- scan.scancount = 5
--- scan.scaninterval = 2
--- trigger.model.initiate()
--- waitcomplete()
---  
--- stats = buffer.getstats(defbuffer1)
--- print("Minimum reading of all channels:", stats.min.reading)
--- print("Maximum reading of all channels:", stats.max.reading)
--- stats = buffer.getstats(defbuffer1, "103")
--- print("Minimum reading of all channel 103 readings:", stats.min.reading)
--- print("Maximum reading of all channel 103 readings:", stats.max.reading)
--- stats = buffer.getstats(defbuffer1, 103, 5)
--- print("Minimum reading of all channels from relative time 3 s to 5 s", stats.min.reading)
--- print("Maximum reading of all channels from relative time 3 s to 5 s", stats.max.reading)
---  
--- 
--- --Set up channels 1 to 5 to measure DC voltage with an NPLC of 0.01.
--- --Create a scan with these channels.
--- --Set the scan count to 5 (make five measurements on each channel).
--- --Start the scan.
--- --Assign the name stats to the table.
--- --Return the minimum and maximum readings from the buffer.
--- --Example output:
--- --Minimum reading of all channels:	-0.047647534452
--- --Maximum reading of all channels:	-0.015124015735
--- --Minimum reading of all channel 3 readings:	-0.04145936519
--- --Maximum reading of all channel 3 readings:	-0.025685636924
--- --Minimum reading of all channels from relative time 3 s to 5 s	-0.04623758547
--- --Maximum reading of all channels from relative time 3 s to 5 s	-0.019379596536
--- ```
---@return statsVar statsVar A table that contains the entries for buffer statistics; see Details for information on the entries
---@param bufferVar bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@param channelNumber number The channel number from which to retrieve data
---@param absStartTime number An integer that represents the absolute start time in seconds
---@param absStartFractional number An integer that represents the portion of the absolute start time that is in fractional seconds
---@param absEndTime number An integer that represents the absolute end time in seconds
---@param absEndFractional number An integer that represents the portion of the absolute end time that is in fractional seconds
---@overload fun():statsVar
---@overload fun(bufferVar:bufferMethods):statsVar
---@overload fun(bufferVar:bufferMethods,channelNumber:number):statsVar
---@overload fun(bufferVar:bufferMethods,relStartTime:number,relEndTime:number):statsVar
---@overload fun(bufferVar:bufferMethods,channelNumber:number,relStartTime:number,relEndTime:number):statsVar
---@overload fun(bufferVar:bufferMethods,absStartTime:number,absStartFractional:number,absEndTime:number,absEndFractional:number):statsVar
function buffer.getstats(bufferVar, absStartTime, absStartFractional, absEndTime, absEndFractional, channelNumber) end

buffer.STYLE_STANDARD = nil
buffer.STYLE_FULLS = nil
buffer.STYLE_WRITABLES = nil
buffer.STYLE_WRITABLE_FULL = nil

---@alias buffermakestyle
---|`buffer.STYLE_STANDARD`
---|`buffer.STYLE_FULLS`
---|`buffer.STYLE_WRITABLES`
---|`buffer.STYLE_WRITABLE_FULL`



--- **This function creates a user-defined reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot assign user-defined reading buffers the name defbuffer1 or defbuffer2. In addition, the buffer name must not already exist as a global variable, a local variable, table, or array.If you create a reading buffer that has the same name as an existing user-defined buffer, the existing buffer is overwritten by the new buffer. Any data in the existing buffer is lost.When you create a reading buffer, it becomes the active buffer. If you create two reading buffers, the last one you create becomes the active buffer.If you select 0, the instrument creates the largest reading buffer possible based on the available memory when the buffer is created.The default fill mode of a user-defined buffer is once. You can change it to continuous later.Once the buffer style is selected, it cannot be changed.Not all remote commands are compatible with the writable and full writable buffer styles. Check the Details section of the command descriptions before using them with any of these buffer styles.Writable reading buffers are used to bring external data into the instrument. You cannot assign them to collect data from the instrument.You can change the buffer capacity for an existing buffer through the front panel or by using the bufferVar.capacity command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25629.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- capTest2 = buffer.make(200, buffer.STYLE_FULL)
--- 
--- --Creates a 200-element reading buffer that stores readings with full accuracy named capTest2.
--- ```
---@return bufferMethods bufferVar The name of the buffer
---@param bufferSize number The maximum number of readings that can be stored in bufferVar; minimum is 10; 0 to maximize buffer size (see Details)
---@param style buffermakestyle The type of reading buffer to create
---@overload fun(bufferSize:number):bufferMethods
function buffer.make(bufferSize, style) end

buffer.SAVE_FORMAT_TIMES = nil
buffer.SAVE_RELATIVE_TIMES = nil
buffer.SAVE_RAW_TIMES = nil
buffer.SAVE_TIMESTAMP_TIME = nil

---@alias buffersaveappendtimeFormat
---|`buffer.SAVE_FORMAT_TIMES`
---|`buffer.SAVE_RELATIVE_TIMES`
---|`buffer.SAVE_RAW_TIMES`
---|`buffer.SAVE_TIMESTAMP_TIME`



--- **This function appends data from the reading buffer to a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the file you specify does not exist on the USB flash drive, this command creates the file.For options that save more than one item of time information, each item is comma-delimited. For example, the default format is date, time, and fractional seconds for each reading.The file extension .csv is appended to the file name if necessary. Any file extension other than .csv generates an error.The index column entry in the .csv file starts at 1 for each append operation.Examples of valid destination file names:Invalid destination file name examples:— The period is not followed by csv.— The only allowed extension is .csv. If .csv is not assigned, it is automatically added.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25642.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buffer.saveappend(MyBuffer, "/usb1/myData.csv")
--- 
--- --Append reading and default time information from a buffer named MyBuffer to a file named myData.csv on the USB flash drive.
--- buffer.saveappend(MyBuffer, "/usb1/myDataRel.csv", buffer.SAVE_RELATIVE_TIME)
--- 
--- --Append readings and relative timestamps from MyBuffer to a file named myDataRel.csv on the USB flash drive.
--- reset()
--- if file.usbdriveexists() == 1 then
---    testDir = "TestData11"
--- -- Create a directory on the USB drive for the data.
---    file.mkdir(testDir)
--- -- Build the full file and path.
---    fileName = "/usb1/" .. testDir .. "/myTestData.csv"
--- -- Open the file where the data will be stored.
---    fileNumber = file.open(fileName, file.MODE_WRITE)
--- -- Write the string data to a file.
---    file.write(fileNumber, "Tested to Company Standard ABC.101\n")
--- -- Write the header separator to a file.
---    file.write(fileNumber, "====================================================================\n")
--- -- Write the string data to a file.
---    file.write(fileNumber, "\t1. Connect HI/LO to respective DUT terminals.\n")
---    file.write(fileNumber, "\t2. Set power supply to 5 VDC @ 1 A.\n")
---    file.write(fileNumber, "\t3. Wait 30 minutes.\n")
---    file.write(fileNumber, "\t4. Capture 100 readings and analyze data.\n\n\n")
--- -- Write buffering data to a file.
---    file.flush(fileNumber)
--- -- Close the data file.
---    file.close(fileNumber)
--- end
--- -- Fix the range to 10 V.
--- dmm.measure.range = 10.0
--- -- Set the measurement count to 100.
--- dmm.measure.count = 100
--- -- Set up reading buffers.
--- -- Ensure the default measurement buffer size matches the count.
--- defbuffer1.capacity = dmm.measure.count
--- dmm.measure.read()
--- buffer.saveappend(defbuffer1, fileName)
--- 
--- --Write string data to a file with information about a test file.
--- ```
---@param bufferVar bufferMethods Indicates the reading buffer to use; the default buffers (defbuffer1 or defbuffer2) or the name of a user-defined buffer; if no buffer is specified, defbuffer1 is used
---@param timeFormat buffersaveappendtimeFormat Indicates how date and time information from the buffer is saved in the file on the USB flash drive; the options are
---@param start number Defines the starting point in the buffer to start saving data
---@param endPoint number Defines the ending point in the buffer to stop saving data
---@overload fun(bufferVar:bufferMethods)
---@overload fun(bufferVar:bufferMethods,timeFormat:buffersaveappendtimeFormat)
function buffer.saveappend(bufferVar, filename, timeFormat, start, endPoint) end


--- **This function saves data from the specified reading buffer to a USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file name must specify the full path (including /usb1/). If included, the file extension must be set to .csv. If no file extension is specified, .csv is added.Examples of valid destination file names:The DAQ6510 does not check for existing files when you save. Verify that you are using a unique name to avoid overwriting any existing CSV files on the flash drive.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buffer.save(MyBuffer, "/usb1/myData.csv")
--- 
--- --Save all reading and default time information from a buffer named MyBuffer to a file named myData.csv on the USB flash drive.
--- buffer.save(MyBuffer, "/usb1/myDataRel.csv", buffer.SAVE_RELATIVE_TIME)
--- 
--- --Save all readings and relative timestamps from MyBuffer to a file named myDataRel.csv on the USB flash drive.
--- buffer.save(defbuffer1, "/usb1/defbuf1data", buffer.SAVE_RAW_TIME)
--- 
--- --Save readings and raw time stamps from defbuffer1 to a file named defbuf1data on the USB flash drive.
--- ```
---@param bufferVar bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer
---@param fileName string A string that indicates the name of the file on the USB flash drive in which to save the reading buffer
---@param what bufferFileSaveDetails Defines which information is saved in the file on the USB flash drive
---@param start number Defines the starting point in the buffer to start saving data
---@param endPoint number Defines the ending point in the buffer to stop saving data
---@overload fun(bufferVar:bufferMethods,fileName:string)
---@overload fun(bufferVar:bufferMethods,fileName:string,what:bufferFileSaveDetails)
function buffer.save(bufferVar, fileName, what, start, endPoint) end


--- **This function deletes a user-defined reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot delete the default reading buffers, defbuffer1 and defbuffer2.After deleting the buffer, call collectgarbage() to reclaim the memory the buffer was using.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33981.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buf400 = buffer.make(400)
--- dmm.measure.read(buf400)
--- printbuffer(1, buf400.n, buf400.relativetimestamps)
--- buffer.delete(buf400)
--- collectgarbage()
--- 
--- --Create a 400-element reading buffer named buf400.
--- --Make measurements and store the readings in buf400.
--- --Print the relative timestamps for each reading in the buffer.
--- --Example output, assuming five readings are stored in the buffer:
--- --0, 0.412850017, 0.821640085, 1.230558058, 1.629523236
--- --Delete buf400.
--- --Use collectgarbage() to unallocate the buffer.
--- ```
---@param bufferName bufferMethods The name of a user-defined reading buffer
function buffer.delete(bufferName) end


--- **This function clears the statistical information associated with the specified buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command clears the statistics without clearing the readings.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/34560.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buffer.clearstats()
--- 
--- --Clears statistics for defbuffer1.
--- ```
---@param bufferVar bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1 if not specified
---@overload fun()
function buffer.clearstats(bufferVar) end

buffer.UNIT_AMPAC = nil
buffer.UNIT_AMP_ACC = nil
buffer.UNIT_CELSIUSC = nil
buffer.UNIT_CUSTOM1C = nil
buffer.UNIT_CUSTOM2C = nil
buffer.UNIT_CUSTOM3DAC = nil
buffer.UNIT_DACD = nil
buffer.UNIT_DBMD = nil
buffer.UNIT_DECIBELD = nil
buffer.UNIT_DIOF = nil
buffer.UNIT_FAHRENHEITC = nil
buffer.UNIT_FARADF = nil
buffer.UNIT_HERTZK = nil
buffer.UNIT_KELVINN = nil
buffer.UNIT_NONER = nil
buffer.UNIT_OHMP = nil
buffer.UNIT_PERCENTDC = nil
buffer.UNIT_RATIOR = nil
buffer.UNIT_RECIPROCALP = nil
buffer.UNIT_SECONDT = nil
buffer.UNIT_TOTDC = nil
buffer.UNIT_VOLTAC = nil
buffer.UNIT_VOLT_ACP = nil
buffer.UNIT_WATT = nil
buffer.UNIT_X = nil

---@alias bufferchannelmathunit
---|`buffer.UNIT_AMPAC`
---|`buffer.UNIT_AMP_ACC`
---|`buffer.UNIT_CELSIUSC`
---|`buffer.UNIT_CUSTOM1C`
---|`buffer.UNIT_CUSTOM2C`
---|`buffer.UNIT_CUSTOM3DAC`
---|`buffer.UNIT_DACD`
---|`buffer.UNIT_DBMD`
---|`buffer.UNIT_DECIBELD`
---|`buffer.UNIT_DIOF`
---|`buffer.UNIT_FAHRENHEITC`
---|`buffer.UNIT_FARADF`
---|`buffer.UNIT_HERTZK`
---|`buffer.UNIT_KELVINN`
---|`buffer.UNIT_NONER`
---|`buffer.UNIT_OHMP`
---|`buffer.UNIT_PERCENTDC`
---|`buffer.UNIT_RATIOR`
---|`buffer.UNIT_RECIPROCALP`
---|`buffer.UNIT_SECONDT`
---|`buffer.UNIT_TOTDC`
---|`buffer.UNIT_VOLTAC`
---|`buffer.UNIT_VOLT_ACP`
---|`buffer.UNIT_WATT`
---|`buffer.UNIT_X`



--- **This function sets a math expression on a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72427.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- channelExp = buffer.make(200, buffer.STYLE_FULL)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
---  
--- scan.create("101:105")
--- scan.scancount = 2
--- scan.buffer = channelExp
--- buffer.channelmath(channelExp, "102", buffer.UNIT_NONE, buffer.EXPR_SUBTRACT, "101")
---  
--- trigger.model.initiate()
--- waitcomplete()
--- display.changescreen(display.SCREEN_READING_TABLE)
--- print(channelExp.extravalues[1])
--- printbuffer(1, 1, channelExp.extravalues)
--- 
--- --This example assumes a 7700 switching module in slot 1.
--- --Instrument has terminals set to REAR.
--- --Reset the instrument.
--- --Make a buffer named channelExp set to hold 200 readings with a buffer style of FULL.
--- --Set the function for the channels 1 to 5 to voltage.
--- --Set up a scan that includes channels 1 to 5.
--- --Set the scan to use the reading buffer channelExp.
--- --Set up channel math for channel 2, using a unit of none, that subtracts channel 1 from channel 2.
--- --Start the scan.
--- --Wait for results.
--- --Read the data from channels 1 to 10, including the readings and the value generated by the expression.
--- --Display the reading table on the front panel of the instrument.
--- ```
---@param readingBuffer bufferMethods The name of the reading buffer; must be set to the style FULL
---@param unit bufferchannelmathunit The units to be applied to the value generated by the expression
---@param channelNumber string String that contains the channel to apply the expression to, using normal channel list syntax; this is also the channel that supplies the r value in the expressions
---@param constant0 number The constant to be used for c0 in the expression
---@param constant1 number The constant to be used for c1 in the expression
---@param constant2 number The constant to be used for c2 in the expression
---@param constant3 number The constant to be used for c3 in the expression
---@param constant4 number The constant to be used for c4 in the expression
---@param constant5 number The constant to be used for c5 in the expression
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string,constant0:number)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string,channelNum2:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string,channelNum2:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string,channelNum2:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string,channelNum2:string)
---@overload fun(readingBuffer:bufferMethods,unit:bufferchannelmathunit,channelNumber:string,channelNum2:string)
function buffer.channelmath(readingBuffer, unit, channelNumber, EXPR_POLY, constant0, constant1, constant2, constant3, constant4, constant5) end

buffer.UNIT_AMPAC = nil
buffer.UNIT_AMP_ACC = nil
buffer.UNIT_CELSIUSC = nil
buffer.UNIT_CUSTOM1C = nil
buffer.UNIT_CUSTOM2C = nil
buffer.UNIT_CUSTOM3DAC = nil
buffer.UNIT_DACD = nil
buffer.UNIT_DBMD = nil
buffer.UNIT_DECIBELD = nil
buffer.UNIT_DIOF = nil
buffer.UNIT_FAHRENHEITC = nil
buffer.UNIT_FARADF = nil
buffer.UNIT_HERTZK = nil
buffer.UNIT_KELVINN = nil
buffer.UNIT_NONER = nil
buffer.UNIT_OHMP = nil
buffer.UNIT_PERCENTDC = nil
buffer.UNIT_RATIOR = nil
buffer.UNIT_RECIPROCALP = nil
buffer.UNIT_SECONDT = nil
buffer.UNIT_TOTDC = nil
buffer.UNIT_VOLTAC = nil
buffer.UNIT_VOLT_ACP = nil
buffer.UNIT_WATT = nil
buffer.UNIT_X = nil

---@alias buffermathunit
---|`buffer.UNIT_AMPAC`
---|`buffer.UNIT_AMP_ACC`
---|`buffer.UNIT_CELSIUSC`
---|`buffer.UNIT_CUSTOM1C`
---|`buffer.UNIT_CUSTOM2C`
---|`buffer.UNIT_CUSTOM3DAC`
---|`buffer.UNIT_DACD`
---|`buffer.UNIT_DBMD`
---|`buffer.UNIT_DECIBELD`
---|`buffer.UNIT_DIOF`
---|`buffer.UNIT_FAHRENHEITC`
---|`buffer.UNIT_FARADF`
---|`buffer.UNIT_HERTZK`
---|`buffer.UNIT_KELVINN`
---|`buffer.UNIT_NONER`
---|`buffer.UNIT_OHMP`
---|`buffer.UNIT_PERCENTDC`
---|`buffer.UNIT_RATIOR`
---|`buffer.UNIT_RECIPROCALP`
---|`buffer.UNIT_SECONDT`
---|`buffer.UNIT_TOTDC`
---|`buffer.UNIT_VOLTAC`
---|`buffer.UNIT_VOLT_ACP`
---|`buffer.UNIT_WATT`
---|`buffer.UNIT_X`



--- **This function allows you to run a mathematical expression on a measurement. The expression is applied when the measurement is placed in the reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73595.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- mathExp = buffer.make(200, buffer.STYLE_FULL)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
---  
--- buffer.math(mathExp, buffer.UNIT_NONE, buffer.EXPR_MULTIPLY)
--- for x = 1, 3 do 
---      print("Reading: ", dmm.measure.read(mathExp))
--- end
---  
--- display.changescreen(display.SCREEN_READING_TABLE)
---  
--- print("Extra value reading 1: ", mathExp.extravalues[1])
--- print("Extra value reading 2: ", mathExp.extravalues[2])
--- print("Extra value reading 3: ", mathExp.extravalues[3])
--- 
--- --Reset the instrument.
--- --Make a buffer named mathExp set to hold 200 readings with a buffer style of FULL.
--- --Set the measure function to DC voltage.
--- --Set the buffer math expression to multiply readings against the previous readings.
--- --Make three readings.
--- --Display the reading table on the front panel of the instrument, where you can view the extra readings.
--- --Print the extra values (the calculated values).
--- --Example output:
--- --Reading: 6.3863430578e-05
--- --Reading: 6.7818055872e-05
--- --Reading: 1.9871571784e-05
--- --Extra value reading 1: 6.3863430578e-05
--- --Extra value reading 2: 4.3310937031e-09
--- --Extra value reading 3: 1.3476513655e-09
--- ```
---@param readingBuffer bufferMethods The name of the reading buffer; the reading buffer selected must be set to the style FULL
---@param unit buffermathunit The units to be applied to the value generated by the expression
---@param constant0 number The constant to be used for c0 in the expression
---@param constant1 number The constant to be used for c1 in the expression
---@param constant2 number The constant to be used for c2 in the expression
---@param constant3 number The constant to be used for c3 in the expression
---@param constant4 number The constant to be used for c4 in the expression
---@param constant5 number The constant to be used for c5 in the expression
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit)
---@overload fun(readingBuffer:bufferMethods,unit:buffermathunit,constant0:number)
function buffer.math(readingBuffer, unit, EXPR_POLY, constant0, constant1, constant2, constant3, constant4, constant5) end

buffer.UNIT_CUSTOMN = nil

---@alias bufferunitUNIT_CUSTOMN
---|`buffer.UNIT_CUSTOMN`



--- **This function allows you to create up to three custom units of measure for use in buffers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use custom units of measures in buffer math, channel math, and writable buffers.If you specify more than two characters, the additional characters are ignored. Some characters are converted to other symbols:This unit is reset when power is cycled. It is not affected by reset.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/76401.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- mathExp = buffer.make(200, buffer.STYLE_FULL)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- buffer.unit(buffer.UNIT_CUSTOM1, "fb") 
---  
--- buffer.math(mathExp, buffer.UNIT_CUSTOM1, buffer.EXPR_MULTIPLY)
--- for x = 1, 3 do 
---      print("Reading "..x..":", dmm.measure.read(mathExp))
--- end
---  
--- display.changescreen(display.SCREEN_READING_TABLE)
--- for x = 1, 3 do 
---      print("Extra value reading "..x..":", mathExp.extravalues[x])
--- end
--- 
--- --This example assumes a 7700 switching module in slot 1. Instrument has terminals set to FRONT.
--- --Reset the instrument.
--- --Make a buffer named mathExp set to hold 200 readings with a buffer style of FULL.
--- --Set the measure function to DC voltage.
--- --Set the customer 1 buffer unit to fb.
--- --Set the buffer math expression to multiply readings against the previous readings.
--- --Make 3 readings.
--- --Display the reading table on the front panel of the instrument, where you can view the extra readings.
--- --Print the extra values (the calculated values).
--- --Example output:
--- --Reading 1: 0.00015611271869
--- --Reading 2: 9.0539004907e-05
--- --Reading 3: 0.30001141669554
--- --Extra value reading 1: 0.00015611271869
--- --Extra value reading 2: 1.4134290203e-08
--- --Extra value reading 3: 1.0336562635e-08
--- ```
---@param UNIT_CUSTOMN bufferunitUNIT_CUSTOMN buffer.UNIT_CUSTOMN
---@param unitOfMeasure string A string that defines the custom unit; up to three characters; defaults are X for custom unit 1, Y for unit 2, and Z for unit 3
function buffer.unit(UNIT_CUSTOMN, unitOfMeasure) end
---@class eventlog
eventlog = {}

eventlog.SEV_ERROR = 1
eventlog.SEV_WARN = 2
eventlog.SEV_WARN = 3
eventlog.SEV_ERROR = 4
eventlog.SEV_INFO = 5
eventlog.SEV_INFO = 6
eventlog.SEV_ERROR = 7
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil
eventlog.SEV_ALL = nil

---@alias eventlogsaveeventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ALL`



--- **This function saves the event log to a file on a USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command saves all event log entries to a USB flash drive.If you do not define an event type, the instrument saves all event log entries.The extension .csv is automatically added to the file name.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25702.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- eventlog.save("/usb1/WarningsApril", eventlog.SEV_WARN)
--- 
--- --Save warning messages to a .csv file on a USB flash drive.
--- ```
---@param filename string A string that represents the name of the file to be saved
---@param eventType eventlogsaveeventType Limits the return to specific event log types; set a cumulative integer value that represents the event log types to
---@overload fun(filename:string)
function eventlog.save(filename, eventType) end


--- **This function clears the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command removes all events from the event log, including entries in the front-panel event log.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/27637.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function eventlog.clear() end

eventlog.SEV_ERROR = 1
eventlog.SEV_WARN = 2
eventlog.SEV_WARN = 3
eventlog.SEV_ERROR = 4
eventlog.SEV_INFO = 5
eventlog.SEV_INFO = 6
eventlog.SEV_ERROR = 7
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil
eventlog.SEV_ALL = nil

---@alias eventlognexteventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ALL`



--- **This function returns the oldest unread event message from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When an event occurs on the instrument, it is placed in the event log. The eventlog.next() command retrieves an unread event from the event log. Once an event is read, it can no longer be accessed remotely. However, it can be viewed on the front panel. When localnode.showevents is enabled, this command never returns an event because those events are automatically read and sent to the remote interface.To read multiple events, execute this command multiple times.If there are no entries in the event log, the following is returned:If the event type is not defined, an event of any type is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/27658.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.next(5))
--- 
--- --Get the oldest error or information event from the event log.
--- --Example output:
--- ---285 TSP Syntax error at line 1: unexpected symbol near `0' 1 0 1367806152 652040060
--- ```
---@return any eventNumber The event number
---@return any message A description of the event
---@return any severity The severity of the event
---@return any nodeID The TSP-Link node where the event occurred or 0 if the event occurred on the local node
---@return any timeSeconds The seconds portion of the time when the event occurred
---@return any timeNanoSeconds The fractional seconds portion of the time when the event occurred
---@param eventType eventlognexteventType Limits the return to specific event log types; set a cumulative integer value that represents the event log types to
---@overload fun():any
function eventlog.next(eventType) end

eventlog.SEV_ERROR = 1
eventlog.SEV_WARN = 2
eventlog.SEV_WARN = 3
eventlog.SEV_ERROR = 4
eventlog.SEV_INFO = 5
eventlog.SEV_INFO = 6
eventlog.SEV_ERROR = 7
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil
eventlog.SEV_ALL = nil

---@alias eventloggetcounteventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ALL`



--- **This function returns the number of unread events in the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A count finds the number of unread events in the event log. You can specify the event types to return or return the count for all events.This command reports the number of events that have occurred since the command was last sent or since the event log was last cleared.Events are read automatically when localnode.showevents is enabled. You can also read them individually with eventlog.next().
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30552.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.getcount(eventlog.SEV_INFO))
--- 
--- --Displays the present number of unread information messages in the instrument event log.
--- --If there are three information messages in the event log, output is:
--- --3
--- ```
---@param eventType eventloggetcounteventType Limits the return to specific event log types; set a cumulative integer value that represents the event log types to
---@overload fun()
function eventlog.getcount(eventType) end

eventlog.SEV_INFO = 1
eventlog.SEV_ERROR = 2
eventlog.SEV_WARN = 4
eventlog.SEV_INFO = nil

---@alias eventlogposteventType
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_INFO`



--- **This function allows you to post your own text to the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this command to create your own event log entries and assign a severity level to them. This can be useful for debugging and status reporting.From the front panel, you must set the Log Warnings and Log Information options on to have the custom warning and information events placed into the event log.You can send use the following codes to create special characters in the message.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/34730.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- eventlog.clear()
--- eventlog.post("Results in \018", eventlog.SEV_ERROR)
--- print(eventlog.next())
--- 
--- --Posts an event that states "Results in Ω".
--- --Output:
--- --1005 User: Results in Ω
--- ```
---@param message string String that contains the message
---@param eventType eventlogposteventType The type of event; if no event is defined, defaults to eventlog.SEV_INFO
---@overload fun(message:string)
function eventlog.post(message, eventType) end
---@class display
display = {}

display.FORMAT_EXPONENTA = nil
display.FORMAT_PREFIX = nil

---@alias displayreadingformatformat
---|`display.FORMAT_EXPONENTA`
---|`display.FORMAT_PREFIX`



--- **This attribute determines the format that is used to display measurement readings on the front-panel display of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting persists through reset() and power cycles.When Prefix is selected, prefixes are added to the units symbol, such as k (kilo) or m (milli). When Exponent is selected, exponents are used instead of prefixes. When the prefix option is selected, very large or very small numbers may be displayed with exponents.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25719.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.readingformat = display.FORMAT_EXPONENT
--- 
--- --Change front-panel display to show readings in exponential format.
--- ```
---@type displayreadingformatformat
display.readingformat = 0


display.TEXT1 = nil
display.TEXT2 = nil

---@alias displaysettextDisplayText
---|`display.TEXT1`
---|`display.TEXT2`



--- **This function defines the text that is displayed on the front-panel USER swipe screen.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command defines text messages for the USER swipe screen.If you enter too many characters, the instrument displays a warning event and shortens the message to fit.When the instrument is reset, the user test is removed and the USER swipe screen is hidden until another message is defined.You can send use the following codes to create special characters in the message.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25722.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.changescreen(display.SCREEN_USER_SWIPE)
--- display.settext(display.TEXT1, "A122 \185 A123")
--- display.settext(display.TEXT2, "Results in \018")
--- 
--- --Clear the USER swipe screen.
--- --Display the USER swipe screen.
--- --Set the first line to read "A122 Δ A123" and the second line to display ""Results in Ω":
--- --
--- ```
---@param DisplayText displaysettextDisplayText display.TEXT1 display.TEXT2
---@param Text any String that contains the message for the top line of the USER swipe screen (up to 20 characters)
function display.settext(DisplayText, Text) end


--- **This function clears the text from the front-panel USER swipe screen.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30502.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.changescreen(display.SCREEN_USER_SWIPE)
--- display.settext(display.TEXT1, "Serial number:")
--- display.settext(display.TEXT2, localnode.serialno)
--- 
--- --Clear the USER swipe screen.
--- --Set the first line to read "Serial number:" and the second line to display the serial number of the instrument.
--- ```
function display.clear() end

display.SCREEN_HOMEH = nil
display.SCREEN_HOME_LARGE_READINGR = nil
display.SCREEN_READING_TABLEG = nil
display.SCREEN_GRAPHH = nil
display.SCREEN_HISTOGRAMFUNCTIONS = nil
display.SCREEN_FUNCTIONS_SWIPEGRAPH = nil
display.SCREEN_GRAPH_SWIPESECONDARY = nil
display.SCREEN_SECONDARY_SWIPESETTINGS = nil
display.SCREEN_SETTINGS_SWIPESTATISTICS = nil
display.SCREEN_STATS_SWIPEUSER = nil
display.SCREEN_USER_SWIPE = nil
display.SCREEN_CHANNEL_SWIPE = nil
display.SCREEN_NONSWITCH_SWIPE = nil
display.SCREEN_SCAN_SWIPE = nil
display.SCREEN_CHANNEL_CONTROLC = nil
display.SCREEN_CHANNEL_SETTINGSC = nil
display.SCREEN_CHANNEL_SCANO = nil
display.SCREEN_PROCESSING = nil

---@alias displaychangescreenscreenName
---|`display.SCREEN_HOMEH`
---|`display.SCREEN_HOME_LARGE_READINGR`
---|`display.SCREEN_READING_TABLEG`
---|`display.SCREEN_GRAPHH`
---|`display.SCREEN_HISTOGRAMFUNCTIONS`
---|`display.SCREEN_FUNCTIONS_SWIPEGRAPH`
---|`display.SCREEN_GRAPH_SWIPESECONDARY`
---|`display.SCREEN_SECONDARY_SWIPESETTINGS`
---|`display.SCREEN_SETTINGS_SWIPESTATISTICS`
---|`display.SCREEN_STATS_SWIPEUSER`
---|`display.SCREEN_USER_SWIPE`
---|`display.SCREEN_CHANNEL_SWIPE`
---|`display.SCREEN_NONSWITCH_SWIPE`
---|`display.SCREEN_SCAN_SWIPE`
---|`display.SCREEN_CHANNEL_CONTROLC`
---|`display.SCREEN_CHANNEL_SETTINGSC`
---|`display.SCREEN_CHANNEL_SCANO`
---|`display.SCREEN_PROCESSING`



--- **This function changes which front-panel screen is displayed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scan and channel options are only available if you have a card installed and if the front-panel TERMINALS switch is set to REAR. The non-switch option is only available for cards such as the 7706 and 7707 that have non-switching channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30503.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext(display.TEXT1, "Batch A122")
--- display.settext(display.TEXT2, "Test running")
--- display.changescreen(display.SCREEN_USER_SWIPE)
--- 
--- --Clear the USER swipe screen.
--- --Set the first line of the USER swipe screen to read "Batch A122" and the second line to display "Test running".
--- --Display the USER swipe screen.
--- --
--- ```
---@param screenName displaychangescreenscreenName The screen to display
function display.changescreen(screenName) end

display.BUTTONS_NONE = nil
display.BUTTONS_OK = nil
display.BUTTONS_CANCEL = nil
display.BUTTONS_OKCANCEL = nil
display.BUTTONS_YESNO = nil
display.BUTTONS_YESNOCANCEL = nil

---@alias displaypromptbuttonID
---|`display.BUTTONS_NONE`
---|`display.BUTTONS_OK`
---|`display.BUTTONS_CANCEL`
---|`display.BUTTONS_OKCANCEL`
---|`display.BUTTONS_YESNO`
---|`display.BUTTONS_YESNOCANCEL`



--- **This function allows you to create an interactive dialog prompt that displays a custom message on the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command displays buttons and text on the front panel. You can set up scripts that respond to the buttons when they are selected.If you send display.BUTTONS_NONE, the operator needs to press the EXIT key to clear the message from the front-panel display. You can also use the display.delete() command to remove the prompt.Only one prompt can be active at a time.When the user presses a button, the button presses are returned as one of the following options:To capture return values, you need to use display.waitevent() to wait for the user button selection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33260.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- trigger.model.load("SimpleLoop", 10, 0, defbuffer1)
--- display.prompt(display.BUTTONS_YESNO, "Would you like to make 10 DC voltage readings now?")
--- promptID, result = display.waitevent()
--- if result == display.BUTTON_YES then
---    trigger.model.initiate()
--- end
--- display.prompt(display.BUTTONS_YESNO, "Would you like to switch to the Graph screen?")
--- promptID, result = display.waitevent()
--- if result == display.BUTTON_YES then
---    display.changescreen(display.SCREEN_GRAPH)
--- end
--- 
--- --Create a simple loop that will make 10 measurements and save them in default buffer 1.
--- --Display the prompt shown here:
--- --
--- --If the user presses Yes, the measurements are made.
--- --If the user presses No, the measurements are not made, and the message is removed.
--- --Display the prompt "Would you like to switch to the Graph screen?"
--- --If the user presses Yes, the Graph screen is displayed.
--- --If the user presses No, the user remains on the present screen.
--- ```
---@return any promptID A set of characters that identifies the prompt; up to 63 characters
---@param buttonID displaypromptbuttonID The type of prompt to display; choose one of the following options
---@param promptText any A string that contains the text that is displayed above the prompts
function display.prompt(buttonID, promptText) end

display.BUTTON_YES = nil
display.BUTTON_NO = nil
display.BUTTON_OK = nil
display.BUTTON_CANCEL = nil

---@alias displaywaiteventsubID
---|`display.BUTTON_YES`
---|`display.BUTTON_NO`
---|`display.BUTTON_OK`
---|`display.BUTTON_CANCEL`



--- **This function causes the instrument to wait for a user to respond to a prompt that was created with a prompt command.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command waits until a user responds to a front-panel prompt that was created with the display.prompt() command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33261.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- trigger.model.load("SimpleLoop", 10, 0, defbuffer1)
--- display.prompt(display.BUTTONS_YESNO, "Would you like to make 10 DC voltage readings now?")
--- promptID, result = display.waitevent()
--- if result == display.BUTTON_YES then
---    trigger.model.initiate()
--- end
--- display.prompt(display.BUTTONS_YESNO, "Would you like to switch to the Graph screen?")
--- promptID, result = display.waitevent()
--- if result == display.BUTTON_YES then
---    display.changescreen(display.SCREEN_GRAPH)
--- end
--- 
--- --Create a simple loop that will make 10 measurements and save them in default buffer 1.
--- --Display the prompt "Would you like to make 10 DC voltage readings now?"
--- --If the user presses Yes, the measurements are made.
--- --If the user presses No, the measurements are not made and the message is removed.
--- --Display the prompt "Would you like to switch to the Graph screen?"
--- --If the user presses Yes, the Graph screen is displayed.
--- --If the user presses No, the user remains on the present screen.
--- ```
---@return number objectID A number that identifies the object, such as a prompt message, that is displayed on the front panel
---@return displaywaiteventsubID subID The returned value after a button is pressed on the front panel
---@param timeout number The amount of time to wait before timing out; time is 0 to 300 s, where the default of 0 waits indefinitely
---@overload fun():displaywaiteventsubID
function display.waitevent(timeout) end

display.STATE_LCD_10075 = nil
display.STATE_LCD_7550 = nil
display.STATE_LCD_5025 = nil
display.STATE_LCD_25D = nil
display.STATE_LCD_OFFD = nil
display.STATE_BLACKOUT = nil

---@alias displaylightstatebrightness
---|`display.STATE_LCD_10075`
---|`display.STATE_LCD_7550`
---|`display.STATE_LCD_5025`
---|`display.STATE_LCD_25D`
---|`display.STATE_LCD_OFFD`
---|`display.STATE_BLACKOUT`



--- **This attribute sets the light output level of the front-panel display.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command changes the light output of the front panel when a test requires different instrument illumination levels.The change in illumination is temporary. The normal backlight settings are restored after a power cycle. You can use this to reset a display that is already dimmed by the front-panel Backlight Dimmer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33459.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.lightstate = display.STATE_LCD_50
--- 
--- --Set the display brightness to 50%.
--- ```
---@type displaylightstatebrightness
display.lightstate = 0



--- **This function allows you to remove a prompt on the front-panel display that was created with display.prompt().**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this command to remove the presently displayed prompt.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/38977.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- removePrompt3 = display.prompt(display.BUTTONS_NONE, "This prompt will disappear in 3 seconds")
--- delay(3)
--- display.delete(removePrompt3)
--- 
--- --This example displays a prompt that is automatically removed in three seconds.
--- --
--- -- 
--- ```
---@param promptID any The identifier defined by display.prompt()
function display.delete(promptID) end


--- **This attribute determines which channels are set to be watch channels on the front panel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In the Graph screens, you can select the watch channels. Each channel in the watch channels list is displayed as a trace on the graph.You can define up to 20 channels as watch channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/81506.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.watchchannels = "101:105"
--- 
--- --Sets the instrument to watch channels 1, 2, 3, 4, and 5.
--- ```
display.watchchannels = 0



--- **This attribute determines which buffer is used for measurements that are displayed on the front panel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The buffer defined by this command is used to store measurements data and is shown in the reading buffer indicator on the home screen of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/81840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.activebuffer = buffer2
--- 
--- --Set the front panel to use buffer2 as the active reading buffer.
--- ```
display.activebuffer = 0

---@class beeper
beeper = {}


--- **This function generates an audible tone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use the beeper of the instrument to provide an audible signal at a specific frequency and time duration.Using this function from a remote interface does not affect audible errors or key click settings that were made from the DAQ6510 front panel.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/29636.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.beep(2, 2400)
--- 
--- --Generates a 2 s, 2400 Hz tone.
--- ```
---@param duration number The amount of time to play the tone (0.001 s to 100 s)
---@param frequency number The frequency of the beep (20 Hz to 8000 Hz)
function beeper.beep(duration, frequency) end
---@class status
status = {}


--- **This function clears event registers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command clears the event registers of the Questionable Event and Operation Event Register set. It does not affect the Questionable Event Enable or Operation Event Enable registers.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30567.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.clear()
--- 
--- --Clear the bits in the registers
--- ```
function status.clear() end


--- **This attribute stores the status byte condition register.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- You can use this command to read the status byte, which is returned as a numeric value. When an enabled status event occurs, a summary bit is set in this register to indicate the event occurrence. The returned value can indicate that one or more status events occurred. If more than one bit of the register is set, statusByte equals the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).The meanings of the individual bits of this register are shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- statusByte = status.condition
--- print(statusByte)
--- 
--- --Returns statusByte.
--- --Example output:
--- --1.29000e+02
--- --Converting this output (129) to its binary equivalent yields 1000 0001 
--- --Therefore, this output indicates that the set bits of the status byte condition register are presently B0 (MSS) and B7 (OSB).
--- ```


--- **This attribute stores the settings of the Service Request (SRQ) Enable Register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets or clears the individual bits of the Status Request Enable Register.The Status Request Enable Register is cleared when power is cycled or when a parameter value of 0 is sent with this command.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32386.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- requestSRQEnableRegister = status.MSB + status.OSB
--- status.request_enable = requestSRQEnableRegister
--- 
--- --Uses constants to set the MSB and OSB bits of the service request (SRQ) enable register and clear all other bits.
--- -- decimal 129 = binary 10000001
--- requestSRQEnableRegister = 129
--- status.request_enable = requestSRQEnableRegister
--- 
--- --Uses a decimal value to set the MSB and OSB bits and clear all other bits of the service request (SRQ) enable register.
--- status.request_enable = 0
--- 
--- --Clear the register.
--- ```
status.request_enable = 0



--- **This function resets all bits in the status model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears the event registers and the enable registers for operation and questionable. It will not clear the Service Request Enable Register (*SRE) to Standard Request Enable Register (*ESE).Preset does not affect the event queue.The Standard Event Status Register is not affected by this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.preset()
--- 
--- --Resets the instrument status model.
--- ```
function status.preset() end
---@class digio
digio = {}


--- **This function writes to all digital I/O lines.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function writes to the digital I/O port by setting the binary state of each digital line from an integer equivalent value.The binary representation of the value indicates the output pattern to be written to the I/O port. For example, a value of 63 has a binary equivalent of 111111 (all lines are set high); a data value of 42 has a binary equivalent of 101010 (lines 2, 4, and 6 are set high, and the other three lines are set low).An instrument reset does not affect the present states of the digital I/O lines.All six lines must be configured as digital control lines. If not, this command generates an error.You can also enter the data parameter as a binary value.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30981.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeport(63)
--- 
--- --Sets digital I/O lines 1 through 6 high (binary 111111).
--- digio.writeport(0b111111)
--- 
--- --Sets digital I/O lines 1 through 6 high (digital 63).
--- ```
---@param data number The value to write to the port (0 to 63)
function digio.writeport(data) end


--- **This function reads the digital I/O port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the value of the input lines on the digital I/O port. The least significant bit (bit B1) of the binary number corresponds to digital I/O line 1; bit B6 corresponds to digital I/O line 6.For example, a returned value of 42 has a binary equivalent of 101010, which indicates that lines 2, 4, 6 are high (1), and the other lines are low (0).An instrument reset does not affect the present states of the digital I/O lines.All six lines must be configured as digital control lines. If not, this command generates an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31368.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = digio.readport()
--- print(data)
--- 
--- --Assume lines 2, 4, and 6 are set high when the I/O port is read.
--- --Output:
--- --42
--- --This is binary 101010
--- ```
---@return number data The present value of the input lines on the digital I/O port
function digio.readport() end
---@class triggerblenderArr
triggerblenderArr = {}

---@type triggerblenderArr[]
trigger.blender = {}


--- **This function clears the blender event detector and resets the overrun indicator of blender N.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the blender event detector to the undetected state and resets the overrun indicator of the event detector.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15785.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[2].clear()
--- 
--- --Clears the event detector for blender 2.
--- ```
function triggerblenderArr.clear() end



--- **This attribute selects whether the blender performs OR operations or AND operations.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command selects whether the blender waits for any one event (OR) or waits for all selected events (AND) before signaling an output event.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15787.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = trigger.EVENT_DIGIO3
--- trigger.blender[1].stimulus[2] = trigger.EVENT_DIGIO5
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens on line 3 or 5.
--- ```
triggerblenderArr.orenable= 0



--- **This attribute indicates whether or not an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- Indicates if an event was ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector that is built into the event blender itself.This command does not indicate if an overrun occurred in any other part of the trigger model or in any other trigger object that is monitoring the event. It also is not an indication of an action overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15788.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.blender[1].overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If an event was not ignored, the output is false.
--- ```


--- **This function resets some of the trigger blender settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.blender[N].reset() function resets the following attributes to their factory defaults:It also clears trigger.blender[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/17666.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[1].reset()
--- 
--- --Resets the trigger blender 1 settings to factory defaults.
--- ```
function triggerblenderArr.reset() end



--- **This function waits for a blender trigger event to occur.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits for an event blender trigger event. If one or more trigger events were detected since the last time trigger.blender[N].wait() or trigger.blender[N].clear() was called, this function returns immediately.After detecting a trigger with this function, the event detector automatically resets and rearms. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35118.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[3].mode = digio.MODE_TRIGGER_IN
--- digio.line[5].mode = digio.MODE_TRIGGER_IN
--- trigger.digin[3].edge = trigger.EDGE_FALLING
--- trigger.digin[5].edge = trigger.EDGE_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = trigger.EVENT_DIGIO3
--- trigger.blender[1].stimulus[2] = trigger.EVENT_DIGIO5
--- print(trigger.blender[1].wait(3))
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens on line 3 or 5.
--- --Wait 3 s while checking if trigger blender 1 event has occurred.
--- ```
---@return boolean triggered Trigger detection indication for blender
---@param timeout number Maximum amount of time in seconds to wait for the trigger blender event
function triggerblenderArr.wait(timeout) end



--- **This attribute specifies the events that trigger the blender.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- There are four stimulus inputs that can each select a different event.Use none to disable the blender input.The event parameter may be any of the trigger events shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/77678.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[3].mode = digio.MODE_TRIGGER_IN
--- digio.line[5].mode = digio.MODE_TRIGGER_IN
--- trigger.digin[3].edge = trigger.EDGE_FALLING
--- trigger.digin[5].edge = trigger.EDGE_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = trigger.EVENT_DIGIO3
--- trigger.blender[1].stimulus[2] = trigger.EVENT_DIGIO5
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens on line 3 or 5.
--- ```
---@type eventID[]|0
triggerblenderArr.stimulus= 0

---@class triggertimerArr
triggertimerArr = {}

---@type triggertimerArr[]
trigger.timer = {}


--- **This function clears the timer event detector and overrun indicator for the specified trigger timer number.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the timer event detector to the undetected state and resets the overrun indicator.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15793.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].clear()
--- 
--- --Clears trigger timer 1.
--- ```
function triggertimerArr.clear() end



--- **This attribute sets and reads the timer delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Once the timer is enabled, each time the timer is triggered, it uses this delay period.Assigning a value to this attribute is equivalent to:This creates a delay list of one value.Reading this attribute returns the delay interval that will be used the next time the timer is triggered.If you use the trigger timer with a trigger model, make sure the trigger timer delay is set so that the readings are paced correctly.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15794.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].delay = 50e-6
--- 
--- --Set the trigger timer 1 to delay for 50 µs.
--- ```
triggertimerArr.delay= 0



--- **This attribute sets an array of timer intervals.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Each time the timer is triggered after it is enabled, it uses the next delay period from the array. The default value is an array with one value of 10 µs.After all elements in the array have been used, the delays restart at the beginning of the list.If the array contains more than one element, the average of the delay intervals in the list must be >= 50 µs.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15795.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[3].delaylist = {50e-6, 100e-6, 150e-6}
---  
--- DelayList = trigger.timer[3].delaylist
--- for x = 1, table.getn(DelayList) do
---    print(DelayList[x])
--- end
--- 
--- --Set a delay list on trigger timer 3 with three delays (50 µs, 100 µs, and 150 µs).
--- -- 
--- --Read the delay list on trigger timer 3.
--- -- 
--- --Output:
--- --5e-05
--- --0.0001
--- --0.00015
--- ```
triggertimerArr.delaylist= 0



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If one or more trigger events were detected since the last time trigger.timer[N].wait() or trigger.timer[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15800.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.timer[3].wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 s for a trigger on timer 3.
--- --If false is returned, no trigger was detected during the 10 s timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered Trigger detection indication
---@param timeout number Maximum amount of time in seconds to wait for the trigger
function triggertimerArr.wait(timeout) end



--- **This attribute sets the number of events to generate each time the timer generates a trigger event or is enabled as a timer or alarm.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If the count is set to a number greater than 1, the timer automatically starts the next trigger timer delay at the expiration of the previous delay.Set the count to zero (0) to cause the timer to generate trigger events indefinitely.If you use the trigger timer with a trigger model, make sure the count value is the same or more than any count values expected in the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/15820.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].count)
--- 
--- --Read trigger count for timer number 1.
--- reset()
--- trigger.timer[4].reset()
--- trigger.timer[4].delay = 0.5
--- trigger.timer[4].start.stimulus = trigger.EVENT_NOTIFY8
--- trigger.timer[4].start.generate = trigger.OFF
--- trigger.timer[4].count = 20
--- trigger.timer[4].enable = trigger.ON
---  
--- trigger.model.load("Empty")
--- trigger.model.setblock(1, trigger.BLOCK_BUFFER_CLEAR, defbuffer1)
--- trigger.model.setblock(2, trigger.BLOCK_NOTIFY, trigger.EVENT_NOTIFY8)
--- trigger.model.setblock(3, trigger.BLOCK_WAIT, trigger.EVENT_TIMER4)
--- trigger.model.setblock(4, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1)
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_COUNTER, 20, 3)
--- trigger.model.initiate()
--- waitcomplete()
--- print(defbuffer1.n)
--- 
--- --Reset the instrument.
--- --Reset trigger timer 4.
--- --Set trigger timer 4 to have a 0.5 s delay.
--- --Set the stimulus for trigger timer 4 to be the notify 8 event.
--- --Set the timer event to occur when the timer delay elapses.
--- --Set the trigger timer 4 count to 20.
--- --Enable trigger timer 4.
--- -- 
--- --Clear the trigger model.
--- --Set trigger model block 1 to clear the buffer.
--- --Set trigger model block 2 to generate the notify 8 event.
--- --Set trigger model block 3 to wait for the trigger timer 4 to occur.
--- --Set trigger model block 4 to make or digitize a measurement and store it in default buffer 1.
--- --Set trigger model block 5 to repeat the trigger model 20 times, starting at block 3.
--- --Start the trigger model.
--- --Wait until all commands are complete.
--- --Print the number of entries in default buffer 1.
--- -- 
--- --Output:
--- --20
--- ```
triggertimerArr.count= 0


trigger.OFFE = nil
trigger.ON = nil

---@alias triggertimerenablestate
---|`trigger.OFFE`
---|`trigger.ON`



--- **This attribute enables the trigger timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the timer performs the delay operation.When this command is set to off, there is no timer on the delay operation.You must enable a timer before it can use the delay settings or the alarm configuration. For expected results from the timer, it is best to disable the timer before changing a timer setting, such as delay or start seconds.To use the timer as a simple delay or pulse generator with digital I/O lines, make sure the timer start time in seconds and fractional seconds is configured for a time in the past. To use the timer as an alarm, configure the timer start time in seconds and fractional seconds for the desired alarm time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30576.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[3].enable = trigger.ON
--- 
--- --Enable the trigger timer for timer 3.
--- ```
---@type triggertimerenablestate
triggertimerArr.enable= 0



--- **This function resets trigger timer settings to their default values.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.timer[N].reset() function resets the following attributes to their default values:It also clears trigger.timer[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31076.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].reset()
--- 
--- --Resets the attributes associated with timer 1 to their default values.
--- ```
function triggertimerArr.reset() end

---@class dmm.measure
dmm.measure = {}


--- **This attribute sets the simulated reference temperature of the thermocouple reference junction.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute applies to the temperature function when the transducer type is set to thermocouple and the reference junction is set to simulated. It allows you to set the simulated reference temperature value.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/16068.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THERMOCOUPLE
--- dmm.measure.unit = dmm.UNIT_CELSIUS
--- dmm.measure.simreftemperature = 30
--- 
--- --Sets 30 degrees Celsius as the simulated reference temperature for thermocouples.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THERMOCOUPLE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THERMOCOUPLE, dmm.THERMOCOUPLE_J, dmm.ATTR_MEAS_SIM_REF_TEMP, 30)
--- 
--- --For channels 1 through 5, set the measure function to temperature.
--- --Set the transducer type to thermocouple. Set the thermocouple type to J with a simulated reference temperature of 30.
--- ```
dmm.measure.simreftemperature = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31441.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("Empty")
--- dmm.measure.userdelay[1] = 5
--- trigger.model.setblock(1, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M1)
--- trigger.model.setblock(2, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(3, trigger.BLOCK_BRANCH_COUNTER, 10, 1)
--- trigger.model.initiate()
--- 
--- --Set user delay 1 for measurements to 5 s.
--- --Set trigger block 1 to a dynamic delay that calls user delay 1.
--- --Set trigger block 2 to make or digitize a measurement.
--- --Set trigger block 3 to branch to block 1 ten times.
--- --Start the trigger model.
--- ```
---@type integer[]
dmm.measure.userdelay= 0



--- **This function initiates measurements and returns the last actual measurement and time information in UTC format without using the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates measurements using the present function setting, stores the readings in a reading buffer, and returns the last reading.The dmm.measure.count attribute determines how many measurements are performed.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31457.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.measure.readwithtime(defbuffer1))
--- 
--- --Print the last measurement and time information from defbuffer1 in UTC format, which will look similar to:
--- ---1.405293589829e-11  1400904629  0.1950935
--- ```
---@return number reading The last reading of the measurement process
---@return number seconds Seconds in UTC format
---@return number fractional Fractional seconds
---@overload fun(bufferName:bufferMethods):number
function dmm.measure.readwithtime() end


--- **This attribute selects the active measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this command to the type of measurement you want to make.Reading this command returns the measure function that is presently active.When you select a function, settings for other commands that are related to the function become active. For example, assume that:If you return to the current function, the math function returns to reciprocal. If you then switch from the current function to the voltage function, the math function returns to percent. All attributes that begin with dmm.measure. are saved with the active measure function unless otherwise indicated in the command description.If a digitize measurement function is active, calling this command returns dmm.FUNC_NONE. The no function setting is automatically made if you select a function with dmm.digitize.func or through the options from the front-panel Digitize Functions tab.If a channel is closed when you assign a function to the channel, all other channels are opened.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/40942.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_PERCENT
--- dmm.measure.math.enable = dmm.ON
--- dmm.measure.func = dmm.FUNC_RESISTANCE
--- dmm.measure.math.format = dmm.MATH_RECIPROCAL
--- dmm.measure.math.enable = dmm.ON
--- print(dmm.measure.math.format)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- print(dmm.measure.math.format)
--- 
--- --Sets the instrument to measure voltage and set the math format to percent and enable the math functions.
--- --Set the instrument to measure resistance and set the math format to reciprocal and enable the math functions.
--- --Print the math format while the resistance measurement function is selected. The output is:
--- --dmm.MATH_RECIPROCAL
--- --Change the function to voltage. Print the math format. The output is:
--- --dmm.MATH_PERCENT
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- 
--- --For channels 1 through 9, set the DMM function to DC voltage.
--- --Set the range to 5 V, which selects the 10 V range.
--- --Set NPLC to 0.5.
--- --Set the number of display digits to 5½.
--- ```
dmm.measure.func = 0



--- **This function makes measurements, places them in a reading buffer, and returns the last reading.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates measurements using the present function setting, stores the readings in a reading buffer, and returns the last reading.The dmm.measure.count attribute determines how many measurements are made.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/40948.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- voltMeasBuffer = buffer.make(10000)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- print(dmm.measure.read(voltMeasBuffer))
--- 
--- --Create a buffer named voltMeasBuffer. Set the instrument to measure voltage.
--- --Make a measurement that is stored in the voltMeasBuffer and is also printed.
--- reset()
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.close("101")
--- print(dmm.measure.read())
--- 
--- --Set up channel 101 to measure DC voltage.
--- --Close channel 101.
--- --Make a measurement on the closed channel.
--- ```
---@return any reading The last reading of the measurement process
---@param bufferName any The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is defined, it defaults to defbuffer1
---@overload fun():any
function dmm.measure.read(bufferName) end

dmm.DIGITS_3_54 = nil
dmm.DIGITS_4_55 = nil
dmm.DIGITS_5_56 = nil
dmm.DIGITS_6_5 = nil

---@alias dmmmeasuredisplaydigitsvalue
---|`dmm.DIGITS_3_54`
---|`dmm.DIGITS_4_55`
---|`dmm.DIGITS_5_56`
---|`dmm.DIGITS_6_5`



--- **This attribute determines the number of digits that are displayed for measurements on the front panel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41099.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.displaydigits = dmm.DIGITS_5_5
--- 
--- --Set the measurement function to voltage with a front-panel display resolution of 5½.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- 
--- --For channels 1 through 9, set the DMM function to DC voltage.
--- --Set the range to 5 V, which selects the 10 V range.
--- --Set NPLC to 0.5.
--- --Set the number of display digits to 5½.
--- ```
---@type dmmmeasuredisplaydigitsvalue
dmm.measure.displaydigits = 0


dmm.OFFS = nil
dmm.ON = nil

---@alias dmmmeasureautorangestate
---|`dmm.OFFS`
---|`dmm.ON`



--- **This attribute determines if the measurement range is set manually or automatically for the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines how the range is selected.When this command is set to off, you must set the range. If you do not set the range, the instrument remains at the range that was last selected by autorange.When this command is set to on, the instrument automatically goes to the most sensitive range to perform the measurement.If a range is manually selected through the front panel or a remote command, this command is automatically set to off.Autorange selects the best range in which to measure the signal that is applied to the input terminals of the instrument. When autorange is enabled, the range increases at 120 percent of range. The range decreases occur when the reading is <10 percent of nominal range. For example, if you are on the 1 V range and autorange is enabled, the instrument autoranges up to the 10 V range when the measurement exceeds 1.2 V. It autoranges down to the 100 mV range when the measurement falls below 1 V.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41117.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.autorange = dmm.ON
--- 
--- --Select the measurement function to be DC voltage. Set autorange on.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE_AUTO, dmm.ON)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the channels to autorange.
--- ```
---@type dmmmeasureautorangestate
dmm.measure.autorange = 0



--- **This function determines the aperture setting for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The aperture sets the amount of time the ADC takes when making a measurement, which is the integration period for the selected measurement function. The integration period is specified in seconds. In general, a short integration period provides a fast reading rate, while a long integration period provides better accuracy. The selected integration period is a compromise between speed and accuracy.During the integration period, if an external trigger with a count of 1 is sent, the trigger is ignored. If the count is set to more than 1, the first reading is initialized by this trigger. Subsequent readings occur as rapidly as the instrument can make them. If a trigger occurs during the group measurement, the trigger is latched and another group of measurements with the same count will be triggered after the current group completes.You can also set the integration rate by setting the number of power-line cycles (NPLCs). Changing the NPLC value changes the aperture time and changing the aperture time changes the NPLC value.To calculate the aperture based on the NPLC value, use the following formula.where:If you set the NPLCs, the aperture setting changes to reflect that value. If you set the aperture, the NPLC setting is changed.For the AC voltage and AC current functions, the aperture value is fixed and cannot be changed.If line synchronization is enabled, the integration period does not start until the beginning of the next power-line cycle. For example, if a reading is triggered at the positive peak of a power-line cycle, the integration period does not start until that power-line cycle is completed. The integration period starts when the positive-going sine wave crosses 0 volts.To see the line frequency that is auto-detected by the instrument, use the localnode.linefreq command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41141.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.aperture = 0.0035
--- 
--- --Set the aperture to 3.5 ms.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_APERTURE, 0.0035)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the aperture to 3.5 ms.
--- ```
dmm.measure.aperture = 0



--- **This attribute defines the decibel (dB) reference setting for the DMM in volts.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This value only applies when the unit setting for the function is set to decibels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41144.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.unit = dmm.UNIT_DB
--- dmm.measure.dbreference = 5
--- 
--- --Sets the units to decibel and sets the dB reference to 5 for DC volts.
--- channel.setdmm("201:210", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("201:210", dmm.ATTR_MEAS_UNIT, dmm.UNIT_DB)
--- channel.setdmm("201:210", dmm.ATTR_MEAS_DB_REFERENCE, 5)
--- 
--- --For channels 1 through 10 on slot 2, set the DMM function to DC voltage.
--- --Set the units to decibels.
--- --Set the dB reference to 5 V.
--- ```
dmm.measure.dbreference = 0


dmm.DETECTBW_3HZ30 = nil
dmm.DETECTBW_30HZ300 = nil
dmm.DETECTBW_300HZ = nil

---@alias dmmmeasuredetectorbandwidthvalue
---|`dmm.DETECTBW_3HZ30`
---|`dmm.DETECTBW_30HZ300`
---|`dmm.DETECTBW_300HZ`



--- **This attribute selects the detector bandwidth for AC current and AC voltage measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can set the detector bandwidth to improve measurement accuracy. Select the bandwidth that contains the lowest frequency component of the input signal. For example, if the lowest frequency component of your input signal is 40 Hz, use a bandwidth setting of 30 Hz.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41147.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_AC_CURRENT
--- dmm.measure.detectorbandwidth = dmm.DETECTBW_3HZ
--- 
--- --Set the measure function to AC current.
--- --Set the bandwidth to 3 Hz.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_AC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DETECTBW, dmm.DETECTBW_3HZ)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to AC voltage. Set the measure function to AC current.
--- ```
---@type dmmmeasuredetectorbandwidthvalue
dmm.measure.detectorbandwidth = 0


dmm.RTD_PT100PT385 = nil
dmm.RTD_PT385PT3916 = nil
dmm.RTD_PT3916D100 = nil
dmm.RTD_D100F100 = nil
dmm.RTD_F100U = nil
dmm.RTD_USER = nil

---@alias dmmmeasurefourrtdRTDType
---|`dmm.RTD_PT100PT385`
---|`dmm.RTD_PT385PT3916`
---|`dmm.RTD_PT3916D100`
---|`dmm.RTD_D100F100`
---|`dmm.RTD_F100U`
---|`dmm.RTD_USER`



--- **This attribute defines the type of 4-wire RTD that is being used**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type must be set to temperature and the transducer must be set to 4-wire RTD before you can set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41175.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_FOURRTD
--- dmm.measure.fourrtd = dmm.RTD_PT3916
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 4-wire RTD.
--- --Set the RTD type to PT3916.
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_FOURRTD)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FOUR_RTD, dmm.RTD_PT3916)
--- 
--- --For channels 1 through 4, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD. Set the RTD type to PT3916.
--- ```
---@type dmmmeasurefourrtdRTDType
dmm.measure.fourrtd = 0


dmm.RTD_PT100PT385 = 3
dmm.RTD_PT385PT3916 = nil
dmm.RTD_PT3916D100 = nil
dmm.RTD_D100F100 = nil
dmm.RTD_F100U = nil
dmm.RTD_USER = nil

---@alias dmmmeasurethreertdvalue
---|`dmm.RTD_PT100PT385`
---|`dmm.RTD_PT385PT3916`
---|`dmm.RTD_PT3916D100`
---|`dmm.RTD_D100F100`
---|`dmm.RTD_F100U`
---|`dmm.RTD_USER`



--- **This attribute defines the type of three-wire RTD that is being used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type must be set to temperature and the transducer must be set to 3-wire RTD before you can set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41176.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THREERTD
--- dmm.measure.threertd = dmm.RTD_D100
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to D100.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THREERTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THREE_RTD, dmm.RTD_D100)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD. Set the RTD type to D100.
--- ```
---@type dmmmeasurethreertdvalue
dmm.measure.threertd = 0


dmm.TRANS_THERMOCOUPLET = nil
dmm.TRANS_THERMISTOR2 = nil
dmm.TRANS_TWORTD3 = nil
dmm.TRANS_THREERTD4 = nil
dmm.TRANS_FOURRTD = nil

---@alias dmmmeasuretransducertype
---|`dmm.TRANS_THERMOCOUPLET`
---|`dmm.TRANS_THERMISTOR2`
---|`dmm.TRANS_TWORTD3`
---|`dmm.TRANS_THREERTD4`
---|`dmm.TRANS_FOURRTD`



--- **This attribute sets the transducer type for the temperature measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type determines the type of temperature measurement that is made. Each transducer type has related settings that must also be set. For example, thermocouple measurements are only made if the type is set is set to thermocouple. You also need to set the thermocouple type when setting up a thermocouple. For the RTD transducer types, you also set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41181.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THREERTD
--- dmm.measure.threertd = dmm.RTD_D100
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to D100.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THREERTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THREE_RTD, dmm.RTD_D100)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to D100.
--- ```
---@type dmmmeasuretransducertype
dmm.measure.transducer = 0



--- **This attribute contains the alpha value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41182.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THREERTD
--- dmm.measure.threertd = dmm.RTD_USER
--- dmm.measure.rtdalpha = 0.00385
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THREERTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THREE_RTD, dmm.RTD_USER)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_ALPHA, 0.00385)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- ```
dmm.measure.rtdalpha = 0



--- **This attribute contains the beta value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41186.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THREERTD
--- dmm.measure.threertd = dmm.RTD_USER
--- dmm.measure.rtdalpha = 0.00385
--- dmm.measure.rtdbeta = 0.10863
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- --Set the beta RTD value to 0.10863.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THREERTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THREE_RTD, dmm.RTD_USER)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_ALPHA, 0.00385)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_BETA, 0.10863)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- --Set the beta RTD value to 0.10863.
--- ```
dmm.measure.rtdbeta = 0



--- **This attribute contains the delta value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41188.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THREERTD
--- dmm.measure.threertd = dmm.RTD_USER
--- dmm.measure.rtddelta = 1.49990
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the delta RTD value to 1.49990.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THREERTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THREE_RTD, dmm.RTD_USER)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_ALPHA, 0.00385)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_BETA, 0.10863)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_DELTA, 1.49990)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- --Set the beta RTD value to 0.10863.
--- --Set the delta RTD value to 1.49990.
--- ```
dmm.measure.rtddelta = 0



--- **This attribute contains the zero value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41191.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THREERTD
--- dmm.measure.threertd = dmm.RTD_USER
--- dmm.measure.rtdalpha = 0.00385
--- dmm.measure.rtdzero = 120
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- --Set the zero RTD value to 120.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THREERTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THREE_RTD, dmm.RTD_USER)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_ALPHA, 0.00385)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_BETA, 0.10863)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_DELTA, 1.49990)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_RTD_ZERO, 120)
--- 
--- --For channels 1 through 10, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD.
--- --Set the RTD type to User.
--- --Set the alpha RTD value to 0.00385.
--- --Set the beta RTD value to 0.10863.
--- --Set the delta RTD value to 1.49990.
--- --Set the zero RTD value to 120.
--- ```
dmm.measure.rtdzero = 0


dmm.THERM_22525000 = nil
dmm.THERM_500010000 = nil
dmm.THERM_10000 = nil

---@alias dmmmeasurethermistorvalue
---|`dmm.THERM_22525000`
---|`dmm.THERM_500010000`
---|`dmm.THERM_10000`



--- **This attribute describes the type of thermistor.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only applicable when the transducer type is set to thermistor.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41192.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THERMISTOR
--- dmm.measure.thermistor = dmm.THERM_2252
--- 
--- --Set measurement function to temperature.
--- --Set the transducer type to thermistor.
--- --Set the thermistor type to 2252.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THERMISTOR)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THERMISTOR, dmm.THERM_2252)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD. Set the RTD type to User. Set the alpha RTD value to 0.00385.
--- ```
---@type dmmmeasurethermistorvalue
dmm.measure.thermistor = 0


dmm.THERMOCOUPLE_B = nil
dmm.THERMOCOUPLE_E = nil
dmm.THERMOCOUPLE_J = nil
dmm.THERMOCOUPLE_K = nil
dmm.THERMOCOUPLE_N = nil
dmm.THERMOCOUPLE_R = nil
dmm.THERMOCOUPLE_S = nil
dmm.THERMOCOUPLE_T = nil

---@alias dmmmeasurethermocouplevalue
---|`dmm.THERMOCOUPLE_B`
---|`dmm.THERMOCOUPLE_E`
---|`dmm.THERMOCOUPLE_J`
---|`dmm.THERMOCOUPLE_K`
---|`dmm.THERMOCOUPLE_N`
---|`dmm.THERMOCOUPLE_R`
---|`dmm.THERMOCOUPLE_S`
---|`dmm.THERMOCOUPLE_T`



--- **This attribute indicates the thermocouple type.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only applicable when the transducer type is set to thermocouple.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41197.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THERMOCOUPLE
--- dmm.measure.thermocouple = dmm.THERMOCOUPLE_J
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to thermocouple.
--- --Set the thermocouple type to J.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THERMOCOUPLE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THERMOCOUPLE, dmm.THERMOCOUPLE_J)
--- 
--- --For channels 1 through 5, set the measure function to temperature.
--- --Set the transducer type to thermocouple. Set the thermocouple type to J.
--- ```
---@type dmmmeasurethermocouplevalue
dmm.measure.thermocouple = 0


dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasurelinesyncstate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute determines if line synchronization is used during the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When line synchronization is enabled, measurements are initiated at the first positive-going zero crossing of the power line cycle after the trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41233.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.linesync = dmm.ON
--- 
--- --Set line synchronization on for DC current measurements.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_LINE_SYNC, dmm.ON)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set line synchronization on.
--- ```
---@type dmmmeasurelinesyncstate
dmm.measure.linesync = 0



--- **This attribute sets the number of measurements to make when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the number of measurements that are made when a measurement is requested. This command does not affect the trigger model.When dmm.measure.count or if the function for dmm.measure.setattribute is the active function, this command sets the count for all measure functions. When you send dmm.measure.setattribute for a function that is not active, only the count for the specified function is changed.If you set the count to a value that is larger than the capacity of the reading buffer and the buffer fill mode is set to continuous, the buffer wraps until the number of readings specified have occurred. The earliest readings in the count are overwritten. If the buffer is set to fill once, readings stop when the buffer is filled, even if the count is not complete.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41296.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.count = 10
--- dmm.measure.read()
--- 
--- --Set the instrument to make 10 measurements.
--- --Request 10 measurements.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_COUNT, 5)
--- 
--- --For channels 1 through 10, set the DMM function to DC voltage.
--- --Set the range to 5 V, which selects the 10 V range.
--- --Set NPLC to 0.5.
--- --Set the number of measurements to 5.
--- ```
dmm.measure.count = 0



--- **This command sets the time that the input signal is measured for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the amount of time that the input signal is measured.The amount of time is specified as the number of power line cycles (NPLCs). Each PLC for 60 Hz is 16.67 ms (1/60) and each PLC for 50 Hz or 400 Hz is 20 ms (1/50). For 60 Hz, if you set the NPLC to 0.1, the measure time is 1.667 ms.The shortest amount of time results in the fastest reading rate but increases the reading noise and decreases the number of usable digits.The longest amount of time provides the lowest reading noise and more usable digits but has the slowest reading rate.Settings between the fastest and slowest number of power line cycles are a compromise between speed and noise.If you change the PLCs, you may want to adjust the displayed digits to reflect the change in usable digits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41301.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.nplc = 0.5
--- 
--- --Sets the measurement function to DC voltage. Set the NPLC value to 0.5.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- 
--- --For channels 1 through 9, set the DMM function to DC voltage.
--- --Set the range to 5 V, which selects the 10 V range.
--- --Set NPLC to 0.5.
--- --Set the number of display digits to 5½.
--- ```
dmm.measure.nplc = 0


dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasureopendetectorstate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute determines if the detection of open leads is enabled or disabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For temperature measurements, this is only available when the transducer is set to a thermocouple or one of the RTDs.Long lengths of thermocouple wire can have a large amount of capacitance, which is seen at the input of the DMM. If an intermittent open occurs in the thermocouple circuit, the capacitance can cause an erroneous on-scale reading. The open thermocouple detection circuit, when enabled, applies a 100 µA pulse of current to the thermocouple before the start of each temperature measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41303.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THERMOCOUPLE
--- dmm.measure.opendetector = dmm.OFF
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to thermocouple.
--- --Set open lead detection off.
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THERMOCOUPLE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_OPEN_DETECTOR, dmm.OFF)
--- 
--- --For channels 1 through 4, set the measure function to temperature.
--- --Set the transducer type to thermocouple. Set open lead detection off.
--- ```
---@type dmmmeasureopendetectorstate
dmm.measure.opendetector = 0



--- **This attribute determines the positive full-scale measure range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can assign any real number using this command. The instrument selects the closest fixed range that is large enough to measure the entered number. For example, for current measurements, if you expect a reading of approximately 9 mA, set the range to 9 mA to select the 10 mA range. When you read this setting, you see the positive full-scale value of the measurement range that the instrument is presently using.This command is primarily intended to eliminate the time that is required by the instrument to automatically search for a range.When a range is fixed, any signal greater than the entered range generates an overrange condition. When an overrange condition occurs, the front panel displays "Overflow" and the remote interface returns 9.9e+37.The following table lists the ranges for each function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41304.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_AC_VOLTAGE
--- dmm.measure.range = 90
--- print(dmm.measure.range)
--- 
--- --Set the range to 90 V, which selects the 100 V range.
--- --Output:
--- --100
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- 
--- --For channels 1 through 9, set the DMM function to DC voltage.
--- --Set the range to 5 V, which selects the 10 V range.
--- --Set NPLC to 0.5.
--- --Set the number of display digits to 5½.
--- ```
dmm.measure.range = 0


dmm.UNIT_VOLT = nil
dmm.UNIT_DB = nil
dmm.UNIT_DBMF = nil
dmm.UNIT_CELSIUS = nil
dmm.UNIT_KELVIN = nil
dmm.UNIT_FAHRENHEIT = nil

---@alias dmmmeasureunitvalue
---|`dmm.UNIT_VOLT`
---|`dmm.UNIT_DB`
---|`dmm.UNIT_DBMF`
---|`dmm.UNIT_CELSIUS`
---|`dmm.UNIT_KELVIN`
---|`dmm.UNIT_FAHRENHEIT`



--- **This attribute sets the units of measurement that are displayed on the front panel of the instrument and stored in the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change in measurement units is displayed when the next measurement is made. You can only change the units for the listed functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41308.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.unit = dmm.UNIT_DB
--- 
--- --Changes the front-panel display and buffer readings for voltage measurements to be displayed as decibel readings.
--- channel.setdmm("201:210", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("201:210", dmm.ATTR_MEAS_UNIT, dmm.UNIT_DB)
--- channel.setdmm("201:210", dmm.ATTR_MEAS_DB_REFERENCE, 5)
--- 
--- --For channels 1 through 10 on slot 2, set the DMM function to DC voltage.
--- --Set the units to decibels.
--- --Set the dB reference to 5 V.
--- ```
---@type dmmmeasureunitvalue
dmm.measure.unit = 0


dmm.DELAY_OND = nil
dmm.DELAY_OFF = nil

---@alias dmmmeasureautodelayvalue
---|`dmm.DELAY_OND`
---|`dmm.DELAY_OFF`



--- **This attribute enables or disables the automatic delay that occurs before each measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is enabled, a delay is added after a range or function change to allow the instrument to settle.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41421.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_RESISTANCE
--- dmm.measure.autodelay = dmm.DELAY_ON
--- dmm.measure.count = 10
--- ReadingBufferOne = buffer.make(1000)
--- dmm.measure.read(ReadingBufferOne)
--- 
--- --Set the instrument to measure 2-wire ohms.
--- --Turn automatic delay on.
--- --Create a buffer named ReadingBufferOne.
--- --Set the number of measurements to 10.
--- --Make 10 measurements and store them in the reading buffer.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_DELAY, dmm.DELAY_OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the range to 5 V, which selects the 10 V range.
--- --Set auto delay off.
--- ```
---@type dmmmeasureautodelayvalue
dmm.measure.autodelay = 0


dmm.IMPEDANCE_10MA = nil
dmm.IMPEDANCE_AUTO = nil

---@alias dmmmeasureinputimpedancesetting
---|`dmm.IMPEDANCE_10MA`
---|`dmm.IMPEDANCE_AUTO`



--- **This attribute determines when the 10 MΩ input divider is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Choosing automatic input impedance is a balance between achieving low DC voltage noise on the 100 mV and 1 V ranges and optimizing measurement noise due to charge injection. The DAQ6510 is optimized for low noise and charge injection when the DUT has less than 100 kΩ input resistance. When the DUT input impedance is more than 100 kΩ, selecting an input impedance of 10 MΩ optimizes the measurement for lowest noise on the 100 mV and 1 V ranges. You can achieve short-term low noise and low charge injection on the 100 mV and 1 V ranges with autozero off. For the 10 V to 1000 V ranges, both input impedance settings achieve low charge injection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/44539.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.inputimpedance = dmm.IMPEDANCE_AUTO
--- 
--- --Set input impedance to be set automatically when the DC voltage function is selected.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_INPUT_IMPEDANCE, dmm.IMPEDANCE_AUTO)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set input impedance to be set automatically.
--- ```
---@type dmmmeasureinputimpedancesetting
dmm.measure.inputimpedance = 0


dmm.REFJUNCT_SIMULATED = nil
dmm.REFJUNCT_INTERNAL = nil
dmm.REFJUNCT_EXTERNAL = nil

---@alias dmmmeasurerefjunctiontype
---|`dmm.REFJUNCT_SIMULATED`
---|`dmm.REFJUNCT_INTERNAL`
---|`dmm.REFJUNCT_EXTERNAL`



--- **This attribute defines the type of the thermocouple reference junction.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the temperature function is selected and the transducer type is set to thermocouple.When you are making rear terminal measurements, you can select the internal or external option. When the internal option is selected, the DAQ6510 periodically updates the temperature. When the external option is selected, the temperature is updated when the external reference function channel is scanned.When you are making front terminal measurements, the only option is simulated. You can set the simulated reference temperature with the command dmm.measure.simreftemperature.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73436.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THERMOCOUPLE
--- dmm.measure.unit = dmm.UNIT_CELSIUS
--- dmm.measure.simreftemperature = 30
--- 
--- --Sets 30 degrees Celsius as the simulated reference temperature for thermocouples.
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_THERMOCOUPLE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_REF_JUNCTION, dmm.REFJUNCT_INTERNAL)
--- 
--- --Sets channels 1 to 4 of slot 1 to use thermocouples with an internal reference temperature.
--- ```
---@type dmmmeasurerefjunctiontype
dmm.measure.refjunction = 0


dmm.RTD_PT100PT385 = nil
dmm.RTD_PT385PT3916 = nil
dmm.RTD_PT3916D100 = nil
dmm.RTD_D100F100 = nil
dmm.RTD_F100U = nil
dmm.RTD_USER = nil

---@alias dmmmeasuretwortdtype
---|`dmm.RTD_PT100PT385`
---|`dmm.RTD_PT385PT3916`
---|`dmm.RTD_PT3916D100`
---|`dmm.RTD_D100F100`
---|`dmm.RTD_F100U`
---|`dmm.RTD_USER`



--- **This attribute defines the type of 2-wire RTD that is being used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type must be set to temperature and the transducer must be set to 2-wire RTD before you can set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73701.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_TWORTD
--- dmm.measure.twortd = dmm.RTD_D100
--- 
--- --Set the measure function to temperature.
--- --Set the transducer type to 2-wire RTD.
--- --Set the RTD type to D100.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_TWORTD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_TWO_RTD, dmm.RTD_D100)
--- 
--- --For channels 1 through 5, set the DMM function to temperature.
--- --Set the transducer type to 2-wire RTD. Set the RTD type to D100.
--- ```
---@type dmmmeasuretwortdtype
dmm.measure.twortd = 0



--- **This attribute defines the decibel-milliwatts (dBm) reference.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This value only applied when the unit setting for the function is set to dBm.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/81432.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.unit = dmm.UNIT_DBM
--- dmm.measure.dbmreference = 85
--- 
--- --Sets the units to dBm and sets the dBm reference to 85 Ω.
--- channel.setdmm("201:210", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("201:210", dmm.ATTR_MEAS_UNIT, dmm.UNIT_DBM)
--- channel.setdmm("201:210", dmm.ATTR_MEAS_DBM_REFERENCE, 85)
--- 
--- --For channels 1 through 10 on slot 2, set the DMM function to DC voltage.
--- --Set the units to decibel-milliwatts.
--- --Set the dBm reference to 85 Ω.
--- ```
dmm.measure.dbmreference = 0



--- **This function returns the setting for a function attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The options for function are shown in the following table.You can retrieve one attribute at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/91266.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.measure.getattribute(dmm.FUNC_DC_VOLTAGE, dmm.ATTR_MEAS_RANGE))
--- print(dmm.measure.getattribute(dmm.FUNC_DC_VOLTAGE, dmm.ATTR_MEAS_NPLC))
--- print(dmm.measure.getattribute(dmm.FUNC_DC_VOLTAGE, dmm.ATTR_MEAS_DIGITS))
--- 
--- --Retrieve the range, NPLC, and digits settings for the DC voltage function.
--- --Example return:
--- --0.02
--- --1
--- --dmm.DIGITS_4_5
--- ```
---@return any value The attribute value
---@param measFunction functions The measurement function; see Details
---@param setting functionAttributes The attribute for the function; refer to dmm.measure.setattribute() for available settings
function dmm.measure.getattribute(measFunction, setting) end


--- **This function allows you to set up a measure function whether or not the function is active.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The lists that follow the example and "also see" listings show the parameters that are available for each function. Each parameter includes a link to the descriptions of the corresponding TSP command descriptions. The options for each parameter are the same as the settings for the TSP commands.Aperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZEROdB reference: dmm.ATTR_MEAS_DB_REFERENCEdBm reference: dmm.ATTR_MEAS_DBM_REFERENCEDisplay digits: dmm.ATTR_MEAS_DIGITSInput impedance: dmm.ATTR_MEAS_INPUT_IMPEDANCELine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOdB reference: dmm.ATTR_MEAS_DB_REFERENCEdBm reference: dmm.ATTR_MEAS_DBM_REFERENCEDetector bandwidth: dmm.ATTR_MEAS_DETECTBWDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTODetector bandwidth: dmm.ATTR_MEAS_DETECTBWDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_N2-wire RTD type: dmm.ATTR_MEAS_TWO_RTD3-wire RTD type: dmm.ATTR_MEAS_THREE_RTD4-wire RTD type: dmm.ATTR_MEAS_FOUR_RTDAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCOffset Compensation: dmm.ATTR_MEAS_OFFCOMP_ENABLEOpen lead detector: dmm.ATTR_MEAS_OPEN_DETECTORReference junction: dmm.ATTR_MEAS_REF_JUNCTIONRTD Alpha: dmm.ATTR_MEAS_RTD_ALPHARTD Beta: dmm.ATTR_MEAS_RTD_BETARTD Delta: dmm.ATTR_MEAS_RTD_DELTARTD Zero: dmm.ATTR_MEAS_RTD_ZEROSimulated reference temperature: dmm.ATTR_MEAS_SIM_REF_TEMPThermistor: dmm.ATTR_MEAS_THERMISTORThermocouple: dmm.ATTR_MEAS_THERMOCOUPLETransducer: dmm.ATTR_MEAS_TRANSDUCERUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCOffset compensation: dmm.ATTR_MEAS_OFFCOMP_ENABLEOpen lead detector: dmm.ATTR_MEAS_OPEN_DETECTORRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto zero: dmm.ATTR_MEAS_AUTO_ZEROBias level: dmm.ATTR_MEAS_BIAS_LEVELDisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTODisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYDisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTThreshold autorange: dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTOThreshold range: dmm.ATTR_MEAS_THRESHOLD_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYMeasure count: dmm.ATTR_MEAS_COUNTThreshold autorange: dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTOThreshold range: dmm.ATTR_MEAS_THRESHOLD_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGESense range (read only): dmm.ATTR_MEAS_SENSE_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_DIGI_APERTURECount: dmm.ATTR_DIGI_COUNTDisplay digits: dmm.ATTR_DIGI_DIGITSRange: dmm.ATTR_DIGI_RANGESample rate: dmm.ATTR_DIGI_SAMPLE_RATEUnit: dmm.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): dmm.ATTR_DIGI_USER_DELAY_NAperture: dmm.ATTR_DIGI_APERTURECount: dmm.ATTR_DIGI_COUNTDecibel reference: dmm.ATTR_DIGI_DB_REFERENCEDecibel-milliwatts reference: dmm.ATTR_DIGI_DBM_REFERENCEDisplay digits: dmm.ATTR_DIGI_DIGITSInput impedance: dmm.ATTR_DIGI_INPUT_IMPEDANCERange: dmm.ATTR_DIGI_RANGERelative enable: dmm.ATTR_DIGI_REL_ENABLERelative level: dmm.ATTR_DIGI_REL_LEVELSample rate: dmm.ATTR_DIGI_SAMPLE_RATEUnit: dmm.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): dmm.ATTR_DIGI_USER_DELAY_NEnable math: dmm.ATTR_MEAS_MATH_ENABLEb (offset) value: dmm.ATTR_MEAS_MATH_MXB_BFm (scalar) value: dmm.ATTR_MEAS_MATH_MXB_MFMath format: dmm.ATTR_MEAS_MATH_FORMATPercent: dmm.ATTR_MEAS_MATH_PERCENTEnable math: dmm.ATTR_DIGI_MATH_ENABLEb (offset) value: dmm.ATTR_DIGI_MATH_MXB_BFm (scalar) value: dmm.ATTR_DIGI_MATH_MXB_MFMath format: dmm.ATTR_DIGI_MATH_FORMATPercent: dmm.ATTR_DIGI_MATH_PERCENTLimit 1 audible: dmm.ATTR_MEAS_LIMIT_AUDIBLE_1Limit 1 auto clear: dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_1Limit 1 enable: dmm.ATTR_MEAS_LIMIT_ENABLE_1Limit 1 fail: dmm.ATTR_MEAS_LIMIT_FAIL_1Limit 1 high value: dmm.ATTR_MEAS_LIMIT_HIGH_1Limit 1 low value: dmm.ATTR_MEAS_LIMIT_LOW_1Limit 2 audible: dmm.ATTR_MEAS_LIMIT_AUDIBLE_2Limit 2 auto clear: dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_2Limit 2 enable: dmm.ATTR_MEAS_LIMIT_ENABLE_2Limit 2 fail: dmm.ATTR_MEAS_LIMIT_FAIL_2Limit 2 high value: dmm.ATTR_MEAS_LIMIT_HIGH_2Limit 2 low value: dmm.ATTR_MEAS_LIMIT_LOW_2Limit 1 audible: dmm.ATTR_DIGI_LIMIT_AUDIBLE_1Limit 1 auto clear: dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_1Limit 1 enable: dmm.ATTR_DIGI_LIMIT_ENABLE_1Limit 1 fail: dmm.ATTR_DIGI_LIMIT_FAIL_1Limit 1 high value: dmm.ATTR_DIGI_LIMIT_HIGH_1Limit 1 low value: dmm.ATTR_DIGI_LIMIT_LOW_1Limit 2 audible: dmm.ATTR_DIGI_LIMIT_AUDIBLE_2Limit 2 auto clear: dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_2Limit 2 enable: dmm.ATTR_DIGI_LIMIT_ENABLE_2Limit 2 fail: dmm.ATTR_DIGI_LIMIT_FAIL_2Limit 2 high value: dmm.ATTR_DIGI_LIMIT_HIGH_2Limit 2 low value: dmm.ATTR_DIGI_LIMIT_LOW_2Edge level: dmm.ATTR_MEAS_ATRIG_EDGE_LEVELEdge slope: dmm.ATTR_MEAS_ATRIG_EDGE_SLOPEMode: dmm.ATTR_DIGI_ATRIG_MODEWindow direction: dmm.ATTR_MEAS_ATRIG_WINDOW_DIRECTIONWindow level high: dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_HIGHWindow level low: dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_LOWEdge level: dmm.ATTR_DIGI_ATRIG_EDGE_LEVELEdge slope: dmm.ATTR_DIGI_ATRIG_EDGE_SLOPEMode: dmm.ATTR_DIGI_ATRIG_MODEWindow direction: dmm.ATTR_DIGI_ATRIG_WINDOW_DIRECTIONWindow level high: dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_HIGHWindow level low: dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_LOWFilter enable: dmm.ATTR_MEAS_FILTER_ENABLEFilter count: dmm.ATTR_MEAS_FILTER_COUNTFilter type: dmm.ATTR_MEAS_FILTER_TYPEFilter window: dmm.ATTR_MEAS_FILTER_WINDOWRelative offset enable: dmm.ATTR_MEAS_REL_ENABLERelative offset method (DCV ratio measurements only): dmm.ATTR_MEAS_REL_METHODRelative offset value: dmm.ATTR_MEAS_REL_LEVELRelative offset enable: dmm.ATTR_DIGI_REL_ENABLERelative offset value: dmm.ATTR_DIGI_REL_LEVEL
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/91267.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.setattribute(dmm.FUNC_DC_CURRENT, dmm.ATTR_MEAS_RANGE, 35e-6)
--- dmm.measure.setattribute(dmm.FUNC_DC_CURRENT, dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- dmm.measure.setattribute(dmm.FUNC_DC_CURRENT, dmm.ATTR_MEAS_NPLC, 0.5)
--- dmm.measure.configlist.create("measlist")
--- dmm.measure.configlist.storefunc("measlist", dmm.FUNC_DC_CURRENT)
--- 
--- --Configure the DC Current function settings for the range, display resolution, and number of power line cycles (NPLCs) whether or not DC Current is the active function.
--- --Create a configuration list named measlist.
--- --Save the settings into measlist.
--- ```
---@param measFunction functions The function for which you are setting parameters; see Functions
---@param setting functionAttributes The parameter for the function; refer to Details and the tables following the examples
---@param value any The parameter value
function dmm.measure.setattribute(measFunction, setting, value) end
---@class trigger.model
trigger.model = {}


--- **This function stops all trigger model commands and scans on the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When this command is received, the instrument stops the trigger model and scans.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25628.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.abort()
--- 
--- --Terminates all commands related to the trigger model and scans on the instrument.
--- ```
function trigger.model.abort() end

trigger.STATE_ABORTED = nil
trigger.STATE_ABORTING = nil
trigger.STATE_BUILDING = nil
trigger.STATE_EMPTY = nil
trigger.STATE_FAILED = nil
trigger.STATE_IDLE = nil
trigger.STATE_PAUSED = nil
trigger.STATE_RUNNING = nil
trigger.STATE_WAITING = nil

---@alias triggermodelstatestatus
---|`trigger.STATE_ABORTED`
---|`trigger.STATE_ABORTING`
---|`trigger.STATE_BUILDING`
---|`trigger.STATE_EMPTY`
---|`trigger.STATE_FAILED`
---|`trigger.STATE_IDLE`
---|`trigger.STATE_PAUSED`
---|`trigger.STATE_RUNNING`
---|`trigger.STATE_WAITING`



--- **This function returns the present state of the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command returns the state of the trigger model. The instrument checks the state of a started trigger model every 100 ms.This command returns the trigger state and the block that the trigger model last executed. If the trigger model supports a scan, three states and two block numbers are returned.The trigger model states are:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25741.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.model.state())
--- 
--- --An example output if the trigger model is waiting and is at block 9 would be:
--- --trigger.STATE_WAITING trigger.STATE_EMPTY 9
--- ```
---@return triggermodelstatestatus status The status of the trigger model
---@return any n The last trigger model block that was executed
---@overload fun():any
function trigger.model.state() end


--- **This function returns the settings for all trigger model blocks.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This returns the settings for the trigger model.If a scan is set up, this returns two trigger models that begin with START and END blocks.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30569.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.model.getblocklist())
--- 
--- --Returns the settings for the trigger model. Example output is:
--- -- 1) BUFFER_CLEAR          BUFFER: defbuffer1
--- -- 2) MEASURE_DIGITIZE      BUFFER: defbuffer1 INITIAL MODE: MEAS INITIAL COUNT: 1
--- -- 3) BRANCH_COUNTER        VALUE: 5  BRANCH_BLOCK: 2
--- -- 4) DELAY_CONSTANT        DELAY: 1.000000000
--- -- 5) BRANCH_COUNTER        VALUE: 3  BRANCH_BLOCK: 2
--- ```
function trigger.model.getblocklist() end


--- **This function returns the count value of the trigger model counter block.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command returns the counter value. When the counter is active, this returns the present count. If the trigger model has started or is running but has not yet reached the counter block, this value is 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30570.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- trigger.model.setblock(1, trigger.BLOCK_BUFFER_CLEAR)
--- trigger.model.setblock(2, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(3, trigger.BLOCK_DELAY_CONSTANT, 0.1)
--- trigger.model.setblock(4, trigger.BLOCK_BRANCH_COUNTER, 10, 2)
--- trigger.model.initiate()
--- delay(1)
--- print(trigger.model.getbranchcount(4))
--- waitcomplete()
--- 
--- --Reset trigger model settings.
--- --Clear defbuffer1 at the beginning of the trigger model.
--- --Loop and make five readings.
--- --Delay 0.1 s.
--- --Loop ten more times back to block 2.
--- --Send the count command to check which count has been completed for block 4.
--- --At end of execution, 10 readings are stored in defbuffer1.
--- ```
---@param blockNumber number The sequence of the block in the trigger model
function trigger.model.getbranchcount(blockNumber) end


--- **This function starts the trigger model or scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30571.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function trigger.model.initiate() end


--- **This function loads a trigger-model template configuration that makes continuous measurements for a specified amount of time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you load this trigger-model template, you can specify amount of time to make a measurement and the length of the delay before the measurement.The rear-panel EXTERNAL TRIGGER OUT terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30588.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- -- Set up measure function
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- -- Initiate readings
--- trigger.model.load("DurationLoop", 10, 0.01)
--- trigger.model.initiate()
--- 
--- --Reset the instrument.
--- --Set the instrument to measure current.
--- --Load the duration loop trigger model to take measurements for 10 s with a 10 ms delay before each measurement.
--- --Start the trigger model.
--- ```
---@param DurationLoop loadFunConstParam load function constant param
---@param duration number The amount of time for which to make measurements (500 ns to 100 ks)
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@overload fun(DurationLoop:loadFunConstParam,duration:number)
---@overload fun(DurationLoop:loadFunConstParam,duration:number,delay:number)
function trigger.model.load(DurationLoop, duration, delay, bufferName) end


--- **This function loads a trigger-model template configuration that uses a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger-model template incorporates a configuration list. You must set up the configuration lists before loading the trigger model. If the configuration lists change, you must resend this command.You can also set a delay and change the reading buffer.The rear-panel EXTERNAL TRIGGER OUT terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35126.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.measure.func = dmm.FUNC_AC_CURRENT
--- dmm.measure.configlist.create("MEASURE_LIST")
--- dmm.measure.range = 1e-3
--- dmm.measure.configlist.store("MEASURE_LIST")
--- dmm.measure.range = 10e-3
--- dmm.measure.configlist.store("MEASURE_LIST")
--- dmm.measure.range = 100e-3
--- dmm.measure.configlist.store("MEASURE_LIST")
--- trigger.model.load("ConfigList", "MEASURE_LIST")
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, defbuffer1.n, defbuffer1.readings)
--- 
--- --Reset the instrument.Set the measure function to AC current.
--- --Set up a configuration list named MEASURE_LIST.
--- --Load the configuration list trigger model, using the indexes in this configuration list.
--- --Start the trigger model.
--- --Wait for the trigger model to complete.
--- --Return the results from the reading buffer.
--- --Example output:
--- --9.9246953126e-07, 6.9921188254e-06, 3.8904102673e-05
--- ```
---@param ConfigList loadFunConstParam load function constant param
---@param measureConfigList string A string that contains the name of the measurement configuration list to use
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1.
---@overload fun(ConfigList:loadFunConstParam,measureConfigList:string)
---@overload fun(ConfigList:loadFunConstParam,measureConfigList:string,delay:number)
function trigger.model.load(ConfigList, measureConfigList, delay, bufferName) end


--- **This function clears the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you load this trigger-model template, any blocks that have been defined in the trigger model are cleared so the trigger model has no blocks defined.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35127.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("Empty")
--- print(trigger.model.getblocklist())
--- 
--- --Clear the trigger model to have no blocks defined.
--- --Output:
--- --EMPTY
--- ```
---@param Empty loadFunConstParam load function constant param
function trigger.model.load(Empty) end

trigger.CLEAR_ENTERT = nil
trigger.CLEAR_NEVER = nil

---@alias triggermodelloadLogicTriggerclear
---|`trigger.CLEAR_ENTERT`
---|`trigger.CLEAR_NEVER`



--- **This function loads a trigger-model template configuration that sets up a logic trigger through the digital or external I/O.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger model waits for a digital input or external trigger input event to occur, makes a measurement, and issues a notify event. If a digital output line is selected, a notify event asserts a digital output line. A notify event asserts the external trigger output line regardless of the line settings. You can set the line to 7 to assert only the external trigger output line, or to another setting to assert both a digital output line and the external trigger output line.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/35128.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("LogicTrigger", 7, 2, 10, 0.001, defbuffer1)
--- 
--- --Set up the template to use the external in line and wait for a pulse from the external in to trigger measurements.
--- --Pulse digital output line 2 and external trigger out when the measurement is complete.
--- --Make 10 measurements, with a delay of 1 ms before each measurement.
--- --Store the measurements in defbuffer1.
--- ```
---@param LogicTrigger loadFunConstParam load function constant param
---@param digInLine number The digital input line (1 to 6) or external input line (7); also, the event that the trigger model will wait on in block 1
---@param digOutLine number The digital output line (1 to 6) or external input line (7)
---@param count number The number of measurements the instrument will make
---@param clear triggermodelloadLogicTriggerclear To clear previously detected trigger events when entering the wait block
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@overload fun(LogicTrigger:loadFunConstParam,digInLine:number,digOutLine:number,count:number,clear:triggermodelloadLogicTriggerclear)
---@overload fun(LogicTrigger:loadFunConstParam,digInLine:number,digOutLine:number,count:number,clear:triggermodelloadLogicTriggerclear,delay:number)
function trigger.model.load(LogicTrigger, digInLine, digOutLine, count, clear, delay, bufferName) end


--- **This function loads a trigger-model template configuration that makes a specific number of measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets up a loop that sets a delay, makes a measurement, and then repeats the loop the number of times you define in the Count parameter.The rear-panel EXTERNAL TRIGGER OUT terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger-model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46034.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Set up measure function
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.autorange = dmm.ON
--- dmm.measure.nplc = 1
---  
--- -- Initiate readings
--- trigger.model.load("SimpleLoop", 200)
--- trigger.model.initiate()
--- waitcomplete()
---  
--- -- Parse index and data into three columns
--- print("Rdg #", "Time (s)", "Current (A)")
--- for i = 1, defbuffer1.n do
---       print(i, defbuffer1.relativetimestamps[i], defbuffer1[i])
--- end
--- 
--- --This example uses the SimpleLoop trigger-model template to do a capacitor test. This example produces 200 readings that have output similar to the following example:
--- --Rdg   #   Time (s)   Current (A)
--- --1   0   -5.6898339156e-10
--- --2   0.022129046   -5.6432783106e-10
--- --3   0.063973966   -5.6329326206e-10
--- --. . .
--- --198   5.133657681   -5.5518916972e-10
--- --199   5.155784187   -5.6363814801e-10
--- --200   5.177910874   -5.6070686983e-10
--- ```
---@param SimpleLoop loadFunConstParam load function constant param
---@param count number The number of measurements the instrument will make
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods Indicates the reading buffer to use; the default buffers (defbuffer1 or defbuffer2) or the name of a user-defined buffer; if no buffer is specified, defbuffer1 is used
---@overload fun(SimpleLoop:loadFunConstParam,count:number)
---@overload fun(SimpleLoop:loadFunConstParam,count:number,delay:number)
function trigger.model.load(SimpleLoop, count, delay, bufferName) end

trigger.CLEAR_ENTERT = nil
trigger.CLEAR_NEVER = nil

---@alias triggermodelloadLoopUntilEventclear
---|`trigger.CLEAR_ENTERT`
---|`trigger.CLEAR_NEVER`



--- **This function loads a trigger-model template configuration that makes continuous measurements until the specified event occurs.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event constant is the event that ends infinite triggering or ends readings set to occur before the trigger and start post-trigger readings. The trigger model makes readings until it detects the event constant. After the event, it makes a finite number of readings, based on the setting of the trigger position.The position marks the location in the reading buffer where the trigger will occur. The position is set as a percentage of the buffer capacity. The buffer captures measurements until a trigger occurs. When the trigger occurs, the buffer retains the percentage of readings specified by the position, then captures remaining readings until 100 percent of the buffer is filled. For example, if this is set to 75 for a reading buffer that holds 10,000 readings, the trigger model makes 2500 readings after it detects the source event. There are 7500 pre-trigger readings and 2500 post-trigger readings.The instrument makes two sets of readings. The first set is made until the trigger event occurs. The second set is made after the trigger event occurs, up to the number of readings calculated by the position parameter.You cannot have the event constant set at none when you run this trigger-model template.The rear-panel EXTERNAL TRIGGER OUT terminal is asserted at the end of each measurement.The following table lists the options that are available for triggerEvent.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46040.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Set up measure function
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
---  
--- -- Initiate readings
--- trigger.model.load("LoopUntilEvent", trigger.EVENT_DISPLAY, 50)
--- trigger.model.initiate()
--- 
--- --Reset the instrument.
--- --Set the instrument to measure current.
--- --Load the LoopUntilEvent trigger model to make measurements until the front panel trigger key is pressed, then continue to make measurements equal to 50% of the reading buffer size.
--- --Start the trigger model.
--- ```
---@param LoopUntilEvent loadFunConstParam load function constant param
---@param triggerEvent triggerEventsForFunctionParam The event that ends infinite triggering or readings set to occur before the trigger; see Details
---@param position number The number of readings to make in relation to the size of the reading buffer; enter as a percentage (0% to 100%)
---@param clear triggermodelloadLoopUntilEventclear To clear previously detected trigger events when entering the wait block (default)
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@overload fun(LoopUntilEvent:loadFunConstParam,triggerEvent:triggerEventsForFunctionParam,position:number,clear:triggermodelloadLoopUntilEventclear)
---@overload fun(LoopUntilEvent:loadFunConstParam,triggerEvent:triggerEventsForFunctionParam,position:number,clear:triggermodelloadLoopUntilEventclear,delay:number)
function trigger.model.load(LoopUntilEvent, triggerEvent, position, clear, delay, bufferName) end


--- **This function loads a trigger-model template configuration that sets up a grading operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger-model template allows you to grade components and place them into up to four bins, based on the comparison to limits.To set a limit as unused, set the high value for the limit to be less than the low limit.All limit patterns and the pass pattern are sent on digital I/O lines 1 to 4, where 1 is the least significant bit.The rear-panel EXTERNAL TRIGGER OUT terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46058.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@param GradeBinning loadFunConstParam load function constant param
---@param components number The number of components to measure (1 to 268,435,455)
---@param startInLine number The input line that starts the test; 5 for digital line 5, 6 for digital line 6, or 7 for external in; default is 5
---@param startDelay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param endPointDelay any The delay time after the measurement (167 ns to 10 ks); default is 0 for no delay
---@param limit1Pattern number The bit pattern that is sent when the measurement fails limit 1; range 1 to 15; default is 1
---@param limit2Pattern number The bit pattern that is sent when the measurement fails limit 2; range 1 to 15; default is 2
---@param limit3Pattern number The bit pattern that is sent when the measurement fails limit 3; range 1 to 15; default is 4
---@param limit4Pattern number The bit pattern that is sent when the measurement fails limit 4; range 1 to 15; default is 8
---@param allPattern number The bit pattern that is sent when all limits have passed; 1 to 15; default is 15
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,allPattern:number)
---@overload fun(GradeBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,limit4Pattern:number,allPattern:number)
function trigger.model.load(GradeBinning, components, startInLine, startDelay, endPointDelay, limit1High, limit1Low, limit1Pattern, allPattern, limit2High, limit2Low, limit2Pattern, limit3High, limit3Low, limit3Pattern, limit4High, limit4Low, limit4Pattern, bufferName) end


--- **This function loads a trigger-model template configuration that sets up a sorting operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger-model template allows you to sort components and place them into up to four bins, based on the comparison to limits.To set a limit as unused, set the high value for the limit to be less than the low limit.All limit patterns and the all fail pattern are sent on digital I/O lines 1 to 4, where 1 is the least significant bit.The rear-panel EXTERNAL TRIGGER OUT terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46066.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@param SortBinning loadFunConstParam load function constant param
---@param components number The number of components to measure (1 to 268,435,455)
---@param limit1Pattern number The bit pattern that is sent when the measurement passes limit 1; range 1 to 15; default is 1
---@param limit2Pattern number The bit pattern that is sent when the measurement passes limit 2; range 1 to 15; default is 2
---@param limit3Pattern number The bit pattern that is sent when the measurement passes limit 3; range 1 to 15; default is 4
---@param limit4Pattern number The bit pattern that is sent when the measurement passes limit 4; range 1 to 15; default is 8
---@param allPattern number The bit pattern that is sent when all limits have failed; 1 to 15; default is 15
---@param startInLine number The input line that starts the test; 5 for digital line 5, 6 for digital line 6, or 7 for external in; default is 5
---@param startDelay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param endPointDelay any The delay time after the measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@overload fun(SortBinning:loadFunConstParam,components:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
---@overload fun(SortBinning:loadFunConstParam,components:number,limit1Pattern:number,limit2Pattern:number,limit3Pattern:number,limit4Pattern:number,allPattern:number,startInLine:number,startDelay:number,endPointDelay:any)
function trigger.model.load(SortBinning, components, startInLine, startDelay, endPointDelay, limit1High, limit1Low, limit1Pattern, allPattern, limit2High, limit2Low, limit2Pattern, limit3High, limit3Low, limit3Pattern, limit4High, limit4Low, limit4Pattern, bufferName) end


--- **This function pauses a running scan or trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command pauses the scan or trigger model.To continue the trigger model and the scan, send the resume command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72471.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- trigger.model.setblock(1, trigger.BLOCK_BUFFER_CLEAR, defbuffer1)
--- trigger.model.setblock(2, trigger.BLOCK_DELAY_CONSTANT, 0)
--- trigger.model.setblock(3, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_INFINITE)
--- trigger.model.setblock(4, trigger.BLOCK_WAIT, trigger.EVENT_DISPLAY)
--- trigger.model.setblock(5, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_STOP)
--- trigger.model.setblock(6, trigger.BLOCK_NOTIFY, trigger.EVENT_NOTIFY1)
--- trigger.model.initiate()
--- trigger.model.pause()
--- delay(10)
--- trigger.model.resume()
--- waitcomplete()
--- print(defbuffer1.n)
--- 
--- --Set up a trigger model, then run it, pause for delay of 10 seconds, then resume it.
--- ```
function trigger.model.pause() end


--- **This function continues a paused scan or trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command continues running the scan or trigger model operation if the scan or trigger model was paused.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73512.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- trigger.model.setblock(1, trigger.BLOCK_BUFFER_CLEAR, defbuffer1)
--- trigger.model.setblock(2, trigger.BLOCK_DELAY_CONSTANT, 0)
--- trigger.model.setblock(3, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_INFINITE)
--- trigger.model.setblock(4, trigger.BLOCK_WAIT, trigger.EVENT_DISPLAY)
--- trigger.model.setblock(5, trigger.BLOCK_MEASURE_DIGITIZE, defbuffer1, trigger.COUNT_STOP)
--- trigger.model.setblock(6, trigger.BLOCK_NOTIFY, trigger.EVENT_NOTIFY1)
--- trigger.model.initiate()
--- trigger.model.pause()
--- delay(10)
--- trigger.model.resume()
--- waitcomplete()
--- print(defbuffer1.n)
--- 
--- --Set up a trigger model, then run it, pause for delay of 10 seconds, then resume it.
--- ```
function trigger.model.resume() end
---@class triggerlaninArr
triggerlaninArr = {}

---@type triggerlaninArr[]
trigger.lanin = {}


--- **This attribute sets the trigger operation and detection mode of the specified LAN event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command controls how the trigger event detector and the output trigger generator operate on the given trigger. These settings are intended to provide behavior similar to the digital I/O triggers.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/28111.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanin[1].edge = trigger.EDGE_FALLING
--- 
--- --Set the edge state of LAN event 1 to falling.
--- ```
triggerlaninArr.edge= 0



--- **This function waits for an input trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If one or more trigger events have been detected since the last time trigger.lanin[N].wait() or trigger.lanin[N].clear() was called, this function returns immediately.After waiting for a LAN trigger event with this function, the event detector is automatically reset and rearmed regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31397.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.lanin[5].wait(3)
--- 
--- --Wait for a trigger event with LAN trigger 5 with a timeout of 3 s.
--- ```
---@return boolean triggered Trigger detection indication (true or false)
---@param timeout number Maximum amount of time in seconds to wait for the trigger event
function triggerlaninArr.wait(timeout) end



--- **This function clears the event detector for a LAN trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. This function clears a trigger event detector and discards the history of the trigger packet.This function clears all overruns associated with this LAN trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31398.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanin[5].clear()
--- 
--- --Clears the event detector with LAN event trigger 5.
--- ```
function triggerlaninArr.clear() end



--- **This attribute contains the overrun status of the LAN event detector.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event.It also is not an indication of an output trigger overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31413.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.lanin[5].overrun
--- print(overrun)
--- 
--- --Checks the overrun status of a trigger on LAN5 and outputs the value, such as:
--- --false
--- ```
---@class status.operation
status.operation = {}


--- **This function requests the mapped set event and mapped clear event status for a bit in the Operation Event Registers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you query the mapping for a specific bit, the instrument returns the events that were mapped to set and clear that bit. Zero (0) indicates that the bits have not been set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30523.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.operation.getmap(0))
--- 
--- --Query bit 0 of the Operation Event Register.
--- --Example output:
--- --4918    4917
--- ```
---@return number setEvent The event mapped to set this bit; 0 if no mapping
---@return number clearEvent The event mapped to clear this bit; 0 if no mapping
---@param bitNumber number The bit number to check
function status.operation.getmap(bitNumber) end


--- **This attribute sets or reads the contents of the Operation Event Enable Register of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets or reads the contents of the Enable register of the Operation Event Register.When one of these bits is set, when the corresponding bit in the Operation Event Register or Operation Condition Register is set, the OSB bit in the Status Byte Register is set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31637.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- decimal 20480 = binary 0101 0000 0000 0000
--- operationRegister = 20480
--- status.operation.enable = operationRegister
--- 
--- --Sets the 12 and 14 bits of the operation status enable register using a decimal value.
--- ```
status.operation.enable = 0



--- **This attribute reads the Operation Event Register of the status model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This attribute reads the operation event register of the status model.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31638.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.request_enable = status.OSB 
--- status.operation.setmap(0, 4918, 4917)
--- status.operation.enable = 1
--- defbuffer1.clear()
--- defbuffer1.fillmode = buffer.FILL_ONCE
--- defbuffer1.capacity = 10
--- dmm.measure.count = 10
--- dmm.measure.read()
--- print(status.operation.event)
--- 
--- --Set bits in the Status Request Enable Register to record an enabled event in the Operation Status Register.
--- --Map event number 4918 (a default buffer is full) to set bit 0 in the Operation Event Register and event number 4917 (a default buffer is empty) to clear bit 0.
--- --Clear defbuffer1.
--- --Set defbuffer1 to fill once.
--- --Resizes defbuffer1 to 10 readings. 
--- --Sets the measure count to 10 readings and makes a measurement. 
--- --Reads the operation event register.
--- --Output:
--- --1
--- ```


--- **This attribute reads the Operation Event Register of the status model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command reads the contents of the Operation Condition Register, which is one of the Operation Event Registers.For detail on interpreting the value of a register, see Understanding bit settings.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31639.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.operation.condition)
--- 
--- --Returns the contents of the register.
--- ```


--- **This function allows you to map events to bits in the Operation Event Register.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can map events to bits in the event registers with this command. This allows you to cause bits in the condition and event registers to be set or cleared when the specified events occur. You can use any valid event number as the event that sets or clears bits.When a mapped event is programmed to set bits, the corresponding bits in both the condition register and event register are set when the event is detected.When a mapped event is programmed to clear bits, the bit in the condition register is set to 0 when the event is detected.If the event is set to zero (0), the bit is never set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31648.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.setmap(0, 2731, 2732)
--- 
--- --When event 2731 (trigger model initiated) occurs, bit 0 in the condition and event registers of the Operation Event Register are set. When event 2732 (trigger model idled) occurs, bit 0 in the condition register is cleared.
--- ```
---@param bitNumber number The bit number that is mapped to an event (0 to 14)
---@param setEvent number The number of the event that sets the bits in the condition and event registers; 0 if no mapping
---@param clearEvent number The number of the event that clears the bit in the condition register; 0 if no mapping
---@overload fun(bitNumber:number,setEvent:number)
function status.operation.setmap(bitNumber, setEvent, clearEvent) end
---@class status.questionable
status.questionable = {}


--- **This attribute reads the Questionable Event Register.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This query reads the contents of the questionable status event register. After sending this command and addressing the instrument to talk, a value is sent to the computer. This value indicates which bits in the appropriate register are set.The Questionable Register can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set the Questionable Register to the sum of their decimal weights. For example, to set bits B12 and B13, set the Questionable Register to 12,288 (which is the sum of 4,096 + 8,192).
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30524.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- decimal 66 = binary 0100 0010
--- questionableRegister = 66
--- status.questionable.enable = questionableRegister
--- 
--- --Uses a decimal value to set bits B1 and B6 of the status questionable enable register.
--- -- decimal 2560 = binary 00001010 0000 0000
--- questionableRegister = 2560
--- status.questionable.enable = questionableRegister
--- 
--- --Uses a decimal value to set bits B9 and B11 of the status questionable enable register.
--- ```


--- **This function maps events to bits in the questionable event registers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can map events to bits in the event registers with this command. This allows you to cause bits in the condition and event registers to be set or cleared when the specified events occur. You can use any valid event number as the event that sets or clears bits.When a mapped event is programmed to set bits, the corresponding bits in both the condition register and event register are set when the event is detected.When a mapped event is programmed to clear bits, the bit in the condition register is set to 0 when the event is detected.If the event is set to zero (0), the bit is never set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31612.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.setmap(0, 4917, 4918)
--- 
--- --When event 4917 (a default buffer is 0% filled) occurs, bit 0 is set in the condition register and the event register of the Questionable Event Register. When event 4918 (a default buffer is 100% filled) occurs, bit 0 in the condition register is cleared.
--- ```
---@param bitNumber number The bit number that is mapped to an event (0 to 14)
---@param setEvent number The number of the event that sets the bits in the condition and event registers; 0 if no mapping
---@param clearEvent number The number of the event that clears the bit in the condition register; 0 if no mapping
---@overload fun(bitNumber:number,setEvent:number)
function status.questionable.setmap(bitNumber, setEvent, clearEvent) end


--- **This function requests the mapped set event and mapped clear event status for a bit in the Questionable Event Registers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you query the mapping for a specific bit, the instrument returns the events that were mapped to set and clear that bit. Zero (0) indicates that the bits have not been set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31613.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.questionable.getmap(9))
--- 
--- --Returns the events that were mapped to set and clear bit 9.
--- ```
---@return number setEvent The event mapped to set this bit; 0 if no mapping
---@return number clearEvent The event mapped to clear this bit; 0 if no mapping
---@param bitNumber number The bit number to check (0 to 14)
function status.questionable.getmap(bitNumber) end


--- **This attribute reads the Questionable Condition Register of the status model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command reads the contents of the Questionable Condition Register, which is one of the Questionable Event Registers.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31614.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.questionable.condition)
--- 
--- --Reads the Questionable Condition Register.
--- ```


--- **This attribute sets or reads the contents of the questionable event enable register of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets or reads the contents of the Enable register of the Questionable Event Register.When one of these bits is set, when the corresponding bit in the Questionable Event Register or Questionable Condition Register is set, the MSB and QSM bits in the Status Byte Register are set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31615.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.enable = 17
--- print(status.questionable.enable)
--- 
--- --Set bits 0 and 4 of the Questionable Event Enable Register.
--- --Returns 17, which indicates the register was set correctly.
--- ```
status.questionable.enable = 0

---@class status.standard
status.standard = {}


--- **This attribute reads or sets the bits in the Status Enable register of the Standard Event Register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When a bit in the Status Enable register is set on and the corresponding bit in the Standard Event Status register is set on, the ESB bit of the Status Byte Register is set to on.To set a bit on, send the constant or value of the bit as the standardRegister parameter.You can set the bit as a constant or a numeric value, as shown in the table below. To set more than one bit of the register, you can send multiple constants with + between them. You can also set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B2, set standardRegister to 5 (which is the sum of 1 + 4). You can also send:status.standard.enable = status.standard.OPC + status.standard.QYEWhen zero (0) is returned, no bits are set. You can also send 0 to clear all bits.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.Command errors include:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30525.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- standardRegister = status.standard.OPC + status.standard.QYE
--- status.standard.enable = standardRegister
--- 
--- --Uses constants to set the OPC and QYE bits of the standard event status enable register.
--- -- decimal 5 = binary 0000 0101
--- standardRegister = 5
--- status.standard.enable = standardRegister
--- 
--- --Uses a decimal value to set the OPC and QYE bits of the standard event status enable register.
--- ```
status.standard.enable = 0



--- **This attribute returns the contents of the Standard Event Status Register set of the status model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When this command returns zero (0), no bits are set. You can send 0 to clear all bits.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.Command errors include:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31653.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.standard.event)
--- 
--- --May return the value 129, showing that the Standard Event Status Register contains binary 10000001
--- ```
---@class digiolineArr
digiolineArr = {}

---@type digiolineArr[]
digio.line = {}

digio.STATE_LOW = 0
digio.STATE_HIGH = 1

---@alias digiolinestatestate
---|`digio.STATE_LOW`
---|`digio.STATE_HIGH`



--- **This function sets a digital I/O line high or low when the line is set for digital control and returns the state on the digital I/O lines.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When a reset occurs, the digital line state can be read as high because the digital line is reset to a digital input. A digital input floats high if nothing is connected to the digital line.This returns the integer equivalent values of the binary states on all six digital I/O lines.Set the state to digio.STATE_LOW to clear the bit; set the state to digio.STATE_HIGH to set the bit.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30982.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[1].mode = digio.MODE_DIGITAL_OUT
--- digio.line[1].state = digio.STATE_HIGH
--- 
--- --Sets line 1 (bit B1) of the digital I/O port high.
--- ```
---@type digiolinestatestate
digiolineArr.state= 0


digio.MODE_DIGITAL_IND = nil
digio.MODE_DIGITAL_OUTD = nil
digio.MODE_DIGITAL_OPEN_DRAINT = nil
digio.MODE_TRIGGER_INT = nil
digio.MODE_TRIGGER_OUTT = nil
digio.MODE_TRIGGER_OPEN_DRAINS = nil
digio.MODE_SYNCHRONOUS_MASTER = nil
digio.MODE_SYNCHRONOUS_ACCEPTOR = nil

---@alias digiolinemodelineMode
---|`digio.MODE_DIGITAL_IND`
---|`digio.MODE_DIGITAL_OUTD`
---|`digio.MODE_DIGITAL_OPEN_DRAINT`
---|`digio.MODE_TRIGGER_INT`
---|`digio.MODE_TRIGGER_OUTT`
---|`digio.MODE_TRIGGER_OPEN_DRAINS`
---|`digio.MODE_SYNCHRONOUS_MASTER`
---|`digio.MODE_SYNCHRONOUS_ACCEPTOR`



--- **This attribute sets the mode of the digital I/O line to be a digital line, trigger line, or synchronous line and sets the line to be input, output, or open-drain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31363.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[1].mode = digio.MODE_TRIGGER_OUT
--- 
--- --Set digital I/O line 1 to be an output trigger line.
--- ```
---@type digiolinemodelineMode
digiolineArr.mode= 0



--- **This function resets digital I/O line values to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the following attributes to their default values:It also clears trigger.digin[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31393.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- Set the digital I/O trigger line 3 for a falling edge
--- digio.line[3].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[3].logic = trigger.LOGIC_NEGATIVE
--- -- Set the digital I/O trigger line 3 to have a pulsewidth of 50 microseconds.
--- trigger.digout[3].pulsewidth = 50e-6
--- -- Use digital I/O line 5 to trigger the event on line 3.
--- trigger.digout[3].stimulus = trigger.EVENT_DIGIO5
--- -- Print configuration (before reset).
--- print(digio.line[3].mode, trigger.digout[3].pulsewidth, trigger.digout[3].stimulus)
--- -- Reset the line back to factory default values.
--- digio.line[3].reset()
--- -- Print configuration (after reset).
--- print(digio.line[3].mode, trigger.digout[3].pulsewidth, trigger.digout[3].stimulus)
--- 
--- --Output before reset:
--- --digio.MODE_TRIGGER_OUT   5e-05   trigger.EVENT_DIGIO5
--- -- 
--- --Output after reset:
--- --digio.MODE_TRIGGER_IN   1e-05   trigger.EVENT_NONE
--- ```
function digiolineArr.reset() end

---@class triggerdiginArr
triggerdiginArr = {}

---@type triggerdiginArr[]
trigger.digin = {}

trigger.EDGE_FALLINGD = nil
trigger.EDGE_RISINGD = nil
trigger.EDGE_EITHERS = nil

---@alias triggerdiginedgedetectedEdge
---|`trigger.EDGE_FALLINGD`
---|`trigger.EDGE_RISINGD`
---|`trigger.EDGE_EITHERS`



--- **This attribute sets the edge used by the trigger event detector on the given trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the logic on which the trigger event detector and the output trigger generator operate on the specified trigger line.To directly control the line state, set the mode of the line to digital and use the write command. When the digital line mode is set for open drain, the edge settings assert a TTL low-pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31360.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[4].mode = digio.MODE_TRIGGER_IN
--- trigger.digin[4].edge = trigger.EDGE_RISING
--- 
--- --Sets the trigger mode for digital I/O line 4 to detect a rising-edge trigger as an input.
--- ```
---@type triggerdiginedgedetectedEdge
triggerdiginArr.edge= 0



--- **This function clears the trigger event on a digital input line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event detector of a trigger enters the detected state when an event is detected. For the specified trigger line, this command clears the event detector, discards the history, and clears the overrun status(sets the overrun status to false).
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31373.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.digin[2].clear()
--- 
--- --Clears the trigger event detector on I/O line 2.
--- ```
function triggerdiginArr.clear() end



--- **This attribute returns the event detector overrun status.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31378.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.digin[1].overrun
--- print(overrun)
--- 
--- --If there is no trigger overrun on digital input 1, the output is:
--- --false
--- ```


--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses for up to timeout seconds for an input trigger. If one or more trigger events are detected since the last time trigger.digin[N].wait() or trigger.digin[N].clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and is ready to detect the next trigger. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31394.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[4].mode = digio.MODE_TRIGGER_IN
--- triggered = trigger.digin[4].wait(3)
--- print(triggered)
--- 
--- --Waits up to 3 s for a trigger to be detected on trigger line 4, then outputs the results.
--- --Output if no trigger is detected:
--- --false
--- --Output if a trigger is detected:
--- --true
--- ```
---@return boolean triggered Trigger detected
---@param timeout number Timeout in seconds
function triggerdiginArr.wait(timeout) end

---@class triggerdigoutArr
triggerdigoutArr = {}

---@type triggerdigoutArr[]
trigger.digout = {}


--- **This attribute describes the length of time that the trigger line is asserted for output triggers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely. To release the trigger line, use trigger.digout[N].release().
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31385.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[4].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[4].pulsewidth = 20e-6
--- 
--- --Sets the pulse width for trigger line 4 to 20 µs.
--- ```
triggerdigoutArr.pulsewidth= 0



--- **This function asserts a trigger pulse on one of the digital I/O lines.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Initiates a trigger event and does not wait for completion. The pulse width that is set determines how long the instrument asserts the trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31392.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[2].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[2].pulsewidth = 20e-6
--- trigger.digout[2].assert()
--- 
--- --Asserts a trigger on digital I/O line 2 with a pulse width of 20 us.
--- ```
function triggerdigoutArr.assert() end



--- **This function releases an indefinite length or latched trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulsewidth time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31395.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[4].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[4].release()
--- 
--- --Releases digital I/O trigger line 4.
--- ```
function triggerdigoutArr.release() end


trigger.LOGIC_POSITIVEA = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggerdigoutlogiclogicType
---|`trigger.LOGIC_POSITIVEA`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute sets the output logic of the trigger event generator to positive or negative for the specified line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the logic that the output trigger generator uses on the given trigger line.The output state of the digital I/O line is controlled by the trigger logic, and the user-specified output state of the line is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33159.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[4].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[4].logic = trigger.LOGIC_NEGATIVE
--- 
--- --Sets line 4 mode to be a trigger output and sets the output logic of the trigger event generator to negative (asserts a low pulse).
--- ```
---@type triggerdigoutlogiclogicType
triggerdigoutArr.logic= 0



--- **This attribute selects the event that causes a trigger to be asserted on the digital output line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The digital trigger pulsewidth command determines how long the trigger is asserted.The trigger stimulus for a digital I/O line can be set to one of the trigger events that are described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/77679.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[2].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[2].stimulus = trigger.EVENT_TIMER3
--- 
--- --Set the stimulus for output digital trigger line 2 to be the expiration of trigger timer 3.
--- reset()
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_RESISTANCE)
--- scan.create("101:109")
--- scan.scancount = 10
--- scan.bypass = scan.ON
--- scan.channel.stimulus = trigger.EVENT_DIGIO1
--- digio.line[1].mode = digio.MODE_TRIGGER_IN
--- trigger.digin[1].edge = trigger.EDGE_FALLING
--- digio.line[3].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[3].logic = trigger.LOGIC_NEGATIVE
--- trigger.digout[3].stimulus = trigger.EVENT_SCAN_CHANNEL_READY
--- trigger.model.initiate()
--- 
--- --Reset the instrument.
--- --Set channels 101 through 109 to measure 2-wire resistance.
--- --Create a scan using channels 101 through 109.
--- --Set the scan count to 10.
--- --Bypass the first channel close trigger.
--- --Set the channel close stimulus to respond to a falling edge trigger coming in on digital input line 1.
--- --Set a digital output signal to trigger a negative pulse each time a defined scan channel is closed.
--- --Initiate the scan.
--- ```
---@type eventID|0
triggerdigoutArr.stimulus= 0

---@class triggerlanoutArr
triggerlanoutArr = {}

---@type triggerlanoutArr[]
trigger.lanout = {}


--- **This function simulates the occurrence of the trigger and generates the corresponding event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Generates and sends a LAN trigger packet for the LAN event number specified.Sets the pseudo line state to the appropriate state.The following indexes provide the listed LXI events:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31396.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[5].assert()
--- 
--- --Creates a trigger with LAN trigger 5.
--- ```
function triggerlanoutArr.assert() end



--- **This function prepares the event generator for outgoing trigger events.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command prepares the event generator to send event messages. For TCP connections, this opens the TCP connection.The event generator automatically disconnects when either the protocol or IP address for this event is changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31401.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[1].protocol = lan.PROTOCOL_MULTICAST
--- trigger.lanout[1].connect()
--- trigger.lanout[1].assert()
--- 
--- --Set the protocol for LAN trigger 1 to be multicast when sending LAN triggers. Then, after connecting the LAN trigger, send a message on LAN trigger 1 by asserting it.
--- ```
function triggerlanoutArr.connect() end



--- **This function disconnects the LAN trigger event generator.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When this command is set for TCP connections, this closes the TCP connection.The LAN trigger automatically disconnects when either the trigger.lanout[N].protocol or trigger.lanout[N].ipaddress attributes for this event are changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31404.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function triggerlanoutArr.disconnect() end



--- **This attribute contains the LAN event connection state.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This is set to true when the LAN trigger is connected and ready to send trigger events after a successful trigger.lanout[N].connect() command. If the LAN trigger is not ready to send trigger events, this value is false.This attribute is also false when the trigger.lanout[N].protocol or trigger.lanout[N].ipaddress attribute is changed or when the remote connection closes the connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31406.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[1].protocol = lan.PROTOCOL_MULTICAST
--- print(trigger.lanout[1].connected)
--- 
--- --Outputs true if connected, or false if not connected.
--- --Example output:
--- --false
--- ```


--- **This attribute specifies the address (in dotted-decimal format) of UDP or TCP listeners.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Sets the IP address for outgoing trigger events.After you change this setting, you must send the connect command before outgoing messages can be sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31409.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[3].protocol = lan.PROTOCOL_TCP
--- trigger.lanout[3].ipaddress = "192.0.32.10"
--- trigger.lanout[3].connect()
--- 
--- --Set the protocol for LAN trigger 3 to be TCP when sending LAN triggers.
--- --Use IP address "192.0.32.10" to connect the LAN trigger.
--- ```
triggerlanoutArr.ipaddress= 0


lan.PROTOCOL_TCP = nil
lan.PROTOCOL_UDP = nil
lan.PROTOCOL_MULTICAST = nil

---@alias triggerlanoutprotocolprotocol
---|`lan.PROTOCOL_TCP`
---|`lan.PROTOCOL_UDP`
---|`lan.PROTOCOL_MULTICAST`



--- **This attribute sets the LAN protocol to use for sending trigger messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The LAN trigger listens for trigger messages on all the supported protocols. However, it uses the designated protocol for sending outgoing messages.After you change this setting, you must re-connect the LAN trigger event generator before you can send outgoing event messages.When multicast is selected, the trigger IP address is ignored, and event messages are sent to the multicast address 224.0.23.159.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/31416.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.lanout[1].protocol)
--- 
--- --Get LAN protocol that is being used for sending trigger messages for LAN event 1.
--- ```
---@type triggerlanoutprotocolprotocol
triggerlanoutArr.protocol= 0


trigger.LOGIC_POSITIVEN = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggerlanoutlogiclogicType
---|`trigger.LOGIC_POSITIVEN`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute sets the logic on which the trigger event detector and the output trigger generator operate on the given trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33157.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[2].logic = trigger.LOGIC_POSITIVE
--- 
--- --Set the logic for LAN trigger line 2 to positive.
--- ```
---@type triggerlanoutlogiclogicType
triggerlanoutArr.logic= 0



--- **This attribute specifies events that cause this trigger to assert.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. Set the event to one of the existing trigger events, which are shown in the following table.Setting this attribute to none disables automatic trigger generation.If any events are detected before the trigger LAN connection is sent, the event is ignored, and the action overrun is set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/77682.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[5].stimulus = trigger.EVENT_TIMER1
--- 
--- --Use the timer 1 trigger event as the source for LAN trigger 5 stimulus.
--- ```
---@type eventID|0
triggerlanoutArr.stimulus= 0

---@class tsplinklineArr
tsplinklineArr = {}

---@type tsplinklineArr[]
tsplink.line = {}


--- **This attribute defines the trigger operation of a TSP-Link line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command defines whether or not the line is used as a digital or trigger control line and if it is an input or output.The line mode can be set to the following options:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32538.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- 
--- --Sets the trigger mode for synchronization line 3 as a trigger open drain line.
--- ```
tsplinklineArr.mode= 0



--- **This function resets some of the TSP-Link trigger attributes to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tsplink.line[N].reset() function resets the following attributes to their default values:This also clears trigger.tsplinkin[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].reset()
--- 
--- --Resets TSP-Link trigger line 3 attributes to default values.
--- ```
function tsplinklineArr.reset() end


tsplink.STATE_LOWH = nil
tsplink.STATE_HIGH = nil

---@alias tsplinklinestatelineState
---|`tsplink.STATE_LOWH`
---|`tsplink.STATE_HIGH`



--- **This attribute reads or writes the digital state of a TSP-Link synchronization line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use tsplink.writeport() to write to all TSP-Link synchronization lines.The reset function does not affect the present states of the TSP-Link trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32542.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lineState = tsplink.line[3].state
--- print(lineState)
--- 
--- --Assume line 3 is set high, and then the state is read.
--- --Output:
--- --tsplink.STATE_HIGH
--- ```
---@type tsplinklinestatelineState
tsplinklineArr.state= 0

---@class triggertsplinkinArr
triggertsplinkinArr = {}

---@type triggertsplinkinArr[]
trigger.tsplinkin = {}

trigger.EDGE_FALLINGD = nil
trigger.EDGE_RISINGD = nil
trigger.EDGE_EITHER = nil

---@alias triggertsplinkinedgedetectedEdge
---|`trigger.EDGE_FALLINGD`
---|`trigger.EDGE_RISINGD`
---|`trigger.EDGE_EITHER`



--- **This attribute indicates which trigger edge controls the trigger event detector for a trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the edge is detected, the instrument asserts a TTL-low pulse for the output.The output state of the I/O line is controlled by the trigger logic. The user-specified output state of the line is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32539.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- trigger.tsplinkin[3].edge = trigger.EDGE_RISING
--- 
--- --Sets synchronization line 3 to detect rising edge triggers as input.
--- ```
---@type triggertsplinkinedgedetectedEdge
triggertsplinkinArr.edge= 0



--- **This function clears the event detector for a LAN trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. When this command is sent, the instrument:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32551.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[2].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- trigger.tsplinkin[2].clear()
--- 
--- --Clears the trigger event on TSP-Link line 2.
--- ```
function triggertsplinkinArr.clear() end



--- **This attribute indicates if the event detector ignored an event while in the detected state.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself.It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. It also is not an indication of an output trigger overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32552.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.tsplinkin[1].overrun)
--- 
--- --If an event on line 1 was ignored, displays true; if no additional event occurred, displays false.
--- ```


--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to the timeout value for an input trigger. If one or more trigger events are detected since the last time this command or trigger.tsplinkin[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32561.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- triggered = trigger.tsplinkin[3].wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 s for a trigger on TSP-Link line 3.
--- --If false is returned, no trigger was detected during the 10-s timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered Trigger detection indication; set to one of the following values
---@param timeout number The timeout value in seconds
function triggertsplinkinArr.wait(timeout) end

---@class triggertsplinkoutArr
triggertsplinkoutArr = {}

---@type triggertsplinkoutArr[]
trigger.tsplinkout = {}

trigger.LOGIC_POSITIVEA = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggertsplinkoutlogiclogicType
---|`trigger.LOGIC_POSITIVEA`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute defines the trigger output with output logic for a trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the logic that the output trigger generator uses on the given trigger line.The output state of the digital I/O line is controlled by the trigger logic, and the user-specified output state of the line is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32540.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- trigger.tsplinkout[3].logic = trigger.LOGIC_POSITIVE
--- 
--- --Sets the trigger logic for synchronization line 3 to output a positive pulse.
--- ```
---@type triggertsplinkoutlogiclogicType
triggertsplinkoutArr.logic= 0



--- **This function simulates the occurrence of the trigger and generates the corresponding trigger event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Initiates a trigger event and does not wait for completion. The set pulse width determines how long the trigger is asserted.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32549.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[2].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- trigger.tsplinkout[2].assert()
--- 
--- --Asserts trigger on trigger line 2.
--- ```
function triggertsplinkoutArr.assert() end



--- **This attribute sets the length of time that the trigger line is asserted for output triggers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to 0 asserts the trigger indefinitely.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32553.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- trigger.tsplinkout[3].pulsewidth = 20e-6
--- 
--- --Sets pulse width for trigger line 3 to 20 μs.
--- ```
triggertsplinkoutArr.pulsewidth= 0



--- **This function releases a latched trigger on the given TSP-Link trigger line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulse width. It also releases a trigger that was latched in response to receiving a synchronous mode trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32555.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].mode = tsplink.MODE_TRIGGER_OPEN_DRAIN
--- trigger.tsplinkout[3].release()
--- 
--- --Releases trigger line 3.
--- ```
function triggertsplinkoutArr.release() end



--- **This attribute specifies the event that causes the synchronization line to assert a trigger.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To disable automatic trigger assertion on the synchronization line, set this attribute to trigger.EVENT_NONE.Do not use this attribute when triggering under script control. Use trigger.tsplinkout[N].assert() instead.The event parameters that you can use are described in the table below.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/77684.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.tsplinkout[3].stimulus)
--- 
--- --Outputs the event that will start action on TSP-Link trigger line 3.
--- ```
---@type eventID|0
triggertsplinkoutArr.stimulus= 0

---@class display.input
display.input = {}

display.NFORMAT_INTEGER = nil
display.NFORMAT_DECIMALD = nil
display.NFORMAT_EXPONENTD = nil
display.NFORMAT_PREFIX = nil

---@alias displayinputnumbernumberFormat
---|`display.NFORMAT_INTEGER`
---|`display.NFORMAT_DECIMALD`
---|`display.NFORMAT_EXPONENTD`
---|`display.NFORMAT_PREFIX`



--- **This function allows you to create a prompt that requests a number from the user on the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command prompts the instrument operator to enter a value.The prompt is displayed until it has been responded to.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/40051.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.rel.enable = dmm.ON
--- relativeoffset = display.input.number("Relative offset value", display.NFORMAT_INTEGER, 0, -1000, 1000)
--- dmm.measure.rel.level = relativeoffset
--- 
--- --This example displays a number pad on the screen that defaults to 0 and allows entries from ->1000 to 1000. The number that the operator enters is assigned to the relative offset level. If the operator enters a value outside of the range, an error message is displayed.
--- --
--- ```
---@return number numberEntered The number that is entered from the front-panel display; nil if Cancel is pressed on the keypad
---@param dialogTitle string A string that contains the text to be displayed as the title of the dialog box on the front-panel display; can be up to 32 characters
---@param numberFormat displayinputnumbernumberFormat The format of the displayed number
---@param defaultValue number The value that is initially displayed in the displayed keypad
---@param minimumValue number The lowest value that can be entered
---@param maximumValue number The highest value that can be entered
---@overload fun(dialogTitle:string):number
---@overload fun(dialogTitle:string,numberFormat:displayinputnumbernumberFormat):number
---@overload fun(dialogTitle:string,numberFormat:displayinputnumbernumberFormat,defaultValue:number):number
---@overload fun(dialogTitle:string,numberFormat:displayinputnumbernumberFormat,defaultValue:number,minimumValue:number):number
function display.input.number(dialogTitle, numberFormat, defaultValue, minimumValue, maximumValue) end


--- **This function allows you to create an option dialog box with customizable buttons on the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Buttons are created from top to bottom, left to right. If you have more than five buttons, they are placed into two columns.The prompt is displayed until it has been responded to. You can only send one input prompt command at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/40052.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- optionID = display.input.option("Select an option", "Apple", "Orange", "Papaya", "Pineapple", "Blueberry", "Banana", "Grapes", "Peach", "Apricot", "Guava")
--- print(optionID)
--- 
--- --This example displays the following dialog box:
--- --
--- --If the user selects Peach, the return is display.BUTTON_OPTION8.
--- ```
---@return displayInputOption n The number of the button that is selected from the front-panel display; nil if Cancel is pressed on the keypad; buttons are numbered top to bottom, left to right
---@param dialogTitle string A string that contains the text to be displayed as the title of the dialog box on the front-panel display; up to 32 characters
---@param buttonTitle1 string A string that contains the name of the first button; up to 15 characters
---@param buttonTitle2 string A string that contains the name of the second button; up to 15 characters
---@param buttonTitleN string A string that contains the names of subsequent buttons, where N is a number from 3 to 10; you can define up to 10 buttons; each button can be up to 15 characters
---@overload fun(dialogTitle:string,buttonTitle1:string,buttonTitle2:string):displayInputOption
function display.input.option(dialogTitle, buttonTitle1, buttonTitle2, buttonTitleN, ...) end

display.BUTTON_OKC = nil
display.BUTTON_CANCELY = nil
display.BUTTON_YESN = nil
display.BUTTON_NO = nil

---@alias displayinputpromptbuttonReturn
---|`display.BUTTON_OKC`
---|`display.BUTTON_CANCELY`
---|`display.BUTTON_YESN`
---|`display.BUTTON_NO`


display.BUTTONS_OKC = nil
display.BUTTONS_CANCELOK = nil
display.BUTTONS_OKCANCELY = nil
display.BUTTONS_YESNOY = nil
display.BUTTONS_YESNOCANCEL = nil

---@alias displayinputpromptbuttonSet
---|`display.BUTTONS_OKC`
---|`display.BUTTONS_CANCELOK`
---|`display.BUTTONS_OKCANCELY`
---|`display.BUTTONS_YESNOY`
---|`display.BUTTONS_YESNOCANCEL`



--- **This function allows you to create a prompt that accepts a user response from the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command waits for a user response to the prompt. You can use the text to ask questions that can be used to configure your test.The prompt is displayed until it has been responded to by the user. You can only send one input prompt command at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/40053.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- result = display.input.prompt(display.BUTTONS_YESNO, "Do you want to display the graph screen?")
--- if result == display.BUTTON_YES then
---    display.changescreen(display.SCREEN_GRAPH)
--- end
--- 
--- --This displays the prompt "Do you want to display the graph screen?" on the front-panel display:
--- --
--- -- If the operator selects Yes, the graph screen is displayed.
--- ```
---@return displayinputpromptbuttonReturn buttonReturn Indicates which button was pressed
---@param buttonSet displayinputpromptbuttonSet The set of buttons to display
---@param dialogTitle string A string that contains the text to be displayed as the title of the dialog box on the front-panel display; up to 63 characters
function display.input.prompt(buttonSet, dialogTitle) end

display.SFORMAT_ANY = nil
display.SFORMAT_UPPER_LOWERA = nil
display.SFORMAT_UPPERA = nil
display.SFORMAT_BUFFER_NAME = nil

---@alias displayinputstringtextFormat
---|`display.SFORMAT_ANY`
---|`display.SFORMAT_UPPER_LOWERA`
---|`display.SFORMAT_UPPERA`
---|`display.SFORMAT_BUFFER_NAME`



--- **This function allows you to create a dialog box that requests text from the user through the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command creates a prompt to the instrument operator to enter a string value.The prompt is displayed until it has been responded to. You can only send one input prompt command at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/40054.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value = display.input.string("Enter Test Name", display.SFORMAT_ANY)
--- print(value)
--- 
--- --This example displays the prompt "Enter Test Name" and a keyboard that the operator can use to enter a response.
--- --
--- --The return is the response from the operator.
--- ```
---@return string|nil textEntered The text that is entered from the front-panel display; nil if Cancel is pressed on the keypad
---@param dialogTitle string A string that contains the text to be displayed as the title of the dialog box on the front-panel display; up to 32 characters
---@param textFormat displayinputstringtextFormat The format of the entered text
---@overload fun(dialogTitle:string):string|nil
function display.input.string(dialogTitle, textFormat) end
---@class dmm.digitize
dmm.digitize = {}


--- **This function makes digitize measurements, places them in a reading buffer, and returns the last reading.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must set the instrument to make digitize measurements before sending this command with the dmm.digitize.func attribute.This command initiates measurements using the present function settings, stores the readings in a reading buffer, and returns the last reading.This command makes the number of digitize measurements that is set by the dmm.digitize.count attribute.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41093.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- voltMeasBuffer = buffer.make(10000)
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- print(dmm.digitize.read(voltMeasBuffer))
--- 
--- --Create a buffer named voltMeasBuffer. Set the instrument to digitize voltage.
--- --Make a measurement that is stored in the voltMeasBuffer and is also printed.
--- reset()
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE) 
--- channel.close("101")
--- print(dmm.digitize.read())
--- 
--- --Set up channel 1 to digitize voltage.
--- --Close channel 1.
--- --Digitize on the closed channel.
--- ```
---@return number reading The last reading of the measurement process
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if nothing is specified, the reading is stored in defbuffer1
---@overload fun():number
function dmm.digitize.read(bufferName) end

dmm.DIGITS_6_55 = nil
dmm.DIGITS_5_54 = nil
dmm.DIGITS_4_53 = nil
dmm.DIGITS_3_5 = nil

---@alias dmmdigitizedisplaydigitsvalue
---|`dmm.DIGITS_6_55`
---|`dmm.DIGITS_5_54`
---|`dmm.DIGITS_4_53`
---|`dmm.DIGITS_3_5`



--- **This attribute describes the number of digits that are displayed on the front panel for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41150.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.displaydigits = dmm.DIGITS_3_5
--- 
--- --Set the instrument to use the digitize current measure function.
--- --Set the front panel to display 3½ digits.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:102", dmm.ATTR_DIGI_DIGITS, dmm.DIGITS_3_5)
--- 
--- --Set the measurement function on channels 1 and 2 of slot 1 to digitize voltage. Set the display digits to 3½.
--- ```
---@type dmmdigitizedisplaydigitsvalue
dmm.digitize.displaydigits = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41269.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.userdelay[2] = 0.5
--- trigger.model.setblock(6, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M2)
--- 
--- --Set user delay 2 to be 0.5 s. Sets trigger-model block 6 to use the delay.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:102", dmm.ATTR_DIGI_USER_DELAY_2, 0.5)
--- trigger.model.setblock(6, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M2)
--- 
--- --Set user delay 2 to be 0.5 s for channels 1 to 2 of slot 1. Set trigger-model block 6 to use the delay.
--- ```
---@type integer[]
dmm.digitize.userdelay= 0



--- **This attribute sets the number of measurements to digitize when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The digitize function makes the number of readings set by this command in the time set by the sample rate. This command does not affect the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41297.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.aperture = dmm.APERTURE_AUTO
--- dmm.digitize.samplerate = 1000000
--- dmm.digitize.count = 10
--- print(dmm.digitize.read())
--- 
--- --Set the digitize function to measure current. Set the sample rate to 1,000,000, with a count of 10, and automatic aperture.
--- --Make a digitize measurement.
--- --Example output:
--- ---0.0039799990218
--- channel.setdmm("121:122", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_CURRENT)
--- channel.setdmm("121:122", dmm.ATTR_DIGI_SAMPLE_RATE, 200000, dmm.ATTR_DIGI_APERTURE, dmm.APERTURE_AUTO, dmm.ATTR_DIGI_COUNT, 1)
--- channel.close("121")
--- print(dmm.digitize.read())
--- channel.close("122")
--- print(dmm.digitize.read())
--- 
--- --With a 7700 switching module installed, set the measurement function on channels 21 and 22 of slot 1 to digitize current, with a rate of 200,000, automatic aperture, and a count of 1.
--- --Make digitize measurements on each of the channels.
--- ```
dmm.digitize.count = 0



--- **This attribute determines the positive full-scale measure range for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When you assign a range value, the instrument selects a fixed range that is large enough to measure the assigned value. The instrument selects the best range for measuring the maximum expected value.For example, for digitize current measurements, if you expect a reading of approximately 9 mA, set the range to 9 mA to select the 10 mA range.When you read this setting, you see the positive full-scale value of the measurement range that the instrument is presently using.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41306.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.range = 90
--- 
--- --Set the function to digitize voltage. Set the range to 90 V, which selects the 100 V range.
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101", dmm.ATTR_DIGI_RANGE, 90)
--- 
--- --Set channel 1 on slot 1 to the digitize voltage function. Set the range of channel 1 to 90 V, which selects the 100 V range.
--- ```
dmm.digitize.range = 0


dmm.FUNC_DIGITIZE_CURRENTV = nil
dmm.FUNC_DIGITIZE_VOLTAGEN = nil
dmm.FUNC_NONE = nil

---@alias dmmdigitizefuncvalue
---|`dmm.FUNC_DIGITIZE_CURRENTV`
---|`dmm.FUNC_DIGITIZE_VOLTAGEN`
---|`dmm.FUNC_NONE`



--- **This attribute determines which digitize function is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this command to the type of measurement you want to digitize.Reading this command returns the digitize function that is presently active.If a basic (non-digitize) measurement function is selected, this returns dmm.FUNC_NONE. The none setting is automatically made if you select a function with dmm.measure.func or through the options from the front-panel Measure Functions tab.If a channel is closed when you assign a function to the channel, all other channels are opened.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41428.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- 
--- --Set the measurement function to digitize current.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_RANGE, 100, dmm.ATTR_DIGI_DIGITS, dmm.DIGITS_5_5, dmm.ATTR_DIGI_SAMPLE_RATE, 1000, dmm.ATTR_DIGI_COUNT, 1000)
--- 
--- --Set the measurement function on channels 1 to 3 of slot 1 to digitize voltage, with a range of 100, 5½ displayed digits, a sample rate of 1000, and a count of 1000.
--- ```
---@type dmmdigitizefuncvalue
dmm.digitize.func = 0


dmm.APERTURE_AUTO = nil

---@alias dmmdigitizeaperturetime
---|`dmm.APERTURE_AUTO`



--- **This attribute determines the aperture setting for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The aperture is the actual acquisition time of the instrument on the signal. The aperture can be set to automatic or to a specific value in 1 μs intervals. If the value is not specified in microseconds, the value is rounded down to the nearest microsecond resolution. When automatic is selected, the aperture setting is set to the maximum value possible for the selected sample rate.The aperture must be less than the reciprocal of the sample rate. The minimum aperture is 1 μs at the maximum sampling rate of 1,000,000 samples per second.Set the sample rate before changing the aperture.The maximum aperture available is 1 divided by the sample rate. The aperture cannot be set to more than this value.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41431.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.samplerate = 200000
--- dmm.digitize.aperture = dmm.APERTURE_AUTO
--- dmm.digitize.count = 1
--- print(dmm.digitize.read())
--- 
--- --Set the digitize function to measure current. Set the sample rate to 200,000, with a count of 1, and automatic aperture.
--- --Make a digitize measurement.
--- channel.setdmm("121:122", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_CURRENT)
--- channel.setdmm("121:122", dmm.ATTR_DIGI_SAMPLE_RATE, 200000, dmm.ATTR_DIGI_APERTURE, dmm.APERTURE_AUTO, dmm.ATTR_DIGI_COUNT, 1)
--- channel.close("121")
--- print(dmm.digitize.read())
--- channel.close("122")
--- print(dmm.digitize.read())
--- 
--- --With a 7700 switching module installed, set the measurement function on channels 21 and 22 of slot 1 to digitize current, with a rate of 200,000, automatic aperture, and a count of 1.
--- --Make digitize measurements on each of the channels.
--- ```
---@type dmmdigitizeaperturetime
dmm.digitize.aperture = 0



--- **This attribute defines the precise acquisition rate at which the digitizing measurements are made.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The sample rate determines how fast the DAQ6510 acquires a digitized reading.Set the sample rate before setting the aperture. If the aperture setting is too high for the selected sample rate, it is automatically adjusted to the highest aperture that can be used with the sample rate.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41433.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.samplerate = 200000
--- dmm.digitize.aperture = dmm.APERTURE_AUTO
--- dmm.digitize.count = 1
--- print(dmm.digitize.read())
--- 
--- --Set the digitize function to digitize current. Set the sample rate to 200,000, with a count of 1, and automatic aperture.
--- --Make a digitize measurement.
--- channel.setdmm("121:122", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_CURRENT)
--- channel.setdmm("121:122", dmm.ATTR_DIGI_SAMPLE_RATE, 200000, dmm.ATTR_DIGI_APERTURE, dmm.APERTURE_AUTO, dmm.ATTR_DIGI_COUNT, 1)
--- channel.close("121")
--- print(dmm.digitize.read())
--- channel.close("122")
--- print(dmm.digitize.read())
--- 
--- --With a 7700 switching module installed, set the measurement function on channels 21 and 22 of slot 1 to digitize current, with a rate of 200,000, automatic aperture, and a count of 1.
--- --Make digitize measurements on each of the channels.
--- ```
dmm.digitize.samplerate = 0



--- **This function initiates digitize measurements and returns the last actual measurement and time information in UTC format without using the trigger mode.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates digitize measurements using the present function settings, stores the readings in a reading buffer, and returns the last reading.The dmm.digitize.count attribute determines how many measurements are performed.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41622.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.digitize.readwithtime(defbuffer1))
--- 
--- --Print the last digitize measurement and time information from defbuffer1 in UTC format, which will look similar to:
--- ---0.0003882925875	1415795836	0.946164546
--- channel.close("101")
--- print(dmm.digitize.readwithtime())
--- channel.close("109") 
--- print(dmm.digitize.readwithtime())
--- 
--- --Close channel 1 of slot 1.
--- --Print the digitize reading.
--- --Close channel 9 of slot 1.
--- --Print the digitize reading.
--- ```
---@return number reading The last reading of the measurement process
---@return number seconds Seconds in UTC format
---@return number fractional Fractional seconds
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@overload fun():number
function dmm.digitize.readwithtime(bufferName) end

dmm.UNIT_VOLTD = nil
dmm.UNIT_DBD = nil
dmm.UNIT_DBMU = nil
dmm.UNIT_AMP = nil

---@alias dmmdigitizeunitvalue
---|`dmm.UNIT_VOLTD`
---|`dmm.UNIT_DBD`
---|`dmm.UNIT_DBMU`
---|`dmm.UNIT_AMP`



--- **This attribute sets the units of measurement that are displayed on the front panel of the instrument and stored in the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change in measurement units is displayed when the next measurement is made. You can only change the units for the listed functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/43717.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.unit = dmm.UNIT_DB
--- 
--- --Set the measure function to digitize voltage.
--- --Set the units to display in decibels.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_UNIT, dmm.UNIT_DB, dmm.ATTR_DIGI_DB_REFERENCE, 1e-6, dmm.ATTR_DIGI_SAMPLE_RATE, 1000, dmm.ATTR_DIGI_COUNT, 1000)
--- 
--- --Set the measurement function on channels 1 to 3 of slot 1 to digitize voltage, with units set to dB , dB reference of 1e-6 V, sample rate of 1000, and a count of 1000.
--- ```
---@type dmmdigitizeunitvalue
dmm.digitize.unit = 0


dmm.IMPEDANCE_10MA = nil
dmm.IMPEDANCE_AUTO = nil

---@alias dmmdigitizeinputimpedancesetting
---|`dmm.IMPEDANCE_10MA`
---|`dmm.IMPEDANCE_AUTO`



--- **This attribute determines when the 10 MΩ input divider is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Choosing automatic input impedance is a balance between achieving low DC voltage noise on the 100 mV and 1 V ranges and optimizing measurement noise due to charge injection. The DAQ6510 is optimized for low noise and charge injection when the DUT has less than 100 kΩ input resistance. When the DUT input impedance is more than 100 kΩ, selecting an input impedance of 10 MΩ optimizes the measurement for lowest noise on the 100 mV and 1 V ranges. You can achieve short-term low noise and low charge injection on the 100 mV and 1 V ranges with autozero off. For the 10 V to 1000 V ranges, both input impedance settings achieve low charge injection.The input impedance setting is only available for the digitize voltage function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/44541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.inputimpedance = dmm.IMPEDANCE_AUTO
--- 
--- --Set input impedance to be set automatically when the digitize voltage function is selected.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_INPUT_IMPEDANCE, dmm.IMPEDANCE_10M)
--- 
--- --Set the measurement function on channels 1 to 3 of slot 1 to digitize voltage. Set the input impedance to 10 MΩ.
--- ```
---@type dmmdigitizeinputimpedancesetting
dmm.digitize.inputimpedance = 0



--- **This attribute defines the decibel (dB) reference setting for the DMM in volts.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only available for the digitize voltage function.This value only applies when the unit setting for the function is set to decibels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46371.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.unit = dmm.UNIT_DB
--- dmm.digitize.dbreference = 5
--- 
--- --Sets the units to decibel and sets the dB reference to 5 for DC volts.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_UNIT, dmm.UNIT_DB, dmm.ATTR_DIGI_DB_REFERENCE, 1e-6, dmm.ATTR_DIGI_SAMPLE_RATE, 1000, dmm.ATTR_DIGI_COUNT, 1000)
--- 
--- --Set the measurement function on channels 1 to 3 of slot 1 to digitize voltage, with units set to dB, dB reference of 1e-6 V, sample rate of 1000, and a count of 1000.
--- ```
dmm.digitize.dbreference = 0



--- **This attribute defines the decibel-milliwatts (dBm) reference.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only available for the digitize voltage function.This value only applied when the unit setting for the function is set to dBm.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/81719.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.unit = dmm.UNIT_DBM
--- dmm.digitize.dbmreference = 85
--- 
--- --Sets the units to dBm and sets the dBm resistance to 85 Ω.
--- channel.setdmm("201:210", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("201:210", dmm.ATTR_DIGI_UNIT, dmm.UNIT_DBM)
--- channel.setdmm("201:210", dmm.ATTR_DIGI_DBM_REFERENCE, 85)
--- 
--- --For channels 1 through 10 on slot 2, set the DMM function to digitize voltage.
--- --Set the units to decibel-milliwatts.
--- --Set the dBm reference to 85 Ω.
--- ```
dmm.digitize.dbmreference = 0

---@class trigger.extin
trigger.extin = {}


--- **This function clears the trigger event on the EXTERNAL TRIGGER IN line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event detector of a trigger enters the detected state when an event is detected. This command clears the event detector, discards the history, and clears the overrun status (sets the overrun status to false).
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41331.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extin.clear()
--- 
--- --Clears the trigger event detector on the EXTERNAL IN line.
--- ```
function trigger.extin.clear() end

trigger.EDGE_FALLINGD = nil
trigger.EDGE_RISINGD = nil
trigger.EDGE_EITHER = nil

---@alias triggerextinedgedetectedEdge
---|`trigger.EDGE_FALLINGD`
---|`trigger.EDGE_RISINGD`
---|`trigger.EDGE_EITHER`



--- **This attribute sets the type of edge that is detected as an input on the EXTERNAL TRIGGER IN trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The input state of EXTERNAL TRIGGER IN is controlled by the type of edge specified by this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41332.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extin.edge = trigger.EDGE_RISING
--- 
--- --Sets the EXTERNAL TRIGGER IN line to detect rising-edge triggers as inputs.
--- ```
---@type triggerextinedgedetectedEdge
trigger.extin.edge = 0



--- **This attribute returns the event detector overrun status.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41333.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.extin.overrun
--- print(overrun)
--- 
--- --If there is no trigger overrun on the EXTERNAL TRIGGER IN line, the output is:
--- --false
--- ```


--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses for up to timeout seconds for an input trigger. If one or more trigger events are detected since the last time trigger.extin.wait() or trigger.extin.clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and is ready to detect the next trigger. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41334.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.extin.wait(3)
--- print(triggered)
--- 
--- --Waits up to 3 s for a trigger to be detected on the EXTERNAL TRIGGER IN line, then outputs the results.
--- --Output if no trigger is detected:
--- --false
--- --Output if a trigger is detected:
--- --true
--- ```
---@return number triggered Trigger detected
---@param timeout number Timeout in seconds
function trigger.extin.wait(timeout) end
---@class trigger.extout
trigger.extout = {}


--- **This function asserts a trigger on the EXTERNAL TRIGGER OUT line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Initiates a trigger event and does not wait for completion.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41335.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extout.assert()
--- 
--- --Asserts a trigger on EXTERNAL TRIGGER OUT line.
--- ```
function trigger.extout.assert() end

trigger.LOGIC_POSITIVEA = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggerextoutlogiclogicType
---|`trigger.LOGIC_POSITIVEA`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute sets the output logic of the trigger event generator to positive or negative for the EXTERNAL TRIGGER OUT line. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the trigger event generator to assert a TTL pulse for output logic. Positive is a high pulse; negative is a low pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41336.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.ext.reset()
--- trigger.extin.clear() 
--- trigger.extout.logic = trigger.LOGIC_NEGATIVE
--- trigger.extout.stimulus = trigger.EVENT_EXTERNAL
--- trigger.extin.edge = trigger.EDGE_FALLING
--- 
--- --Reset the EXTERNAL TRIGGER IN and EXTERNAL TRIGGER OUT line values to their defaults.
--- --Clear any event triggers on the EXTERNAL TRIGGER IN line.
--- --Set the output logic to negative (it asserts a low pulse).
--- --Set the stimulus to the EXTERNAL TRIGGER IN line.
--- --Set the external input to detect a falling edge.
--- ```
---@type triggerextoutlogiclogicType
trigger.extout.logic = 0



--- **This attribute selects the event that causes a trigger to be asserted on the EXTERNAL TRIGGER OUT line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The trigger stimulus for the EXTERNAL TRIGGER OUT line can be set to one of the trigger events described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/77680.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extout.stimulus = trigger.EVENT_TIMER3
--- 
--- --Set the stimulus for the EXTERNAL TRIGGER OUT line to be the expiration of trigger timer 3.
--- reset()
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_RESISTANCE)
--- scan.create("101:109")
--- scan.scancount = 10
--- scan.measure.stimulus = trigger.EVENT_EXTERNAL
--- trigger.extin.edge = trigger.EDGE_FALLING
--- trigger.extout.logic = trigger.LOGIC_NEGATIVE
--- trigger.extout.stimulus = trigger.EVENT_SCAN_MEASURE_COMPLETE
--- trigger.model.initiate()
--- 
--- --Reset the instrument.
--- --Set channels 101 through 109 to measure 2-wire resistance.
--- --Create a scan using channels 101 through 109.
--- --Set the scan count to 10.
--- --Set the channel measurement stimulus to be triggered by a falling edge pulse on the EXTERNAL TRIGGER IN line.
--- --Set the EXTERNAL TRIGGER OUT line to generate a negative pulse each time a scan channel makes a measurement.
--- --Initiate the scan.
--- ```
---@type triggerEvents|0
trigger.extout.stimulus= 0

---@class trigger.ext
trigger.ext = {}


--- **This function resets the edge, logic, and stimulus values for the EXTERNAL TRIGGER IN and EXTERNAL TRIGGER OUT lines to their default values.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the following attributes to their default values:It also clears trigger.extin.overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41343.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- Set the External Trigger In line for a rising edge
--- trigger.extin.edge = trigger.EDGE_RISING
--- -- Set the logic to negative
--- trigger.extout.logic = trigger.LOGIC_NEGATIVE
--- -- Set the stimulus to timer 3
--- trigger.extout.stimulus = trigger.EVENT_TIMER3
--- -- Print configuration (before reset)
--- print(trigger.extin.edge, trigger.extout.logic, trigger.extout.stimulus)
--- -- Reset the External Trigger In and External Trigger Out lines to default values.
--- trigger.ext.reset()
--- -- Print configuration (after reset)
--- print(trigger.extin.edge, trigger.extout.logic, trigger.extout.stimulus)
--- 
--- --Output before reset:
--- --trigger.EDGE_RISING     trigger.LOGIC_NEGATIVE  trigger.EVENT_TIMER3
--- -- 
--- --Output after reset:
--- --trigger.EDGE_FALLING    trigger.LOGIC_NEGATIVE  trigger.EVENT_NONE
--- ```
function trigger.ext.reset() end
---@class buffer.write
buffer.write = {}

buffer.UNIT_AMP = nil
buffer.UNIT_AMP_AC = nil
buffer.UNIT_CELSIUS = nil
buffer.UNIT_CUSTOM1 = nil
buffer.UNIT_CUSTOM2 = nil
buffer.UNIT_CUSTOM3 = nil
buffer.UNIT_DAC = nil
buffer.UNIT_DBM = nil
buffer.UNIT_DECIBEL = nil
buffer.UNIT_DIO = nil
buffer.UNIT_FAHRENHEIT = nil
buffer.UNIT_FARAD = nil

---@alias bufferwriteformatunits
---|`buffer.UNIT_AMP`
---|`buffer.UNIT_AMP_AC`
---|`buffer.UNIT_CELSIUS`
---|`buffer.UNIT_CUSTOM1`
---|`buffer.UNIT_CUSTOM2`
---|`buffer.UNIT_CUSTOM3`
---|`buffer.UNIT_DAC`
---|`buffer.UNIT_DBM`
---|`buffer.UNIT_DECIBEL`
---|`buffer.UNIT_DIO`
---|`buffer.UNIT_FAHRENHEIT`
---|`buffer.UNIT_FARAD`


buffer.DIGITS_3_5 = nil
buffer.DIGITS_4_5 = nil
buffer.DIGITS_5_5 = nil
buffer.DIGITS_6_5 = nil
buffer.DIGITS_7_5 = nil
buffer.DIGITS_8_5 = nil

---@alias bufferwriteformatdisplayDigits
---|`buffer.DIGITS_3_5`
---|`buffer.DIGITS_4_5`
---|`buffer.DIGITS_5_5`
---|`buffer.DIGITS_6_5`
---|`buffer.DIGITS_7_5`
---|`buffer.DIGITS_8_5`



--- **This function sets the units and number of digits of the readings that are written into the reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is valid when the buffer style is writable or full writable. When the buffer style is set to full writable, you can include an extra value.The format defines the units and the number of digits that are reported for the data. This command affects how the data is shown in the reading buffer and what is shown on the front-panel Home, Histogram, Reading Table, and Graph screens.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46427.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- extBuffer = buffer.make(100, buffer.STYLE_WRITABLE)
--- buffer.write.format(extBuffer, buffer.UNIT_WATT, buffer.DIGITS_3_5)
--- buffer.write.reading(extBuffer, 1)
--- buffer.write.reading(extBuffer, 2)
--- buffer.write.reading(extBuffer, 3)
--- buffer.write.reading(extBuffer, 4)
--- buffer.write.reading(extBuffer, 5)
--- buffer.write.reading(extBuffer, 6)
--- printbuffer(1, 6, extBuffer.readings, extBuffer.units)
--- 
--- --Creates a 100-point reading buffer named extBuffer. Style is writable.
--- --Set the data format to show units of watts with 3½ digit resolution.
--- --Write 6 pieces of data into the buffer.
--- --Print the buffer, including the readings and units.
--- --Read the buffer.
--- --Output:
--- --1.0000000000e+00, Watt DC, 2.0000000000e+00, Watt DC, 3.0000000000e+00, Watt DC, 4.0000000000e+00, Watt DC, 5.0000000000e+00, Watt DC, 6.0000000000e+00, Watt DC
--- extBuffer = buffer.make(100, buffer.STYLE_WRITABLE_FULL)
--- buffer.write.format(extBuffer, buffer.UNIT_WATT, buffer.DIGITS_3_5,   buffer.UNIT_WATT, buffer.DIGITS_3_5)
--- buffer.write.reading(extBuffer, 1, 7)
--- buffer.write.reading(extBuffer, 2, 8)
--- buffer.write.reading(extBuffer, 3, 9)
--- buffer.write.reading(extBuffer, 4, 10)
--- buffer.write.reading(extBuffer, 5, 11)
--- buffer.write.reading(extBuffer, 6, 12)
--- printbuffer(1, 6, extBuffer.readings, extBuffer.units, extBuffer.extravalues,   extBuffer.units)
--- 
--- --Creates a 100-point reading buffer named extBuffer. Style is full writable.
--- --Set the data format to show units of watts with 3½ digit resolution for the first value and for the second value in the buffer index.
--- --Write 12 pieces of data into the buffer.
--- --Print the buffer, including the readings and units.
--- --Read the buffer.
--- --Output:
--- --1, Watt DC, 7, Watt DC, 2, Watt DC, 8, Watt DC, 3, Watt DC, 9, Watt DC, 4, Watt DC, 10, Watt DC, 5, Watt DC, 11, Watt DC, 6, Watt DC, 12, Watt DC
--- ```
---@param bufferVar bufferMethods The name of the buffer
---@param units bufferwriteformatunits The units for the first measurement in the buffer index
---@param displayDigits bufferwriteformatdisplayDigits The number of digits to use for the first measurement
---@param extraUnits bufferwriteformatunits The units for the second measurement in the buffer index; the selections are the same as units (only valid for buffer style WRITABLE_FULL); if not specified, uses the value for units
---@param extraDigits bufferwriteformatdisplayDigits The number of digits to use for the second measurement; the selections are the same as displayDigits (only valid for buffer style WRITABLE_FULL); if not specified, uses the value for displayDigits
---@overload fun(bufferVar:bufferMethods,units:bufferwriteformatunits,displayDigits:bufferwriteformatdisplayDigits)
---@overload fun(bufferVar:bufferMethods,units:bufferwriteformatunits,displayDigits:bufferwriteformatdisplayDigits,extraUnits:bufferwriteformatunits)
function buffer.write.format(bufferVar, units, displayDigits, extraUnits, extraDigits) end


--- **This function allows you to write readings into the reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For buffers that are set to the writable buffer style:For buffers that are set to the full writable buffer style:This command writes the data you specify into a reading buffer. The reading buffer must be set to the writable or full writable style, which is set when you make the buffer.Data must be added in chronological order. If the time is not specified for a reading, it is set to one integer second after the last reading. As you write the data, the front-panel home screen updates and displays the reading you entered.The status parameter provides additional information about the reading. The options are shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/46428.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- extBuffer = buffer.make(100, buffer.STYLE_WRITABLE)
--- buffer.write.format(extBuffer, buffer.UNIT_WATT, buffer.DIGITS_3_5)
--- buffer.write.reading(extBuffer, 1)
--- buffer.write.reading(extBuffer, 2)
--- buffer.write.reading(extBuffer, 3)
--- buffer.write.reading(extBuffer, 4)
--- buffer.write.reading(extBuffer, 5)
--- buffer.write.reading(extBuffer, 6)
--- printbuffer(1, 6, extBuffer.readings, extBuffer.units)
--- 
--- --Creates a 100-point reading buffer named extBuffer. Style is writable.
--- --Set the data format to show units of watts with 3½ digit resolution.
--- --Write 6 pieces of data into the buffer.
--- --Print the buffer, including the readings and units.
--- --Read the buffer.
--- --Output:
--- --1, Watt DC, 2, Watt DC, 3, Watt DC, 4, Watt DC, 5, Watt DC, 6, Watt DC
--- extBuffer = buffer.make(100, buffer.STYLE_WRITABLE_FULL)
--- buffer.write.format(extBuffer, buffer.UNIT_WATT, buffer.DIGITS_3_5,   buffer.UNIT_WATT, buffer.DIGITS_3_5)
--- buffer.write.reading(extBuffer, 1, 7)
--- buffer.write.reading(extBuffer, 2, 8)
--- buffer.write.reading(extBuffer, 3, 9)
--- buffer.write.reading(extBuffer, 4, 10)
--- buffer.write.reading(extBuffer, 5, 11)
--- buffer.write.reading(extBuffer, 6, 12)
--- printbuffer(1, 6, extBuffer.readings, extBuffer.units, extBuffer.extravalues,   extBuffer.units)
--- 
--- --Creates a 100-point reading buffer named extBuffer. Style is full writable.
--- --Set the data format to show units of watts with 3½ digit resolution for the first value and for the second value in the buffer index.
--- --Write 12 pieces of data into the buffer.
--- --Print the buffer, including the readings and units.
--- --Read the buffer.
--- --Output:
--- --1, Watt DC, 7, Watt DC, 2, Watt DC, 8, Watt DC, 3, Watt DC, 9, Watt DC, 4, Watt DC, 10, Watt DC, 5, Watt DC, 11, Watt DC, 6, Watt DC, 12, Watt DC
--- reset()
--- eventlog.clear()
--- buf = buffer.make(10, buffer.STYLE_WRITABLE_FULL)
--- slot[1].pseudocard = 7700
--- slot[2].pseudocard = 7700
--- buffer.write.reading(buf, 10, 20, 1, 0.01, 0, "101")
--- buffer.write.reading(buf, 11, 21, 1, 0.1, 0, "120")
--- buffer.write.reading(buf, 11, 21, 2, 0.1, 0, "220")
--- printbuffer(1, 2, buf.channels)
--- 
--- --Reset the instrument.
--- --Clear the event log.
--- --Create 10-point reading buffer named buf with a style of writable.
--- --Set both slots to use a 7700 pseudocard.
--- --Write data into the buffer.
--- --Read the buffer.
--- --Output:
--- --101, 120
--- ```
---@param bufferVar bufferMethods The name of the buffer
---@param readingValue number The first value that is recorded in the buffer index
---@param extraValue number A second value that is recorded in the buffer index (only valid for buffer style WRITABLE_FULL)
---@param seconds number An integer that represents the seconds
---@param fractionalSeconds number The portion of the time that represents the fractional seconds
---@param status readingStatus Additional information about the reading; see Details
---@param channel string A string that specifies the channel to which to assign the data
---@overload fun(bufferVar:bufferMethods,readingValue:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number,seconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number,fractionalSeconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number,fractionalSeconds:number,status:readingStatus)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number,seconds:number,fractionalSeconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number,fractionalSeconds:number,status:readingStatus,channel:string)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number,seconds:number,fractionalSeconds:number,status:readingStatus)
function buffer.write.reading(bufferVar, readingValue, extraValue, seconds, fractionalSeconds, status, channel) end
---@class channel.multiple
channel.multiple = {}


--- **This function closes the listed channels without affecting any other channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command closes the specified channels without affecting any other channels, including paired channels.If the channel list is large, you should use the opc() function with the multiple close.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72204.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.multiple.close("101:109")
--- 
--- --Close channels 1 to 9 on slot 1. Paired channels and backplane relays are not affected.
--- ```
---@param channelList string The list of channels to close
function channel.multiple.close(channelList) end


--- **This function opens the channels in the channel list without affecting any others.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Opens only the specified channels. Backplane relays and paired channels are not affected. 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72205.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.multiple.open("102, 103, 104")
--- 
--- --Open channels 102, 103, and 104.
--- ```
---@param channelList string A list of the channels to open
function channel.multiple.open(channelList) end
---@class scan.start
scan.start = {}


--- **This attribute determines which event starts the scan.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The events that you can use to start the scan are described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72278.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.start.stimulus = trigger.EVENT_SCAN_CHANNEL_READY
--- 
--- --Start the scan when the channels have closed.
--- scan.start.stimulus = trigger.EVENT_NONE
--- 
--- --Start the scan immediately.
--- scan.start.stimulus = trigger.EVENT_DIGIO3
--- 
--- --The scan begins when the instrument receives a signal from digital I/O line 3.
--- ```
---@type triggerEvents|0
scan.start.stimulus= 0

---@class scan.channel
scan.channel = {}


--- **This attribute determines which trigger event causes the channel action to occur.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the event ID to one of the options in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72279.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
--- scan.channel.stimulus = trigger.EVENT_TIMER1
--- scan.create("101:105")
---  
--- trigger.timer[1].count = 0
--- trigger.timer[1].delay = 1
--- trigger.timer[1].enable = trigger.ON
---  
--- timer.cleartime()
--- trigger.model.initiate()
--- waitcomplete()
--- 
--- --Reset the instrument.
--- --Set up channels 1 to 5 in slot 1 to measure DC voltage with an NPLC of 0.01.
--- --Set the channel stimulus to event timer 1.
--- --Create a scan list that includes channels 1 to 5 in slot 1.
--- --Set the trigger timer to generate trigger events indefinitely.
--- --Set the delay between triggers to 1 s.
--- --Turn the trigger timer on.
--- --Reset the timer to 0 s.
--- --Start the trigger model.
--- ```
---@type triggerEvents|0
scan.channel.stimulus= 0

---@class scan.measure
scan.measure = {}


--- **This attribute selects the trigger for the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this to start a set of measurement count readings that are triggered by a single event.The available trigger events are described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72280.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- scan.add("101:109")
--- scan.restart = scan.ON
--- scan.bypass = scan.ON
--- scan.scancount = 10
--- scan.start.stimulus = trigger.EVENT_EXTERNAL
--- scan.channel.stimulus = trigger.EVENT_LAN1
--- scan.measure.stimulus = trigger.EVENT_DISPLAY
--- scan.scaninterval = 0.5
--- scan.measure.interval = 1
--- scan.monitor.channel = "102"
--- scan.monitor.mode = scan.MODE_HIGH
--- scan.monitor.limit.high.value = 10
--- 
--- --Reset the instrument.
--- --Set up channels 101 to 109 to measure on the DC voltage function.
--- --Add channels 101 to 109 to a scan.
--- --Set the scan restart on power loss option on.
--- --Set the scan bypass on first scan option on.
--- --Set the scan count to 10.
--- --Set the scan start stimulus to the rear-panel EXTERNAL TRIGGER IN terminal.
--- --Set the channel stimulus to LAN line 1.
--- --Set the measure stimulus to the front-panel TRIGGER key.
--- --Set the scan interval to 1 s.
--- --Set the monitor channel to 102.
--- --Set the scan mode to start the scan when the measurements reach a high value of 10 V.
--- ```
---@type triggerEvents|0
scan.measure.stimulus= 0



--- **This attribute specifies the interval time between measurement requests.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the time between measurements in the scan.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/75013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("101:109")
--- scan.scancount = 10
--- scan.measure.interval = 1.0
--- 
--- --Create a scan of channels 101 to 109.
--- --Set the scan count to 10.
--- --Provide a one second delay between each measurement in the scan.
--- ```
scan.measure.interval = 0

---@class scan.monitor
scan.monitor = {}

scan.MODE_OFF = nil
scan.MODE_HIGH = nil
scan.MODE_LOW = nil
scan.MODE_OUTSIDE = nil
scan.MODE_WINDOW = nil

---@alias scanmonitormodevalue
---|`scan.MODE_OFF`
---|`scan.MODE_HIGH`
---|`scan.MODE_LOW`
---|`scan.MODE_OUTSIDE`
---|`scan.MODE_WINDOW`



--- **This attribute determines if a scan starts immediately when triggered or after measurements reach a set value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines if measurements are monitored to start a scan. If measurements are monitored, it also determines if the measurement triggers the start of the scan when it reaches a high value, low value, inside the high and low values, or outside the high and low values. The scan start values are stored in defbuffer2.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72552.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
--- channel.setdmm("201", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- scan.monitor.limit.high.value = 28
--- scan.create("101:105")
--- scan.monitor.mode = scan.MODE_HIGH
--- trigger.model.initiate()
--- 
--- --With 7700 switching modules in slot 1 and slot 2, set up channels 1 to 5 on slot 1 to measure DC voltage with an NPLC of 0.01.
--- --Set up channel 1 in slot 2 to measure temperature.
--- --Set the monitoring channel to be 201.
--- --Set the high limit to 28 °C.
--- --Create a scan that includes data for channels 101 to 105.
--- --Set the scan monitor function to allow scanning to start when the measured value exceeds the defined high limit value (28 °C).
--- --Initiate the scan, which starts when the temperature of channel 201 is above 28 °C.
--- ```
---@type scanmonitormodevalue
scan.monitor.mode = 0



--- **This attribute defines which channel to monitor for a limit to be reached before starting the scan.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The channel to monitor for a limit to be reached before starting the scan.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72565.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
--- channel.setdmm("201", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- scan.monitor.limit.high.value = 28
--- scan.create("101:105")
--- scan.monitor.mode = scan.MODE_HIGH
--- trigger.model.initiate()
--- 
--- --With 7700 switching modules in slot 1 and slot 2, set up channels 1 to 5 on slot 1 to measure DC voltage with an NPLC of 0.01.
--- --Set up channel 1 in slot 2 to measure temperature.
--- --Set the monitoring channel to be 201.
--- --Set the high limit to 28 °C.
--- --Create a scan that includes data for channels 101 to 105.
--- --Set the scan monitor function to allow scanning to start when the measured value exceeds the defined high limit value (28 °C).
--- --Initiate the scan, which starts when the temperature of channel 201 is above 28 °C.
--- ```
scan.monitor.channel = 0

---@type slotArr[]
slotArr.matrix = {}


--- **This attribute returns the number of columns in the matrix for the card in the specified slot.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This attribute is only available if the installed switching module supports matrix channels. If matrix channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73111.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[2].matrix.columns)
--- 
--- --Returns the number of columns in the matrix on the switching module in slot 2.
--- --Example output if the switching module is a 7709:
--- --8
--- ```


--- **This attribute returns the number of rows in the matrix on the card in the specified slot.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports matrix channels. If matrix channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73112.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[2].matrix.rows)
--- 
--- --Returns the number of rows in the matrix on the switching module in slot 2. Example output:
--- --6
--- ```
---@type slotArr[]
slotArr.amps = {}


--- **This attribute indicates the last channel in the specified slot that supports amps measurements.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support amps measurements are grouped, so you can use the start and end channel numbers to identify a group of channels that supports amps measurements. If the card supports amps measurements, the returned value is the number of the end channel. If only one channel on the card supports amps measurements, the end channel matches the start channel. If the channel does not support amps measurements, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73113.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[2].amps.startchannel)
--- print(slot[2].amps.endchannel)
--- 
--- --If the DAQ6510 contains a 7702 switching module in slot 2, these commands return 41 for the start channel and 42 for the end channel.
--- ```


--- **This attribute indicates the first channel in the specified slot that supports current measurements.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support current measurements are grouped, so you can use the start and end channel numbers to identify the group of channels that supports current measurements. If the card supports current measurements, the returned value is the number of the start channel. If only one channel on the card supports current measurements, the start channel matches the end channel. If the channel does not support current measurements, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73114.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[2].amps.startchannel)
--- print(slot[2].amps.endchannel)
--- 
--- --If the DAQ6510 contains a 7702 switching module in slot 2, these commands return 41 for the start channel and 42 for the end channel.
--- ```
---@type slotArr[]
slotArr.analogoutput = {}


--- **This attribute indicates the first channel in the specified slot that supports analog outputs.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support analog outputs are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card supports analog outputs, the returned value is the number of the start channel. If only one channel on the card supports analog outputs, the start channel matches the end channel. If the channel does not support analog outputs, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].analogoutput.startchannel)
--- print(slot[1].analogoutput.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching module in slot 1, these commands return 23 for the start channel and 24 for the end channel.
--- ```


--- **This attribute indicates the last channel in the specified slot that supports analog outputs.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support analog outputs are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card supports analog outputs, the returned value is the number of the last channel. If only one channel on the card supports analog outputs, the start channel matches the end channel. If the channel does not support analog outputs, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73116.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].analogoutput.startchannel)
--- print(slot[1].analogoutput.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching module in slot 1, these commands return 23 for the start channel and 24 for the end channel.
--- ```
---@type slotArr[]
slotArr.digitalio = {}


--- **This attribute indicates the first channel in the specified slot that supports digital inputs and outputs.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support digital inputs and outputs are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card supports digital inputs and outputs, the returned value is the number of the start channel. If only one channel on the card supports digital inputs and outputs, the start channel matches the end channel. If the channel does not support digital inputs and outputs, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73136.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].digitalio.startchannel)
--- print(slot[1].digitalio.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching module in slot 1, these commands return 21 for the start channel and 22 for the end channel.
--- ```


--- **This attribute indicates the last channel in the specified slot that supports digital inputs and outputs.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support digital inputs and outputs are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card supports digital inputs and outputs, the returned value is the number of the end channel. If only one channel on the card supports digital inputs and outputs, the start channel matches the end channel. If the channel does not support digital inputs and outputs, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73137.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].digitalio.startchannel)
--- print(slot[1].digitalio.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching module in slot 1, these commands return 21 for the start channel and 22 for the end channel.
--- ```
---@type slotArr[]
slotArr.isolated = {}


--- **This attribute indicates the last channel in the specified slot that has isolated channels.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that are isolated are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card includes isolated channels, the returned value is the number of the end channel. If only one channel on the card is isolated, the start channel matches the end channel. If none of the channels are isolated, the return is nil.This command is not available for the Model 7709 switching module.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73147.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[2].isolated.startchannel)
--- print(slot[2].isolated.endchannel)
--- 
--- --If the DAQ6510 contains a 7705 switching module in slot 2, these commands return 1 for the start channel and 40 for the end channel.
--- ```


--- **This attribute indicates the first channel in the specified slot that has isolated channels.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that are isolated are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card includes isolated channels, the returned value is the number of the first isolated channel. If only one channel on the module is isolated, the start channel matches the end channel. If none of the channels are isolated, the return is nil.This command is not available for the Model 7709 switching module.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73148.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[2].isolated.startchannel)
--- print(slot[2].isolated.endchannel)
--- 
--- --If the DAQ6510 contains a 7705 switching module in slot 2, these commands return 1 for the start channel and 40 for the end channel.
--- ```
---@type slotArr[]
slotArr.totalizer = {}


--- **This attribute indicates the first totalizer channel in the specified slot.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The totalizer channels are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card includes totalizer channels, the returned value is the number of the first totalizer channel. If there is only one totalizer channel, the start channel matches the end channel. If none of the channels are totalizers, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73173.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].totalizer.startchannel)
--- print(slot[1].totalizer.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching module in slot 1, these commands return 25 for both the start channel and end channel.
--- ```


--- **This attribute indicates the last totalizer channel in the specified slot.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The totalizer channels are grouped, so you can use the start and end channel numbers to identify the group of channels. If the card includes totalizer channels, the returned value is the number of the last totalizer channel. If there is only one totalizer channel, the start channel matches the end channel. If none of the channels are totalizers, the return is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73174.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].totalizer.startchannel)
--- print(slot[1].totalizer.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 card in slot 1, these commands return 25 for both the start channel and end channel.
--- ```
---@type slotArr[]
slotArr.voltage = {}


--- **This attribute indicates the last channel in the specified slot that supports voltage or 2-wire measurements.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support voltage or 2-wire measurements are grouped, so you can use the start and end channel numbers to identify the group. If the card supports voltage or 2-wire measurements, the returned value is the number of the last channel. If only one channel on the card supports voltage or 2-wire measurements, the start channel matches the end channel. If the channel does not support voltage or 2-wire measurements, the return is nil.This command is not available for the 7709 switching module.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73176.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].voltage.startchannel)
--- print(slot[1].voltage.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching module in slot 1, these commands return 1 for the start channel and 20 for the end channel.
--- ```


--- **This attribute indicates the first channel in the specified slot that supports voltage or 2-wire measurements.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The channels that support voltage or 2-wire measurements are grouped, so you can use the start and end channel numbers to identify the group. If the card supports voltage or 2-wire measurements, the returned value is the number of the start channel. If only one channel on the card supports voltage or 2-wire measurements, the start channel matches the end channel. If the channel does not support voltage or 2-wire measurements, the return is nil.This command is not available for the 7709 switching module.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/73177.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].voltage.startchannel)
--- print(slot[1].voltage.endchannel)
--- 
--- --If the DAQ6510 contains a 7706 switching modulein slot 1, these commands return 1 for the start channel and 20 for the end channel.
--- ```
---@class dmm.measure.configlist
dmm.measure.configlist = {}


--- **This function creates an empty measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command creates an empty configuration list. To add configuration indexes to this list, you need to use the store command.Configuration lists are not saved when the instrument is turned off. To save a configuration list, create a configuration script to save instrument settings, including any defined configuration lists.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/25691.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.configlist.create("MyMeasList")
--- 
--- --Create a measure configuration list named MyMeasList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
function dmm.measure.configlist.create(listName) end


--- **This function returns the name of one measure configuration list that is stored on the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this command to retrieve the names of measure configuration lists that are stored in the instrument. This command returns one name each time you send it. This command returns nil to indicate that there are no more names to return. If the command returns nil the first time you send it, no measure configuration lists have been created for the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/28417.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.measure.configlist.catalog())
--- 
--- --Request the name of one measure configuration list that is stored in the instrument. Send the command again until it returns nil to get all stored lists.
--- ```
function dmm.measure.configlist.catalog() end


--- **This function returns a list of TSP commands and parameter settings that are stored in the specified configuration index.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command recalls data for one configuration index.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/28418.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.measure.configlist.query("testMeasList", 2, "\n"))
--- 
--- --Returns the TSP commands and  parameter settings that represent the settings in configuration index 2.
--- --Partial example output:
--- --dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- --dmm.measure.unit = dmm.UNIT_VOLT
--- --dmm.measure.range = 0.1
--- --dmm.measure.autorange = dmm.ON
--- --dmm.measure.transducer is not used
--- --dmm.measure.detectorbandwidth is not used
--- --dmm.measure.autozero.enable = dmm.ON
--- --dmm.measure.autodelay = dmm.DELAY_ON
--- --dmm.measure.displaydigits = dmm.DIGITS_6_5
--- --dmm.measure.dbreference = 1
--- --dmm.measure.filter.enable = dmm.OFF
--- --dmm.measure.filter.count = 10
--- --dmm.measure.filter.type = dmm.FILTER_REPEAT_AVG
--- --dmm.measure.filter.window = 0
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@param fieldSeparator string String that represents the separator for the data; use one of the following
---@overload fun(listName:string,index:number)
function dmm.measure.configlist.query(listName, index, fieldSeparator) end


--- **This function recalls a configuration index in a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to recall the settings stored in a specific configuration index in a measure configuration list. If you do not specify an index when you send the command, it recalls the settings stored in the first configuration index in the specified measure configuration list. If you recall an invalid index (for example, calling index 3 when there are only two indexes in the configuration list) or try to recall an index from an empty configuration list, an error message is displayed.Each index contains the settings for the selected function of that index. Settings for other functions are not affected when the configuration list index is recalled. A single index stores the settings associated with a single measure or digitize function.This command recalls data for one configuration index.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/28419.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.configlist.recall("MyMeasList")
--- 
--- --Because an index was not specified, this command recalls configuration index 1 from a configuration list named MyMeasList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the measure configuration list
---@overload fun(listName:string)
function dmm.measure.configlist.recall(listName, index) end


--- **This function deletes a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Deletes a configuration list. If the index is not specified, the entire configuration list is deleted. If the index is specified, only the specified configuration index in the list is deleted.When an index is deleted from a configuration list, the index numbers of the following indexes are shifted up by one. For example, if you have a configuration list with 10 indexes and you delete index 3, the index that was numbered 4 becomes index 3, and the all the following indexes are renumbered in sequence to index 9. Because of this, if you want to delete several nonconsecutive indexes in a configuration list, it is best to delete the higher numbered index first, then the next lower index, and so on. This also means that if you want to delete all the indexes in a configuration list, you must delete index 1 repeatedly until all indexes have been removed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/28421.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.configlist.delete("myMeasList")
--- 
--- --Delete a measure configuration list named myMeasList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@overload fun(listName:string)
function dmm.measure.configlist.delete(listName, index) end


--- **This function stores the active measure or digitize settings into the named configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to store the active measure or digitize settings to a configuration index in a configuration list. If the index parameter is not provided, the new settings are appended to the end of the list. The index only stores the active settings for a single active measure or digitize function.A measure configuration list can store measure or digitize settings, but not at the same time. If the active function is a digitize function, digitize settings are saved. When the index is queried, digitize settings and their values are listed, but measure settings are listed as not being used. Similarly, if the active function is a measure function, measure settings are saved. When the index is queried, the measure settings and their values are listed, but the digitize settings are listed as not used.Configuration lists are not saved when the instrument is turned off or reset. To save a configuration list, create a configuration script to save instrument settings, including any defined configuration lists.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30559.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.configlist.store("MyConfigList")
--- 
--- --Stores the active settings of the instrument to the end of the configuration list MyConfigList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@overload fun(listName:string)
function dmm.measure.configlist.store(listName, index) end


--- **This function returns the size (number of configuration indexes) of a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/32926.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.measure.configlist.size("testMeasList"))
--- 
--- --Returns the number of configuration indexes in a measure configuration list named testMeasList.
--- --Example output:
--- --1
--- ```
---@return number indexCount A number that represents the total count of indexes stored in the specified measure configuration list
---@param listName string A string that represents the name of a measure configuration list
function dmm.measure.configlist.size(listName) end


--- **This function allows you to store the settings for a measure function into a measure configuration list whether or not the function is active.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must create the configuration list before using this command.If index is not specified, the settings are stored to the next available index in the configuration list.You can set function to the values in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/91273.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.configlist.create("MyMeasList")
--- dmm.measure.configlist.storefunc("MyMeasList", dmm.FUNC_DC_VOLTAGE)
--- dmm.measure.configlist.storefunc("MyMeasList", dmm.FUNC_DC_TEMPERATURE, 2)
--- 
--- --Create a measure configuration list named MyMeasList.
--- --Store the attributes for the DC Voltage settings in index 1.
--- --Stores attributes for the Temperature function in index 2.
--- ```
---@param listName string Name of the configuration list in which to store the function settings
---@param measFunction functions The measure function settings to save into the configuration list; see Details
---@param index number The number of the configuration list index in which to store the settings
---@overload fun(listName:string)
function dmm.measure.configlist.storefunc(listName, measFunction, index) end
---@class dmm.measure.autozero
dmm.measure.autozero = {}


--- **This function causes the instrument to refresh the reference and zero measurements once.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command forces a refresh of the reference and zero measurements that are used for the present aperture setting for the selected function.When autozero is set to off, the instrument may gradually drift out of specification. To minimize the drift, you can send the once command to make a reference and zero measurement immediately before a test sequence.If the NPLC setting is less than 0.2 PLC, sending autozero once can result in delay of more than a second.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/29049.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.autozero.once()
--- 
--- --Do a one-time refresh of the reference and zero measurements.
--- ```
function dmm.measure.autozero.once() end

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasureautozeroenablestate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To ensure the accuracy of readings, the instrument must periodically get new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture that is being used for measurements. The DAQ6510 uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made.The time to make the reference measurements is in addition to the normal measurement time. If timing is critical, you can disable autozero to avoid this time penalty.When autozero is set to off, the instrument may gradually drift out of specification. To minimize the drift, you can send the once command to make a reference and zero measurement immediately before a test sequence.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.autozero.enable = dmm.OFF
--- 
--- --Set autozero off for voltage measurements.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_NPLC, 0.5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_DIGITS, dmm.DIGITS_5_5)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set autozero off.
--- --Set NPLC to 0.5.
--- --Set the number of display digits to 5½.
--- ```
---@type dmmmeasureautozeroenablestate
dmm.measure.autozero.enable = 0

---@type triggertimerArr[]
triggertimerArr.start = {}

trigger.OFFG = nil
trigger.ON = nil

---@alias triggertimerstartgeneratestate
---|`trigger.OFFG`
---|`trigger.ON`



--- **This attribute specifies when timer events are generated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is set to on, a trigger event is generated immediately when the timer is triggered.When it is set to off, a trigger event is generated when the timer elapses. This generates the event trigger.EVENT_TIMERN.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30536.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[4].reset()
--- trigger.timer[4].delay = 0.5
--- trigger.timer[4].start.stimulus = trigger.EVENT_NOTIFY8
--- trigger.timer[4].start.generate = trigger.OFF
--- trigger.timer[4].count = 20
--- trigger.timer[4].enable = trigger.ON
--- 
--- --Reset trigger timer 4.
--- --Set trigger timer 4 to have a 0.5 s delay.
--- --Set the stimulus for trigger timer 4 to be the notify 8 event.
--- --Set the timer event to occur when the timer delay elapses.
--- --Set the trigger timer 4 count to 20.
--- --Enable trigger timer 4.
--- ```
---@type triggertimerstartgeneratestate
triggertimerArr.start.generate= 0



--- **This attribute indicates if an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command indicates if an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the timer itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other construct that is monitoring the delay completion event. It also is not an indication of a delay overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/30553.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].start.overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If the event was not ignored, the output is false.
--- ```


--- **This attribute configures the seconds of an alarm or a time in the future when the timer will start.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command configures the alarm of the timer.When the timer is enabled, the timer starts immediately if the timer is configured for a start time that has passed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33984.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].start.seconds = localnode.gettime() + 30
--- trigger.timer[1].enable = trigger.ON
--- 
--- --Set the trigger timer to start 30 s from the time when the timer is enabled.
--- ```
triggertimerArr.start.seconds= 0



--- **This attribute configures the fractional seconds of an alarm or a time in the future when the timer will start.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command configures the alarm of the timer.When the timer is enabled, the timer starts immediately if the timer is configured for a start time that has passed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/33985.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].start.fractionalseconds = 0.4
--- 
--- --Set the trigger timer to start in 0.4 s.
--- ```
triggertimerArr.start.fractionalseconds= 0



--- **This attribute describes the event that starts the trigger timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the stimulus to any trigger event to start the timer when that event occurs.Set the stimulus to none to disable event processing and use the timer as a timer or alarm based on the start time.Trigger events are described in the table below.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/77683.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[3].mode = digio.MODE_TRIGGER_IN
--- trigger.timer[1].delay = 3e-3
--- trigger.timer[1].start.stimulus = trigger.EVENT_DIGIO3
--- 
--- --Set digital I/O line 3 to be a trigger input.
--- --Set timer 1 to delay for 3 ms.
--- --Set timer 1 to start the timer when an event is detected on digital I/O line 3.
--- ```
---@type eventID|0
triggertimerArr.start.stimulus= 0

---@class dmm.measure.filter
dmm.measure.filter = {}


--- **This attribute sets the number of measurements that are averaged when filtering is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The filter count is the number of readings that are acquired and stored in the filter stack for the averaging calculation. When the filter count is larger, more filtering is done, and the data is less noisy.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41157.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.filter.count = 10
--- dmm.measure.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.measure.filter.enable = dmm.ON
--- 
--- --Set the measurement function to current.
--- --Set the averaging filter type to moving average, with a filter count of 10.
--- --Enable the averaging filter.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_COUNT, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_TYPE, dmm.FILTER_REPEAT_AVG)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_WINDOW, 0.25)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_ENABLE, dmm.ON)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the averaging filter type to repeating with a filter count of 10.
--- --Set the filter window to 0.25 and enable the averaging filter.
--- ```
dmm.measure.filter.count = 0


dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasurefilterenablefilterState
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute enables or disables the averaging filter for measurements of the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the averaging filter. When this is enabled, the reading returned by the instrument is an averaged value, taken from multiple measurements. The settings of the filter count and filter type for the selected measure function determines how the reading is averaged.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41161.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.filter.count = 10
--- dmm.measure.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.measure.filter.enable = dmm.ON
--- 
--- --Set the measurement function to current.
--- --Set the averaging filter type to moving average, with a filter count of 10.
--- --Enable the averaging filter.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_COUNT, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_TYPE, dmm.FILTER_REPEAT_AVG)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_WINDOW, 0.25)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_ENABLE, dmm.ON)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the averaging filter type to repeating with a filter count of 10.
--- --Set the filter window to 0.25 and enable the averaging filter.
--- ```
---@type dmmmeasurefilterenablefilterState
dmm.measure.filter.enable = 0


dmm.FILTER_REPEAT_AVGM = nil
dmm.FILTER_MOVING_AVG = nil
dmm.FILTER_HYBRID_AVG = nil

---@alias dmmmeasurefiltertypetype
---|`dmm.FILTER_REPEAT_AVGM`
---|`dmm.FILTER_MOVING_AVG`
---|`dmm.FILTER_HYBRID_AVG`



--- **This attribute defines the type of averaging filter that is used for the selected measure function when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the repeating average filter is selected, a set of measurements are made. These measurements are stored in a measurement stack and averaged together to produce the averaged sample. Once the averaged sample is produced, the stack is flushed, and the next set of data is used to produce the next averaged sample. This type of filter is the slowest, since the stack must be completely filled before an averaged sample can be produced.When the moving average filter is selected, the measurements are added to the stack continuously on a first-in, first-out basis. As each measurement is made, the oldest measurement is removed from the stack. A new averaged sample is produced using the new measurement and the data that is now in the stack.The repeating average filter produces slower results but produces more stable results than the moving average filter. For either method, the greater the number of measurements that are averaged, the slower the averaged sample rate, but the lower the noise error. Trade-offs between speed and noise are normally required to tailor the instrumentation to your measurement application.The repeating average filter is the only filter option available for use with channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.measure.filter.enable = dmm.ON
--- 
--- --Set the measurement function to DC current. Set the filter type to moving average and enable filtered measurements.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_COUNT, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_TYPE, dmm.FILTER_REPEAT_AVG)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_WINDOW, 0.25)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_ENABLE, dmm.ON)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the averaging filter type to repeating with a filter count of 10.
--- --Set the filter window to 0.25 and enable the averaging filter.
--- ```
---@type dmmmeasurefiltertypetype
dmm.measure.filter.type = 0



--- **This attribute sets the window for the averaging filter that is used for measurements for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command selects the window size for the averaging filter.The noise window allows a faster response time to large signal step changes. A reading that falls outside the plus or minus noise window fills the filter stack immediately.If the noise does not exceed the selected percentage of range, the reading is based on an average of reading conversions — the normal averaging filter. If the noise does exceed the selected percentage, the reading is a single reading conversion, and new averaging starts from this point.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41173.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_RESISTANCE
--- dmm.measure.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.measure.filter.window = 0.25
--- dmm.measure.filter.enable = dmm.ON
--- 
--- --Set the measure function to 2-wire ohms.
--- --Set the filter type to moving average.
--- --Set the filter window to 0.25 and enable filtered measurements.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_COUNT, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_TYPE, dmm.FILTER_REPEAT_AVG)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_WINDOW, 0.25)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FILTER_ENABLE, dmm.ON)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to DC voltage.
--- --Set the averaging filter type to repeating with a filter count of 10.
--- --Set the filter window to 0.25 and enable the averaging filter.
--- ```
dmm.measure.filter.window = 0

---@class dmmmeasurelimitArr
dmmmeasurelimitArr = {}

---@type dmmmeasurelimitArr[]
dmm.measure.limit = {}

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasurelimitautoclearvalue
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41208.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
---@type dmmmeasurelimitautoclearvalue
dmmmeasurelimitArr.autoclear= 0



--- **This function clears the results of the limit test defined by Y.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to clear the test results of limit Y when the limit auto clear option is turned off. Both the high and low test results are cleared.To avoid the need to manually clear the test results for a limit, turn the auto clear option on.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- print(channel.getdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_1))
--- print(channel.getdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_2))
---  
--- -- Clear limit 1 conditions
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_1, dmm.FAIL_NONE)
--- -- Clear limit 2 conditions
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_2, dmm.FAIL_NONE)
---  
--- print(channel.getdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_1))
--- print(channel.getdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_2))
--- 
--- --This example outputs the fail conditions for channels 101 and 102 for limits 1 and 2. It then clears the fail conditions.
--- --Example output showing readings on channels 101 and 102 failed limit 1 low values:
--- --[1]=dmm.FAIL_LOW, [2]=dmm.FAIL_LOW
--- --[1]=dmm.FAIL_NONE, [2]=dmm.FAIL_NONE
--- --Example output showing the failed conditions are cleared:
--- --[1]=dmm.FAIL_NONE, [2]=dmm.FAIL_NONE
--- --[1]=dmm.FAIL_NONE, [2]=dmm.FAIL_NONE
--- ```
function dmmmeasurelimitArr.clear() end


dmm.FAIL_NONE = nil
dmm.FAIL_HIGH = nil
dmm.FAIL_LOW = nil
dmm.FAIL_BOTH = nil

---@alias dmmmeasurelimitfailvalue
---|`dmm.FAIL_NONE`
---|`dmm.FAIL_HIGH`
---|`dmm.FAIL_LOW`
---|`dmm.FAIL_BOTH`



--- **This attribute queries the results of a limit test.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command queries the result of a limit test for the selected measurement function.The response message indicates if the limit test passed or how it failed (on the high or low limit).If autoclear is set to off, reading the results of a limit test does not clear the fail indication of the test. To clear a failure, send the clear command. To automatically clear the results, set auto clear on.If auto clear is set to on and you are making a series of measurements, the last measurement limit determines the fail indication for the limit. If auto clear is turned off, the results return a test fail if any of one of the readings failed.To use this attribute, you must set the limit state to on.If the readings are stored in a reading buffer, you can use the bufferVar.statuses command to see the results.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41214.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasurelimitenablestate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute enables or disables a limit test on the measurement from the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables a limit test for the selected measurement function. When this attribute is enabled, the limit Y testing occurs on each measurement made by the instrument. Limit Y testing compares the measurements to the high-limit and low-limit values. If a measurement falls outside these limits, the test fails.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41231.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
---@type dmmmeasurelimitenablestate
dmmmeasurelimitArr.enable= 0


dmm.AUDIBLE_NONEO = nil
dmm.AUDIBLE_FAILO = nil
dmm.AUDIBLE_PASS = nil

---@alias dmmmeasurelimitaudiblestate
---|`dmm.AUDIBLE_NONEO`
---|`dmm.AUDIBLE_FAILO`
---|`dmm.AUDIBLE_PASS`



--- **This attribute determines if the instrument beeper sounds when a limit test passes or fails.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The tone and length of beeper cannot be adjusted.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41684.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
---@type dmmmeasurelimitaudiblestate
dmmmeasurelimitArr.audible= 0

---@class dmmdigitizelimitArr
dmmdigitizelimitArr = {}

---@type dmmdigitizelimitArr[]
dmm.digitize.limit = {}

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmdigitizelimitautoclearstate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.limit[1].autoclear = dmm.OFF
--- 
--- --Turns off autoclear for limit 1 when measuring digitize voltage.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_1, dmm.OFF)
--- 
--- --Set the measurement function on channels 1 to 3 of slot 1 to digitize voltage. Set auto clear on limit 2 off.
--- ```
---@type dmmdigitizelimitautoclearstate
dmmdigitizelimitArr.autoclear= 0



--- **This attribute clears the results of the limit test defined by Y.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to clear the test results of limit Y when the limit auto clear option is turned off. Both the high and low test results are cleared.To avoid the need to manually clear the test results for a limit, turn the auto clear option on.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.limit[1].clear()
--- 
--- --Set the digitize function to voltage.
--- --Clear the results of limit test 1.
--- print(channel.getdmm("101:102", dmm.ATTR_DIGI_LIMIT_FAIL_1))
--- print(channel.getdmm("101:102", dmm.ATTR_DIGI_LIMIT_FAIL_2))
---  
--- -- Clear limit 1 conditions
--- channel.setdmm("101:102", dmm.ATTR_DIGI_LIMIT_FAIL_1, dmm.FAIL_NONE)
--- -- Clear limit 2 conditions
--- channel.setdmm("101:102", dmm.ATTR_DIGI_LIMIT_FAIL_2, dmm.FAIL_NONE)
---  
--- print(channel.getdmm("101:102", dmm.ATTR_DIGI_LIMIT_FAIL_1))
--- print(channel.getdmm("101:102", dmm.ATTR_DIGI_LIMIT_FAIL_2))
--- 
--- --This example outputs the fail conditions for channels 101 and 102 for limits 1 and 2. It then clears the fail conditions.
--- --Example output showing readings on channels 101 and 102 failed limit 1 low values:
--- --[1]=dmm.FAIL_LOW, [2]=dmm.FAIL_LOW
--- --[1]=dmm.FAIL_NONE, [2]=dmm.FAIL_NONE
--- --Example output showing the failed conditions are cleared:
--- --[1]=dmm.FAIL_NONE, [2]=dmm.FAIL_NONE
--- --[1]=dmm.FAIL_NONE, [2]=dmm.FAIL_NONE
--- ```
function dmmdigitizelimitArr.clear() end


dmm.FAIL_NONE = nil
dmm.FAIL_HIGH = nil
dmm.FAIL_LOW = nil
dmm.FAIL_BOTH = nil

---@alias dmmdigitizelimitfailvalue
---|`dmm.FAIL_NONE`
---|`dmm.FAIL_HIGH`
---|`dmm.FAIL_LOW`
---|`dmm.FAIL_BOTH`


dmm.FUNC_DIGITIZE_CURRENTV = nil
dmm.FUNC_DIGITIZE_VOLTAGE = nil

---@alias dmmdigitizelimitfailmeasFunction
---|`dmm.FUNC_DIGITIZE_CURRENTV`
---|`dmm.FUNC_DIGITIZE_VOLTAGE`



--- **This attribute queries the results of a limit test.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command queries the result of a limit test for the selected digitize function.The response message indicates if the limit test passed or how it failed (on the high or low limit).If autoclear is set to off, reading the results of a limit test does not clear the fail indication of the test. To clear a failure, send the clear command. To automatically clear the results, set auto clear on.If auto clear is set to on and you are making a series of measurements, the last measurement limit determines the fail indication for the limit. If auto clear is turned off, the results return a test fail if any of one of the readings failed.To use this attribute, you must set the limit state to on.If the readings are stored in a reading buffer, you can use the bufferVar.statuses command to see the results.See dmm.digitize.limit[Y].low.value for examples of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41221.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value
--- 
--- --The results of the limit test for limit Y:
--- --dmm.FAIL_NONE: Test passed; measurement under or equal to the high limitdmm.FAIL_HIGH: Test failed; measurement exceeded high limitdmm.FAIL_LOW: Test failed; measurement exceeded low limitdmm.FAIL_BOTH: Test failed; measurement exceeded both --- ```

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmdigitizelimitenablestate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute enables or disables a limit test on the measurement from the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables a limit test for the selected digitize function. When this attribute is enabled, the limit Y testing occurs on each measurement made by the instrument. Limit Y testing compares the measurements to the high and low limit values. If a measurement falls outside these limits, the test fails.See dmm.digitize.limit[Y].low.value for examples of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41225.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state
--- 
--- --Limit Y testing:
--- --Disable: dmm.OFFEnable: --- ```
---@type dmmdigitizelimitenablestate
dmmdigitizelimitArr.enable= 0


dmm.AUDIBLE_NONEO = nil
dmm.AUDIBLE_FAILO = nil
dmm.AUDIBLE_PASS = nil

---@alias dmmdigitizelimitaudiblevalue
---|`dmm.AUDIBLE_NONEO`
---|`dmm.AUDIBLE_FAILO`
---|`dmm.AUDIBLE_PASS`



--- **This attribute determines if the instrument beeper sounds when a limit test passes or fails.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The tone and length of beeper cannot be adjusted.See dmm.digitize.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41685.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value
--- 
--- --When the beeper sounds:
--- --Never: dmm.AUDIBLE_NONEOn test failure: dmm.AUDIBLE_FAILOn test pass: dmm.AUDIBL--- ```
---@type dmmdigitizelimitaudiblevalue
dmmdigitizelimitArr.audible= 0

---@class dmm.measure.math
dmm.measure.math = {}

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasuremathenablevalue
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute enables or disables math operations on measurements for the selected measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41235.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_PERCENT
--- dmm.measure.count = 1
--- dmm.measure.math.percent = dmm.measure.read()
--- dmm.measure.math.enable = dmm.ON
--- dmm.measure.count = 5
--- MathBuffer = buffer.make(100)
--- dmm.measure.read(MathBuffer)
--- printbuffer(1, MathBuffer.n, MathBuffer.formattedreadings)
--- dmm.measure.count = 1
--- for x = 1, 3 do 
---     print(dmm.measure.read(MathBuffer))
--- end
--- 
--- --Configure the instrument for DC volts and reset the DC volts function to the default settings.
--- --Set math format to percent.
--- --Acquire 1 reading to use as the relative percent value.
--- --Take 5 readings with percent math enabled and store them in a buffer called MathBuffer that can store 100 readings.
--- -- 
--- --Take three additional readings without using the reading buffer.
--- -- 
--- --Sample output assuming no load was connected to the instrument:
--- ---100.00242 %, -100.00228 %, -100.00220 %, -100.00233 %, -100.00216 %
--- ---100.00228175
--- ---100.0022889
--- ---100.00210915
--- -- Set channel 1 on slot 1 to use the voltage function.
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- -- Set channel 1 to use the percentage math format and enable math.
--- channel.setdmm("101", dmm.ATTR_MEAS_MATH_FORMAT, dmm.MATH_PERCENT, dmm.ATTR_MEAS_MATH_ENABLE, dmm.ON )
---  
--- -- Acquire one reading to use as the relative percent value.
--- channel.close("101")
--- dmm.measure.count = 1
--- dmm.measure.math.percent = dmm.measure.read()
---  
--- -- Create a buffer named MathBuffer that holds 100 readings.
--- MathBuffer = buffer.make(100)
---  
--- channel.setdmm("101", dmm.ATTR_MEAS_COUNT, 5)
--- channel.close("101")
--- dmm.measure.read(MathBuffer)
---  
--- printbuffer(1, MathBuffer.n, MathBuffer.formattedreadings)
--- 
--- --Configure channel 101 to measure voltage.
--- --Set math format to percent and enable the math feature.
--- --Acquire one reading to use as the relative percent value.
--- --Create a buffed named MathBuffer.
--- --Make five readings with percent math enabled and store them in MathBuffer.
--- ```
---@type dmmmeasuremathenablevalue
dmm.measure.math.enable = 0


dmm.MATH_MXBP = nil
dmm.MATH_PERCENTR = nil
dmm.MATH_RECIPROCAL = nil

---@alias dmmmeasuremathformatoperation
---|`dmm.MATH_MXBP`
---|`dmm.MATH_PERCENTR`
---|`dmm.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This specifies which math operation is performed on measurements for the selected measurement function.You can choose one of the following math operations:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41245.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_RECIPROCAL
--- dmm.measure.math.enable = dmm.ON
--- 
--- --Enables the reciprocal math operation on voltage measurements.
--- -- Set channel 1 on slot 1 to use the voltage function.
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- -- Set channel 1 to use the percentage math format and enable math.
--- channel.setdmm("101", dmm.ATTR_MEAS_MATH_FORMAT, dmm.MATH_PERCENT, dmm.ATTR_MEAS_MATH_ENABLE, dmm.ON )
---  
--- -- Acquire one reading to use as the relative percent value.
--- channel.close("101")
--- dmm.measure.count = 1
--- dmm.measure.math.percent = dmm.measure.read()
---  
--- -- Create a buffer named MathBuffer that holds 100 readings.
--- MathBuffer = buffer.make(100)
---  
--- channel.setdmm("101", dmm.ATTR_MEAS_COUNT, 5)
--- channel.close("101")
--- dmm.measure.read(MathBuffer)
---  
--- printbuffer(1, MathBuffer.n, MathBuffer.formattedreadings)
--- 
--- --Configure channel 101 to measure voltage.
--- --Set math format to percent and enable the math feature.
--- --Acquire one reading to use as the relative percent value.
--- --Create a buffed named MathBuffer.
--- --Make five readings with percent math enabled and store them in MathBuffer.
--- ```
---@type dmmmeasuremathformatoperation
dmm.measure.math.format = 0



--- **This attribute specifies the reference constant that is used when math operations are set to percent.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The percent math function displays measurements as percent deviation from a specified reference constant. The percent calculation is:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41248.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_PERCENT
--- dmm.measure.math.percent = 50
--- dmm.measure.math.enable = dmm.ON
--- 
--- --Set the measurement function to voltage.
--- --Set the math operations to percent.
--- --Set the reference constant to 50 for voltage measurements.
--- --Enable math operations.
--- -- Set channel 1 on slot 1 to use the voltage function.
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- -- Set channel 1 to use the percentage math format, set the percentage,
--- -- and enable math.
--- channel.setdmm("101", dmm.ATTR_MEAS_MATH_FORMAT, dmm.MATH_PERCENT, dmm.ATTR_MEAS_MATH_PERCENT, 42, dmm.ATTR_MEAS_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the y = mx + b math operation on voltage measurements made on channel 1 of slot 1. Set the m (scale) factor to 0.8 and the b (offset) factor to 42.
--- ```
dmm.measure.math.percent = 0

---@class dmm.digitize.rel
dmm.digitize.rel = {}


--- **This function acquires a measurement and stores it as the relative offset value for the selected digitize function.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command triggers the instrument to make a new measurement for the selected function. This measurement is then stored as the new relative offset level.When you send this command, the instrument does not apply any math, limit test, or filter settings to the measurement, even if they are set. It is a measurement that is made as if these settings are disabled.If an error event occurs during the measurement, nil is returned and the relative offset level remains at the last valid setting.You must change to the function for which you want to acquire a value before sending this command.The instrument must have relative offset enabled to use the acquired relative offset value.After executing this command, you can use the dmm.digitize.rel.level attribute to see the last relative level value that was acquired or that was set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41236.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- rel_value = dmm.digitize.rel.acquire()
--- dmm.digitize.rel.enable = dmm.ON
--- print(rel_value)
--- 
--- --Acquires a relative offset level value for the digitize current function and turns the relative offset feature on.
--- --Output the value of the offset.
--- ```
function dmm.digitize.rel.acquire() end


--- **This attribute contains the relative offset value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the relative offset value that can be applied to new digitized measurements. When relative offset is enabled, all subsequent digitized readings are offset by the value that is set for this command.You can set this value, or have the instrument acquire a value. If the instrument acquires the value, read this setting to return the value that was measured internally.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41275.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.rel.level = dmm.digitize.read()
--- dmm.digitize.rel.enable = dmm.ON
--- 
--- --Set the digitize function to digitize current.
--- --Set the relative offset level to be the reading with any calculations included.
--- --Enable the relative offset.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_REL_LEVEL, 1, dmm.ATTR_DIGI_REL_ENABLE, dmm.ON)
--- 
--- --Set up channels 1 to 3 on slot 1 for the digitize voltage function. Set the relative level to 1 V and apply the relative offset.
--- ```
dmm.digitize.rel.level = 0


dmm.OND = nil
dmm.OFF = nil

---@alias dmmdigitizerelenablestate
---|`dmm.OND`
---|`dmm.OFF`



--- **This attribute enables or disables the application of a relative offset value to the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When relative measurements are enabled, all subsequent digitized readings are offset by the relative offset value that was calculated when you acquired the relative offset value.Each returned measured relative reading is the result of the following calculation:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41280.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.rel.acquire()
--- dmm.digitize.rel.enable = dmm.ON
--- 
--- --Enables the relative measurements for digitize current after using the acquire command to set the relative level.
--- channel.setdmm("101:103", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:103", dmm.ATTR_DIGI_REL_LEVEL, 1, dmm.ATTR_DIGI_REL_ENABLE, dmm.ON)
--- 
--- --Set up channels 1 to 3 on slot 1 for the digitize voltage function. Set the relative level to 1 V and apply the relative offset.
--- ```
---@type dmmdigitizerelenablestate
dmm.digitize.rel.enable = 0

---@class dmm.digitize.math
dmm.digitize.math = {}

dmm.OFFE = nil
dmm.ON = nil

---@alias dmmdigitizemathenablevalue
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute enables or disables math operations on measurements for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41240.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.math.format = dmm.MATH_PERCENT
--- dmm.digitize.count = 1
--- dmm.digitize.math.percent = dmm.digitize.read()
--- dmm.digitize.math.enable = dmm.ON
--- dmm.digitize.count = 5
--- MathBuffer = buffer.make(100)
--- dmm.digitize.read(MathBuffer)
--- printbuffer(1, MathBuffer.n, MathBuffer.formattedreadings)
--- dmm.digitize.count = 1
--- for x = 1, 3 do 
---     print(dmm.digitize.read(MathBuffer))
--- end
--- 
--- --Configure the instrument for digitize voltage.
--- --Set math format to percent. 
--- --Acquire 1 reading to use as the relative percent value.
--- --Take 5 readings with percent math enabled and store them in a buffer called MathBuffer that can store 100 readings.
--- -- 
--- --Take three additional readings.
--- -- 
--- --Sample output assuming no load was connected to the instrument:
--- ---100.00 %, -100.00 %, -100.00 %, -100.00 %, -100.00 %
--- ---100.00058257
--- ---99.999126228
--- ---99.998932056
--- -- Set channel 1 on slot 1 to use the digitize voltage function.
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- -- Set channel 1 to use the percentage math format and enable math.
--- channel.setdmm("101", dmm.ATTR_DIGI_MATH_FORMAT, dmm.MATH_PERCENT, dmm.ATTR_DIGI_MATH_ENABLE, dmm.ON )
---  
--- -- Acquire one reading to use as the relative percent value.
--- channel.close("101")
--- dmm.digitize.count = 1
--- dmm.digitize.math.percent = dmm.digitize.read()
--- channel.setdmm("101", dmm.ATTR_DIGI_MATH_PERCENT, dmm.digitize.read())
---  
--- -- Create a buffer named MathBuffer that holds 100 readings.
--- MathBuffer = buffer.make(100)
--- -- Set the measure count to 100
--- channel.setdmm("101", dmm.ATTR_DIGI_COUNT, 100)
---  
--- dmm.digitize.read(MathBuffer)
---  
--- printbuffer(1, MathBuffer.n, MathBuffer.formattedreadings)
--- 
--- --Set the instrument to digitize voltage.
--- --Set math format to percent for channel 1 on slot 1. 
--- --Acquire 1 reading to use as the relative percent value.
--- --Close channel 1. 
--- --Set channel 1 to use the math format percent.
--- --Create a buffer.
--- --Set the measure count for channel 1 to 100.
--- --Make readings.
--- --Output the data.
--- ```
---@type dmmdigitizemathenablevalue
dmm.digitize.math.enable = 0


dmm.MATH_MXBP = nil
dmm.MATH_PERCENTR = nil
dmm.MATH_RECIPROCAL = nil

---@alias dmmdigitizemathformatoperation
---|`dmm.MATH_MXBP`
---|`dmm.MATH_PERCENTR`
---|`dmm.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This specifies which math operation is performed on measurements for the selected digitize function.You can choose one of the following math operations:Math calculations are applied to the input signal after relative offset and before limit tests.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41243.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.math.format = dmm.MATH_RECIPROCAL
--- dmm.digitize.math.enable = dmm.ON
--- 
--- --Enables the reciprocal math operation on digitize voltage measurements.
--- -- Set channel 1 on slot 1 to use the digitize voltage function.
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- -- Set channel 1 to use the reciprocal math format and enable math.
--- channel.setdmm("101", dmm.ATTR_DIGI_MATH_FORMAT, dmm.MATH_RECIPROCAL, dmm.ATTR_DIGI_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the reciprocal math operation on digitize voltage measurements made on channel 1 of slot 1.
--- ```
---@type dmmdigitizemathformatoperation
dmm.digitize.math.format = 0



--- **This attribute specifies the reference constant that is used when math operations are set to percent.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The percent math function displays measurements as percent deviation from a specified reference constant. The percent calculation is:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41257.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.math.format = dmm.MATH_PERCENT
--- dmm.digitize.math.percent = 42
--- dmm.digitize.math.enable = dmm.ON
--- 
--- --Set the measurement function to digitize current.
--- --Set the math operations to percent.
--- --Set the percentage value to 42.
--- --Enable math operations.
--- -- Set channel 1 on slot 1 to use the digitize voltage function.
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- -- Set channel 1 to use the percentage math format, set the percentage,
--- -- and enable math.
--- channel.setdmm("101", dmm.ATTR_DIGI_MATH_FORMAT, dmm.MATH_PERCENT, dmm.ATTR_DIGI_MATH_PERCENT, 42, dmm.ATTR_DIGI_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the y = mx + b math operation on digitize voltage measurements made on channel 1 of slot 1. Set the m (scale) factor to 0.8 and the b (offset) factor to 42.
--- ```
dmm.digitize.math.percent = 0

---@class dmm.measure.offsetcompensation
dmm.measure.offsetcompensation = {}

dmm.OCOMP_OFFE = 4
dmm.OCOMP_ON = nil
dmm.OCOMP_AUTO = nil

---@alias dmmmeasureoffsetcompensationenablestate
---|`dmm.OCOMP_OFFE`
---|`dmm.OCOMP_ON`
---|`dmm.OCOMP_AUTO`



--- **This attribute determines if offset compensation is used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41259.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_FOURRTD
--- dmm.measure.offsetcompensation.enable = dmm.OCOMP_ON
--- print(dmm.measure.read())
--- 
--- --Sets the measurement function to resistance. Set the instrument for 4-wire RTD and turn offset compensation on.
--- --Make a measurement.
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_TRANSDUCER, dmm.TRANS_FOURRTD)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_OFFCOMP_ENABLE, dmm.OCOMP_OFF)
--- channel.setdmm("101:104", dmm.ATTR_MEAS_FOUR_RTD, dmm.RTD_PT3916)
--- 
--- --For channels 1 through 4, set the DMM function to temperature.
--- --Set the transducer type to 3-wire RTD. Set the offset compensation off. Set the RTD type to PT3916.
--- ```
---@type dmmmeasureoffsetcompensationenablestate
dmm.measure.offsetcompensation.enable = 0

---@class dmm.measure.rel
dmm.measure.rel = {}

dmm.OND = nil
dmm.OFF = nil

---@alias dmmmeasurerelenablestate
---|`dmm.OND`
---|`dmm.OFF`



--- **This attribute enables or disables the application of a relative offset value to the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value. You can enter a relative offset value or have the instrument acquire a relative offset value.Each returned measured relative reading is the result of the following calculation:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41271.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_AC_CURRENT
--- dmm.measure.rel.acquire()
--- dmm.measure.rel.enable = dmm.ON
--- 
--- --Enables the relative measurements for AC current and uses the acquire command to set the relative level attribute.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_REL_ENABLE, dmm.ON)
--- 
--- --For channels 1 through 9, set the DMM function to DC voltage. Enable the relative measurements.
--- ```
---@type dmmmeasurerelenablestate
dmm.measure.rel.enable = 0



--- **This function acquires a measurement and stores it as the relative offset value.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command triggers the instrument to make a new measurement for the selected function. This measurement is then stored as the new relative offset level.When you send this command, the instrument does not apply any math, limit test, or filter settings to the measurement, even if they are set. It is a measurement that is made as if these settings are disabled.If an error event occurs during the measurement, nil is returned and the relative offset level remains at the last valid setting.You must change to the function for which you want to acquire a value before sending this command.The instrument must have relative offset enabled to use the acquired relative offset value.After executing this command, you can use the dmm.measure.rel.level attribute to see the last relative level value that was acquired or that was set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41272.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- rel_value = dmm.measure.rel.acquire()
--- dmm.measure.rel.enable = dmm.ON
--- print(rel_value)
--- 
--- --Acquires a relative offset level value for voltage measurements, turns the relative offset feature on, and outputs the value.
--- ```
function dmm.measure.rel.acquire() end


--- **This attribute contains the relative offset value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the relative offset value that can be applied to new measurements. When relative offset is enabled, all subsequent measured readings are offset by the value that is set for this command.You can set this value, or have the instrument acquire a value. If the instrument acquires the value, read this setting to return the value that was measured internally.The ranges for the relative offset values for all functions are listed in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41273.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.rel.level = dmm.measure.read()
--- dmm.measure.rel.enable = dmm.ON
--- 
--- --Set the measure function to DC current.
--- --Set the relative offset level to be the reading with any calculations included.
--- --Enable the relative offset.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_REL_ENABLE, dmm.ON)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_REL_LEVEL, 1)
--- 
--- --For channels 1 through 9, set the DMM function to DC voltage. Enable the relative measurements and set the offset level to 1 V.
--- ```
dmm.measure.rel.level = 0


dmm.METHOD_RESULTA = nil
dmm.METHOD_PARTS = nil

---@alias dmmmeasurerelmethodvalue
---|`dmm.METHOD_RESULTA`
---|`dmm.METHOD_PARTS`



--- **This attribute determines if relative offset is applied to the measurements before calculating the DC voltage ratio value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines if relative offset is applied to the voltage measurements before the ratio calculation or if the relative offset is applied to the final calculated value.When the parts method is selected, the individual readings each have the relative offset value applied before being used to calculate the measurement reading. The relative offset value is working with smaller ranges, so an error may occur. Reduce the relative offset value if you receive an error. When a relative offset value is acquired when the parts method is selected, the relative offset levels are made and applied to both input and sense.A relative offset is applied to the sense value and then to the input value.When the results method is selected, the individual readings do not have the relative offset value applied. The relative offset value is applied to the final calculation.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41691.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.rel.method = dmm.METHOD_PARTS
--- 
--- --Set the measure function to DC voltage ratio.
--- --Set the method to apply relative offset before generating the ratio.
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DCV_RATIO)
--- channel.setdmm("101", dmm.ATTR_MEAS_REL_METHOD, dmm.METHOD_RESULT)
--- 
--- --Set the channel measure function to DC voltage ratio.
--- --Set the method to not apply relative offset before generating the ratio.
--- ```
---@type dmmmeasurerelmethodvalue
dmm.measure.rel.method = 0

---@class dmm.measure.threshold
dmm.measure.threshold = {}


--- **This attribute indicates the expected input level of the voltage signal.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The range setting conditions the signal. The instrument automatically selects the most sensitive threshold range for the value you enter. For example, if you specify the expected input voltage to be 90 mV, the instrument automatically selects the 100 mV threshold range.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41283.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_ACV_PERIOD
--- dmm.measure.threshold.range = 50
--- 
--- --Set the threshold range for the selected function to the nearest range of 100 V.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_PERIOD)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_THRESHOLD_RANGE, 50)
--- 
--- --For channels 1 through 9, set the measure function to period.
--- --Set the threshold range to 50 V, which selects the 100 V range.
--- ```
dmm.measure.threshold.range = 0


dmm.OFFE = nil
dmm.ON = nil

---@alias dmmmeasurethresholdautorangestate
---|`dmm.OFFE`
---|`dmm.ON`



--- **This attribute determines if the threshold range is set manually or automatically.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines how the range is selected.When this command is set to off, you must set the range. If you do not set the range, the instrument remains at the range that was last selected by autorange.When this command is set to on, the instrument uses the signal to determine the most sensitive range on which to perform the measurement. The instrument sets the range when a measurement is requested. To set the range, the instrument makes a measurement to determine the range before making the final measurement, which can result in slower reading times. Turn autorange off and set a specific range to increase measure time.If a range is manually selected through the front panel or a remote command, this command is automatically set to off.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41289.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_ACV_PERIOD
--- dmm.measure.threshold.autorange = dmm.ON
--- 
--- --Set the measure function to period.
--- --Set the threshold autorange on.
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_ACV_PERIOD)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTO, dmm.ON)
--- 
--- --For channels 1 through 5, set the measure function to period.
--- --Set the threshold autorange on.
--- ```
---@type dmmmeasurethresholdautorangestate
dmm.measure.threshold.autorange = 0

---@class dmm.measure.analogtrigger
dmm.measure.analogtrigger = {}

dmm.MODE_EDGEW = nil
dmm.MODE_WINDOWN = nil
dmm.MODE_OFF = nil

---@alias dmmmeasureanalogtriggermodesetting
---|`dmm.MODE_EDGEW`
---|`dmm.MODE_WINDOWN`
---|`dmm.MODE_OFF`



--- ** This attribute configures the type of signal behavior that can generate an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When edge is selected, the analog trigger occurs when the signal crosses a certain level. You also specify if the analog trigger occurs on the rising or falling edge of the signal.When window is selected, the analog trigger occurs when the signal enters or exits the window defined by the low and high signal levels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41389.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.range = 3
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.measure.analogtrigger.edge.level = 2.5
--- dmm.measure.analogtrigger.edge.slope = dmm.SLOPE_FALLING
--- 
--- --Set measure function to DC current.
--- --Set range to 3 A.
--- --Disable autozero.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 2.5 A.
--- --Set the level to be detected on a falling edge.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 3)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_MODE, dmm.MODE_EDGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_EDGE_LEVEL, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_EDGE_SLOPE, dmm.SLOPE_FALLING)
--- 
--- --For channels 1 through 9 on slot 1, set the measure function to DC voltage.
--- --Set range to 3 V.
--- --Disable autozero.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 5 V.
--- --Set the level to be detected on a falling edge.
--- ```
---@type dmmmeasureanalogtriggermodesetting
dmm.measure.analogtrigger.mode = 0

---@class dmm.digitize.analogtrigger
dmm.digitize.analogtrigger = {}

dmm.MODE_EDGEW = nil
dmm.MODE_WINDOWN = nil
dmm.MODE_OFF = nil

---@alias dmmdigitizeanalogtriggermodesetting
---|`dmm.MODE_EDGEW`
---|`dmm.MODE_WINDOWN`
---|`dmm.MODE_OFF`



--- **This attribute configures the type of signal behavior that can generate an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When edge is selected, the analog trigger occurs when the signal crosses a certain level. You also specify if the analog trigger occurs on the rising or falling edge of the signal.When window is selected, the analog trigger occurs when the signal enters or exits the window defined by the low and high signal levels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41391.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.range = 90
--- dmm.digitize.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.digitize.analogtrigger.edge.level = 5
--- dmm.digitize.analogtrigger.edge.slope = dmm.SLOPE_FALLING
--- 
--- --Set the function to digitize voltage.
--- --Set the range to 90, which selects a range of 100 V.
--- --Set the analog trigger mode to edge.
--- --Set the level sense to 5 V.
--- --Set the level to be detected on a falling edge.
--- channel.setdmm("101:109", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_MODE, dmm.MODE_EDGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_EDGE_LEVEL, 5)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_EDGE_SLOPE, dmm.SLOPE_FALLING)
--- 
--- --For channels 1 through 9 on slot 1, set the digitize function to voltage.
--- --Set range to 10 V.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 5 V.
--- --Set the level to be detected on a falling edge.
--- ```
---@type dmmdigitizeanalogtriggermodesetting
dmm.digitize.analogtrigger.mode = 0

---@class dmm.measure.bias
dmm.measure.bias = {}


--- **This attribute selects the amount of current the instrument sources when it makes measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the amount of current that is sourced by the instrument to make measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41438.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.bias.level = 0.0001
--- 
--- --Set a bias level of 100 µA.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DIODE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_BIAS_LEVEL, 0.0001)
--- 
--- --For channels 1 through 9 on slot 1, set the DMM function to diode.
--- --Set the bias level to 100 µA.
--- ```
dmm.measure.bias.level = 0

---@class dmm.measure.sense
dmm.measure.sense = {}


--- **This attribute displays the positive full-scale range that is being used for the sense measurement.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- Displays the full-scale input that is used for the reference measurement in the denominator of the ratio.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/76068.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- print(dmm.measure.sense.range)
--- 
--- --Select the DC voltage ratio function.
--- --Output the sense range. Example output:
--- --10
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DCV_RATIO)
--- print(channel.getdmm("101:105", dmm.ATTR_MEAS_SENSE_RANGE))
--- 
--- --For channels 1 through 5, set the DMM function to DC voltage ratio.
--- --Set the transducer type to 3-wire RTD. Set the RTD type to D100.
--- --Example output:
--- --[1]=10, [2]=10, [3]=10, [4]=10, [5]=10, [6]=10, [7]=10, [8]=10, [9]=10, [10]=10
--- ```

dmm.OFF = nil

---@alias dmmmeasuresenseautorangesetting
---|`dmm.OFF`



--- **This attribute returns the setting of sense autorange.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/89273.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- print(dmm.measure.sense.autorange)
--- 
--- --Select the DC voltage ratio function.
--- --Output the setting of sense autorange. Example output:
--- --dmm.OFF
--- ```
---@type dmmdigitizelimitArr[]
dmmdigitizelimitArr.low = {}


--- **This attribute specifies the lower limit for limit tests.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the lower limit for the limit Y test for the selected digitize function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.This example enables limits 1 and 2 for digitize voltage measurements. Limit 1 is checking for readings to be between 3 V and 5 V, while limit 2 is checking for the readings to be between 1 V and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.This example enables limits 1 and 2 for digitize voltage measurements on channels 1 and 2 of slot 1. Limit 1 is checking for readings to be between 3 and 5 V, while limit 2 is checking for the readings to be between 1 and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41215.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- -- Set the instrument to measure digitized voltage 
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- -- Set the range to 10 V
--- dmm.digitize.range = 10
--- -- Disable auto clearing for limit 1
--- dmm.digitize.limit[1].autoclear = dmm.OFF
--- -- Set high limit on 1 to fail if reading exceeds 5 V
--- dmm.digitize.limit[1].high.value = 5
--- -- Set low limit on 1 to fail if reading is less than 3 V
--- dmm.digitize.limit[1].low.value = 3
--- -- Enable limit 1 checking for digitized voltage measurements
--- dmm.digitize.limit[1].enable = dmm.ON
--- -- Disable auto clearing for limit 2
--- dmm.digitize.limit[2].autoclear = dmm.OFF
--- -- Set high limit on 2 to fail if reading exceeds 7 V
--- dmm.digitize.limit[2].high.value = 7
--- -- Set low limit on 2 to fail if reading is less than 1 V
--- dmm.digitize.limit[2].low.value = 1
--- -- Set the beeper to sound if the reading exceeds the limits for limit 2
--- dmm.digitize.limit[2].audible = dmm.AUDIBLE_FAIL 
--- -- Enable limit 2 checking for digitized voltage measurements
--- dmm.digitize.limit[2].enable = dmm.ON
--- -- Set the digitize count to 50
--- dmm.digitize.count = 50
--- -- Create a reading buffer that can store 100 readings
--- LimitBuffer = buffer.make(100)
--- -- Make 50 readings and store them in LimitBuffer
--- dmm.digitize.read(LimitBuffer)
--- -- Check if any of the 50 readings were outside of the limits
--- print("limit 1 results = " .. dmm.digitize.limit[1].fail)
--- print("limit 2 results = " .. dmm.digitize.limit[2].fail)
--- -- Clear limit 1 conditions
--- dmm.digitize.limit[1].clear()
--- -- Clear limit 2 conditions
--- dmm.digitize.limit[2].clear()
--- 
--- --Example output that shows all readings are within limit values (all readings between 3 V and 5 V):
--- --limit 1 results = dmm.FAIL_NONE
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 high values (a 6 V reading would cause this condition or a reading greater than 5 V but less than 7 V):
--- --limit 1 results = dmm.FAIL_HIGH
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 and 2 low values (a 0.5 V reading would cause this condition or a reading less than 1 V):
--- --limit 1 results = dmm.FAIL_LOW
--- --limit 2 results = dmm.FAIL_LOW
--- reset()
--- sampleCount = 50
--- scanCount = 25
---  
--- -- Set channels 1 and 2 to measure digitized voltage.
--- -- Each has a sample count of 50.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE, dmm.ATTR_DIGI_COUNT, sampleCount)
---  
--- -- Set the range to 10 V.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_RANGE, 10)
---  
--- -- Set up limit 1: Disable auto clearing, set the high limit
--- -- to fail if reading exceeds 5 V, set low limit to fail if
--- -- reading is less than 3 V, and enable limit checking.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_1, dmm.OFF, dmm.ATTR_DIGI_LIMIT_HIGH_1, 5, dmm.ATTR_DIGI_LIMIT_LOW_1, 3, dmm.ATTR_DIGI_LIMIT_ENABLE_1, dmm.ON)
---  
--- -- Set up limit 2: Disable auto clearing, set the high limit
--- -- to fail if reading exceeds 7 V, set low limit to fail if
--- -- reading is less than 1 V, and enable limit checking.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_2, dmm.OFF, dmm.ATTR_DIGI_LIMIT_HIGH_2, 7, dmm.ATTR_DIGI_LIMIT_LOW_2, 1, dmm.ATTR_DIGI_LIMIT_ENABLE_2, dmm.ON)
---  
--- --- Set the beeper to sound if the reading exceeds the limits for limit 2.
--- channel.setdmm("101:102", dmm.ATTR_DIGI_LIMIT_AUDIBLE_2, dmm.AUDIBLE_FAIL)
---  
--- -- Set the digitize count to 50.
--- -- channel.setdmm("101:102", dmm.ATTR_DIGI_COUNT, 50)
---  
--- -- Create a standard reading buffer that can store 100 readings.
--- LimitBuffer = buffer.make(2 * sampleCount * scanCount, buffer.STYLE_STANDARD)
---  
--- -- Make 2500 readings and store them in LimitBuffer.
--- scan.create("101:102")
--- scan.buffer = LimitBuffer
--- LimitBuffer.clear()
--- scan.scancount = scanCount
--- scan.scaninterval = 1.0
---  
--- trigger.model.initiate()
--- waitcomplete()
---  
--- -- Check if any of the 50 readings were outside of the limits.
--- print("limit 1 results = " .. dmm.digitize.limit[1].fail)
--- print("limit 2 results = " .. dmm.digitize.limit[2].fail)
--- -- Clear limit 1 conditions
--- dmm.digitize.limit[1].clear()
--- -- clear limit 2 conditions
--- dmm.digitize.limit[2].clear()
---  
--- printbuffer(1, LimitBuffer.n, LimitBuffer)
--- 
--- --Example output that shows all readings are within limit values (all readings between 3 V and 5 V):
--- --limit 1 results = dmm.FAIL_NONE
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 high values (a 6 V reading would cause this condition or a reading greater than 5 V but less than 7 V):
--- --limit 1 results = dmm.FAIL_HIGH
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 and 2 low values (a 0.5 V reading would cause this condition or a reading less than 1 V):
--- --limit 1 results = dmm.FAIL_LOW
--- --limit 2 results = dmm.FAIL_LOW
--- ```
dmmdigitizelimitArr.low.value= 0

---@type dmmdigitizelimitArr[]
dmmdigitizelimitArr.high = {}


--- **This attribute specifies the upper limit for a limit test.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the high limit for the limit Y test for the selected digitize function. When limit Y testing is enabled, the instrument generates a fail indication when the measurement value is more than this value.See dmm.digitize.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41227.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- highLimit
--- 
--- --The value of the upper limit (-1e+12 to 1e+12)
--- ```
dmmdigitizelimitArr.high.value= 0

---@type dmmmeasurelimitArr[]
dmmmeasurelimitArr.low = {}


--- **This attribute specifies the lower limit for limit tests.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the lower limit for the limit Y test for the selected measure function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.Default is 0.3 for limit 1 when the diode function is selected. The default for limit 2 for the diode function is –1.This example enables limits 1 and 2 for voltage measurements. Limit 1 is checking for readings to be between 3 and 5 V, while limit 2 is checking for the readings to be between 1 and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to determine which reading failed the limits.This example enables limits 1 and 2 for voltage measurements on channels 1 and 2 of slot 1. Limit 1 is checking for readings to be between 3 and 5 V, while limit 2 is checking for the readings to be between 1 and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41229.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- -- Set the instrument to measure voltage 
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- -- Set the range to 10 V
--- dmm.measure.range = 10
--- -- Set the nplc to 0.1
--- dmm.measure.nplc = 0.1
--- -- Disable auto clearing for limit 1
--- dmm.measure.limit[1].autoclear = dmm.OFF
--- -- Set high limit on 1 to fail if reading exceeds 5 V
--- dmm.measure.limit[1].high.value = 5
--- -- Set low limit on 1 to fail if reading is less than 3 V
--- dmm.measure.limit[1].low.value = 3
--- --- Set the beeper to sound if the reading exceeds the limits for limit 1
--- dmm.measure.limit[1].audible = dmm.AUDIBLE_FAIL
--- -- Enable limit 1 checking for voltage measurements
--- dmm.measure.limit[1].enable = dmm.ON
--- -- Disable auto clearing for limit 2
--- dmm.measure.limit[2].autoclear = dmm.OFF
--- -- Set high limit on 2 to fail if reading exceeds 7 V
--- dmm.measure.limit[2].high.value = 7
--- -- Set low limit on 2 to fail if reading is less than 1 V
--- dmm.measure.limit[2].low.value = 1
--- -- Enable limit 2 checking for voltage measurements
--- dmm.measure.limit[2].enable = dmm.ON
--- -- Set the measure count to 50
--- dmm.measure.count = 50
--- -- Create a reading buffer that can store 100 readings
--- LimitBuffer = buffer.make(100)
--- -- Make 50 readings and store them in LimitBuffer
--- dmm.measure.read(LimitBuffer)
--- -- Check if any of the 50 readings were outside of the limits
--- print("limit 1 results = " .. dmm.measure.limit[1].fail)
--- print("limit 2 results = " .. dmm.measure.limit[2].fail)
--- -- Clear limit 1 conditions
--- dmm.measure.limit[1].clear()
--- -- Clear limit 2 conditions
--- dmm.measure.limit[2].clear()
--- 
--- --Example output that shows all readings are within limit values (all readings between 3 V and 5 V):
--- --limit 1 results = dmm.FAIL_NONE
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 high values (a 6 V reading would cause this condition or a reading greater than 5 V but less than 7 V):
--- --limit 1 results = dmm.FAIL_HIGH
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 and 2 low values (a 0.5 V reading would cause this condition or a reading less than 1 V):
--- --limit 1 results = dmm.FAIL_LOW
--- --limit 2 results = dmm.FAIL_LOW
--- reset()
--- sampleCount = 50
--- scanCount = 25
---  
--- -- Set channels 1 and 2 to measure DC voltage.
--- -- Each has a sample count of 50.
--- channel.setdmm("101:102", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE, dmm.ATTR_MEAS_COUNT, sampleCount)
---  
--- -- Set the range to 10 V.
--- channel.setdmm("101:102", dmm.ATTR_MEAS_RANGE, 10)
---  
--- -- Set up limit 1: Disable auto clearing, set the high limit
--- -- to fail if reading exceeds 5 V, set low limit to fail if
--- -- reading is less than 3 V, and enable limit checking.
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_1, dmm.OFF, dmm.ATTR_MEAS_LIMIT_HIGH_1, 5, dmm.ATTR_MEAS_LIMIT_LOW_1, 3, dmm.ATTR_MEAS_LIMIT_ENABLE_1, dmm.ON)
---  
--- -- Set up limit 2: Disable auto clearing, set the high limit
--- -- to fail if reading exceeds 7 V, set low limit to fail if
--- -- reading is less than 1 V, and enable limit checking.
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_2, dmm.OFF, dmm.ATTR_MEAS_LIMIT_HIGH_2, 7, dmm.ATTR_MEAS_LIMIT_LOW_2, 1, dmm.ATTR_MEAS_LIMIT_ENABLE_2, dmm.ON)
--- -- Set the beeper to sound if the reading exceeds the limits for limit 2.
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_AUDIBLE_2, dmm.AUDIBLE_FAIL)
---  
--- -- Set the measure count to 50.
--- channel.setdmm("101:102", dmm.ATTR_MEAS_COUNT, 50)
---  
--- -- Create a standard reading buffer that can store 2500 readings.
--- LimitBuffer = buffer.make(2 * sampleCount * scanCount, buffer.STYLE_STANDARD)
---  
--- -- Make 2500 readings and store them in LimitBuffer.
--- scan.create("101:102")
--- scan.buffer = LimitBuffer
--- LimitBuffer.clear()
--- scan.scancount = scanCount
--- scan.scaninterval = 1.0
---  
--- trigger.model.initiate()
--- waitcomplete()
---  
--- -- Check to see if any of the readings were outside of the limits.
--- print(channel.getdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_1))
--- print(channel.getdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_2))
---  
--- -- Clear limit 1 conditions
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_1, dmm.FAIL_NONE)
--- -- Clear limit 2 conditions
--- channel.setdmm("101:102", dmm.ATTR_MEAS_LIMIT_FAIL_2, dmm.FAIL_NONE)
---  
--- printbuffer(1, LimitBuffer.n, LimitBuffer)
--- 
--- --Example output that shows all readings are within limit values (all readings between 3 V and 5 V):
--- --limit 1 results = dmm.FAIL_NONE
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 high values (a 6 V reading would cause this condition or a reading greater than 5 V but less than 7 V):
--- --limit 1 results = dmm.FAIL_HIGH
--- --limit 2 results = dmm.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 and 2 low values (a 0.5 V reading would cause this condition or a reading less than 1 V):
--- --limit 1 results = dmm.FAIL_LOW
--- --limit 2 results = dmm.FAIL_LOW
--- ```
dmmmeasurelimitArr.low.value= 0

---@type dmmmeasurelimitArr[]
dmmmeasurelimitArr.high = {}


--- **This attribute specifies the upper limit for a limit test.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the high limit for the limit Y test for the selected measurement function. When limit Y testing is enabled, the instrument generates a fail indication when the measurement value is more than this value.Default is 0.8 for limit 1 when the diode function is selected; 10 when the continuity function is selected. The default for limit 2 for the diode and continuity functions is 1.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41230.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
dmmmeasurelimitArr.high.value= 0

---@class dmm.measure.math.mxb
dmm.measure.math.mxb = {}


--- **This attribute specifies the offset, b, for the y = mx + b operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset (b) for an mx + b operation.The mx + b math operation lets you manipulate normal display readings (x) mathematically based on the calculation:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41246.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_MXB
--- dmm.measure.math.mxb.mfactor = 0.80
--- dmm.measure.math.mxb.bfactor = 50
--- dmm.measure.math.enable = dmm.ON
--- 
--- --Set the measurement function to voltage.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 50.
--- --Enable the math function.
--- -- Set channel 1 on slot 1 to use the voltage function.
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- -- Set channel 1 to use the MXB math format, set up the factors, and enable math.
--- channel.setdmm("101", dmm.ATTR_MEAS_MATH_FORMAT, dmm.MATH_MXB, dmm.ATTR_MEAS_MATH_MXB_MF, 0.8, dmm.ATTR_MEAS_MATH_MXB_BF, 42, dmm.ATTR_MEAS_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the y = mx + b math operation on digitize voltage measurements made on channel 1 of slot 1. Set the m (scale) factor to 0.8 and the b (offset) factor to 42.
--- ```
dmm.measure.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41247.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_MXB
--- dmm.measure.math.mxb.mfactor = 0.80
--- dmm.measure.math.mxb.bfactor = 50
--- dmm.measure.math.enable = dmm.ON
--- 
--- --Set the measurement function to voltage.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 50.
--- --Enable the math function.
--- -- Set channel 1 on slot 1 to use the voltage function.
--- channel.setdmm("101", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- -- Set channel 1 to use the MXB math format, set up the factors, and enable math.
--- channel.setdmm("101", dmm.ATTR_MEAS_MATH_FORMAT, dmm.MATH_MXB, dmm.ATTR_MEAS_MATH_MXB_MF, 0.8, dmm.ATTR_MEAS_MATH_MXB_BF, 42, dmm.ATTR_MEAS_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the y = mx + b math operation on digitize voltage measurements made on channel 1 of slot 1. Set the m (scale) factor to 0.8 and the b (offset) factor to 42.
--- ```
dmm.measure.math.mxb.mfactor = 0

---@class dmm.digitize.math.mxb
dmm.digitize.math.mxb = {}


--- **This attribute specifies the offset, b, for the y = mx + b operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset (b) for an mx + b operation.The mx + b math operation lets you manipulate normal display readings (x) mathematically based on the calculation:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41252.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.math.format = dmm.MATH_MXB
--- dmm.digitize.math.mxb.mfactor = 0.80
--- dmm.digitize.math.mxb.bfactor = 42
--- dmm.digitize.math.enable = dmm.ON
--- 
--- --Set the digitize function to digitize current.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 42.
--- --Enable the math function.
--- -- Set channel 1 on slot 1 to use the digitize voltage function.
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- -- Set channel 1 to use the MXB math format, set up the factors, and enable math.
--- channel.setdmm("101", dmm.ATTR_DIGI_MATH_FORMAT, dmm.MATH_MXB, dmm.ATTR_DIGI_MATH_MXB_MF, 0.8, dmm.ATTR_DIGI_MATH_MXB_BF, 42, dmm.ATTR_DIGI_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the y = mx + b math operation on digitize voltage measurements made on channel 1 of slot 1. Set the m (scale) factor to 0.8 and the b (offset) factor to 42.
--- ```
dmm.digitize.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41255.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.math.format = dmm.MATH_MXB
--- dmm.digitize.math.mxb.mfactor = 0.80
--- dmm.digitize.math.mxb.bfactor = 42
--- dmm.digitize.math.enable = dmm.ON
--- 
--- --Set the digitize function to digitize current.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 42.
--- --Enable the math function.
--- -- Set channel 1 on slot 1 to use the digitize voltage function.
--- channel.setdmm("101", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- -- Set channel 1 to use the MXB math format, set up the factors, and enable math.
--- channel.setdmm("101", dmm.ATTR_DIGI_MATH_FORMAT, dmm.MATH_MXB, dmm.ATTR_DIGI_MATH_MXB_MF, 0.8, dmm.ATTR_DIGI_MATH_MXB_BF, 42, dmm.ATTR_DIGI_MATH_ENABLE, dmm.ON)
--- 
--- --Enables the y = mx + b math operation on digitize voltage measurements made on channel 1 of slot 1. Set the m (scale) factor to 0.8 and the b (offset) factor to 42.
--- ```
dmm.digitize.math.mxb.mfactor = 0

---@class dmm.digitize.analogtrigger.edge
dmm.digitize.analogtrigger.edge = {}


--- **This attribute defines the signal level that generates the analog trigger event for the edge trigger mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only available when the analog trigger mode is set to edge.The edge level can be set to any value in the active measurement range.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41394.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.digitize.analogtrigger.edge.level = 5
--- dmm.digitize.analogtrigger.edge.slope = dmm.SLOPE_FALLING
--- 
--- --Set the function to digitize voltage.
--- --Set the analog trigger mode to edge.
--- --Set the level to sense 5 V.
--- --Set the level to be detected on a falling edge.
--- channel.setdmm("101:109", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_MODE, dmm.MODE_EDGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_EDGE_LEVEL, 5)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_EDGE_SLOPE, dmm.SLOPE_FALLING)
--- 
--- --For channels 1 through 9 on slot 1, set the digitize function to voltage.
--- --Set range to 10 V.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 5 V.
--- --Set the level to be detected on a falling edge.
--- ```
dmm.digitize.analogtrigger.edge.level = 0


dmm.SLOPE_RISINGF = nil
dmm.SLOPE_FALLING = nil

---@alias dmmdigitizeanalogtriggeredgeslopevalue
---|`dmm.SLOPE_RISINGF`
---|`dmm.SLOPE_FALLING`



--- **This attribute defines the slope of the analog trigger edge.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to edge.Rising causes an analog trigger event when the analog signal trends from below the analog signal level to above the level.Falling causes an analog trigger event when the signal trends from above to below the level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/43708.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.digitize.analogtrigger.edge.level = 5
--- dmm.digitize.analogtrigger.edge.slope = dmm.SLOPE_FALLING
--- 
--- --Set the function to digitize voltage.
--- --Set the analog trigger mode to edge.
--- --Set the level to sense 5 V.
--- --Set the level to be detected on a falling edge.
--- channel.setdmm("101:109", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_MODE, dmm.MODE_EDGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_EDGE_LEVEL, 5)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_EDGE_SLOPE, dmm.SLOPE_FALLING)
--- 
--- --For channels 1 through 9 on slot 1, set the digitize function to voltage.
--- --Set range to 10 V.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 5 V.
--- --Set the level to be detected on a falling edge.
--- ```
---@type dmmdigitizeanalogtriggeredgeslopevalue
dmm.digitize.analogtrigger.edge.slope = 0

---@class dmm.digitize.analogtrigger.window
dmm.digitize.analogtrigger.window = {}

dmm.DIRECTION_ENTERL = nil
dmm.DIRECTION_LEAVE = nil

---@alias dmmdigitizeanalogtriggerwindowdirectionvalue
---|`dmm.DIRECTION_ENTERL`
---|`dmm.DIRECTION_LEAVE`



--- **This attribute defines if the analog trigger occurs when the signal enters or leaves the defined high and low analog signal level boundaries.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to window.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41398.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_WINDOW
--- dmm.digitize.analogtrigger.window.levelhigh = 5
--- dmm.digitize.analogtrigger.window.levellow = 1
--- dmm.digitize.analogtrigger.window.direction = dmm.DIRECTION_LEAVE
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- channel.setdmm("101:109", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_MODE, dmm.MODE_WINDOW)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_HIGH, 5)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_LOW, 1)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_DIRECTION, dmm.DIRECTION_LEAVE)
--- 
--- --For channels 1 through 9 on slot 1, set the digitize function to DC voltage.
--- --Set range to 10 V.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- ```
---@type dmmdigitizeanalogtriggerwindowdirectionvalue
dmm.digitize.analogtrigger.window.direction = 0



--- **This attribute defines the upper boundary of the analog trigger window.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to window.The high level must be greater than the low level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41406.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_WINDOW
--- dmm.digitize.analogtrigger.window.levelhigh = 5
--- dmm.digitize.analogtrigger.window.levellow = 1
--- dmm.digitize.analogtrigger.window.direction = dmm.DIRECTION_LEAVE
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- channel.setdmm("101:109", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_MODE, dmm.MODE_WINDOW)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_HIGH, 5)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_LOW, 1)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_DIRECTION, dmm.DIRECTION_LEAVE)
--- 
--- --For channels 1 through 9 on slot 1, set the digitize function to DC voltage.
--- --Set range to 10 V.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- ```
dmm.digitize.analogtrigger.window.levelhigh = 0



--- **This attribute defines the lower boundary of the analog trigger window.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to window.The low level must be less than the high level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41724.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_WINDOW
--- dmm.digitize.analogtrigger.window.levelhigh = 5
--- dmm.digitize.analogtrigger.window.levellow = 1
--- dmm.digitize.analogtrigger.window.direction = dmm.DIRECTION_LEAVE
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- channel.setdmm("101:109", dmm.ATTR_DIGI_FUNCTION, dmm.FUNC_DIGITIZE_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_MODE, dmm.MODE_WINDOW)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_HIGH, 5)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_LOW, 1)
--- channel.setdmm("101:109", dmm.ATTR_DIGI_ATRIG_WINDOW_DIRECTION, dmm.DIRECTION_LEAVE)
--- 
--- --For channels 1 through 9 on slot 1, set the digitize function to DC voltage.
--- --Set range to 10 V.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- ```
dmm.digitize.analogtrigger.window.levellow = 0

---@class dmm.measure.analogtrigger.edge
dmm.measure.analogtrigger.edge = {}


--- **This attribute defines the signal level that generates the analog trigger event for the edge trigger mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only available when the analog trigger mode is set to edge.The edge level can be set to any value in the active measurement range.To use the analog trigger with the measure functions, a range must be set (you cannot use autorange) and autozero must be disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41407.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.range = 3
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.measure.analogtrigger.edge.level = 2.5
--- dmm.measure.analogtrigger.edge.slope = dmm.SLOPE_FALLING
--- 
--- --Set measure function to DC current.
--- --Set range to 3 A.
--- --Disable autozero.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 2.5 A.
--- --Set the level to be detected on a falling edge.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 3)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_MODE, dmm.MODE_EDGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_EDGE_LEVEL, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_EDGE_SLOPE, dmm.SLOPE_FALLING)
--- 
--- --For channels 1 through 9 on slot 1, set the measure function to DC voltage.
--- --Set range to 3 V.
--- --Disable autozero.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 5 V.
--- --Set the level to be detected on a falling edge.
--- ```
dmm.measure.analogtrigger.edge.level = 0


dmm.SLOPE_RISINGF = nil
dmm.SLOPE_FALLING = nil

---@alias dmmmeasureanalogtriggeredgeslopevalue
---|`dmm.SLOPE_RISINGF`
---|`dmm.SLOPE_FALLING`



--- **This attribute defines the slope of the analog trigger edge.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to edge.Rising causes an analog trigger event when the analog signal trends from below the analog signal level to above the level.Falling causes an analog trigger event when the signal trends from above to below the level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41410.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.range = 3
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.measure.analogtrigger.edge.level = 2.5
--- dmm.measure.analogtrigger.edge.slope = dmm.SLOPE_FALLING
--- 
--- --Set measure function to DC current.
--- --Set range to 3 A.
--- --Disable autozero.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 2.5 A.
--- --Set the level to be detected on a falling edge.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 3)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_MODE, dmm.MODE_EDGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_EDGE_LEVEL, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_EDGE_SLOPE, dmm.SLOPE_FALLING)
--- 
--- --For channels 1 through 9 on slot 1, set the measure function to DC voltage.
--- --Set range to 3 V.
--- --Disable autozero.
--- --Set the analog trigger mode to edge.
--- --Set the analog trigger level to 5 V.
--- --Set the level to be detected on a falling edge.
--- ```
---@type dmmmeasureanalogtriggeredgeslopevalue
dmm.measure.analogtrigger.edge.slope = 0

---@class dmm.measure.analogtrigger.window
dmm.measure.analogtrigger.window = {}

dmm.DIRECTION_ENTERL = nil
dmm.DIRECTION_LEAVE = nil

---@alias dmmmeasureanalogtriggerwindowdirectionvalue
---|`dmm.DIRECTION_ENTERL`
---|`dmm.DIRECTION_LEAVE`



--- **This attribute defines if the analog trigger occurs when the signal enters or leaves the defined high and low analog signal level boundaries.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to window.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/41727.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_WINDOW
--- dmm.measure.analogtrigger.window.levelhigh = 5
--- dmm.measure.analogtrigger.window.levellow = 1
--- dmm.measure.analogtrigger.window.direction = dmm.DIRECTION_LEAVE
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_MODE, dmm.MODE_WINDOW)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_HIGH, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_LOW, 1)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_DIRECTION, dmm.DIRECTION_LEAVE)
--- 
--- --For channels 1 through 9 on slot 1, set the measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- ```
---@type dmmmeasureanalogtriggerwindowdirectionvalue
dmm.measure.analogtrigger.window.direction = 0



--- **This attribute defines the upper boundary of the analog trigger window.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to window.The high level must be greater than the low level.To use the analog trigger with the measure functions, a range must be set (you cannot use autorange) and autozero must be disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/43709.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_WINDOW
--- dmm.measure.analogtrigger.window.levelhigh = 5
--- dmm.measure.analogtrigger.window.levellow = 1
--- dmm.measure.analogtrigger.window.direction = dmm.DIRECTION_LEAVE
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_MODE, dmm.MODE_WINDOW)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_HIGH, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_LOW, 1)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_DIRECTION, dmm.DIRECTION_LEAVE)
--- 
--- --For channels 1 through 9 on slot 1, set the measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- ```
dmm.measure.analogtrigger.window.levelhigh = 0



--- **This attribute defines the lower boundary of the analog trigger window.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to window.The high level must be greater than the low level.To use the analog trigger with the measure functions, a range must be set (you cannot use autorange) and autozero must be disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/43710.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_WINDOW
--- dmm.measure.analogtrigger.window.levelhigh = 5
--- dmm.measure.analogtrigger.window.levellow = 1
--- dmm.measure.analogtrigger.window.direction = dmm.DIRECTION_LEAVE
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- channel.setdmm("101:109", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_RANGE, 10)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_AUTO_ZERO, dmm.OFF)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_MODE, dmm.MODE_WINDOW)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_HIGH, 5)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_LOW, 1)
--- channel.setdmm("101:109", dmm.ATTR_MEAS_ATRIG_WINDOW_DIRECTION, dmm.DIRECTION_LEAVE)
--- 
--- --For channels 1 through 9 on slot 1, set the measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to window.
--- --Set the analog trigger high level to 5 V.
--- --Set the analog trigger low level to 1 V.
--- --Set the trigger to occur when the signal leaves the window.
--- ```
dmm.measure.analogtrigger.window.levellow = 0

---@class scan.monitor.limit.high
scan.monitor.limit.high = {}


--- **This attribute specifies the high limit to be used by the scan monitor.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the high limit for the monitor.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72556.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
--- channel.setdmm("201", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- scan.monitor.limit.high.value = 28
--- scan.create("101:105")
--- scan.monitor.mode = scan.MODE_HIGH
--- trigger.model.initiate()
--- 
--- --With 7700 switching modules in slot 1 and slot 2, set up channels 1 to 5 on slot 1 to measure DC voltage with an NPLC of 0.01.
--- --Set up channel 1 in slot 2 to measure temperature.
--- --Set the monitoring channel to be 201.
--- --Set the high limit to 28 °C.
--- --Create a scan that includes data for channels 101 to 105.
--- --Set the scan monitor function to allow scanning to start when the measured value exceeds the defined high limit value (28 °C).
--- --Initiate the scan, which starts when the temperature of channel 201 is above 28 °C.
--- ```
scan.monitor.limit.high.value = 0

---@class scan.monitor.limit.low
scan.monitor.limit.low = {}


--- **This attribute defines the low limit to be used by the scan monitor.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the low limit for the monitor.
---
---[command help](command:kic.viewHelpDocument?["Commands_DAQ6510/72561.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdmm("101:105", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_DC_VOLTAGE)
--- channel.setdmm("101:105", dmm.ATTR_MEAS_NPLC, 0.01)
--- channel.setdmm("201", dmm.ATTR_MEAS_FUNCTION, dmm.FUNC_TEMPERATURE)
--- scan.monitor.limit.low.value = 18
--- scan.monitor.limit.high.value = 28
--- scan.create("101:105")
--- scan.monitor.mode = scan.MODE_WINDOW
--- trigger.model.initiate()
--- 
--- --With 7700 switching modules in slot 1 and slot 2, set up channels 1 to 5 on slot 1 to measure DC voltage with an NPLC of 0.01.
--- --Set up channel 1 in slot 2 to measure temperature.
--- --Set the monitoring channel to be 201.
--- --Set the monitor channel low limit to 18 °C.
--- --Set the high limit to 28 °C.
--- --Create a scan that includes data for channels 101 to 105.
--- --Set the scan monitor function to allow scanning to start when the measured value exceeds the defined high limit value (28 °C).
--- --Initiate the scan, which starts when the temperature of channel 201 is above 28 °C.
--- ```
scan.monitor.limit.low.value = 0

--- **This function defines a trigger model block.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command defines a trigger model building block that branches to another block using a counter to iterate a specified number of times. Counters increment every time the trigger model reaches them until they are more than or equal to the count value. At that point, the trigger model continues to the next building block in the sequence. The counter is reset to 0 when the trigger model starts. It is incremented each time trigger model execution reaches the counter block. If you are using remote commands, you can query the counter. The counter is incremented immediately before the branch compares the actual counter value to the set counter value. Therefore, the counter is at 0 until the first comparison. When the trigger model reaches the set counter value, branching stops and the counter value is one greater than the setting. Use trigger.model.getbranchcount() to query the counter.
---@param blockNumber number The sequence of the block in the trigger model
---@param block setblockalias Condition to branch to specified block.
function trigger.model.setblock(blockNumber,block) end