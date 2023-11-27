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



slot.PSEUDO_NONE = 0

---@alias slotpseudocardpseudoCard
---|`slot.PSEUDO_NONE`



--- **This attribute specifies a pseudocard to implement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Pseudocards allow you to configure your system without having an actual plug-in card installed in your system. You can perform open, close, and scan operations and configure your system with pseudocards.This command is only applicable to a slot that does not have a plug-in card or pseudocard installed. If a pseudocard is presently assigned to the slot, you must set the slot to no pseudocard before assigning the new pseudocard.After assigning a pseudocard, you can use valid commands for the plug-in card for that slot.Changing the pseudocard assignment from a pseudocard to no pseudocard invalidates scan lists that include that slot.If a module is installed in the slot, this command returns nil. If the slot is empty and no pseudocard is installed, the return is 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13964.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- slot[6].pseudocard = 3720
--- 
--- --Sets the pseudocard of slot 6 for 3720 plug-in card simulation.
--- ```
---@type slotpseudocardpseudoCard
slotArr.pseudocard= 0



--- **This attribute indicates whether a card in the specified slot supports commonside channels for 4‑wire resistance measurements.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If commonside 4-wire resistance channels are supported, the returned value is 1.If commonside 4‑wire resistance channels are not supported, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16320.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].commonsideohms)
--- 
--- --Query if slot 1 supports commonside 4-wire ohms channels.
--- ```
slotArr.commonsideohms= 0



--- **This attribute returns a string that contains information about the plug-in card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The information that is returned depends on whether the plug-in card in the slot is a physical card or pseudocard.For physical cards, this returns a comma‑separated string that contains the model number, description, firmware revision, and serial number of the plug-in card installed in the specified slot.For pseudocards, the response is Pseudo, followed by the model number, description, and ??? for the firmware revision and serial number.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16328.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[3].idn)
--- 
--- --If a 3723 is installed in slot 3, the response is:
--- --3723,Dual 1x30 Reed Multiplexer,01.40e,1243657
--- ```
slotArr.idn= 0



--- **This attribute indicates if the card in the specified slot supports isolated channels.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the isolated channels. If isolated channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16331.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- IsolatedChan1 = slot[1].isolated
--- print(IsolatedChan1)
--- 
--- --Query if slot 1 supports isolated channels. If it does support isolated channels, the output is:
--- --1.000000000e+00
--- ```
slotArr.isolated= 0



--- **This attribute indicates if the card in the specified slot supports matrix channels.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if a card is installed and if the installed card supports matrix channels. If matrix channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16332.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- Matrix1 = slot[1].matrix
--- print(Matrix1)
--- 
--- --Query if slot 1 supports matrix channels. If it does support matrix channels, the output is:
--- --1.000000000e+00
--- ```
slotArr.matrix= 0



--- **This attribute returns the maximum voltage of all channels on a plug-in card in the specified slot.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command is only available for a slot if the installed plug-in card supports voltage settings.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16333.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- maxVolts2 = slot[2].maxvoltage
--- print(maxVolts2)
--- 
--- --Query the maximum voltage on slot 2. The output is similar to:
--- --300 
--- ```
slotArr.maxvoltage= 0



--- **This attribute indicates if the card in the specified slot supports multiplexer channels.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports multiplexer channels. If multiplexer channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16334.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MuxChan1 = slot[1].multiplexer
--- print(MuxChan1)
--- 
--- --Query if slot 1 supports multiplexer channels. If it does support multiplexer channels, the output is:
--- --1.000000000e+00
--- ```
slotArr.multiplexer= 0



--- **This attribute indicates if the module in the specified slot supports temperature sensor channels.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command is only available for a slot if the installed module supports temperature sensor channels. If temperature sensor channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16345.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- TempSensor = slot[1].tempsensor
--- print(TempSensor)
--- 
--- --Query to determine if slot 1 supports temperature sensor channels. If it does support temperature sensor channels, the output is:
--- --1.000000000e+00
--- ```
slotArr.tempsensor= 0



--- **This attribute indicates whether or not a card in the specified slot supports digital input and output channels.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports digital I/O channels.If digital I/O channels are supported, the returned value is 1.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/962.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].digio)
--- 
--- --Query if slot 1 supports digital I/O channels.
--- ```
slotArr.digio= 0

---@class channel
channel = {}




--- **This function reads a value from a totalizer, DAC, or digital I/O channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For digital I/O channels, only a width of 1, 2, 3, or 4 is supported. Any information (bits) greater than the specified width is returned as zero. For example, if channels 1 and 2 are both 255, a reading with a width of 1 returns 255 and a width of 2 with channel 1 returns 65535. Values read from outputs reflect their current setting. If the read channel is in the overload state, the read value is indeterminate.For widths greater than 1, the specified channel occupies the least significant byte. For example, reading the value 4293844224 (hex ffeedd00) from channel 1 with a width of 4 indicates channel 1 is 0 (hex 0), channel 2 is 221 (hex dd), channel 3 is 238 (hex ee), and channel 4 is 255 (hex ff). Reading the value of 0 (hex 0) from channel 1 with a width of 1 indicates channel 1 is 0 (hex 0) and other channels are not included. Totalizer and DAC channels do not support a width other than 1 and result in an error if specified.Switch and backplane channels are not supported.For a channel with a power state of OFF, the returned value is DISABLED.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13984.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- count = channel.read("1006")
--- 
--- --Read the count from the first totalizer channel (channel 6) in slot 1, assuming a 3750.
--- ```
---@return string value Return string that lists the comma-delimited read values for the selected channels
---@param channelList string The channels to set, using standard channel naming
---@param width number Specifies reading over multiple consecutive channels (default 1)
---@param readingBuffer bufferMethods Reading buffer to store read values
---@overload fun(channelList:string):string
---@overload fun(channelList:string,width:number):string
function channel.read(channelList, width, readingBuffer) end

channel.OFF = 0
channel.ON = 1

---@alias channelsetpowerstatestate
---|`channel.OFF`
---|`channel.ON`



--- **This function sets the power state on a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When a channel that was previously off is turned on, the channel attributes are reset to their default values (except the power state attribute).Changing the output setting impacts the power consumption of the card. Channels with an off power state consume less power. Before enabling power, the instrument verifies that power is available before changing the state. If insufficient power capability exists, the command generates an error.Consult the specific card documentation for information on a channel’s power usage characteristics, including default state, possible warmup issues, especially for DAC channels, and effects on other channels.When a channel with an off power state is used in a scan, results are undefined. No error notification is issued.For switch, backplane, and digital I/O channels, there is no valid power state attribute. Setting the power state on a specific channel generates an error.On some cards for totalizer channels, setting the power state of a single channel can affect the power state of other channels. If a single totalizer channel is turned on, all totalizer channels are reset to their defaults.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14135.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setpowerstate("1010", channel.ON)
--- 
--- --Sets the power state for DAC channel 10 on the card in slot 1 to ON, assuming a 3750.
--- ```
---@param channelList string The channels to set, using standard channel naming
---@param state channelsetpowerstatestate channel.OFF or 0
function channel.setpowerstate(channelList, state) end


--- **This function returns a string that lists the analog backplane relays that are controlled when the specified channels are used with switching operations.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The response indicates the analog backplane relays that are used during processing of the command:The response will be changed by channel.setbackplane(), replacing the analog backplane relays with the new specified list.The response will be cleared if channel.setpole() sets a new pole selection.The analog backplane relays indicated by this response are not used or affected by:The parameter string can contain "slotX", where X equals 1 to 6, or "allslots".An error is generated if:When channelList contains multiple items, the string returned includes the analog backplane relay channels of a single channel separated by a comma. A semicolon is used to delineate channels.For channel patterns, the analog backplane relays must be specified when creating the pattern in the channel list parameter — see channel.pattern.setimage() or channel.pattern.snapshot(). Therefore, to see the channels and analog backplane relays associated with a channel pattern, use the channel.pattern.getimage() function.Command processing stops as soon as an error is detected and a nil response is then returned. No partial list is returned.For digital I/O, DAC, and totalizer channels, nothing is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15918.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setpole("slot5", 4)
--- channel.setbackplane("slot5", "5911, 5922")
--- print(channel.getbackplane("slot5"))
--- 
--- --Assume a Model 3720 in slot 5.
--- --Set all channels on the card in slot 5 to be 4-pole, which makes the card have 30 4-pole channels.
--- --Set all channels in slot 5 to have associated analog backplane relays 911 and 922 on slot 5.
--- --Get the associated analog backplane relays for channels on slot 5.
--- --Output:
--- --5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922,5911,5922
--- ```
---@return string analogBusList A string listing analog backplane relays associated with items in channelList
---@param channelList string A string listing the channels being queried
function channel.getbackplane(channelList) end


--- **This function returns the match type for digital I/O and totalizer channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channel match types are:Digital analog converter, backplane, and switch channels are not supported. If these channels are included in a range or slot specifier, they are ignored; otherwise, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15926.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getmatchtype("6001:6009"))
--- 
--- --Query the match type for digital I/O channels 1 through 5 and totalizer channels 6 through 9 on slot 6 (assuming a 3750 card). 
--- --Output: 
--- --4,4,4,4,4,4,4,4,4
--- ```
---@return string matchType The comma-delimited states for channels in channelList
---@param channelList string String specifying the digital I/O or totalizer channels to query, using normal channel list syntax
function channel.getmatchtype(channelList) end


--- **This function returns the present mode of digital and totalizer channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For digital I/O channels, the following modes are supported:For totalizer channels, the following modes are supported:For DAC channels, the following modes are supported:Switch and analog backplane channels do not have modes. If included in a range or slot specifier, they are ignored. If they are specified directly, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15927.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getmode("slot6"))
--- 
--- --Query the configuration of the channels on slot 6. Assuming a 3750, channels 1 to 5 are digital I/O, channels 6 to 9 are totalizers, and channels 10 to 11 are DACs.
--- --Output:
--- --0,0,0,0,0,3,3,3,3,49,49
--- ```
---@return string mode Return string of a comma-delimited list of modes
---@param channelList string String that specifies the channels to query, using normal channel list syntax
function channel.getmode(channelList) end


--- **This function gets the present output enable attribute for a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For DAC channels, output enable indicates whether or not the DAC is driving the output. Response values are:Switch, digital I/O, totalizer, and backplane channels do not have modes. If they included in a range or slot specifier, they are ignored. If they are specified directly, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15928.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getoutputenable("slot1"))
--- 
--- --Query the state of all DAC channels on slot 1 (assuming a Model 3750 card, this would be channels 10 and 11).
--- --Output:
--- --0,0
--- ```
---@return boolean outputEnable Return string of a comma-delimited list of output enable values
---@param channelList string String specifying the DAC channels to query, using normal channel list syntax
function channel.getoutputenable(channelList) end


--- **This function queries the pole settings for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- channelList can contain "slotX", where X is 1 to 6, or "allslots".When the channel list parameter for this function is "slotX", the response first lists the channels starting from lowest to highest. When the channel list parameter for this function is "allslots", the response starts with slot 1 and increases to slot 6. Each slot is processed completely before going to the next. All slot 1 channels are listed before slot 2 channels.The response is the numeric value representing the pole selection and not the text. For example, 4-pole selection is 4 and not channel.POLES_FOUR.An error message is generated if:Command processing stops as soon as an error is detected. No partial list is returned. If an error is detected or the slot is empty, the response is nil. Digital I/O, DAC, backplane, and totalizer channels are not supported.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15929.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("slot5")
--- channel.setpole("5003, 5007", 4)
--- polesSlot5 = channel.getpole("5001, 5003, 5005, 5007")
--- print(polesSlot5)
--- 
--- --Reset the channels on slot 5 only.
--- --Set the pole attribute for channels 3 and 7 on slot 5 to be 4.
--- --Query channels 1, 3, 5, and 7 on slot 5 for pole settings.
--- --View the pole attribute for the specified channels.
--- --Output:
--- --2,4,2,4
--- ```
---@return string poles Returns a comma‑separated string of the poles, based on channelList; can be
---@param channelList string A string listing the channels to query for their pole settings
function channel.getpole(channelList) end


--- **This function gets the current power state attribute for a totalizer or DAC channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- See card-specific documentation for important potential implications (warm-up times, effective coverage, use cases, and so on) when disabling or enabling power to a channel.Not all channels can be disabled. If a channel that cannot be disabled is included in a range, it is ignored. If it is specified directly, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15930.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getpowerstate("1006"))
--- 
--- --Get the current power state attribute for a totalizer channel 6 of slot 1 (assuming a Model 3750 card).
--- --Output (assuming defaults):
--- --1
--- ```
---@return string states Return string of a comma-delimited list of power states
---@param channelList string String specifying the channels to query, using normal channel list syntax
function channel.getpowerstate(channelList) end


--- **This function resets the channel state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is applicable to digital I/O, totalizer, and DAC channels only.The values for state are:Multiple states can be set by performing a logical OR operation on the values.For channelList, use channel.ALL to reset all states.States can be latched or unlatched, depending on other system settings. Latched states indicate that the condition occurred since the last reset (or power cycle). Unlatched states indicate that the condition has occurred when the channel.getstate() command was issued. The Overflow and Overload states default to latched.If states are not cleared using channel.resetstatelatch(), you may not be reading the present state of the channel.If the state is reset but the condition that caused the channel state to latch still exists, the state is reset, but a second event is generated through the channel trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15940.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.resetstatelatch("1001", channel.IND_MATCH)
--- 
--- --Clears out a match indicator that was latched on digital I/O channel 1 of slot 1, assuming a Model 3750.
--- ```
---@param channelList string String that specifies the channels that need to have their states reset, using normal channel list syntax
---@param state any The comma-delimited states for channels in channelList that are to have their states reset
function channel.resetstatelatch(channelList, state) end


--- **This function specifies the list of analog backplane relays to use with the specified channels when they are used in switching applications.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The parameter string channelList can contain slotX, where X is 1 to 6, or allslots. The abuslist parameter must specify the entire list of analog backplane relays that are needed. The analog backplane relays specified in the abuslist parameter are used or affected by:The analog backplane relays specified in the abuslist parameter are not used or affected by:For channel patterns, the analog backplane relays are specified when the pattern is created (see channel.pattern.getimage() and channel.pattern.snapshot()). Channel patterns do not have a poles setting associated with them.If this command is updated, the previous list is replaced with the new specified analog backplane relays in the abuslist parameter.For channels, as their pole setting change, the list of analog backplane relays gets cleared. Therefore, after changing the pole settings, send channel.setbackplane() with the appropriate analog backplane relay channels. When clearing the backplane channels, this can involve clearing the paired channel, whether pairing or un-pairing channels. For example, on a 40‑channel card, channels 1 and 21 are paired when the poles for channel 1 is set to 4. Therefore, setting the poles setting on channel 1 to 4 clears the backplane channels for channels 1 and 21. Likewise, they are both cleared when the poles setting is set back to 2 on channel 1.Calling this function on an existing channel involved in scanning invalidates the existing scan list.An error is generated if:If a syntax error occurs, command processing stops and no changes are made.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15941.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setbackplane("2002", "2913, 2914")
--- channel.open("allslots")
--- channel.close("2002")
--- print(channel.getclose("allslots"))
--- 
--- --Use analog backplane relays 3 and 4 in bank 1 of slot 2 for a switching application on channel 2 of slot 2.
--- --Open all channels in the instrument.
--- --Close channel 2 on slot 2.
--- --Query for all closed channels in the instrument.
--- --Output (assuming channel 2002 is configured for 2-pole operation):
--- --2002;2913;2914
--- print(channel.getbackplane("2002"))
---  
---  
---  
---  
---  
--- channel.open("slot2")
--- channel.setpole("2002", 4)
---  
--- channel.close("2002")
--- print(channel.getclose("slot2"))
---  
---  
---  
--- channel.open("slot2")
--- channel.setbackplane("2002", "2911, 2922")
---  
--- channel.close("2002")
--- print(channel.getclose("slot2"))
--- 
--- --Query the analog backplane relays for channel 2 of slot 2, assuming the configuration of the previous example.
--- --Output:
--- --2913,2914
--- -- 
--- --Open all channels on slot 2 only.
--- --Change the poles on channel 2 of slot 2 to 4 (this clears previously assigned backplanes to the channel).
--- --Close channel 2 on slot 2.
--- --Query for closed channels on slot 2 (note that the backplane relays have been cleared and the paired channel, 2022, is in parentheses)
--- --Output:
--- --2002(2022)
--- --Open all channels on slot 2 only.
--- --Assign analog backplane relay 1 of bank 1 and relay 1 of bank 2 of slot 2 to channel 2 of slot 2.
--- -- 
--- --Close channel 2 on slot 2.
--- --Query for closed channels on slot 2.
--- --Output:
--- --2002(2022);2911;2922
--- ```
---@param channelList string A string that lists the channels to change
---@param abuslist string A string that lists the analog backplane relays to set for the channels specified in channelList
function channel.setbackplane(channelList, abuslist) end


--- **This function sets the label associated with a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the label of the specified channel to the label value. The channel attributes associated with the channel remain unchanged except for the label.The label must be unique. In addition, it cannot be the same as the name of a channel pattern. If you specify a label that already exists, an error message is generated that indicates a parameter error and channel that that is already associated the specified label. For example, channel one on slot 4 has a label of start. If you send channel.setlabel("5001", "start"), error code 1115, "Parameter error label already used with channel 4001," is generated.To clear a label, set it to an empty string ("").After defining a label, you can use it to specify the channel instead of using the channel specifier.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15944.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabel("3001", "start")
--- channel.close("start")
--- print(channel.getclose("allslots"))
--- 
--- --Sets the label for channel 1 on slot 3 to start and closes start.
--- --Output:
--- --3001
--- channel.setlabel("3001", "")
--- 
--- --Clears the label for channel 1 on slot 3 back to 3001.
--- channel.setlabel("3001", " ")
--- 
--- --Also clears the label for channel 1 slot 3 back to 3001.
--- ```
---@param channelList string A string that lists the channel to which to set the label; the string cannot contain spaces
---@param labelname string A string that contains the label for the channel in channelList, up to 19 characters
function channel.setlabel(channelList, labelname) end


--- **This function sets the match type on a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The types of match values include:For an exact match, the state match indicator only becomes true when the match value and match mask value equal the channel read value.For an any match, the state match indicator only becomes true when the match value or match mask value equals the channel read value.For a not exact match, the state match indicator only becomes true when the match value and match mask value and channel read value are not equal to the match value and match mask value and last channel read value. In other words, the match value should be the present value, and if the value changes at all away from the original value, a match is declared.For none, matching is disabled.For totalizer channels, only match exact and match none are supported.This command is not supported on DAC, backplane, and switch channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15946.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setmatchtype("1001", channel.MATCH_EXACT)
--- 
--- --Assuming a 3750, defines the match type for digital I/O channel 1 to be a MATCH_EXACT type.
--- ```
---@param channelList string String specifying the channels to set, using normal channel list syntax
---@param type channelMatchType A value for setting the match operation used on this specific channel
function channel.setmatchtype(channelList, type) end


--- **This function sets the mode of operation of a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Different channel types contain additional configurable settings. These settings are grouped together by channel type as described in the following paragraphs.For digital I/O channels, the mode indicates the direction of the channel (input or output). The following modes are supported:For totalizer channels, the mode indicates the configuration of the channel (edge and reset). The following modes are supported:For DAC channels, the mode indicates the output of the channel (function and range). The output is switched off before any mode change is made, and remains off after the mode has changed. The following modes are supported:Changing the mode setting can impact the power consumption of the card. The instrument verifies that power is available before changing the mode. If an insufficient power capability exists, the command generates an error.Consult the card-specific documentation for more detailed information on mode settings and functionality.For digital I/O channels, changing the mode from input to output adds an additional channel delay if the channel.setdelay() function was used to set a user delay.For switch and backplane channels, there is no valid mode setting. Setting a mode on a specific switch or backplane channel generates an error. If the switch or backplane channel is in the range of channels, the switch or backplane channel is ignored.The specified channel list must use only one channel type. For example, channel list "1001:1004" is only valid if channels 1, 2, 3, and 4 are of the same type. If channel 3 is a different type of channel, the channel list is invalid and an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15947.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setmode("6003:6005", channel.MODE_OUTPUT)
---  
---  
---  
--- channel.setmode("6007", channel.MODE_FALLING_TTL_EDGE)
--- 
--- --Assuming a 3750, set digital I/O channels 3 to 5 to be configured for output on slot 6.
--- -- 
--- --Set the totalizer channel 7 on slot 6 to count the falling edges of a TTL signal.
--- ```
---@param channelList string String specifying the channels to set, using normal channel list syntax
---@param mode channelsetmodemode The value that sets the mode of operation for a channel; see Details
function channel.setmode(channelList, mode) end


--- **This function sets the output enable attribute on a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For DAC channels, output enable indicates whether or not the DAC is driving the output. The following possible states are supported:For DAC channels, changing the output state to on adds an additional channel delay to channel.setdelay().Channels with output set to off consume less power.Changing the output setting impacts the power consumption of the card. The instrument verifies that power is available before changing the mode. If there is insufficient power capability, the command generates an error. Consult the specific card documentation for information on a channel’s output characteristics.For switch, backplane, digital I/O, and totalizer channels, there is no valid output enable value. Setting output enable on a specific channel generates an error. If one of these channels is in the range of channels, the channel is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15948.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setoutputenable("1010", channel.OFF)
--- 
--- --Assuming a 3750, turns the output off on the first DAC channel (channel 10) in slot 1.
--- ```
---@param channelList string String specifying the channels to set, using normal channel list syntax
---@param state channelState A value representing the state of the output of the channel
function channel.setoutputenable(channelList, state) end

channel.POLES_ONE = 1
channel.POLES_TWO = 2
channel.POLES_FOUR = 4

---@alias channelsetpolevalue
---|`channel.POLES_ONE`
---|`channel.POLES_TWO`
---|`channel.POLES_FOUR`



--- **This function specifies the pole setting for a list of channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The parameter string can contain allslots or slotX, where X is 1 to 6.Channel patterns do not have a pole setting associated with them. For channel patterns, the pole setting indicates if the paired channel should be used when the pattern is created and the analog backplane relays must be specified when creating the pattern (with channel.pattern.setimage() and channel.pattern.snapshot()). Channel patterns get deleted as the pole settings of the channels in the pattern image get changed.You manipulate the analog backplane relays after setting the pole setting by using the channel.setbackplane() function for channels. For channels, as the pole setting changes, their analog backplane relays, specified by channel.setbackplane(), get cleared. Therefore, after a pole setting change, you need to add the analog backplane relays for the pole setting by using channel.setbackplane(). When clearing the backplane channels, this can involve clearing the paired channel, whether pairing or unpairing channels. For example, on a 40-channel card, channels 1 and 21 are paired when the pole setting for channel 1 is set to 4. Therefore, when changing the pole setting on channel 1 to 4, the backplane channels for channels 1 and 21 are cleared. Likewise, they both are cleared when the pole setting is set back to 2 on channel 1.Calling this function on an existing channel involved in scanning invalidates the existing scan list.An error message is generated for the following reasons:Command processing stops as soon as an error is detected and no pole settings are modified.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15949.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setpole(channel.POLES_FOUR)
--- 
--- --Sets channels on slot 5 to four-pole.
--- channel.reset("slot2")
---  
--- channel.setpole(channel.POLES_FOUR)
--- channel.close("2001, 2003")
--- print(channel.getclose("slot2"))
---  
---  
---  
---  
---  
--- channel.open("slot2")
---  
--- channel.setbackplane("2001", "2915")
---  
--- channel.setbackplane("2003", "2925")
---  
--- channel.close("2001, 2003")
--- print(channel.getclose("slot2"))
---  
---  
---  
---  
--- print(channel.getimage("2001, 2003"))
---  
---  
---  
--- channel.open("slot2")
--- channel.setpole("slot2", 2)
--- print(channel.getimage("2001, 2003"))
--- 
--- --Assuming a 3721, reset channels on slot 2 only.
--- --Set channels on slot 2 to 4-pole.
--- --Close channels 1 and 3 on slot 2.
--- --Query slot 2 for closed channels and analog backplane relays.
--- --Output:
--- --2001(2021);2003(2023)
--- --Note that the channels in parentheses are the paired channels because they are in a 4-pole configuration.
--- -- 
--- --Open all channels and analog backplane relays on slot 2.
--- --Associate analog backplane relay 5 in bank 1 of slot 2 with channel 1 on slot 2.
--- --Associate analog backplane relay 5 in bank 2 of slot 2 with channel 3 on slot 2.
--- -- 
--- --Close channels 1 and 3 on slot 2.
--- --Query slot 2 for closed channels and analog backplane relays.
--- --Output:
--- --2001(2021);2003(2023);2915;2925
--- -- 
--- --Query for channels and analog backplane relays that are manipulated when open and close channels 1 and 3 on slot 2.
--- --Output:
--- --2001(2021),2915;2003(2023),2925 
--- -- 
--- --Clear paired channels and analog backplane relays.
--- --Output:
--- --2001;2003
--- -- 
--- --Note that channels are no longer paired or have analog backplane relays associated with them.
--- ```
---@param channelList string String specifying the channels to set, using normal channel list syntax
---@param value channelsetpolevalue Pole setting for the channels in channelList. Use the following
function channel.setpole(channelList, value) end

channel.IND_MATCH = 4
channel.IND_OVERFLOW = 8
channel.IND_OVERLOAD = 2

---@alias channelsetstatelatchstateLatchMask
---|`channel.IND_MATCH`
---|`channel.IND_OVERFLOW`
---|`channel.IND_OVERLOAD`



--- **This function sets the state indicators to either latching or nonlatching.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Applicable to digital I/O, totalizer, and DAC channels only.Each indicator is represented by a bit in the mask.For nonlatching applications, the state indicator clears automatically when the causing condition clears itself. For latching applications, the condition is cleared using the channel.resetstatelatch() command.When using the trigger model, events are always nonlatching (or pulse oriented). However, in latching operation, the event is only generated once at the beginning. In nonlatching operation, the event is generated anytime the condition begins.Set multiple states by performing a logical OR operation on the values.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15950.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setstatelatch("1001", channel.IND_MATCH)
--- 
--- --Generate only a match state event on digital I/O channel 1 in slot 1, assuming a  3750.
--- channel.setstatelatch("6010", bit.bitor(channel.IND_OVERFLOW, channel.IND_OVERLOAD))
--- print(channel.getstatelatch("6010"))
--- 
--- --Generate either an overflow or overload event on DAC channel 10 in slot 6, assuming a Model 3750.
--- --Query for the state latch for channel 10 on slot 6.
--- --Output:
--- --10
--- ```
---@param channelList string The channels to set, using standard channel naming
---@param stateLatchMask channelsetstatelatchstateLatchMask A value specifying the indicators to latch
function channel.setstatelatch(channelList, stateLatchMask) end


--- **This function writes a value to a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For widths greater than 1, the specified channel occupies the least significant byte. For example, writing the value of 4278255360 (hexadecimal FF00FF00) to channel 1 with a width of 4 sets channel 1 to 0, channel 2 to 255 (hexadecimal FF), channel 3 to 0, and channel 4 to 255 (hexadecimal FF). Writing the value of 4278255360 to channel 1 with a width of 1 sets channel 1 to 0 and leaves other channels untouched.For digital I/O channels, only widths of 1, 2, 3, or 4 are supported. All other widths are ignored. Values written to inputs are ignored. If no specified channel is set for output, then an error is generated. If a width crosses channels, then only the channels set to output are affected.Totalizers, DACs, and switch channels do not support a width other than 1. Specifying a width greater than 1 results in an error.For a channel with a power state of OFF, an error is generated. No action is taken on any channel in the specified channel list.For DAC channels, the value is expected to be the set floating‑point voltage or current. Also, an error is generated if the value is out of range. No action is taken on any channel in the specified channel list.For digital I/O channels, the value becomes the setting of the digital output.The time it takes to execute the write command is affected by the channel delay setting.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15956.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.write("1001", 33)
--- channel.write("1006", 0)
--- 
--- --Output a value of 33 to digital I/O channel 1.
--- --Set totalizer channel 6 on slot 1 (assuming a 3750 card) to 0.
--- ```
---@param channelList string The channels to set, using standard channel naming
---@param value number The value to be written to the channel (must be decimal value)
---@param width number Value that specifies the channel width of the write
---@overload fun(channelList:string,value:number)
function channel.write(channelList, value, width) end


--- **This function gets the mask representing the states that would be latched if they occurred.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Applicable to digital I/O, totalizer, and DAC channels only.Each indicator is represented by a bit in the mask.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16200.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- myState = channel.getstatelatch("1001")
--- print(myState)
--- 
--- --Queries the state event latch on digital I/O channel 1 in slot 1 assuming a Model 3750.
--- channel.setstatelatch("6010", bit.bitor(channel.IND_OVERFLOW, channel.IND_OVERLOAD))
--- print(channel.getstatelatch("6010"))
--- 
--- --Generate either an overflow or overload event on DAC channel 10 in slot 6, assuming a Model 3750.
--- --Query for the state latch for channel 10 on slot 6.
--- --Output:
--- --10
--- ```
---@return channelsetstatelatchstateLatchMask state Return string listing the comma-delimited latch states for channels in channelList
---@param channelList string String specifying the channels to query, using normal channel list syntax
function channel.getstatelatch(channelList) end


--- **This function creates a string channel descriptor from a series of card-dependent integer arguments.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The arguments are dependent upon the card type in the specified slot. This command can only create valid channel descriptors; if an illegal argument is sent for the type of card in the specified slot, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17222.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- cd = channel.createspecifier(3, 1, 2, 101)
--- print(cd)
--- 
--- --Creates a channel descriptor on the Model 3732 card configured as a single 4x112 matrix in slot 3, bank 1, row 2, column 101.
--- --Output:
--- --312A1
--- for row = 1,8 do
---    for col = 1,28 do
---       ch = channel.createspecifier(1,1,row,col)
---       channel.setpole(ch, 2)
---    end
--- end
--- 
--- --Sets the pole setting to 2 for all channels in bank 1 on a Model 3732 card configured as a dual 8x28 matrix in slot 1.
--- cd = createspecifier(2, 2, 1)
--- print(cd)
--- 
--- --Creates a channel descriptor on the Model 3724 multiplexer card in slot 2, bank 2, index 1.
--- --Output:
--- --2031
--- cd = createspecifier(1, 911)
--- print(cd)
--- 
--- --Creates a channel descriptor on the Model 3724 multiplexer card in slot 1, backplane 911.
--- --Output:
--- --1911
--- ```
---@param bank number The bank number (if applicable)
---@param row number The row number
---@param column number The column number
---@overload fun(index:any)
---@overload fun(backplane:any)
---@overload fun(bank:number,index:any)
---@overload fun(bank:number,column:number)
function channel.createspecifier(slotX, bank, row, column) end


--- **This function closes the channels, analog backplane relays, and channel patterns that are specified by the channel list parameter. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Channels closed with this command are appended to the already closed channels (no previously closed channels are opened by this command).The channelList parameter can include channels with analog backplane relays. If this is the case, channel.close closes the specified channels and any associated analog backplane relays. For channel patterns, the analog backplane relays that are closed are the ones that were specified when the pattern was created. However, for channels, they are the ones specified with the channel.setbackplane() function. Another option for closing analog backplane relays with this command is to include them in the channelList parameter.This command has no effect on how the DMM is configured.Actions associated with this function include:This command is not available for digital I/O, DAC, and totalizer channels. Calling on a specific channel generates an error. If the digital I/O, DAC, or totalizer channel is in the range of channels, the channel is ignored.An error is generated if:Once an error is detected, the command stops processing and no channels are closed.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17229.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.close("1001:1005, 3003, Chans")
--- 
--- --Close channels 1 to 5 on slot 1, channel 3 on slot 3, and the channel pattern or label Chans.
--- ```
---@param channelList string The channels, analog backplane relays, and channel patterns to close, using standard channel naming
function channel.close(channelList) end


--- **This function queries for the closed channels indicated by the channel list parameter.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to return a list of closed measurement channels, including the paired channel for 4-wire measurements. It does not return nonmeasurement channels.If more than one channel is closed, they are comma‑delimited in the string. If channelList equals "slotX" (where X is 1 to 6), the response indicates the channels and backplane relays that are closed on that slot. Similarly, if channelList equals "allslots", the response indicates all channels and analog backplane relays that are closed in the instrument. The format of each channel returned is slot, row, column (matrix channels) or slot, channel (MUX channels). When the channelList contains a channel pattern, only the closed channels in that image are returned.You can use "allslots" to query for all channels closed. The instrument returns only information for valid slots and channels.An error message is generated if an empty parameter string is specified or if the specified channel list contains no valid channels that can be closed.If none of the channels in the channel list is closed, nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17247.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setpole("slot5", 4)
--- channel.setbackplane("slot5", "5911, 5922")
--- channel.close("5003, 5005")
--- closedSlot5 = channel.getclose("slot5")
--- print(closedSlot5)
--- 
--- --Configure the channel on slot 5 to be four-pole.
--- --Associate the slot 5 channels with analog backplane relays 911 and 922 on slot 5.
--- --Close channels 3 and 5 on slot 5.
--- --Gets the channels and analog backplane relays that are closed on slot 5 and output the closed channels on slot 5.
--- --Output:
--- --5003(5033);5055(5035);5911;5922
--- allClosed = channel.getclose("allslots")
--- 
--- --Gets all channels and analog backplane relays that are closed in the instrument.
--- closedChans = channel.getclose("Chans")
--- 
--- --Gets all channels closed in a pattern called "Chans".
--- closedRange = channel.getclose("3001:3020")
--- 
--- --Gets all channels that are closed on channels 1 to 20 on slot 3.
--- closedOnes = channel.getclose("3001, 3002, 
--- 3003, 3005, 3911, 3912")
--- 
--- --Gets all channels that are closed on channels 1, 2, 3, 5 and analog backplane relay 1 and 2 in bank 1 on slot 3.
--- ```
---@return string closed A string listing the channels that are presently closed in the specified channel list parameter
---@param channelList string A string representing the channels, channel patterns, and backplane relays that will be queried
function channel.getclose(channelList) end


--- **This function resets the specified channel list items to factory default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For the items specified in channelList, the following actions occur:Using this function to reset a channel or backplane relay involved in scanning invalidates the existing scan list. The list has to be recreated before scanning again.For all channels, any trigger settings are removed.For digital I/O channels, operation is set to input, the match is set to zero (0), and auto‑protect is turned on.For totalizer channels, operation is set to falling edge and TTL level.For DAC channels, output is turned off and auto‑protect is turned on. Operation is set to –12 V to + 12 V.The rest of the instrument settings are unaffected. To reset the entire system to factory default settings, use the reset() command.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17280.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("allslots")
--- 
--- --Performs a reset operation on all channels on the instrument.
--- channel.reset("slot1")
--- 
--- --Resets channels on slot 1 only.
--- channel.reset("3001:3005")
--- 
--- --Resets only channels 1 to 5 on slot 3.
--- channel.reset("5005, 5915")
--- 
--- --Resets only channel 5 and analog backplane relay 5 in bank 1 on slot 5.
--- ```
---@param channelList string A string that lists the items to reset; the string can include
function channel.reset(channelList) end


--- **This function returns the number of times the relays have been closed for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The Series 3700A keeps an internal count of the number of times each relay has been closed. This count can help you determine when relays require replacement. Refer to the plug-in card documentation for the contact life specifications for the relays. The closure counts for an analog backplane relay can be included in the channelList parameter. If channelList includes a pattern, you can use channel.pattern.getimage() with the pattern name to see the channel order and the channels to which the close counts pertain.If channels are specified, the count values are returned in the order in which the channels are specified. If slots are specified, the response lists the channels starting from lowest to highest. Because each slot is processed completely before going to the next, all slot 1 channels and analog backplane relays are listed before slot 2 channels.Relay closures are counted only when a relay cycles from open to closed state.It is good practice to get the relay count at the end of a program. This saves the latest count to memory.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17384.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- counts = channel.getcount("2001:2005")
--- print(counts)
--- 
--- --Gets the close counts for channels 1 to 5 on slot 2.
--- --Example output for channels 2001, 2002, 2003, 2004, and 2005:
--- --672,495,547,479,518
--- counts = channel.getcount("slot2")
--- print(counts)
--- 
--- --Get the close counts for all channels and analog backplane relays on slot 2 assuming a 3721 card is installed in the slot.
--- --Sample output that shows the counts for channels 1 to 41, analog backplane relays 911 to 917, analog backplane relays 921 to 928:
--- --672,495,547,479,518,459,522,599,452,451,464,427,426,428,426,425,428,424,424,425,5,3,3,3,4,3,3,5,3,33,33,33,33,33,33,32,32,32,32,32,119,3,56,0,0,0,0,0,0,14,68,0,0,0,0,16,0
--- channel.pattern.setimage("2003, 2005, 2023, 2915", "Path")
--- PathList = channel.pattern.getimage("Path")
--- print(PathList)
--- print(channel.getcount(PathList))
--- print(channel.getcount("Path"))
--- 
--- --Create a pattern called Path, then get the close counts for channels and analog backplane relays in channel pattern called "Path"
--- --Sample output:
--- --2003, 2005,2023,2915
--- --547,518,3,0
--- --547,518,3,0
--- ```
---@return string counts A comma-delimited string that lists the number of times the channel has closed
---@param channelList string A string listing the items to query, which can include
function channel.getcount(channelList) end


--- **This function prevents the closing of specified channels and analog backplane relays.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter indicates the scope of channels affected and may include:This function prevents all items contained in the channel list parameter from closing. It applies the "forbidden to close" attribute to the specified channels. To remove the "forbidden to close" attribute, use channel.clearforbidden().If a channel that is being set to forbidden is used in a channel pattern, the channel pattern is deleted when the channel or analog backplane relay is set to forbidden. Note that if the channelList parameter includes a channel pattern, the channel pattern will be deleted when the channels in the patterns are successfully set to forbidden to close.The channels or analog backplane relays in the channelList parameter must be installed in the instrument.If the scan list contains a channel or analog backplane relay that is forbidden, the scan list is invalidated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17402.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setforbidden("2002,2004,2006,2008")
--- 
--- --Marks channels 2, 4, 6, and 8 of slot 2 as forbidden to close.
--- ```
---@param channelList string A string that lists the channels and analog backplane relays to make forbidden to close
function channel.setforbidden(channelList) end


--- **This function returns a string listing the channels and analog backplane relays in the channel list that are forbidden to close.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter indicates which channels to check, and may include:If there are no channels in the scope of the channelList that are on the forbidden list, the string returned is empty or nil. The format of the channels in the response string is slot, channel for multiplexer channels or slot, row, column for matrix channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17404.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- Forbidden = channel.getforbidden("allslots")
--- 
--- --Query for the channels and analog backplane relays that are forbidden to close in the instrument.
--- channel.setforbidden("3003, 3005, 3925")
--- Forbidden = channel.getforbidden("slot3")
--- print(Forbidden)
--- 
--- --Set channels 3 and 5 and analog backplane relay 5 in bank 2 to forbidden to close on slot 3.
--- --Query for the channels and analog backplane relays that are forbidden to close on slot 3.
--- --Sample output:
--- --3003,3005,3925
--- Forbidden = channel.getforbidden("1911:1916" .. ",2004,2008,2012")
--- 
--- --Query for channels and analog backplane relays in a specified list. This list is only checking channels and analog backplane relays 1 to 6 on slot 1 and channels 4, 8 and 12 on slot 2 and returning the channels and analog backplane relays that are forbidden to close.
--- ```
---@return string forbiddenList Comma-delimited string listing the channels and analog backplane relays in the channel list that are forbidden to close
---@param channelList string A string listing the channels, backplane relays, and channel patterns that are to be checked to see if they are forbidden to close
function channel.getforbidden(channelList) end


--- **This function clears the list of channels specified from being forbidden to close.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter indicates the channels that will no longer be forbidden to close, and may include:This function allows all items contained in the channelList parameter to be closed. It removes the "forbidden to close" attribute that can be applied to a channel using channel.setforbidden().Command processing stops as soon as an error is detected. If an error is found, the channels are not cleared from being forbidden to close.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17406.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.clearforbidden("2002,2004,2006,2008")
--- 
--- --Clears channels 2, 4, 6, and 8 on slot 2 from being forbidden to close.
--- ```
---@param channelList string The channels to set, using standard channel naming
function channel.clearforbidden(channelList) end

channel.BREAK_BEFORE_MAKE = 1
channel.MAKE_BEFORE_BREAK = 2
channel.OFF = 0

---@alias channelconnectrulerule
---|`channel.BREAK_BEFORE_MAKE`
---|`channel.MAKE_BEFORE_BREAK`
---|`channel.OFF`



--- **This attribute controls the connection rule for closing and opening channels in the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The connection rule describes the order in which switch channels are opened and closed when using channel.exclusiveclose(), channel.exclusiveslotclose(), dmm.close(), and scanning commands like scan.execute() and scan.background(). These commands may both open and close switch channels in a single command. The connection rule dictates the algorithm used by the instrument to order the opening and closing of switches.The connection rule affects the operating time of these commands. These commands do not allow the instrument to continue execution until the settle time of the relays has expired.When the connection rule is set to break before make, the instrument ensures that all switch channels open before any switch channels close. When switch channels are both opened and closed, this command executes not less than the addition of both the open and close settle times of the indicated switch channels.When the connection rule is set to make before break, the instrument ensures that all switch channels close before any switch channels open. This behavior should be applied with caution because it will connect two test devices together for the duration of the switch close settle time. When switch channels are both opened and closed, the command executes not less than the addition of both the open and close settle times of the indicated switch channels.With no connection rule (set to channel.OFF), the instrument attempts to simultaneously open and close switch channels in order to minimize the command execution time. This results in faster performance at the expense of guaranteed switch position. During the operation, multiple switch channels may simultaneously be in the close position. Make sure your device under test can withstand this possible condition. When switch channels are both opened and closed, the command executes not less than the greater of either the open or close settle times of the indicated switch channels.In general, the settling time of single commands that open and close switch channels depends on several factors, such as card type and channel numbers. However, the opening and closing of two sequential channels including no others can be guaranteed as follows:This behavior is also affected by channel.connectsequential and any additional user delay times.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17407.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.connectrule = channel.BREAK_BEFORE_MAKE
--- 
--- --Sets the connect rule in the instrument to channel.BREAK_BEFORE_MAKE
--- ```
---@type channelconnectrulerule
channel.connectrule = 0



--- **This function closes the specified channels so that they are the only channels that are closed on the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to close specific channels and open any other channels on the instrument. When you send this command, any presently closed channel opens if it is not specified to be closed in the parameter. For channel patterns, the analog backplane relays that are closed or opened are the ones that were specified when the pattern was created  with channel.pattern.setimage() or channel.pattern.snapshot(). For channels, the analog backplane relays that are closed or opened are the ones specified with channel.setbackplane(), or that are specified in channelList.When you send this command:If the channelList parameter is an empty string or a string of spaces, all channels and analog backplane relays are opened. Therefore, sending channel.exclusiveclose("") is equivalent to channel.open(channel.getclose("allslots")). However, sending the equivalent commands when nothing is closed generates an error because nil (the response of channel.getclose("allslots")) is being sent to the open command.An error is generated if:Once an error is detected, the command stops processing. Channels open or close only if no errors are found.This command is not available for digital I/O, DAC, and totalizer channels. Calling on a specific channel for these channels generates an error. If the digital I/O, DAC, or totalizer channel is in the range of specified channels, the channel is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17435.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setbackplane("3003","3913")
--- channel.exclusiveclose("3003")
--- 
--- --Associate analog backplane relay 3 in bank 1 on slot 3 with channel 3 on slot 3.
--- --Open all channels and close slot 3, channel 3 and its associated analog backplane relay (3 in bank 1 on slot 3), if it is not already closed.
--- channel.exclusiveclose("3003, 3913")
--- 
--- --Close channel 3 on slot 3 and its associated analog backplane relay 3 in bank 1 on slot 3. By specifying the backplane relay directly, you eliminate the need for associating the backplane with channel.setbackplane.
--- ```
---@param channelList string A string listing the channels (including analog backplane relays) and channel patterns to exclusively close
function channel.exclusiveclose(channelList) end


--- **This function closes the specified channels and channel patterns on the associated slots and opens any channels that are not specified.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to bundle the closing of channels with the opening of channels. Any currently closed channels or analog backplane relays open if they are not specified to be closed on the slots related to the channels in channelList. Using this command guarantees that only the specified channels and channel patterns are closed on the slots associated with channels in the channelList.For channel patterns, the analog backplane relays that are closed or opened are the ones that were specified when the pattern was created (see channel.pattern.setimage() or channel.pattern.snapshot()). For channels, the analog backplane relays are the ones specified with the channel.setbackplane() command. If you do not want to use the channel.setbackplane() command, you can close the analog backplane relays by including them in the channelList parameter. When this command is sent:The command is not available for digital I/O, DAC, and totalizer channels. Calling on one of these channels generates an error. If the digital I/O, DAC, or totalizer channel is in the range of channels, the channel is ignored.An error is generated if:Once an error is detected, the command stops processing. Channels open or close only if no errors are found and remain unchanged with any parsing or syntax error.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17437.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.exclusiveslotclose("3003")
--- channel.exclusiveslotclose("1005, 2005")
--- channel.pattern.setimage("5007, 5017, 5027, 5915," "RouteA")
--- channel.exclusiveslotclose("RouteA")
--- 
--- --Close channel 3 on slot 3 and open all other channels on slot 3 without affecting any other slot.
--- --Close channel 5 on slots 1 and 2 and open all other channels on slots 1 and 2 without affecting any other slots.
--- --Create a channel pattern called RouteA that includes channels 7, 17, and 27 on slot 5. Analog backplane relay 5 in bank 1 on slot 5 is also in the pattern. Have only the RouteA channels close on slot 5 (channels 7, 17, and 27, and analog backplane relay 5 in bank 1 on slot 5.
--- ```
---@param channelList string A string that lists the channels and channel patterns to exclusively close on the cards in associated slots (you can specify analog backplane relays)
function channel.exclusiveslotclose(channelList) end


--- **This function queries for the additional delay time for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter may contain slotX (where X equals 1 to 6) or allslots.A command, after closing the state of channels, incurs the delay time indicated in the response for a channel before it completes. However, the internal settling time must elapse before the user delay is incurred. Therefore, the sequence is:The delay times are comma-delimited in the same order that the items were specified in the channelList parameter. A value of zero (0) indicates that no additional delay time is incurred before a close command completes.An error message is generated for the following reasons:Command processing stops as soon as an error is detected and a nil response is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17521.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- delaytime = channel.getdelay("5001, 5003")
--- print(delaytime)
--- 
--- --Query channels 1 and 3 on slot 5 for their delay times.
--- --Example output:
--- --0.000e+00,0.000e+00
--- patternChannels =    channel.pattern.get("chans")
--- DelayPatternTimes = 
---    channel.getdelay(patternChannels)
--- 
--- --Gets the delay of the channels in the chans channel pattern if chans does not contain backplane relays. If it does contain backplane relays, you receive error code 1115, "Parameter error invalid channel type in channel list."
--- ```
---@return string delayTimes A comma-delimited string consisting of the delay times (in seconds) for channels specified in channelList
---@param channelList string A string listing the channels to query for their delay times
function channel.getdelay(channelList) end


--- **This function sets additional delay time for specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Setting a delay only applies to switch channels. An error occurs for a read/write channel such as digital input/output. The delay being specified by value may be updated based on a card's resolution for delay. To see if the delay value was modified after setting, use the channel.getdelay() command to query.Channel patterns get their delay from the channels that comprise the pattern. Therefore, specify the delay for a pattern through the channels. A pattern incurs the longest delay of all channels comprising that pattern.An error message is generated if:Command processing will stop as soon as an error is detected and no delay times will be modified.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17522.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdelay("5001, 5003" , 50e-6)
--- 
--- --Sets channels 1 and 3 on slot 5 for a delay time of 50 µs.
--- channel.setdelay ("slot3", 0)
--- 
--- --Sets the channels on slot 3 for 0 delay time.
--- ```
---@param channelList string A string listing the channels for which to add delay time
---@param delay number Delay time for the selected channels; minimum is 0 seconds
function channel.setdelay(channelList, delay) end


--- **This function queries a channel for items associated with that channel when used in a switching operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The parameter string can contain "slotX"(where X equals 1 to 6) or "allslots".The returned string lists the channels in slot, channel format or slot, row, column format. A request for multiple channels is delimited by a semicolon. Note that commas delimit the specific channels and analog backplane relays for an individual channel in the string.If an error is detected, the response is nil. An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17523.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setpole("2005", 2)
--- channel.setbackplane("2005", "2911")  
--- channels = channel.getimage("2005")
--- print(channels)
--- 
--- --Set channel 5 on slot 2 for a 2-wire switch application.
--- --Associate analog backplane relay 1 in bank 1 on slot 2 with channel 5 on slot 2.
--- --Query channel 5 on slot 2. 
--- --Output:
--- --2005,2911
--- channel.setpole("2003", 4)
--- channel.setbackplane("2003", "2911,2922")
--- channels = channel.getimage("2003")
--- print(channels)
--- 
--- --Set channel 3 on slot 2 for a 4-wire switch application.
--- --Associate analog backplane relays 1 in bank 1 and 2 in slot 2 with channel 3 on slot 2.
--- --Query channel 3 on slot 2 (assuming channel 3 on slot 2 is on a 40-channel card).
--- --Output:
--- --2003(2023),2911,2922
--- channels = channel.getimage("2003, 2005")
--- print(channels)
--- 
--- --Query for channels 2003 and 2005 in a single call (assuming they are configured as shown in examples 1 and 2).
--- --Output:
--- --2003(2023),2911,2922;2005,2911
--- channels = channel.getimage("2023")
--- print(channels)
--- 
--- --Query channel 2023.
--- --Query channel 3 on slot 2 (assuming channel 23 on slot 2 is on a 40-channel card).
--- --Output:
--- --nil
--- --2023 is paired for 4-wire operation
--- ```
---@return string channels A string listing the channels and analog backplane relays associated with the specified items
---@param channelList string A string representing the channels and analog backplane relays to query
function channel.getimage(channelList) end


--- **This function retrieves the label associated with one or more channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter can contain more than one channel. If it does, a comma delimits the labels for the channels. The return string lists the labels in the same order that the channels were specified. The channelList parameter cannot be an empty string and must be a valid channel.The channelList parameter can contain slotX (where X equals 1 to 6) or allslots. In this case, the channels are listed before the analog backplane relays.An error is generated if:Command processing stops as soon as an error is detected, and then a nil response is generated. No partial list of labels is returned.Labels are also supported for digital I/O, DAC, and totalizer channels.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17536.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("5001")
--- print(channel.getlabel("5001"))
--- channel.setlabel("5001", "Device")
--- print(channel.getlabel("5001"))
--- 
--- --Reset the channel.
--- --Print the default label of the channel.
--- --Set the label to Device.
--- --Return the new label.
--- --Output:
--- --5001
--- --Device
--- ```
---@return string label A string listing the comma-delimited labels for items in channelList
---@param channelList any A string listing the channels to query for the label associated with them
function channel.getlabel(channelList) end


--- **This function gets the match value on a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If a width greater than 1 is specified with channel.setmatch(), the matchValue contains the additional channel width specified at set time. For example, the value of 65535 with a width of 2 returns 65535. If the width is 1, 255 is returned.This command returns the match value that was set for the specified channels. DAC, backplane, and switch channels are not supported. If they are included in a range or slot specifier, they are ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17540.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getmatch("slot6"))
--- 
--- --Query the match values set for digital I/O channels 1 to 5 on slot 6 and totalizer channels 6 to 9 on slot 6, assuming a Model 3750 card.
--- --Output (assuming defaults):
--- --0,0,0,0,0,0,0,0,0
--- ```
---@return string matchValue The match values set for the channels in channelList
---@param channelList string String specifying digital I/O or totalizer channels to query, using normal channel list syntax
function channel.getmatch(channelList) end


--- **This function sets the match value on a digital input or totalizer channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use matching to set a state or generate an event when the digital I/O or totalizer count matches a value, instead of continually reading the digital input or totalizer.The default mask is all bits.For digital I/O channels, a width of 1, 2, 3, or 4 channels is supported. Any bits greater than the specified width are ignored. If a width crosses channels, the match status indicator is only on the channel specified in the match value. For example, setting a value with a 2 width on channel 3 drives the indicator on channel 3, not channel 4. Match values for output channels are ignored.Totalizer and DAC channels only support a width of 1, and mask is ignored.Switch and backplane channels are not supported. If they are included in a range or slot specifier, they are ignored. If they are specified directly, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setmatchtype("1001", channel.MATCH_EXACT)
--- channel.setmatch("1001", 32)
--- 
--- --Generates a match state event on bit B6 of digital I/O channel 1, assuming a 3750.
--- channel.setmatchtype("6007", channel.MATCH_EXACT)
--- channel.setmatch("6007", 300)
--- 
--- --Assuming a 3750, configure the totalizer channel 7 on slot 6 to generate a match state event when it reaches 300.
--- ```
---@param channelList string String that specifies the channels to query, using normal channel list syntax
---@param matchValue number Channel value to compare on the specified channel
---@param mask number Value to specify the bits used to mask matchValue
---@param width any Value that specifies matches over multiple consecutive channels (default 1)
---@overload fun(channelList:string,matchValue:number)
---@overload fun(channelList:string,matchValue:number,mask:number)
function channel.setmatch(channelList, matchValue, mask, width) end


--- **This function returns the state indicators of the channels in the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Each bit in the state represents a different indicator. Therefore, multiple indicators can be present (the OR operation is performed bitwise). All state or state latch commands behave in this manner.Different channel types support different state information (indicators). The optional state indicatorMask can be used to return only certain indicators. If there is no indicatorMask, then all indicators are returned.The following status indicators are defined:Indicators can be latched or unlatched, depending on other system settings. Latched indicators mean that the condition has occurred since the last reset command (or power cycle). Unlatched indicators mean that the condition occurred when the channel.getstate() command was issued. The overflow and overload indicators default to a latched condition.Although the channel.getstate() command returns a string representing a number, this can be easily changed to a number and then compared to one of the provided Lua constants.For switch channels, the only state information is an indicator of relay state (channel.IND_CLOSED).For digital I/O channels, the state information includes an indicator for the state of auto protection and whether the match value has been matched (channel.IND_OVERLOAD and channel.IND_MATCH).For totalizer channels, the state information includes an indicator for overflow and whether the match value has been matched (channel.IND_OVERFLOW and channel.IND_MATCH).For DAC channels, the state information includes an indicator for the state of auto protection (channel.IND_OVERLOAD).For more specific information about the overflow and overload indicators, refer to the documentation for the specific card on which the specified channel resides.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17546.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.close("4005, 4007, 4017, 4003")  
--- State = channel.getstate("4001:4020")
--- print(State)
--- 
--- --Close channels 5, 7, 17, and 3 on slot 4.
--- --Query the state of the first 20 channels on slot 4.
--- --View the response assigned to State.
--- --Output (assuming a Model 3720):
--- --0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0
--- PathList = channel.pattern.getimage("Path")
--- print(Path)
--- print(channel.getstate(Path))
--- 
--- --See the state of channels and analog backplane relays in the channel pattern called "Path".
--- --Output:
--- --4003,4005,4007,4017,4911,4922
--- --1,1,1,1,1,1
--- PathState = channel.getstate("Path")
--- print(PathState)
--- 
--- --Another way to see the state of channels and analog backplane relays in channel pattern "Path" in Example 2 without getting the channels and analog backplane relays first.
--- --Output:
--- --1,1,1,1,1,1
--- if bit.bitand(channel.IND_OVERLOAD,
---    tonumber(channel.getstate("4010"))) == 1
--- then
---    print("OVERLOAD")
--- end
--- 
--- --Use the following command to check for an overload on a DAC channel.
--- --In the previous example, channel.getstate() returns a string that is converted to a number using the Lua tonumber() command. channel.IND_OVERLOAD equates to the number 2. Because the state is a bit-oriented value, a logical AND operation must be performed on the state and the overload constant to isolate it from other indicators.
--- --The tonumber() command only works with a single channel. When multiple channels are returned (for example, channel.getstate("slot4")), this string must be parsed by the comma delimiter to find each value.
--- ```
---@return string state Return string listing the comma-delimited states for the channels in channelList
---@param channelList string String specifying the channels to query, using normal channel list syntax
---@param indicatorMask channelgetstateindicatorMask Value to specify only certain indicators; if omitted, all indicators are returned
---@overload fun(channelList:string):string
function channel.getstate(channelList, indicatorMask) end


--- **This function returns the type associated with a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channel type is defined by the physical hardware of the card on which the channel exists. The following are valid channel types:Refer to the card-specific documentation for more information about the channel types available for your card.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17547.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.gettype("1001, 1911"))
--- 
--- --Query the channel type of channel 1 and analog backplane relay 1 of bank 1 in slot 1, assuming a 3720.
--- --Output:
--- --1,2
--- print(channel.gettype("slot6"))
--- 
--- --Query the channel types on slot 6, assuming a 3750.
--- --Output:
--- --4,4,4,4,4,16,16,16,16,8,8
--- --This shows that channels 1 to 5 are digital I/O types, channels 6 to 9 are totalizer types, and channels 10 and 11 are DAC types.
--- ```
---@return string type Returns a comma-delimited list of the type of channels in channelList
---@param channelList string String specifying the channels to query, using normal channelList syntax
function channel.gettype(channelList) end


--- **This function opens the specified channels, analog backplane relays, and channel patterns.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function opens the specified channels based on the switching configuration of the channel.For the items specified to open, the channels associated with them open, as well as the associated analog backplane relays for each. For channel patterns, the analog backplane relays that get opened are the ones that are specified when the pattern is created (through channel.pattern.setimage() and channel.pattern.snapshot()). For channels, they are the ones specified with the channel.setbackplane() function. Another option for opening analog backplane relays with this command is to include them in the channelList parameter.This command has no effect on how the DMM is configured.The settling time associated with a channel must elapse before the command completes. User delay is not added when a relay opens.For digital I/O, DAC, and totalizer channels, there is no valid behavior; calling on a specific channel generates an error. If a digital I/O, DAC, or totalizer channel is in the range of channels, the channel is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17548.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.open("1001:1005, 3003, Chans")
--- 
--- --Opens channels 1 to 5 on slot 1, channel 3 on slot 3, and the channel pattern or label Chans.
--- channel.open("slot3, slot5")
--- 
--- --Opens all channels on slots 3 and 5.
--- channel.open("allslots")
--- 
--- --Opens all channels on all slots.
--- ```
---@param channelList string String listing the channels, analog backplane relays, and channel patterns to open
function channel.open(channelList) end

channel.OFF = 0
channel.ON = 1

---@alias channelconnectsequentialsequential
---|`channel.OFF`
---|`channel.ON`



--- **This attribute controls whether or not channels are closed sequentially.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17663.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.connectsequential = channel.ON
--- 
--- --Specifies that channels close sequentially.
--- ```
---@type channelconnectsequentialsequential
channel.connectsequential = 0

---@class userstring
userstring = {}




--- **This function adds a user-defined string to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function associates the string value with the string name and stores this key-value pair in nonvolatile memory.Use the userstring.get() function to retrieve the value associated with the specified name.You can use the userstring functions to store custom, instrument-specific information in the instrument, such as department number, asset number, or manufacturing plant location.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13987.htm"])
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
--- 
--- --Stores user-defined strings in nonvolatile memory and recalls them from the instrument using a for loop.
--- --Example output:
--- --assetnumber = 236
--- --contact = John Doe
--- --product = Widgets
--- ```
---@param name string The name of the string; the key of the key-value pair
---@param value string The string to associate with name; the value of the key-value pair
function userstring.add(name, value) end


--- **This function creates an iterator for the user‑defined string catalog.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The catalog provides access for user‑defined string pairs, allowing you to manipulate all the key-value pairs in nonvolatile memory. The entries are enumerated in no particular order.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13988.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in userstring.catalog() do
---    userstring.delete(name)
--- end
--- 
--- --Deletes all user‑defined strings in nonvolatile memory.
--- userstring.add("assetnumber", "236")
--- userstring.add("product", "Widgets")
--- userstring.add("contact", "John Doe")
--- for name in userstring.catalog() do
---    print(name .. " = " ..
---       userstring.get(name))
--- end
--- 
--- --Prints all userstring key‑value pairs.
--- --Output:
--- --product = Widgets
--- --assetnumber = 236
--- --contact = John Doe
--- --Notice the key-value pairs are not listed in the order they were added.
--- ```
function userstring.catalog() end


--- **This function deletes a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function deletes the string that is associated with name from nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13989.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.delete("assetnumber")
--- userstring.delete("product")
--- userstring.delete("contact")
--- 
--- --Deletes the user-defined strings associated with the assetnumber, product, and contact names.
--- ```
---@param name string The name (key) of the key-value pair of the user‑defined string to delete
function userstring.delete(name) end


--- **This function retrieves a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the string that is associated with name from nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13990.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.add("assetnumber", "236")
--- value = userstring.get("assetnumber")
--- print(value)
--- 
--- --Create the user-defined string assetnumber, set to a value of 236.
--- --Read the value associated with the user-defined string named assetnumber.
--- --Store it in a variable called value, then print the variable value.
--- --Output:
--- --236
--- ```
---@return number value The value of the user‑defined string key-value pair
---@param name string The name (key) of the user‑defined string
function userstring.get(name) end
---@class upgrade
upgrade = {}




--- **This function returns to a previous version of the Series 3700A firmware.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function allows you to revert to an earlier version of the firmware.When you send this function, the instrument searches the USB flash drive in the front‑panel USB port for an upgrade file. If the file is found, the instrument performs the upgrade. An error is returned if an upgrade file is not found.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14062.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function upgrade.previous() end


--- **This function upgrades the Series 3700A firmware.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When upgrade.unit() is used, the firmware is only loaded if the version of the firmware is newer than the existing version. If the version is older or at the same revision level, it is not upgraded.When you send this function, the instrument searches the USB flash drive in the front‑panel USB port for an upgrade file. If the file is found, the instrument verifies that the file is a newer version. If the version is older or at the same revision level, it is not upgraded, although it does request a reboot. If it is a newer version, the instrument performs the upgrade. An error is returned if no upgrade file is found.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14063.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function upgrade.unit() end
---@class tspnet
tspnet = {}




--- **This function clears any pending output data from the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears any pending output data from the device. No data is returned to the caller and no data is processed.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14073.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(testdevice, "print([[hello]])")
--- print(tspnet.readavailable(testdevice))
--- tspnet.clear(testdevice)
--- print(tspnet.readavailable(testdevice))
--- 
--- --Write data to a device, then print how much is available.
--- --Output:
--- --6.00000e+00
--- -- 
--- --Clear data and print how much data is available again.
--- --Output:
--- --0.00000e+00
--- ```
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.clear(connectionID) end


--- **This function establishes a network connection with another LAN instrument or device through the LAN interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command connects a device to another device through the LAN interface. If the portNumber is 23, the interface uses the Telnet protocol and sets appropriate termination characters to communicate with the device.If a portNumber and initString are provided, it is assumed that the remote device is not TSP‑enabled. The Series 3700A does not perform any extra processing, prompt handling, error handling, or sending of commands. In addition, the tspnet.tsp.* commands cannot be used on devices that are not TSP‑enabled.If neither a portNumber nor an initString is provided, the remote device is assumed to be a Keithley Instruments TSP‑enabled device. Depending on the state of the tspnet.tsp.abortonconnect attribute, the Series 3700A sends an abort command to the remote device on connection. The Series 3700A also enables TSP prompts on the remote device and error management. The Series 3700A places remote errors from the TSP‑enabled device in its own error queue and prefaces these errors with Remote Error, followed by an error description. Do not manually change either the prompt functionality (localnode.prompts) or show errors by changing localnode.showerrors on the remote TSP-enabled device. If you do this, subsequent tspnet.tsp.* commands using the connection may fail.You can simultaneously connect to a maximum of 32 remote devices.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14074.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- instrumentID = tspnet.connect("192.0.2.1")
--- if instrumentID then
---    -- Use instrumentID as needed here
---    tspnet.disconnect(instrumentID)
--- end
--- 
--- --Connect to a TSP-enabled device.
--- instrumentID = tspnet.connect("192.0.2.1", 1394, "*rst\r\n")
--- if instrumentID then
---    -- Use instrumentID as needed here
---    tspnet.disconnect(instrumentID)
--- end
--- 
--- --Connect to a device that is not TSP‑enabled.
--- ```
---@return tsplinkConnectionID connectionID The connection ID to be used as a handle in all other tspnet function calls
---@param ipAddress string IP address to which to connect in a string; accepts IP address or host name when trying to connect
---@param portNumber number Port number (default 5025)
---@param initString string Initialization string to send to ipAddress
---@overload fun(ipAddress:string):tspnetConnectionID
function tspnet.connect(ipAddress, portNumber, initString) end


--- **This function disconnects a specified TSP-Net session.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function disconnects the two devices by closing the connection. The connectionID is the session handle returned by tspnet.connect().For TSP-enabled devices, this aborts any remotely running commands or scripts.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14076.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testID = tspnet.connect("192.0.2.0")
--- -- Use the connection
--- tspnet.disconnect(testID)
--- 
--- --Create a TSP‑Net session.
--- --Close the session.
--- ```
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.disconnect(connectionID) end


--- **This function sends a command string to the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sends a command string to the remote instrument. A termination is added to the command string when it is sent to the remote instrument (tspnet.termination()). You can also specify a format string, which causes the command to wait for a response from the remote instrument. The Series 3700A decodes the response message according to the format specified in the format string and returns the message as return values from the function (see tspnet.read() for format specifiers).When this command is sent to a TSP-enabled instrument, the Series 3700A suspends operation until a timeout error is generated or until the instrument responds. The TSP prompt from the remote instrument is read and discarded. The Series 3700A places any remotely generated errors into its error queue. When the optional format string is not specified, this command is equivalent to tspnet.write(), except that a termination is automatically added to the end of the command.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14077.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.execute(instrumentID, "runScript()")
--- 
--- --Command the remote device to run a script named runScript.
--- tspnet.timeout = 5
--- id_instr = tspnet.connect("192.0.2.23", 23, "*rst\r\n")
--- tspnet.termination(id_instr, tspnet.TERM_CRLF)
--- tspnet.execute(id_instr, "*idn?")
--- print("tspnet.execute returns:", tspnet.read(id_instr))
--- 
--- --Print the *idn? string from the remote device.
--- ```
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
---@param commandString string The command to send to the remote device
---@return number value1 The first value decoded from the response message
---@return number value2 The second value decoded from the response message
---@param formatString string Format string for the output
---@overload fun(connectionID:tspnetConnectionID,commandString:string):number
---@overload fun(connectionID:tspnetConnectionID,commandString:string,formatString:string):number
---@overload fun(connectionID:tspnetConnectionID,commandString:string,formatString:string):number
function tspnet.execute(connectionID, commandString, formatString) end


--- **This function retrieves the response of the remote device to *IDN?.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the response of the remote device to *IDN?.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14078.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- deviceID = tspnet.connect("192.0.2.1")
--- print(tspnet.idn(deviceID))
--- tspnet.disconnect(deviceID)
--- 
--- --Assume the instrument is at IP address 192.0.2.1.
--- --The output that is produced when you connect to the instrument and read the identification string may appear as:
--- --KEITHLEY INSTRUMENTS,MODEL 2470,00000170,1.1.0s
--- ```
---@return string idnString The returned *IDN? string
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.idn(connectionID) end


--- **This function reads data from a remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads available data from the remote instrument and returns responses for the specified number of arguments.The format string can contain the following specifiers:A maximum of 10 format specifiers can be used for a maximum of 10 return values.If formatString is not provided, the command returns a string that contains the data until a new line is reached. If no data is available, the Series 3700A pauses operation until the requested data is available or until a timeout error is generated. Use tspnet.timeout to specify the timeout period.When the Series 3700A reads from a TSP-enabled remote instrument, the Series 3700A removes Test Script Processor (TSP®) prompts and places any errors it receives from the remote instrument into its own error queue. The Series 3700A prefaces errors from the remote device with "Remote Error," followed by the error number and error description.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14079.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(deviceID, "*idn?\r\n")
---  
--- print("write/read returns:", tspnet.read(deviceID))
--- 
--- --Send the "*idn?\r\n" message to the instrument connected as deviceID.
--- --Display the response that is read from deviceID (based on the *idn? message).
--- ```
---@return number value1 The first value decoded from the response message
---@return number value2 The second value decoded from the response message
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
---@param formatString string Format string for the output, maximum of 10 specifiers
---@overload fun(connectionID:tspnetConnectionID):number
---@overload fun(connectionID:tspnetConnectionID,formatString:string):number
---@overload fun(connectionID:tspnetConnectionID,formatString:string):number
function tspnet.read(connectionID, formatString) end


--- **This function checks to see if data is available from the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command checks to see if any output data is available from the device. No data is read from the instrument. This allows TSP scripts to continue to run without waiting on a remote command to finish.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14080.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ID = tspnet.connect("192.0.2.1")
--- tspnet.write(ID, "*idn?\r\n")
--- repeat bytes = tspnet.readavailable(ID) until bytes > 0
--- print(tspnet.read(ID))
--- tspnet.disconnect(ID)
--- 
--- --Send commands that create data.
--- --Wait for data to be available.
--- ```
---@return number bytesAvailable The number of bytes available to be read from the connection
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.readavailable(connectionID) end


--- **This function disconnects all TSP-Net sessions.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command disconnects all remote instruments connected through TSP-Net. For TSP-enabled devices, this causes any commands or scripts running remotely to be terminated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14081.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function tspnet.reset() end

tspnet.TERM_LF4 = nil
tspnet.TERM_CR2 = nil
tspnet.TERM_CRLF3 = nil
tspnet.TERM_LFCR = nil

---@alias tspnetterminationtype
---|`tspnet.TERM_LF4`
---|`tspnet.TERM_CR2`
---|`tspnet.TERM_CRLF3`
---|`tspnet.TERM_LFCR`



--- **This function sets the device line termination sequence.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets and gets the termination character sequence that is used to indicate the end of a line for a TSP-Net connection.Using the termSequence parameter sets the termination sequence. The present termination sequence is always returned.For the termSequence parameter, use the same values listed in the table above for type. There are four possible combinations, all of which are made up of line feeds (LF or 0x10) and carriage returns (CR or 0x13). For TSP-enabled devices, the default is tspnet.TERM_LF. For devices that are not TSP‑enabled, the default is tspnet.TERM_CRLF.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14082.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- deviceID = tspnet.connect("192.0.2.1")
--- if deviceID then
---    tspnet.termination(deviceID, tspnet.TERM_LF)
--- end
--- 
--- --Sets termination type for IP address 192.0.2.1 to TERM_LF.
--- ```
---@return tspnetterminationtype type An enumerated value indicating the termination type
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
---@param termSequence tspnetterminationtermSquence The termination sequence
---@overload fun(connectionID:tspnetConnectionID):tspnetterminationtype
function tspnet.termination(connectionID, termSequence) end


--- **This attribute sets the timeout value for the tspnet.connect(), tspnet.execute(), and tspnet.read() commands. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the amount of time the tspnet.connect(), tspnet.execute(), and tspnet.read() commands wait for a response.The time is specified in seconds. The timeout may be specified to millisecond resolution but is only accurate to the nearest 10 ms.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14084.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.timeout = 2.0
--- 
--- --Sets the timeout duration to 2 s.
--- ```
tspnet.timeout = 0



--- **This function writes a string to the remote instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tspnet.write() function sends inputString to the remote instrument. It does not wait for command completion on the remote instrument.The Series 3700A sends inputString to the remote instrument exactly as indicated. The inputString must contain any necessary new lines, termination, or other syntax elements needed to complete properly.Because tspnet.write() does not process output from the remote instrument, do not send commands that generate too much output without processing the output. This command can stop executing if there is too much unprocessed output from previous commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14089.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(myID, "runscript()\r\n")
--- 
--- --Commands the remote instrument to execute a command or script named runscript() on a remote device identified in the system as myID.
--- ```
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
---@param inputString string The string to be written
function tspnet.write(connectionID, inputString) end
---@class beeper
beeper = {}



beeper.OFF = 0
beeper.ON = 1

---@alias beeperenablestate
---|`beeper.OFF`
---|`beeper.ON`



--- **This command allows you to turn the beeper on or off.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command enables or disables the beeper. When enabled, a beep signals that a front‑panel key has been pressed. Disabling the beeper also disables front‑panel key clicks.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14435.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.enable = beeper.ON
--- beeper.beep(2, 2400)
--- 
--- --Enables the beeper and generates a two‑second, 2400 Hz tone.
--- ```
---@type beeperenablestate
beeper.enable = 0



--- **This function generates an audible tone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use the beeper of the Series 3700A to provide an audible signal at a specified frequency and time duration. For example, you can use the beeper to signal the end of a lengthy sweep.The beeper does not sound if it is disabled. It can be disabled or enabled with the beeper enable command, or through the front panel.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/18841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.enable = beeper.ON
--- beeper.beep(2, 2400)
--- 
--- --Enables the beeper and generates a two‑second, 2400 Hz tone.
--- ```
---@param duration number The amount of time to play the tone (0.001 s to 100 s)
---@param frequency number The frequency of the tone in Hertz (Hz)
function beeper.beep(duration, frequency) end
---@class bit
bit = {}




--- **This function performs a bitwise logical AND operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to form integers. The returned result is also an integer.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14632.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitand(10, 9)
--- print(testResult)
--- 
--- --Performs a logical AND operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 8 (binary 1000).
--- --Output:
--- --8.00000e+00
--- ```
---@return number result Result of the logical AND operation
---@param value1 number Operand for the logical AND operation
---@param value2 number Operand for the logical AND operation
function bit.bitand(value1, value2) end


--- **This function performs a bitwise logical OR operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to make them integers. The returned result is also an integer.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14634.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitor(10, 9)
--- print(testResult)
--- 
--- --Performs a bitwise logical OR operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 11 (binary 1011).
--- --Output:
--- --1.10000e+01
--- ```
---@return number result Result of the logical OR operation
---@param value1 number Operand for the logical OR operation
---@param value2 number Operand for the logical OR operation
function bit.bitor(value1, value2) end


--- **This function performs a bitwise logical XOR (exclusive OR) operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to make them integers. The returned result is also an integer.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitxor(10, 9)
--- print(testResult)
--- 
--- --Performs a logical XOR operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 3 (binary 0011).
--- --Output:
--- --3.00000e+00
--- ```
---@return number result Result of the logical XOR operation
---@param value1 number Operand for the logical XOR operation
---@param value2 number Operand for the logical XOR operation
function bit.bitxor(value1, value2) end


--- **This function clears a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional part of value is truncated to make it an integer. The returned result is also an integer.The least significant bit of value is at index position 1; the most significant bit is at index position 32.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14636.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.clear(15, 2)
--- print(testResult)
--- 
--- --The binary equivalent of decimal 15 is 1111. If you clear the bit at index position 2, the returned decimal value is 13 (binary 1101).
--- --Output:
--- --1.30000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position within value to clear (1 to 32)
function bit.clear(value, index) end


--- **This function retrieves the weighted value of a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns the value of the bit in value at index. This is the same as returning value with all other bits set to zero (0).The least significant bit of value is at index position 1; the most significant bit is at index position 32.If the indexed bit for the number is set to zero (0), the result is zero (0).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14637.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.get(10, 4)
--- print(testResult)
--- 
--- --The binary equivalent of decimal 10 is 1010. If you get the bit at index position 4, the returned decimal value is 8.
--- --Output:
--- --8.00000e+00
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position within value to get (1 to 32)
function bit.get(value, index) end


--- **This function returns a field of bits from the value starting at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A field of bits is a contiguous group of bits. This function retrieves a field of bits from value starting at index.The index position is the least significant bit of the retrieved field. The number of bits to return is specified by width.The least significant bit of value is at index position 1; the most significant bit is at index position 32.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14638.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.getfield(13, 2, 3)
--- print(myResult)
--- 
--- --The binary equivalent of decimal 13 is 1101. 
--- --The field at index position 2 and width 3 consists of the binary bits 110. The returned value is decimal 6 (binary 110).
--- --Output:
--- --6.00000e+00
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position within value to get (1 to 32)
---@param width number The number of bits to include in the field (1 to 32)
function bit.getfield(value, index, width) end


--- **This function sets a bit at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is value with the indexed bit set. The index must be between 1 and 32.The least significant bit of value is at index position 1; the most significant bit is at index position 32.Any fractional part of value is truncated to make it an integer.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14639.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.set(8, 3)
---  
--- print(testResult)
--- 
--- --The binary equivalent of decimal 8 is 1000. If the bit at index position 3 is set to 1, the returned value is decimal 12 (binary 1100).
--- --Output:
--- --1.20000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position within value to set (1 to 32)
function bit.set(value, index) end


--- **This function overwrites a bit field at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is value with a field of bits overwritten, starting at index. The index specifies the position of the least significant bit of value. The width bits starting at index are set to fieldValue.The least significant bit of value is at index position 1; the most significant bit is at index position 32.Before setting the field of bits, any fractional parts of value and fieldValue are truncated to form integers.If fieldValue is wider than width, the most significant bits of the fieldValue that exceed the width are truncated. For example, if width is 4 bits and the binary value for fieldValue is 11110 (5 bits), the most significant bit of fieldValue is truncated and a binary value of 1110 is used.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14640.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.setfield(15, 2, 3, 5)
--- print(testResult)
--- 
--- --The binary equivalent of decimal 15 is 1111. After overwriting it with a decimal 5 (binary 101) at index position 2, the returned value is decimal 11 (binary 1011).
--- --Output:
--- --1.10000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position in value to set (1 to 32)
---@param width number The number of bits to include in the field (1 to 32)
---@param fieldValue number Value to write to the field
function bit.setfield(value, index, width, fieldValue) end


--- **This function returns the Boolean value (true or false) of a bit at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is the result of the tested bit. The least significant bit of value is at index position 1; the most significant bit is at index position 32.If the indexed bit for value is 0, result is false. If the bit of value at index is 1, the returned value is true.If index is bigger than the number of bits in value, the result is false.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14641.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.test(10, 4)
--- print(testResult)
--- 
--- --The binary equivalent of decimal 10 is 1010. Testing the bit at index position 4 returns a Boolean value of true.
--- --Output:
--- --true
--- ```
---@return boolean result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position within value to test (1 to 32)
function bit.test(value, index) end


--- **This function toggles the value of a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is the result of toggling the bit index in value.Any fractional part of value is truncated to make it an integer. The returned value is also an integer.The least significant bit of value is at index position 1; the most significant bit is at index position 32.The indexed bit for value is toggled from 0 to 1, or 1 to 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14642.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.toggle(10, 3)
--- print(testResult)
--- 
--- --The binary equivalent of decimal 10 is 1010. Toggling the bit at index position 3 returns a decimal value of 14 (binary 1110).
--- --Output:
--- --1.40000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number One‑based bit position within value to toggle (1 to 32)
function bit.toggle(value, index) end
---@class dataqueue
dataqueue = {}




--- **This function adds an entry to the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot use the timeout value when accessing the data queue from a remote node (you can only use the timeout value while adding data to the local data queue).The timeout value is ignored if the data queue is not full.The dataqueue.add() function returns false:If the value is a table, a duplicate of the table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14654.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14655.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This constant always returns the maximum number of entries that can be stored in the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14656.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MaxCount = dataqueue.CAPACITY
--- while dataqueue.count < MaxCount do
---    dataqueue.add(1)
--- end
--- print("There are " .. dataqueue.count .. " items in the data queue")
--- 
--- --This example fills the data queue until it is full and prints the number of items in the queue.
--- --Output:
--- --There are 128 items in the data queue
--- ```
---@type dataqueueCAPACITYcount
dataqueue.CAPACITY = 0



--- **This attribute contains the number of items in the data queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The count is updated as entries are added with dataqueue.add() and read from the data queue with dataqueue.next(). It is also updated when the data queue is cleared with dataqueue.clear().A maximum of dataqueue.CAPACITY items can be stored at any one time in the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14657.htm"])
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
dataqueue.count = 0



--- **This function removes the next entry from the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the data queue is empty, the function waits up to the timeout value.If data is not available in the data queue before the timeout expires, the return value is nil.The entries in the data queue are removed in first-in, first-out (FIFO) order.If the value is a table, a duplicate of the original table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14658.htm"])
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
---@class digio
digio = {}




--- **This function reads one digital I/O line. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A returned value of zero (0) indicates that the line is low. A returned value of one (1) indicates that the line is high.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14668.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(digio.readbit(4))
--- 
--- --Assume line 4 is set high, and it is then read.
--- --Output:
--- --1.00000e+00
--- ```
---@return number data The state of the I/O line
---@param N number Digital I/O line number to be read (1 to 14)
function digio.readbit(N) end


--- **This function reads the digital I/O port. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the value of the input lines on the I/O port. The least significant bit (bit B1) of the binary number corresponds to line 1; bit B14 corresponds to line 14.For example, a returned value of 170 has a binary equivalent of 000000010101010, which indicates that lines 2, 4, 6, and 8 are high (1), and the other 10 lines are low (0).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14669.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = digio.readport()
--- print(data)
--- 
--- --Assume lines 2, 4, 6, and 8 are set high when the I/O port is read.
--- --Output:
--- --1.70000e+02
--- --This is binary 10101010.
--- ```
---@return number data The present value of the input lines on the digital I/O port
function digio.readport() end


--- **This function sets a digital I/O line high or low. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the output line is write‑protected using the digio.writeprotect attribute, the command is ignored.The reset() function does not affect the present state of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.The data must be zero (0) to clear the bit. Any value other than zero (0) sets the bit.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14680.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writebit(4, 0)
--- 
--- --Sets digital I/O line 4 low (0).
--- ```
---@param N number Digital I/O trigger line (1 to 14)
---@param data number The value to write to the bit
function digio.writebit(N, data) end


--- **This function writes to all digital I/O lines. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern to be written to the I/O port. For example, a data value of 170 has a binary equivalent of 00000010101010. Lines 2, 4, 6, and 8 are set high (1), and the other 10 lines are set low (0).Write‑protected lines are not changed.The reset() function does not affect the present states of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14681.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeport(255)
--- 
--- --Sets digital I/O Lines 1 through 8 high (binary 00000011111111).
--- ```
---@param data number Value to write to the port (0 to 16383)
function digio.writeport(data) end


--- **This attribute contains the write‑protect mask that protects bits from changes from the digio.writebit() and digio.writeport() functions. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Bits that are set to one cause the corresponding line to be write‑protected.The binary equivalent of mask indicates the mask to be set for the I/O port. For example, a mask value of 7 has a binary equivalent of 00000000000111. This mask write‑protects lines 1, 2, and 3.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14682.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeprotect = 15
--- 
--- --Write‑protects lines 1, 2, 3, and 4.
--- ```
digio.writeprotect = 0

---@class display
display = {}




--- **This function clears all lines of the front‑panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function switches to the user screen and then clears the front‑panel display.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14699.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function display.clear() end


--- **This function reads the present position of the cursor on the front‑panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function switches the front‑panel display to the user screen (the text set by display.settext()), and then returns values to indicate the row that contains the cursor and the column position and cursor style.Columns are numbered from left to right on the display.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14700.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testRow, testColumn = display.getcursor()
--- print(testRow, testColumn)
--- 
--- --This example reads the cursor position into local variables and prints them.
--- --Example output:
--- --1.00000e+00     1.00000e+00
--- print(display.getcursor())
--- 
--- --This example prints the cursor position directly. In this example, the cursor is in row 1 at column 3, with an invisible cursor:
--- --1.00000e+00   3.00000e+00   0.00000e+00
--- ```
---@return number row The row where the cursor is
---@return number column The column where the cursor is
---@return number style Visibility of the cursor
function display.getcursor() end


--- **This function reads the text displayed on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Using the command without any parameters returns both lines of the front‑panel display.The $N character code is included in the returned value to show where the top line ends and the bottom line begins. This is not affected by the value of embellished.When embellished is set to true, all other character codes are returned along with the message. When embellished is set to false, only the message and the $N character code is returned. For information on the embedded character codes, see display.settext().The display is not switched to the user screen (the screen set using display.settext()). Text is read from the active screen.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14702.htm"])
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
--- 
--- --This example shows how to retrieve the display text in multiple ways. The output is:
--- -- 
--- --ABCDEFGHIJKLMNOPQRST$Nabcdefghijklmnopqrstuvwxyz123456
--- --$RABCDEFGHIJ$DKLMNOPQRST$N$Rabcdefghijklm$Bnopqrstuvwxyz$F123456
--- --abcdefghijklmnopqrstuvwxyz123456
--- --$Rijklm$Bnopqrstuvwxyz$F123456
--- --ij
--- display.clear()
--- display.settext("User Screen")
--- text = display.gettext()
--- print(text)
--- 
--- --This outputs all text in both lines of the display:
--- --User Screen       $N
--- --This indicates that the message “User Screen” is on the top line. The bottom line is blank.
--- ```
---@return string text The returned value, which contains the text that is presently displayed
---@param embellished boolean Indicates type of returned text
---@param row number Selects the row from which to read the text
---@param columnStart number Selects the first column from which to read text; for row 1, the valid column numbers are 1 to 20; for row 2, the valid column numbers are 1 to 32; if nothing is selected, 1 is used
---@param columnEnd number Selects the last column from which to read text; for row 1, the valid column numbers are 1 to 20; for row 2, the valid column numbers are 1 to 32; the default is 20 for row 1, and 32 for row 2
---@overload fun():string
---@overload fun(embellished:boolean):string
---@overload fun(embellished:boolean,row:number):string
---@overload fun(embellished:boolean,row:number,columnStart:number):string
function display.gettext(embellished, row, columnStart, columnEnd) end


--- **This function displays a formatted input field on the front‑panel display that the operator can edit.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The format parameter uses zeros (0), the decimal point, polarity sign, and exponents to define how the input field is formatted. The format parameter can include the options shown in the following table.The default parameter is the value shown when the value is first displayed.You can use the minimum and maximum parameters to limit the values that can be entered. When + is not selected for format, the minimum limit must be more than or equal to zero (0). When limits are used, you cannot enter values above or below these limits.The input value is limited to ±1e37.Before calling display.inputvalue(), you should send a message prompt to the operator using display.prompt(). Make sure to position the cursor where the edit field should appear.After this command is sent, script execution pauses until you enter a value and press the ENTER key.For positive and negative entry (plus sign (+) used for the value field and the exponent field), polarity of a nonzero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel . Polarity is also toggled when using the navigation wheel  to decrease or increase the value or exponent past zero. A zero (0) value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After executing this command and pressing the EXIT (LOCAL) key, the function returns nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14703.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext("Enter value between$N  -0.10 and 2.00:  ")
--- value = display.inputvalue("+0.00", 0.5, -0.1, 2.0)
--- print("Value entered = ", value)
--- 
--- --Displays an editable field (+0.50) for operator input. The valid input range is −0.10 to +2.00, with a default of 0.50.
--- --Output:
--- --Value entered =    1.35000e+00
--- ```
---@param format string A string that defines how the input field is formatted; see Details for more information
---@param default number The default value for the input value
---@param minimum number The minimum input value
---@param maximum number The maximum input value
---@overload fun(format:string)
---@overload fun(format:string,default:number)
---@overload fun(format:string,default:number,minimum:number)
function display.inputvalue(format, default, minimum, maximum) end

display.UNLOCK = nil
display.LOCK = nil

---@alias displaylocallockoutlockout
---|`display.UNLOCK`
---|`display.LOCK`



--- **This attribute describes whether or not the EXIT (LOCAL) key on the instrument front panel is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set display.locallockout to display.LOCK to prevent the user from interrupting remote operation by pressing the EXIT (LOCAL) key.Set this attribute to display.UNLOCK to allow the EXIT (LOCAL) key to interrupt script or remote operation.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14707.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.locallockout = display.LOCK
--- 
--- --Disables the front‑panel EXIT (LOCAL) key.
--- ```
---@type displaylocallockoutlockout
display.locallockout = 0



--- **This function presents a menu on the front‑panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The menu consists of the menu name string on the top line, and a selectable list of items on the bottom line. The menu items must be a single string with each item separated by whitespace. The name for the top line is limited to 20 characters.After sending this command, script execution pauses for the operator to select a menu item. An item is selected by rotating the navigation wheel  to place the blinking cursor on the item, and then pressing the navigation wheel  (or the ENTER key). When an item is selected, the text of that selection is returned.Pressing the EXIT (LOCAL) key does not abort the script while the menu is displayed, but it does return nil. The script can be aborted by calling the exit function when nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14708.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- selection = display.menu("Menu", "Test1 Test2 Test3")
--- print(selection)
--- 
--- --Displays a menu with three menu items. If the second menu item is selected, selection is given the value Test2.
--- --Output:
--- --Test2
--- ```
---@return string selection Name of the variable that holds the selected menu item
---@param name string Menu name to display on the top line
---@param items string Menu items to display on the bottom line
function display.menu(name, items) end


--- **This function sets the position of the cursor.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Sending this command selects the user screen and then moves the cursor to the given location.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.An out‑of-range parameter for row sets the cursor to row 2. An out‑of‑range parameter for column sets the cursor to column 20 for row 1, or 32 for row 2.An out‑of‑range parameter for style sets it to 0 (invisible).A blinking cursor is only visible when it is positioned over displayed text. It cannot be seen when positioned over a space character.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14711.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.setcursor(1, 8)
--- display.settext("Hello")
--- display.setcursor(2, 14)
--- display.settext("World")
--- 
--- --This example displays a message on the front panel, approximately center. Note that the top line of text is larger than the bottom line of text.
--- --The front panel of the instrument displays Hello on the top line and World on the second line.
--- ```
---@param row number The row number for the cursor (1 or 2)
---@param column number The active column position to set; row 1 has columns 1 to 20, row 2 has columns 1 to 32
---@param style number Set the cursor to invisible (0, default) or blinking (1)
---@overload fun(row:number,column:number)
function display.setcursor(row, column, style) end


--- **This function displays text on the front‑panel user screen.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function selects the user display screen and displays the given text.After the instrument is turned on, the first time you use a display command to write to the display, the message "User Screen" is cleared. After the first write, you need to use display.clear() to clear the message.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.The text starts at the present cursor position. After the text is displayed, the cursor is after the last character in the display message.Top line text does not wrap to the bottom line of the display automatically. Any text that does not fit on the current line is truncated. If the text is truncated, the cursor remains at the end of the line.The text remains on the display until replaced or cleared.The character codes described in the following table can also be included in the text string.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14712.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext("Normal $BBlinking$N")
--- display.settext("$DDim $FBackgroundBlink$R $$$$ 2 dollars")
--- 
--- --This example sets the display to:
--- --Normal Blinking
--- --Dim BackgroundBlink $$ 2 dollars
--- --with the named effect on each word.
--- ```
function display.settext(DisplayText, Text) end


--- **This function reads the annunciators (indicators) that are presently turned on.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a bitmasked value showing which indicators are turned on. The 16‑bit binary equivalent of the returned value is the bitmask. The return value is a sum of set annunciators, based on the weighted value, as shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14719.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testAnnunciators = display.getannunciators()
--- print(testAnnunciators)
---  
--- rem = bit.bitand(testAnnunciators, 1024)
--- if rem > 0 then
---    print("REM is on")
--- else
---    print("REM is off")
--- end
--- 
--- --REM indicator is turned on.
--- --Output:
--- --1.28000e+03
--- --REM is on
--- print(display.ANNUNCIATOR_EDIT)
--- print(display.ANNUNCIATOR_TRIGGER)
--- print(display.ANNUNCIATOR_AUTO)
--- 
--- --Output:
--- --2.56000e+02
--- --3.20000e+01
--- --8.00000e+00
--- ```
---@return number annunciators The bitmasked value that shows which indicators are turned on
function display.getannunciators() end


--- **This function prompts the user to enter a parameter from the front panel of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function creates an editable input field at the present cursor position, and an input prompt message on the bottom line. Example of a displayed input field and prompt:0.00VInput 0 to +2VThe format parameter uses zeros (0), the decimal point, polarity sign, and exponents to define how the input field is formatted.The format parameter can include the options shown in the following table.You can use the minimum and maximum parameters to limit the values that can be entered. When a plus sign (+) is not selected for format, the minimum limit must be greater than or equal to zero (0). When limits are used, the operator cannot enter values above or below these limits.The input value is limited to ±1e37.After sending this command, script execution pauses for the operator to enter a value and press ENTER.For positive and negative entry (plus sign (+) used for the value field and the exponent field), polarity of a nonzero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel . Polarity also toggles when using the navigation wheel  to decrease or increase the value or exponent past zero. A zero value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After executing this command and pressing the EXIT (LOCAL) key, the value returns nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14740.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value = display.prompt("0.00", "V", "Input 0 to +2V", 0.5, 0, 2)
--- print(value)
--- 
--- --The above command prompts the operator to enter a voltage value. The valid input range is 0 to +2.00, with a default of 0.50:
--- --0.50V
--- --Input 0 to +2V
--- --If the operator enters 0.70, the output is:
--- --7.00000e-01
--- ```
---@param format string A string that defines how the input field is formatted; see Details for more information
---@param units string Set the units text string for the top line (eight characters maximum); this indicates the units (for example, "V" or "A") for the value
---@param help string Text string to display on the bottom line (32 characters maximum)
---@param default number The value that is shown when the value is first displayed
---@param minimum number The minimum input value that can be entered
---@param maximum number The maximum input value that can be entered (must be more than minimum)
---@overload fun(format:string,units:string,help:string)
---@overload fun(format:string,units:string,help:string,default:number)
---@overload fun(format:string,units:string,help:string,default:number,minimum:number)
function display.prompt(format, units, help, default, minimum, maximum) end

display.MAIN = nil
display.USER = nil

---@alias displayscreendisplayID
---|`display.MAIN`
---|`display.USER`



--- **This attribute contains the selected display screen.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting this attribute selects the display screen for the front panel. This performs the same action as pressing the DISPLAY key on the front panel. The text for the display screen is set by display.settext().Read this attribute to determine which of the available display screens was last selected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14741.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.screen = display.USER
--- 
--- --Selects the user display.
--- ```
---@type displayscreendisplayID
display.screen = 0



--- **This function retrieves the key code for the last pressed key.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A history of the key code for the last pressed front‑panel key is maintained by the instrument. When the instrument is turned on, or when it is transitioning from local to remote operation, the key code is set to 0 (display.KEY_NONE).Pressing the EXIT (LOCAL) key normally aborts a script. To use this function with the EXIT (LOCAL) key, you must set display.locallockout to display.LOCK.The table below lists the keyCode value for each front‑panel action.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17047.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- key = display.getlastkey()
--- print(key)
--- 
--- --On the front panel, press the MENU key and then send the code shown here. This retrieves the key code for the last pressed key.
--- --Output:
--- --6.80000e+01
--- ```
---@return number keyCode A returned value that represents the last front-panel key pressed; see Details for more information
function display.getlastkey() end


--- **This function sends a code that simulates the action of a front‑panel control.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command simulates pressing a front‑panel key or navigation wheel, or turning the navigation wheel one click to the left or right.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17055.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.sendkey(display.KEY_RUN)
--- 
--- --Simulates pressing the RUN key.
--- ```
---@param keyCode number A parameter that specifies the key press to simulate; see Details for more information
function display.sendkey(keyCode) end


--- **This function captures the key code value for the next front‑panel action.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After you send this function, script execution pauses until a front‑panel action (for example, pressing a key or the navigation wheel , or turning the navigation wheel ). After the action, the value of the key (or action) is returned.If the EXIT (LOCAL) key is pressed while this function is waiting for a front‑panel action, the script is not aborted.A typical use for this function is to prompt the user to press the EXIT (LOCAL) key to abort the script or press any other key to continue. For example, if the keyCode value 67 is returned (the EXIT (LOCAL) key was pressed), the exit() function can be called to abort the script.The table below lists the keyCode value for each front panel action.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/66558.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- key = display.waitkey()
--- print(key)
--- 
--- --Pause script execution until the operator presses a key or the navigation wheel , or rotates the navigation wheel.
--- --If the output is:
--- --8.600000000e+01
--- --It indicates that the STEP key was pressed.
--- ```
---@return number keyCode See Details for more information
function display.waitkey() end
---@class errorqueue
errorqueue = {}




--- **This function clears all entries out of the error queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14749.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function errorqueue.clear() end


--- **This attribute gets the number of entries in the error queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14750.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- count = errorqueue.count
--- print(count)
--- 
--- --Returns the number of entries in the error queue.
--- --The output below indicates that there are four entries in the error queue:
--- --4.00000e+00
--- ```
errorqueue.count = 0



--- **This function reads the oldest entry from the error queue and removes it from the queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Entries are stored in a first-in, first-out (FIFO) queue. This function reads the oldest entry and removes it from the queue.Error codes and messages are listed in the Error summary list.If there are no entries in the queue, code 0, Queue is Empty, is returned.In an expanded system, each TSP‑Link enabled instrument is assigned a node number. The variable errorNode stores the node number where the error originated. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17242.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- errorcode, message = errorqueue.next()
--- print(errorcode, message)
--- 
--- --Reads the oldest entry in the error queue. The output below indicates that the queue is empty.
--- --Output:
--- --0.00000e+00 Queue Is Empty
--- ```
---@return number errorCode The error code number for the entry
---@return string message The message that describes the error code
---@return string severity The severity level (0, 10, 20, 30, or 40); see Details for more information
---@return string errorNode The node number where the error originated
function errorqueue.next() end
---@class eventlog
eventlog = {}




--- **This function returns all entries from the event log as a single string and removes them from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns all events in the event log. Logged items are shown from oldest to newest. The response is a string that has the messages delimited with a new line character.This function also clears the event log.If there are no entries in the event log, this function returns the value nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14756.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.all())
--- 
--- --Get and print all entries from the event log and remove the entries from the log.
--- --Output:
--- --17:26:35.690 10 Oct 2019, LAN0, 192.168.1.102, LXI, 0, 1570728395,   1192037155.733269000, 0, 0x0
--- --17:26:39.009 10 Oct 2019, LAN5, 192.168.1.102, LXI, 0, 1570728399,   1192037159.052777000, 0, 0x0
--- ```
---@return string|nil logString A listing of all event log entries
function eventlog.all() end


--- **This attribute returns the number of unread events in the event log.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14757.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.count)
--- 
--- --Displays the present number of events in the instrument event log.
--- --Output looks similar to:
--- --3.00000e+00
--- ```
eventlog.count = 0



--- **This function clears the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command removes all messages from the event log.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14758.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function eventlog.clear() end

eventlog.DISCARD_NEWEST = nil
eventlog.DISCARD_OLDEST = nil

---@alias eventlogoverwritemethodmethod
---|`eventlog.DISCARD_NEWEST`
---|`eventlog.DISCARD_OLDEST`



--- **This attribute controls how the event log processes events if the event log is full.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to eventlog.DISCARD_NEWEST, new entries are not logged.When this attribute is set to eventlog.DISCARD_OLDEST, the oldest entry is discarded when a new entry is added.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14759.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- eventlog.overwritemethod = 0
--- 
--- --When the log is full, the event log ignores new entries.
--- ```
---@type eventlogoverwritemethodmethod
eventlog.overwritemethod = 0


eventlog.ENABLE = nil
eventlog.DISABLE = nil

---@alias eventlogenablestatus
---|`eventlog.ENABLE`
---|`eventlog.DISABLE`



--- **This attribute enables or disables the event log.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the event log is disabled (eventlog.DISABLE or 0), no new events are added to the event log. You can, however, read and remove existing events.When the event log is enabled, new events are logged.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14760.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.enable)
--- eventlog.enable = eventlog.DISABLE
--- print(eventlog.enable)
--- 
--- --Displays the present status of the Series 3700A event log.
--- --Output:
--- --1.00000e+00
--- --0.00000e+00
--- ```
---@type eventlogenablestatus
eventlog.enable = 0



--- **This function returns the oldest unread event message from the event log and removes it from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the next entry from the event log and removes it from the log.If there are no entries in the event log, returns the value nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14761.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.next())
--- 
--- --Get the oldest message in the event log and remove that entry from the log.
--- --Output:
--- --17:28:22.085 10 Oct 2019, LAN2, 192.168.1.102, LXI, 0, 1570728502, <no time>, 0, 0x0
--- print(eventlog.next())
--- 
--- --If you send this command when there is nothing in the event log, you get the following output:
--- --nil
--- ```
---@return string|nil logString The next log entry
function eventlog.next() end
---@class fileVar
fileVar = {}




--- **This function closes the file that is represented by the fileVar variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is equivalent to io.close(fileVar).Note that files are automatically closed when the file descriptors are garbage collected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14772.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14786.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14787.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14788.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14789.htm"])
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
---@class format
format = {}




--- **This attribute sets the precision (number of digits) for all numbers returned in the ASCII format.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the precision (number of digits) for numeric data printed with the print(), printbuffer(), and printnumber() functions. The format.asciiprecision attribute is only used with the ASCII format. The precision value must be a number from 0 to 16.Note that the precision is the number of significant digits printed. There is always one digit to the left of the decimal point; be sure to include this digit when setting the precision.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14797.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 2.54
--- printnumber(x)
--- format.asciiprecision = 3
--- printnumber(x)
--- 
--- --Output:
--- --2.540000000e+00
--- -- 
--- --2.54e+00
--- ```
format.asciiprecision = 0


format.NORMAL = nil
format.NETWORK = nil
format.BIGENDIANL = nil
format.SWAPPED = nil
format.LITTLEENDIAN = nil

---@alias formatbyteorderorder
---|`format.NORMAL`
---|`format.NETWORK`
---|`format.BIGENDIANL`
---|`format.SWAPPED`
---|`format.LITTLEENDIAN`



--- **This attribute sets the binary byte order for the data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the byte order in which data is written when you are printing data values with the printnumber() and printbuffer() functions. The byte order attribute is only used with the format.SREAL, format.REAL, format.REAL32, and format.REAL64 data formats.format.NORMAL, format.BIGENDIAN, and format.NETWORK select the same byte order. format.SWAPPED and format.LITTLEENDIAN select the same byte order. Selecting which to use is a matter of preference.Select the format.SWAPPED or format.LITTLEENDIAN byte order when sending data to a computer with a Microsoft Windows operating system.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14801.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- x = 1.23
--- format.data = format.REAL32
--- format.byteorder = format.LITTLEENDIAN
--- printnumber(x)
--- format.byteorder = format.BIGENDIAN
--- printnumber(x)
--- 
--- --The output depends on the terminal program you use, but it looks something like:
--- --#0¤p??
--- --#0??p¤
--- ```
---@type formatbyteorderorder
format.byteorder = 0


format.ASCIIS = nil
format.SREAL = nil
format.REAL32D = nil
format.REAL = nil
format.REAL64 = nil
format.DREAL = nil

---@alias formatdatavalue
---|`format.ASCIIS`
---|`format.SREAL`
---|`format.REAL32D`
---|`format.REAL`
---|`format.REAL64`
---|`format.DREAL`



--- **This attribute sets the data format for data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The precision of numeric values can be controlled with the format.asciiprecision attribute. The byte order of format.SREAL, format.REAL, format.REAL32, and format.REAL64 can be selected with the format.byteorder attribute.REAL32 and SREAL select the same single precision format. REAL and REAL64 select the same double‑precision format. They are alternative identifiers. Selecting which to use is a matter of preference.The IEEE Std 754 binary formats use four bytes for single‑precision values and eight bytes for double‑precision values.When data is written with any of the binary formats, the response message starts with #0 and ends with a new line. When data is written with the ASCII format, elements are separated with a comma and space.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14803.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 3.14159265
--- format.data = format.ASCII
--- printnumber(x)
--- format.data = format.REAL64
--- printnumber(x)
--- 
--- --Output a number represented by x in ASCII using a precision of 10, then output the same number in binary using double‑precision format.
--- --Output:
--- --3.141592650e+00
--- --#0ñÔÈSû!   @
--- ```
---@type formatdatavalue
format.data = 0

---@class fs
fs = {}




--- **This function sets the current working directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The new working directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the given path does not exist.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14808.htm"])
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
--- --The return is:
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14810.htm"])
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
--- --The return is:
--- --/usb1
--- ```
---@return string path The absolute path of the current working directory
function fs.cwd() end


--- **This function tests whether or not the specified path refers to a directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file system path may be absolute or relative to the current working system path.An error is logged to the error queue if the given path does not exist.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14811.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14812.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14814.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14815.htm"])
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
--- The file system path may be absolute or relative to the current working system path.An error is logged to the error queue if the given path does not exist.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14824.htm"])
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
---@class gpib
gpib = {}




--- **This attribute contains the GPIB address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The address can be set to any address value from 1 to 30. However, the address must be unique in the system. It cannot conflict with an address that is assigned to another instrument or to the GPIB controller.A new GPIB address takes effect when the command to change it is processed. If there are response messages in the output queue when this command is processed, they must be read at the new address.If command messages are being queued (sent before this command has executed), the new settings may take effect in the middle of a subsequent command message, so use care when setting this attribute from the GPIB interface.You should allow sufficient time for the command to be processed before attempting to communicate with the instrument again.The reset() function does not affect the GPIB address.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14860.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- gpib.address = 26
--- address = gpib.address
--- print(address)
--- 
--- --Sets the GPIB address and reads the address.
--- --Output:
--- --26
--- ```
gpib.address = 0

---@class io
io = {}




--- **This function closes a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If a file is not specified, the default output file closes.Only io.close(), used without specifying a parameter, can be accessed from a remote node.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14868.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testFile, testError = io.open("testfile.txt", "w")
--- if nil == testError then
---    testFile:write("This is my test file")
---    io.close(testFile)
--- end
--- 
--- --Opens file testfile.txt for writing. If no errors were found while opening, writes "This is my test file" and closes the file.
--- ```
---@param file string The descriptor of the file to close
---@overload fun()
function io.close(file) end


--- **This function saves buffered data to a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must use the io.flush() or io.close() functions to write data to the file system.This function only flushes the default output file.Using this command removes the need to close a file after writing to it and allows it to be left open to write more data. Data may be lost if the file is not closed or flushed before an application ends. To prevent the loss of data if there is going to be a time delay before more data is written (and when you want to keep the file open and not close it), flush the file after writing to it.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14870.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function io.flush() end


--- **This function opens a file for later reference.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path to the file to open may be absolute or relative to the current working directory. If you successfully open the file, errorMsg is nil and fileVar has the descriptor used to access the file.If an error is encountered, the command returns nil for fileVar and an error string.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14872.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testFile, testError = io.open("testfile.txt", "w")
--- if testError == nil then
---    testFile:write("This is my test file")
---    io.close(testFile)
--- end
--- 
--- --Opens file testfile.txt for writing. If no errors were found while opening, writes "This is my test file" and closes the file.
--- ```
---@return io_object fileVar The descriptor of the opened file
---@return string|nil errorMsg Indicates whether an error was encountered while processing the function
---@param path string The path of the file to open
---@param mode string A string representing the intended access mode ("r" = read, "w" = write, and "a" = append)
---@overload fun(path:string):string|nil
function io.open(path, mode) end


--- **This function assigns a previously opened file or opens a new file as the default output file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path of the file to open may be absolute or relative to the current working directory.When accessed from a remote node using the TSP-Link network, this command does not accept a file descriptor parameter and does not return a value.If the function fails, an error message is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14873.htm"])
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
--- 
--- --Assign the file to be the default output file.
--- ```
---@return io_object fileVar The descriptor of the output file or an error message (if the function fails)
---@param newfile string A file descriptor to assign (or the path of a file to open) as the default output file
---@overload fun():io_object
function io.output(newfile) end


--- **This function reads data from the default input file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The format parameters may be any of the following:Any number of format parameters may be passed to this command, each corresponding to a returned data value.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14874.htm"])
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
--- -- io.read
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
--- --Read data from the default input file.
--- ```
---@return any data1 The data read from the file
---@return any data2 The data read from the file
---@param format1 string A string or number indicating the type of data to be read
---@param format2 string A string or number indicating the type of data to be read
---@overload fun():any
---@overload fun(format1:string):any
---@overload fun(format1:string,...:any):any
function io.read(format1, format2) end


--- **This function checks whether or not a given object is a file handle.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the string "file" if the object is an open file handle. If it is not an open file handle, nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14875.htm"])
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
--- 
--- --Check whether or not fileName is a file handle.
--- ```
---@return string type Indicates whether the object is an open file handle
---@param obj file_object Object to check
function io.type(obj) end


--- **This function writes data to the default output file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- All data parameters must be either strings or numbers.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14877.htm"])
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
--- 
--- --Writes data to the default output file.
--- ```
---@param data1 string|number The data to be written
---@param data2 string|number The data to be written
---@overload fun()
---@overload fun(data1:string|number)
---@overload fun(data1:string|number,...:any)
function io.write(data1, data2) end


--- **This function assigns a previously opened file, or opens a new file, as the default input file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The newfile path may be absolute or relative to the current working directory.When using this function from a remote TSP-Link® node, this command does not accept a file descriptor and does not return a value.If the function fails, an error message is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/66560.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@return io_object fileVar The descriptor of the input file or an error message (if the function fails)
---@param newfile string A string representing the path of a file to open as the default input file, or the file descriptor of an open file to use as the default input file
---@overload fun():io_object
function io.input(newfile) end
---@class lan
lan = {}




--- **This function re-initializes the LAN interface with new settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Disconnects all existing LAN connections to the instrument and re-initializes the LAN with the present configuration settings.This function initiates a background operation. LAN configuration could be a lengthy operation. Although the function returns immediately, the LAN initialization continues to run in the background.Even though the LAN configuration settings may not have changed since the LAN was last connected, new settings may take effect due to the dynamic nature of dynamic host configuration protocol (DHCP) or dynamic link local addressing (DLLA) configuration.Re-initialization takes effect even if the configuration has not changed since the last time the instrument connected to the LAN.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14890.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.applysettings()
--- 
--- --Re-initialize the LAN interface with new settings.
--- ```
function lan.applysettings() end


--- **This attribute contains the LXI domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the LXI domain number.All outgoing LXI packets are generated with this domain number. All inbound LXI packets are ignored unless they have this domain number.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14893.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.lxidomain)
--- 
--- --Displays the LXI domain.
--- ```
lan.lxidomain = 0


lan.ENABLE = nil
lan.DISABLE = nil

---@alias lannaglestate
---|`lan.ENABLE`
---|`lan.DISABLE`



--- **This attribute controls the state of the LAN Nagle algorithm.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables the use of the LAN Nagle algorithm on transmission control protocol (TCP) connections.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14894.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@type lannaglestate
lan.nagle = 0



--- **This function resets the LAN interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the LAN interface. It performs the commands lan.restoredefaults() and lan.applysettings(). It also resets the LAN password.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14895.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function lan.reset() end


--- **This function resets LAN settings to default values.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The settings that are restored are shown in the following table.The lan.restoredefaults() function does not reset the LAN password. The localnode.password attribute controls the web password, which can be reset separately.This command is run when lan.reset() is sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14896.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.restoredefaults()
--- 
--- --Restores the LAN defaults.
--- ```
function lan.restoredefaults() end
---@class localnode
localnode = {}




--- **This attribute stores a user-defined description and mDNS service name of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores a string that contains a description of the instrument. This value appears on LXI welcome page of the instrument. The value of this attribute is also used as the mDNS service name of the instrument.The default value of this attribute contains Keithley ModelNumber #SSSSSSSS, where: ModelNumber  is the model number of the instrument and #SSSSSSSS is the eight-digit serial number of the instrument. You can change it to a value that makes sense for your system. Setting this attribute to an empty string (in other words, setting this attribute to a string of length zero or a string consisting entirely of whitespace characters) reverts the description to the factory default value.When using this command from a remote node, replace localnode with the node reference, for example node[5].description.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15008.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- description = "System in Lab 05"
--- localnode.description = description
--- 
--- --Set description to System in Lab 05.
--- ```
localnode.description = 0



--- **This attribute stores the model number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
--- 
--- --Outputs the model number of the local node. For example:
--- --<CT2470_only_start_***Set CT2470 variable****>2470 <CT2470_only_end_***Set CT2470 variable****>3700A 
--- ```
localnode.model = 0



--- **This attribute stores the remote access password.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This write-only attribute stores the password that is set for any remote interface. When password usage is enabled (localnode.passwordmode), you must supply a password to change the configuration or to control an instrument from a remote command interface.The instrument continues to use the old password for all interactions until the command to change it executes. When changing the password, give the instrument time to execute the command before attempting to use the new password.You can retrieve the password from the front panel through MENU > LAN > STATUS > PASSWORD.You can reset the password by resetting the LAN from the front panel or by sending the lan.reset() command.When using this command from a remote node, localnode should be replaced with the node reference, for example, node[5].password.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15014.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.password = "N3wpa55w0rd"
--- 
--- --Changes the remote interface password to N3wpa55w0rd.
--- ```
localnode.password = 0



--- **This attribute stores the password enable mode for remote access to the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls if and where remote access passwords are required. Set this attribute to one of the values below to enable password checking:When using this command from a remote node, replace localnode with the node reference, for example node[5].passwordmode.If you enable password mode, you must also assign a password.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15015.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- mode = localnode.PASSWORD_WEB
--- localnode.passwordmode = mode
--- localnode.password = "SMU1234"
--- 
--- --Sets value of mode to PASSWORD_WEB.
--- --Allows use of passwords on the web interface only.
--- --Set the password to SMU1234.
--- ```
localnode.passwordmode = 0



--- **This attribute determines if the instrument generates prompts in response to command messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the prompting mode is enabled, the instrument generates prompts when the instrument is ready to take another command. Because the prompt is not generated until the previous command completes, enabling prompts provides handshaking with the instrument to prevent buffer overruns.When prompting is enabled, the instrument might generate the following prompts:Commands do not generate prompts. The instrument generates prompts in response to command completion.Prompts are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable prompts when the LAN connection is active, they are not enabled for a subsequent USB connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15016.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts = 1
--- 
--- --Enable prompting.
--- ```
localnode.prompts = 0



--- **This attribute enables and disables the generation of prompts for IEEE Std 488.2 common commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is enabled, the IEEE Std 488.2 common commands generate prompts if prompting is enabled with the localnode.prompts attribute. If localnode.prompts4882 is enabled, limit the number of *trg commands sent to a running script to 50 regardless of the setting of the localnode.prompts attribute.When this attribute is disabled, IEEE Std 488.2 common commands do not generate prompts. When using the *trg command with a script that executes trigger.wait() repeatedly, disable prompting to avoid problems associated with the command interface input queue filling.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15017.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts4882 = 0
--- 
--- --Disables IEEE Std 488.2 common command prompting.
--- ```
localnode.prompts4882 = 0



--- **This attribute stores the firmware revision level.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the revision number of the firmware that is presently running in the instrument.When using this command from a remote node, replace localnode with the node reference. For example, node[5].revision.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15018.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.revision)
--- 
--- --Outputs the present revision level.
--- --Sample output:
--- --01.50b
--- ```
localnode.revision = 0



--- **This attribute stores the serial number of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This indicates the instrument serial number.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15019.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext(localnode.serialno)
--- 
--- --Clears the instrument display.
--- --Places the serial number of the instrument on the top line of its display.
--- ```
localnode.serialno = 0



--- **This attribute sets whether or not the instrument automatically sends generated errors.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If this attribute is set to 1, the instrument automatically sends any generated errors stored in the error queue, and then clears the queue. Errors are processed after executing a command message (just before issuing a prompt if prompts are enabled).If this attribute is set to 0, errors are left in the error queue and must be explicitly read or cleared.When using this command from a remote node, replace localnode with the node reference, for example, node[5].showerrors.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15022.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.showerrors = 1
--- 
--- --Enables sending of generated errors.
--- ```
localnode.showerrors = 0



--- **This function resets the local node instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you want to reset a specific instrument or a subordinate node, use the node[X].reset() command.A local node reset includes a channel.reset("allslots"), dmm.reset("all") and a scan.reset(). In addition:A localnode.reset() is different than a reset() because reset() resets the entire system. When using this command from a remote node, localnode should be replaced with the node reference, for example node[5].reset().
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16978.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.reset()
--- 
--- --Resets the local node.
--- ```
function localnode.reset() end

localnode.OFF = nil
localnode.EMULATION_3706 = nil

---@alias localnodeemulationvalue
---|`localnode.OFF`
---|`localnode.EMULATION_3706`



--- **This attribute sets the instrument to report the model number as 3706 instead of 3706A.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command needs to be set if you replace a Model 3706 with a Model 3706A in a system where computer drivers may be querying the model. This can occur if you replace a Model 3706 with a Model 3706A in an existing system, or if you duplicate a system but use a Model 3706A instead of a Model 3706.When this command is set to localnode.EMULATION_3706, the model number is reported as a 3706 when you send a request with a command such as localnode.model or *idn?. This allows drivers that query the model number to continue to operate normally.This setting is preserved through a power cycle and instrument reset.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20571.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.emulation = localnode.EMULATION_3706
--- 
--- --Sets the Model 3706A for Model 3706 emulation.
--- ```
---@type localnodeemulationvalue
localnode.emulation = 0



--- **This attribute contains the power line frequency setting used for NPLC calculations.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- When using this command from a remote node, localnode should be replaced with the node reference, for example node[5].linefreq.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20578.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- frequency = localnode.linefreq
--- 
--- --Reads line frequency setting.
--- ```
localnode.linefreq = 0



--- **This attribute returns the product license agreements.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/92667.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.license)
--- 
--- --Returns the license agreements for the Series 3700A.
--- ```
localnode.license = 0

---@class nodeArr
nodeArr = {}

---@type nodeArr[]
node = {}




--- **This function starts test scripts on a remote TSP‑Link node. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is only applicable to TSP‑Link systems. You can use this command to use the remote master node to run a script on the specified node. This function does not run test scripts on the master node; only on the subordinate node when initiated by the master node.This function may only be called when the group number of the node is different than the node of the master.This function does not wait for the script to finish execution.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15009.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[2].execute(sourcecode)
--- 
--- --Runs script code on node 2. The code is in a string variable called sourcecode.
--- node[3].execute("x = 5")
--- 
--- --Runs script code in string constant (x = 5) to set x equal to 5 on node 3.
--- node[32].execute(TestDut.source)
--- 
--- --Runs the test script stored in the variable TestDut (previously stored on the master node) on node 32.
--- ```
---@param scriptCode string A string containing the source code
function nodeArr.execute(scriptCode) end



--- **This function returns the value of a global variable. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the value of a global variable from the runtime environment of this node.Do not use this command to retrieve the value of a global variable from the local node. Instead, access the global variable directly. This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15010.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15020.htm"])
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

---@class memory
memory = {}




--- **This function reads and returns the amount of memory that is available in the instrument overall for storing user scripts and channel patterns and for user-defined DMM configurations.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to view the available memory in the overall instrument as well as the memory available for storing user scripts, channel patterns, and user DMM configurations.The response to this function is a single string that returns the overall instrument memory available, script memory available, channel pattern memory available, and DMM configuration memory available as comma-delimited percentages.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15045.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- memoryAvailable = memory.available()
--- print(memoryAvailable)
--- 
--- --Reads and returns the amount of memory available in the instrument.
--- --Output:
--- --51.56, 92.84, 100.00, 100.00
--- --You can also use:
--- --print(memory.available())
--- setup.recall(1)
--- print(memory.available())
--- 
--- --Reads and returns the amount of memory available in the instrument after a setup is recalled.
--- --Output:
--- --11.13, 92.84, 0.16, 97.03
--- print("Memory used:", memory.used())
--- print("Memory available: ", memory.available()) 
--- 
--- --Reads and returns the amount memory used and memory available percentages.
--- --Output:
--- --Memory used: 69.14, 0.16, 12.74,  1.04
--- --Memory available: 30.86, 99.84, 87.26, 98.96
--- ```
---@return string memoryAvailable Comma-delimited string with percentages for available memory; the format is systemMemory, scriptMemory, patternMemory, configurationMemory, where
function memory.available() end


--- **This function reports the amount of memory used in the instrument overall and for user scripts, storing channel patterns, and storing user DMM configurations.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to view the used memory in the overall instrument, as well as the memory used for storing user scripts, channel patterns, and user DMM configurations.The response to this function is a single string that shows the overall instrument memory used, as well as the script memory used, channel pattern memory used, and DMM configuration memory used as comma-delimited percentages.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15046.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MemUsed = memory.used()
--- print(MemUsed)
--- 
--- --Reads the memory used in the instrument and returns the percentages.
--- --Output:
--- --69.14, 0.16, 12.74, 1.04
--- ```
---@return string memoryUsed A comma-delimited string with percentages for used memory; the format is systemMemory, scriptMemory, patternMemory, configurationMemory, where
function memory.used() end
---@class script
script = {}




--- **This function creates a script from a specified file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file path may be absolute or relative to the current working directory. The root folder of the USB flash drive has the absolute path "/usb1/". Both the forward slash (/) and backslash (\) are supported as directory separators.The file to be loaded must start with the loadscript or loadandrunscript keywords, contain the body of the script, and end with the endscript keyword.Script naming:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15063.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- myTest8 =    script.load("/usb1/filename.tsp", "myTest8")
--- 
--- --Loads the script myTest8 from the USB flash drive.
--- ```
---@return script_object scriptVar The created script; this is nil if an error is encountered
---@param file string The path and file name of the script file to load
---@param name string The name of the script to be created
---@overload fun(file:string):script_object
function script.load(file, name) end


--- **This function creates a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The name parameter is the name that is added to the script.user.scripts table. If name is not provided, an empty string is used, and the script is unnamed. If the name already exists in script.user.scripts, the name attribute of the existing script is set to an empty string before it is replaced by the new script.Note that name is the value that is used for the instrument front‑panel display. If this value is not defined, the script is not available from the front panel.You must save the new script into nonvolatile memory to keep it when the instrument is turned off.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15064.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- myTest8 = script.new(
---    "display.clear() display.settext('Hello from myTest8')", "myTest8")
--- myTest8()
--- 
--- --Creates a new script referenced by the variable myTest8 with the name myTest8.
--- --Runs the script. The instrument displays Hello from myTest8.
--- autoexec = script.new(
---    "display.clear() display.settext('Hello from autoexec')", 'autoexec')
--- 
--- --Creates a new autoexec script that clears the display when the instrument is turned on and displays Hello from autoexec.
--- ```
---@return script_object scriptVar The name of the variable that references the script
---@param code string A string containing the body of the script
---@param name string The name of the script
---@overload fun(code:string):script_object
function script.new(code, name) end


--- **This function restores a script that was removed from the runtime environment.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command copies the script from nonvolatile memory into the runtime environment. It also creates a global variable with the same name as the name of the script.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16851.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- script.restore("test9")
--- 
--- --Restores a script named test9 from nonvolatile memory.
--- ```
---@param name string The name of the script to be restored
function script.restore(name) end


--- **This function deletes a script from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16853.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- script.delete("test8")
--- 
--- --Deletes a user script named test8 from nonvolatile memory.
--- ```
---@param scriptName string The string that represents the name of the script
function script.delete(scriptName) end


--- **This is a reference to the anonymous script.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You can use the script.anonymous script like any other script. Also, you can save the anonymous script as a user script by giving it a name.This script is replaced by loading a script with the loadscript or loadandrunscript commands when they are used without a name. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17040.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- script.anonymous.list()
--- 
--- --Displays the content of the anonymous script.
--- print(script.anonymous.source)
--- 
--- --Retrieves the source of the anonymous script.
--- ```
script.anonymous = 0



--- **This function creates a script and enables autorun.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The name parameter is the name that is added to the script.user.scripts table. If name is not provided, an empty string is used, and the script is unnamed. If the name already exists in script.user.scripts, the name attribute of the existing script is set to an empty string before it is replaced by the new script.Note that name is the value that is used for the instrument front‑panel display. If this value is not defined, the script is not available from the front panel.You must save the new script into nonvolatile memory to keep it when the instrument is turned off.The script is run automatically immediately after it is created.This command is the same as the script.new() function except that the script is automatically run.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/18832.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- NewAuto = script.newautorun("print('Hello from new auto run command')", 'NewAuto')
--- print(NewAuto.autorun)
--- print(NewAuto.name)
--- 
--- --Creates a new script called NewAuto that automatically has the autorun attribute set to yes after it is created. The name is set to NewAuto.
--- --Output:
--- --Hello from new auto run command
--- --yes
--- --NewAuto
--- ```
---@return script_object scriptVar The name of the variable that references the script
---@param code string A string that contains the body of the script
---@param name string The name of the script
---@overload fun(code:string):script_object
function script.newautorun(code, name) end


--- **This function runs the anonymous script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Each time the script.run() command is given, the anonymous script is executed. This script can be run using this command many times without having to re-send it. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/18833.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- run()
--- 
--- --Runs the anonymous script.
--- ```
function script.run() end
---@class setup
setup = {}




--- **This attribute specifies which saved setup to recall when the instrument is turned on.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When id = 0, the instrument uses the factory default setup when it is turned on. When id is set to 1, it uses the setup saved with setup.save().Only setups stored in nonvolatile memory are available.To save a script that is used when the instrument is powered on, you can create a configuration script and name it autoexec.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15081.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setup.poweron = 0
--- 
--- --Set the instrument to use the factory default setup when power is turned on.
--- ```
setup.poweron = 0



--- **This function saves the present setup as a user-saved setup.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The id parameter can use a path that is absolute or relative to the current working directory.iIf you do not specify the id parameter, the setup is saved to the nonvolatile memory of the instrument. If a previous setup exists, it is overwritten.You can also create configuration scripts to save setups. See Save the present configuration.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15083.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setup.save()
--- 
--- --Saves the present setup to the internal memory of the instrument. If there is an existing setup, it is overwritten.
--- ```
---@param id number|string A string that specifies the path and file name to which to save the user setup on a USB flash drive ("/path/filename")
---@overload fun()
function setup.save(id) end


--- **This function returns the card model numbers that are defined for each slot in a saved setup.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a comma-delimited string that lists the card model for each slot in the instrument (from 1 to 6) for the specified saved setup. If no card was installed in the slot when the setup was saved, a 0 is returned as the card model number.Use CardModels = setup.cards() to return cards associated with the internally saved setup.Use CardModels = setup.cards("/path/filename.set") to return cards associated with the setup saved on the USB flash drive.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16315.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardModels = setup.cards()
--- print(CardModels)
--- 
--- --Query the cards associated with the internal saved setup.
--- --Output, assuming a 3722 card in slot 1:
--- --3722,0,0,0,0,0
--- print(setup.card("/usb1/mysetup.set"))
--- 
--- --Query the cards associated with setup saved as JulySetup.set on the thumb drive.
--- --The following example of output shows that slots 1, 5, and 6 are empty, slot 2 has a 3723 installed, slot 3 has a 3722 installed and slot 4 has a 3720 installed:
--- --0,3723,3722,3720,0,0
--- ```
---@return any CardModels A comma-delimited string listing the card model numbers for each slot
---@overload fun():any
function setup.cards(pathfilename) end


--- **This function recalls settings from a saved setup.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the id parameter is 1, the internal setup that was saved with setup.save() is recalled. If the id parameter is 0, the instrument recalls the factory default setup.When the id parameter is a string, it is interpreted as the path and file name of the setup to restore from a file on a USB flash drive. The path may be absolute or relative to the current working directory.Before a setup is recalled, an instrument reset is performed.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/66566.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setup.recall(1)
--- 
--- --Recall the user-saved setup.
--- setup.recall("/usb1/KEITHLEY_30730.set")
--- 
--- --Recall a user-saved setup stored in a file named KEITHLEY_30730 on a USB flash drive.
--- ```
---@param id number|string An integer or string that specifies the location of the setup to recall
function setup.recall(id) end
---@class timer
timer = {}




--- **This function resets the timer to zero (0) seconds.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15282.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- timer.reset()
--- -- (intervening code)
--- time = timer.measure.t()
--- print(time)
--- 
--- --Resets the timer and then measures the time since the reset.
--- --Output:
--- --1.469077e+01
--- --The above output indicates that timer.measure.t() was executed 14.69077 seconds after timer.reset().
--- ```
function timer.reset() end
---@class tsplink
tsplink = {}




--- **This attribute contains the group number of a TSP‑Link node. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To remove the node from all groups, set the attribute value to 0.When the node is turned off, the group number for that node changes to 0.The master node can be assigned to any group. You can also include other nodes in the group that includes the master. Note that any nodes that are set to 0 are automatically included in the group that contains the master node, regardless of the group that is assigned to the master node.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15285.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.group = 3
--- 
--- --Assign the instrument to TSP-Link group number 3.
--- ```
tsplink.group = 0



--- **This attribute reads the node number assigned to the master node. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- After doing a TSP-Link reset (tsplink.reset()), use this attribute to access the node number of the master in a set of instruments connected over TSP-Link.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15286.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- LinkMaster = tsplink.master
--- 
--- --Store the TSP-Link master node number in a variable called LinkMaster.
--- ```
tsplink.master = 0



--- **This attribute defines the node number. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the TSP‑Link node number and saves the value in nonvolatile memory.Changes to the node number do not take effect until tsplink.reset() from an earlier TSP‑Link instrument is executed on any node in the system.Each node connected to the TSP-Link system must be assigned a different node number.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15287.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.node = 3
--- 
--- --Sets the TSP‑Link node for this instrument to number 3.
--- ```
tsplink.node = 0



--- **This function reads the state of a TSP-Link synchronization line. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns a value of zero (0) if the line is low and 1 if the line is high.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15288.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = tsplink.readbit(3)
--- print(data)
--- 
--- --Assume line 3 is set high, and it is then read.
--- --Output:
--- --1.000000e+00
--- ```
---@return number data The state of the synchronization line
---@param N any The trigger line (1 to 3)
function tsplink.readbit(N) end


--- **This function reads the TSP-Link trigger lines as a digital I/O port. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the input pattern on the I/O port. The least significant bit of the binary number corresponds to line 1 and the value of bit 3 corresponds to line 3. For example, a returned value of 2 has a binary equivalent of 010. This indicates that line 2 is high (1), and that the other two lines are low (0).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15289.htm"])
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


--- **This function initializes (resets) all nodes (instruments) in the TSP‑Link system. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function erases all information regarding other nodes connected on the TSP-Link system and regenerates the system configuration. This function must be called at least once before any remote nodes can be accessed. If the node number for any instrument is changed, the TSP-Link must be reset again.If expectedNodes is not given, this function generates an error if no other nodes are found on the TSP‑Link network.If nodesFound is less than expectedNodes, an error is generated. Note that the node on which the command is running is counted as a node. For example, giving an expected node count of 1 does not generate any errors, even if there are no other nodes on the TSP-Link network.Also returns the number of nodes found.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15290.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- nodesFound = tsplink.reset(2)
--- print("Nodes found = " .. nodesFound)
--- 
--- --Perform a TSP-Link reset and indicate how many nodes are found.
--- --Sample output if two nodes are found:Nodes found = 2
--- --Sample output if fewer nodes are found and if localnode.showerrors = 1:1219, TSP-Link found fewer nodes than expectedNodes found = 1
--- ```
---@return number nodesFound The number of nodes actually found on the system
---@param expectedNodes number The number of nodes expected on the system (1 to 64)
---@overload fun():number
function tsplink.reset(expectedNodes) end


--- **This attribute describes the TSP‑Link online state. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- When the instrument power is first turned on, the state is offline. After tsplink.reset() is successful, the state is online.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15291.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state = tsplink.state
--- print(state)
--- 
--- --Read the state of the TSP‑Link system. If it is online, the output is:
--- --online
--- ```
tsplink.state = 0



--- **This function sets a TSP-Link trigger line high or low. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use tsplink.writebit() and tsplink.writeport() to control the output state of the trigger line when trigger operation is set to tsplink.TRIG_BYPASS.If the output line is write‑protected by the tsplink.writeprotect attribute, this command is ignored.The reset function does not affect the present states of the TSP-Link trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15301.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writebit(3, 0)
--- 
--- --Sets trigger line 3 low (0).
--- ```
---@param N number The trigger line (1 to 3)
---@param data number The value to write to the bit
function tsplink.writebit(N, data) end


--- **This function writes to all TSP‑Link synchronization lines. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern that is written to the I/O port. For example, a data value of 2 has a binary equivalent of 010. Line 2 is set high (1), and the other two lines are set low (0).Write‑protected lines are not changed.Use the tsplink.writebit() and tsplink.writeport() commands to control the output state of the synchronization line when trigger operation is set to tsplink.TRIG_BYPASS.The reset() function does not affect the present states of the trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15302.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
--- 
--- --Sets the synchronization lines 1 and 2 high (binary 011).
--- ```
---@param data number Value to write to the port (0 to 7)
function tsplink.writeport(data) end


--- **This attribute contains the write‑protect mask that protects bits from changes by the tsplink.writebit() and tsplink.writeport() functions. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The binary equivalent of mask indicates the mask to be set for the TSP-Link trigger line. For example, a mask value of 5 has a binary equivalent of 101. This mask write‑protects TSP-Link trigger lines 1 and 3.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17630.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeprotect = 5
--- 
--- --Write‑protects TSP-Link trigger lines 1 and 3.
--- ```
tsplink.writeprotect = 0

---@class trigger
trigger = {}




--- **This function clears the command interface trigger event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector indicates if a trigger event has been detected since the last trigger.wait() call. trigger.clear() clears the trigger event detector and discards the history of command interface trigger events.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15791.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function trigger.clear() end


--- **This constant contains the command interface trigger event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You can set the stimulus of any trigger object to the value of this constant to have the trigger object respond to command interface trigger events.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15792.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.stimulus = trigger.EVENT_ID
--- 
--- --Sets the trigger stimulus of the channel event detector to command an interface trigger event.
--- ```
---@type eventID
trigger.EVENT_ID= nil


--- **This function waits for a command interface trigger event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to timeout seconds for a trigger on the active command interface. A command interface trigger occurs when:If one or more of these trigger events were previously detected, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15801.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 seconds for a trigger.
--- --If false is returned, no trigger was detected during the 10‑second timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered true
---@param timeout number Maximum amount of time in seconds to wait for the trigger
function trigger.wait(timeout) end
---@class status
status = {}




--- **This attribute stores the status byte condition register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the status byte, which is returned as a numeric value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred. When an enabled status event occurs, a summary bit is set in this register to indicate the event occurrence.The individual bits of this register have the meanings described in the following table.In addition to the above constants, when more than one bit of the register is set, statusByte equals the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15822.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- statusByte = status.condition
--- print(statusByte)
--- 
--- --Returns statusByte.
--- --Sample output:
--- --1.29000e+02
--- --Converting this output (129) to its binary equivalent yields 1000 0001 
--- --Therefore, this output indicates that the set bits of the status byte condition register are presently B0 (MSS) and B7 (OSB).
--- ```
status.condition = 0



--- **This attribute stores the system node enable register. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to read or write to the system node enable register. Reading the system node enable register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitAssigning a value to this attribute enables one or more status events. When an enabled status event occurs, a summary bit is set in the appropriate system summary register. The register and bit that is set depends on the TSP-Link node number assigned to this instrument.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set the B0 bit of the system node enable register, set status.node_enable = status.MSB.In addition to the above values, nodeEnableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set nodeEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set nodeEnableRegister to 129 (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15830.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- nodeEnableRegister = status.MSB + status.OSB
--- status.node_enable = nodeEnableRegister
--- 
--- --Use constants to set the MSB and OSB bits of the system node enable register.
--- -- decimal 129 = binary 10000001
--- nodeEnableRegister = 129
--- status.node_enable = nodeEnableRegister
--- 
--- --Sets the MSB and OSB bits of the system node enable register using a decimal value.
--- ```
status.node_enable = 0



--- **This attribute stores the status node event register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the status node event register, which is returned as a numeric value (reading this register returns a value). The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred.In addition to the above constants, nodeEventRegister can be set to the decimal equivalent of the bits set. When more than one bit of the register is set, nodeEventRegister contains the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15831.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- nodeEventRegister = status.node_event
--- print(nodeEventRegister)
--- 
--- --Reads the status node event register.
--- --Sample output:
--- --1.29000e+02
--- --Converting this output (129) to its binary equivalent yields 1000 0001. Therefore, this output indicates that the set bits of the status byte condition register are presently B0 (MSB) and B7 (OSB).
--- ```
status.node_event = 0



--- **This function resets all bits in the status model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all status data structure registers (enable, event, NTR, and PTR) to their default values. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15861.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.reset()
--- 
--- --Resets the instrument status model.
--- ```
function status.reset() end


--- **This attribute stores the service request (SRQ) enable register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to read or write to the service request enable register. Reading the service request enable register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the service request enable register, set status.request_enable = status.MSB.In addition to the above values, requestSRQEnableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set requestSRQEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set requestSRQEnableRegister to 129 (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17593.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- requestSRQEnableRegister = status.MSB + status.OSB
--- status.request_enable = requestSRQEnableRegister
--- 
--- --Uses constants to set the MSB and OSB bits of the service request (SRQ) enable register.
--- -- decimal 129 = binary 10000001
--- requestSRQEnableRegister = 129
--- status.request_enable = requestSRQEnableRegister
--- 
--- --Uses a decimal value to set the MSB and OSB bits of the service request (SRQ) enable register.
--- ```
status.request_enable = 0



--- **This attribute stores the service request (SRQ) event register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the service request event register, which is returned as a numeric value. Reading this register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, requestEventRegister can be set to the decimal equivalent of the bits set. When more than one bit of the register is set, requestEventRegister contains the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17594.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- requestEventRegister = status.request_event
--- print(requestEventRegister)
--- 
--- --Reads the status request event register.
--- --Sample output:
--- --1.29000e+02
--- --Converting this output (129) to its binary equivalent yields 1000 0001.
--- --Therefore, this output indicates that the set bits of the status request event register are presently B0 (MSB) and B7 (OSB).
--- ```
status.request_event = 0

---@class dmm
dmm = {}




--- **This attribute determines the aperture setting for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The dmm.aperture attribute is available for the following functions.The aperture setting is not available for the functions "continuity" and "nofunction". If you query the aperture when either of these functions is selected, nil is returned. If you write the command when either of these functions is selected, an error is generated.The aperture value is saved with the dmm.func function setting, so if you use another function, then return to the previous setting, such as "dcvolts" or "frequency", the aperture value you set previously is retained.The setting for aperture may be automatically adjusted based on what the DMM supports. Therefore, after setting the aperture, query the value to see if it was adjusted.If the detector bandwidth (dmm.detectorbandwidth) setting is 30 or less for "acvolts" or "accurrent", an error message is generated if you try to set the aperture for these functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15969.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.aperture = 16.67e-3
--- 
--- --Set the aperture to 16.67 milliseconds for DC volts.
--- ```
dmm.aperture = 0


buffer.SAVE_RELATIVE_TIME = nil
buffer.SAVE_FORMAT_TIME = nil
buffer.SAVE_RAW_TIME = nil
buffer.SAVE_TIMESTAMP_TIME = nil

---@alias dmmappendbuffertimeFormat
---|`buffer.SAVE_RELATIVE_TIME`
---|`buffer.SAVE_FORMAT_TIME`
---|`buffer.SAVE_RAW_TIME`
---|`buffer.SAVE_TIMESTAMP_TIME`



--- **This function appends data from the reading buffer to a file on the USB flash drive. If no file exists, this function creates a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For options that save more than one item of time information, each item is comma delimited. For example, the default format is <date>, <time>, and <fractional seconds> for each reading, separated by commas.The file extension .csv is appended to the filename if necessary. Any file extension other than .csv generates errors.Because dmm.appendbuffer() appends data, it does not include header information. The dmm.savebuffer() function does included header information.The index column entry starts at 1 for each append operation, which is also what the dmm.savebuffer() command does.Errors are generated:Examples of valid destination file names:Invalid destination filename examples:— The period is not followed by the .csv extension.— The only allowed extension is .csv. If .csv is not assigned, it is automatically added.— Two periods in the file name (myData_txt.csv would be correct).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15970.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.appendbuffer("bufferVar", "/usb1/myData.csv")
--- 
--- --Appends readings from a valid DMM buffer named bufferVar with default time information to a file named myData.csv on the USB flash drive.
--- ```
---@param bufferVar string A string with the name of a DMM reading buffer from which you want to append data to the specified file
---@param fileName string A string with the file name of the file on the USB flash drive to which reading buffer data will be appended
---@param timeFormat dmmappendbuffertimeFormat How the date and time information should be saved. The values for timeFormat are
---@overload fun(bufferVar:string,fileName:string)
function dmm.appendbuffer(bufferVar, fileName, timeFormat) end


--- **This attribute enables or disables the automatic delay that occurs before each measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The autodelay setting applies to the function selected by dmm.func. It is available for all functions except "nofunction".To have the DMM include a delay before each measurement, set autodelay to dmm.ON or 1.To have the DMM take a measurement without an automatic delay, set autodelay to dmm.OFF or 0.When this is enabled, a delay is added after a range or function change to allow the instrument to settle.   An error is generated if you try to set autodelay for "nofunction". Error code 1114, "Setting conflicts with function selected," is generated. If you query autodelay for "nofunction", nil is returned with the same error.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15975.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.autodelay = dmm.ON
--- dmm.measurecount = 10
--- ReadingBufferOne = dmm.makebuffer(1000)
--- dmm.measure(ReadingBufferOne)
--- 
--- --An automatic delay is applied to each measurement when the DMM is measuring two-wire ohms. Take 10 measurements and store them in a reading buffer named ReadingBufferOne that can store up to 1000 readings.
--- dmm.func = "dcvolts"
--- dmm.autodelay = dmm.OFF
--- 
--- --No delay is applied is applied to the DC volt measurements.
--- dmm.func = "fourwireohms"
--- dmm.autodelay = dmm.AUTODELAY_ONCE
--- dmm.measurecount = 10
--- ReadingBufferTwo = dmm.makebuffer(1000)
--- dmm.measure(ReadingBufferTwo)
--- 
--- --Sets an autodelay for the first of the ten four-wire ohm readings. Readings two through ten will occur as quickly as possible, with readings stored in a reading buffer called ReadingBufferTwo that can store up to 1000 readings.
--- ```
dmm.autodelay = 0


dmm.ON = 1
dmm.OFF = 0

---@alias dmmautorangevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute specifies the autorange setting for the active function**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Autorange selects the best range in which to measure the signal that is applied to the input terminals of the instrument. When autorange is enabled, the range increases at percent of range. The range decreases occur when the reading is <10 percent of nominal range.The autorange setting applies to the function selected by dmm.func. Autorange is available for the following functions:Autorange is not available for any other functions. If you try to set autorange for any other function, an error is returned. If you query the autorange for any other function, nil is returned and an error is generated.The autorange value is saved with the dmm.func function setting, so if you use another function, then return to the previous setting, such as "dcvolts" or "fourwireohms", the autorange setting you set previously is retained. With autorange enabled, you can use the dmm.range command to view the range that is presently being used. Using dmm.range to select a fixed range disables autorange.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15976.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.autorange = dmm.ON
--- 
--- --Enable autoranging for 2-wire ohms.
--- dmm.func = "dcvolts"
--- dmm.reset("active")
--- print(dmm.autorange, dmm.range)
--- dmm.range = 50e-3
--- print(dmm.autorange, dmm.range)
--- 
--- --Set DMM function to be DC volts.
--- --Reset only the active DMM function (DC volts).
--- --View the default autorange and range selection.
--- --Select a range suitable for a 50 mV reading.
--- --View the default autorange and range selection.
--- --Output:
--- --1.000000000e+00        1.000000000e+01
--- --0.000000000e+00        1.000000000e-01
--- ```
---@type dmmautorangevalue
dmm.autorange = 0


dmm.ON = 1
dmm.OFF = 0
dmm.AUTOZERO_ONCE = 2

---@alias dmmautozerostate
---|`dmm.ON`
---|`dmm.OFF`
---|`dmm.AUTOZERO_ONCE`



--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The autozero setting applies to the function selected by dmm.func. It is available for all functions except "continuity" and "nofunction".You can send dmm.AUTOZERO_ONCE or 2 to refresh the reference points once. When this command is sent, the reference points are refreshed, and then autozero is set to disabled (dmm.OFF or 0). Querying dmm.autozero after sending dmm.AUTOZERO_ONCE generates a response of 0.For dmm.nplc settings that are less than 0.2 plc, sending dmm.AUTOZERO_ONCE or 2 results in significant delays. For example, the delay time at a NPLC of 0.0005 is 2.75 s. The delay time at 0.199 is 5.45 s.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15977.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.autozero = dmm.ON
--- dmm.autozero = dmm.AUTOZERO_ONCE
--- print(dmm.autozero)
---  
---  
--- timer.reset()dmm.autozero=2time=timer.measure.t()print(time)
--- 
--- --Enables autozero for DC volts.
--- -- 
--- --Refreshes the reference points once and sets autozero to dmm.OFF or 0.
--- --Output:
--- --0.000000000e+00
--- --Determines the time delay when autozero is selected.
--- ```
---@type dmmautozerostate
dmm.autozero = 0



--- **This function closes the specified channel or channel pattern to prepare for a measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you close a channel or channel pattern:The DMM configuration is determined by the configuration associated with the channel or channel pattern being closed. If the configuration is a default name, the function of that configuration will be reset to factory default settings. You must create a unique DMM configuration to avoid using factory default settings when assigning to a channel. For more information on setting DMM configuration, see dmm.configure.set(), dmm.setconfig(), and dmm.getconfig().This command allows you to separate the closing of channels from measuring. Therefore, you may execute any number of commands between the close and measure commands to satisfy your application needs.An error is generated if:Once an error is detected, the command stops processing. Channels and DMM settings remain unchanged.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16014.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.setconfig("3003", "tempMeasure")
--- dmm.close('3003')
--- 
--- --Close channel 3 on slot 3 and prepare the DMM for measuring temperature with tempMeasure settings.
--- ```
---@param channelList string A string that lists the channel or channel pattern to close
function dmm.close(channelList) end


--- **This attribute indicates how the DMM relays should be connected to the analog backplane.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting affects all DMM functions. Valid values are shown in the table below.The relays are bitmapped into the lower 3 bits of the value as shown in the following table.To close a relay, set the appropriate bit to 1.To open a relay, set the appropriate bit to 0.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16020.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.connect = dmm.CONNECT_TWO_WIRE_AMPS
--- 
--- --Connects the DMM 2-wire and amp relays to the analog backplane.
--- ```
dmm.connect = 0



--- **This attribute defines the decibel (dB) reference setting for the DMM in volts.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The dB reference setting applies only when dmm.func is set to "dcvolts" or "acvolts". If you query this value for any other function, nil is returned.An error is generated:The dB reference setting is saved with the dmm.func function setting, so if you use another function, then return to "dcvolts" or "acvolts", the dB reference setting you set previously are retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16021.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.dbreference = 5
--- 
--- --Sets the dB reference to 5 volts for DC volts.
--- ```
dmm.dbreference = 0



--- **This attribute sets the AC detector bandwidth setting for the DMM in Hertz.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only applies when dmm.func is set to "acvolts" or "accurrent".If you query this value for any other function, nil is returned.When you send this value, the input value is adjusted as follows:An error is generated:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16022.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.func = "acvolts"
--- print(dmm.func, dmm.detectorbandwidth)
--- dmm.detectorbandwidth = 35
--- print(dmm.func, dmm.detectorbandwidth)
--- dmm.func = "accurrent"
--- print(dmm.func, dmm.detectorbandwidth)
--- dmm.func = "acvolts"
--- print(dmm.func, dmm.detectorbandwidth)
---  
--- 
--- --Sets the detector bandwidth to 35 Hz for AC volts. 35 is adjusted to 30. AC current is still at 300 Hz.
--- --Output:
--- --acvolts     3.000000000e+02
--- --acvolts     3.000000000e+01
--- --accurrent   3.000000000e+02
--- --acvolts     3.000000000e+01
--- ```
dmm.detectorbandwidth = 0


dmm.DIGITS_7_5 = 7
dmm.DIGITS_6_5 = 6
dmm.DIGITS_5_5 = 5
dmm.DIGITS_4_5 = 4
dmm.DIGITS_3_5 = 3

---@alias dmmdisplaydigitsvalue
---|`dmm.DIGITS_7_5`
---|`dmm.DIGITS_6_5`
---|`dmm.DIGITS_5_5`
---|`dmm.DIGITS_4_5`
---|`dmm.DIGITS_3_5`



--- **This attribute determines the number of digits that are displayed for measurements on the front panel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is not available for "nofunction". This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.An error is generated:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16023.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.displaydigits = dmm.DIGITS_7_5
--- 
--- --Enables display digits to 7½ for DC volts.
--- ```
---@type dmmdisplaydigitsvalue
dmm.displaydigits = 0


dmm.ON = 1
dmm.OFF = 0

---@alias dmmdrycircuitstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the dry circuit feature of the 4‑wire resistance measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The dry circuit setting only applies when dmm.func is set to "fourwireohms" or "commonsideohms". Enabling dry circuit limits the open-circuit voltage to below 20 mV, which is often required with low‑glitch measurements, such as measuring switch and relay contact resistance.When dry circuit is enabled, offset compensation is automatically enabled.An error is generated if:The dry circuit setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the dry circuit setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16024.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "fourwireohms"
--- dmm.drycircuit = dmm.ON
--- 
--- --Enable dry circuit for 4-wire ohms.
--- ```
---@type dmmdrycircuitstate
dmm.drycircuit = 0


dmm.RTD_PT100 = 0
dmm.RTD_D100 = 1
dmm.RTD_F100 = 2
dmm.RTD_PT385 = 3
dmm.RTD_PT3916 = 4
dmm.RTD_USER = 5

---@alias dmmfourrtdvalue
---|`dmm.RTD_PT100`
---|`dmm.RTD_D100`
---|`dmm.RTD_F100`
---|`dmm.RTD_PT385`
---|`dmm.RTD_PT3916`
---|`dmm.RTD_USER`



--- **This attribute sets the type of 4-wire RTD that is being used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature" and dmm.transducer is set to dmm.TEMP_FOURRTD. For all other transducer types, the attribute is set but is not used until the transducer type is set for four-wire RTD.All other functions generate an error and return nil when queried. An illegal parameter value error message is generated if the value specified is not a supported RTD type value as listed in the usage table.The four-wire RTD setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the four-wire RTD settings you set previously are retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16029.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_FOURRTD
--- dmm.fourrtd = dmm.RTD_PT3916
--- 
--- --Sets the type of four-wire RTD for PT3916.
--- ```
---@type dmmfourrtdvalue
dmm.fourrtd = 0



--- **This attribute selects the active measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute determines the selected DMM function and indicates how the other DMM attributes are to be processed.When the DMM functionality changes, the attributes for the new DMM function become active. Unless you update these attributes, they will be the factory defaults or the values that were used the last time the function was used. If you want to see settings for a particular function, change to that function with dmm.func, then write or read the settings specifically. To see all attributes at once, use dmm.configure.query with a first parameter value of "active" as shown in the example below.An error is generated:If an error is found, no change is made to the function.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16030.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- 
--- --Makes "temperature" the active DMM function.
--- ```
dmm.func = 0



--- **This function queries for the DMM configurations that are associated with the specified channels or channel patterns.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The response is a comma-delimited string that lists the user-defined and factory-defined configurations. They are listed in the same order in which they are specified in channelList.The configurations indicate how the DMM will be configured when the corresponding channel or channel pattern is closed with the dmm.close() function or used in a scan list without an overriding DMM configuration.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16031.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- slot1_2Configs = dmm.getconfig("slot1, slot2")
--- print(slot1_2Configs)
--- 
--- --Queries channels on slots 1 and 2.
--- ```
---@return string DMMconfiguration A comma-delimited string that lists the DMM configurations associated with items in channelList
---@param channelList string The channels or channel patterns to query
function dmm.getconfig(channelList) end

dmm.OFF = 0
dmm.ON = 1

---@alias dmminputdividerstate
---|`dmm.OFF`
---|`dmm.ON`



--- **This attribute determines when the 10 MΩ input divider is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to DC volts.The input divider setting is saved with the dmm.func function setting, so if you use another function, then return to "dcvolts", the input divider setting you set previously is retained.An error is generated if you try to set input divider for any DMM function other than "dcvolts". Error code 1114, "Setting conflicts with function selected," is generated. If you query any DMM function other than "dcvolts" for input divider, nil is returned with the same error.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16032.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.inputdivider = dmm.ON
--- 
--- --Enables the input divider for DC volts.
--- ```
---@type dmminputdividerstate
dmm.inputdivider = 0


dmm.ON = 1
dmm.OFF = 0

---@alias dmmlinesyncstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if line synchronization is used during the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "commonsideohms", "continuity", "dccurrent", "dcvolts", "fourwireohms", "temperature", or "twowireohms". All other functions generate an error when written and return nil when queried.When line synchronization is enabled, measurements are initiated at the first positive‑going zero crossing of the power line cycle after the trigger.The line sync setting is saved with the dmm.func function setting, so if you use another function, then return to a previous function, the line sync you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16041.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "fourwireohms"
--- dmm.linesync = dmm.ON
--- 
--- --Enables line sync for the "fourwireohms" function.
--- ```
---@type dmmlinesyncstate
dmm.linesync = 0



--- **This function creates a user buffer for storing readings. Reading buffers are allocated dynamically.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- To be able to store readings, a reading buffer needs to be created. Once created, the reading buffer can be used to store readings from dmm.measure() command and from scanning (scan.execute() or scan.background())To delete a buffer, set bufferVar to nil.Once a buffer is created, the attributes that can be accessed are:The following buffer bits indicate buffer statuses:To see readings in buffer:Where x and y represent the reading numbers to be returned.To see readings, channels, and units:Where x and y represent reading numbers to be returned.To see timestamps that are in buffer:Where x and y represent readings and timestamps for elements x to y.To see seconds, fractional seconds, and relative timestamps:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16048.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- bufferVar = dmm.makebuffer(300)
--- 
--- --Creates a user reading buffer named bufferVar with a capacity of 300.
--- dmm.measurecount = 10 
--- dmm.measure(bufferVar2)
--- printbuffer(1, bufferVar2.n, bufferVar2)
--- bufferVar2 = nil
---  
---  
---  
--- 
--- --Take ten measurements on the active function and store them in the reading buffer bufferVar2.
--- --View those ten readings.
--- --Delete bufferVar2.
--- --Sample output (actual output depends on how the active function is configured and what you are measuring):
--- --1.134154698e+01, 1.132708486e+01, 1.134213865e+01, 1.134037749e+01, 1.132735758e+01, 1.134099844e+01, 1.133705087e+01, 1.132571507e+01, 1.134000616e+01, 1.133721111e+01
--- ```
---@return bufferMethods bufferVar The variable name for the buffer being created
---@param bufferSize number Maximum number of readings that the buffer can store
function dmm.makebuffer(bufferSize) end


--- **This function returns the last reading of the measurement process without using the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This is not available for "nofunction". If the command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.You can also use a reading buffer to store additional information that is acquired while making a measurement.The dmm.measurecount attribute determines how many measurements are performed. When you use a buffer, it also determines if the reading buffer has enough room to store the requested readings. The amount of room is based on readings already stored in the buffer (bufferVar.n), the capacity of the buffer (bufferVar.capacity), and the append mode of the reading buffer (bufferVar.appendmode). If the append mode is set to 0, any stored readings in the buffer are cleared before new ones are stored. If append mode is set to 1, any stored readings remain in the buffer and new ones are added to the buffer after the stored ones.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16049.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- DCVBuffer = dmm.makebuffer(100)
--- dmm.func = "dcvolts"
--- dmm.measurecount = 100
--- dmm.measure(DCVBuffer)
--- 
--- --Performs 100 DC voltage measurements and stores them in a buffer called DCVBuffer.
--- ```
---@return number reading The last reading of the measurement process
---@param bufferVar bufferMethods A previously created reading buffer where all readings are stored
---@overload fun():number
function dmm.measure(bufferVar) end


--- **This attribute sets the number of measurements to take when a measurement is requested by a DMM measure command.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the number of measurements taken any time a measurement is requested (through dmm.measure, dmm.measurewithtime, or the front panel MEASURE menu option). When using a reading buffer with a measure command, the count also controls the number of readings to be stored.It has no effect on the trigger model, and the trigger model does not affect this setting.This setting is applied to all functions (the setting is not related to a specific function).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16050.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- DMMbuffer = dmm.makebuffer(500)
--- dmm.measure(bufferVar)
--- dmm.measurecount = 50
--- 
--- --Create a reading buffer called DMMbuffer that can store 500 readings.
--- --Store 50 readings in DMMbuffer.
--- --Set the measure count of the DMM to 50.
--- ```
dmm.measurecount = 0



--- **This function returns the last actual measurement and time information in UTC format without using the trigger model. You can also use a reading buffer to store additional information that is acquired while making a measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This is not available for "nofunction". If the command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.When a reading buffer is used with a command or action that involves taking multiple readings, such as dmm.measure or scanning, all readings are available in the reading buffer. However, only the last reading and time information (seconds and fractional seconds) is returned as a reading with the command.You can also use a reading buffer to store additional information that is acquired while making a measurement.The dmm.measurecount attribute determines how many measurements are performed. When you use a buffer, it also determines if the reading buffer has enough room to store the requested readings. The amount of room is based on readings already stored in the buffer (bufferVar.n), the capacity of the buffer (bufferVar.capacity), and the append mode of the reading buffer (bufferVar.appendmode). If the append mode is set to 0, any stored readings in the buffer are cleared before new ones are stored. If append mode is set to 1, any stored readings remain in the buffer and new ones are added to the buffer after the stored ones.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16051.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- DCVbuffer = dmm.makebuffer(100)
--- dmm.func = "dcvolts"
--- dmm.measurecount = 100
--- reading, seconds, fractional = dmm.measurewithtime(DCVbuffer)
--- print(reading, seconds, fractional)
--- 
--- --Create a reading buffer.
--- --Perform 100 DC voltage measurements.
--- --Store the measurements in a buffer called DCVbuffer.
--- --Print the last measurement and time information in UTC format, which will look similar to:
--- ---1.064005867e-02   1.779155900e+07   1.245658350e-01
--- ```
---@return number reading The last reading of the measurement process
---@return any seconds Seconds in UTC format
---@return number fractional Fractional seconds
---@param bufferVar bufferMethods A previously created reading buffer variable in which all readings are stored
---@overload fun():number
function dmm.measurewithtime(bufferVar) end


--- **This attribute sets the integration rate in line cycles for the DMM for the function selected by dmm.func.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is not applicable for "frequency", "period", and "nofunction". If you query this attribute for one of these functions, nil is returned. Note that "continuity" is fixed at 6.000000E-003 and cannot be changed.The setting for NPLC may be adjusted based on what the DMM supports. Therefore, after setting the NPLC, query the value to see if it was adjusted.An error is generated if the command is used when dmm.func is set to "frequency", "period", "continuity", or "nofunction".The NPLC setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the NPLC setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16052.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.nplc = 0.5
--- dmm.func = "dcvolts"
--- dmm.nplc = 0.1
--- 
--- --Set the NPLC for 2-wire ohms to 0.5, then set the NPLC for DC volts to 0.1.
--- ```
dmm.nplc = 0


dmm.ON = 1
dmm.OFF = 0

---@alias dmmoffsetcompensationstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute specifies the offset compensation setting for the DMM for the function selected by dmm.func.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The command applies when dmm.func is set to "fourwireohms", "commonsideohms" or "temperature".When dmm.func = "temperature", this attribute applies only when the transducer type is 3- or 4-wire RTD. Set this command as you would for 4-wire ohm measurements.This command is automatically set to dmm.ON when dmm.drycircuit is set to dmm.ON and dmm.func = "fourwireohms" or "commonsideohms".The offset compensation setting is saved with the dmm.func function setting, so if you use another function, then return to  "fourwireohms", "commonsideohms" or "temperature", the offset compensation setting you set previously is retained.If you query this attribute and the function is not "fourwireohms", "commonsideohms", or "temperature", nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16053.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "fourwireohms"
--- dmm.offsetcompensation = dmm.ON
--- 
--- --Enable offset compensation for 4-wire ohms.
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THREERTD
--- dmm.offsetcompensation = dmm.OFF
--- 
--- --Disable offset compensation for 3-wire RTD temperature measurements.
--- ```
---@type dmmoffsetcompensationstate
dmm.offsetcompensation = 0



--- **Opens the specified channel or channel pattern.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to separate the opening and closing of channels and analog backplane relays when measuring. You can execute any number of commands between the open and close commands to meet your application needs.The configuration (dmm.getconfig()) associated with the specified channel dictates whether a paired channel is open or not. For channel patterns, the channels associated with it are opened. A channel pattern includes a paired channel for multi-wire measurement if a channel is configured that way when the pattern is created (see commands channel.setpole() and channel.pattern.setimage()).The configuration (dmm.getconfig()) dictates whether analog backplane relays 1 and 2 are opened and if a paired channel is opened. The dmm.open() function does not use the analog backplane relays specified by the channel.setbackplane() function or pole settings set by the channel.setpole() function.An error is generated and the channels do not open if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16054.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()                                                         
--- channel.setpole("slot2" , 4)  
--- channel.pattern.setimage("2005, 2911, 2922", "Chan5_4W")  
--- dmm.setconfig("Chan5_4W", "fourwireohms")  
--- dmm.open("Chan5_4W")  
--- print(channel.pattern.getimage("Chan5_4W"))
--- 
--- --Assume a Model 3721 is installed in slot 2.
--- --Reset the instrument.
--- --Configure the slot 2 channels for 4-pole operation.
--- --Create a pattern called Chan5_4W.
--- --Assign 4-wire ohms configuration to the Chan5_4W pattern.
--- --Open the channels associated with Chan5_4W and display image of the Chan5_4W.
--- --Output:
--- --2005(2025),2911,2922
--- dmm.setconfig("slot3", "dcvolts") 
--- dmm.close("3030") 
--- print(channel.getclose("slot3")) 
--- dmm.open("3030") 
--- print(channel.getclose("slot3")) 
--- dmm.close("3031") 
--- print(channel.getclose("slot3")) 
--- dmm.open("3031") 
--- print(channel.getclose("slot3"))
--- 
--- --Assume a 3720 installed in slot 3.
--- --Set the configuration for DC volts.
--- --Close and open the channels.
--- --Output:
--- --3030;3911
--- --nil
--- --3031;3921
--- --nil
--- ```
---@param channelList string A string that lists the channel or channel pattern to open
function dmm.open(channelList) end

dmm.OFF = 0
dmm.ON = 1

---@alias dmmopendetectorstate
---|`dmm.OFF`
---|`dmm.ON`



--- **This attributes determines if the detection of open leads is enabled or disabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The command applies when dmm.func is set to "fourwireohms", "commonsideohms", or "temperature".When dmm.func is set to temperature, the open detector setting is only used when the transducer type is thermocouple. For all other transducer types, it is set, but not used until the transducer type is set to thermocouple.The open detector setting is saved with the dmm.func function setting, so if you use another function, then return to "fourwireohms", "commonsideohms", or "temperature", the open detector setting you set previously is retained.An error is generated if dmm.func is set to any function other than "fourwireohms", "commonsideohms", or "temperature". If you query the setting for any other function, nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16055.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMOCOUPLE
--- dmm.opendetector = dmm.ON
--- 
--- --Enable the thermocouple open detector.
--- ```
---@type dmmopendetectorstate
dmm.opendetector = 0



--- **Indicates the range of DMM for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this value to the expected measurement value and the instrument will select the range appropriate to measure that value. Setting the range with this attribute will automatically disable the autorange setting (dmm.autorange command).The instrument selects the range to best match the expected measure value for the functions, as shown below.The range setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the range settings you set previously are retained.If you query the range when the selected function does not have a range associated with it, nil is returned.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16056.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.range = 5
--- dmm.func = "twowireohms"
--- dmm.range = 35000
--- print(dmm.range)
--- 
--- --Set the range for DC volts to 10. Select a range on 2-wire ohms suitable for measuring 35000. View the selected range.
--- --Output:
--- --1.000000000e+05
--- ```
dmm.range = 0


dmm.REF_JUNCTION_SIMULATED = 0
dmm.REF_JUNCTION_INTERNAL = 1
dmm.REF_JUNCTION_EXTERNAL = 2

---@alias dmmrefjunctionstate
---|`dmm.REF_JUNCTION_SIMULATED`
---|`dmm.REF_JUNCTION_INTERNAL`
---|`dmm.REF_JUNCTION_EXTERNAL`



--- **This attribute defines the type of the thermocouple reference junction.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried.This attribute only applies when the transducer type is set to thermocouple. For all other transducer types, the reference junction may be set, but it is not used until the transducer type is set to thermocouple.The reference junction setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the reference junction settings you set previously are retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16057.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMOCOUPLE
--- dmm.refjunction = dmm.REF_JUNCTION_SIMULATED
--- 
--- --Enables the simulated thermocouple reference junction.
--- ```
---@type dmmrefjunctionstate
dmm.refjunction = 0



--- **Resets the DMM functions and attributes in the instrument, as indicated by the parameter.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the scope is set to active, this command resets the DMM attributes for the active function to factory default values. The settings for other functions are unchanged.When the scope is set to all, this command resets the DMM functions and attributes to factory default settings.This function does not affect the DMM configurations (dmm.setconfig() and dmm.getconfig()).The factory default settings are:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16061.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.reset("active")
--- print(dmm.func)
--- dmm.reset("all")
--- print(dmm.func)
--- 
--- --Set the DMM function to temperature.
--- --Perform a reset on temperature only.
--- --Check the function after resetting only temperature.
--- --Perform a reset on all DMM functions.
--- --Check the function after resetting all DMM functions.
--- --Output:
--- --temperature
--- --dcvolts
--- ```
---@param scope string A string equaling "active" to set the active function only to factory default settings or "all" to set all functions back to factory default settings
function dmm.reset(scope) end


--- **This attribute contains the alpha value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried.This setting only applies when the transducer type is set to 3 or 4-wire RTD. For other transducer types, the setting is set but not used until the transducer type is set to an RTD type.The RTD alpha setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the RTD alpha setting you set previously is retained.An error is generated if the value is out of range.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16062.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THREERTD
--- dmm.rtdalpha = 0.005
--- dmm.transducer = dmm.TEMP_FOURRTD
--- dmm.rtdalpha = 0.007
--- dmm.transducer = dmm.TEMP_THREERTD
--- print(dmm.rtdalpha)
--- 
--- --Set an alpha constant for RTD to 0.005 for 3-wire RTD.
--- --Change to 4-wire RTD and change the alpha constant to 0.007.
--- --Switch back to 3-wire RTD. The value has been updated to 0.007.
--- --Output:
--- --7.000000000e-03
--- dmm.func = "temperature" 
--- dmm.transducer = dmm.TEMP_THREERTD 
--- dmm.rtdalpha = 0.005 
--- dmm.configure.set("RTD_3wire")
--- dmm.transducer = dmm.TEMP_FOURRTD 
--- dmm.rtdalpha = 0.007 
--- dmm.configure.set("RTD_4wire")
--- dmm.configure.recall("RTD_3wire")
--- print(dmm.transducer, dmm.rtdalpha) 
--- dmm.configure.recall("RTD_4wire")
--- print(dmm.transducer, dmm.rtdalpha)
--- 
--- --This example sets unique alpha constants for 3-wire and 4-wire RTDs by creating two DMM configurations with the settings.
--- -- 
--- --Output:
--- --3.000000000e+00	5.000000000e-03
--- --4.000000000e+00	7.000000000e-03
--- -- 
--- ```
dmm.rtdalpha = 0



--- **This attribute contains the beta value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried.This setting only applies when the transducer type is set to 3 or 4-wire RTD. For other transducer types, the setting is set but not used until the transducer type is set to an RTD type.The RTD beta setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the RTD beta setting you set previously is retained.An error is generated if the value is out of range.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16063.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THREERTD
--- dmm.rtdbeta = 0.3
--- dmm.transducer = dmm.TEMP_FOURRTD
--- dmm.rtdbeta = 0.5
--- dmm.transducer = dmm.TEMP_THREERTD
--- print(dmm.rtdbeta)
--- 
--- --Set a beta constant for RTD to 0.3 for 3-wire RTD.
--- --Change to 4-wire RTD.
--- --Change the beta constant to 0.5.
--- --Switch back to 3-wire RTD. The value is 0.5.
--- --Output:
--- --5.000000000e-01
--- dmm.func = "temperature" 
--- dmm.transducer = dmm.TEMP_THREERTD 
--- dmm.rtdbeta = 0.3 
--- dmm.configure.set("RTD_3wire")
--- dmm.transducer = dmm.TEMP_FOURRTD 
--- dmm.rtdbeta = 0.5 
--- dmm.configure.set("RTD_4wire")
--- dmm.configure.recall("RTD_3wire")
--- print(dmm.transducer, dmm.rtdbeta) 
--- dmm.configure.recall("RTD_4wire")
--- print(dmm.transducer, dmm.rtdbeta)
--- 
--- --This example sets unique beta constants for 3-wire and 4-wire RTDs by creating two DMM configurations with the settings.
--- --Output:
--- --3.000000000e+00	3.000000000e-01
--- --4.000000000e+00	5.000000000e-01
--- ```
dmm.rtdbeta = 0



--- **This attribute contains the delta value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried.This setting only applies when the transducer type is set to 3 or 4-wire RTD. For other transducer types, the setting is set but not used until the transducer type is set to an RTD type.The RTD alpha setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the RTD alpha setting you set previously is retained.An error is generated if the value is out of range.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16064.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THREERTD
--- dmm.rtddelta = 3
--- dmm.transducer = dmm.TEMP_FOURRTD
--- dmm.rtddelta = 5
--- dmm.transducer = dmm.TEMP_THREERTD
--- print(dmm.rtddelta)
--- 
--- --Set a delta constant for RTD to 3 for 3-wire RTD.
--- --Change to 4-wire RTD.
--- --Change the delta constant to 5.
--- --Switch back to 3-wire RTD. The value is 5.
--- --Output:
--- --5.000000000e+00
--- dmm.func = "temperature" 
--- dmm.transducer = dmm.TEMP_THREERTD 
--- dmm.rtddelta = 3 
--- dmm.configure.set("RTD_3wire")
--- dmm.transducer = dmm.TEMP_FOURRTD 
--- dmm.rtddelta = 5 
--- dmm.configure.set("RTD_4wire")
--- dmm.configure.recall("RTD_3wire")
--- print(dmm.transducer, dmm.rtddelta) 
--- dmm.configure.recall("RTD_4wire")
--- print(dmm.transducer, dmm.rtddelta)
--- 
--- --This example sets unique delta constants for 3-wire and 4-wire RTDs by creating two DMM configurations.
--- --Output:
--- --3.000000000e+00	3.000000000e+00
--- --4.000000000e+00	5.000000000e+00
--- ```
dmm.rtddelta = 0



--- **This attribute contains the zero value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other configurations generate an error and return nil when queried.This setting only applies when the transducer type is set to 3 or 4-wire RTD. For other transducer types, the setting is set but not used until the transducer type is set to an RTD type.The RTD zero setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the RTD zero settings you set previously are retained.An error is generated if the value is out of range.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16065.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THREERTD
--- dmm.rtdzero = 300
--- dmm.transducer = dmm.TEMP_FOURRTD
--- dmm.rtdzero = 500
--- dmm.transducer = dmm.TEMP_THREERTD
--- print(dmm.rtdzero)
--- 
--- --Set a zero constant for RTD to 300 for 3-wire RTD.
--- --Change to 4-wire RTD.
--- --Change the zero constant to 500.
--- --Switch back to 3-wire RTD. The value is 500.
--- --Output:
--- --5.000000000e+02
--- dmm.func = "temperature" 
--- dmm.transducer = dmm.TEMP_THREERTD 
--- dmm.rtdzero = 300
--- dmm.configure.set("RTD_3wire")
--- dmm.transducer = dmm.TEMP_FOURRTD 
--- dmm.rtdzero = 500
--- dmm.configure.set("RTD_4wire")
--- dmm.configure.recall("RTD_3wire")
--- print(dmm.transducer, dmm.rtdzero) 
--- dmm.configure.recall("RTD_4wire")
--- print(dmm.transducer, dmm.rtdzero)
--- 
--- --This example sets unique zero constants for 3-wire and 4-wire RTDs by creating two DMM configurations.
--- --Output:
--- --3.000000000e+00	3.000000000e+02
--- --4.000000000e+00	5.000000000e+02
--- ```
dmm.rtdzero = 0


buffer.SAVE_FORMAT_TIME = nil
buffer.SAVE_RELATIVE_TIME = nil
buffer.SAVE_RAW_TIME = nil
buffer.SAVE_TIMESTAMP_TIME = nil

---@alias dmmsavebuffertimeFormat
---|`buffer.SAVE_FORMAT_TIME`
---|`buffer.SAVE_RELATIVE_TIME`
---|`buffer.SAVE_RAW_TIME`
---|`buffer.SAVE_TIMESTAMP_TIME`



--- **Saves data from the specified reading buffer to a USB flash drive using the specified filename.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file name must specify the full path (including /usb1/). If included, the file extension must be set to .csv. If no file extension is specified, .csv is added.For options that save more than one item of time information, each item is comma-delimited. For example, the default format is date, time, and fractional seconds for each reading.You use dmm.makebuffer() to create a buffer.Examples of valid destination file names:Invalid destination filename examples:— The period is not followed by the csv extension.— The only allowed extension is .csv. If .csv is not assigned, it is automatically added.— Two periods in the file name (myData_txt.csv would be correct).An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16066.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.savebuffer("bufferVar", "/usb1/myData.csv")
--- 
--- --Saves readings from a DMM buffer named bufferVar with default time information to a file named myData.csv on the USB flash drive.
--- ```
---@param bufferVar string A string that specifies the name of the DMM reading buffer that was created by dmm.makebuffer()
---@param fileName string A string that indicates the name of the file on the USB flash drive in which to save the reading buffer
---@param timeFormat dmmsavebuffertimeFormat How date and time information from the buffer is saved in the file on the USB flash drive; the values are
---@overload fun(bufferVar:string,fileName:string)
function dmm.savebuffer(bufferVar, fileName, timeFormat) end


--- **Associates a DMM configuration with items specified in parameter channel list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- dmmConfiguration can be the name of a configuration that was saved with dmm.configure.set(). If you use a saved configuration, the function of the configuration and the supporting DMM attributes for that function are associated with the channelList parameter items. These supporting DMM attributes may have user-defined or default values associated with them.dmmConfiguration can also be a DMM configuration name that matches the DMM function name. If you use a default DMM configuration name, be aware that the supporting function attribute settings are the default values and not user-specified (as they may be in a user-defined saved configuration). The DMM function names are:To use a channel with the dmm.close() function, dmm.setconfig() cannot be set to "nofunction".The configuration being assigned determines whether analog backplane relay 1 or 2 get used, based on the function associated with the configuration when being assigned to a channel. For channel patterns, the pattern image must include the analog backplane relays and the channels. This command has no effect on the poles setting for a channel (channel.setpole()) or analog backplane relays specified by channel.setbackplane() function.An error is generated if:Once an error is detected, the command stops processing and no channels or channel patterns are modified.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16067.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.setconfig("1001:3100", "myDcv")
--- 
--- --Assigns myDcv to all the channels on slots 1 and 2 and channels 1 to 100 on slot 3.
--- ```
---@param channelList string A string that lists the channels and channel patterns to change
---@param dmmConfiguration string A string with the name of the DMM configuration that will be assigned to items in channelList
function dmm.setconfig(channelList, dmmConfiguration) end


--- **This attribute sets the simulated reference temperature of the thermocouple reference junction.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute applies to the temperature function when the transducer type is set to thermocouple and the reference junction is set to simulated. It allows you to set the simulated reference temperature value.This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried.The simulated reference temperature is only used when the transducer type is thermocouple, as set by dmm.transducer. For all other transducer types, the value is set but not used until the transducer type is set for thermocouple.The simulated reference temperature setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature" with the transducer type set to thermocouple, the simulated reference temperature setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16068.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMOCOUPLE
--- dmm.units = dmm.UNITS_CELSIUS
--- dmm.simreftemperature = 30
--- 
--- --Sets 30 degrees Celsius as the simulated reference temperature for thermocouples.
--- ```
dmm.simreftemperature = 0



--- **This attribute describes the type of thermistor.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried. If you use a parameter outside of the ranges listed in the usage table, a parameter out of range error message is generated.The thermistor attribute is only used when the transducer type is set for thermistor. For all other transducer types, the setting is set but not used until thermistor is selected for the transducer type (see dmm.transducer).The thermistor setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the thermistor setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16069.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMISTOR
--- dmm.thermistor = 3000
--- 
--- --Sets thermistor type to 2252. Note that the original value is set to 3000, but is automatically converted to 2252.
--- ```
dmm.thermistor = 0


dmm.THERMOCOUPLE_J = 0
dmm.THERMOCOUPLE_K = 1
dmm.THERMOCOUPLE_T = 2
dmm.THERMOCOUPLE_E = 3
dmm.THERMOCOUPLE_R = 4
dmm.THERMOCOUPLE_S = 5
dmm.THERMOCOUPLE_B = 6
dmm.THERMOCOUPLE_N = 7

---@alias dmmthermocouplevalue
---|`dmm.THERMOCOUPLE_J`
---|`dmm.THERMOCOUPLE_K`
---|`dmm.THERMOCOUPLE_T`
---|`dmm.THERMOCOUPLE_E`
---|`dmm.THERMOCOUPLE_R`
---|`dmm.THERMOCOUPLE_S`
---|`dmm.THERMOCOUPLE_B`
---|`dmm.THERMOCOUPLE_N`



--- **This attribute indicates the thermocouple type.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried. An illegal parameter value error message is generated if the value specified is not a supported thermocouple type value listed in the usage table.The thermocouple attribute is only used when the transducer type is thermocouple. For all other transducer types, the value is set but not used until the transducer type is set for thermocouple.The thermocouple setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the thermocouple value you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16070.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMOCOUPLE
--- dmm.thermocouple = dmm.THERMOCOUPLE_J
--- 
--- --Sets the thermocouple type to J.
--- ```
---@type dmmthermocouplevalue
dmm.thermocouple = 0


dmm.RTD_PT100 = 3
dmm.RTD_D100 = 0
dmm.RTD_F100 = 1
dmm.RTD_PT385 = 2
dmm.RTD_PT3916 = 3
dmm.RTD_USER = 4

---@alias dmmthreertdvalue
---|`dmm.RTD_PT100`
---|`dmm.RTD_D100`
---|`dmm.RTD_F100`
---|`dmm.RTD_PT385`
---|`dmm.RTD_PT3916`
---|`dmm.RTD_USER`



--- **This attribute defines the type of three-wire RTD that is being used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature" and dmm.transducer is set to dmm.TEMP_THREERTD. For all other transducer types, the attribute is set but is not used until the transducer type is set for three-wire RTD. All other functions generate an error and return nil when queried.An illegal parameter value error message is generated if the value specified is not a supported RTD type value as listed in the usage table.The three-wire RTD setting is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the three-wire RTD setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16071.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THREERTD
--- dmm.threertd = dmm.RTD_PT3916
--- 
--- --Sets the type of three-wire RTD to PT3916.
--- ```
---@type dmmthreertdvalue
dmm.threertd = 0



--- **This attribute determines the signal level where the instrument makes frequency or period measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "frequency", "period", or "continuity". All other functions generate an error and return nil when queried.The range setting conditions the signal. The instrument automatically selects the most sensitive threshold range for the value you enter. For example, if you specify the expected input voltage to be 90 mV, the instrument automatically selects the 100 mV threshold range.Errors are generated if the parameter value does not make sense for selected function.The threshold value is saved with the dmm.func function setting, so if you use another function, then return to "frequency", "period", or "continuity", the threshold value you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16072.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "frequency"
--- dmm.threshold = 30
--- 
--- --Sets the threshold range for frequency to 30.
--- ```
dmm.threshold = 0


dmm.TEMP_THERMOCOUPLE = 1
dmm.TEMP_THERMISTOR = 2
dmm.TEMP_THREERTD = 3
dmm.TEMP_FOURRTD = 4

---@alias dmmtransducervalue
---|`dmm.TEMP_THERMOCOUPLE`
---|`dmm.TEMP_THERMISTOR`
---|`dmm.TEMP_THREERTD`
---|`dmm.TEMP_FOURRTD`



--- **This attribute contains the transducer type.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "temperature". All other functions generate an error and return nil when queried.The transducer value is saved with the dmm.func function setting, so if you use another function, then return to "temperature", the transducer value you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16073.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMISTOR
--- 
--- --Sets transducer to thermistor type.
--- ```
---@type dmmtransducervalue
dmm.transducer = 0



--- **This attribute contains the units that are used for voltage and temperature measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when dmm.func is set to "dcvolts", "acvolts", or "temperature". All other functions generate an error and return nil when queried.The units value is saved with the dmm.func function setting, so if you use another function, then return to "dcvolts", "acvolts", or "temperature", the units setting you set previously is retained.Errors are generated if the parameter value does not make sense for the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16074.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- dmm.units = dmm.UNITS_FAHRENHEIT
--- 
--- --Sets units for temperature measurements to Fahrenheit (°F).
--- ```
dmm.units = 0



--- **This function returns the last actual measurement and time information in PTP format without using the trigger model. You can also use a reading buffer to store additional information that is acquired while making a measurement.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This is not available for "nofunction". If the command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.When a reading buffer is used with a command or action that involves taking multiple readings, such as dmm.measure or scanning, all readings are available in the reading buffer. However, only the last reading and time information (seconds and fractional seconds) is returned as a reading with the command.You can also use a reading buffer to store additional information that is acquired while making a measurement.The dmm.measurecount attribute determines how many measurements are performed. When you use a buffer, it also determines if the reading buffer has enough room to store the requested readings. The amount of room is based on readings already stored in the buffer (bufferVar.n), the capacity of the buffer (bufferVar.capacity), and the append mode of the reading buffer (bufferVar.appendmode). If the append mode is set to 0, any stored readings in the buffer are cleared before new ones are stored. If append mode is set to 1, any stored readings remain in the buffer and new ones are added to the buffer after the stored ones.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20200.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- DCVbuffer = dmm.makebuffer(100)
--- dmm.func = "dcvolts"
--- dmm.measurecount = 100
--- reading, seconds, fractional = dmm.measurewithptp(DCVbuffer)
--- print(reading, seconds, fractional)
--- 
--- --Create a reading buffer.
--- --Perform 100 DC voltage measurements.
--- --Store the measurements in a buffer called DCVbuffer.
--- --Print the last measurement and time information in PTP format, which will look similar to:
--- ---1.064005867e-02   1.779155900e+07   1.245658350e-01
--- ```
---@return number reading The last reading of the measurement process
---@return any seconds Seconds in PTP format
---@return number fractional Fractional seconds
---@param bufferVar bufferMethods A previously created reading buffer variable in which all readings are stored
---@overload fun():number
function dmm.measurewithptp(bufferVar) end
---@class ptp
ptp = {}



ptp.OFF = 0
ptp.ON = 1

---@alias ptpenablestate
---|`ptp.OFF`
---|`ptp.ON`



--- **This attribute enables or disables the precision time protocol (PTP) described in IEEE‑1588 on the Series 3700A.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- From the factory, this attribute is disabled (ptp.OFF). After setting this attribute, it is saved in nonvolatile memory, and that setting value is recalled the next time the instrument is powered on.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16215.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ptp.enable=1
--- print(ptp.enable)
--- 
--- --Output:
--- --1.000000000e+00
--- ```
---@type ptpenablestate
ptp.enable = 0


ptp.INITIALIZING = nil
ptp.FAULTY = nil
ptp.DISABLE = nil
ptp.LISTENING = nil
ptp.PRE_MASTER = nil
ptp.MASTER = nil
ptp.PASSIVE = nil
ptp.UNCALIBRATED = nil
ptp.SLAVE = nil
ptp.UNKNOWN = nil

---@alias ptpportstatestate
---|`ptp.INITIALIZING`
---|`ptp.FAULTY`
---|`ptp.DISABLE`
---|`ptp.LISTENING`
---|`ptp.PRE_MASTER`
---|`ptp.MASTER`
---|`ptp.PASSIVE`
---|`ptp.UNCALIBRATED`
---|`ptp.SLAVE`
---|`ptp.UNKNOWN`



--- **This attribute is a read-only value that indicates the state of the IEEE‑1588 precision time protocol (PTP).**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16216.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(ptp.portstate)
--- 
--- --Output (this output indicates that PTP is disabled):
--- --2.000000000e+00
--- ```
---@type ptpportstatestate
ptp.portstate = 0



--- **This function is a read-only string that returns the PTP time in seconds and fractional seconds.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16221.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- sec,fraction=ptp.time()
--- print(sec+fraction)
--- 
--- --Output:
--- --1.306440045e+09
--- ```
function ptp.time() end


--- **This attribute describes the offset, in seconds, between UTC and PTP.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If the instrument is a subordinate, the ptp.utcoffset value is from the master. If the value is from the master, the setting is overwritten on the next synchronization. The Series 3700A does not keep track of this value through a power cycle (that is, it defaults to 0 if the 3700 is the master). The ptp.utcoffset is only nonzero if the Series 3700A communicates to a master clock that is aware of the difference between PTP and UTC time.You can only write to this command if the Series 3700A is the master. If the Series 3700A is not the master, an error is generated when you try to write to the Series 3700A.The Series 3700A is not time-zone aware, so UTC time is presented as the local time.UTC Time = PTP Time – UTC Offset
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16222.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ptp.utcoffset=33
--- print(ptp.utcoffset)
--- 
--- --Sets the UTC offset to 33 seconds.
--- --Output:
--- --3.300000000e+01
--- ```
ptp.utcoffset = 0



--- **This attribute describes the IEEE Std 1588-2008 precision time protocol (PTP) domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only instruments in the same domain will interact with each other in the IEEE‑1588 PTP.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20216.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ptp.domain=1
--- print(ptp.domain)
--- 
--- --Sets the ptp domain to 1 (alternate domain 1) and prints the result.
--- --Output:
--- --1
--- ```
ptp.domain = 0



--- **This attribute describes whether you prefer to have the instrument be a subordinate clock or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- From the factory, this attribute is 1. After you set this attribute, it is saved in nonvolatile memory. That setting is recalled the next time the instrument is powered up.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20217.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ptp.slavepreferred = 1
--- print(ptp.slavepreferred)
---  
--- 
--- --Set the instrument to be a subordinate clock. Check to see if the instrument is a subordinate clock.
--- --Output:
--- --1
--- ```
ptp.slavepreferred = 0

---@class scan
scan = {}




--- **This function aborts a running background scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If no scan is running, the call to this function is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16240.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.background()
--- scan.abort()
--- 
--- --Starts background scan, and then aborts the scan.
--- ```
function scan.abort() end


--- **This function writes a specified value to a channel at the added step in the scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is similar to issuing channel.write() at the scan step. Specifying multiple channels in channelList causes multiple steps to be added to the scan. For digital I/O channels, only a width of 1, 2, 3, or 4 is supported. Any information (bits) greater than the specified width are ignored. Values written to inputs are ignored. If no specified channel is set for output, an error is generated. If a width crosses channels, only the channels set to output are affected.This is not available for backplane and switch channels.For DAC channels, if the channel mode is changed after the scan is created, the scan is rebuilt. If the write value is no longer compatible with the new mode, an error is generated and the scan becomes invalid.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16242.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.addwrite("6001, 6003, 6005", 21845, 2)
--- 
--- --Assume a 3750 in slot 6. Add to existing scan list channels 1, 3 and 5 on slot 6 to write a 16-bit hex value of hexadecimal 5555 (decimal 21845).
--- ```
---@param channelList string String specifying channels to add using normal channel list syntax
---@param writeValue number The value to write to the channel for this scan step
---@param width any Specifies the width of the channel write to use with items in channelList
---@overload fun(channelList:string,writeValue:number)
function scan.addwrite(channelList, writeValue, width) end


--- **This attribute sets the number of iterations performed when a scanning measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to indicate how many measurements to make on a step when measurements are needed. This sets the measurement count in the trigger model. During a scan, the Series 3700A iterates through the sequence event detector and measurement action of the trigger model count times. After performing count iterations, the Series 3700A returns to check the scan count.This must be set before the scan is started. Once set, it applies to all scan steps in the list, including scan steps that exist in the list and any that are added before the scan is started.All steps take the same number of measurements. When taking multiple measurements, the measurements may be taken as quickly as possible based on the configuration (scan.trigger.measure.stimulus = 0) or they may be paced by a trigger (scan.trigger.measure.stimulus is nonzero).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16248.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.measurecount = 5
--- 
--- --Sets the measurement count to 5.
--- ```
scan.measurecount = 0


scan.EMPTY = 0
scan.BUILDING = 1
scan.RUNNING = 2
scan.ABORTED = 3
scan.FAILED = 4
scan.FAILED_INIT = 5
scan.SUCCESS = 6

---@alias scannobufferbackgroundstate
---|`scan.EMPTY`
---|`scan.BUILDING`
---|`scan.RUNNING`
---|`scan.ABORTED`
---|`scan.FAILED`
---|`scan.FAILED_INIT`
---|`scan.SUCCESS`



--- **This function starts a scan in background mode and specifies that no reading buffer is used during scanning.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before using this command, use scan.create(), scan.add(), and scan.addimagestep() to set up scan elements. If a reading buffer is specified, an error is generated.To view the scan status, use scan.state().To run a scan in the background with a reading buffer, see scan.background().
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16250.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.nobufferbackground()
--- 
--- --Run the scan in the background with no reading buffer.
--- ```
---@return scannobufferbackgroundstate state The result of scanning
---@return number scancount The present number of scans completed
---@return number stepcount The present number of steps completed
function scan.nobufferbackground() end

scan.EMPTY = 0
scan.BUILDING = 1
scan.RUNNING = 2
scan.ABORTED = 3
scan.FAILED = 4
scan.FAILED_INIT = 5
scan.SUCCESS = 6

---@alias scannobufferexecutestate
---|`scan.EMPTY`
---|`scan.BUILDING`
---|`scan.RUNNING`
---|`scan.ABORTED`
---|`scan.FAILED`
---|`scan.FAILED_INIT`
---|`scan.SUCCESS`



--- **This function starts a scan immediately and specifies that no reading buffer is used during scanning.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before using this command, use scan.create(), scan.add(), and scan.addimagestep() to set up scan elements. If a reading buffer is specified, an error is generated.The command continues execution until scanning completes or is aborted by the user.To run a scan immediately with a reading buffer, see scan.execute().
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16251.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.nobufferexecute()
--- 
--- --Runs the scan immediately with no reading buffer.
--- ```
---@return scannobufferexecutestate state The result of scanning
---@return any scanCount The present number of scans that have completed
---@return any stepCount The present number of steps have completed
function scan.nobufferbackground() end

scan.EMPTY = 0
scan.BUILDING = 1
scan.RUNNING = 2
scan.ABORTED = 3
scan.FAILED = 4
scan.FAILED_INIT = 5
scan.SUCCESS = 6

---@alias scanstatescanState
---|`scan.EMPTY`
---|`scan.BUILDING`
---|`scan.RUNNING`
---|`scan.ABORTED`
---|`scan.FAILED`
---|`scan.FAILED_INIT`
---|`scan.SUCCESS`



--- **This function provides the present state of a running background scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the state of the present scan, the scan count, and the step count.The scan count is the number of the present iteration through the scan portion of the trigger model. This number does not increment until the scan begins. Therefore, if the instrument is waiting for an input to trigger a scan start, the scan count represents the previous number of scan iterations. If no scan has begun, the scan count is zero.The step count is the number of times the scan has completed a pass through the channel action portion of the trigger model. This number does not increment until after the action completes. Therefore, if the instrument is waiting for an input to trigger a channel action, the step count represents the previous step. If no step has yet completed, the step count is zero. If the step count has yet to complete the first step in a subsequent pass through a scan, the scan count represents the last step in the previous scan pass.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16254.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.background()
--- scanState, scanCount, stepCount = scan.state()
--- print(scanState, scanCount, stepCount)
--- 
--- --Runs a scan in the background.
--- --Check the present scan state.
--- --View returned values.
--- --Output shows that scan is running:
--- --2.00000e+00
--- ```
---@return scanstatescanState scanState The present state of the scan running in the background. Possible states include
---@return number scanCount The number of scans that have completed
---@return number stepCount The number of steps that have completed
---@return number reading If measurements are made during the scan, this parameter contains the last scan reading completed
function scan.state() end


--- **This attribute returns the number of steps in the present scan.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This is set by the number of steps in the active scan list. The value of this attribute is initially determined when the scan is created. When you add steps with the scan.create(), scan.addimagestep(), and scan.add() functions, the value of this attribute is updated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16255.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(scan.stepcount)
--- 
--- --Responds with the present step count.
--- --Output assuming there are five steps in the scan list:
--- --5.00000e+00
--- ```
scan.stepcount = 0



--- **This function allows you to include multiple channels in a single scan step.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function adds a list of channels to be closed simultaneously in a single step of a scan. An optional DMM configuration can be added to force the scan to take a measurement during the same step.This function is an advanced command; the channelList parameter must specify appropriate relays to support the requested DMM configuration, or an invalid measurement will result.Unlike scan.add(), the paired channels and backplanes necessary for measurement are not automatically added to the step. Use the channel.setpole() command to indicate if the paired channel should be added or not. Backplanes assigned to channels by the channel.setbackplane() command are not added to the image step automatically. For example, if a measurement is taken on a 4-wire ohms configuration without designating 4-pole with the channel.setpole() command, the corresponding paired channels and backplanes will not be added, and the specified dmmConfig will not cause additional relay closures as it normally would.If you have changed the pole setting on any of the channels in the list (using channel.setpole()), an additional paired channel is added or removed, as appropriate. For example, to ensure that the proper channels close to enable a 4-wire measurement, set the pole setting in addition to using the 4-wire ohms DMM configuration.When a DMM configuration (other than "nofunction") is specified, the instrument will take the appropriate measurement based on the function set in the configuration; if no DMM configuration is specified with the command, no measurement will be taken.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16633.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.addimagestep("1101, 2202, 1911", "dcvolts") 
--- scan.addimagestep("1102, 2202, 1911", "dcvolts") 
--- scan.addimagestep ("1103, 2202, 1911","dcvolts")
--- 
--- --Adds three steps with the following actions:
--- --Closes channels 1101, 2202, and 1911, and then makes a dc voltage measurement. Opens channel 1101, closes 1102 and maintains 1911 and 2202 closed, and then makes a dc voltage measurement. Opens channel 1102, closes 1103 and maintains 1911 and 2202 closed, and then makes a dc voltage measur--- ```
---@param channelList string String specifying a list of channels
---@param dmmConfig string String specifying a DMM configuration
---@overload fun(channelList:string)
function scan.addimagestep(channelList, dmmConfig) end


--- **This function adds channels to the scan list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to add channels and channel patterns to the present scan list. If the scan list does not exist, it also creates a scan list. See scan.create() for information about creating a scan list.Channels and channel patterns added using this command are added to the end of the present list (appended) in the same order as specified in the channel list. In addition, the added channels are scanned in the order specified in channelList. Specifying multiple channels adds multiple steps to the scan.The configuration of each channel or channel pattern, which is associated with dmm.setconfig() and dmm.getconfig(), is used unless the optional dmmConfig parameter is specified. Specifying the dmmConfig parameter temporarily overrides the configuration associated with the channel or channel pattern. Specifying dmmConfig does not modify the assigned configuration of a channel or channel pattern.The scan list of channels (or channel patterns) is not updated if an error occurs during processing of the function. However, steps that were already added to the scan list are updated even if an error is detected, because each channel is added as a separate step when you add multiple channels to channelList.For digital I/O or totalizer channels, each created scan step instructs the scan to read the selected channel and then save the value into the specified reading buffer. If you do not specify a reading buffer, the channel is read but the value is not saved.The width parameter is valid for digital I/O type channels. Widths of 1, 2, 3, or 4 are supported. If specified, the scan can read up to four consecutive channels simultaneously, and then saves the resulting value into the specified reading buffer.DAC channels are not supported.Measurement timestamps may vary from channel read timestamps because of the way different channel types generate reading buffer timestamps.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16890.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("3001:3010", "DCV")
--- 
--- --For this example, assume DCV is a previously defined user configuration for dc volts. Clears the old scan list and creates a new scan list with each channel (1 to 10 on slot 3) using DCV as the overriding DMM configuration.
--- scan.add("3001:3010", "2wire")
--- 
--- --For this example, assume 2wire is a previously defined user configuration for 2-wire ohms. Uses 2wire for all 10 channels and adds them to the end of the existing scan list.
--- scan.create("")
--- 
--- --Clears the old scan list and creates a new empty scan list.
--- for chan = 3001, 3010 do
---    scan.add("" .. chan, "DCV")
---    scan.add("" .. chan, "2wire")
--- end
--- 
--- --For this example, assume DCV is a previously defined user dc volts configuration and 2wire is a previously defined user 2-wire ohms configuration. 
--- --Adds channels 3001 through 3010 to the end of the existing scan list. This loops through the channels twice, adding channels to the scan list twice. The first time, it adds DCV for a channel. The second time, it adds 2wire for that channel. The first parameter ("" .. chan) converts the chan number to a string.
--- ```
---@param channelList string String specifying channels to add using normal channel list syntax
---@param dmmConfig string String listing the DMM configuration to use with items in channelList
---@overload fun(channelList:string)
---@overload fun(channelList:string,width:any)
function scan.add(channelList, dmmConfig) end

scan.EMPTY = 0
scan.BUILDING = 1
scan.RUNNING = 2
scan.ABORTED = 3
scan.FAILED = 4
scan.FAILED_INIT = 5
scan.SUCCESS = 6

---@alias scanbackgroundstate
---|`scan.EMPTY`
---|`scan.BUILDING`
---|`scan.RUNNING`
---|`scan.ABORTED`
---|`scan.FAILED`
---|`scan.FAILED_INIT`
---|`scan.SUCCESS`



--- **This function starts a scan and runs the scan in the background.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can also use this function to specify the scanning reading buffer. This reading buffer, if specified, stores the readings and accompanying attributes as specified for the scan. An error is generated if the reading buffer does not exist or the parameter is not a reading buffer.Before using this command, use scan.create() and scan.add() or scan.addimagestep() to set up a scan list.When the scan is run in the background, you must use the scan.state() function to check the status of the scan.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16891.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.background(rbbuff1)
--- 
--- --Runs a scan in the background and stores readings in a buffer named rbbuff1.
--- ```
---@return scanbackgroundstate state The result of scanning
---@return number scanCount This is current number scans completed
---@return number stepCount This is current number steps completed
---@return number reading If measurements are taken during the scan, this parameter contains the last scan reading completed
---@param bufferVar bufferMethods The reading buffer used during scanning to store the readings; if a buffer is not specified, no readings are stored during the scan
---@overload fun():number
---@overload fun():number
function scan.background(bufferVar) end


--- **This function deletes the existing scan list and creates a new list of channels and channel patterns to scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The existing scan list is lost after calling this function.The items in the channel list are scanned in the order listed.Each channel or channel pattern configuration is used unless the optional dmmConfig parameter is specified (see dmm.setconfig() and dmm.getconfig()). Specifying the dmmConfig parameter temporarily overrides the configuration associated with the channel or channel pattern. Specifying dmmConfig does not modify the assigned configuration of a channel or channel pattern.If a forbidden channel is included in a range of channels or slot parameter (such as slot 1), the forbidden channel is ignored and no error is generated. If a forbidden channel is individually specified in the channel list, an error is generated.If an error occurs, the scan list of channels or channel patterns is cleared, even though no new scan list is created.The function scan.reset() clears the list. To clear the scan list without performing a scan reset, send an empty string for the channelList parameter.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16892.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("1001:1010")
--- 
--- --Replaces the active scan list with an empty scan list.
--- --Adds channels 1 through 10 on slot 1. Uses the existing DMM configuration (dmm.setconfig()).
--- scan.create()
--- for chan = 1001, 1010 do
---    scan.add("" .. chan)
--- end
--- 
--- --Replaces the active scan list with an empty scan list.
--- --Loops through channels 1001 to 1010, and then adds 10 channels to the scan list. The parameter ("" .. chan) converts the channel number to a string.
--- --The scan list now has, in order, channels 1 through 10 on slot 1.
--- --Uses the existing DMM configuration (dmm.setconfig()).
--- scan.create("3001:3010", "testDCV")
--- 
--- --For this example, assume testDCV is a previously defined user DC volts configuration.
--- --Clears the old scan list and creates a new scan list with each channel (1 to 10 on slot 3).
--- --Each channel uses the DMM configuration associated with testDCV.
--- scan.create("")
--- for chan = 3001, 3010 do
---    scan.add("" .. chan, "testDCV")
---    scan.add("" .. chan, "test2wire")
--- end
--- 
--- --For this example, assume testDCV is a previously defined user DC volts configuration, and test2wire is a previously defined user 2-wire ohm configuration.
--- --This loops through the channels, adding channels to the scan list. The first time, it adds "testDCV" for a channel. The second time, it adds "test2wire" for that channel. The first parameter ("" .. chan) converts the chan number to a string.
--- --Clears the old scan list and creates a new scan list. 
--- --Loops through channels 3001 to 3010.
--- --Adds channels 3001 through 3010 to the end of the existing scan list.
--- ```
---@param channelList string String specifying channels to add
---@param dmmConfig string The DMM configuration to use with items in the channelList
---@overload fun(channelList:string)
function scan.create(channelList, dmmConfig) end

scan.EMPTY = 0
scan.BUILDING = 1
scan.RUNNING = 2
scan.ABORTED = 3
scan.FAILED = 4
scan.FAILED_INIT = 5
scan.SUCCESS = 6

---@alias scanexecutestate
---|`scan.EMPTY`
---|`scan.BUILDING`
---|`scan.RUNNING`
---|`scan.ABORTED`
---|`scan.FAILED`
---|`scan.FAILED_INIT`
---|`scan.SUCCESS`



--- **This function starts the scan immediately in the foreground with a configured scan list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- In addition to starting and running the scan in immediate mode (not in the background), you can use this function to specify the scanning reading buffer. This reading buffer stores the readings and accompanying attributes as specified for the scan. An error is generated if the reading buffer does not exist or if the parameter is not a reading buffer.Before using this command, use scan.create() and scan.add() or scan.addimagestep() to set up a scan list.Execution runs until the scan is complete or until the abort command is sent. Because this function waits for the scan to complete, the scan.state() function cannot be used to see the current status of scanning.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16893.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.execute(rbBuff1)
--- 
--- --Runs a scan immediately and stores the readings in a reading buffer named rbbuff1.
--- ```
---@return scanexecutestate state The result of scanning
---@return number scanCount The present number of scans completed
---@return number stepCount The present number of steps completed
---@return number reading If measurements are taken during the scan, this parameter contains the last scan reading completed
---@param bufferVar bufferMethods A reading buffer used during scanning to store the readings; if a buffer is not specified, no readings are stored during the scan
---@overload fun():number
function scan.execute(bufferVar) end


--- **This function queries the active scan list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you change a channel or scan attribute for an existing scan list item, the scan list is recreated based on this change. If the scan list cannot be rebuilt, the scan list is lost.To avoid unintentional changes to an existing scan list, configure channel and scan settings before adding or creating a scan or step using the commands scan.add(), scan.addimagestep(), and scan.create().If the scan list is empty, the string "Empty Scan" is returned. Otherwise, the string lists each step in the scan along with its information for step, open, measure configuration, count, and close.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16894.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.setconfig("2020, 2021", "dcvolts")
--- dmm.nplc = 0.5
--- dmm.range = 10
--- dmm.configure.set("DCVSlot2")
--- dmm.setconfig("2016,2017", "DCVSlot2")
--- scan.create("2007,2008,2020,2021,2016,2017")
--- print(scan.list())
--- 
--- --Assume a 3721 in slot 2.
--- --Configure channels 20 and 21 for DC volts on slot 2.
--- --Change the DMM settings for NPLC and range and save those DC volt settings as "DCVSlot2".
--- --Configure channels 16 and 17 for "DCVSlot2" on slot 2.
--- --Populate the scan list with the function scan.create("2007,2008,2020,2021,2016,2017"), then initiate the scan list to be output.
--- --Outputs the existing scan list. For example, an existing scan list may appear as follows:
--- --Init) OPEN...
--- --1) STEP: 2007
--- --CLOSE: 2007
--- --MEASURE: nofunction COUNT: 1
--- --2) STEP: 2008
--- --OPEN: 2007
--- --CLOSE: 2008
--- --MEASURE: nofunction COUNT: 1
--- --3) STEP: 2020
--- --OPEN: 2008
--- --CLOSE: 2020 2911
--- --MEASURE: dcvolts COUNT: 1
--- --4) STEP: 2021
--- --OPEN: 2020 2911
--- --CLOSE: 2021 2921
--- --MEASURE: dcvolts COUNT: 1
--- --5) STEP: 2016
--- --OPEN: 2021 2921
--- --CLOSE: 2016 2911
--- --MEASURE: DCVSlot2 COUNT: 1
--- --6) STEP: 2017
--- --OPEN: 2016
--- --CLOSE: 2017
--- --MEASURE: DCVSlot2 COUNT: 1
--- ```
---@return string scanList A string that lists the existing scan step information
function scan.list() end

scan.MODE_OPEN_ALL = 0
scan.MODE_OPEN_SELECTIVE = 1
scan.MODE_FIXED_ABR = 2

---@alias scanmodescanModeSetting
---|`scan.MODE_OPEN_ALL`
---|`scan.MODE_OPEN_SELECTIVE`
---|`scan.MODE_FIXED_ABR`



--- **This attribute sets the relay action when the scan starts.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to open all, channels on all slots are opened before a scan starts. When this attribute is set to scan.MODE_OPEN_SELECTIVE, an intelligent open is performed. Assuming all steps being scanned have a function value of "nofunction" with their DMM configuration then:If any step has a DMM configuration with a function set to any other value than "nofunction":When this attribute is set to scan.MODE_FIXED_ABR, it is equivalent to setting MODE_OPEN_SELECTIVE, except:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16895.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.mode = scan.MODE_OPEN_SELECTIVE
--- 
--- --Sets the scan mode setting to open channels that are used in the scan.
--- ```
---@type scanmodescanModeSetting
scan.mode = 0



--- **This function resets the trigger model and scan list settings to their factory default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When scan.reset() is sent, the trigger model and scan settings that are reset to the factory defaults are:In addition, the scan list is cleared.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16896.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.reset()
--- 
--- --Performs a reset on the trigger model and scan settings.
--- ```
function scan.reset() end

scan.OFF = 0
scan.ON = 1

---@alias scanbypassbypass
---|`scan.OFF`
---|`scan.ON`



--- **This attribute indicates whether the first channel of the scan waits for the channel stimulus event to be satisfied before closing.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When bypass is set to on and the scan.trigger.arm.stimulus is set to a nonzero value, the first channel of the scan closes (the scan.trigger.channel.stimulus setting is ignored).For other channels (other than the first), the channel stimulus must be satisfied before the channel action takes place.When bypass is set to off, every channel (including the first) must satisfy the scan.trigger.channel.stimulus setting before the channel action occurs for that step.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16973.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.bypass = scan.OFF
--- print(scan.bypass)
--- 
--- --Disables the bypass option for scanning and displays the present bypass state.
--- --Output:
--- --0.000000000e+000
--- ```
---@type scanbypassbypass
scan.bypass = 0



--- **This attribute sets the number of times the scan is repeated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The scan count attribute setting indicates how many times the scan list is iterated through before the scan completes.During a scan, the instrument iterates through the arm layer of the trigger model the specified number of times. After performing the specified number of iterations, the instrument returns to an idle state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16974.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("1001:1009")
--- scan.scancount = 100
--- scan.scaninterval = 1.0 -- delay between scans
--- 
--- --Create a scan that includes channels 1 to 9 of slot 1.
--- --Set the scan count to 100.
--- --Set the delay between scans to 1 s.
--- ```
scan.scancount = 0

---@class schedule
schedule = {}




--- **This function disables all alarms.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the schedule.alarm[N].enable attribute to 0 (schedule.OFF) for each schedule alarm N.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16306.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function schedule.disable() end
---@class scriptVar
scriptVar = {}




--- **This attribute controls the autorun state of a script.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Autorun scripts run automatically when the instrument is turned on. You can set any number of scripts to autorun.The run order for autorun scripts is arbitrary, so make sure the run order is not important.The default value for scriptVar.autorun depends on how the script was loaded. The default is no if the script was loaded with loadscript or script.new(). It is yes for scripts loaded with loadandrunscript or script.newautorun().
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16852.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test5.autorun = "yes"
--- test5.save()
--- 
--- --Assume a script named test5 is in the runtime environment.
--- --The next time the instrument is turned on, test5 script automatically loads and runs.
--- ```
script_object.autorun = 0



--- **This function runs a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scriptVar.run() function runs the script referenced by scriptVar. You can also run the script by using scriptVar().
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test8.run()
--- 
--- --Runs the script referenced by the variable test8.
--- ```
function script_object.run() end


--- **This function saves the script to nonvolatile memory or to a USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scriptVar.save() function saves a script to nonvolatile memory or a USB flash drive. The root folder of the USB flash drive has the absolute path /usb1/.If no filename is specified (the file name parameter is an empty string), the script is saved to internal nonvolatile memory. Only a script with filename defined can be saved to internal nonvolatile memory. If a filename is given, the script is saved to the USB flash drive.You can add the file extension, but it is not required. The only allowed extension is .tsp (see Example 2).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16863.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test8.save()
--- 
--- --Saves the script referenced by the variable test8 to nonvolatile memory.
--- test8.save("/usb1/myScript.tsp")
--- 
--- --Saves the script referenced by the variable test8 to a file named myScript.tsp on your USB flash drive.
--- ```
---@param filename string A string that contains the file name to use when saving the script to a USB flash drive
---@overload fun()
function script_object.save(filename) end


--- **This attribute contains the source code of a script.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The loadscript or loadandrunscript and endscript keywords are not included in the source code. The body of the script is a single string with lines separated by the new line character.The instrument automatically stores the source for all scripts that are loaded on the instrument. To free up memory or to obfuscate the code, assign nil to the source attribute of the script. Although this attribute is writable, it can only be set to the nil value.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16867.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test7 = script.new("display.clear() display.settext('Hello from my test')", "")
--- print(test7.source)
--- 
--- --This example creates a script called test7 that displays a message on the front panel and retrieves the source code.
--- --Output:
--- --display.clear() display.settext('Hello from my test')
--- ```
script_object.source = 0



--- **This function generates a script listing.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates output in the form of a sequence of response messages (one message for each line of the script). It also generates output of the script control messages (loadscript or loadandrunscript and endscript).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17785.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test7 = script.new("display.clear() display.settext('Hello from my test')",    "test7")
--- test7()
--- test7.save()
--- test7.list()
--- 
--- --The above example code creates a script named test7 that displays text on the front panel and lists the script with the following output:
--- --loadscript test7
--- --display.clear() display.settext("Hello from my test")
--- --endscript
--- ```
function script_object.list() end


--- **This attribute contains the name of a script in the runtime environment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When setting the script name, this attribute renames the script that the variable scriptVar references.This attribute must be either a valid Lua identifier or the empty string. Changing the name of a script changes the index that is used to access the script in the script.user.scripts table. Setting the attribute to an empty string removes the script from the table completely, and the script becomes an unnamed script.As long as there are variables referencing an unnamed script, the script can be accessed through those variables. When all variables that reference an unnamed script are removed, the script is removed from the runtime environment.If the new name is the same as a name that is already used for another script, the name of the other script is set to an empty string, and that script becomes unnamed. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/2589.htm"])
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
--- 
--- --This example calls the script.new() function to create a script with no name, runs the script, names the script test7, and then saves the script in nonvolatile memory.
--- ```
script_object.name = 0

---@class comm
comm = {}


---@class os
os = {}




--- **This function generates a time value in UTC time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The timespec is a table using the fields listed in the table below.If the time (hour, minute, and second) options are not used, they default to noon for that day. When called without a parameter (the first form), the function returns the current time.Set the time zone before calling the os.time() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/25959.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- systemTime = os.time({year = 2019,
---        month = 3,
---        day = 31,
---        hour = 14,
---        min = 25})
--- settime(systemTime)
--- 
--- --Sets the date and time to Mar 31, 2019 at 2:25 pm.
--- ```
---@return any utcTime Time value in UTC time
---@param timespec any The date and time (year, month, day, hour, and minute)
---@overload fun():any
function os.time(timespec) end
---@type slotArr[]
slotArr.endchannel = {}




--- **These attributes indicates whether or not the channel in the selected slot supports a feature and if so, which channels support the feature.Channel supports amperage measurements**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the ending channel.If only one channel in the card supports the feature, the ending channel matches the starting channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13721.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " .. slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..               slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " .. slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end    
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " .. slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " .. slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end     
---       if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end      
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.endchannel.amps= 0



--- **These attributes indicates whether or not the channel in the selected slot supports a feature and if so, which channels support the feature.Channel supports a digital analog output (DAC)**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the ending channel.If only one channel in the card supports the feature, the ending channel matches the starting channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13721.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " .. slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..               slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " .. slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end    
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " .. slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " .. slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end     
---       if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end      
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.endchannel.analogoutput= 0



--- **These attributes indicates whether or not the channel in the selected slot supports a feature and if so, which channels support the feature.Channel supports digital inputs and outputs**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the ending channel.If only one channel in the card supports the feature, the ending channel matches the starting channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13721.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " .. slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..               slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " .. slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end    
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " .. slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " .. slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end     
---       if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end      
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.endchannel.digitalio= 0



--- **These attributes indicates whether or not the channel in the selected slot supports a feature and if so, which channels support the feature.Channel supports isolated channels**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the ending channel.If only one channel in the card supports the feature, the ending channel matches the starting channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13721.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " .. slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..               slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " .. slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end    
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " .. slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " .. slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end     
---       if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end      
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.endchannel.isolated= 0



--- **These attributes indicates whether or not the channel in the selected slot supports a feature and if so, which channels support the feature.Channel supports totalizer channels**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the ending channel.If only one channel in the card supports the feature, the ending channel matches the starting channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13721.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " .. slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..               slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " .. slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end    
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " .. slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " .. slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end     
---       if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end      
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.endchannel.totalizer= 0



--- **These attributes indicates whether or not the channel in the selected slot supports a feature and if so, which channels support the feature.Channel supports voltage or two-wire measurements**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the ending channel.If only one channel in the card supports the feature, the ending channel matches the starting channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13721.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " .. slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..               slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " .. slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end    
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " .. slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " .. slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end     
---       if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end      
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.endchannel.voltage= 0

---@type slotArr[]
slotArr.startchannel = {}




--- **These attributes indicates whether or not the channel in the specified slot supports a feature and if so, which channels support the feature.Channel supports amperage measurements**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- value = slot[slot].startchannel.ampsvalue = slot[slot].startchannel.analogoutputvalue = slot[slot].startchannel.digitaliovalue = slot[slot].startchannel.isolatedvalue = slot[slot].startchannel.totalizervalue = slot[slot].startchannel.voltageThis attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped on the cards by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the starting channel.If only one channel in the card supports the feature, the starting channel will match the ending channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " ..             slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..             slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " ..             slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end      
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " ..             slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " ..             slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end   
---          if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end     
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.startchannel.amps= 0



--- **These attributes indicates whether or not the channel in the specified slot supports a feature and if so, which channels support the feature.Channel supports a digital analog output (DAC)**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- value = slot[slot].startchannel.ampsvalue = slot[slot].startchannel.analogoutputvalue = slot[slot].startchannel.digitaliovalue = slot[slot].startchannel.isolatedvalue = slot[slot].startchannel.totalizervalue = slot[slot].startchannel.voltageThis attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped on the cards by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the starting channel.If only one channel in the card supports the feature, the starting channel will match the ending channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " ..             slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..             slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " ..             slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end      
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " ..             slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " ..             slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end   
---          if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end     
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.startchannel.analogoutput= 0



--- **These attributes indicates whether or not the channel in the specified slot supports a feature and if so, which channels support the feature.Channel supports digital inputs and outputs**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- value = slot[slot].startchannel.ampsvalue = slot[slot].startchannel.analogoutputvalue = slot[slot].startchannel.digitaliovalue = slot[slot].startchannel.isolatedvalue = slot[slot].startchannel.totalizervalue = slot[slot].startchannel.voltageThis attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped on the cards by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the starting channel.If only one channel in the card supports the feature, the starting channel will match the ending channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " ..             slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..             slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " ..             slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end      
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " ..             slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " ..             slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end   
---          if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end     
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.startchannel.digitalio= 0



--- **These attributes indicates whether or not the channel in the specified slot supports a feature and if so, which channels support the feature.Channel supports isolated channels**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- value = slot[slot].startchannel.ampsvalue = slot[slot].startchannel.analogoutputvalue = slot[slot].startchannel.digitaliovalue = slot[slot].startchannel.isolatedvalue = slot[slot].startchannel.totalizervalue = slot[slot].startchannel.voltageThis attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped on the cards by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the starting channel.If only one channel in the card supports the feature, the starting channel will match the ending channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " ..             slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..             slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " ..             slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end      
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " ..             slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " ..             slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end   
---          if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end     
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.startchannel.isolated= 0



--- **These attributes indicates whether or not the channel in the specified slot supports a feature and if so, which channels support the feature.Channel supports totalizer channels**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- value = slot[slot].startchannel.ampsvalue = slot[slot].startchannel.analogoutputvalue = slot[slot].startchannel.digitaliovalue = slot[slot].startchannel.isolatedvalue = slot[slot].startchannel.totalizervalue = slot[slot].startchannel.voltageThis attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped on the cards by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the starting channel.If only one channel in the card supports the feature, the starting channel will match the ending channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " ..             slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..             slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " ..             slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end      
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " ..             slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " ..             slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end   
---          if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end     
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.startchannel.totalizer= 0



--- **These attributes indicates whether or not the channel in the specified slot supports a feature and if so, which channels support the feature.Channel supports voltage or two-wire measurements**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- value = slot[slot].startchannel.ampsvalue = slot[slot].startchannel.analogoutputvalue = slot[slot].startchannel.digitaliovalue = slot[slot].startchannel.isolatedvalue = slot[slot].startchannel.totalizervalue = slot[slot].startchannel.voltageThis attribute is only available for a slot if the installed card supports the selected feature. If the attribute is not available, the return value is nil.Channels are grouped on the cards by feature sets, so you can use the start and ending channel numbers to identify a group of channels that supports a particular feature. If the card supports the feature, the returned value is the number of the starting channel.If only one channel in the card supports the feature, the starting channel will match the ending channel number.The commands support different types of channels:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- CardChannels = function(SlotNumber)   
---    if slot[SlotNumber].idn == "Empty Slot" then   
---       print("   Slot is Empty")   
---    else   
---       if (slot[SlotNumber].startchannel.voltage == nil) and            (slot[SlotNumber].endchannel.voltage == nil) then   
---          print("   no voltage channels")   
---       else    
---          print("   Start voltage channel is " ..             slot[SlotNumber].startchannel.voltage)    
---          print("   End voltage channel is " .. slot[SlotNumber].endchannel.voltage)    
---       end     
---       if (slot[SlotNumber].startchannel.amps == nil) and             (slot[SlotNumber].endchannel.amps == nil) then   
---          print("   no amp channels")   
---       else    
---          print("   Start amp channel is " .. slot[SlotNumber].startchannel.amps)    
---          print("   End amp channel is " .. slot[SlotNumber].endchannel.amps)    
---       end     
---       if (slot[SlotNumber].digio == 1) then    
---          print("   Start digital i/o channel is " ..             slot[SlotNumber].startchannel.digitalio)    
---          print("   End digital i/o channel is " ..             slot[SlotNumber].endchannel.digitalio)    
---       else   
---          print("   no digio channels")   
---       end      
---       if (slot[SlotNumber].totalizer == 1) then    
---          print("   Start totalizer channel is " ..             slot[SlotNumber].startchannel.totalizer)    
---          print("   End totalizer channel is " ..             slot[SlotNumber].endchannel.totalizer)   
---       else   
---          print("   no totalizer channels")    
---       end   
---          if (slot[SlotNumber].startchannel.analogoutput == nil) and             (slot[SlotNumber].endchannel.analogoutput == nil) then   
---          print("   no analog output channels")   
---       else    
---          print("   Start analog output channel is " ..             slot[SlotNumber].startchannel.analogoutput)    
---          print("   End analog output channel is " ..             slot[SlotNumber].endchannel.analogoutput)    
---       end     
---       if (slot[SlotNumber].matrix == 1) then   
---          print("   Channels on card are matrix type")   
---       end   
---    end   
--- end    
--- for x = 1,6 do   
---    print("Checking card channels in slot " .. x)   
---    CardChannels(x)   
--- end  
--- 
--- --If the Series 3700A contains the following cards:
--- --Slot 1: 3732Slot 2: 3720Slot 3: 3750Slot 4: EmptySlot 5: 3721Slot 6: EmptyThe output of this example is similar to:
--- --Checking card channels in slot 1
--- --   no voltage channels
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --   Channels on card are matrix type
--- --Checking card channels in slot 2
--- --   Start voltage channel is 1
--- --   End voltage channel is 60
--- --   no amp channels
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 3
--- --   no voltage channels
--- --   no amp channels
--- --   Start digital i/o channel is 1
--- --   End digital i/o channel is 5
--- --   Start totalizer channel is 6
--- --   End totalizer channel is 9
--- --   Start analog output channel is 10
--- --   End analog output channel is 11
--- --Checking card channels in slot 4
--- --   Slot is Empty
--- --Checking card channels in slot 5
--- --   Start voltage channel is 1
--- --   End voltage channel is 40
--- --   Start amp channel is 41
--- --   End amp channel is 42
--- --   no digio channels
--- --   no totalizer channels
--- --   no analog output channels
--- --Checking card channels in slot 6
--- --   Slot is Empty
--- ```
slotArr.startchannel.voltage= 0

---@class channel.calibration
channel.calibration = {}




--- **This function gets the number of times that a card has been adjusted.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command can be used with channels that are locked or unlocked. If no channelList is provided, the currently unlocked channels are assumed.There is only one adjustment count per card. Therefore, with no channel unlocked, the only acceptable values for channelList are "slot1", "slot2", and so on. An error is generated if any other values are used.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13975.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- Count = channel.calibration.adjustcount("slot1")
--- print(Count)
--- 
--- --Assign the number of times the card in slot 1 has been adjusted to a user variable named Count.
--- --Output the value.
--- --3
--- --This shows that the instrument has been adjusted 3 times.
--- ```
---@return number count Return value representing the number of times the instrument has been adjusted
function channel.calibration.adjustcount(slotX) end


--- **This function sets or gets the adjustment date in UTC format (number of seconds since January 1, 1970) on the unlocked channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command can get the adjust date whether calibration is currently locked or unlocked. If the channelList parameter is not specified, it uses the currently unlocked card. This command can only set the adjustment date on a previously unlocked card. The date is not permanently saved until the channel.calibration.save() command is sent.There is only one adjustment date per card. Therefore, the only acceptable values for channelList are slotX. An error is generated if any other values are used.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13979.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- adjustmentDate = channel.calibration.adjustdate("slot2")
--- 
--- --Gets the adjustment date for the card in slot 2.
--- NewAdjustDate = os.time{year=2010, month=12, day=28, hour=17, min=35, sec=0}
--- channel.calibration.unlock("slot5", "KI3706")
--- myDate = channel.calibration.adjustdate("slot5", NewAdjustDate)
--- channel.calibration.save()
--- channel.calibration.lock()
--- print(os.date("%c", myDate))
--- 
--- --Assign the UTC time for December 28, 2010 at 17:35:00 GMT to NewAdjustDate.
--- --Unlock the calibration for the card in slot 5, assuming the default password.
--- --Set the adjustment date using NewAdjustDate for the card in slot 5.
--- --Save the adjustment date on the card on slot 5.
--- --Lock the calibration for the card in slot 5.
--- --View the date for myDate.
--- ```
---@return any returnDate The adjustment date in UTC format
---@param date any The date of the adjustment (UTC formatted)
---@overload fun():any
function channel.calibration.adjustdate(slotX, date) end


--- **This function saves the calibration data to the card.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Only one card can be calibrated at a time. Therefore, channel.calibration.save() works only on the presently unlocked card. An error is generated if this command is issued when calibration is already locked. The system must receive this command before the channel.calibration.lock() command or the calibration data will be lost. This command saves the present values of the calibration constants and calibration date, and increases the calibration count by one, regardless of errors in the data. You should not issue channel.calibration.save() unless the calibration procedure was performed with no errors.If no calibration date was specified using either channel.calibration.adjustdate() or channel.calibration.verifydate(), the date is automatically assigned based on the system date.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13980.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.calibration.unlock("slot1","KI3706")
--- -- Perform operations to generate the calibration data
--- channel.calibration.save()
--- channel.calibration.lock()
--- 
--- --Unlock the card calibration for slot 1 using the default password.
--- --Use the channel.calibration.step command to generate the calibration data.
--- --Save the calibration data for the card in slot 1, if no errors occurred while generating the calibration data.
--- --Lock the calibration data for the card in slot 1.
--- ```
function channel.calibration.save() end


--- **This function prevents further calibration on the currently unlocked card.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Calibration data is locked during normal operation. To perform calibration, calibration must be unlocked (channel.calibration.unlock()) for the card.Only one card can be calibrated at a time. Therefore, channel.calibration.lock() works only on the currently unlocked card. Once locked, you must unlock calibration to perform it again.This command locks calibration on the card being calibrated, but does not save calibration data.  An error is generated if this command is issued when calibration is already locked.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14487.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.calibration.unlock("slot1","KI3706")
--- -- Perform operations to generate the calibration data
--- channel.calibration.save()
--- channel.calibration.lock()
--- 
--- --Unlock the card calibration for slot 1 using the default password.
--- --Use the channel.calibration.step command to generate the calibration data.
--- --Save the calibration data for the card in slot 1, if no errors occurred while generating the calibration data.
--- --Lock the calibration data for the card in slot 1.
--- ```
function channel.calibration.lock() end


--- **This function unlocks calibration functionality for a card so that calibration operations can be performed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Calibration data is locked during normal operation. This command enables calibration functionality.  When calibration is completed, calibration functionality must once again be locked (channel.calibration.lock()). Only one card at a time may be unlocked.There is only one password per card. Therefore, the only acceptable values for channel list are "slot1", "slot2", and so on. Otherwise, an error is generated.An error is generated if the password that is entered does not match the one that was saved with channel.calibration.password().The password can only contain six case-sensitive, alphanumeric characters.The default password from the factory is KI3706.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14488.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.calibration.unlock("slot1","KI3706")
--- -- Perform operations to generate the calibration data
--- channel.calibration.save()
--- channel.calibration.lock()
--- 
--- --Unlock the channel.
--- --Save the calibration settings.
--- --Lock the channel.
--- ```
---@param password string The password that unlocks calibration
function channel.calibration.unlock(slotX, password) end


--- **This function gets or sets the date the calibration was verified in UTC format (number of seconds since January 1, 1970).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command gets the verification date whether calibration is presently locked or unlocked. If the slot is not defined, the unlocked channel is assumed.This command can only set the verification date on a previously unlocked card. The date is not permanently saved until channel.calibration.save() is issued.There is only one verification date per card. If more than one slot is defined, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14500.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.calibration.unlock("slot1", "KI3706")
--- print(channel.calibration.verifydate(os.time{year=2010, month=8, day=5}))
--- channel.calibration.save()
--- channel.calibration.lock()
--- print(os.date("%m/%d/%Y", channel.calibration.verifydate("slot1")))
--- 
--- --Unlock the calibration for the card in slot 1 using the default password.
--- --Set the verify calibration date to August 5, 2010.
--- --Get the newly set verification date in a user-readable format.
--- --Save the new verification date.
--- --Lock the calibration.
--- --Output:
--- --1281009600
--- --08/05/2010
--- ```
---@return any returnDate The verification date returned from the function call
---@param date any UTC formatted date to which to set the calibration verification date
---@overload fun():any
function channel.calibration.verifydate(slotX, date) end


--- **This function sets the password needed to unlock the calibration functionality of a card.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There is only one password per card. Therefore, channel.calibration.password() works only on the currently unlocked card.Make note of the password, because there is no command to query for the password once it has been set on the instrument. The password is not permanently saved until the channel.calibration.save() command is sent. Passwords are alphanumeric and case-sensitive.This command generates an error if calibration is locked or if the password string length is greater than six characters.The default password from the factory is KI3706.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14506.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.calibration.unlock("slot3","KI3706")
--- channel.calibration.password("Unlock")
--- channel.calibration.save()
--- channel.calibration.lock()
---  
--- 
--- --Unlock the calibration for the card in slot 3, assuming the default password is still valid.
--- --Set the password to "Unlock" for the card in slot 3.
--- --Save the password for the card in slot 3 for subsequent unlocks.
--- --Lock the calibration for the card in slot 3.
--- ```
---@param password string A string of characters that contain the password
function channel.calibration.password(password) end


--- **This function sends a calibration command.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The specified channel must be on the unlocked slot. Only DAC and totalizer channels can be calibrated. It is best to calibrate a single channel sequentially to completion before changing channels.The card assumes that the given voltage or current value is exactly what it is sourcing for the given step. This command generates an error if the step is out of sequence, does not exist, or the calibration is locked. Also, an error is generated if the calibration step does not complete successfully, if the value passed is invalid or out of range for the step, or not needed.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14508.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@param channel any The channel to be calibrated
---@param step number The number corresponding to the specified step
---@param value number The measured value for the specified step when the step value is even
---@overload fun(channel:any,step:number)
function channel.calibration.step(channel, step, value) end
---@class tspnet.tsp
tspnet.tsp = {}




--- **This function causes the TSP-enabled instrument to stop executing any of the commands that were sent to it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.Sends an abort command to the remote instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14085.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abort(testConnection)
--- 
--- --Stops remote instrument execution on testConnection.
--- ```
---@param connectionID tspnetConnectionID Integer value used as a handle for other tspnet commands
function tspnet.tsp.abort(connectionID) end


--- **This attribute contains the setting for abort on connect to a TSP-enabled instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting determines if the instrument sends an abort message when it attempts to connect to a TSP‑enabled instrument using the tspnet.connect() function.When you send the abort command on an interface, it causes any other active interface on that instrument to close. If you do not send an abort command (or if tspnet.tsp.abortonconnect is set to 0) and another interface is active, connecting to a TSP‑enabled remote instrument results in a connection. However, the instrument does not respond to subsequent reads or executes because control of the instrument is not obtained until an abort command has been sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14086.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abortonconnect = 0
--- 
--- --Configure the instrument so that it does not send an abort command when connecting to a TSP‑enabled instrument.
--- ```
tspnet.tsp.abortonconnect = 0



--- **This function copies a reading buffer synchronous table from a remote instrument to a TSP-enabled instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is only appropriate for TSP-enabled instruments.This function reads the data from a reading buffer on a remote instrument and returns an array of numbers or a string representing the data. The startIndex and endIndex parameters specify the portion of the reading buffer to read. If no index is specified, the entire buffer is copied. The function returns a table if the table is an array of numbers; otherwise a comma‑delimited string is returned.This command is limited to transferring 50,000 readings at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14090.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- times = tspnet.tsp.rbtablecopy(testTspdevice,
---    "testRemotebuffername.timestamps", 1, 3)
--- print(times)
--- 
--- --Copy the specified timestamps table for items 1 through 3, then display the table. Example output:
--- --01/01/2011 10:10:10.0000013,01/01/2011 10:10:10.0000233,01/01/2011 10:10:10.0000576
--- ```
---@return table table A copy of the synchronous table or a string
---@param connectionID tspnetConnectionID Integer value used as a handle for other tspnet commands
---@param name string The full name of the reading buffer name and synchronous table to copy
---@param startIndex number Integer start value
---@param endPointIndex any Integer end value
---@overload fun(connectionID:tspnetConnectionID,name:string):table
function tspnet.tsp.rbtablecopy(connectionID, name, startIndex, endPointIndex) end


--- **This function loads and runs a script on a remote TSP-enabled instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.This function downloads a script to a remote instrument and runs it. It automatically adds the appropriate loadscript and endscript commands around the script, captures any errors, and reads back any prompts. No additional substitutions are done on the text.The script is automatically loaded, compiled, and run.Any output from previous commands is discarded.This command does not wait for the script to complete.If you do not want the script to do anything immediately, make sure the script only defines functions for later use. Use the tspnet.execute() function to execute those functions later.If no name is specified, the script is loaded as the anonymous script.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15280.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.runscript(myconnection, "mytest",
--- "print([[start]]) for d = 1, 10 do print([[work]]) end print([[end]])")
--- 
--- --Load and run a script entitled mytest on the TSP‑enabled instrument connected with myconnection.
--- ```
---@param connectionID tspnetConnectionID Integer value used as an identifier for other tspnet commands
---@param name string The name that is assigned to the script
---@param script string The body of the script as a string
---@overload fun(connectionID:tspnetConnectionID,script:string)
function tspnet.tsp.runscript(connectionID, name, script) end
---@class digiotriggerArr
digiotriggerArr = {}

---@type digiotriggerArr[]
digio.trigger = {}




--- **This function asserts a trigger pulse on one of the digital I/O lines. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The pulse width that is set determines how long the instrument asserts the trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14670.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].assert()
--- 
--- --Asserts a trigger on digital I/O line 2.
--- ```
function digiotriggerArr.assert() end



--- **This function clears the trigger event on a digital I/O line. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event detector of a trigger enters the detected state when an event is detected. It is cleared when digio.trigger[N].wait() or digio.trigger[N].clear() is called.digio.trigger[N].clear() clears the event detector of the specified trigger line, discards the history of the trigger line, and clears the digio.trigger[N].overrun attribute.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14671.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].clear()
--- 
--- --Clears the trigger event detector on I/O line 2.
--- ```
function digiotriggerArr.clear() end



--- **This constant identifies the trigger event generated by the digital I/O line N. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- To have another trigger object respond to trigger events generated by the trigger line, set the stimulus attribute of the other object to the value of this constant.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14672.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[5].stimulus = digio.trigger[3].EVENT_ID
--- 
--- --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for digital I/O trigger line 5.
--- scan.trigger.arm.stimulus = digio.trigger[3].EVENT_ID
--- 
--- --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for starting a scan.
--- ```
digiotriggerArr.EVENT_ID= 0



--- **This attribute sets the mode in which the trigger event detector and the output trigger generator operate on the given trigger line. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set triggerMode to one of the following values:When programmed to any mode except digio.TRIG_BYPASS, the output state of the I/O line is controlled by the trigger logic, and the user‑specified output state of the line is ignored.Use of either digio.TRIG_SYNCHRONOUSA or digio.TRIG_SYNCHRONOUSM is preferred over digio.TRIG_SYNCHRONOUS, because digio.TRIG_SYNCHRONOUS is provided for compatibility with the digital I/O and TSP-Link triggering on other Keithley Instruments products.To control the line state, set the mode to digio.TRIG_BYPASS and use the digio.writebit() and digio.writeport() commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14674.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].mode = 2
--- 
--- --Sets the trigger mode for I/O line 4 to digio.TRIG_RISING.
--- ```
digiotriggerArr.mode= 0



--- **This attribute returns the event detector overrun status. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14675.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = digio.trigger[1].overrun
--- print(overrun)
--- 
--- --If there is no trigger overrun, the following text is output:
--- --false
--- ```
digiotriggerArr.overrun= 0



--- **This function releases an indefinite length or latched trigger. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulsewidth time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14677.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].release()
--- 
--- --Releases digital I/O trigger line 4.
--- ```
function digiotriggerArr.release() end



--- **This function waits for a trigger. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses trigger operation up to the seconds set by timeout for an input trigger. If one or more trigger events are detected since the last time digio.trigger[N].wait() or digio.trigger[N].clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and ready to detect the next trigger. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14679.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = digio.trigger[4].wait(3)
--- print(triggered)
--- 
--- --Waits up to three seconds for a trigger to be detected on trigger line 4, then outputs the results.
--- --Output if no trigger is detected:
--- --false
--- --Output if a trigger is detected:
--- --true
--- ```
---@return any triggered The value is true if a trigger is detected, or false if no triggers are detected during the timeout period
---@param timeout any Timeout in seconds
function digiotriggerArr.wait(timeout) end



--- **This attribute describes the length of time that the trigger line is asserted for output triggers. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely. To release the trigger line, use digio.trigger[N].release().
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17691.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].pulsewidth = 20e-6
--- 
--- --Sets the pulse width for trigger line 4 to 20 μs.
--- ```
digiotriggerArr.pulsewidth= 0



--- **This function resets trigger values to their factory defaults. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the following attributes to factory default settings:It also clears digio.trigger[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17719.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].mode = 2
--- digio.trigger[3].pulsewidth = 50e-6
--- digio.trigger[3].stimulus = digio.trigger[5].EVENT_ID
--- print(digio.trigger[3].mode, digio.trigger[3].pulsewidth, digio.trigger[3].stimulus)
--- digio.trigger[3].reset()
--- print(digio.trigger[3].mode, digio.trigger[3].pulsewidth, digio.trigger[3].stimulus)
--- 
--- --Set the digital I/O trigger line 3 for a falling edge with a pulsewidth of 50 µs.
--- --Use digital I/O line 5 to trigger the event on line 3.
--- --Reset the line back to factory default values.
--- --Output before reset:
--- --2.00000e+00        5.00000e-05        5.00000e+00
--- --Output after reset:
--- --0.00000e+00        1.00000e-05        0.00000e+00
--- ```
function digiotriggerArr.reset() end



--- **This attribute selects the event that causes a trigger to be asserted on the digital output line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to zero (0) to disable the automatic trigger output.Do not use the stimulus attribute for generating output triggers under script control. Use digio.trigger[N].assert() instead.The trigger stimulus for a digital I/O line may be set to one of the trigger event IDs, described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20596.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].stimulus = 0
--- 
--- --Clear the trigger stimulus of digital I/O line 3.
--- digio.trigger[3].stimulus = scan.trigger.EVENT_CHANNEL_READY
--- 
--- --Set the trigger stimulus of digital I/O line 3 to be the channel ready event during a scan.
--- ```
---@type eventID|0
digiotriggerArr.stimulus= 0

---@class display.loadmenu
display.loadmenu = {}




--- **This function creates an iterator for the user menu items accessed using the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Each time through the loop, displayName and code take on the values in the USER TESTS menu.The instrument goes through the list in random order.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14705.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for displayName, code in display.loadmenu.catalog() do
---    print(displayName, code)
--- end
--- 
--- --Output:
--- --Test DUT1() beeper.beep(2, 500)
--- --Part1 testpart([[Part1]], 5.0)
--- --Test9 Test9()
--- ```
---@overload fun()
function display.loadmenu.catalog() end


--- **This function removes an entry from the USER TESTS menu, which can be accessed using the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you delete an entry from the USER TESTS menu, you can no longer run it by pressing the LOAD key.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14706.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.delete("Test9")
--- for displayName, code in display.loadmenu.catalog() do
---    print(displayName, code)
--- end
--- 
--- --Deletes the entry named Test9.
--- --Output:
--- --Test   DUT1() beeper.beep(2, 500)
--- --Part1   testpart([[Part1]], 5.0)
--- ```
---@param displayName string The name to be deleted from the USER TESTS menu
function display.loadmenu.delete(displayName) end

display.DONT_SAVE = nil
display.SAVE = nil

---@alias displayloadmenuaddmemory
---|`display.DONT_SAVE`
---|`display.SAVE`



--- **This function adds an entry to the USER TESTS menu, which can be accessed by pressing the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After adding code to the load menu, you can run it from the front panel by pressing the LOAD key, then selecting USER to select from the available code to load. Pressing the RUN key then runs the script.You can add items in any order. They are always displayed in alphabetical order when the menu is selected.Any Lua code can be included in the code parameter. If memory is set to display.SAVE, the entry (name and code) is saved in nonvolatile memory. Scripts, functions, and variables used in the code are not saved by display.SAVE. Functions and variables need to be saved with the code. If the code is not saved in nonvolatile memory, it is lost when the Series 3700A is turned off. See Example 2 below.If you do not make a selection for memory, the code is automatically saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/19382.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.add("Test9", "Test9()")
--- 
--- --Assume a user script named Test9 is loaded into the runtime environment. Adds the menu entry to the USER TESTS menu to run the script after loading.
--- display.loadmenu.add("Test", "DUT1() beeper.beep(2, 500)", display.SAVE)
--- 
--- --Assume a script with a function named “DUT1” is loaded into the instrument, and the script has not been saved in nonvolatile memory.
--- --Now assume you want to add a test named “Test” to the USER TESTS menu. You want the test to run the function named DUT1 and sound the beeper. This example adds Test to the menu, defines the code, and then saves the displayName and code in nonvolatile memory.
--- --When Test is run from the front panel USER TESTS menu, the function named DUT1 executes and the beeper beeps for two seconds.
--- --Now assume you turn off instrument power. Because the script was not saved in nonvolatile memory, the function named DUT1 is lost when you turn the instrument on. When Test is run again from the front panel, an error is generated because DUT1 no longer exists in the instrument as a function.
--- display.loadmenu.add("Part1", "testpart([[Part1]], 5.0)", display.SAVE)
--- 
--- --Adds an entry called Part1 to the front‑panel USER TESTS load menu for the code testpart([[Part1]], 5.0) and saves it in nonvolatile memory.
--- ```
---@param displayName string The name that is added to the USER TESTS menu
---@param code string The code that is run from the USER TESTS menu
---@param memory displayloadmenuaddmemory Determines if code is saved to nonvolatile memory
---@overload fun(displayName:string,code:string)
function display.loadmenu.add(displayName, code, memory) end
---@class display.trigger
display.trigger = {}




--- **This constant is the event ID of the event generated when the front‑panel TRIG key is pressed.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to front-panel trigger key events.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14716.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.stimulus = display.trigger.EVENT_ID
--- 
--- --Have the channel action of the trigger model be paced by a user pressing the front‑panel TRIG key.
--- ```
---@type eventID
display.trigger.EVENT_ID= nil
---@class lan.config
lan.config = {}




--- **This attribute contains the LAN default gateway address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the default gateway IP address to use when manual or DLLA configuration methods are used to configure the LAN. If DHCP is enabled, this setting is ignored.This attribute does not indicate the actual setting that is presently in effect. Use the lan.status.gateway attribute to determine the present operating state of the LAN.The IP address must be formatted in four groups of numbers, each separated by a decimal.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14904.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.gateway)
--- 
--- --Outputs the default gateway address. For example, you might see the output:
--- --192.168.0.1
--- ```
lan.config.gateway = 0



--- **This command specifies the LAN IP address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the LAN IP address to use when the LAN is configured using the manual configuration method. This setting is ignored when DLLA or DHCP is used. This attribute does not indicate the actual setting that is presently in effect. Use the lan.status.ipaddress attribute to determine the present operating state of the LAN.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14905.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ipaddress = lan.config.ipaddress
--- 
--- --Retrieves the presently set LAN IP address.
--- ```
lan.config.ipaddress = 0


lan.AUTO = nil
lan.MANUAL = nil

---@alias lanconfigmethodmethod
---|`lan.AUTO`
---|`lan.MANUAL`



--- **This attribute contains the LAN settings configuration method.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls how the LAN IP address, subnet mask, default gateway address, and DNS server addresses are determined.When method is lan.AUTO, the instrument first attempts to configure the LAN settings using dynamic host configuration protocol (DHCP). If DHCP fails, it tries dynamic link local addressing (DLLA). If DLLA fails, it uses the manually specified settings.When method is lan.MANUAL, only the manually specified settings are used. Neither DHCP nor DLLA are attempted.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14906.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.method)
--- 
--- --Outputs the present method.
--- --For example:
--- --1.00000e+00
--- ```
---@type lanconfigmethodmethod
lan.config.method = 0



--- **This attribute contains the LAN subnet mask.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the LAN subnet mask that is used when the manual configuration method is used to configure the LAN. This setting is ignored when DLLA or DHCP is used.This attribute does not indicate the actual setting presently in effect. Use the lan.status.subnetmask attribute to determine the present operating state of the LAN.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14908.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.subnetmask)
--- 
--- --Outputs the LAN subnet mask, such as:
--- --255.255.255.0
--- ```
lan.config.subnetmask = 0

---@class lan.status
lan.status = {}



lan.HALF = nil
lan.FULL = nil

---@alias lanstatusduplexduplex
---|`lan.HALF`
---|`lan.FULL`



--- **This attribute contains the duplex mode presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14911.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.duplex)
--- 
--- --Outputs the present LAN duplex mode, such as:
--- --1.00000e+00
--- ```
---@type lanstatusduplexduplex
lan.status.duplex = 0



--- **This attribute contains the gateway address presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The value of gatewayAddress is a string that indicates the IP address of the gateway in dotted decimal notation.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14912.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.gateway)
--- 
--- --Outputs the gateway address, such as:
--- --192.168.0.1
--- ```
lan.status.gateway = 0



--- **This attribute contains the LAN IP address presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The IP address is a character string that represents the IP address assigned to the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14913.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.ipaddress)
--- 
--- --Outputs the LAN IP address currently in use, such as:
--- --192.168.0.2
--- ```
lan.status.ipaddress = 0



--- **This attribute contains the LAN MAC address.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The MAC address is a character string representing the MAC address of the instrument in hexadecimal notation. The string includes colons that separate the address octets (see Example).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14914.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.macaddress)
--- 
--- --Outputs the MAC address of the instrument, for example:
--- --08:00:11:00:00:57
--- ```
lan.status.macaddress = 0



--- **This attribute contains the LAN speed.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the transmission speed currently in use by the LAN interface.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14919.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.speed)
--- 
--- --Outputs the transmission speed of the instrument presently in use, such as:
--- --1.00000e+02
--- ```
lan.status.speed = 0



--- **This attribute contains the LAN subnet mask that is presently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Use this attribute to determine the present operating state of the LAN. This attribute returns the present LAN subnet mask value if the LAN is manually configured, or when DLLA or DHCP is used.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14920.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.subnetmask)
--- 
--- --Outputs the subnet mask of the instrument that is presently in use, such as:
--- --255.255.255.0
--- ```
lan.status.subnetmask = 0

---@class lantriggerArr
lantriggerArr = {}

---@type lantriggerArr[]
lan.trigger = {}




--- **This function simulates the occurrence of the trigger and generates the corresponding event ID.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Generates and sends a LAN trigger packet for the LAN event number specified.Sets the pseudo line state to the appropriate state.The following indexes provide the listed LXI events:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14921.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].assert()
--- 
--- --Creates a trigger with LAN packet 5.
--- ```
function lantriggerArr.assert() end



--- **This function clears the event detector for a LAN trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. This function clears a trigger event detector and discards the history of the trigger packet.This function clears all overruns associated with this LAN trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14922.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].clear()
--- 
--- --Clears the event detector with LAN packet 5.
--- ```
function lantriggerArr.clear() end



--- **This function prepares the event generator for outgoing trigger events.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command prepares the event generator to send event messages. For TCP connections, this opens the TCP connection.The event generator automatically disconnects when either the protocol or IP address for this event is changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14923.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[1].protocol = lan.MULTICAST
--- lan.trigger[1].connect()
--- lan.trigger[1].assert()
--- 
--- --Set the protocol for LAN trigger 1 to be multicast when sending LAN triggers. Then, after connecting the LAN trigger, send a message on LAN trigger 1 by asserting it.
--- ```
function lantriggerArr.connect() end



--- **This attribute stores the LAN event connection state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute is set to true when the LAN trigger is connected and ready to send trigger events following a successful lan.trigger[N].connect() command; if the LAN trigger is not ready to send trigger events, this value is false.This attribute is also false when either lan.trigger[N].protocol or lan.trigger[N].ipaddress attributes are changed or the remote connection closes the connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14924.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[1].protocol = lan.MULTICAST
--- print(lan.trigger[1].connected)
--- 
--- --Outputs true if connected, or false if not connected.
--- --Example output:
--- --false
--- ```
lantriggerArr.connected= 0



--- **This function disconnects the LAN trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For TCP connections, this closes the TCP connection.The LAN trigger automatically disconnects when either the lan.trigger[N].protocol or lan.trigger[N].ipaddress attributes for this event are changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14925.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function lantriggerArr.disconnect() end



--- **This constant is the event identifier used to route the LAN trigger to other subsystems (using stimulus properties).**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to incoming LAN trigger packets.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14926.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[14].stimulus = lan.trigger[1].EVENT_ID
--- 
--- --Route occurrences of triggers on LAN trigger 1 to digital I/O trigger 14.
--- ```
lantriggerArr.EVENT_ID= 0



--- **This attribute specifies the address (in dotted‑decimal format) of UDP or TCP listeners.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Sets the IP address for outgoing trigger events.Set to "0.0.0.0" for multicast.After changing this setting, the lan.trigger[N].connect() command must be called before outgoing messages can be sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14927.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[3].protocol = lan.TCP
--- lan.trigger[3].ipaddress = "192.168.1.100"
--- lan.trigger[3].connect()
--- 
--- --Set the protocol for LAN trigger 3 to be lan.TCP when sending LAN triggers.
--- --Use IP address "192.168.1.100" to connect the LAN trigger.
--- ```
lantriggerArr.ipaddress= 0



--- **This attribute sets the trigger operation and detection mode of the specified LAN event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command controls how the trigger event detector and the output trigger generator operate on the given trigger. These settings are intended to provide behavior similar to the digital I/O triggers.lan.TRIG_RISING and lan.TRIG_RISINGA are the same.lan.TRIG_RISING and lan.TRIG_RISINGM are the same.Use of either lan.TRIG_SYNCHRONOUSA or lan.TRIG_SYNCHRONOUSM instead of lan.TRIG_SYNCHRONOUS is preferred. Use of lan.TRIG_SYNCHRONOUS is provided for compatibility with older products and other Keithley Instruments products.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14928.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.trigger[1].mode)
--- 
--- --Outputs the present LAN trigger mode of LAN event 1.
--- ```
lantriggerArr.mode= 0



--- **This attribute contains the overrun status of the LAN event detector.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14929.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = lan.trigger[5].overrun
--- print(overrun)
--- 
--- --Checks the overrun status of a trigger on LAN5 and outputs the value, such as:
--- --false
--- ```
lantriggerArr.overrun= 0


lan.TCP1 = nil
lan.UDP2 = nil
lan.MULTICAST = nil

---@alias lantriggerprotocolprotocol
---|`lan.TCP1`
---|`lan.UDP2`
---|`lan.MULTICAST`



--- **This attribute sets the LAN protocol to use for sending trigger messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The LAN trigger listens for trigger messages on all supported protocols, but uses the designated protocol for sending outgoing messages. After changing this setting, lan.trigger[N].connect() must be called before outgoing event messages can be sent.When the lan.MULTICAST protocol is selected, the lan.trigger[N].ipaddress attribute is ignored and event messages are sent to the multicast address 224.0.23.159.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14930.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.trigger[1].protocol)
--- 
--- --Get LAN protocol to use for sending trigger messages for LAN event 1.
--- ```
---@type lantriggerprotocolprotocol
lantriggerArr.protocol= 0



--- **This attribute sets the simulated line state for the LAN trigger.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute can be set to initialize the pseudo line state to a known value.Setting this attribute does not cause the LAN trigger to generate any events or output packets.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14931.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.trigger[1].pseudostate)
--- 
--- --Get the present simulated line state for the LAN event 1.
--- ```
lantriggerArr.pseudostate= 0



--- **This function waits for an input trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If one or more trigger events have been detected since the last time lan.trigger[N].wait() or lan.trigger[N].clear() was called, this function returns immediately.After waiting for a LAN trigger event with this function, the event detector is automatically reset and rearmed regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14933.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = lan.trigger[5].wait(3)
--- 
--- --Wait for a trigger with LAN packet 5 with a timeout of 3 seconds.
--- ```
---@return any triggered Trigger detection indication (true or false)
---@param timeout number Maximum amount of time in seconds to wait for the trigger event
function lantriggerArr.wait(timeout) end



--- **This attribute specifies events that cause this trigger to assert.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. Set triggerStimulus to one of the existing trigger event IDs shown in the following table.Setting this attribute to zero disables automatic trigger generation.If any events are detected prior to calling lan.trigger[N].connect(), the event is ignored and the action overrun is set.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20595.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Use timer 1 trigger event as the source for LAN packet 5 trigger stimulus.
--- ```
---@type eventID|0
lantriggerArr.stimulus= 0

---@class timer.measure
timer.measure = {}




--- **This function measures the elapsed time since the timer was last reset.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15281.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- timer.reset()
--- -- (intervening code)
--- time = timer.measure.t()
--- print(time)
--- 
--- --This example resets the timer and measures the time since the reset.
--- --Output:
--- --1.469077e+01
--- --The output varies. The above output indicates that timer.measure.t() was executed 14.69077 seconds after timer.reset().
--- beeper.enable = beeper.ON
--- beeper.beep(0.5, 2400)
--- print("reset timer")
--- timer.reset()
--- delay(0.5)
--- dt = timer.measure.t()
--- print("timer after delay:", dt)
--- beeper.beep(0.5, 2400)
--- 
--- --Enable the beeper.
--- --Emit a beep and set the beeper.
--- --Reset the timer.
--- --Set a delay.
--- --Verify the duration of the delay before emitting another beep.
--- --Output:
--- --reset timer
--- --timer after delay: 5.00e-01
--- ```
---@return number time The elapsed time in seconds (1 µs resolution)
function timer.measure.t() end
---@class tsplinktriggerArr
tsplinktriggerArr = {}

---@type tsplinktriggerArr[]
tsplink.trigger = {}




--- **This function simulates the occurrence of the trigger and generates the corresponding event ID. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The set pulse width determines how long the trigger is asserted.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15292.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[2].assert()
--- 
--- --Asserts trigger on trigger line 2.
--- ```
function tsplinktriggerArr.assert() end



--- **This function clears the event detector for a LAN trigger. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. tsplink.trigger[N].clear() clears a trigger event detector, discards the history of the trigger line, and clears the tsplink.trigger[N].overrun attribute.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15293.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[2].clear()
--- 
--- --Clears trigger event on synchronization line 2.
--- ```
function tsplinktriggerArr.clear() end



--- **This constant identifies the number that is used for the trigger events. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This number is used by the TSP-Link trigger line when it detects an input trigger.Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to trigger events from this line.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15294.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = tsplink.trigger[2].EVENT_ID
--- 
--- --Sets the trigger stimulus of trigger timer 1 to the TSP-Link trigger 2 event.
--- ```
tsplinktriggerArr.EVENT_ID= 0



--- **This attribute defines the trigger operation and detection mode. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the mode in which the trigger event detector and the output trigger generator operate on the given trigger line.The setting for the mode parameter can be one of the values shown in the following table.When programmed to any mode except tsplink.TRIG_BYPASS, the output state of the I/O line is controlled by the trigger logic and the user-specified output state of the line is ignored.When the trigger mode is set to tsplink.TRIG_RISING, the user‑specified output state of the line is examined. If the output state selected when the mode is changed is high, the actual mode that is used is tsplink.TRIG_RISINGA. If the output state selected when the mode is changed is low, the actual mode that is used is tsplink.TRIG_RISINGM.The mode parameter stores the trigger mode as a numeric value when the attribute is read.To control the line state, use the tsplink.TRIG_BYPASS mode with the tsplink.writebit() and the tsplink.writeport() commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15295.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].mode = tsplink.TRIG_RISINGM
--- 
--- --Sets the trigger mode for synchronization line 3 to tsplink.TRIG_RISINGM.
--- ```
tsplinktriggerArr.mode= 0



--- **This attribute indicates if the event detector ignored an event while in the detected state. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15296.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(tsplink.trigger[1].overrun)
--- 
--- --If an event was ignored, displays true; if an event was not ignored, displays false.
--- ```
tsplinktriggerArr.overrun= 0



--- **This attribute sets the length of time that the trigger line is asserted for output triggers. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to 0 (seconds) asserts the trigger indefinitely.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15297.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].pulsewidth = 20e-6
--- 
--- --Sets pulse width for trigger line 3 to 20 μs.
--- ```
tsplinktriggerArr.pulsewidth= 0



--- **This function releases a latched trigger on the given TSP‑Link trigger line. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulse width. It also releases a trigger that was latched in response to receiving a synchronous mode trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15298.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].release()
--- 
--- --Releases trigger line 3.
--- ```
function tsplinktriggerArr.release() end



--- **This function waits for a trigger. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to the timeout value for an input trigger. If one or more trigger events were detected since the last time tsplink.trigger[N].wait() or tsplink.trigger[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15300.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = tsplink.trigger[3].wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 seconds for a trigger on TSP-Link® line 3.
--- --If false is returned, no trigger was detected during the 10-second timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered Trigger detection indication; set to one of the following values
---@param timeout number The timeout value in seconds
function tsplinktriggerArr.wait(timeout) end



--- **This function resets some of the TSP-Link trigger attributes to their factory defaults. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tsplink.trigger[N].reset() function resets the following attributes to their factory defaults:This also clears tsplink.trigger[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17669.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].reset()
--- 
--- --Resets TSP-Link trigger line 3 attributes back to factory default values.
--- ```
function tsplinktriggerArr.reset() end



--- **This attribute specifies the event that causes the synchronization line to assert a trigger.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To disable automatic trigger assertion on the synchronization line, set this attribute to zero (0).Do not use this attribute when triggering under script control. Use tsplink.trigger[N].assert() instead.The eventID parameter may be one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20594.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].stimulus = scan.trigger.EVENT_CHANNEL_READY
--- 
--- --Sets the trigger stimulus of the TSP-Link trigger line 3 event detector to scan the trigger channel ready event.
--- ```
---@type eventID|0
tsplinktriggerArr.stimulus= 0

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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15785.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[2].clear()
--- 
--- --Clears the event detector for blender 2.
--- ```
function triggerblenderArr.clear() end



--- **This constant contains the trigger blender event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to trigger events from this trigger blender.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15786.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[1].stimulus = trigger.blender[2].EVENT_ID
--- 
--- --Set the trigger stimulus of digital I/O trigger 1 to be controlled by the trigger blender 2 event.
--- ```
triggerblenderArr.EVENT_ID= 0



--- **This attribute selects whether the blender performs OR operations or AND operations.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command selects whether the blender waits for any one event (OR) or waits for all selected events (AND) before signaling an output event.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15787.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens on line 3 or 5.
--- ```
triggerblenderArr.orenable= 0



--- **This attribute indicates whether or not an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates if an event was ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector that is built into the event blender itself.This command does not indicate if an overrun occurred in any other part of the trigger model or in any other trigger object that is monitoring the event. It also is not an indication of an action overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15788.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.blender[1].overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If an event was not ignored, the output is false.
--- ```
triggerblenderArr.overrun= 0



--- **This function waits for a blender trigger event to occur.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits for an event blender trigger event. If one or more trigger events were detected since the last time trigger.blender[N].wait() or trigger.blender[N].clear() was called, this function returns immediately.After detecting a trigger with this function, the event detector automatically resets and rearms. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15790.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].mode = digio.TRIG_FALLING
--- digio.trigger[5].mode = digio.TRIG_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
--- print(trigger.blender[1].wait(3))
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens either on line 3 or 5.
--- --Wait three seconds while checking if trigger blender 1 event has occurred.
--- --If the blender trigger event has happened, then true is output. If the trigger event has not happened, then false is output after the timeout expires.
--- ```
---@return boolean triggered Trigger detection indication for blender
---@param timeout number Maximum amount of time in seconds to wait for the trigger blender event
function triggerblenderArr.wait(timeout) end



--- **This function resets some of the trigger blender settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.blender[N].reset() function resets the following attributes to their factory defaults:It also clears trigger.blender[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17666.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[1].reset()
--- 
--- --Resets the trigger blender 1 settings to factory defaults.
--- ```
function triggerblenderArr.reset() end



--- **This attribute specifies the events that trigger the blender.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- There are four acceptors that can each select a different event. The eventID parameter can be the event ID of any trigger event.The eventID parameter may be one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20592.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].mode = digio.TRIG_FALLING
--- digio.trigger[5].mode = digio.TRIG_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15793.htm"])
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
--- Once the timer is enabled, each time the timer is triggered, it uses this delay period.Assigning a value to this attribute is equivalent to:This creates a delay list of one value.Reading this attribute returns the delay interval that is used the next time the timer is triggered.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15794.htm"])
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
--- Each time the timer is triggered after it is enabled, it uses the next delay period from the array. The default value is an array with one value of 10 µs.After all elements in the array have been used, the delays restart at the beginning of the list.If the array contains more than one element, the average of the delay intervals in the list must be ≥ 50 µs.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15795.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[3].delaylist = {50e-6, 100e-6, 150e-6}
--- DelayList = trigger.timer[3].delaylist
--- for x = 1, table.getn(DelayList) do
---    print(DelayList[x])
--- end
--- 
--- --Set a delay list on trigger timer 3 with three delays (50 µs, 100 µs, and 150 µs).
--- --Read the delay list on trigger timer 3.
--- --Output:
--- --5e-05
--- --0.0001
--- --0.00015
--- ```
triggertimerArr.delaylist= 0



--- **This constant specifies the trigger timer event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This constant is an identification number that identifies events generated by this timer.Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to events from this timer.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15796.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.stimulus = trigger.timer[2].EVENT_ID
--- 
--- --Sets the trigger stimulus of the channel event detector to trigger timer 2 event.
--- ```
triggertimerArr.EVENT_ID= 0



--- **This attribute indicates if an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates if an event was ignored because the event detector was already in the detected state when the event occurred.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15797.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If the event was not ignored, the output is false.
--- ```
triggertimerArr.overrun= 0



--- **This attribute enables or disables the timer trigger pass‑through mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When pass-through mode is enabled, triggers are passed through immediately and initiate the delay. When disabled, a trigger only initiates a delay.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15798.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].passthrough = true
--- 
--- --Enables pass‑through mode on trigger timer 1.
--- ```
triggertimerArr.passthrough= 0



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If one or more trigger events were detected since the last time trigger.timer[N].wait() or trigger.timer[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15800.htm"])
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



--- **This attribute sets the number of events to generate each time the timer generates a trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If the count is set to a number greater than 1, the timer automatically starts the next trigger timer delay at the expiration of the previous delay.Set the count to zero (0) to cause the timer to generate trigger events indefinitely.If you use the trigger timer with a trigger model, make sure the count value is the same or more than any count values expected in the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15820.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].count)
--- 
--- --Read trigger count for timer number 1.
--- ```
triggertimerArr.count= 0



--- **This function resets some of the trigger timer settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.timer[N].reset() function resets the following attributes to their factory defaults:It also clears trigger.timer[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17668.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].reset()
--- 
--- --Resets the attributes associated with timer 1 back to factory default values.
--- ```
function triggertimerArr.reset() end



--- **This attribute describes the event that starts the trigger timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The eventID parameter may be one of the trigger event IDs shown in the following table.Set this attribute to the eventID of any trigger event to wait for that event.Use zero (0) to disable event processing.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20597.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].stimulus)
--- 
--- --Prints the event that will start a trigger 1 timer action.
--- ```
---@type eventID|0
triggertimerArr.stimulus= 0

---@class status.measurement
status.measurement = {}


---@class status.operation
status.operation = {}


---@class status.questionable
status.questionable = {}


---@class status.standard
status.standard = {}


---@class status.system
status.system = {}


---@class status.system2
status.system2 = {}


---@class status.system3
status.system3 = {}


---@class status.system4
status.system4 = {}


---@class status.system5
status.system5 = {}


---@class channel.pattern
channel.pattern = {}




--- **This function creates a list of the user-created channel patterns.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function allows you to print or delete all user-created channel patterns in the runtime environment. The entries that are returned are listed in random order.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15934.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("3001,3031", "patternA")
--- channel.pattern.setimage("3002,3032", "patternB")
--- channel.pattern.setimage("3003,3033","patternC")
--- for name in channel.pattern.catalog() do
---    print(name .. " = " ..
---       channel.pattern.getimage(name))
---    channel.pattern.delete(name)
--- end
--- 
--- --This example prints the names and items associated with all user-created channel patterns. It then deletes the channel pattern.
--- --patternC = 3003,3033
--- --patternA = 3001,3031
--- --patternB = 3002,3032
--- ```
function channel.pattern.catalog() end


--- **This function deletes a channel pattern.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- An error is generated if the name does not exist as a channel pattern.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15935.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.delete("Channels")
--- 
--- --Deletes a channel pattern called Channels.
--- ```
---@param name string A string representing the name of the channel pattern to delete
function channel.pattern.delete(name) end


--- **This function queries a channel pattern for associated channels and analog backplane relays.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The returned string lists the channels in the slot, column or slot, row, column format, even if a channel pattern was used to create it. Results for multiple channel patterns are delimited by a semicolon (;). Commas delimit the specific channels and analog backplane relays in a single channel pattern in the string.If you change a pole setting for a channel that is associated with a channel pattern, the channel pattern is deleted. Be sure to configure the pole setting for channels (channel.setpole) before creating a channel pattern.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17284.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- Set up two patterns
--- channel.pattern.setimage("4001:4005", "myPattern") 
--- channel.pattern.setimage("2001,2003,2005", "myRoute") 
---  
--- -- Print images
--- myImage = channel.pattern.getimage("myPattern") 
--- print(myImage) 
--- print(channel.pattern.getimage("myRoute"))
--- print(channel.pattern.getimage("myRoute,
---    myPattern"))
--- 
--- --Using a Model 3721 (or similar model) card in slots 2 and 4, this example creates two channel patterns and then queries these patterns.
--- --Output:
--- --4001,4002,4003,4004,4005
--- --2001,2003,2005
--- --2001,2003,2005;4001,4002,4003,4004,4005
--- ```
---@return string channelList A string specifying a list of channels and analog backplane relays that are represented by the name
---@param name string A string representing the name of the channel pattern to query
function channel.pattern.getimage(name) end


--- **This function creates a channel pattern and associates it with the specified name.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If name is used for an existing channel pattern, that pattern is overwritten with the new pattern channel image (if no errors occur). The previous image associated with the name is lost. The DMM configuration associated with the pattern remains unchanged in this scenario.The channel pattern is not created if an error is detected. You can create a channel pattern with an empty channelList parameter. This will create a pattern that has no channels or analog backplane relays associated with it. The behavior of using an empty pattern in a channel list parameter is dependent on the command. For example:A channel pattern must include the analog backplane relays and the channels. Once a channel pattern is created, the only way to add a channel or analog backplane relay to an existing pattern is to delete the old pattern and recreate the pattern with the new items.If you change a pole setting for a channel that is associated with a channel pattern, the channel pattern is deleted. Be sure to configure the pole setting for channels (channel.setpole) before creating a channel pattern.Channel patterns are stored when you run the createconfigscript() command or setup.save() command.Channel patterns are lost when power is cycled. Use setup.recall() or a script created with createconfigscript() to restore them.Including any channels of type digital I/O, DAC, and totalizer generates an error.The following restrictions exist when naming a channel pattern:Examples of valid names:Examples of invalid names:An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17296.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("3001:3010", "Channels")
--- oldList = channel.pattern.getimage("Channels")
--- newList = oldList .. ", 3911"
--- channel.pattern.delete("Channels")
--- channel.pattern.setimage(newList, "Channels")
--- channel.open("slot3")
--- channel.close("Channels")
--- print(channel.getclose("slot3"))
--- 
--- --For this example, assume there is a Keithley Model 3721 or similar card in slot 3.
--- --Create a pattern.
--- --Append a channel to the pattern by retrieving the pattern and recreating it.
--- --Recreate the pattern with the new image.
--- --Open all channels on slot 3 and close the pattern Channels.
--- --Output:
--- --3001;3002;3003;3004;3005;3006;3007;3008;3009;3010;3911
--- channel.pattern.setimage("3001:3010", "Channels")
--- channel.open("slot3")
--- channel.close("Channels, 3911")
--- print(channel.getclose("slot3"))
--- 
--- --An alternate solution to the example above is to create the pattern, then add the analog backplane relay when you close the channel. This eliminates the need to get the image, delete the image and recreate it.
--- --Output:
--- --3001;3002;3003;3004;3005;3006;
--- --3007;3008;3009;3010;3911
--- ```
---@param channelList string A string listing the channels, channel patterns, or analog backplane relays to use when creating the new channel pattern
---@param name string A string representing the name to associate with the new channel pattern
function channel.pattern.setimage(channelList, name) end


--- **This function creates a channel pattern.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command stores an image of presently closed channels and analog backplane relays and associates them with the name parameter.If name is already used for an existing channel pattern, that pattern is overwritten with the new pattern channel image (if no errors occur). The DMM configuration associated with the pattern remains unchanged.The following restrictions exist when naming a channel pattern:Examples of valid names:Examples of invalid names:An error is generated if:Issuing this function on an existing pattern invalidates the existing scan list (the pattern may or may not be used in the current scan list). Creating a new pattern does not invalidate the existing scan list.Channels of type DAC, totalizer, and digital I/O are ignored.Channel patterns are stored when you run the createconfigscript() command or setup.save() command.Channel patterns are lost when power is cycled. Use setup.recall() or a script created with createconfigscript() to restore them.If you change a pole setting for a channel that is associated with a channel pattern, the channel pattern is deleted. Be sure to configure the pole setting for channels (channel.setpole) before creating a channel pattern.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17299.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.snapshot("voltagePath")
--- 
--- --Creates a pattern named voltagePath that contains the presently closed channels and analog backplane relays.
--- ```
---@param name string A string representing the name to associate with the present state of channels and analog backplane relays
function channel.pattern.snapshot(name) end
---@class channeltriggerArr
channeltriggerArr = {}

---@type channeltriggerArr[]
channel.trigger = {}




--- **This function clears any pending events.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears any pending events for the channel trigger specified by N.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15951.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.trigger[1].clear()
--- 
--- --Clears any pending events on channel trigger 1.
--- ```
function channeltriggerArr.clear() end



--- **This constant indicates the trigger event generated by the channel trigger N.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15952.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.stimulus = channel.trigger[1].EVENT_ID
--- 
--- --Use channel trigger 1 events to pace the channel action of the scanning or set the trigger stimulus of the channel event detector to channel trigger 1.
--- ```
channeltriggerArr.EVENT_ID= 0



--- **This function gets the channel status trigger information that is used to watch the state of a specific channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is available for DAC, digital I/O, and totalizer channels. Switch channels are not supported.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15953.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.trigger[1].set("1010", channel.IND_MATCH)
--- chan_list, state_match = channel.trigger[1].get()
--- print(chan_list, state_match)
--- 
--- --Assuming a 3750, defines channel trigger event 1 to occur when totalizer channel 10 matches its defined match value.
--- --Query for the channels and state conditions associated with channel trigger 1.
--- --Output:
--- --1010    4.000000000e+00
--- channel.trigger[5].set("6003, 6005", channel.IND_MATCH)    
--- print(channel.trigger[5].get())
--- 
--- --Assuming a Model 3750 card, define a channel trigger event 5 to occur when either digital I/O channel 3 or 5 on slot 6 match their defined values.
--- --View the trigger information associated with channel trigger 5.
--- --Output:
--- --6003,6005       4.000000000e+00
--- ```
---@return string channelList Returns a string specifying the channels watched by this trigger
---@return number stateMatch Returns a value specifying the state to match when triggering an event
function channeltriggerArr.get() end



--- **This function sets the channel status trigger model to watch the state of a specific channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the channel list contains more than one channel, the trigger acts as a logical OR. When any one of the channels in the list matches the specified state, a trigger event is generated. Therefore, if an indicator is present in both the match and the actual state, an event is triggered. If the match contains more than one state indicator, only one of those indicators needs to be present to trigger the event.There are a total of eight channel trigger events for each Series 3700A, defined by N. Using this mechanism, a trigger can be generated when a pattern is matched on an I/O, a totalizer matches a defined count, or an I/O has an overcurrent condition.Latching functionality is not supported. This command works for DAC, digital I/O and totalizer channels. Switch channels are not supported.To clear a trigger that is no longer needed, pass an empty channel list ("" or " ") .
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15954.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.trigger[1].set("1001", channel.IND_MATCH)
--- 
--- --Assuming a 3750, defines a channel trigger event 1 to occur when digital I/O channel 1 matches its defined match value.
--- channel.trigger[5].set("6003, 6005", channel.IND_MATCH)    
--- print(channel.trigger[5].get())
---  
--- channel.trigger[5].set(" ", channel.IND_MATCH)
--- print(channel.trigger[5].get())
--- 
--- --Assuming a 3750 card, define channel trigger event 5 to occur when either digital I/O channel 3 or 5 on slot 6 match their defined values.
--- --View the trigger information associated with channel trigger 5.
--- --Clear the trigger information associated with channel trigger 5.
--- --View the trigger information associated with channel trigger 5.
--- --Output:
--- --6003,6005  4.000000000e+000  0.000000000e+000
--- ```
---@param channelList any The channels to set, using standard channel naming
---@param stateMatch any Value specifying the status to match when triggering an event
function channeltriggerArr.set(channelList, stateMatch) end



--- **This function waits for the specified trigger or timeout period, whichever comes first.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If one or more trigger events were detected since the last time channel.trigger[N].wait or channel.trigger[N].clear was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.The value for timeout must be greater than zero and less than 10,000.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15955.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.trigger[1].wait(5)
--- 
--- --Wait 5 seconds for channel trigger event 1 to occur or timeout if trigger event is not detected in 5 seconds.
--- ```
---@return any triggered Returns an indication that a trigger occurred
---@param timeout any The number of seconds to wait
function channeltriggerArr.wait(timeout) end

---@class dmm.adjustment
dmm.adjustment = {}




--- **This attribute indicates the number of times the instrument has been adjusted (calibrated).**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Calibration (adjustment) may or may not be unlocked for this attribute to read and return a value.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15967.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- adjustmentCount = dmm.adjustment.count
--- 
--- --Queries for the adjustment count.
--- ```
dmm.adjustment.count = 0



--- **This attribute sets or queries the calibration adjustment date in Coordinated Universal Time (UTC) format (number of seconds since January 1, 1970).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute can only be set when calibration is unlocked.For more information about formatting options with os.time or os.date, see the Lua documentation. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15968.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.adjustment.date = os.time{year=2007, month=7, day = 4}
--- 
--- --Sets the adjustment date to July 4, 2007.
--- print(os.date("%m/%d/%Y", dmm.adjustment.date))
--- 
--- --Queries the date and formats the response as mm/dd/yyyy:
--- --07/04/2007
--- print(os.date("%x", dmm.adjustment.date))
--- 
--- --Queries the date and formats the response as  mm/dd/yy:02/24/09
--- ```
dmm.adjustment.date = 0

---@class dmm.buffer
dmm.buffer = {}




--- **This function creates an iterator for the user-created reading buffers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can access the catalog for the user-created local reading buffers so that you can print the names of all reading buffers in the system. The entries are enumerated in no particular order. From this list, you may selectively delete reading buffers from the system.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15971.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in dmm.buffer.catalog() do print(name) end
--- 
--- --Print all user-created local reading buffers in the system.
--- --Assume the return is:
--- --buf3
--- --buf5
--- --buf1
--- ```
function dmm.buffer.catalog() end


--- **This function returns the size and capacity of the reading buffer parameter.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function uses the specified reading buffer input parameter name to find the corresponding size and capacity to return. Use this function with the dmm.buffer.catalog() function to output the size and capacity for all reading buffers in the system.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15972.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for n in dmm.buffer.catalog() do
---    print(dmm.buffer.info(n))
--- end
--- 
--- --Assume the system has the following reading buffers created: buffer1, buffer2, buffer3, buffer4, and buffer5.
--- --Query the system for the size and capacity of each reading buffer without formatting the results.
--- --The output is:
--- --0.000000000e+00 2.000000000e+03
--- --0.000000000e+00 4.000000000e+03
--- --0.000000000e+00 5.000000000e+03
--- --0.000000000e+00 3.000000000e+03
--- --0.000000000e+00 1.000000000e+03
--- ```
---@return number size Number representing the N (presently stored) attribute of the reading buffer parameter
---@return number capacity Number representing the overall capacity attribute of the reading buffer parameter
---@param bufferVar string String representing the reading buffer name that you want to query for size and capacity
function dmm.buffer.info(bufferVar) end


--- **This attribute returns the overall maximum capacity for reading buffers in the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Determines the maximum capacity of the instrument for reading buffer storage. This value represents the total system reading buffer storage size. A single reading buffer may be created with this as its size, or several reading buffers may be created in the instrument that are smaller in size. However, the sum total of all reading buffer sizes in the instrument cannot exceed this maximum.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15973.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- MaxBuffCap = dmm.buffer.maxcapacity
--- print(MaxBuffCap)
--- 
--- --Reads the maximum reading buffer capacity for the instrument, which is 650,000 readings.
--- --Output:
--- --6.500000000e+05
--- ```
dmm.buffer.maxcapacity = 0



--- **This attribute indicates how much of the maximum capacity for reading buffers in the instrument is used.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This value represents the sum total capacity of all reading buffers in the instrument. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15974.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buf1 = dmm.makebuffer(300000)
--- buf2 = dmm.makebuffer(300000)
--- print(dmm.buffer.usedcapacity)
--- print(dmm.buffer.maxcapacity - dmm.buffer.usedcapacity)
---  
--- 
--- --Create buffers.
--- --Reads the used reading buffer capacity for the system.
--- --6.000000000e+05
--- --5.000000000e+04
--- --This shows that there is a capacity of 50,000 available for creating additional reading buffers.
--- ```
dmm.buffer.usedcapacity = 0

---@class dmm.calibration
dmm.calibration = {}




--- **This function begins the specified AC adjustment step on the DMM.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command generates an error if the:For detail on how to use dmm.calibration.ac(), see AC volts adjustment, AC current adjustment, and Frequency adjustment.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15978.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- step
--- 
--- --The AC adjustment step to perform
--- ```
---@param step number The AC adjustment step to perform
---@param value number The value for this adjustment step (if the adjustment step has a value)
---@overload fun(step:number)
function dmm.calibration.ac(step, value) end


--- **This function begins a DC adjustment step on the DMM.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command generates an error if the:For example of use, see DC volts adjustment, Resistance adjustment, and DC current adjustment.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15979.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- step
--- 
--- --The DC adjustment step to perform
--- ```
---@param step number The DC adjustment step to perform
---@param value number The value for this adjustment step (if the adjustment step has a value)
---@overload fun(step:number)
function dmm.calibration.dc(step, value) end


--- **This function locks calibration to prevent unintended changes.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to lock an unlocked calibration. An error is generated if this command is issued when calibration is already locked.Once locked, you must unlock calibration before you can perform calibration again.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15980.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.calibration.save()
--- dmm.calibration.lock()
--- 
--- --Save calibration, then lock it.
--- ```
function dmm.calibration.lock() end


--- **This attribute sets the password that must be entered before you can unlock calibration.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute can only be set when calibration is unlocked.This attribute generates an error if calibration is locked or if the password string length is greater than ten characters.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16010.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.calibration.unlock("KI003706")
--- dmm.calibration.password = "myUnlock"
--- dmm.calibration.lock()
--- 
--- --To change the default calibration password, unlock the calibration with the default password.
--- --Saves the password as myUnlock.
--- --Lock calibration. Subsequent unlocks will use the password myUnlock.
--- ```
dmm.calibration.password = 0



--- **This function saves calibration data.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command saves the calibration constants and adjustment date and increases the adjustment count by 1. The adjustment count is the number of times calibration has been saved.This command does not check for errors in calibration data. Calibration data is saved regardless of calibration data errors.The calibration date can be specified with dmm.adjustment.date. If it is not specified, the date is based on the system date.To prevent data loss, you need to send the save command before locking calibration.An error is generated if this command is issued when calibration is already locked. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16011.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.calibration.save()
--- 
--- --Saves calibration data.
--- ```
function dmm.calibration.save() end


--- **This function unlocks calibration if calibration was locked.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the password does not match the saved password, an error is generated. The default password from the factory is "KI003706". You can change the default with dmm.calibration.password.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16012.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.calibration.unlock("KI003706")
--- 
--- --Unlocks calibration using the default password.
--- ```
---@param password string A string representing the password to unlock calibration
function dmm.calibration.unlock(password) end


--- **This attribute sets or queries the calibration verification date in UTC format (number of seconds since January 1, 1970).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When using the os.time() function:See Lua documentation for the formatting options that are available for os.date. This command can only be set when calibration is unlocked.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(os.date("%m/%d/%Y", dmm.calibration.verifydate))
--- 
--- --Assume the system date is July 4, 2007 for this example; queries the calibration verification date and formats the response as mm/dd/yyyy:
--- --07/04/2007
--- print(os.date("%x", dmm.calibration.verifydate))
--- 
--- --Assume the system date is July 4, 2007 for this example; queries the date and formats the response as mm/dd/yy:
--- --07/04/07
--- dmm.calibration.verifydate = os.time{year=2007, month=7, day = 4}
--- 
--- --Set the calibration verification date to July 4, 2007.
--- dmm.calibration.verifydate = os.time()
--- 
--- --Set the calibration verification to the present date of the instrument.
--- ```
dmm.calibration.verifydate = 0

---@class dmm.configure
dmm.configure = {}




--- **This function creates an iterator for user-created DMM configurations.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can access the catalog for user DMM configurations to print or delete all configurations in the runtime environment.The entries are enumerated in no particular order. This only lists user-created DMM configurations. It does not list the factory default configurations.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16015.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in dmm.configure.catalog() do
---  print(name)
--- end
--- 
--- --Prints the names of all user-created DMM configurations in the instrument.
--- --The output will look similar to:
--- --TestDcv
--- --TestTemperature
--- --TestTwoWire
--- -- 
--- --This indicates there are three user-created DMM configurations in the instrument with the names TestDCV, TestTemperature, and TestTwoWire.
--- ```
function dmm.configure.catalog() end


--- **This function deletes a user-created DMM configuration from memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you delete a DMM configuration that is assigned to channels or channel patterns, those channels and patterns revert back to the factory default DMM configuration of "nofunction" (dmm.setconfig()).If you delete a DMM configuration that is used in a scan list, the scan list is modified and the channel is set to "nofunction" for that configuration.You cannot delete a DMM configuration on a closed channel. If you attempt to delete it, error code 1114, "Settings conflict with deleting DMM configuration assigned to closed channel," is generated.An error is generated if the name specified does not exist as a user configuration.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16016.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.configure.delete("DCVDMMConfig")
--- 
--- --Deletes a user configuration called DCVDMMConfig.
--- ```
---@param name string String that contains the name of the DMM configuration to delete
function dmm.configure.delete(name) end


--- **This function lists DMM settings associated with a configuration.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For the specified configuration, this function lists the settings and the corresponding DMM attributes.If the specified configuration does not exist, a nil response is generated, along with an error message stating that the referenced name does not exist.If userSeparator is specified, the attributes are delimited by this two-character separator. If more than two characters are specified, an error message is generated.To query the factory default settings for a function, use the function, such as "dvolts" or "temperature", for the userConfiguration parameter. See dmm.func for valid functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16017.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ActiveFunc = dmm.configure.query("active", "\n")
--- print(ActiveFunc)
--- 
--- --Lists the DMM attributes for the active function separated by new lines.
--- ```
---@return string config An output string that represents the DMM attribute settings of userConfiguration
---@param userConfiguration string A string that contains the name for the DMM configuration to be listed; to query the settings for the active function, set this parameter to "active"
---@param userSeparator string A string that represents the two-character separator that is inserted between items; the default value is a comma followed by a space (, )
---@overload fun(userConfiguration:string):string
function dmm.configure.query(userConfiguration, userSeparator) end


--- **This function recalls a user or factory DMM configuration and replaces attributes in the present configuration with attributes from the recalled version.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command recalls the DMM configuration for one function.When a configuration is recalled, the function associated with the configuration becomes active.When you recall a DMM configuration, the existing DMM configuration settings for the function are replaced by the settings in the recalled configuration. Settings for other functions are not affected. For example, if the function associated with the configuration was temperature, only temperature settings are recalled. If a factory configuration is recalled, the function's attributes are set to their factory default values.The DMM configuration can be user-defined or factory-defined.User-defined DMM configurations are set with dmm.configure.set(). The factory-defined DMM configurations are:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16018.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.reset("active") 
--- dmm.nplc = 0.5
--- dmm.range = 10
--- dmm.configure.set("TestDcv")
--- dmm.configure.recall("dcvolts")
--- print(dmm.func, dmm.autorange, dmm.range, dmm.nplc)
--- dmm.configure.recall("TestDcv")
--- print(dmm.func, dmm.autorange, dmm.range, dmm.nplc)
--- dmm.setconfig("slot1", "TestDcv")
--- dmm.setconfig("2001:2015", "TestDcv")
--- dmm.setconfig("3005", "TestDcv")
--- 
--- --Set the DMM to the dc voltage function.
--- --Reset DC volts back to factory defaults.
--- --Set the NPLC for dc voltage volts to 0.5.
--- --Select the 10 V range for dc voltage and disable autorange.
--- --Save a user DMM configuration for dc voltage called "TestDcv".
--- --Recall and configure the DMM for factory dc voltage.
--- --Output the settings for factory-defined dc voltage.
--- --Recall the user DMM configuration called "TestDcv".
--- --Output the settings for TestDcv.
--- --Set the DMM configuration for slot 1, channels 2001 to 2005, and channel 3005 to TestDcv.
--- --Output:
--- --dcvolts	1.000000000e+00	1.000000000e+01	1.000000000e+00
--- --dcvolts	0.000000000e+00	1.000000000e+01	5.000000000e-01
--- ```
---@param configuration string A string that represents the name of the DMM configuration to recall
function dmm.configure.recall(configuration) end


--- **This function creates a named DMM configuration for the selected function. The configuration includes pertinent attributes for that function.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command saves the selected function and its pertinent settings. You can recall this configuration using dmm.configure.recall(). You can also apply the configuration using dmm.setconfig() to channels or channel patterns.dmm.configure.set() stores only pertinent settings. For example, if dmm.func is set to "dcvolts", temperature settings are not stored.DMM configurations are not saved through a power cycle. To save the configuration through a power cycle, use setup.save() or  createconfigscript(). These options save all DMM user configurations.If the name of the configuration:Some DMM configurations are preset. The factory default configuration names are:If you change the settings for an existing DMM configuration, the existing scan list will be updated to use the new settings for the existing DMM configuration. However, if the function or a setting is not valid for a channel in the scan list, the scan list will be reset to the default configuration of "nofunction".
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16019.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.reset("active") 
--- dmm.nplc = 0.5
--- dmm.range = 10
--- dmm.configure.set("TestDcv")
--- dmm.configure.recall("dcvolts")
--- print(dmm.func, dmm.autorange, dmm.range, dmm.nplc)
--- dmm.configure.recall("TestDcv")
--- print(dmm.func, dmm.autorange, dmm.range, dmm.nplc) 
--- 
--- --Set the DMM to the dc voltage function.
--- --Reset DC volts back to factory defaults.
--- --Set the NPLC for dc voltage to 0.5.
--- --Select the 10 V range for dc voltage and disable autorange.
--- --Save a user DMM configuration for dc voltage called "TestDcv".
--- --Recall and configure the DMM for factory dc voltage.
--- --Output the settings for factory dc voltage.
--- --Recall the user DMM configuration called "TestDcv".
--- --Output the settings for the TestDcv configuration.
--- --Output:
--- --dcvolts	1.000000000e+00	1.000000000e+01	1.000000000e+00
--- --dcvolts	0.000000000e+00	1.000000000e+01	5.000000000e-01
--- ```
---@param name string A string that contains the name of the DMM configuration that you are creating
function dmm.configure.set(name) end
---@class dmm.filter
dmm.filter = {}




--- **This attribute sets the filter count setting for the selected DMM function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The number of measured readings that will yield one filtered measurement when filtered measurements are enabled.The filter count setting only applies when dmm.func is set to one of the following:If you query the setting for any other function, nil is returned.The filter count setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the filter count setting you set previously is retained.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16025.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.filter.count = 5
--- dmm.filter.enable = dmm.ON
--- 
--- --Sets the filter count for 2-wire ohms to 5 and enables filtered measurements.
--- ```
dmm.filter.count = 0


dmm.ON = 1
dmm.OFF = 0

---@alias dmmfilterenablevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the averaging filter for measurements of the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The filter enable setting only applies when dmm.func is set to one of the following:Querying the setting for any other function will return nil and an error message.The filter enable setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the filter enable setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16026.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.filter.count = 3
--- dmm.filter.enable = dmm.ON
--- 
--- --Enable filtered measurements for 2-wire ohms using a moving average filter type with a count of 3 for each measurement.
--- ```
---@type dmmfilterenablevalue
dmm.filter.enable = 0


dmm.FILTER_MOVING_AVG = 0
dmm.FILTER_REPEAT_AVG = 1

---@alias dmmfiltertypevalue
---|`dmm.FILTER_MOVING_AVG`
---|`dmm.FILTER_REPEAT_AVG`



--- **This attribute defines the type of averaging filter that is used for the selected measure function when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The filter type setting only applies when dmm.func is set to one of the following:Querying the setting for any other function returns nil. An error is generated if this setting is written or read for any other function.You can choose from two averaging filter types: Repeating and moving.When the repeating average filter is selected, a set of measurements are made. These measurements are stored in a measurement stack and averaged together to produce the averaged sample. Once the averaged sample is produced, the stack is flushed, and the next set of data is used to produce the next averaged sample. This type of filter is the slowest, since the stack must be completely filled before an averaged sample can be produced, but it provides more stable results.When the moving average filter is selected, the measurements are added to the stack continuously on a first-in, first-out basis. As each measurement is made, the oldest measurement is removed from the stack. A new averaged sample is produced using the new measurement and the data that is now in the stack.The filter type setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the filter type setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16027.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.filter.enable = dmm.ON
--- 
--- --Set the filter type for 2-wire ohms to moving average and enable filtered measurements.
--- ```
---@type dmmfiltertypevalue
dmm.filter.type = 0



--- **This attribute sets the window for the averaging filter that is used for measurements for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The filter window setting only applies when dmm.func is set to one of the following:Querying the setting for any other function returns nil. An error is generated if this setting is written or read for any other function.An error is generated if the value is out of range.The filter window setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the filter window setting you set previously is retained.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16028.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.filter.window = 0.25
--- dmm.filter.enable = dmm.ON
--- 
--- --Set the filter window for 2-wire ohms to 0.25 and enable filtered measurements.
--- ```
dmm.filter.window = 0

---@class dmmlimitArr
dmmlimitArr = {}

---@type dmmlimitArr[]
dmm.limit = {}



dmm.OFF = 0
dmm.ON = 1

---@alias dmmlimitautoclearvalue
---|`dmm.OFF`
---|`dmm.ON`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is valid for all functions except "continuity" and "nofunction". A nil response and an error are generated if the command is received when dmm.func is set to either of these functions.When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16034.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.limit[2].autoclear = dmm.ON
--- 
--- --Enables auto clear on limit 2 for two-wire ohms.
--- ```
---@type dmmlimitautoclearvalue
dmmlimitArr.autoclear= 0



--- **This function clears the results of the limit test defined by Y.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to clear the test results of limit Y when the limit auto clear option is turned off. Both the high and low test results are cleared.To avoid the need to manually clear the test results for a limit, turn the auto clear option on.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16035.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.limit[2].clear()
--- 
--- --Clears the test results for the high and low limit 2 for two-wire ohms.
--- ```
function dmmlimitArr.clear() end


dmm.OFF = 0
dmm.ON = 1

---@alias dmmlimitenablevalue
---|`dmm.OFF`
---|`dmm.ON`



--- **This attribute enables or disables a limit test on the measurement from the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is valid for all functions except "continuity" and "nofunction". A nil response and an error are generated if the command is received when dmm.func is set to either of these functions.When this attribute is enabled, the limit Y testing occurs on each measurement taken by the DMM. Limit Y testing compares the measurements to the high and low limit values. If a measurement falls outside these limits, the test fails. The low limit is specified by dmm.limit[Y].low.value and the high limit is specified by dmm.limit[Y].high.value.When this is enabled, limit testing occurs whether it is requested by the dmm.measure function or as part of a scan sequence. However, if events are not assigned to a trigger stimulus for a digital I/O line, there is no hardware indication of limits. The events that can be assigned to a trigger stimulus include:To see the test results, use the dmm.limit[Y].low.fail and dmm.limit[Y].high.fail attributes.When limit testing is disabled, no measurements are tested and the status bits are not updated, the fail indication does not get updated, and hardware lines are not generated.This example enables limits 1 and 2 for DC volt, measurements. Limit 1 is checking for readings to be between 3 and 5 volts while limit 2 is checking for the readings to be between 1 and 7 volts. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail will be 1 afterwards. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16036.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"                 -- set the DMM for DC volts functionality 
--- dmm.reset("active")                  -- reset DC volts to default settings 
--- dmm.range = 10                       -- set the range to 10 volts 
--- dmm.nplc = 0.1                       -- set the nplc to 0.1 
--- dmm.limit[1].autoclear = dmm.OFF     -- disable auto clearing for limit 1 
--- dmm.limit[1].high.value = 5          -- set high limit on 1 to fail if reading                                     -- exceeds 5 volts 
--- dmm.limit[1].low.value = 3           -- set low limit on 1 to fail if reading                                     -- is less than 3 volts 
--- dmm.limit[1].enable = dmm.ON         -- enable limit 1 checking for DC volt                                     -- measurements 
--- dmm.limit[2].autoclear = dmm.OFF     -- disable auto clearing for limit 2 
--- dmm.limit[2].high.value = 7          -- set high limit on 2 to fail if reading                                     -- exceeds 7 volts 
--- dmm.limit[2].low.value = 1           -- set low limit on 2 to fail if reading                                     -- is less than 1 volts 
--- dmm.limit[2].enable = dmm.ON         -- enable limit 2 checking for DC volt                                     -- measurements 
--- dmm.measurecount = 50                -- set the measure count to 50 
--- LimitBuffer = dmm.makebuffer(100)    -- create a reading buffer that can store                                     -- 100 readings 
--- dmm.measure(LimitBuffer)             -- take 50 readings and store them in                                     -- LimitBuffer 
---                                      -- then check if any of the 50 readings                                     -- were outside of the limits 
--- print("limit 1 high fail = " .. dmm.limit[1].high.fail) 
--- print("limit 1 low fail = " .. dmm.limit[1].low.fail) 
--- print("limit 2 high fail = " .. dmm.limit[2].high.fail) 
--- print("limit 2 low fail = " .. dmm.limit[2].low.fail) 
--- dmm.limit[1].clear()                 -- clear limit 1 conditions
--- dmm.limit[2].clear()                 -- clear limit 2 conditions
--- 
--- --Sample output that shows all readings are within limit values (all readings between 3 and 5 volts):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 high values (a 6 volt reading would cause this condition or a reading greater than 5 but less than 7.):
--- --limit 1 high fail = 1
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 and 2 low values (a 0.5 volts reading would cause this condition or a reading less than 1):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 1
--- --limit 2 high fail = 0
--- --limit 2 low fail = 1
--- ```
---@type dmmlimitenablevalue
dmmlimitArr.enable= 0

---@class dmm.math
dmm.math = {}



dmm.OFF = 0
dmm.ON = 1

---@alias dmmmathenablevalue
---|`dmm.OFF`
---|`dmm.ON`



--- **This attribute enables or disables math operations on measurements for the selected measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is not available for "nofunction". If you write this attribute for "nofunction", an error message is generated.When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16042.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"
--- dmm.reset("active")
--- dmm.measurecount = 5
--- MathBuffer = dmm.makebuffer(100)
---  
--- MathBuffer.appendmode = 1
--- dmm.measure(MathBuffer)
--- dmm.math.format = dmm.MATH_MXB
--- dmm.math.mxb.mfactor = 1e6
--- dmm.math.mxb.bfactor = 0
--- dmm.math.mxb.units = "["
--- dmm.math.enable = dmm.ON
--- 
--- --Configure the DMM for DC volts.
--- --Reset DC volts to the default settings.
--- --Set the measure count to 5.
--- --Create a reading buffer named MathBuffer that can store 100 readings.
--- -- 
--- --Set the buffer to append readings.
--- --Take 5 readings and store them in MathBuffer with no math operation.
--- --Enable math operations for mx+b operation, with m set to 1e6 and b set to 0, with units set to micro.
--- -- 
--- ```
---@type dmmmathenablevalue
dmm.math.enable = 0


dmm.MATH_NONE = 0
dmm.MATH_MXB = 1
dmm.MATH_PERCENT = 2
dmm.MATH_RECIPROCAL = 3

---@alias dmmmathformatstate
---|`dmm.MATH_NONE`
---|`dmm.MATH_MXB`
---|`dmm.MATH_PERCENT`
---|`dmm.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is not available for "nofunction". If this command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.If you set this attribute to dmm.MATH_NONE, math operation is disabled, even if math operation (dmm.math.enable) is enabled.Use a setting of dmm.MATH_MXB to havewhere:If you are using relative offset measurement control (dmm.rel.enable), the relative offset reading is used for X.Use a setting of dmm.MATH_PERCENT to have:where:Use a setting of dmm.MATH_RECIPROCAL for 1/X operation, where X is normal or the measurement value with relative offset applied.The math operation is performed before any of the enabled limit testing.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16043.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.math.format = dmm.MATH_RECIPROCAL
--- dmm.math.enable = dmm.ON
--- 
--- --Enables the reciprocal operation on measurements.
--- ```
---@type dmmmathformatstate
dmm.math.format = 0



--- **This attribute specifies the reference constant that is used when math operations are set to percent.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is not available for "nofunction". If command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.This attribute represents the constant to use for percent when dmm.math.format = dmm.MATH_PERCENT.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16047.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.math.percent = 1250
--- 
--- --Set constant for percent operation to 1250.
--- dmm.func = "dcvolts"
--- dmm.reset("active")
--- dmm.math.format = dmm.MATH_PERCENT
--- dmm.measurecount = 1
--- dmm.math.percent = dmm.measure()
--- dmm.math.enable = dmm.ON  
--- dmm.measurecount = 5
--- MathBuffer = dmm.makebuffer(100)
--- dmm.measure(MathBuffer)
--- printbuffer(1, MathBuffer.n, MathBuffer) 
--- dmm.measurecount = 1
--- for x = 1, 3 do 
---     print(dmm.measure())
--- end
---  
--- 
--- --Configure the DMM for dc voltage measurement and reset the dc voltage function to the default settings.
--- -- 
--- --Set math format to percent. 
--- --Acquire 1 reading to use as the relative percent value.
--- --Take 5 readings with percent math enabled and store them in a buffer called MathBuffer that can store 100 readings.
--- -- 
--- --Take three additional readings without using the reading buffer.
--- -- 
--- --Sample output assuming no load was connected to DMM:
--- --2.717115286e+01, 1.259150986e+01, 1.259150986e+01, 9.277954635e+00, 3.313555227e+01
--- -- 
--- --1.292338066e+01
--- --2.452080209e+01
--- --1.557421984e+01
--- ```
dmm.math.percent = 0

---@class dmm.rel
dmm.rel = {}




--- **This function acquires a measurement and stores it as the relative offset value.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This attribute is not applicable for "continuity" and "nofunction".This command triggers the instrument to make a new measurement for the selected function. This measurement is then stored as the new relative offset level.When you send this command, the instrument does not apply any math, limit test, or filter settings to the measurement, even if they are set. It is a measurement that is made as if these settings are disabled.If an error event occurs during the measurement, nil is returned and the relative offset level remains at the last valid setting.You must change to the function for which you want to acquire a value before sending this command.The instrument must have relative offset enabled to use the acquired relative offset value.After executing this command, use the dmm.rel.level attribute to see the last relative level value that was acquired or set by the user. If error occurs during the reading, nil is returned.An error is generated if:When an error occurs, the relative offset level setting maintains the last valid setting.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16058.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "temperature"
--- rel_value = dmm.rel.acquire()
--- 
--- --Acquires a relative offset level value for temperature.
--- ```
---@return number relativeValue The internal measurement acquired for the relative offset level value
function dmm.rel.acquire() end

dmm.ON = 1
dmm.OFF = 0

---@alias dmmrelenablevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **Enables or disables relative measurement control for the function selected by dmm.func.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is not available if dmm.func is set to "continuity" or "nofunction". If you query this attribute when either of these functions is selected, nil is returned.When relative measurements are enabled, all subsequent measured readings are offset by the relative offset specified by dmm.rel.level. Each returned measured relative reading will be the result of the following calculation:Relative reading = Actual measured reading – Relative offset valueIf you change functions with dmm.func, the relative enable setting changes to the enable setting for that function.The relative enable setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the relative enable settings you set previously are retained.An error is generated if:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16059.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "accurrent"
--- dmm.rel.acquire()
--- dmm.rel.enable = dmm.ON
--- 
--- --Enables the relative measurements for AC current and uses the acquire command to set the relative level attribute.
--- ```
---@type dmmrelenablevalue
dmm.rel.enable = 0



--- **The offset value for relative measurements for the function selected by dmm.func.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is not available if dmm.func is set to "continuity" or "nofunction". If you query this attribute when either of these functions is selected, nil is returned.When relative measurements are enabled (as set by dmm.rel.enable), all subsequent measured readings are offset by the specified relative offset value. Specifically, each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading – Relative offset valueChanging functions with dmm.func reflects the relative level offset setting for that function.The relative offset level setting is saved with the dmm.func function setting, so if you use another function, then return to the previous function, the relative offset level settings you set previously are retained.An error is generated:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16060.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "accurrent"
--- dmm.rel.level = dmm.measure()
--- rel_value = dmm.measure()
--- dmm.rel.level = rel_value
--- dmm.func = "temperature"
--- rel_value = dmm.rel.acquire()
--- 
--- --Perform an AC current measurement and use it as the relative offset value.
--- --Take a measurement and store it in the variable rel_value.
--- --Use the rel_value to set the relative level attribute.
--- --Acquire a relative offset level value for temperature.
--- ```
dmm.rel.level = 0

---@class scan.trigger
scan.trigger = {}




--- **This function clears the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the arm, channel, measurement, and sequence event detectors of the trigger model to the undetected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16977.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.clear()
--- 
--- --Clears the trigger model.
--- ```
function scan.trigger.clear() end
---@class schedulealarmArr
schedulealarmArr = {}

---@type schedulealarmArr[]
schedule.alarm = {}



schedule.OFF = 0
schedule.ON = 1

---@alias schedulealarmenablestate
---|`schedule.OFF`
---|`schedule.ON`



--- **This attribute enables or disables an alarm.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If you enable an alarm that has a start time that is in the past, the alarm executes immediately.If an alarm time in the past is used to start a scan, the alarm time may be missed by the scan start. This can occur because the scan clears any pending triggers before it begins, so it will miss any trigger generated from the alarm enable. To prevent a missed alarm, start the scan in the background, then enable the alarm.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16299.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- schedule.alarm[1].enable = 1
--- 
--- --Enables alarm 1.
--- ```
---@type schedulealarmenablestate
schedulealarmArr.enable= 0



--- **This constant describes the trigger event generated by the alarm N.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- To have another trigger object respond to trigger events generated by the schedule alarm, set the other object's stimulus attribute to the value of this constant.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16300.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.arm.stimulus = schedule.alarm[1].EVENT_ID
--- 
--- --Uses a trigger event on alarm 1 to be the stimulus for the trigger arm.
--- ```
schedulealarmArr.EVENT_ID= 0



--- **This attribute describes the fractional seconds portion of the alarm time.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 1588 has too much resolution to represent in a single floating-point value so the alarm times are split into two values (seconds and fractional seconds).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16301.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- get current time and store in variable sec
--- sec = os.time()
--- -- set alarm 1 seconds to be 1 minute after current time                               
--- schedule.alarm[1].seconds = sec + 60
--- -- set alarm 1 fractional seconds to be 0.5
--- schedule.alarm[1].fractionalseconds = 0.5
--- print("value of sec is ", sec) 
--- print("value of alarm 1 seconds is ",  schedule.alarm[1].seconds) 
--- print("value of alarm 1 fractional seconds is ", schedule.alarm[1].fractionalseconds)
--- 
--- --Create an alarm to occur 60.5 seconds from current time in UTC seconds.
--- --Output:
--- --value of sec is 	1.306405866e+009
--- --value of alarm 1 seconds is 	1.306405926e+009
--- --value of alarm 1 fractional seconds is 	5.000000000e-001
--- ```
schedulealarmArr.fractionalseconds= 0



--- **This attribute describes the time, in seconds, between adjacent firings of the alarm.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16302.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- 0.5schedule.alarm[1].period = 0.5
--- 
--- --Set a period of 0.5 seconds between firings of alarms after the initial alarm.
--- ```
schedulealarmArr.period= 0



--- **The seconds portion of the alarm time in PTP seconds.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 1588 has too much resolution to represent in a single floating-point value, so the alarm times are split into two values (seconds and fractional seconds).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16303.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- sec,ns = ptp.time()
--- schedule.alarm[1].ptpseconds = sec + 30
--- 
--- --Create an alarm to occur 30 seconds from current time in PTP seconds.
--- ```
schedulealarmArr.ptpseconds= 0



--- **This attribute describes the number of times an alarm repeats after the first alarm firing.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The alarm will fire a total of count+1 times. If 0 and period is nonzero, the alarm fires forever.Once an alarm begins, the repetition counts down for each trigger generated. It ends at zero (0). You must set this repetition back to some value if you intend to reissue the alarm. Otherwise, the alarm will either not fire (if the period is zero) or fire forever (if period is nonzero).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16304.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- schedule.alarm[1].repetition = 10
--- 
--- --Set the alarm to fire 10 times.
--- ```
schedulealarmArr.repetition= 0



--- **The seconds portion of the alarm time in UTC seconds.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 1588 has too much resolution to represent in a single floating-point value, so the alarm times are split into two values (seconds and fractional seconds).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16305.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local l_myTime
--- l_myTime = os.time{year = 2008, month = 3, day = 15, hour = 10}
--- schedule.alarm[1].seconds = l_myTime
--- 
--- --Create an alarm to occur on March 15, 2008 at 10 am in UTC seconds.
--- ```
schedulealarmArr.seconds= 0

---@type slotArr[]
slotArr.interlock = {}



slot.ON = nil
slot.OFF = nil

---@alias slotinterlockoverridevalue
---|`slot.ON`
---|`slot.OFF`



--- **This attribute suppresses or permits interlock errors to be generated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command suppresses errors that would otherwise be generated when the interlock is not closed. If the interlock is not physically connected, channels will still not close.This attribute exists only for installed cards that support detecting an interlock break. Otherwise, the return value is nil. If the card supports detecting an interlock break, set this attribute to the appropriate response. To enable interlock override on the card, set to slot.ON. To disable it, set to slot.OFF. This setting applies to all interlocks on the card.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16329.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- slot[3].interlock.override = slot.ON
--- 
--- --Suppresses interlock errors.
--- ```
---@type slotinterlockoverridevalue
slotArr.interlock.override= 0



--- **This attribute indicates the interlock state of a card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute will not exist for a slot if a card is not installed or the card installed does not support detecting an interlock break. In these cases, the return value is nil. Use this attribute to query the interlock state for cards that support detecting interlock break. 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16330.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
slotArr.interlock.state= 0

---@type slotArr[]
slotArr.poles = {}




--- **This attribute indicates if a four-pole setting is supported for the channels on the card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute only exists if a card is installed and if the card supports four‑pole settings for the channels on the card. If not, the value is nil. If supported, the value is 1.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16335.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- fourPole3 = slot[3].poles.four
--- print(fourPole3)
--- 
--- --Queries if slot 3 supports four-pole settings for the channels on the card.
--- --Output if card supports four pole:
--- --1.000000000e+00
--- --Output if card does not support four pole:
--- --nil
--- ```
slotArr.poles.four= 0



--- **This attribute indicates if a one-pole setting is supported for the channels on the specified card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute only exists if a card is installed and if the card supports one‑pole settings for the channels on the card. If not, the value is nil. If supported, the value is 1.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16336.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[3].poles.one)
--- 
--- --Query to see if slot 3 supports one-pole settings for the channels on the card.
--- --Output if card supports one pole:
--- --1.000000000e+00
--- --Output if card does not support one pole:
--- --nil
--- ```
slotArr.poles.one= 0



--- **This attribute indicates if a two-pole setting is supported for the channels on the card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute only exists is a card is installed and if the card supports a two‑pole setting for the channels on the card.If not, the value is nil. If supported, the value is 1.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16337.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- twoPole3 = slot[3].poles.two
--- print(twoPole3)
--- 
--- --Query to see if slot 3 supports two-pole settings for the channels on the card.
--- --Output if card supports two pole:
--- --1.000000000e+00
--- --Output if card does not support two pole:
--- --nil
--- ```
slotArr.poles.two= 0

---@type slotArr[]
slotArr.thermal = {}




--- **This attribute indicates the thermal state of the card in the specified slot.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if a card is installed and if the installed card supports thermal state detection. If thermal state detection is not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16346.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[3].thermal.state)
--- 
--- --Query the thermal state on slot 3. If specifications might be affected by the thermal state, the output is:
--- --1.000000000e+00
--- ```
slotArr.thermal.state= 0

---@class script.user
script.user = {}




--- **This function returns an iterator that can be used in a for loop to iterate over all the scripts stored in nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function accesses the catalog of scripts stored in nonvolatile memory, which allows you to process all scripts in nonvolatile memory. The entries are enumerated in no particular order.Each time the body of the function executes, name takes on the name of one of the scripts stored in nonvolatile memory. The for loop repeats until all scripts have been iterated.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16862.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in script.user.catalog() do
---    print(name)
--- end
--- 
--- --Retrieve the catalog listing for user scripts.
--- ```
function script.user.catalog() end
---@class comm.lan
comm.lan = {}




--- **This attribute controls whether or not any communication using the LAN connection is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is the master control setting. When this is true (enabled), you may individually control web, Telnet, VXI-11 and raw socket access to the instrument. However, when this is false (disabled), all LAN communication is disabled and this overrides the individual LAN enabled settings.To disable only certain LAN communication with the instrument, enable this attribute and set the specific LAN communication attribute to false for raw sockets, Telnet, VXI-11 or web.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20163.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- comm.lan.enable = false
--- 
--- --Disable all LAN communication with instrument.
--- ```
comm.lan.enable = 0

---@class comm.gpib
comm.gpib = {}




--- **This attribute describes whether or not communication using the GPIB connection is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This performs the same function as the MENU > GPIB > ENABLE option that is available through the front panel of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17023.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
comm.gpib.enable = 0

---@class localnode.define
localnode.define = {}


---@type slotArr[]
slotArr.rows = {}




--- **This attribute returns the number of rows in the matrix on the card in the specified slot.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available for a slot if the installed card supports matrix channels. If matrix channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17756.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[4].rows.matrix)
--- 
--- --Returns the number of rows in the matrix on the card in slot 4.
--- --Example output:
--- --1.2000000000e+01
--- ```
slotArr.rows.matrix= 0

---@type slotArr[]
slotArr.columns = {}




--- **This attribute returns the number of columns in the matrix for the card in the specified slot.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is only available if the installed plug-in card supports matrix channels. If matrix channels are not available, the return value is nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17757.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[4].columns.matrix)
--- 
--- --Returns the number of columns in the matrix on the card in slot 4 (28).
--- --Example output:
--- --2.800000000e+01
--- ```
slotArr.columns.matrix= 0

---@type slotArr[]
slotArr.banks = {}




--- **This attribute describes the number of banks in the matrix for a card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Returns the number of banks in the matrix on the card in the specified slot. If no matrix or no card exists, it returns nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17758.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].banks.matrix)
--- 
--- --Returns the number of banks in the matrix on the card in slot 1 (4 banks).
--- --Output:
--- --4.000000000e+000
--- ```
slotArr.banks.matrix= 0

---@class ptp.ds
ptp.ds = {}




--- **This function is a read-only string that returns the settings of the different data sets (DS) associated with the IEEE‑1588 2008 specification.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/20215.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(ptp.ds.info)
--- 
--- --Output:
--- --Current DS
--- --         Steps removed:  0
--- --    Offset from Master:  0.000000000
--- --       Mean Path Delay:  0.000000000
--- --Default DS
--- --       Number of Ports:  1
--- --        Two Step Clock:  T
--- --            Priority 1:  128
--- --            Priority 2:  128
--- --                Domain:  0
--- --        Clock Identity:  12 34 56 FF FE 65 43 21
--- --    Clock Qual - Class:  248
--- -- Clock Qual - Accuracy:  254
--- -- Clock Qual - Variance:  0
--- --            Slave Only:  F
--- --Parent DS
--- --           Parent Stats:  F
--- --  Parent Clock Identify:  12 34 56 FF FE 65 43 21
--- --   Parent Port Identify:  0
--- --      Parent Offset Var:  65535
--- --Parent Phase Chnge Rate:  2147483647
--- --          GM Priority 1:  128
--- --          GM Priority 2:  128
--- --   GM Clck Qual - Class:  248
--- --GM Clck Qual - Accuracy:  254
--- --GM Clck Qual - Variance:  0
--- --      GM Clock Identify:  12 34 56 FF FE 65 43 21
--- --Time Properties DS
--- --     Current UTC Offset:  0
--- --                Leap 59:  F
--- --                Leap 61:  F
--- --Current UTC Offset Vald:  T
--- --          PTP Timescale:  T
--- --         Time Traceable:  F
--- --    Frequency Traceable:  F
--- --            Time Source:  Internal Oscillator
--- --Port DS
--- --         Clock Identify:  12 34 56 FF FE 65 43 21
--- --          Port Identify:  1
--- --             Port State:  6
--- -- Log Mn Delay Req Intrvl: 4
--- --   Peer mean Path Delay:  0
--- --  Log Announce Interval:  1
--- -- Announc Receipt Timeout: 3
--- --      Log Sync Interval:  0
--- --        Delay Mechanism:  E2E
--- --Log Mn PDelay Rq Intrvl:  0
--- --         Version Number:  2
--- --Foreign Master DS 1
--- --      Announce Messages:  2
--- -- Frgn Mstr Clock Idntfy:  00 60 1A FF FE 01 54 29
--- --  Frgn Mstr Port Idntfy:  1
--- ```
ptp.ds.info = 0

---@class lan.config.dns
lan.config.dns = {}




--- **Configures DNS server IP addresses.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is an array of Domain Name System (DNS) server addresses. These addresses take priority for DNS lookups and are consulted before any server addresses that are obtained using DHCP. This allows local DNS servers to be specified that take priority over DHCP‑configured global DNS servers.You can specify up to two addresses. The address specified by 1 is consulted first for DNS lookups. dnsAddress must be a string specifying the IP address of the DNS server in dotted decimal notation.Unused entries are returned as "0.0.0.0" when read. To disable an entry, set its value to "0.0.0.0" or the empty string "".Although only two addresses may be manually specified here, the instrument uses up to three DNS server addresses. If two are specified here, only one that is given by a DHCP server is used. If no entries are specified here, up to three addresses that are given by a DHCP server are used.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14898.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dnsaddress = "164.109.48.173"
--- lan.config.dns.address[1] = dnsaddress
--- 
--- --Set the DNS address 1 to 164.109.48.173.
--- ```
---@type integer[]
lan.config.dns.address = 0



--- **Configures the dynamic DNS domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute holds the domain to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the domain specified in this attribute with the DNS server.The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 255 characters are allowed, you must make sure the combined length is also no more than 255 characters.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14899.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.domain)
--- 
--- --Outputs the present dynamic DNS domain. For example, if the domain is "Matrix", the response is:
--- --Matrix
--- ```
lan.config.dns.domain = 0


lan.ENABLE = nil
lan.DISABLE = nil

---@alias lanconfigdnsdynamicstate
---|`lan.ENABLE`
---|`lan.DISABLE`



--- **Enables or disables the dynamic DNS registration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Dynamic DNS registration works with DHCP to register the host name with the DNS server. The host name is specified in the lan.config.dns.hostname attribute.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14900.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.dynamic)
--- 
--- --Outputs the dynamic registration state.
--- --If dynamic DNS registration is enabled, the response is:
--- --1.00000e+00
--- ```
---@type lanconfigdnsdynamicstate
lan.config.dns.dynamic = 0


lan.ENABLE = nil
lan.DISABLE = nil

---@alias lanconfigdnsverifystate
---|`lan.ENABLE`
---|`lan.DISABLE`



--- **This attribute defines the DNS host name verification state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is enabled, the instrument performs DNS lookups to verify that the DNS host name matches the value specified by lan.config.dns.hostname.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14902.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.verify)
--- 
--- --Outputs the present DNS host name verification state.
--- --If it is enabled, the output is:
--- --1.00000e+00
--- ```
---@type lanconfigdnsverifystate
lan.config.dns.verify = 0



--- **This attribute defines the dynamic DNS host name.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute holds the host name to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the host name specified in this attribute with the DNS server.The factory default value for hostName is "K‑<model number>‑<serial number>", where <model number> and <serial number> are replaced with the actual model number and serial number of the instrument (for example, "K‑3706A‑1234567"). Note that hyphens separate the characters of hostName. The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 15 characters can be entered here, you must make sure the combined length is no more than 255 characters.Setting this attribute to an empty string (in other words, setting this attribute to a string of length zero or a string that consists entirely of whitespace characters) reverts the host name to the factory default value.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/66559.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.hostname)
--- 
--- --Outputs the present dynamic DNS host name.
--- ```
lan.config.dns.hostname = 0

---@class lan.status.dns
lan.status.dns = {}




--- **This attribute contains the DNS server IP addresses.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is an array of DNS server addresses. The instrument can use up to three addresses.Unused or disabled entries are returned as "0.0.0.0" when read. The dnsAddress returned is a string specifying the IP address of the DNS server in dotted decimal notation.You can only specify two addresses manually. However, the instrument uses up to three DNS server addresses. If two are specified, only the one given by a DHCP server is used. If no entries are specified, up to three address given by a DHCP server are used.The value of lan.status.dns.address[1] is referenced first for all DNS lookups. The values of lan.status.dns.address[2] and lan.status.dns.address[3] are referenced second and third, respectively.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14909.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.dns.address[1])
--- 
--- --Outputs DNS server address 1, for example:
--- --164.109.48.173
--- ```
---@type integer[]
lan.status.dns.address = 0



--- **This attribute contains the present DNS fully qualified host name.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- A fully qualified domain name (FQDN) specifies its exact location in the tree hierarchy of the Domain Name System (DNS).A FQDN is the complete domain name for a specific computer or host on the LAN. The FQDN consists of two parts: The host name and the domain name.If the DNS host name for an instrument is not found, this attribute stores the IP address in dotted decimal notation.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14910.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.dns.name)
--- 
--- --Outputs the dynamic DNS host name.
--- ```
lan.status.dns.name = 0

---@class lan.status.port
lan.status.port = {}




--- **This attribute contains the LAN dead socket termination port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute holds the TCP port number used to reset all other LAN socket connections.To reset all LAN connections, open a connection to the DST port number.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14915.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.dst)
--- 
--- --Outputs the LAN dead socket termination port number, such as:
--- --5.03000e+03
--- ```
lan.status.port.dst = 0



--- **This attribute contains the LAN raw socket connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The TCP port number used to connect the instrument and to control the instrument over a raw socket communication interface.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14916.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.rawsocket)
--- 
--- --Outputs the LAN raw socket port number, such as:
--- --5.02500e+03
--- ```
lan.status.port.rawsocket = 0



--- **This attribute contains the LAN Telnet connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute holds the TCP port number used to connect to the instrument to control it over a Telnet interface.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14917.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.telnet)
--- 
--- --Get the LAN Telnet connection port number.
--- --Output:
--- --2.30000e+01
--- ```
lan.status.port.telnet = 0



--- **This attribute contains the LAN VXI-11 connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute stores the TCP port number used to connect to the instrument over a VXI-11 interface.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14918.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.vxi11)
--- 
--- --Outputs the VXI-11 number, such as:
--- --1.02400e+03
--- ```
lan.status.port.vxi11 = 0

---@class status.operation.user
status.operation.user = {}


---@type dmmlimitArr[]
dmmlimitArr.high = {}




--- **This attribute queries for the high test results of limit Y.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is valid for all functions except "continuity" and "nofunction". A nil response and an error are generated if the command is received when dmm.func is set to either of these functions.This attribute returns the results of high limit Y testing. If this is 1 (failed), the measurement was above the high limit (dmm.limit[Y].high.value).Note that if you are scanning or taking a series of measurements with auto clear (dmm.limit[Y].autoclear) enabled for a limit, the last measurement limit dictates the fail indication for the limit. If autoclear is disabled, you can take a series of readings and read fails to see if any of one of the readings failed.To use this attribute, you must set the limit to enable.If autoclear and limit are not set, the high fail value indicates the results of the last limit test that occurred when limits were enabled.In addition to this attribute, you can see the fail indication by reading the measurement event register of the status model. If the readings are stored in a reading buffer, the values are associated with bufferVar.statuses for the readings.You can use the digital I/O line trigger stimulus commands to generate a pulse when a limit fails. The events that can be assigned to a trigger stimulus include:This example enables limits 1 and 2 for DC volt, measurements. Limit 1 is checking for readings to be between 3 and 5 volts while limit 2 is checking for the readings to be between 1 and 7 volts. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail will be 1 afterwards. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16037.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"                 -- set the DMM for DC volts functionality 
--- dmm.reset("active")                  -- reset DC volts to default settings 
--- dmm.range = 10                       -- set the range to 10 volts 
--- dmm.nplc = 0.1                       -- set the nplc to 0.1 
--- dmm.limit[1].autoclear = dmm.OFF     -- disable auto clearing for limit 1 
--- dmm.limit[1].high.value = 5          -- set high limit on 1 to fail if reading                                     -- exceeds 5 volts 
--- dmm.limit[1].low.value = 3           -- set low limit on 1 to fail if reading                                     -- is less than 3 volts 
--- dmm.limit[1].enable = dmm.ON         -- enable limit 1 checking for DC volt                                     -- measurements 
--- dmm.limit[2].autoclear = dmm.OFF     -- disable auto clearing for limit 2 
--- dmm.limit[2].high.value = 7          -- set high limit on 2 to fail if reading                                     -- exceeds 7 volts 
--- dmm.limit[2].low.value = 1           -- set low limit on 2 to fail if reading                                     -- is less than 1 volts 
--- dmm.limit[2].enable = dmm.ON         -- enable limit 2 checking for DC volt                                     -- measurements 
--- dmm.measurecount = 50                -- set the measure count to 50 
--- LimitBuffer = dmm.makebuffer(100)    -- create a reading buffer that can store                                     -- 100 readings 
--- dmm.measure(LimitBuffer)             -- take 50 readings and store them in                                     -- LimitBuffer 
---                                      -- then check if any of the 50 readings                                     -- were outside of the limits 
--- print("limit 1 high fail = " .. dmm.limit[1].high.fail) 
--- print("limit 1 low fail = " .. dmm.limit[1].low.fail) 
--- print("limit 2 high fail = " .. dmm.limit[2].high.fail) 
--- print("limit 2 low fail = " .. dmm.limit[2].low.fail) 
--- dmm.limit[1].clear()                 -- clear limit 1 conditions
--- dmm.limit[2].clear()                 -- clear limit 2 conditions
--- 
--- --Sample output that shows all readings are within limit values (all readings between 3 and 5 volts):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 high values (a 6 volt reading would cause this condition or a reading greater than 5 but less than 7.):
--- --limit 1 high fail = 1
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 and 2 low values (a 0.5 volts reading would cause this condition or a reading less than 1):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 1
--- --limit 2 high fail = 0
--- --limit 2 low fail = 1
--- ```
dmmlimitArr.high.fail= 0



--- **This attribute specifies the upper limit for a limit test.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is valid for all functions except "continuity" and "nofunction". A nil response and an error are generated if the command is received when dmm.func is set to either of these functions.This attribute specifies or queries the high limit value of limit Y. When limit Y testing is enabled (dmm.limit[Y].enable = 1), a fail indication occurs when the measurement value is greater than this value.You may set or get the value regardless if the limit is set to a digio trigger stimulus:This example enables limits 1 and 2 for DC volt, measurements. Limit 1 is checking for readings to be between 3 and 5 volts while limit 2 is checking for the readings to be between 1 and 7 volts. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail will be 1 afterwards. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16038.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"                 -- set the DMM for DC volts functionality 
--- dmm.reset("active")                  -- reset DC volts to default settings 
--- dmm.range = 10                       -- set the range to 10 volts 
--- dmm.nplc = 0.1                       -- set the nplc to 0.1 
--- dmm.limit[1].autoclear = dmm.OFF     -- disable auto clearing for limit 1 
--- dmm.limit[1].high.value = 5          -- set high limit on 1 to fail if reading                                     -- exceeds 5 volts 
--- dmm.limit[1].low.value = 3           -- set low limit on 1 to fail if reading                                     -- is less than 3 volts 
--- dmm.limit[1].enable = dmm.ON         -- enable limit 1 checking for DC volt                                     -- measurements 
--- dmm.limit[2].autoclear = dmm.OFF     -- disable auto clearing for limit 2 
--- dmm.limit[2].high.value = 7          -- set high limit on 2 to fail if reading                                     -- exceeds 7 volts 
--- dmm.limit[2].low.value = 1           -- set low limit on 2 to fail if reading                                     -- is less than 1 volts 
--- dmm.limit[2].enable = dmm.ON         -- enable limit 2 checking for DC volt                                     -- measurements 
--- dmm.measurecount = 50                -- set the measure count to 50 
--- LimitBuffer = dmm.makebuffer(100)    -- create a reading buffer that can store                                     -- 100 readings 
--- dmm.measure(LimitBuffer)             -- take 50 readings and store them in                                     -- LimitBuffer then check if any 
---                                      -- of the 50 readings were                                     -- outside of the limits 
--- print("limit 1 high fail = " .. dmm.limit[1].high.fail) 
--- print("limit 1 low fail = " .. dmm.limit[1].low.fail) 
--- print("limit 2 high fail = " .. dmm.limit[2].high.fail) 
--- print("limit 2 low fail = " .. dmm.limit[2].low.fail) 
--- dmm.limit[1].clear()                 -- clear limit 1 conditions
--- dmm.limit[2].clear()                 -- clear limit 2 conditions
--- 
--- --Sample output that shows all readings are within limit values (all readings between 3 and 5 volts):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 high values (a 6 volt reading would cause this condition or a reading greater than 5 but less than 7.):
--- --limit 1 high fail = 1
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 and 2 low values (a 0.5 volts reading would cause this condition or a reading less than 1):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 1
--- --limit 2 high fail = 0
--- --limit 2 low fail = 1
--- ```
dmmlimitArr.high.value= 0

---@type dmmlimitArr[]
dmmlimitArr.low = {}




--- **This attribute queries for the low test results of limit Y.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is valid for all functions except "continuity" and "nofunction". A nil response and an error are generated if the command is received when dmm.func is set to either of these functions.This attribute returns the results of low limit Y testing. If this is 1 (failed) is returned, the measurement was below the low limit.Note that if you are scanning or taking a series of measurements with auto clear (dmm.limit[Y].autoclear) enabled for a limit, the last measurement limit dictates the fail indication for the limit. If autoclear is disabled, you can take a series of readings and read fails to see if any of one of the readings failed.To use this attribute, you must set the limit to enable.If autoclear and limit are not set, the low fail value indicates the results of the last limit test that occurred when limits were enabled.In addition to this attribute, you can see the fail indication by reading the measurement event register of the status model. If the readings are stored in a reading buffer, the values are associated with bufferVar.statuses for the readings.This example enables limits 1 and 2 for DC volt measurements. Limit 1 is checking for readings to be between 3 and 5 volts. Limit 2 is checking for the readings to be between 1 and 7 volts. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail will be 1 afterwards. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16039.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"                 -- set the DMM for DC volts functionality
--- dmm.reset("active")                  -- reset DC volts to default settings
--- dmm.range = 10                       -- set the range to 10 volts
--- dmm.nplc = 0.1                       -- set the nplc to 0.1
--- dmm.limit[1].autoclear = dmm.OFF     -- disable auto clearing for limit 1
--- dmm.limit[1].high.value = 5          -- set high limit on 1 to fail if reading
---                                      -- exceeds 5 volts
--- dmm.limit[1].low.value = 3           -- set low limit on 1 to fail if reading
---                                      -- is less than 3 volts
--- dmm.limit[1].enable = dmm.ON         -- enable limit 1 checking for DC volt
---                                      -- measurements
--- dmm.limit[2].autoclear = dmm.OFF     -- disable auto clearing for limit 2
--- dmm.limit[2].high.value = 7          -- set high limit on 2 to fail if reading
---                                      -- exceeds 7 volts
--- dmm.limit[2].low.value = 1           -- set low limit on 2 to fail if reading
---                                      -- is less than 1 volts
--- dmm.limit[2].enable = dmm.ON         -- enable limit 2 checking for DC volt
---                                      -- measurements
--- dmm.measurecount = 50                -- set the measure count to 50
--- LimitBuffer = dmm.makebuffer(100)    -- create a reading buffer that can store
---                                      -- 100 readings
--- dmm.measure(LimitBuffer)             -- take 50 readings and store them in
---                                      -- LimitBuffer
---                                      -- then check if any of the 50 readings
---                                      -- were outside of the limits
--- print("limit 1 high fail = " .. dmm.limit[1].high.fail)
--- print("limit 1 low fail = " .. dmm.limit[1].low.fail)
--- print("limit 2 high fail = " .. dmm.limit[2].high.fail)
--- print("limit 2 low fail = " .. dmm.limit[2].low.fail)
--- dmm.limit[1].clear()                 -- clear limit 1 conditions
--- dmm.limit[2].clear()                 -- clear limit 2 conditions
--- 
--- --Sample output that shows all readings are within limit values (all readings between 3 and 5 volts):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 high values (a 6 volt reading would cause this condition or a reading greater than 5 but less than 7.):
--- --limit 1 high fail = 1
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 and 2 low values (a 0.5 volts reading would cause this condition or a reading less than 1):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 1
--- --limit 2 high fail = 0
--- --limit 2 low fail = 1
--- ```
dmmlimitArr.low.fail= 0



--- **This attribute specifies the lower limit for a limit test.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is valid for all functions except "continuity" and "nofunction". A nil response and an error are generated if the command is received when dmm.func is set to either of these functions.This command sets the lower limit for the limit Y test for the selected measure function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.You may set or get the value regardless if the limit is set to a digital I/O trigger stimulus:This example enables limits 1 and 2 for DC volt, measurements. Limit 1 is checking for readings to be between 3 and 5 volts while limit 2 is checking for the readings to be between 1 and 7 volts. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail will be 1 afterwards. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16040.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "dcvolts"                 -- set the DMM for DC volts functionality 
--- dmm.reset("active")                  -- reset DC volts to default settings 
--- dmm.range = 10                       -- set the range to 10 volts 
--- dmm.nplc = 0.1                       -- set the nplc to 0.1 
--- dmm.limit[1].autoclear = dmm.OFF     -- disable auto clearing for limit 1 
--- dmm.limit[1].high.value = 5          -- set high limit on 1 to fail if reading                                     -- exceeds 5 volts 
--- dmm.limit[1].low.value = 3           -- set low limit on 1 to fail if reading                                     -- is less than 3 volts 
--- dmm.limit[1].enable = dmm.ON         -- enable limit 1 checking for DC volt                                     -- measurements 
--- dmm.limit[2].autoclear = dmm.OFF     -- disable auto clearing for limit 2 
--- dmm.limit[2].high.value = 7          -- set high limit on 2 to fail if reading                                     -- exceeds 7 volts 
--- dmm.limit[2].low.value = 1           -- set low limit on 2 to fail if reading                                     -- is less than 1 volts 
--- dmm.limit[2].enable = dmm.ON         -- enable limit 2 checking for DC volt                                     -- measurements 
--- dmm.measurecount = 50                -- set the measure count to 50 
--- LimitBuffer = dmm.makebuffer(100)    -- create a reading buffer that can store                                     -- 100 readings 
--- dmm.measure(LimitBuffer)             -- take 50 readings and store them in                                     -- LimitBuffer then check if any
---                                      -- of the 50 readings were                                     -- outside of the limits 
--- print("limit 1 high fail = " .. dmm.limit[1].high.fail) 
--- print("limit 1 low fail = " .. dmm.limit[1].low.fail) 
--- print("limit 2 high fail = " .. dmm.limit[2].high.fail) 
--- print("limit 2 low fail = " .. dmm.limit[2].low.fail) 
--- dmm.limit[1].clear()                 -- clear limit 1 conditions
--- dmm.limit[2].clear()                 -- clear limit 2 conditions
--- 
--- --Sample output that shows all readings are within limit values (all readings between 3 and 5 volts):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 high values (a 6 volt reading would cause this condition or a reading greater than 5 but less than 7.):
--- --limit 1 high fail = 1
--- --limit 1 low fail = 0
--- --limit 2 high fail = 0
--- --limit 2 low fail = 0
--- -- 
--- --Sample output showing at least one reading failed limit 1 and 2 low values (a 0.5 volts reading would cause this condition or a reading less than 1):
--- --limit 1 high fail = 0
--- --limit 1 low fail = 1
--- --limit 2 high fail = 0
--- --limit 2 low fail = 1
--- ```
dmmlimitArr.low.value= 0

---@class dmm.math.mxb
dmm.math.mxb = {}




--- **This attribute specifies the offset, b, for the y = mx + b operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is not available for "nofunction". If command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.This attribute specifies the offset (b) for an mx + b operation.The mx + b math operation lets you manipulate normal display readings (x) mathematically based on the calculation:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16044.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.math.mxb.bfactor = 50
--- 
--- --Sets the offset for mx +b operation to 50.
--- ```
dmm.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is not available for "nofunction". If command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16045.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.math.mxb.mfactor = 0.80
--- 
--- --Sets the scale factor for the mx +b operation to 0.80.
--- ```
dmm.math.mxb.mfactor = 0



--- **This attribute specifies the unit character for the y = mX + b operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is not available for the "nofunction" selection. If the command is queried when "nofunction" is selected, nil is returned. If it is written when "nofunction" is selected, an error is returned.This attribute represents the unit character to use when the math format is set for mx + b (dmm.math.format = dmm.MATH_MXB).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16046.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.math.mxb.units = "Q"
--- 
--- --Sets the units for the mX +b operation to "Q".
--- ```
dmm.math.mxb.units = 0

---@class scan.trigger.arm
scan.trigger.arm = {}




--- **This function clears the arm event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the arm event detector of the trigger model to the undetected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16256.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.arm.clear()
--- 
--- --Clears the arm event detector.
--- ```
function scan.trigger.arm.clear() end


--- **This function sets the arm event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the arm event detector of the trigger model to the detected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16257.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.arm.set()
--- 
--- --Sets the arm event detector to the detected state.
--- ```
function scan.trigger.arm.set() end


--- **This attribute determines which event starts the scan.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects which events cause the arm event detector to enter the detected state.Set this attribute to 0 to start the scan without waiting for an event.eventID may be one of the following trigger event IDs.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16258.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.arm.stimulus = scan.trigger.EVENT_SCAN_READY
--- 
--- --Sets trigger stimulus of the arm event detector to scan ready event.
--- scan.trigger.arm.stimulus = 0
--- 
--- --The scan begins immediately.
--- scan.trigger.arm.stimulus = digio.trigger[3].EVENT_ID
--- 
--- --The scan begins when the instrument receives a signal from digital I/O line 3.
--- ```
---@type triggerEvents|0
scan.trigger.arm.stimulus= 0

---@class scan.trigger.channel
scan.trigger.channel = {}




--- **This function clears the channel event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears the channel event detector of the trigger model (sets it to the undetected state).
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16259.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.clear()
--- 
--- --Clears the channel event detector.
--- ```
function scan.trigger.channel.clear() end


--- **This function sets the channel event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the channel event detector of the trigger model to the detected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16260.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.set()
--- 
--- --Sets the channel event detector of the trigger model to the detected state.
--- ```
function scan.trigger.channel.set() end


--- **This attribute determines which trigger events cause the channel actions to occur.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects which events cause the channel event detector to enter the detected state. Set this attribute to 0 to start the channel action immediately at the default setting.Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16976.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.stimulus = scan.trigger.EVENT_SCAN_START
--- 
--- --Sets the trigger stimulus of the channel event detector to scan start event.
--- scan.trigger.channel.stimulus = 0
--- print(scan.trigger.channel.stimulus)
--- 
--- --Starts the channel action immediately after the Scan Start Event. This also resets the stimulus to the default.
--- --Output:
--- --5.000000000e+01
--- ```
---@type triggerEvents|0
scan.trigger.channel.stimulus= 0

---@class scan.trigger.measure
scan.trigger.measure = {}




--- **This function clears the measure event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the measurement event detector of the trigger model to the undetected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16263.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.measure.clear()
--- 
--- --Clears the measurement event detector.
--- ```
function scan.trigger.measure.clear() end


--- **This function sets the measurement event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the measurement event detector of the trigger model to the detected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16264.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.measure.set()
--- 
--- --Sets the measurement event detector to the detected state.
--- ```
function scan.trigger.measure.set() end


--- **This attribute selects the trigger stimulus of the event detector trigger.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the events that cause the measurement event detector to enter the detected state. You can use this to pace each one of the measurement count readings with an event.To pace all readings by a single event, use scan.trigger.sequence.stimulus.To bypass waiting for an event, set this to 0.eventID can be set to one of the existing trigger event IDs, shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16265.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.measure.stimulus = scan.trigger.EVENT_CHANNEL_READY
--- 
--- --Sets the trigger stimulus of the measurement event detector to the channel ready event.
--- ```
---@type triggerEvents|0
scan.trigger.measure.stimulus= 0

---@class scan.trigger.sequence
scan.trigger.sequence = {}




--- **This function clears the sequence event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the sequence event detector to the undetected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16266.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.sequence.clear()
--- 
--- --Clears the sequence event detector.
--- ```
function scan.trigger.sequence.clear() end


--- **This function sets the sequence even detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the sequence event detector to the detected state.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16267.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.sequence.set()
--- 
--- --Sets the sequence event detector to the detected state.
--- ```
function scan.trigger.sequence.set() end


--- **This attribute selects the trigger stimulus for the sequence event detector.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the events that cause the sequence event detector to enter the detected state.Use this to start a set of measurement count readings that are triggered by a single event.To pace each reading by an event, use scan.trigger.measure.stimulus.To bypass pacing the readings, set this to 0.Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/16268.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.sequence.stimulus = scan.trigger.EVENT_CHANNEL_READY
--- 
--- --Sets the trigger stimulus of the sequence event detector to the channel ready event.
--- ```
---@type triggerEvents|0
scan.trigger.sequence.stimulus= 0

---@class comm.lan.web
comm.lan.web = {}




--- **This attribute describes whether or not communication using the web interface is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This performs the same function as the MENU > LAN > ENABLE > WEB option that is available through the front panel of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17009.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- comm.lan.enable = true
--- comm.lan.web.enable = false
--- 
--- --Enable all LAN communication with instrument, then disable only web communication over the LAN.
--- ```
comm.lan.web.enable = 0

---@class comm.lan.telnet
comm.lan.telnet = {}




--- **This attribute describes whether or not communication using Telnet is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This performs the same function as the MENU > LAN > ENABLE > TELNET option that is available through the front panel of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17011.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- comm.lan.enable = true
--- comm.lan.telnet.enable = false
--- 
--- --Enable all LAN communication with instrument, then disable only Telnet over the LAN.
--- ```
comm.lan.telnet.enable = 0

---@class comm.lan.vxi11
comm.lan.vxi11 = {}




--- **This attribute describes whether or not communication using a VXI-11 connection is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This performs the same function as the MENU > LAN > ENABLE > VXI11 option that is available through the front panel of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17014.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- comm.lan.enable = true
--- comm.lan.vxi11.enable = false
--- 
--- --Enable all LAN communication with instrument, then disable only VXI‑11 over the LAN.
--- ```
comm.lan.vxi11.enable = 0

---@class comm.lan.rawsockets
comm.lan.rawsockets = {}




--- **This attribute describes whether or not communication using raw socket is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This performs the same function as the MENU > LAN > ENABLE > RAW option available through the front panel of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17016.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- comm.lan.enable = true
--- comm.lan.rawsockets.enable = false
--- 
--- --Enable all LAN communication with instrument, then disable only raw sockets over the LAN.
--- ```
comm.lan.rawsockets.enable = 0



--- **This function resets commands to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The reset() command in its simplest form resets the entire TSP‑enabled system, including the controlling node and all subordinate nodes.If you want to reset a specific instrument, use either the localnode.reset() or node[X].reset() command. Use the localnode.reset() command for the local instrument. Use the node[X].reset() command to reset an instrument on a subordinate node.You can only reset the entire system using reset(true) if the node is the master. If the node is not the master node, executing this command generates an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13933.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13943.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13949.htm"])
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
--- There are two types of instrument commands:The waitcomplete() command suspends the execution of commands until the instrument operations of all previous overlapped commands are finished. This command is not needed for sequential commands.Presently, the Series 3700A has no overlapped commands implemented. However, other TSP‑enabled products, such as the Series 2600B System SourceMeter® Instruments, have overlapped commands. Therefore, when the Series 3700A is a TSP master to a subordinate device with overlapped commands, use this function to wait until all overlapped operations are completed.A group number may only be specified when this node is the master node.If no group is specified, the local group is used.If zero (0) is specified for the group, this function waits for all nodes in the system.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/13986.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14769.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14772.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14786.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14787.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14788.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/14789.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15011.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15021.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15041.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- getrange = makegetter(dmm, "range")
--- -- (intervening code)
--- r = getrange()
--- 
--- --Create a getter function called getrange.
--- --When getrange() is called, it returns the value of dmm.range and assigns it to the variable r. 
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15042.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setrange = makesetter(dmm, "range")
--- setrange(5)
--- 
--- --Use setrange with a value of 5 to set dmm.range for the currently selected function.
--- ```
---@return function setter Function that sets the value of the attribute
---@param table table Read-only table where the attribute is located
---@param attributeName string The string name of the attribute
function makesetter(table, attributeName) end


--- **This function sets the operation complete status bit when all overlapped commands are completed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the operation complete bit in the Standard Event Status Register to be set when all previously started local overlapped commands are complete. Note that each node independently sets its operation complete bits in its own status model. Any nodes that are not actively performing overlapped commands set their bits immediately. All remaining nodes set their own bits as they complete their own overlapped commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15054.htm"])
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


--- **This function prints data from tables or reading buffer subtables.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If startIndex is set to less than 1 or if endIndex is more than the size of the index, 9.910000e+37 is returned for each value outside the allowed index and an event is generated.If overlapped commands use the specified reading buffers and the commands are not complete (at least to the specified index), this function outputs data as it becomes available.When there are outstanding overlapped commands to acquire data, n refers to the index that the last entry in the table has after all the readings have completed.If you pass a reading buffer instead of a reading buffer subtable, the default subtable for that reading buffer is used.This command generates a single response message that contains all data.The output of printbuffer() is affected by the data format selected by format.data. If you set format.data to format.REAL32 or format.REAL64, you have fewer options for buffer elements. With these formats, the only buffer elements available are readings, relativetimestamps, and extravalues. If you request a buffer element that is not permitted for the selected data format, the instrument returns 9.91e37.You can use the bufferVar attributes that are listed in the following table with the print buffer command. For example, if testData is the buffer, you can use testData.dates attribute to print the date of each reading in the testData buffer.You can use bufferVar.n to retrieve the number of readings in the specified reading buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15057.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(200)
--- format.data = format.ASCII
--- format.asciiprecision = 6
--- trigger.model.load("SimpleLoop", 6, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, testData.n, testData.readings, testData.units,   testData.relativetimestamps)
--- 
--- --Reset the instrument.
--- --Set the data format and ASCII precision.
--- --Use trigger model SimpleLoop to create a 6-count loop with no delays that stores data in the reading buffer testBuffer.
--- --Start the trigger model, wait for the commands to complete, and output the readings.
--- --Use of testData.n (bufferVar.n) indicates that the instrument should output all readings in the reading buffer. In this example, testBuffer.n equals 6.
--- --Example of output data: 
--- --1.10458e-11, Amp DC, 0.00000e+00, 1.19908e-11, Amp DC, 1.01858e-01, 1.19908e-11, Amp DC, 2.03718e-01, 1.20325e-11, Amp DC, 3.05581e-01, 1.20603e-11, Amp DC, 4.07440e-01, 1.20325e-11, Amp DC, 5.09299e-01
--- for x = 1, testData.n do
---    printbuffer(x,x,testData, testData.units, testData.relativetimestamps)
--- end
--- 
--- --Using the same buffer created in Example 1, output the readings, units and relative timestamps on a separate line for each reading.
--- --1.10458e-11, Amp DC, 0.00000e+00
--- --1.19908e-11, Amp DC, 1.01858e-01
--- --1.19908e-11, Amp DC, 2.03718e-01
--- --1.20325e-11, Amp DC, 3.05581e-01
--- --1.20603e-11, Amp DC, 4.07440e-01
--- --1.20325e-11, Amp DC, 5.09299e-01
--- ```
---@param startIndex number Beginning index of the buffer to print; this must be more than one and less than endIndex
---@param endPointIndex any Ending index of the buffer to print; this must be more than startIndex and less than the index of the last entry in the tables
---@param bufferVar bufferMethods Name of first table or reading buffer subtable to print; may be a default buffer (defbuffer1 or defbuffer2) or a user‑defined buffer
---@param bufferVar2 any Second table or reading buffer subtable to print; may be a default buffer (defbuffer1 or defbuffer2) or a user‑defined buffer
---@overload fun(startIndex:number,endPointIndex:any,bufferVar:bufferMethods)
---@overload fun(startIndex:number,endPointIndex:any,bufferVar:bufferMethods,...:any)
function printbuffer(startIndex, endPointIndex, bufferVar, bufferVar2) end


--- **This function prints numbers using the configured format.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are multiple ways to use this function, depending on how many numbers are to be printed.This function prints the given numbers using the data format specified by format.data and format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/15058.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17645.htm"])
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


--- **This function creates a setup file that captures most of the present settings of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If scriptName is set to autoexec, the autoexec script in the instrument is replaced by the new configuration script.If scriptName is set to the name of an existing script, the existing script is overwritten.Once created, the script that contains the settings can be run and edited like any other script.
---
---[command help](command:kic.viewHelpDocument?["Commands_37XX/17655.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- createconfigscript("August2013")
--- 
--- --Captures the present settings of the instrument into a script named August2013.
--- ```
---@param scriptName string A string that represents the name of the script that will be created
function createconfigscript(scriptName) end
