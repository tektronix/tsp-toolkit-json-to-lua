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

---@class localnode
localnode = {}

---@class tsplinkConnectionID
tsplinkConnectionID = {}




--- **This function sets the real-time clock (sets current time of the system).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the date and time of the system based on the os.time() response passed in as its parameter. Use year, month, day, hour, min, and sec to set the time as desired. The first three parameters to os.time() are mandatory while the rest are optional. If the later 3 are not used, they default to noon for that day. The setting of the time and date does not take into account the time zone. Please update the time for your time zone.Time must be specified as UTC time. If only the time needs to be changed, the new hour, minutes, and seconds can be passed as arguments without using ostime().Set the time zone before reading the time using os.time() or before generating a UTC time from a local time specification.localnode.gettimezone()localnode.settimezone()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13943.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- systemTime = os.time({year = 2010,
---        month = 3,
---        day = 31,
---        hour = 14,
---        min = 25})
--- settime(systemTime)
--- print(settime())
--- print(setime(10, 10, 10))
--- 
--- --Sets the date and time to Mar 31, 2010 at 2:25 pm.
--- -- 
--- -- 
--- --Output:
--- --Wed Mar 31 14:25:05 2010
--- --Wed Mar 31 10:10:10 2010
--- ```
---@param hour number The desired hour from 00 to 23
---@param minute number The desired minute from 00 to 59
---@param second number The desired second from 00 to 59
---@param year number A full year (2006 or later)
---@param month number The desired month from 1 to 12
---@param day number The desired day from 1 to 31
---@overload fun(time:any)
function localnode.settime(year, month, day, hour, minute, second) end


--- **This attribute stores a user-defined description of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores a string that contains a description of the instrument. This value appears on instrument's LXI home page.This attribute's default value contains Keithley MMMM #SSSSSSSS, where: MMMM is the instrument's four-digit model number, and #SSSSSSSS is the instrument's eight-digit serial number. You can change it to a value that makes sense for your system.Using the web interface
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15008.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- description = "System in Lab 05"
--- localnode.description = description
--- 
--- --Set description equal to "System in Lab 05".
--- --Set the LXI home page of this instrument to display "System in Lab 05".
--- ```
localnode.description = 0



--- **This function retrieves the local time zone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- See localnode.settimezone() for additional details on the time zone format and a description of the fields. timeZone can be in either of the following formats:localnode.settimezone()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15011.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- timezone = localnode.gettimezone()
--- 
--- --Reads the value of the local timezone.
--- ```
---@return any timeZone The local timezone of the instrument
function localnode.gettimezone() end


--- **This attribute stores the model number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- localnode.descriptionlocalnode.revisionlocalnode.serialno
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15013.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
--- 
--- --Outputs the model number.
--- -- 
--- ```
localnode.model = 0



--- **This attribute stores the remote access password.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This write-only attribute (cannot be read) stores the password set for any remote interface. When password usage is enabled (localnode.passwordmode), supply this password to change the configuration, or to control an instrument from a web page or other remote command interface.The instrument continues to use the old password for all interactions until the command to change it executes. When changing the password, give the instrument time to execute the command before attempting to use the new password.You cannot retrieve a lost password from any command interface.The password can be reset by resetting the LAN from the front panel or by assigning an empty string to this attribute.localnode.passwordmode
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15014.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.password = "N3wpa55w0rd"
--- 
--- --Changes the remote interface password to N3wpa55w0rd.
--- ```
localnode.password = 0



--- **This attribute stores the remote access password enable mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls if and where remote access passwords are required. Set this attribute to one of the values below to enable password checking:localnode.PASSWORD_NONE or 0: Disable passwords everywherelocalnode.PASSWORD_WEB or 1: Use passwords on the web interface onlylocalnode.PASSWORD_LAN or 2: Use passwords on the web interface and all LAN interfaceslocalnode.PASSWORD_ALL or 3: Use passwords on the web interface, LAN interfaces, and all remote command interfaceslocalnode.password
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15015.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- mode = localnode.PASSWORD_WEB
--- localnode.passwordmode = mode
--- 
--- --Sets value of mode to PASSWORD_WEB.
--- --Allows use of passwords on the web interface only.
--- ```
localnode.passwordmode = 0



--- **This attribute stores local node prompting state (enabled or disabled).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls prompting. When set to 1, prompts are issued after each command message is processed by the instrument. When set to 0, prompts are not issued.The command messages do not generate prompts. The instrument generates prompts in response to command messages.When the prompting mode is enabled, the instrument generates prompts in response to command messages. There are three prompts that might be returned:Test Script Builder requires prompts. It sets the prompting mode behind the scenes. If you disable prompting, use of the Test Script Builder will hang because it will be waiting for the prompt that lets it know that the command is done executing. DO NOT disable prompting with the use of the Test Script Builder.When used in an expanded system (TSP-Link), localnode.prompts is sent to the remote master node only. Use node[N].prompts (where N is the node number) to send the command to any node in the system.localnode.showerrorslocalnode.prompts4882
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15016.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts = 1
--- 
--- --Enable prompting.
--- ```
localnode.prompts = 0

--- **This attribute stores local node prompting state (enabled or disabled).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls prompting. When set to 1, prompts are issued after each command message is processed by the instrument. When set to 0, prompts are not issued.The command messages do not generate prompts. The instrument generates prompts in response to command messages.When the prompting mode is enabled, the instrument generates prompts in response to command messages. There are three prompts that might be returned:Test Script Builder requires prompts. It sets the prompting mode behind the scenes. If you disable prompting, use of the Test Script Builder will hang because it will be waiting for the prompt that lets it know that the command is done executing. DO NOT disable prompting with the use of the Test Script Builder.When used in an expanded system (TSP-Link), localnode.prompts is sent to the remote master node only. Use node[N].prompts (where N is the node number) to send the command to any node in the system.localnode.showerrorslocalnode.prompts4882
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15016.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts = 1
--- 
--- --Enable prompting.
--- ```
nodeArr.prompts = 0

--- **This attribute enables and disables the generation of prompts for IEEE Std. 488.2 common commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When set to 1, the IEEE Std. 488.2 common commands generates prompts if prompting is enabled with the localnode.prompts attribute. If set to 1, limit the number of *trg commands sent to a running script to 50 regardless of the setting of the localnode.prompts attribute.When set to 0, IEEE Std. 488.2 common commands will not generate prompts. When using the *trg command with a script that executes trigger.wait() repeatedly, set localnode.prompts4882 to 0 to avoid problems associated with the command interface input queue filling.This attribute resets to the default value each time the instrument power is cycled.localnode.prompts
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15017.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts4882 = 0
--- 
--- --Disables IEEE Std. 488.2 common command prompting.
--- ```
localnode.prompts4882 = 0



--- **This attribute stores the firmware revision level.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the firmware revision number currently running in the instrument.localnode.descriptionlocalnode.modellocalnode.serialno
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15018.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.revision)
--- 
--- --Outputs the present revision level. Sample output:
--- --01.00a
--- ```
localnode.revision = 0



--- **This attribute stores the instrument's serial number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute indicates the instrument serial number.localnode.descriptionlocalnode.modellocalnode.revision
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15019.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext(localnode.serialno)
--- 
--- --Clears the unit's display.
--- --Places the unit's serial number on the top line of its display.
--- ```
localnode.serialno = 0



--- **This function sets the local time zone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The time zone is only used when converting between local time and UTC time when using the os.time() and os.date() functions. The instrument does not track daylight savings time.If only one parameter is given, the same time offset is used throughout the year. If four parameters are given, time is adjusted twice during the year for daylight savings time.offset and dstOffset are strings of the form "[+|-]hh[:mm[:ss]]" that indicate how much time must be added to the local time to get UTC time: hh is a number between 0 and 23 that represents hours; mm is a number between 0 and 59 that represents minutes; ss is a number between 0 and 59 that represents seconds. The minutes and seconds fields are optional.The UTC-5 time zone would be specified with the string "5" because UTC-5 is 5 hours behind UTC and one must add 5 hours to the local time to get UTC time. The time zone UTC4 would be specified as "-4" because UTC4 is 4 hours ahead of UTC and 4 hours must be subtracted from the local time to get UTC.dstStart and dstEnd are strings of the form "MM.w.dw/hh[:mm[:ss]]" that indicate when daylight savings time begins and ends respectively: MM is a number between 1 and 12 that represents the month; w is a number between 1 and 5 that represents the week within the month; dw is a number between 0 and 6 that represents the day of the week (where 0 is Sunday). The rest of the fields represent the time of day that the change takes effect: hh represents hours; mm represents minutes; ss represents seconds. The minutes and seconds fields are optional.The week of the month and day of the week fields are not specific dates.localnode.gettimezone()localnode.setglobal()localnode.settime()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15021.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- settimezone(8, 1, "3.3.0/02", "11.2.0/02" )
--- localnode.settimezone(offset)
--- 
--- --Sets offset to equal +8 hours, +1hour for DST, starts on Mar 14 at 2:00a.m, ends on Nov 7 at 2:00 a.m.
--- --Sets local time zone to offset.
--- ```
---@param offset any String representing offset from UTC
---@param dstOffset any String representing daylight savings offset from UTC
---@param dstStart any String representing when daylight savings time starts
---@param dstEnd any String representing when daylight savings time ends
---@overload fun(offset:any)
function localnode.settimezone(offset, dstOffset, dstStart, dstEnd) end


--- **This attribute sets whether or not the instrument automatically sends generated errors.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If this attribute is set to 1, the instrument automatically sends any generated errors stored in the error queue, and then clears the queue. Errors are processed after executing a command message (just before issuing a prompt, if prompts are enabled).If this attribute is set to 0, errors are left in the error queue and must be explicitly read or cleared.When used in an expanded system (TSP-Link), localnode.showerrors is sent to the remote master node only. Use node[N].showerrors (where N is the node number) to send the command to any node in the system.localnode.prompts
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15022.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.showerrors = 1
--- 
--- --Enables sending of generated errors.
--- ```
localnode.showerrors = 0

--- **This attribute sets whether or not the instrument automatically sends generated errors.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If this attribute is set to 1, the instrument automatically sends any generated errors stored in the error queue, and then clears the queue. Errors are processed after executing a command message (just before issuing a prompt, if prompts are enabled).If this attribute is set to 0, errors are left in the error queue and must be explicitly read or cleared.When used in an expanded system (TSP-Link), localnode.showerrors is sent to the remote master node only. Use node[N].showerrors (where N is the node number) to send the command to any node in the system.localnode.prompts
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15022.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.showerrors = 1
--- 
--- --Enables sending of generated errors.
--- ```
nodeArr.showerrors = 0

--- **This function resets the local node instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you want to reset a specific instrument or a subordinate node, use the node[X].reset() command.A local node reset includes a channel.reset('allslots') and a scan.reset(). In addition:channel.reset()reset()scan.reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16978.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.reset()
--- 
--- --Resets the local node.
--- ```
function localnode.reset() end
---@class slotArr
slotArr = {}

---@type slotArr[]
slot = {}



slot.PSEUDO_NONE = 0

---@alias slotpseudocardpseudoCard
---|`slot.PSEUDO_NONE`



--- **This attribute specifies the corresponding pseudocard to implement for the designated slot.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute only exists for a slot if that slot has no card installed in it. Trying to use this attribute for a slot with an installed card generates an error when writing and a nil response when reading.After assigning a pseudocard, the valid commands and attributes based on that pseudocard now exist for that slot. For example, the slot[X].idn attribute is valid.Changing the pseudocard card assignment from a card to slot.NONE invalidates existing scan lists.slot functions and attributesslot[X].idn
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13964.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myPseudoCard = slot[3].pseudocard
--- if myPseudoCard == 7072 then
---    print ("Pseudo-7072 in Slot #3")
--- end
--- 
--- --If Slot 3 is configured to have a 7072 pseudocard, the following message is output:
--- --Pseudo-7072 in Slot #3
--- slot[1].pseudocard = 0
--- print(slot[1].idn)
--- slot[1].pseudocard = 7072
--- print(slot[1].idn)
---  
---  
---  
--- slot[1].pseudocard = 0
--- print(slot[1].idn)
--- slot[1].pseudocard = 7070
--- print(slot[1].idn)
--- 
--- --This example requires an empty slot.
--- --The slot is set to empty and then set to a valid value.
--- --Output:
--- --Empty Slot
--- --7072,Pseudo 8x12 SemiMatrix,00.00a,????????
--- -- 
--- -- 
--- --To change the pseudocard, set the slot to empty again, then define the new card.
--- --Output:
--- --Empty Slot
--- --7070,Universal Adapter Card,00.00a,????????
--- ```
---@type slotpseudocardpseudoCard
slotArr.pseudocard= 0



--- **This attribute returns a string that contains information about the card in slot X.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The information that is returned depends on whether the card in the slot is an actual card or pseudocard.For actual cards, this returns a commaseparated string that contains the model number, description, firmware revision, and serial number of the card installed in slot X.For pseudocards, the response is Pseudo, followed by the model number, description, firmware revision, and ??? for the serial number.slot[X] attributes
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16328.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[1].idn)
--- 
--- --If a Model 7173 card is installed in slot 1, the response is:
--- --7173,4x12 Hi Freq Matrix AAAA,02.01a,99999999
--- ```
slotArr.idn= 0

---@class userstring
userstring = {}




--- **This function adds a user-defined string to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function associates the string value with the string name and stores this key-value pair in nonvolatile memory.Use the userstring.get() function to retrieve the value associated with the specified name.userstring.catalog()userstring.delete()userstring.get()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13987.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.add("assetnumber", "236")
--- userstring.add("product", "Widgets")
--- userstring.add("contact", "John Doe")
--- 
--- --Stores user-defined strings in nonvolatile memory.
--- ```
---@param name string The name of the string; the key of the key-value pair
---@param value string The string to associate with name; the value of the key-value pair
function userstring.add(name, value) end


--- **This function creates an iterator for the user string catalog.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The catalog provides access for userstring pairs, allowing you to manipulate all the key-value pairs in nonvolatile memory. The entries are enumerated in no particular order.userstring.add()userstring.delete()userstring.get()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13988.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in userstring.catalog() do
---    userstring.delete(name)
--- end
--- 
--- --Deletes all user strings in nonvolatile memory.
--- for name in userstring.catalog() do
---    print(name .. " = " ..
---       userstring.get(name))
--- end
--- 
--- --Prints all userstring keyvalue pairs.
--- -- 
--- --Output:
--- --product = Widgets
--- --assetnumber = 236
--- --contact = John Doe
--- --The above output lists the user strings added in the example for the userstring.add() function. Notice the key-value pairs are not listed in the order they were added.
--- ```
function userstring.catalog() end


--- **This function deletes a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function deletes the string that is associated with name from nonvolatile memory.userstring.add()userstring.catalog()userstring.get()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13989.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.delete("assetnumber")
--- userstring.delete("product")
--- userstring.delete("contact")
--- 
--- --Deletes the user-defined strings associated with the "assetnumber", "product", and "contact" names.
--- ```
---@param name string The name (key) of the key-value pair of the userstring to delete
function userstring.delete(name) end


--- **This function retrieves a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the string that is associated with name from nonvolatile memory.userstring.add()userstring.catalog()userstring.delete()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13990.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- value = userstring.get("assetnumber")
--- print(value)
--- 
--- -- 
--- --Output: 236
--- ```
---@return number value The value of the userstring key-value pair
---@param name string The name (key) of the userstring
function userstring.get(name) end
---@class tspnet
tspnet = {}




--- **This function clears any pending output data from the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears any pending output data from the device. No data is returned to the caller and no data is processed.tspnet.connect()tspnet.readavailable()tspnet.write()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14073.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(mydevice, "print([[hello]])")
--- print(tspnet.readavailable(mydevice))
---  
---  
---  
--- tspnet.clear(mydevice)
--- print(tspnet.readavailable(mydevice))
--- 
--- --Write data to device, print how much is available.
--- --Output:
--- --6.00000e+000
--- -- 
--- --Clear data and print how much data is available again.
--- --Output:
--- --0.00000e+000
--- ```
---@param connectionID string The connection ID returned from tspnet.connect()
function tspnet.clear(connectionID) end


--- **This function connects the device processing the command to another device through the LAN interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command connects a device to another device through the LAN interface. The default port number is 5025. If the portNumber is 23, the interface uses the Telnet protocol and sets appropriate termination characters to communicate with the device.If a portNumber and initString are provided, it is assumed that the remote device is not TSPenabled. The TSP does not perform any extra processing, prompt handling, error handling, or sending of commands. Additionally, the tspnet.tsp.* commands cannot be used on devices that are not TSPenabled.If neither a portNumber nor an initString is provided, the remote device is assumed to be a Keithley Instruments TSPenbled device. Depending on the state of tspnet.tsp.abortonconnect, the TSP sends an abort command to the remote device on connection. The TSP also enables TSP prompts on the remote device and error management. The TSP places remote errors from the TSPenabled device in its own error queue and prefaces these errors with Remote Error, followed by an error description. Do not manually change either the prompt functionality (localnode.prompts) or show errors by changing localnode.showerrors on the remote TSP-enabled device, or subsequent tspnet.tsp.* commands using the connection may fail.You can simultaneously connect to a maximum of 32 remote devices.localnode.promptslocalnode.showerrorstspnet.tsp.abortonconnecttspnet.disconnect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14074.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myID = tspnet.connect("192.0.2.1")
--- if myID then
---    -- Use myID as needed here
--- end
--- tspnet.disconnect(myID)
--- 
--- --Connect to a TSP-enabled device.
--- myID = tspnet.connect("192.0.2.1", 1394, "*rst\r\n")
--- if myID then
---    -- Use myID as needed here
--- end
--- tspnet.disconnect(myID)
--- 
--- --Connect to a device that is not TSPenabled.
--- ```
---@return tsplinkConnectionID connectionID The connection ID to be used as a handle in all other tspnet function calls
---@param ipAddress string IP address to which to connect
---@param portNumber number Port number
---@param initString string Initialization string to send to ipAddress
---@overload fun(ipAddress:string):string
---@overload fun(ipAddress:string,portNumber:number):string
function tspnet.connect(ipAddress, portNumber, initString) end


--- **This function disconnects the TSP-Net session specified.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function disconnects the two devices by closing the connection. The connectionID is the session handle returned by tspnet.connect().For TSP-enabled devices, this aborts any remotely running commands or scripts.tspnet.connect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14076.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- testID = tspnet.connect("192.0.2.0")
--- -- Use the connection
---  
--- tspnet.disconnect(testID)
--- 
--- --Create a TSPNet session.
--- -- 
--- --Close the session.
--- ```
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
function tspnet.disconnect(connectionID) end


--- **This function executes a command string on the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sends commandString to the remote device connection represented by connectionID. The configured termination sequence is added to commandString when it is sent to the device (tspnet.termination()). When formatString is specified, the command waits for a return string from the device. The TSP decodes the output string according to the format specified in formatString and returns this output string as arguments from the function.When this command is sent to a TSP-enabled device, the TSP blocks operation until the device responds or until a timeout error is generated. The TSP prompt from the remote device is read and thrown away. The TSP places any remotely generated errors into its error queue. When the optional formatString is not specified, this command is equivalent to tspnet.write(), except that a termination is automatically added to the end of the line.tspnet.connect()tspnet.read()tspnet.write()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14077.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.execute(myID, "runScript()")
--- 
--- --Command remote device to run script named runScript
--- tspnet.termination(myID, tspnet.TERM_CRLF)
--- tspnet.execute(myID, "*idn?")
--- print("tspnet.execute returns:",
---    tspnet.read(myID))
--- 
--- --Print the *idn? string from the remote device.
--- ```
---@return any results The results of the command execution
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
---@param commandString string The command to send to the remote device
---@param formatString any Format string for the output
---@overload fun(connectionID:tsplinkConnectionID,commandString:string):any
function tspnet.execute(connectionID, commandString, formatString) end


--- **This function retrieves the response of the remote device to *IDN.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the response of the remote device to *IDN.tspnet.connect()tspnet.disconnect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14078.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myID = tspnet.connect("192.0.2.1")
--- print(tspnet.idn(myID))
--- tspnet.disconnect(myID)
--- 
--- -- 
--- --Output:
--- --KEITHLEY INSTRUMENTS INC.,MODEL 707B,00000170,01.10h
--- ```
---@return string idnString The returned *IDN string
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
function tspnet.idn(connectionID) end


--- **This function reads data from a remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads available data from the device and returns the number of arguments.The format string can contain the following identifiers:If formatString is not provided, the command returns a string containing the data until a new line is reached. If no data is available, the TSP holds off operation until the requested data is available or until a timeout error is generated. Use tspnet.timeout to specify the timeout period.When reading from a TSP-enabled remote device, the TSP removes TSP prompts and places any errors received from the remote device into its own error queue. The TSP prefaces errors from the remote device with "Remote Error," and follows this with the error number and error description.tspnet.connect()tspnet.disconnect()tspnet.timeouttspnet.write()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14079.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(myID, "*idn?\r\n")
---  
--- print("write/read returns:", tspnet.read(myID))
--- 
--- --Send the "*idn?\r\n" message to the device connected as myID.
--- --Display the response that is read from myID (based on the *idn? message).
--- ```
---@return any results The return code from the function call
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
---@param formatString string Format string for the output, maximum of 10 specifiers
---@overload fun(connectionID:string):any
function tspnet.read(connectionID, formatString) end


--- **This function checks to see if data is available from the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command checks to see if any output data is available from the device. No data is read from the instrument. This allows TSP scripts to continue to run without waiting on a remote command to finish.tspnet.connect()tspnet.disconnect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14080.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ID = tspnet.connect("192.0.2.1")
---  
--- tspnet.write(ID, "*idn?\r\n")
---  
--- repeat
---  
---    bytes = tspnet.readavailable(ID)
--- until bytes > 0
---  
--- print(tspnet.read(ID))
--- tspnet.disconnect(ID)
--- 
--- --<AIT_DELETE_END>Send commands that will create data.
--- --Wait for data to be available.
--- ```
---@return number bytesAvailable The return code from the function call
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
function tspnet.readavailable(connectionID) end


--- **This function disconnects all TSP-Net sessions.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command disconnects all devices connected through TSP-Net. For TSP-enabled devices, this causes any commands or scripts running remotely to be terminated.tspnet.connect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14081.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function tspnet.reset() end

tspnet.TERM_LF = nil
tspnet.TERM_CR = nil
tspnet.TERM_CRLF = nil
tspnet.TERM_LFCR = nil

---@alias tspnetterminationtype
---|`tspnet.TERM_LF`
---|`tspnet.TERM_CR`
---|`tspnet.TERM_CRLF`
---|`tspnet.TERM_LFCR`



--- **This function sets the device line termination sequence.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets and gets the termination character sequence that is used to indicate the end of a line for a TSP-Net connection.Using the termSequence parameter sets the termination sequence. The present termination sequence is always returned.There are four possible combinations, all of which are made up of line feeds (LF or 0x10) and carriage returns (CR or 0x13). For TSP-enabled devices, the default is tspnet.TERM_LF. For devices that are not TSPenabled, the default is tspnet.TERM_CRLF.The termination sequence resets to the default value when the connection is terminated.tspnet.connect()tspnet.disconnect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14082.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myID = tspnet.connect("192.0.2.1")
--- if myID then
---    tspnet.termination(myID, tspnet.TERM_LF)
---    tspnet.disconnect(myID)
--- end
--- 
--- -- 
--- ```
---@return tspnetterminationtype type An enumerated value indicating the termination type
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
---@param termSequence any The termination sequence
---@overload fun(connectionID:tsplinkConnectionID):tspnetterminationtype
function tspnet.termination(connectionID, termSequence) end


--- **This attribute sets the timeout value for the tspnet.connect(), tspnet.execute(), and tspnet.read() commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the amount of time the tspnet.connect(), tspnet.execute(), and tspnet.read() commands will wait for a response.The time is specified in seconds. The timeout may contain fractional seconds, but is only accurate to the nearest 10 ms.tspnet.connect()tspnet.execute()tspnet.read()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14084.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.timeout = 2.0
--- 
--- --Sets the timeout duration to two seconds.
--- ```
tspnet.timeout = 0



--- **This function writes a string to the remote instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tspnet.write() function sends inputString to the remote instrument. It does not wait for command completion on the remote instrument.The TSP sends inputString to the remote instrument exactly as indicated. The inputString must contain any necessary new lines, termination, or other syntax elements needed to complete properly.tspnet.connect()tspnet.disconnect()tspnet.read()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14089.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(myID, "runscript()\r\n")
--- 
--- --Commands the remote instrument to run script named "myID".
--- ```
---@param connectionID tsplinkConnectionID The connection ID returned from tspnet.connect()
---@param inputString string The string to be written
function tspnet.write(connectionID, inputString) end
---@class beeper
beeper = {}




--- **This function generates an audible tone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The beeper will not sound if it is disabled. It can be disabled or enabled with beeper.enable or through the front panel Main Menu.beeper.enable
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14434.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.enable = 1
--- beeper.beep(2, 2400)
--- 
--- --Enables the beeper and generates a twosecond, 2400 Hz tone
--- ```
---@param duration number The amount of time to play the tone in seconds; the allowable range is 0.1 s to 100 s
---@param frequency number The frequency of the tone in Hertz (Hz)
function beeper.beep(duration, frequency) end

beeper.OFF = 0
beeper.ON = 1

---@alias beeperenablestate
---|`beeper.OFF`
---|`disabledbeeper.ON`



--- **This attribute allows you to turn the beeper on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Disabling the beeper also disables front panel key clicks.beeper.beep()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14435.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.enable = beeper.ON
--- beeper.beep(2, 2400)
--- 
--- --Enables the beeper and generates a twosecond, 2400 Hz tone
--- ```
---@type beeperenablestate
beeper.enable = 0

---@class bit
bit = {}




--- **This function performs a bitwise logical AND operation on two numbers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Any fractional parts of value1 and value2 are truncated to form integers. The returned result is also an integer.bit.bitor()bit.bitxor()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14632.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitand(10, 9)
---  
--- print(testResult)
--- 
--- --Performs a logical AND operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 8 (binary 1000).
--- -- 
--- --Output: 8.00000e+00
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
--- Any fractional parts of value1 and value2 are truncated to make them integers. The returned result is also an integer.bit.bitand()bit.bitxor()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14634.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitor(10, 9)
---  
--- print(testResult)
--- 
--- --Performs a bitwise logical OR operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 11 (binary 1011).
--- -- 
--- --Output: 1.10000e+01
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
--- Any fractional parts of value1 and value2 are truncated to make them integers. The returned result is also an integer.bit.bitand()bit.bitor()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14635.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.bitxor(10, 9)
---  
--- print(testResult)
--- 
--- --Performs a logical XOR operation on decimal 10 (binary 1010) with decimal 9 (binary 1001), which returns a value of decimal 3 (binary 0011).
--- -- 
--- --Output: 3.00000e+00
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
--- Any fractional part of value is truncated to make it an integer. The returned result is also an integer.The least significant bit of value is at index position 1; the most significant bit is at index position 32.bit.get()bit.set()bit.test()bit.toggle()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14636.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.clear(15, 2)
---  
--- print(myResult)
--- 
--- --The binary equivalent of decimal 15 is 1111. If you clear the bit at index position 2, the returned decimal value is 13 (binary 1101).
--- --Output: 1.30000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to clear (1 to 32)
function bit.clear(value, index) end


--- **This function retrieves the weighted value of a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns the value of the bit in value at index. This is the same as returning value with all other bits set to zero (0).The least significant bit value is at index position 1; the most significant bit is at index position 32.If the indexed bit for the number is set to zero (0), the result will be zero (0).bit.clear()bit.set()bit.test()bit.toggle()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14637.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.get(10, 4)
---  
--- print(myResult)
--- 
--- --The binary equivalent of decimal 10 is 1010. If you get  the bit at index position 4, the returned decimal value is 8.
--- --Output: 8.00000e+00
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to get (1 to 32)
function bit.get(value, index) end


--- **This function returns a field of bits from the value starting at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A field of bits is a contiguous group of bits. This function retrieves a field of bits from value starting at index.The index position is the least significant bit of the retrieved field. The number of bits to return is specified by width.The least significant bit value is at index position 1; the most significant bit is at index position 32.bit.get()bit.set()bit.setfield()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14638.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.getfield(13, 2, 3)
---  
---  
---  
--- print(myResult)
--- 
--- --The binary equivalent of decimal 13 is 1101. 
--- --The field at index position 2 and width 3 consists of the binary bits 110. The returned value is decimal 6 (binary 110).
--- --Output:
--- --6.00000e+00
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to get (1 to 32)
---@param width number The number of bits to include in the field (1 to 32)
function bit.getfield(value, index, width) end


--- **This function sets a bit at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is value with the indexed bit set. The index must be between 1 and 32.The least significant bit value is at index position 1; the most significant bit is at index position 32.Any fractional part of value is truncated to make it an integer.bit.clear()bit.get()bit.getfield()bit.setfield()bit.test()bit.toggle()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14639.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.set(8, 3)
---  
--- print(myResult)
--- 
--- --The binary equivalent of decimal 8 is 1000. If the bit at index position 3 is set to 1, the returned value is decimal 12 (binary 1100).
--- -- 
--- --Output:
--- --1.20000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to set (1 to 32)
function bit.set(value, index) end


--- **This function overwrites a bit field at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is value with a field of bits overwritten, starting at index. The index specifies the position of the least significant bit of value. The width bits starting at index are set to fieldValue.The least significant bit value is at index position 1; the most significant bit is at index position 32.Before setting the field of bits, any fractional parts of value and fieldValue are truncated to form integers.If fieldValue is wider than width, the most significant bits of the fieldValue that exceed the width are truncated. For example, if width is 4 bits and the binary value for fieldValue is 11110 (5 bits), the most significant bit of fieldValue is truncated and a binary value of 1110 is used.bit.get()bit.set()bit.getfield()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14640.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- testResult = bit.setfield(15, 2, 3, 5)
---  
---  
--- print(testResult)
--- 
--- --The binary equivalent of decimal 15 is 1111. After overwriting it with a decimal 5 (binary 101) at index position 2, the returned value is decimal 11 (binary 1011).
--- -- 
--- --Output:
--- --1.10000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to set (1 to 32)
---@param width number The number of bits to include in the field (1 to 32)
---@param fieldValue number Value to write to the field
function bit.setfield(value, index, width, fieldValue) end


--- **This function returns the Boolean value (true or false) of a bit at the specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is the result of the tested bit. The least significant bit value is at index position 1; the most significant bit is at index position 32.If the indexed bit for value is 0, result is false. If the bit of value at index is 1, the returned value is true.If index is bigger than the number of bits in value, the result is false.bit.clear()bit.get()bit.set()bit.toggle()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14641.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.test(10, 4)
---  
--- print(myResult)
--- 
--- --The binary equivalent of decimal 10 is 1010. Testing the bit at index position 4 returns a Boolean value of true.
--- --Output: true
--- ```
---@return boolean result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to test (1 to 32)
function bit.test(value, index) end


--- **This function toggles the value of a bit at a specified index position.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns result, which is the result of toggling the bit index in value.Any fractional part of value is truncated to make it an integer. The returned decimal value is also an integer.The least significant bit value is at index position 1; the most significant bit is at index position 32.The indexed bit for value is toggled from 0 to 1, or 1 to 0.bit.clear()bit.get()bit.set()bit.test()Logical operators
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14642.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myResult = bit.toggle(10, 3)
---  
--- print(myResult)
--- 
--- --The binary equivalent of decimal 10 is 1010. Toggling the bit at index position 3 returns a decimal value of 14 (binary 1110).
--- --Output: 1.40000e+01
--- ```
---@return number result Result of the bit manipulation
---@param value number Specified number
---@param index number Onebased bit position within value to toggle (1 to 32)
function bit.toggle(value, index) end
---@class dataqueue
dataqueue = {}




--- **This function adds an entry to the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can only use the timeout value while adding data to the local data queue.The timeout value is ignored if the data queue is not full.The dataqueue.add() function returns false:If the value is a table, a duplicate of the table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.dataqueue.CAPACITYdataqueue.clear()dataqueue.countdataqueue.next()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14654.html"])
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
--- -- 
--- --Each line adds one item to the data queue.
--- -- 
--- --Output:
--- --The dataqueue contains:
--- --1.00000e+01
--- --1.10000e+01
--- --1.20000e+01
--- ```
---@return any results The resulting value of true or false based on the success of the function
---@param value any The data item to add; value can be of any type 
---@param timeout number The maximum number of seconds to wait for space in the data queue
---@overload fun(value:any):any
function dataqueue.add(value, timeout) end


--- **This function clears the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function forces all dataqueue.add() commands that are in progress to time out.The function deletes all data from the data queue.dataqueue.add()dataqueue.CAPACITYdataqueue.countdataqueue.next()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14655.html"])
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
--- -- 
--- --Output:
--- --There are 128 items in the data queue
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
--- dataqueue.add()dataqueue.clear()dataqueue.countdataqueue.next()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14656.html"])
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
--- --Add items to the data queue until it is at capacity.
--- -- 
--- --Output:
--- -- 
--- --There are 128 items in the data queue
--- ```
---@type dataqueueCAPACITYcount
dataqueue.CAPACITY = 0



--- **This attribute contains the number of items in the data queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The count gets updated as entries are added and read from the data queue. It is also updated when the dataqueue is cleared.The number of items in the data queue are controlled through dataqueue.add(), dataqueue.next(), and dataqueue.clear(), with a maximum of dataqueue.CAPACITY items.dataqueue.add()dataqueue.CAPACITYdataqueue.clear()dataqueue.next()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14657.html"])
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
--- --Add items to the data queue until it is at capacity.
--- -- 
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
--- If the data queue is empty, the function waits up to the timeout value.If data is not available in the data queue before the timeout expires, the return value is nil.The entries in the data queue are removed in first-in, first-out (FIFO) order.If the value is a table, a duplicate of the original table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.dataqueue.add()dataqueue.CAPACITYdataqueue.clear()dataqueue.count
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14658.html"])
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
--- --Clears the data queue, adds ten entries, then reads the entries from the data queue.
--- -- 
--- --Output:
--- --There are 10 items in the data queue
--- --1.000000000e+00
--- --2.000000000e+00
--- --3.000000000e+00
--- --4.000000000e+00
--- --5.000000000e+00
--- --6.000000000e+00
--- --7.000000000e+00
--- --8.000000000e+00
--- --9.000000000e+00
--- --1.000000000e+01
--- --There are 0 items in the data queue
--- ```
---@return any value The next entry in the data queue
---@param timeout number The number of seconds to wait for data in the queue
---@overload fun():any
function dataqueue.next(timeout) end
---@class digio
digio = {}




--- **This function reads one digital I/O line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A returned value of zero (0) indicates that the line is low. A returned value of one (1) indicates that the line is high.Digital I/O portdigio.readport()digio.writebit()digio.writeport()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14668.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(digio.readbit(4))
--- 
--- --Assume line 4 is set high, and it is then read.
--- --Output:
--- --1.00000e+00
--- ```
---@return number data A custom variable that stores the state of the I/O line
---@param N number Digital I/O line number to be read (1 to 14)
function digio.readbit(N) end


--- **This function reads the digital I/O port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the value of the input lines on the I/O port. The least significant bit (0) of the binary number corresponds to Line 1. Bit 13 corresponds to Line 14.For example, a returned value of 170 has a binary equivalent of 00000010101010, which indicates that Lines 2, 4, 6, and 8 are high (1), and the other 10 lines are low (0).Digital I/O portdigio.readbit()digio.writebit()digio.writeport()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14669.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = digio.readport()
--- print(data)
--- 
--- --Assume Lines 2, 4, 6, and 8 are set high when the I/O port is read.
--- --Output:
--- --1.70000e+02
--- -- 
--- --This is binary 10101010
--- ```
---@return number data The present value of the input lines on the digital I/O port
function digio.readport() end


--- **This function sets a digital I/O line high or low.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the output line is writeprotected using the digio.writeprotect attribute, the command is ignored.The reset() function does not affect the present state of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.The data must be zero (0) to clear the bit. Any value other than zero (0) sets the bit.digio.readbit()digio.readport()digio.trigger[N].modedigio.writeport()digio.writeprotect
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14680.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writebit(4, 0)
--- 
--- --Sets digital I/O Line 4 low (0).
--- ```
---@param N number Digital I/O trigger line (1 to 14)
---@param data number The value to write to the bit
function digio.writebit(N, data) end


--- **This function writes to all digital I/O lines.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern to be written to the I/O port. For example, a data value of 170 has a binary equivalent of 00000010101010. Lines 2, 4, 6, and 8 are set high (1), and the other 10 lines are set low (0).Writeprotected lines are not changed.The reset() function does not affect the present states of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.digio.readbit()digio.readport()digio.writebit()digio.writeprotect
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14681.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeport(255)
--- 
--- --Sets digital I/O Lines 1 through 8 high (binary 00000011111111).
--- ```
---@param data number Value to write to the port (0 to 16383)
function digio.writeport(data) end


--- **This attribute describes the writeprotect mask that protects bits from changes from the digio.writebit() and digio.writeport() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Bits that are set to one cause the corresponding line to be writeprotected.The binary equivalent of mask indicates the mask to be set for the I/O port. For example, a mask value of 7 has a binary equivalent of 00000000000111. This mask writeprotects Lines 1, 2, and 3.digio.writebit()digio.writeport()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14682.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeprotect = 15
--- 
--- --Writeprotects Lines 1, 2, 3, and 4
--- ```
digio.writeprotect = 0

---@class display
display = {}




--- **This function clears all lines of the display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function switches to the user screen and then clears the display.The display.clear(), display.setcursor(), and display.settext() functions are overlapped, nonblocking commands. That is, the script does NOT wait for one of these commands to complete. These nonblocking functions do not immediately update the display. For performance considerations, they update the physical display as soon as processing time becomes available.display.setcursor()display.settext()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14699.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function display.clear() end


--- **This function reads the present position of the cursor on the front panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function switches the display to the user screen (the text set by display.settext()), and then returns values to indicate the cursor's row and column position and cursor style.Columns are numbered from left to right on the display.display.gettext()display.screendisplay.setcursor()display.settext()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14700.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myRow, myColumn = display.getcursor()
--- print(myRow, myColumn)
--- 
--- --This example reads the cursor position into local variables and prints them. An example return is:
--- --1.000000000e+00     1.000000000e+00
--- print(display.getcursor())
--- 
--- --This example prints the cursor position directly. In this example, the cursor is in row 1 at column 3, with an invisible cursor:
--- --1.000000000e+00   3.000000000e+00   0.000000000e+00
--- ```
---@return number row The row where the cursor is
---@return number column The column where the cursor is
---@return number style Visibility of the cursor
function display.getcursor() end


--- **This function reads the text displayed on the instrument front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Sending the command without any parameters returns both lines of the display.The $N character code is included in the returned value to show where the top line ends and the bottom line begins. This is not affected by the value of embellished.When embellished is set to true, all other character codes are returned along with the message. When embellished set to false, only the message and the $N character code is returned. For information on the embedded character codes, see display.settext().The display is not switched to the user screen (the screen set using display.settext()). Text will be read from the active screen.display.clear()display.getcursor()display.setcursor()display.settext()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14702.html"])
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
--- --This returns all text in both lines of the display:
--- --User Screen       $N
--- --This indicates that the message "User Screen" is on the top line. The bottom line is blank.
--- ```
---@return string text The returned value, which contains the text that is presently displayed
---@param embellished boolean Indicates whether to return
---@param row number Selects the row from which to read the text. If row is not included, both rows of text are readThe options are
---@param columnStart number Selects the first column from which to read text; for row 1, the valid column numbers are 1 to 20; for row 2, the valid column numbers are 1 to 32; if nothing is selected, 1 is used
---@param columnEnd number Selects the last column from which to read text; for row 1, the valid column numbers are 1 to 20; for row 2, the valid column numbers are 1 to 32; the default is 20 for row 1, and 32 for row 2
---@overload fun():string
---@overload fun(embellished:boolean):string
---@overload fun(embellished:boolean,row:number):string
---@overload fun(embellished:boolean,row:number,columnStart:number):string
function display.gettext(embellished, row, columnStart, columnEnd) end


--- **This function displays a formatted input field on the instrument display that the operator can edit.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- format uses 0s, the decimal point, polarity sign, and exponents to define how the input field is formatted. format can include the options shown in the following table.  default is the value shown when the value is first displayed.minimum and maximum can be used to limit the values that can be entered. When + is selected for format, the minimum limit must be more than or equal to zero. When limits are used, the operator cannot enter values above or below these limits.After the instrument is turned on, the first time you use a display command to write to the display, the message "USER SCREEN" is cleared. After the first write, you need to use display.clear() to clear the message.The input value is limited to 1e37.Before calling display.inputvalue(), you should send a message prompt to the operator using display.prompt(). Make sure to position the cursor where the edit field should appear.After this command is sent, script execution pauses until the operator enters a value and presses the ENTER key.For positive and negative entry ("+" sign used for the value field and/or the exponent field), polarity of a non-zero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel. Polarity will also toggle when using the navigation wheel to decrease or increase the value or exponent past zero. A zero value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After sending this command and pressing the EXIT (LOCAL) key, value returns nil.display.prompt()display.setcursor()display.settext() (display.sendkey(), display.settext())
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14703.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext("Enter value between$N  -0.10 and 2.00:  ")
--- value = display.inputvalue("+0.00", 0.5, -0.1, 2.0)
--- print("Value entered = ", value)
--- 
--- --Displays an editable field (+0.50) for operator input. The valid input range is 0.10 to +2.00, with a default of 0.50.
--- -- 
--- --Output:
--- --Value entered =    1.350000000e+00
--- ```
---@param format string A string that defines how the input field is formatted. See Details for more information.
---@param default number The default value for the input value.
---@param minimum number The minimum input value.
---@param maximum number The maximum input value.
---@overload fun(format:string)
---@overload fun(format:string,default:number)
---@overload fun(format:string,default:number,minimum:number)
function display.inputvalue(format, default, minimum, maximum) end

display.UNLOCK = 0
display.LOCK = 1

---@alias displaylocallockoutlockout
---|`display.UNLOCK`
---|`keydisplay.LOCK`



--- **This attribute describes whether or not the EXIT (LOCAL) key on the instrument front panel is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set display.locallockout to display.LOCK to prevent the user from interrupting remote operation by pressing the EXIT (LOCAL) key.Set this attribute to display.UNLOCK to allow the EXIT (LOCAL) key to interrupt script/remote operation.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14707.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.locallockout = display.LOCK
--- 
--- --Disables the frontpanel EXIT (LOCAL) key.
--- ```
---@type displaylocallockoutlockout
display.locallockout = 0



--- **This function presents a menu on the front panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The menu consists of the menu name string on the top line, and a selectable list of items on the bottom line. The menu items must be a single string with each item separated by whitespace. The name for the top line is limited to 20 characters.After sending this command, script execution pauses for the operator to select a menu item. An item is selected by rotating the navigation wheel to place the blinking cursor on the item, and then pressing the navigation wheel (or ENTER key). When an item is selected, the text of that selection is returned.Pressing the EXIT (LOCAL) key will not abort the script while the menu is displayed, but it will return nil. The script can be aborted by calling the exit function when nil is returned.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14708.html"])
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
---@return string selection Name of the variable that holds the menu item selected
---@param name string Menu name to display on the top line
---@param items string Menu items to display on the bottom line
function display.menu(name, items) end


--- **This function sets the position of the cursor.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Sending this command selects the user screen and then moves the cursor to the given location.The display.clear(), display.setcursor(), and display.settext() functions are overlapped, nonblocking commands. That is, the script does NOT wait for one of these commands to complete. These nonblocking functions do not immediately update the display. For performance considerations, they update the physical display as soon as processing time becomes available.An outof-range parameter for row sets the cursor to Row 2. An outofrange parameter for column sets the cursor to Column 20 for Row 1, or 32 for Row 2.An outofrange parameter for style sets it to 0 (invisible).A blinking cursor is only visible when it is positioned over displayed text. It cannot be seen when positioned over a space character.display.clear()display.getcursor()display.gettext()display.screendisplay.settext()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14711.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.setcursor(1, 8)
--- display.settext("Hello")
--- display.setcursor(2, 14)
--- display.settext("World")
--- 
--- --This example displays the message "Hello World" on the instrument front panel, approximately center. Note that the top line of text is larger than the bottom.
--- -- 
--- ```
---@param row number The row number for the cursor (1 or 2).
---@param column number The active column position to set; row 1 has columns 1 to 20, row 2 has columns 1 to 32.
---@param style number Set the cursor to invisible (0, default) or blinking (1).
---@overload fun(row:number,column:number)
function display.setcursor(row, column, style) end


--- **This function displays text on the user screen.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function selects the user display screen and displays the given text.After the instrument is turned on, the first time you use a display command to write to the display, the message "USER SCREEN" is cleared. After the first write, you need to use display.clear() to clear the message.The display.clear(), display.setcursor(), and display.settext() functions are overlapped, nonblocking commands. That is, the script does NOT wait for one of these commands to complete. These nonblocking functions do not immediately update the display. For performance considerations, they update the physical display as soon as processing time becomes available.The text starts at the present cursor position. After the text is displayed, the cursor is after the last character in the display message.Top line text does not wrap to the bottom line of the display automatically. Any text that does not fit on the current line is truncated. If the text is truncated, the cursor is left at the end of the line.The text remains on the display until replaced or cleared.The following character codes can be also be included in the text string:display.clear()display.getcursor()display.gettext()display.screendisplay.setcursor()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14712.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.clear()
--- display.settext("Normal $BBlinking$N")
--- display.settext("$DDim $FBackgroundBlink"
---    .. "$R $$$$ 2 dollars")
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
--- This function returns a bitmasked value showing which indicators are turned on. The 16bit binary equivalent of the returned value is the bitmask. The return value is a sum of set annunciators, based on the weighted value, as shown in the table below.The following definitions exist:Where: X equals FILTER, MATH, 4_WIRE, AUTO, ARM, TRIG, STAR, SAMPLE, EDIT, ERROR, REMOTE, TALK, LISTEN, SRQ, REAR, or RELThe values correspond to the indicators listed above.For example:bit.bitand()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14719.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myAnnunciators = display.getannunciators()
--- print(myAnnunciators)
---  
---  
--- rem = bit.bitand(myAnnunciators, 1024)
--- if rem > 0 then
---    print("REM is on")
--- else
---    print("REM is off")
--- end
--- 
--- -- 
--- --Output:
--- --1.28000e+03
--- --REM is on
--- -- 
--- --REM indicator is turned on.
--- ```
---@return number annunciators The bitmasked value showing which indicators are turned on
function display.getannunciators() end


--- **This function prompts the user to enter a parameter from the front panel of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function creates an editable input field at the present cursor position, and an input prompt message on the bottom line. Example of a displayed input field and prompt:format uses 0s, the decimal point, polarity sign and exponents to define how the input field is formatted.format can include the options shown in the following table.  minimum and maximum can be used to limit the values that can be entered. When + is selected for format, the minimum limit must be more than or equal to zero. When limits are used, the operator cannot enter values above or below these limits.After the instrument is turned on, the first time you use a display command to write to the display, the message "USER SCREEN" is cleared. After the first write, you need to use display.clear to clear the message.The input value is limited to 1e37.After sending this command, script execution pauses for the operator to enter a value and press ENTER.For positive and negative entry ("+" sign used for the value field and/or the exponent field), polarity of a non-zero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel. Polarity will also toggle when using the navigation wheel to decrease or increase the value or exponent past zero. A zero value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After you send this command and press the EXIT (LOCAL) key, the value returns nil.display.inputvalue()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14740.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- value = display.prompt("0.00", "V", "Input 0 to +2V", 0.5, 0, 2)
--- print(value)
--- 
--- --The above command prompts the operator to enter a voltage value. The valid input range is 0 to +2.00, with a default of 0.50:
--- --0.50V
--- --Input 0 to +2V
--- -- 
--- --If the operator enters 0.70, the output is:
--- --7.000000000e-01
--- ```
---@param format string A string that defines how the input field is formatted. See Details for more information
---@param units string Set the units text string for the top line (eight characters maximum). This is intended to indicate the units (for example, "V" or "A") for the value.
---@param help string Text string to display on the bottom line (32 characters maximum).
---@param default number The value that is shown when the value is first displayed.
---@param minimum number The minimum input value that can be entered.
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



--- **This attribute describes the selected display screen.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting this attribute selects the display screen for the front panel. This performs the same action as pressing the DISPLAY key on the front panel. The text for the display screen is set by display.settext().Read this attribute to determine which of the available display screens was last selected.display.settext()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14741.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.screen = display.USER
--- 
--- --Selects the user display.
--- ```
---@type displayscreendisplayID
display.screen = 0



--- **This function captures the key code value for the next front panel action.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After you send this function, script execution pauses until a front panel action (for example, pressing a key or the navigation wheel, or turning the navigation wheel). After the action, the keyCode value for that action is returned.If the EXIT (LOCAL) key is pressed while this function is waiting for a front panel action, the script is not aborted.A typical use for this function is to prompt the user to press the EXIT (LOCAL) key to abort the script or press any other key to continue. For example, if the keyCode value 67 is returned (the EXIT (LOCAL) key was pressed), the exit() function can be called to abort the script.The table below lists the keyCode value for each front panel action.display.getlastkey()display.sendkey()display.settext() (display.sendkey(), display.settext())
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15962.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- key = display.waitkey()
--- print(key)
--- 
--- --Pause script execution until the operator presses a key or the navigation wheel, or rotates the navigation wheel.
--- --If the output is:
--- --8.600000000e+01
--- --It indicates that the STEP key was pressed.
--- ```
---@return number keyCode See Details for more information
function display.waitkey() end


--- **This function retrieves the key code for the last pressed key.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A history of the key code for the last pressed frontpanel key is maintained by the instrument. When the instrument is turned on, or when it is transitioning from local to remote operation, the key code is set to 0 (display.KEY_NONE).Pressing the EXIT (LOCAL) key normally aborts a script. To use this function with the EXIT (LOCAL) key, display.locallockout must be used.The table below lists the keyCode value for each front panel action.display.locallockoutdisplay.sendkey()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17047.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- key = display.getlastkey()
--- print(key)
--- 
--- --On the front panel, press the MENU key and then send the code to the left. This retrieves the key code for the last pressed key.
--- -- 
--- --Output:
--- --6.800000e+01
--- ```
---@return number keyCode See Details for more information
function display.getlastkey() end


--- **This function sends a code that simulates the action of a front panel control.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command simulates the pressing of a front panel key or navigation wheel, or the turning the navigation wheel one click to the left or right.The table below lists the keyCode value for each front panel action.Front panel keys
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17055.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.sendkey(display.KEY_RUN)
--- 
--- --Simulates pressing the RUN key.
--- ```
---@param keyCode number See Details for more information
function display.sendkey(keyCode) end
---@class errorqueue
errorqueue = {}




--- **This function clears all entries out of the error queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- errorqueue.counterrorqueue.next()Status model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14749.html"])
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
--- errorqueue.clearerrorqueue.next
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14750.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- count = errorqueue.count
--- print(count)
--- 
--- --Returns the number of entries in the error queue.
--- -- 
--- --The output below indicates that there are four entries in the error queue:
--- --4.00000e+00
--- ```
errorqueue.count = 0



--- **This function reads the oldest entry from the error queue and removes it from the queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Entries are stored in a first-in, first-out (FIFO) queue.Error codes and messages are listed in order of occurrence.Returned severity levels are described in the following table.In an expanded system, each TSPLink enabled instrument is assigned a node number. The variable errorNode returns the node number where the error originated.errorqueue.clear()errorqueue.countError and status messagesStatus model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17242.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- errorcode, message = errorqueue.next()
--- print(errorcode, message)
--- 
--- --Reads the oldest entry in the error queue. The output below indicates that the queue is empty.
--- -- 
--- --Output:
--- --0.00000e+00 Queue Is Empty
--- ```
---@return number errorCode The error code number for the entry.
---@return string message The message that describes the error code.
---@return string severity The severity level (0, 10, 20, 30, or 40). See Details for more information.
---@return string errorNode The node number where the error originated.
function errorqueue.next() end
---@class eventlog
eventlog = {}




--- **This function returns all entries from the event log as a single string and removes them from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns all events in the event log. Logged items are shown from oldest to newest. The response is a string that has the messages delimited with a new line character.This function also clears the event log.If there are no entries in the event log, this function returns the value nil.eventlog.clear()eventlog.counteventlog.enableeventlog.next()eventlog.overwritemethod
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14756.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.all())
--- 
--- --Output:
--- --17:26:35.690 10 Oct 2007, LAN0, 192.168.1.102, LXI, 0, 1192037132, 1192037155.733269000, 0, 0x0
--- --17:26:39.009 10 Oct 2007, LAN5, 192.168.1.102, LXI, 0, 1192037133, 1192037159.052777000, 0, 0x0
--- ```
---@return string|nil logString A listing of all event log entries
function eventlog.all() end


--- **This attribute gets the number of events contained in the event log.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- eventlog.all()eventlog.clear()eventlog.enableeventlog.next()eventlog.overwritemethod
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14757.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.count)
--- 
--- --Display the present number of events contained the TSP event log.
--- -- 
--- --Output looks similar to:
--- --3.00000e000
--- ```
eventlog.count = 0



--- **This function removes all entries from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- eventlog.all()eventlog.counteventlog.enableeventlog.next()eventlog.overwritemethod
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14758.html"])
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
--- When this attribute is set to eventlog.DISCARD_NEWEST, new entries are not be logged.When this attribute is set to eventlog.DISCARD_OLDEST, the oldest entry is discarded when a new entry is added.LXI event logeventlog.all()eventlog.clear()eventlog.counteventlog.enableeventlog.next()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14759.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- eventlog.overwritemethod = 0
--- 
--- --When the log is full, the event log will ignore new entries.
--- ```
---@type eventlogoverwritemethodmethod
eventlog.overwritemethod = 0


eventlog.ENABLE = 1
eventlog.DISABLE = 0

---@alias eventlogenablestatus
---|`eventlog.ENABLE`
---|`enableeventlog.DISABLE`



--- **This attribute enables or disables the event log.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the event log is disabled (eventlog.DISABLE or 0), no new events are added to the event log. You can, however, read and remove existing events.When the event log is enabled, new events are logged.LXI event logeventlog.all()eventlog.clear()eventlog.counteventlog.next()eventlog.overwritemethod
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14760.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.enable)
--- eventlog.enable = eventlog.DISABLE
--- print(eventlog.enable)
--- 
--- --Displays the present status of the TSP event log.
--- -- 
--- --Output:
--- --1.00000e00
--- --0.00000e00
--- ```
---@type eventlogenablestatus
eventlog.enable = 0



--- **This function returns the oldest message from the event log and removes it from the log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns the next entry from the event log and removes it from the log.If there are no entries in the event log, returns the value nil.LXI event logeventlog.all()eventlog.clear()eventlog.counteventlog.enableeventlog.overwritemethod
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14761.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.next())
--- 
--- --Output:
--- --17:28:22.085 10 Oct 2009, LAN2, 192.168.1.102, LXI, 0, 1192037134, <no time>, 0, 0x0
--- print(eventlog.next())
--- 
--- --Output:
--- --17:28:25.549 10 Oct 2009, LAN6, 192.168.1.102, LXI, 0, 1192037135, <no time>, 0, 0x0
--- print(eventlog.next())
--- 
--- --Output:
--- --17:28:31.563 10 Oct 2009, LAN4, 192.168.1.102, LXI, 0, 1192037136, <no time>, 0, 0x0
--- print(eventlog.next())
--- 
--- --Output:
--- --nil
--- ```
---@return string|nil logString The next log entry
function eventlog.next() end
---@class format
format = {}




--- **This attribute sets the precision (number of digits) for all numbers printed with the ASCII format.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the precision (number of digits) for numeric data printed with the print(), printbuffer(), and printnumber()functions. The format.ascii.precision attribute is only used with the ASCII format.Note that the precision is the number of significant digits printed. There is always one digit to the left of the decimal point; be sure to include this digit when setting the precision.format.byteorderformat.dataprint()printbuffer()printnumber()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14797.html"])
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
--- --2.5400000e+00
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



--- **This attribute sets the binary byte order for data printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the byte order in which data is written when printing data values with the printnumber() and printbuffer() functions. The byte order attribute is only used with the format.SREAL, format.REAL, format.REAL32, and format.REAL64 data formats.format.NORMAL, format.BIGENDIAN, and format.NETWORK select the same byte order. format.SWAPPED and format.LITTLEENDIAN select the same byte order. Selecting which to use is a matter of preference.Select the format.SWAPPED or format.LITTLEENDIAN byte order when sending data to a computer with a Microsoft Windows operating system.format.asciiprecisionformat.dataprintbuffer()printnumber()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14801.html"])
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
--- --Output depends on the terminal program you use, but will look something like:
--- -- 
--- --#0p??
--- --#0??p
--- ```
---@type formatbyteorderorder
format.byteorder = 0



--- **This attribute sets the data format for data printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The precision of numeric values can be controlled with the format.asciiprecision attribute. The byte order of format.SREAL, format.REAL, format.REAL32, and format.REAL64 can be selected with the format.byteorder attribute.The IEEE Std 754 binary formats use four bytes each for singleprecision values and eight bytes each for doubleprecision values.When data is written with any of the binary formats, the response message starts with "#0" and ends with a new line. When data is written with the ASCII format, elements are separated with a comma and space.format.asciiprecisionformat.byteorderprintbuffer()printnumber()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14803.html"])
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
--- -- 
--- -- 
--- --3.141592650e+00
--- --#0S!	@
--- ```
format.data = 0

---@class gpib
gpib = {}




--- **This attribute describes the GPIB address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change to the GPIB address takes effect when the command is processed. If there are response messages in the output queue when this command is processed, they must be read at the new address.Any response messages generated after processing this command are sent with the new settings. If command messages are being queued (sent before this command has executed), the new settings may take effect in the middle of a subsequent command message, so care should be exercised when setting this attribute from the GPIB interface.You should allow ample time for the command to be processed before attempting to communicate with the instrument again. After sending this command, make sure to use the new address to communicate with the instrument.The GPIB address is stored in nonvolatile memory. The reset function has no affect on the address.GPIB operation
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14860.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- gpib.address = 26
--- address = gpib.address
--- print(address)
--- 
--- --Sets the GPIB address and reads the address.
--- --Output:
--- --2.600000e+01
--- ```
gpib.address = 0

---@class lan
lan = {}




--- **This function re-initializes the LAN interface with new settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Disconnects all existing LAN connections to the instrument and re-initializes the LAN with the current configuration settings.This function initiates a background operation. LAN configuration could be a lengthy operation. Although the function returns immediately, the LAN initialization will continue to run in the background.Even though the LAN configuration settings may not have changed since the LAN was last connected, new settings may take effect due to the dynamic nature of DHCP or DLLA configuration.Re-initialization takes effect even if the configuration has not changed since the last time the instrument connected to the LAN.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14890.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.applysettings()
--- 
--- --Re-initialize the LAN interface with new settings.
--- ```
function lan.applysettings() end


--- **This attribute describes the LXI domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the LXI domain number.All outgoing LXI packets will be generated with this domain number. All inbound LXI packets will be ignored unless they have this domain number.lan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14893.html"])
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



--- **This attribute describes the use of the LAN Nagle algorithm.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- lan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14894.html"])
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
--- This function resets the LAN interface. It performs the commands lan.restoredefaults() and lan.applysettings().lan.applysettings()lan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14895.html"])
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
--- The settings that are restored are shown in the following table.The lan.restoredefaults() function does not reset the LAN password. The localnode.password attribute controls the web password, which can be reset separately.This is command is run when lan.reset() is sent.lan.reset()localnode.password
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14896.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.restoredefaults()
--- 
--- --Restores the LAN defaults.
--- ```
function lan.restoredefaults() end
---@class nodeArr
nodeArr = {}

---@type nodeArr[]
node = {}

--- **This function starts test scripts on a remote node.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Only the master node can issue the execute command to a remote node. This function does not run test scripts on the master node, only on a remote node.This function may only be called when the group number of the node is different than the node of the master.This function will not wait for the script to finish execution.This function cannot be used on the local node. It is provided for the sole purpose of executing scripts on a node from a remote master node. The localnode prefix to the function listing describes how remote commands are shared between nodes, rather than this command being a localnode function.Introduction to TSP Advanced Features
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15009.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[2].execute(sourcecode)
--- 
--- --Runs script code on Node 2.
--- node[3].execute("x = 5")
--- 
--- --Runs script code (previously stored on the master node) in string constant ("x = 5")  to set x equal to 5 on Node 3.
--- node[32].execute(TestDut.source)
--- 
--- --Runs the test script named "TestDut.source" (previously stored on the master node) on Node 32.
--- ```
---@param scriptCode any A string containing the source code
function localnode.execute(scriptCode) end


--- **This function starts test scripts on a remote node.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Only the master node can issue the execute command to a remote node. This function does not run test scripts on the master node, only on a remote node.This function may only be called when the group number of the node is different than the node of the master.This function will not wait for the script to finish execution.This function cannot be used on the local node. It is provided for the sole purpose of executing scripts on a node from a remote master node. The localnode prefix to the function listing describes how remote commands are shared between nodes, rather than this command being a localnode function.Introduction to TSP Advanced Features
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15009.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[2].execute(sourcecode)
--- 
--- --Runs script code on Node 2.
--- node[3].execute("x = 5")
--- 
--- --Runs script code (previously stored on the master node) in string constant ("x = 5")  to set x equal to 5 on Node 3.
--- node[32].execute(TestDut.source)
--- 
--- --Runs the test script named "TestDut.source" (previously stored on the master node) on Node 32.
--- ```
---@param scriptCode any A string containing the source code
function nodeArr.execute(scriptCode) end

--- **This function returns the value of a global variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to retrieve the value of a global variable from a remote node.Do not use this command to retrieve the value of a global variable from the local node. It is provided for the sole purpose of accessing global variables on a node from a remote master node. The localnode prefix to the function listing describes how remote commands are shared between nodes, rather than this command being a localnode command.Introduction to TSP Advanced Featureslocalnode.setglobal()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15010.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(node[5].getglobal("test_val"))
--- 
--- --Retrieves and outputs the value of the global variable named test_val from Node 5.
--- ```
---@return any value The value of the variable
---@param name any The global variable name
function localnode.getglobal(name) end

--- **This function returns the value of a global variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to retrieve the value of a global variable from a remote node.Do not use this command to retrieve the value of a global variable from the local node. It is provided for the sole purpose of accessing global variables on a node from a remote master node. The localnode prefix to the function listing describes how remote commands are shared between nodes, rather than this command being a localnode command.Introduction to TSP Advanced Featureslocalnode.setglobal()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15010.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(node[5].getglobal("test_val"))
--- 
--- --Retrieves and outputs the value of the global variable named test_val from Node 5.
--- ```
---@return any value The value of the variable
---@param name any The global variable name
function nodeArr.getglobal(name) end

--- **This function sets the value of a global variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- From a remote node, use this function to create and assign the given value to a global variable.Do not use this command to create or set the value of a global variable from the local node. It is provided for the sole purpose of accessing global variables on a node from a remote master node. The localnode prefix to the function listing describes how remote commands are shared between nodes, rather than this command being a localnode command.localnode.getglobal()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15020.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[3].setglobal("x", 5)
--- 
--- --Sets the global variable x on Node 3 to the value of 5.
--- ```
---@param name any The global variable name to create
---@param value any The value to assign to the variable
function localnode.setglobal(name, value) end

--- **This function sets the value of a global variable.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- From a remote node, use this function to create and assign the given value to a global variable.Do not use this command to create or set the value of a global variable from the local node. It is provided for the sole purpose of accessing global variables on a node from a remote master node. The localnode prefix to the function listing describes how remote commands are shared between nodes, rather than this command being a localnode command.localnode.getglobal()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15020.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[3].setglobal("x", 5)
--- 
--- --Sets the global variable x on Node 3 to the value of 5.
--- ```
---@param name any The global variable name to create
---@param value any The value to assign to the variable
function nodeArr.setglobal(name, value) end

---@class memory
memory = {}




--- **This function reads and returns the amount of memory that is available in the instrument overall and for user scripts, and storing channel patterns**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to view the available memory in the overall instrument as well as the memory available for storing user scripts and channel patterns.The response to this function is a single string that returns the overall instrument memory available, script memory available, and channel pattern memory available as comma-delimited percentages.memory.used()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15045.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- memoryAvailable = memory.available()
--- print(memoryAvailable)
--- 
--- --Reads and returns the amount of memory available in the instrument.
--- --Output:
--- --51.56, 92.84, 100.00
--- --You can also use:
--- --print(memory.available())
--- print("Memory used:", memory.used())
--- print("Memory available: ", memory.available()) 
--- 
--- --Reads and returns the amount memory used and memory available percentages.
--- --Output:
--- --Memory used: 69.14, 0.16, 12.74
--- --Memory available: 30.86, 99.84, 87.26
--- -- 
--- ```
---@return string memoryAvailable Comma-delimited string with percentages for available memory; the format is systemMemory, scriptMemory, patternMemory, where
function memory.available() end


--- **This function reports the amount of memory used in the instrument overall and for user scripts, and storing channel patterns.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to view the used memory in the overall instrument, as well as the memory used for storing user scripts and channel patterns.The response to this function is a single string that shows the overall instrument memory used, as well as the script memory used and channel pattern memory used as comma-delimited percentages.memory.available()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15046.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- MemUsed = memory.used()
--- print(MemUsed)
--- 
--- --Reads the memory used in the instrument and returns  out the percentages.
--- --Output:
--- --69.14, 0.16, 12.74
--- ```
---@return string memoryUsed A comma-delimited string with percentages for used memory; the format is systemMemory, scriptMemory, patternMemory, where
function memory.used() end
---@class script
script = {}




--- **This function creates a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The name attribute is the name that is added to the script.user.scripts table. If the name already exists in script.user.scripts, the name attribute of the existing script is set to an empty string before it is replaced by the new script.Note that name is the value that is used for the instrument front panel display. If this value is not defined, the script will not be available from the instrument front panel. You must save the new script into nonvolatile memory to keep it when the instrument is turned off.Create a script using the script.new commandGlobal variables and scriptsNamed scriptsscriptVar.save()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15064.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- myTest8 = script.new(
---    "display.clear() display.settext('Hello from myTest8')", 'myTest8')
--- myTest8()
--- 
--- --Creates a new script referenced by the variable myTest8 with the name "myTest8".
--- --Runs the script. The instrument displays "Hello from myTest8."
--- autoexec = script.new(
---    "display.clear() display.settext('Hello from autoexec')", 'autoexec')
--- 
--- --Creates a new script that clears the display when the instrument is turned on and displays "Hello from autoexec".
--- ```
---@return script_object scriptVar The name of the variable that will reference the script
---@param code string A string containing the body of the script
---@param name string The name of the script
---@overload fun(code:string):script_object
function script.new(code, name) end


--- **This function restores a script that was removed from the runtime environment.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command copies the script from nonvolatile memory back into the runtime environment, and it creates a global variable with the same name as the name of the script.script.delete()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16851.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- script.restore("test9")
--- 
--- --Restores a script named "test9" from nonvolatile memory.
--- ```
---@param name string The name of the script to be restored
function script.restore(name) end


--- **This function deletes a script from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Delete user scriptsDelete user scripts from the instrumentscriptVar.save()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16853.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- script.delete("test8")
--- 
--- --Deletes a user script named "test8" from nonvolatile memory.
--- ```
---@param scriptName string The string that represents the name of the script
function script.delete(scriptName) end
---@class timer
timer = {}




--- **This function resets the timer to zero (0) seconds.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- timer.measure.t()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15282.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- timer.reset()
--- ...
--- time = timer.measure.t()
--- print(time)
--- 
--- --Resets the timer and then measures the time since the reset.
--- --Output:
--- --1.469077e+01
--- -- 
--- --The above output indicates that timer.measure.t() was executed 14.69077 seconds after timer.reset().
--- ```
function timer.reset() end
---@class tsplink
tsplink = {}




--- **This attribute is the group number of a TSPLink node used for DTNS.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To remove the node from all groups, set the attribute value to 0.When the node is turned off, the group number for that node changes to 0.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15285.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
tsplink.group = 0



--- **This attribute reads the node number assigned to the master node.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15286.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
tsplink.master = 0



--- **This attribute defines the node number.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the TSPLink node number and saves the value in nonvolatile memory.Changes to the node number do not take effect until the next time tsplink.reset() is executed on any node in the system.Each node connected to the TSP-Link must be assigned a different node number.The maximum number of nodes allowed is 32.tsplink.reset()tsplink.state
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15287.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.node = 2
--- 
--- --Sets the TSPLink node to number 2.
--- ```
tsplink.node = 0



--- **This function reads the state of a TSP-Link synchronization line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns a value of 0 if the line is low and 1 if the line is high.tsplink.readport()tsplink.writebit()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15288.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = tsplink.readbit(3)
--- print(data)
--- 
--- --Assume Line 3 is set high, and it is then read.
--- --Output
--- --1.000000e+00
--- ```
---@return number data A custom variable that stores the state of the synchronization line
---@param N any The trigger line (1 to 3)
function tsplink.readbit(N) end


--- **This function reads the TSP-Link synchronization lines as a digital I/O port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the input pattern on the I/O port. The least significant bit of the binary number corresponds to Line 1 and Bit 3 corresponds to Line 3. For example, a returned value of 2 has a binary equivalent of 010. Line 2 is high (1), and the other 2 lines are low (0).tsplink.readbit()tsplink.writebit()tsplink.writeport()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15289.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = tsplink.readport()
--- print(data)
--- 
--- --Reads state of all three TSP lines.
--- --Assuming Line 2 is set high, the output is:
--- --2.000000e+00 
--- --(binary 010)
--- ```
---@return number data Numeric value returned indicating which register bits are set
function tsplink.readport() end


--- **This function initializes (resets) all nodes (instruments) in the TSPLink system.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function erases all knowledge of other nodes connected on the TSP-Link and regenerates the system configuration. This function must be called at least once before any remote nodes can be accessed. If the node number for any instrument is changed, the TSP-Link must be initialized again.If expectedNodes is not given, this function generates an error if no other nodes are found on the TSPLink network.If nodesFound is less than expectedNodes, an error is generated. Note that the node on which the command is running is counted as a node. For example, giving an expected node count of 1 will not generate any errors, even if there are no other nodes on the TSP-Link network.Also returns the number of nodes found.tsplink.nodetsplink.state
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15290.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@return number nodesFound The number of nodes actually found on the system
---@param expectedNodes number The number of nodes expected on the system, between 1 and 64
---@overload fun():number
function tsplink.reset(expectedNodes) end


--- **This attribute describes the TSPLink online state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- When the instrument is powered on, the state is offline. After tsplink.reset() is successful, the state is online.tsplink.nodetsplink.reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15291.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- state = tsplink.state
--- print(state)
--- 
--- --Read the state of the TSPLink. If it is online, the output is:
--- --online
--- ```
tsplink.state = 0



--- **This function sets a TSP-Link synchronization line high or low.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use tsplink.writebit() and tsplink.writeport()  to control the output state of the synchronization line when trigger operation is set to tsplink.TRIG_BYPASS.If the output line is writeprotected by the tsplink.writeprotect attribute, this command is ignored.The reset function does not affect the present states of the digital I/O lines.tsplink.readbit()tsplink.readport()tsplink.writeport()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15301.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writebit(3, 0)
--- 
--- --Sets synchronization Line 3 low (0).
--- ```
---@param bit any The trigger line (1 to 3) 
---@param data number The value to write to the bit
function tsplink.writebit(bit, data) end


--- **This function writes to all TSPLink synchronization lines.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern that is written to the I/O port. For example, a data value of 2 has a binary equivalent of 010. Line 2 is set high (1), and the other two lines are set low (0).Write protected lines are not changed (see tsplink.writeprotect).The reset() function does not affect the present states of the digital I/O lines.Use the tsplink.writebit() and tsplink.writeport() commands to control the output state of the synchronization line when trigger operation is set to tsplink.TRIG_BYPASS.tsplink.readbit()tsplink.readport()tsplink.writebit()tsplink.writeprotect
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15302.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
--- 
--- --Sets the synchronization Lines 1 and 2 high (binary 011).
--- ```
---@param data number Value to write to the port (0 to 7)
function tsplink.writeport(data) end


--- **This attribute contains the writeprotect mask that protects bits from changes by the tsplink.writebit() and tsplink.writeport() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The binary equivalent of mask indicates the mask to be set for the I/O port. For example, a mask value of 5 has a binary equivalent 101. This mask writeprotects Lines 1 and 3.tsplink.readbit()tsplink.readport()tsplink.writeport()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17630.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeprotect = 5
--- 
--- --Writeprotects Lines 1 and 3.
--- ```
tsplink.writeprotect = 0

---@class trigger
trigger = {}




--- **This function clears the command interface trigger event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector indicates if an event has been detected since the last trigger.wait() call. This function clears the trigger's event detector and discards the previous history of command interface trigger events.trigger.wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15791.html"])
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
--- You can set the stimulus of any trigger event detector to the value of this constant to have it respond to command interface trigger events.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15792.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@type eventID
trigger.EVENT_ID= nil


--- **This function waits for a command interface trigger event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to timeout seconds for a trigger on the active command interface. A command interface trigger occurs when:If one or more of these trigger events were previously detected, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.trigger.clear()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15801.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 seconds for a trigger.
--- --If false is returned, no trigger was detected during the 10second timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered True
---@param timeout number Maximum amount of time in seconds to wait for the trigger
function trigger.wait(timeout) end
---@class status
status = {}




--- **This attribute stores the status byte condition register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute's value is returned as a decimal value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 10000001. This value indicates that bit B0 and bit B7 are set.The returned value can indicate one or more status events occured. When an enabled status event occurs, a summary bit is set in this register to indicate the event occurrence. The following table contains descriptions of the bits:In addition to the above constants,  when more than one bit of the register is set, statusByte will equal the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).Status model overviewStatus byte and service request (SRQ)
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15822.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- statusByte = status.condition
--- print(statbyte)
--- 
--- --Returns statusByte.
--- --Sample output: 1.29000e+02
--- --Converting this output (129) to its binary equivalent yields: 1000 0001 
--- --Therefore, this output indicates that the set bits of the status byte condition register are presently B0 (MSS) and B7 (OSB).
--- ```
status.condition = 0



--- **This attribute stores the status node enable register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Although the status logical instrument reset affects these attributes, a system reset does not.The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the node enable register, the binary equivalent is 10000001. This value indicates that bit B0 and bit B7 are set.Assigning a value to this attribute enables one or more status events. When an enabled status event occurs, a summary bit is set in the appropriate system summary register.   The register and bit that is set depends on the TSP-Link node number assigned to this instrument.The individual bits of the status byte node enable register can be set using constants (for example, to set the enable bit of the standard event status register to B0, set status.node_enable = status.MSB). The following table contains descriptions of the bits and available values:In addition to the above values,  nodeEnableRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set nodeEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set nodeEnableRegister to 129 (1 + 128).status.conditionstatus.system.*Status model overviewStatus byte and service request (SRQ)
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15830.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- nodeEnableRegister = status.MSB + status.OSB
--- status.node_enable = nodeEnableRegister
--- 
--- --Sets the MSB and OSB bits of the status node enable register using constants.
--- -- decimal 129 = binary 10000001
--- nodeEnableRegister = 129
--- status.node_enable = nodeEnableRegister
--- 
--- --Sets the MSB and OSB bits of the status node enable register using a decimal value.
--- ```
status.node_enable = 0



--- **This attribute stores the status node event register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute's value is returned as a decimal value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 10000001. This value indicates that bit B0 and bit B7 are set.The returned value can indicate one or more status events occured.The following table contains descriptions of the bits:In addition to the above constants,  nodeEventRegister can be set to the decimal equivalent of the bit(s) set. When more than one bit of the register is set, nodeEventRegister contains the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).status.conditionstatus.system.*Status model overviewStatus byte and service request (SRQ)
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15831.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- nodeEventRegister = status.node_event
--- print(nodeEventRegister)
--- 
--- --Reads the status node event register.
--- --Sample output: 1.29000e+02
--- --Converting this output (129) to its binary equivalent yields: 1000 0001 
--- --Therefore, this output indicates that the set bits of the status byte condition register are presently B0 (MSB) and B7 (OSB).
--- ```
status.node_event = 0



--- **This function resets all bits in the system status model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all status data structure registers (enable, event, NTR, and PTR) to their default values.Refer to the specific attribute for its default values.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15861.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.reset()
--- 
--- --Resets the system status model.
--- ```
function status.reset() end


--- **This attribute stores the status service request (SRQ) enable register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Although the status logical instrument reset affects these attributes, a system reset does not.The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 10000001. This value indicates that bit B0 and bit B7 are set.Assigning a value to this attribute enables one or more status events for service request. When an enabled status event occurs, bit B6 of the status byte sets to generate an SRQ (service request).The individual bits of the status byte condition register can be set using constants (for example, to set the enable bit of the status register to B0, set status.request_enable = status.MSB). The following table contains descriptions of the bits and available values:In addition to the above values, requestSRQEnableRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set requestSRQEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set requestSRQEnableRegister to 129 (1 + 128).status.conditionstatus.system.*Status model overviewStatus byte and service request (SRQ)
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17593.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- requestSRQEnableRegister = status.MSB + status.OSB
--- status.request_enable = requestSRQEnableRegister
--- 
--- --Sets the MSB and OSB bits of the request SRQ enable register using constants.
--- -- decimal 129 = binary 10000001
--- requestSRQEnableRegister = 129
--- status.request_enable = requestSRQEnableRegister
--- 
--- --Sets the MSB and OSB bits of the request SRQ enable register using a decimal value.
--- ```
status.request_enable = 0



--- **This attribute stores the service request (SRQ) event register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute's value is returned as a decimal value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 10000001. This value indicates that bit B0 and bit B7 are set.The returned value can indicate one or more status events occured.The following table contains descriptions of the bits:In addition to the above constants, requestEventRegister can be set to the decimal equivalent of the bit(s) set. When more than one bit of the register is set, requestEventRegister contains the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).status.conditionstatus.system.*Status model overviewStatus byte and service request (SRQ)
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17594.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- requestEventRegister = status.request_event
--- print(requestEventRegister)
--- 
--- --Reads the status request event register.
--- --Sample output: 1.29000e+02
--- --Converting this output (129) to its binary equivalent yields: 1000 0001 
--- --Therefore, this output indicates that the set bits of the status request event register are presently B0 (MSB) and B7 (OSB).
--- ```
status.request_event = 0

---@class channel
channel = {}




--- **This function sets the label associated with a channel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the label of the channel specified in channelList to the value specified in the label parameter.The label parameter must be unique. In addition, it cannot be the same as the name of a channel pattern, row label, or column label.To clear the label, set label to an empty string ("") or to a string with a space as the first character.After defining a label, you can use it to specify the channel instead of using the channel specifier.An error is generated if:The label does not persist through a power cycle.channel functions and attributeschannel.setlabelcolumn()channel.setlabelrow()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15944.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabel("1A01", "start")
--- channel.close("start")
--- print(channel.getclose("allslots"))
--- 
--- --Sets the label for channel row 1 and column 01 on slot 1 to "start".
--- --Output:
--- --1A01
--- channel.setlabel("1A01", "")
--- 
--- --Clears the label for channel row 1 and column 01, slot 1 back to "1A01".
--- channel.setlabel("1A01", " ")
--- 
--- --Also clears the label for channel row 1 and column 01, slot 1 back to "1A01".
--- ```
---@param channelList string A string that lists the channel to set the label associated with it
---@param label any A string that represents the label for items in channelList, up to 19 characters
function channel.setlabel(channelList, label) end


--- **This function creates a string channel descriptor from a series of card-dependent integer arguments.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The arguments are dependent upon the card type in the specified slot. This command can only create valid channel descriptors; if an illegal argument is sent for the type of card in the specified slot, an error is generated.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17222.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- cs = channel.createspecifier(1, 1, 1)
--- print(cs)
--- 
--- --Creates a channel descriptor for Row 1, column 1 on the card in Slot 1
--- --Output:
--- --1A01
--- count = 0
--- for row = 1, 8 do
---    for col = 1, 12 do
---       ch = channel.createspecifier(1, row, col)
---       count = count + tonumber(channel.getcount(ch))
---    end
--- end
--- print("Count is " .. count .. ".")
--- 
--- --Assuming an 8x12 matrix card in slot 1, this example calculates the sum of the counts on all channels
--- --Output:
--- --Count is 1060656.
--- ```
---@return any specifier The formatted string for the channel
---@param slot any The slot number to use (1 to 6)
---@param row number The row number to use (see the matrix card documentation for limits); map row letters to numbers (A = 1, B = 2, and so on)
---@param column number Specifies the column number to use
function channel.createspecifier(slot, row, column) end


--- **This function closes channels and channel patterns specified by the channel list parameter without opening any channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- These closures are appended to the already closed channels (no previously closed channels are opened by this command).Actions associated with this function include:An error is generated if:Once an error is detected, the command stops processing and no channels are closed. channel.exclusiveclose()channel.exclusiveslotclose()channel.getclose()channel.open()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17229.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.open("allslots")
--- channel.pattern.setimage("1B02,1B04,1B06", "Chans")
--- channel.close("1A01:1A05, 1C03, Chans")
--- print(channel.getclose("slot1"))
--- 
--- --Close a variety of channels, directly and with a channel pattern; note that the output sorts the channels
--- --Output:
--- --1A01;1A02;1A03;1A04;1A05;1B02;1B04;1B06;1C03
--- ```
---@param channelList string A string that lists the channels and channel patterns to close
function channel.close(channelList) end


--- **This function queries for the closed channels indicated by the channel list parameter.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If more than one channel is closed, they are semicolondelimited in the string.  When the channelList contains a channel pattern, only the closed channels in that image are returned.The channelList parameter indicates the scope of channels affected, and can include:An error message is generated if an empty parameter string is specified or the scope of the channel list specified contains no valid channels (for example, a channel list equaling "slotX" or "allslots").If nothing is closed within the specified scope, a nil response is returned.channel.close()channel.exclusiveclose()channel.getstate()channel.open()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17247.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channelList = "1A01:1H12"
--- channel.close("1A01")
--- print(channel.getclose(channelList))
--- channel.close("1C03")
--- print(channel.getclose(channelList))
--- 
--- --For this example, assume there is a card or pseudocard in Slot 1 with no previously closed channels. The output is:
--- --1A01
--- --1A01;1C03
--- channel.close("1B03:1B05")
--- print(channel.getclose("allslots"))
--- 
--- --For this example, assume there is a card or pseudocard in Slot 1 with no previously closed channels. The output is:
--- --1B03;1B04;1B05
--- ```
---@return string closed A string listing the channels that are currently closed
---@param channelList string A string representing the channels that will be queried, including channel patterns
function channel.getclose(channelList) end


--- **This function resets the specified channels to factory default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For the items specified in channelList, the following actions occur:Using this function to reset a channel involved in scanning invalidates the existing scan list. The list has to be recreated before scanning again.The rest of the settings are unaffected. To reset the entire system to factory default settings, use the reset() command.channel functions and attributesreset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17280.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("allslots")
--- 
--- --Performs a reset operation on all channels on the instrument.
--- channel.reset("slot1")
--- 
--- --Resets channels on slot 1 only.
--- channel.reset("3A01:3A05")
--- 
--- --Resets only row 1, columns 1 through 5 on Slot 3.
--- channel.reset("5C05, 5D16")
--- 
--- --Resets row 3, column 5, and row 4 column 16, on slot 5.
--- ```
---@param channelList string A string that lists the items to reset. The string can include
function channel.reset(channelList) end


--- **This function assigns a label to a row.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A row label can be applied to columns of a matrix card. The label is then used on the display and can be accessed in a channel list (see channel list overview). For channel, you can specify any channel in the row. You cannot specify a channel pattern.The row and column label parameters must be unique. In addition, they cannot be the same as the name of a channel pattern.You can only set labels for slots and channels that are installed in the instrument.After defining a row label, you can use it to specify a channel instead of the default channel designation.On the crosspoint display, the first four characters of the label are displayed. On the bottom display, the full label is displayed.Labels can only be set for matrix cards.Errors related to channel functions and attributeschannel.getlabelcolumn()channel.getlabelrow()channel.setlabelcolumn()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17318.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabelrow("1B01", "SMU2")    
--- channel.setlabelcolumn("1B02", "DUT2")  
--- channel.close("SMU2+DUT2")   
--- print(channel.getclose("allslots"))
--- 
--- --Sets the label for the slot 1, row 2 to "SMU2" and slot 1, column 2 to "DUT2".
--- --Use the labels to close a channel.
--- --Output:
--- --1B02
--- channel.setlabelrow("1A01", "")
--- 
--- --Clears the label for row 1 on slot 1 back to default.
--- channel.setlabelrow("1A01", " ")
--- 
--- --Also clears the label for row 1 on slot 1 back to default.
--- channel.setlabelrow("2B01", "Row2")
--- print(channel.getlabelrow("slot2"))
--- 
--- --This example assumes a 7072 in slot 2.
--- -- 
--- --Set the label to be Row2, which assigns the label to all channels in the row. The output is now :
--- --,,,,,,,,,,,,Row2,Row2,Row2,Row2,Row2,Row2,Row2,Row2,Row2,Row2,Row2,Row2,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
--- ```
---@param channel any A string that specifies the channel that contains the row to which to apply a label
---@param label any A string that lists the label for the channel row, up to eight characters
function channel.setlabelrow(channel, label) end


--- **This function assigns a label to a column.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A column label can be applied to columns of a matrix card. The label is then used on the display and can be accessed in a channel list (see channel list overview). For channel, you can specify any channel in the column. You cannot specify a channel pattern.The row and column label parameters must be unique. In addition, they cannot be the same as the name of a channel pattern or channel label.After defining a column label, you can use it with a row label to specify a channel instead of the channel specifier.On the crosspoint display, the first four characters of the label are displayed. On the bottom display, the full label is displayed.channel.getlabelcolumn()channel.getlabelrow()channel.setlabelrow()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17319.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabelrow("1B01", "SMU2")    
--- channel.setlabelcolumn("1B02", "DUT2")  
--- channel.close("SMU2+DUT2")   
--- print(channel.getclose("allslots"))
--- 
--- --Sets the label for the slot 1, row 2 to "SMU2" and slot 1, column 2 to "DUT2".
--- --Use the labels to close a channel.
--- --Output:
--- --1B02
--- channel.setlabelcolumn("1A01", "")
--- 
--- --Clears the label for column 1 on slot 1 back to default.
--- channel.setlabelcolumn("1A01", " ")
--- 
--- --Also clears the label for column 1 on slot 1 back to default.
--- channel.setlabelcolumn("2B01", "TwoC")
--- print(channel.getlabelcolumn("slot2"))
--- 
--- --This example assumes a Model 7072 in slot 2.
--- -- 
--- --Set the label to be TwoC, which assigns the label to all channels in the column. Output:
--- --TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,,TwoC,,,,,,,,,,,
--- ```
---@param channel any A string that specifies the channel that contains the column to which the label will be applied
---@param label any A string that lists the label for the channel column, up to eight characters
function channel.setlabelcolumn(channel, label) end


--- **This function retrieves the label that was assigned to a column.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The parameter channelList can contain more than one channel. Use a comma to delimit the labels for the channels. The return string label lists the labels in the same order that the channels are specified.You cannot specify a channel pattern.The channelList parameter can contain slotX (where X equals 1 to 6 for Model 707B, or 1 for Model 708B) or allslots. It can also contain a label. However, if the label exists, it is in the returned response and not the numeric channel number. channel.getlabelrow()channel.setlabelcolumn()channel.setlabelrow()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17320.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setlabelcolumn("1A01", "DUT1")
--- channel.setlabelcolumn("1A03", "DUT2")
--- print(channel.getlabelcolumn("1a01:1a12"))
--- 
--- --Label all the column labels on a card
--- --Output:
--- --DUT1,,DUT2,,,,,,,,,
--- --Also note the change on the display
--- ```
---@return any label A string that lists the comma-delimited labels for the items in channelList
---@param channelList any A string that lists the channels to query for the labels associated with them
function channel.getlabelcolumn(channelList) end


--- **This function retrieves the label assigned to a row.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The parameter channelList can contain more than one channel. If it does, use a comma to delimit the labels for the channel rows. The return string label lists the labels in the same order that the channels are specified.The channelList parameter can contain slotX (where X equals 1 to 6 for Model 707B, or 1 for Model 708B) or allslots. It can also contain a label, but it cannot contain a channel pattern.channel.getlabelcolumn()channel.setlabelcolumn()channel.setlabelrow()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17321.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setrowlabel("1A01", "DUT1")
--- channel.setrowlabel("1C01", "DUT2")
--- print(channel.getlabelrow("1A01, 1B01, 1C01, 1D01, 1E01, 1F01, 1G01, 1H01"))
--- 
--- --Label the row labels on a card
--- --Output:
--- --DUT1,,DUT2,,,,,,
--- --Also note the change on the display
--- ```
---@return any label A string that lists the comma-delimited labels for the items in channelList
---@param channelList any A string that lists the channels to query for the labels associated with them
function channel.getlabelrow(channelList) end


--- **This function returns a string with the close counts for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A close count is the number of times a relay has been closed. The count values are returned in the order in which the channels are specified.If channelList includes a pattern, you can use channel.pattern.getimage() with the pattern name to see the channel order and the channels to which the close counts pertain.When the channelList parameter for this function is "slotX", the response first lists the channels starting from lowest to highest (from slot 1 to slot 6). Because each slot is processed completely before going to the next, all slot 1 channels are listed before slot 2 channels.The counts reported for the following cards indicate the number of closures since the last power cycle of the card:For all other cards, the number of closures is the closures that have occurred over the lifetime of the card.If an error is detected, a nil value is returned. No partial list of close counts is returned.channel.pattern.getimage()channel.pattern.setimage()Data retrieval commands
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17384.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("1A01,1B02,1C01","Path")
--- PathList =
---    channel.pattern.getimage("Path")
--- print(PathList)
--- print(channel.getcount(PathList))
--- print(channel.getcount("Path"))
--- 
--- --Gets the close counts for channels in a channel pattern called "Path"
--- --Sample output:
--- --1A01,1B02,1C01
--- --11001,11014,11025
--- --11001,11014,11025
--- ```
---@return string counts A comma-delimited string listing the channel close counts
---@param channelList string A string listing the items to query, which can include
function channel.getcount(channelList) end


--- **This function prevents the closing of specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter indicates the scope of channels affected and may include:This function prevents all items contained in the channel list parameter from closing (applies the "forbidden to close" attribute to channels specified ). To remove the "forbidden to close" attribute, use channel.clearforbidden().If a channel that is being set to forbidden is used in a channel pattern, the channel pattern is deleted when the channel is set to forbidden.The channels in the channelList parameter must be installed in the instrument.The channelList parameter cannot include a channel pattern.If the scan list contains a channel that is forbidden, the scan list is invalidated.channel.clearforbidden()channel.getforbidden()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17402.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("1A01,1A02",
---    "patternA")
--- channel.pattern.setimage("1B01,1B02",
---    "patternB")
--- channel.pattern.setimage("1C01,1C02",
---    "patternC")
---  
--- for name in channel.pattern.catalog() do
---    print(name .. " = " ..
---       channel.pattern.getimage(name))
--- end
---  
--- channel.setforbidden("1A02, 1B01")
--- for name in channel.pattern.catalog() do
---    print(name .. " = " ..
---       channel.pattern.getimage(name))
--- end
--- 
--- --Create three channel patterns, and then print.
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- -- 
--- --Set forbidden for one channel from patternA and patternB, then print the catalog again. Only patternC should remain.
--- -- 
--- --Assuming no existing channel patterns, the output is:
--- --patternC = 1C01,1C02
--- --patternA = 1A01,1A02
--- --patternB = 1B01,1B02
--- --patternC = 1C01,1C02
--- ```
---@param channelList string A string that lists the channels to make forbidden to close.
function channel.setforbidden(channelList) end


--- **This function returns a string listing the channels in the channel list parameter that are forbidden to close.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter indicates which channels to check, and may include:If there are no channels in the scope of the channelList that are on the forbidden list, the string returned is empty or nil. The format of the channels in the response string is slot, row, column.channel.clearforbidden()channel.setforbidden()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17404.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("slot1")
--- channel.setforbidden("1A01:1A05")
--- print(channel.getforbidden("allslots"))
--- print(channel.getforbidden("slot1"))
--- print(channel.getforbidden(
---    "1A01:1A03,1B04,1B08,1B12"))
--- 
--- --Reset the channels.
--- --Set channels 1A01, 1A02, 1A03, 1A04, and 1A05 to be forbidden.
--- --List the forbidden channels on all slots, slot 1, and list of channels.
--- -- 
--- --Output:
--- --1A01,1A02,1A03,1A04,1A05
--- --1A01,1A02,1A03,1A04,1A05
--- --1A01,1A02,1A03
--- ```
---@return string forbiddenList Comma-delimited string listing channels that are forbidden to close in the channel list
---@param channelList string A string listing the channels and channel patterns to query to see which are forbidden to close
function channel.getforbidden(channelList) end


--- **This function clears the list of channels specified from being forbidden to close.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter indicates the channels that will no longer be forbidden to close, and may include:This function allows all items contained in the channelList parameter to be closed (removes the "forbidden to close" attribute that can be applied to a channel using channel.setforbidden()).Command processing will stop as soon as an error is detected. If an error is found, the channels are not cleared from being forbidden to close.channel.getforbidden()channel.setforbidden()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17406.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("slot1")
--- channel.setforbidden("1A01:1A05")
---  
--- channel.clearforbidden("1A02,1A03")
--- print(channel.getforbidden("slot1"))
--- 
--- --Reset the channels on slot 1.
--- --Set channels 1A01, 1A02, 1A03, 1A04, and 1A05 to be forbidden to close. 
--- --Change 1A02 and 1A03 to be allowed to close.
--- --Retrieve the list of forbidden channels.
--- --Output:
--- --1A01,1A04,1A05
--- ```
---@param channelList string String specifying a list of channels, using channel list notation.
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
--- The connection rule describes the order in which switch channels are opened and closed when using channel.exclusiveclose(), channel.exclusiveslotclose(), and scanning commands like scan.execute() and scan.background(). These commands may both open and close switch channels in a single command. The connection rule dictates the algorithm used by the instrument to order the opening and closing of switches.The connection rule affects the operating time of these commands. These commands do not allow the instrument to continue execution until the settle time of the relays has expired.When the connection rule is set to channel.BREAK_BEFORE_MAKE, the instrument ensures that all switch channels open before any switch channels close. When switch channels are both opened and closed, this command executes not less than the addition of both the open and close settle times of the indicated switch channels.When the connection rule is set to channel.MAKE_BEFORE_BREAK, the instrument ensures that all switch channels close before any switch channels open. This behavior should be applied with caution because it will connect two test devices together for the duration of the switch close settle time. When switch channels are both opened and closed, the command executes not less than the addition of both the open and close settle times of the indicated switch channels.With no connection rule (set to channel.OFF), the instrument attempts to simultaneously open and close switch channels in order to minimize the command execution time. This results in faster performance at the expense of guaranteed switch position. During the operation, multiple switch channels may simultaneously be in the close position. Make sure your device under test can withstand this possible condition. When switch channels are both opened and closed, the command executes not less than the greater of either the open or close settle times of the indicated switch channels.In general, the settling time of single commands that open and close switch channels depends on several factors, such as card type and channel numbers. However, the opening and closing of two sequential channels including no others can be guaranteed as follows:This behavior is also affected by channel.connectsequential and any additional user delay times.channel.connectsequentialchannel.exclusiveclose()channel.exclusiveslotclose()scan.background()scan.execute()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17407.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.connectrule = channel.BREAK_BEFORE_MAKE
--- 
--- --Sets the connect rule in the instrument to channel.BREAK_BEFORE_MAKE
--- ```
---@type channelconnectrulerule
channel.connectrule = 0



--- **This function closes the specified channels and channel patterns so that they are exclusively closed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to bundle the closing of channels with opening. Any presently closed channel opens if it is not specified to be closed in the parameter. This guarantees that only the specified items are closed on the slots specified in the parameters list.Actions associated with this function include:If the channelList parameter is an empty string or a string of spaces, all channels that are closed are opened. Therefore, when channels are closed, sending channel.exclusiveclose("") is equivalent to channel.open(channel.getclose("allslots")).An error is generated if:Once an error is detected, the command stops processing. Channels open or close only if no errors are found.channel.clearforbidden()channel.close()channel.connectrulechannel.connectsequentialchannel.exclusiveslotclose()channel.getclose()channel.getforbidden()channel.open()channel.setforbidden()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17435.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.exclusiveclose("")
--- channel.close("1D01,1E12")
--- print(channel.getclose("slot1"))
---  
--- channel.pattern.setimage("1B02,1B04,1B06", "myChans")
--- channel.exclusiveclose("1A01:1A05, 1C03, myChans")
--- print(channel.getclose("slot1"))
--- 
--- --Open all channels because the channelList parameter is empty.
--- --Close 1D01 and 1E12.
--- --Output:
--- --1D01;1E12
--- -- 
--- --Create the pattern myChans.
--- --Exclusively close the channels in myChans and additional specified channels. The originally closed channels (1D01 and 1E12) are now  open.
--- --Output:
--- --1A01;1A02;1A03;1A04;1A05;1B02;1B04;1B06;1C03
--- ```
---@param channelList string A string listing the channels and channel patterns to exclusively close.
function channel.exclusiveclose(channelList) end


--- **This function exclusively closes the specified channels and channel patterns on the defined slot.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to bundle the closing of channels with the opening of a channel. Any currently closed channel opens if not specified for closure on the slots defined in the parameter. Using this command guarantees that only the specified channels and channel patterns are closed on the slots associated with the channelList.When this command is sent:For example, if row 1, column 1 channels are closed on each of the six slots, specifying a channelList parameter of "2A02, 4A04" opens the row 1, column 1 channels (slots 2 and 4 only). Then, the row 1, column 2 channel on slot 2, and the row 1, column 4 channel on slot 4 close. The row 1, column 2 channels remain closed on slots 1, 3, 5, and 6.An error is generated if:Once an error is detected, the command stops processing.channel.clearforbidden()channel.close()channel.exclusiveclose()channel.getclose()channel.getforbidden()channel.open()channel.setforbidden()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17437.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.open("allslots")
--- channel.close("1A01,2A01,3A01,4A01,5A01,6A01")
--- channel.exclusiveslotclose("3A03")
--- print(channel.getclose("allslots"))
--- 
--- --Open all channels on all slots.
--- --Close row A column 1 channels on all slots.
--- --Open row A column 1 on slot 3 and close row A column 3 on slot 3 without affecting any other slot with closed channels.
--- --Output:
--- --1A01;2A01;3A03;4A01;5A01;6A01
--- ```
---@param channelList string A string that lists the channels and channel patterns to exclusively close on the card in an associated slot
function channel.exclusiveslotclose(channelList) end


--- **This function queries for the additional delay time for the specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter may contain slotX (where X equals 1 to 6 for Model 707B, or 1 for Model 708B)  or allslots.An error message is generated for the following reasons:Command processing stops as soon as an error is detected and a nil response is generated.channel.setdelay()Data retrieval commands
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17521.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.getdelay("1A07,1B05,1C03"))
---  
---  
---  
---  
---  
--- channel.setdelay("slot1", 3.1)
--- DelayTimes = channel.getdelay("1A07,1B05,1C03")
--- print(DelayTimes)
--- 
--- --Get the existing delays for the listed channels.
--- --Output:
--- --0.00000e+00,0.00000e+00,0.00000e+00
--- -- 
--- --Set a delay on all channels in slot 1.
--- --Verify that the delay was set for the listed channels.
--- --Output:
--- --3.10000e+00,3.10000e+00,3.10000e+00
--- ```
---@return string delayTimes A comma-delimited string consisting of the delay times (in seconds) for channels specified in channelList.
---@param channelList string A string listing the channels to query for their delay times.
function channel.getdelay(channelList) end


--- **This function sets additional delay time for specified channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The user delay is an additional delay that is added after a channel is closed. You can use this delay to allow additional settle time for a signal on that channel. For most cards, the resolution of the delay is 10 ms. However, check the documentation for your card to verify. To see if the delay value was modified after setting, use the channel.getdelay() command to query.Channel patterns get their delay from the channels that comprise the pattern. Therefore, specify the delay for a pattern through the channels. A pattern incurs the longest delay of all channels comprising that pattern.An error message is generated if:Command processing will stop as soon as an error is detected and no delay times will be modified.channel.getdelay()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17522.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.setdelay("1A03, 1A05", 50e-6)
--- 
--- --Sets row 1 and columns 3 and 5 of slot 1 for a delay time of 50 microseconds.
--- channel.setdelay("slot1", 0)
--- 
--- --Sets the channels on slot 1 for 0 delay time.
--- ```
---@param channelList string A string listing the channels that need modifications to their delay time.
---@param value any Desired delay time for items in channelList. Minimum is 0 seconds.
function channel.setdelay(channelList, value) end


--- **This function retrieves the label associated with one or more channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The channelList parameter can contain more than one channel. If it does, a comma delimits the labels for the channels. The return string lists the labels in the same order that the channels were specified. The channelList parameter cannot be an empty string and must be a valid channel.The channelList parameter can contain slotX (where X equals 1 to 6 for Model 707B, or 1 for Model 708B) or allslots. Command processing stops as soon as an error is detected, and then a nil response is generated. No partial list of labels is returned.channel.setlabel()Data retrieval commands
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17536.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.reset("1A01")
--- print(channel.getlabel("1A01"))
--- channel.setlabel("1A01", "Device")
--- print(channel.getlabel("1A01"))
--- 
--- --This example resets the channel, prints the default label of the channel, sets the label to "Device", and returns the new label.
--- --Output:
--- --1A01
--- --Device
--- ```
---@return string label A string listing the comma-delimited labels for items in channelList
---@param channelList any A string listing the channels to query for the label associated with them
function channel.getlabel(channelList) end


--- **Queries the state indicators of the channels in the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Each bit in the state represents a different indicator. Therefore, multiple indicators can be present (the OR operation is performed bitwise). The optional state indicatorMask can be used to return only certain indicators. If there is no indicatorMask, then all indicators are returned.Indicators can be latched or unlatched, depending on other system settings. Latched indicators mean that the condition has occurred since the last reset command (or power cycle). Unlatched indicators mean that the condition has occurred when the channel.getstate() command was issued.Although the channel.getstate() command returns a string representing a number, this can be easily changed to a number and then compared to one of the provided Lua constants.The only state information is an indicator of relay state (channel.IND_CLOSED).channel.getclose()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17546.html"])
---
---<br>*Examples:*<br>
--- ```lua
---    print(channel.getstate("4A01:4B08"))
---  
--- channel.pattern.setimage("1A01,2B02,3C03",
---    "Path")
--- print(channel.getstate("Path"))
--- print(channel.getstate("3C03"))
---  
--- -- Unmasking the return value must be done
--- -- one channel at a time.
--- if bit.bitand(channel.IND_CLOSED,
---    tonumber(channel.getstate("4A10"))) == 1 then
---    print("CLOSED")
--- else
---    print("OPENED")
--- end
--- 
--- --Queries the state of the first 20 channels on Slot 4.
--- --See the state of channels in channel pattern called "PathList".
--- -- 
--- --The channel.IND_CLOSED command equates to the number 1. Because the state is a bit-oriented value, you must perform a logical AND operation on the state to the overload constant to isolate it from other indicators.
--- -- 
--- --The tonumber() command only works with a single channel. When multiple channels are returned (for example, channel.getstate("slot4")), this string must be parsed by the comma delimiter to find each value.
--- ```
---@return string state Return string listing the comma-delimited states for the channels in channelList
---@param channelList string String specifying the channels to query, using normal channel list syntax
---@param indicatorMask channelgetstateindicatorMask Value to specify only certain indicators; if omitted, all indicators are returned
---@overload fun(channelList:string):string
function channel.getstate(channelList, indicatorMask) end


--- **This function returns the type associated with a channel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The channel type is defined by the physical hardware of the card on which the channel exists. The only valid channel type for the Models 707B and 708B is channel.TYPE_SWITCH or 1.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17547.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(channel.gettype("1A01"))
--- 
--- --Queries the channel type of Row 1, Column 1, in Slot 1.
--- ```
function channel.gettype() end



--- **This function opens the specified channels and channel patterns.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function opens the specified channels for switching.The settling time associated with a channel must elapse before the command completes. User delay is not added when a relay opens.

---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17548.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.open("1A01:1A05, 3B03, Chans")
--- 
--- --Opens channels in Row 1, Columns 01 to 05 on Slot 1; Row 2, Column 03 on Slot 3; and the channels in the channel pattern Chans.
--- channel.open("slot3, slot5")
--- 
--- --Opens all channels on Slots 3 and 5.
--- channel.open("allslots")
--- 
--- --Opens all channels on all slots.
--- ```
---@param channelList string String listing the channels and channel patterns to open
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
--- channel.connectruleSwitch operation
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17663.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.connectsequential = channel.ON
--- 
--- --Specifies that channels close sequentially.
--- ```
---@type channelconnectsequentialsequential
channel.connectsequential = 0

---@class scan
scan = {}




--- **This function aborts a running background scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If no scan is running, the call to this function is ignored.scan.background()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16240.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.background()
--- scan.abort()
--- 
--- --Starts background scan, and then aborts the scan.
--- ```
function scan.abort() end

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
--- scanCount is the number of the current iteration through the scan portion of the trigger model. This number does not increment until the scan begins. Therefore, if the instrument is waiting for an input to trigger a scan start, the scan count represents the previous number of scan iterations. If no scan has yet to begin, the scan count is zero (0).stepCount is the number of times the scan has completed a pass through the channel action portion of the trigger model. This number does not increment until after the action completes. Therefore, if the instrument is waiting for an input to trigger a channel action, the step count represents the previous step. If no step has yet completed, the step count is zero. If the step count has yet to complete the first step in a subsequent pass through a scan, the scan count represents the last step in the previous scan pass.scan.modescan.background()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16254.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.background()
--- scanState, scanCount, stepCount = scan.state()
--- print(scanState)
---  
--- 
--- --Runs a scan in the background
--- --Check the present scan state
--- --View value of scanState
--- --Output shows that scan is running:
--- --2.00000ee+00
--- -- 
--- ```
---@return scanstatescanState scanState The present state of the scan running in the background. Possible states include
---@return number scanCount The current number scans that have completed
---@return number stepCount The current number steps that have completed
function scan.state() end


--- **This attribute contains the number of steps in the present scan.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This is set by the number of steps in the active scan list. The value of this attribute is initially determined when the scan is created. Adding steps with the scan.create(), scan.addimagestep(), and scan.add() functions updates this attribute's value.scan.add()scan.create()scan.addimagestep()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16255.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(scan.stepcount)
--- 
--- --Responds with the present step count.
--- --Output assuming there are five steps in the scan list:
--- --5.00000ee+00
--- ```
scan.stepcount = 0



--- **This function allows you to include multiple channels in a single scan step.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function adds a list of channels to be closed simultaneously in a single step of a scan.scan.add()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16633.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create()
--- scan.add("1D01")
--- scan.addimagestep("1A01, 1B01, 1C03")
--- scan.add("1F03")
--- scan.addimagestep("1A03, 1B03, 1C03")
--- scan.addimagestep("1A05, 1B05, 1C03")
--- scan.addimagestep("1A07, 1B07, 1C03")
--- scan.addimagestep("1A09, 1B09, 1C03")
--- print(scan.list())
--- 
--- --Generate a scan list that has multiple steps, with some steps that include multiple channels.
--- -- 
--- --Output:
--- --Init) OPEN...
--- --   1) STEP: 1D01
--- --     CLOSE: 1D01
--- --   2) STEP: 1A01, 1B01, 1C03
--- --      OPEN: 1D01
--- --     CLOSE: 1A01 1B01 1C03
--- --   3) STEP: 1F03
--- --      OPEN: 1A01 1B01 1C03
--- --     CLOSE: 1F03
--- --   4) STEP: 1A03, 1B03, 1C03
--- --      OPEN: 1F03
--- --     CLOSE: 1A03 1B03 1C03
--- --   5) STEP: 1A05, 1B05, 1C03
--- --      OPEN: 1A03 1B03
--- --     CLOSE: 1A05 1B05
--- --   6) STEP: 1A07, 1B07, 1C03
--- --      OPEN: 1A05 1B05
--- --     CLOSE: 1A07 1B07
--- --   7) STEP: 1A09, 1B09, 1C03
--- --      OPEN: 1A07 1B07
--- --     CLOSE: 1A09 1B09
--- ```
---@param channelList string String specifying a list of channels
function scan.addimagestep(channelList) end


--- **This function adds a scan step to the scan list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to add channels and channel patterns to the present scan list. If the scan list does not exist, it also creates a scan list. See scan.create() for information about creating a scan list.Channels and channel patterns added using the scan.add() function are added to the end of the present list (appended) in the same order as specified in channelList. Specifying multiple channels in channelList adds multiple steps to the scan.If an error is encountered as channels are added to the list, subsequent channels in that channel list will not be added.scan.create()Scanning
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16890.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create()
---  
---  
--- for column = 1,5 do
---  
---    scan.add(channel.createspecifier(1,1,column))
---  
---  
--- end
--- 
--- --Replaces the active scan list with an empty scan list.
--- -- 
--- --Loops through columns 1 to 5.
--- -- 
--- --Adds five channels to the scan list using the channel.createspecifier() command. The scan list now has row 1, columns 1 to 5 on slot 1 as the first five steps.
--- scan.create("1A01:1A08")
---  
---  
--- scan.add("1A10")
---  
---  
---  
--- scan.add("1A09")
--- 
--- --Replaces the active scan list with an empty
--- --scan list, and then adds row A, columns 1 through 8 on slot 1 to the new scan list.
--- -- 
--- --Adds row A, column 10 on slot 1 to the end of the scan list.
--- -- 
--- --Adds row A, column 9 on slot 1 to the end of the scan list.
--- -- 
--- --Scan list now includes channels 1A01 through 1A10, with channels 1A01 through 1A08 in order, followed by channel 1A10, and then channel 1A09.
--- scan.create("")
--- 
--- --Clears the old scan list and creates a new empty scan list.
--- ```
---@param channelList string String specifying channels to add using normal channel list syntax
function scan.add(channelList) end

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
--- Before using this command, use scan.create() and scan.add()or scan.addimagestep() to set up a scan list.When the scan is run in the background, you must use the scan.state() function to check the status of the scan.scan.add()scan.create()scan.execute()scan.list()scan.state()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16891.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.background()
--- 
--- --Runs a scan in the background
--- ```
---@return scanbackgroundstate state The result of scanning
---@return number scanCount The present number of scans completed
---@return number stepCount The present number of steps completed
function scan.background() end


--- **This function deletes the existing scan list and creates a new list of channels and channel patterns to scan.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The existing scan list is lost after calling this function.The items in channelList are scanned in the order listed.If a forbidden channel is included in a range of channels or slot parameter (such as slot 1), the forbidden channel is ignored and no error is generated. If a forbidden channel is individually specified in the channel list, an error is generated.If an error occurs, the scan list of channels or channel patterns is cleared, even though no new scan list is created.The function scan.reset() clears the list. To clear the scan list without performing a scan reset, send an empty string for the channelList parameter.scan.add()scan.reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16892.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("1A01:1A10")
--- 
--- --Replaces the active scan list with an empty scan list, and then adds channels 1A01 through 1A10 on slot 1.
--- scan.create()
---  
--- for column = 1, 10 do
---    scan.add(channel.createspecifier(1,1,column))
---  
---  
--- end
--- 
--- --Replaces the active scan list with an empty scan list.
--- --Loops through column 1 to 10 on row 1 of slot 1 to add ten channels to the scan list. The channel.createspecifier() command generates the parameters.
--- --The scan list now has, in order, row 1, columns 1 through 10, on slot 1.
--- ```
---@param channelList string String specifying channels to add
function scan.create(channelList) end

scan.EMPTY = 0
scan.BUILDING = 1
scan.RUNNING = 2
scan.ABORTED = 3
scan.FAILED = 4
scan.FAILED_INIT = 5
scan.SUCCESS = 6

---@alias scanexecutescanState
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
--- Before using this command, use scan.create() and scan.add() or scan.addimagestep() to set up a scan list.Because this function causes the scan to run immediately, the scan.state() function cannot be used to see the current status of scanning.Execution runs until the scan is complete or until the  abort command is sent. scan.add()scan.background()scan.create()scan.list()scan.state()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16893.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.execute()
--- 
--- --Runs a scan immediately.
--- ```
---@return scanexecutescanState scanState The result of scanning
---@return number scanCount The current number of scans that have completed
---@return number stepCount The current number of steps have completed
function scan.execute() end


--- **This function queries the active scan list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function lists the existing scan list.When changing a channel or scan attribute for an existing scan list item, the scan list will be regenerated based on this change. If unable to rebuild the list, an error will be generated and the scan list will be lost. To avoid unintentional changes to an existing scan list, configure channel and scan settings prior to using commands (scan.add(), scann.addimagestep(), scan.create()) to build a scan list.If the scan list is empty, the string "Empty Scan" is returned. Otherwise, the string lists each step in the scan along with its information for step, open, and close (see the example below).scan.create()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16894.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.create("1A07:1B03")
--- print(scan.list())
--- 
--- --Populate the scan list with the function scan.create("1A07:1B03"), then initiate the scan list to be output.
--- --Outputs the existing scan list.
--- --Output:
--- --Init) OPEN...
--- --   1) STEP: 1A07
--- --     CLOSE: 1A07
--- --   2) STEP: 1A08
--- --      OPEN: 1A07
--- --     CLOSE: 1A08
--- --   3) STEP: 1A09
--- --      OPEN: 1A08
--- --     CLOSE: 1A09
--- --   4) STEP: 1A10
--- --      OPEN: 1A09
--- --     CLOSE: 1A10
--- --   5) STEP: 1A11
--- --      OPEN: 1A10
--- --     CLOSE: 1A11
--- --   6) STEP: 1A12
--- --      OPEN: 1A11
--- --     CLOSE: 1A12
--- --   7) STEP: 1B01
--- --      OPEN: 1A12
--- --     CLOSE: 1B01
--- --   8) STEP: 1B02
--- --      OPEN: 1B01
--- --     CLOSE: 1B02
--- --   9) STEP: 1B03
--- --      OPEN: 1B02
--- --     CLOSE: 1B03
--- ```
---@return string scanList This parameter is string listing the existing scan step information
function scan.list() end

scan.MODE_OPEN_ALL = 0
scan.MODE_OPEN_SELECTIVE = 1

---@alias scanmodescanModeSetting
---|`scan.MODE_OPEN_ALL`
---|`scan.MODE_OPEN_SELECTIVE`



--- **This attribute controls the scan mode setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to scan.MODE_OPEN_ALL, all channels on all slots are opened before a scan starts. When this attribute is set to scan.MODE_OPEN_SELECTIVE, an intelligent open is performed:scan.reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16895.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.mode = scan.MODE_OPEN_SELECTIVE
--- 
--- --Sets the scan mode setting to open selective.
--- ```
---@type scanmodescanModeSetting
scan.mode = 0



--- **This function resets the trigger model and scan list settings to their factory default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When scan.reset() is sent, the trigger model and scan settings that are reset to the factory defaults are:In addition, the scan list is cleared.channel.reset()reset()scan.bypassscan.modescan.scancountscan.trigger.arm.stimulusscan.trigger.channel.stimulus
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16896.html"])
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
--- When bypass is ON and the scan.trigger.arm.stimulus is satisfied, the first channel of the scan closes (the scan.trigger.channel.stimulus setting is ignored).For other channels (other than the first), the channel stimulus must be satisfied before the channel action takes place.When bypass is OFF, every channel (including the first) must satisfy the scan.trigger.channel.stimulus setting before the channel action occurs for that step.scan.trigger.arm.stimulusscan.trigger.channel.stimulus
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16973.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.bypass = scan.OFF
--- print(scan.bypass)
--- 
--- --Disables the bypass option for scanning and displays the present bypass state.
--- -- 
--- ```
---@type scanbypassbypass
scan.bypass = 0



--- **This attribute sets the scan count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a scan, the instrument iterates through the arm layer of the trigger model the specified number of times. After performing the specified number of iterations, the instrument returns to an idle state.Trigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16974.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.scancount = 5
--- 
--- --Sets the scan count to 5.
--- ```
scan.scancount = 0

---@class scriptVar
scriptVar = {}




--- **This attribute sets a script to autorun.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Autorun scripts run automatically when the instrument is turned on. You can set any number of scripts to autorun.The run order for autorun scripts is arbitrary, so make sure the run order is not important.The default value for scriptVar.autorun depends on how the script was loaded. The default is "no" if the script was loaded with loadscript or script.new(). It is "yes" for scripts loaded with loadandrunscript or script.newautorun().None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16852.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- test5.autorun = "yes"
--- test5.save()
--- 
--- --Assume a script named "test5" is in the runtime environment.
--- --The next time the instrument is turned on, "test5" script automatically loads and runs.
--- ```
script_object.autorun = 0



--- **This function runs a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16856.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- test8.run()
--- 
--- --Runs the script referenced by the variable test8.
--- ```
function script_object.run() end


--- **This function saves the script to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16863.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- test8.save()
--- 
--- --Saves the script referenced by the variable test8 to nonvolatile memory.
--- ```
function script_object.save() end


--- **This attribute holds the source code of a user script.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The loadscript or loadandrunscript and endscript keywords are not included in the source code.scriptVar.list()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16867.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(test1.source)
--- 
--- --Gets source code for a script named test1.
--- --
--- --
--- ```
script_object.source = 0



--- **This function generates a script listing.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates output in the form of a sequence of response messages (one message for each line of the script). It also generates output of the script control messages (loadscript or loadandrunscript, and endscript).Create a script by sending commandsRetrieve source code line by line
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17785.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- beep.list()
--- 
--- --Generates output for the content of the script named "beep."
--- -- 
--- ```
function script_object.list() end


--- **This attribute changes or reads the name of a script in the runtime environment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When setting the script name, this attribute renames the script that the variable scriptVar was previously references.This attribute must be either a valid Lua identifier or the empty string. Changing the name of a script changes the index used to access the script in the script.user.scripts table. Setting the attribute to an empty string removes the script from the table completely, and the script becomes an unnamed script.As long as there are variables referencing an unnamed script, the script can be accessed through those variables. When all variables that reference an unnamed script are removed, the script will be removed from the runtime environment.If the new name is the same as a name that is already used for another script, the name of the other script is set to an empty string, and that script becomes unnamed. script.new()scriptVar.save()Rename a script
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/2589.html"])
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
--- --Use script.new() to create a script with no name, and then run the script.
--- --Name the script "test7", and then save the script in nonvolatile memory.
--- ```
script_object.name = 0

---@class tspnet.tsp
tspnet.tsp = {}




--- **This function stops remote instrument execution.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Sends an abort command to the remote instrument.The specified connection must be valid and available.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14085.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abort(myConnection)
--- 
--- --Stops myConnection.
--- ```
---@param connectionID string Integer value used as a handle for other tspnet commands
function tspnet.tsp.abort(connectionID) end


--- **This attribute contains the setting for abort on connect.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting determines if the instrument sends an abort message when it attempts to connect using tspnet.connect to a TSP-enabled instrument.When you send the abort command on an interface, it causes any other active interface on that instrument to close. If you do not issue an abort command (or if tspnet.tsp.abortonconnect is set to 0) and another interface is active, connecting to a TSP device results in a connection. However, the instrument will not respond to subsequent reads or executes because control of the instrument is not obtained until an abort command has been issued. See Communication Interfaces.tspnet.connect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14086.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abortonconnect = 0
--- 
--- --Configure the instrument so that it does not send an abort command when connecting to a TSPenabled instrument.
--- ```
tspnet.tsp.abortonconnect = 0



--- **This function copies a reading buffer synchronous table from a remote instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function reads the data from a reading buffer on a remote instrument and returns an array of numbers or a string representing the data.startIndex and endIndex specify the portion of the reading buffer to read. If no index is specified, the entire buffer is copied.This command is limited to transferring 50,000 readings at a time.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14090.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- t = tspnet.tsp.rbtablecopy(myconnection,  'myremotebuffername.readings', 1, 3)
--- print(t[1], t[2], t[3])
--- 
--- -- 
--- --Output:
--- --4.5653423423e-1
--- --4.5267523423e-1
--- --4.5753543423e-1
--- times = tspnet.tsp.rbtablecopy(mytspdevice, 'myremotebuffername.timestamps', 1, 3)
--- print(times)
--- 
--- -- 
--- --Output:
--- --01/01/2008 10:10:10.0000013,01/01/2008 10:10:10.0000233,01/01/2008 10:10:10.0000576
--- ```
---@return any array A copy of the synchronous table
---@param connectionID string Integer value used as a handle for other tspnet commands
---@param name string The full name of the reading buffer name and synchronous table to copy
---@param startIndex number Integer start value
---@param endPointIndex any Integer end value
---@overload fun(connectionID:string,name:string):any
function tspnet.tsp.rbtablecopy(connectionID, name, startIndex, endPointIndex) end


--- **This function loads and runs a script on a remote instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.This function downloads a script to a remote instrument and runs it. It automatically adds the appropriate loadscript and endscript commands around the script, captures any errors, and reads back any prompts. No additional substitutions are done on the text.The script is automatically loaded, compiled, and run.Any output from previous commands is discarded.This command does not wait for the script to complete.To load only and run at a later time, make sure the script contains only functions. Use tspnet.execute() to execute those functions at a later time.If no name is specified, the script will be unnamed.tspnet.execute()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15280.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.runscript(myconnection, "mytest",
--- "print([[start]]) for d = 1, 10 do print([[work]]) end print([[end]])")
--- 
--- --Load and run a script entitled mytest on the TSPenabled instrument connected with myconnection. The source of mytest will be the contents of the string passed for the third parameter.
--- ```
---@param connectionID string Integer value used as an identifier for other tspnet commands
---@param name string The name that is assigned to the script
---@param script string The body of the script as a string
---@overload fun(connectionID:string,script:string)
function tspnet.tsp.runscript(connectionID, name, script) end
---@class digiotriggerArr
digiotriggerArr = {}

---@type digiotriggerArr[]
digio.trigger = {}




--- **This function asserts a trigger on one of the digital I/O lines.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The set pulsewidth determines how long the trigger is asserted.digio.trigger[N].pulsewidth
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14670.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].assert()
--- 
--- --Asserts a trigger on digital I/O line 2
--- ```
function digiotriggerArr.assert() end



--- **This function clears a trigger event on a digital I/O line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event detector of a trigger recalls if a trigger event has been detected since the last digio.trigger[N].wait() command. This function clears the event detector of a specified trigger line, discards the previous history of the trigger line, and clears the digio.trigger[N].overrun attribute.digio.trigger[N].overrundigio.trigger[N].stimulusdigio.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14671.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].clear()
--- 
--- --Clears the trigger event on I/O line 2.
--- ```
function digiotriggerArr.clear() end



--- **This attribute describes the mode in which the trigger event detector and the output trigger generator operate on the given trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set tmode to one of the following values:When programmed to any mode except digio.TRIG_BYPASS, the output state of the I/O line is controlled by the trigger logic, and the userspecified output state of the line is ignored.digio.TRIG_SYNCHRONOUS is provided for compatibility with older firmware. Either digio.TRIG_SYNCHRONOUSA or digio.TRIG_SYNCHRONOUSM should be used instead.When reading the trigger mode, tmode is returned as a number.To control the line state, use digio.TRIG_BYPASS with the digio.writebit() and the digio.writeport() commands.digio.trigger[N].reset()digio.writebit()digio.writeport()Scanning and triggering
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14674.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].mode = 2
--- 
--- --Sets the trigger mode for I/O Line 4 to digio.TRIG_RISING.
--- -- 
--- ```
digiotriggerArr.mode= 0



--- **Use this attribute to read the event detector overrun status.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.digio.trigger[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14675.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = digio.trigger[1].overrun
--- print(overrun)
--- 
--- --If there is no trigger overrun, this returns:
--- --false
--- ```
digiotriggerArr.overrun= 0



--- **This function releases an indefinite length or latched trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulse width time, as well as a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line (N) is affected.digio.trigger[N].pulsewidth
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14677.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].release()
--- 
--- --Releases digital I/O trigger Line 4.
--- ```
function digiotriggerArr.release() end



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses for up to timeout seconds for an input trigger. If one or more trigger events are detected since the last time digio.trigger[N].wait() or digio.trigger[N].clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and re-armed . This is true regardless of the number of events detected.digio.trigger[N].clear()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14679.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = digio.trigger[4].wait(3)
--- print(triggered)
--- 
--- --Waits up to three seconds for a trigger to be detected on trigger Line 4, then returns the output results.
--- -- 
--- --Output if no trigger is detected:
--- --false
--- --Output if a trigger is detected:
--- --true
--- ```
---@return any triggered Returns true if a trigger is detected, or false if no triggers are detected during the timeout period
---@param timeout any Timeout in seconds
function digiotriggerArr.wait(timeout) end



--- **This attribute selects the event that causes a trigger to be asserted on the digital output line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to zero (0) to disable the automatic trigger output.Trigger stimulus for a digital I/O line may be set to one of the existing trigger event IDs, described in the following table.Do not use the stimulus attribute for generating output triggers. Use digio.trigger[N].assert() instead.digio.trigger[N].assert()digio.trigger[N].clear()digio.trigger[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17676.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].stimulus = scan.trigger.EVENT_CHANNEL_READY
--- 
--- --Set the trigger stimulus of digital I/O Line 3 to be the channel ready event during a scan.
--- digio.trigger[3].stimulus = 0
--- 
--- --Clear the trigger stimulus of digital I/O Line 3.
--- ```
---@type eventID|0
digiotriggerArr.stimulus= 0



--- **This attribute describes the length of time that the trigger line is asserted for output triggers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting width to zero (0) (seconds) asserts the trigger indefinitely. To release the trigger line, use digio.trigger[N].release().
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17691.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].pulsewidth = 20e-6
--- 
--- --Sets the pulse width for trigger line 4 to 20 s.
--- ```
digiotriggerArr.pulsewidth= 0



--- **This function resets trigger values to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the following attributes to factory default settings:It also clears digio.trigger[N].overrun.digio.trigger[N].modedigio.trigger[N].overrundigio.trigger[N].pulsewidthdigio.trigger[N].stimulus
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17719.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function digiotriggerArr.reset() end

---@class display.loadmenu
display.loadmenu = {}



display.DONT_SAVE = nil
display.SAVE = nil

---@alias displayloadmenuaddmemory
---|`display.DONT_SAVE`
---|`display.SAVE`



--- **This function adds an entry to the User menu, which can be accessed using the LOAD key on the instrument front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After adding code to the load menu, you can run it from the front panel by pressing the LOAD key, then selecting User to select from the available code to load.After loading the code, you can execute it when the RUN key is pressed.You can add items in any order. They are always displayed in alphabetic order when the menu is selected.The code can be made up of scripts, functions, variables, and commands. If memory is set to display.SAVE, commands are saved with the code in nonvolatile memory. Scripts, functions, and variables used in the code are not saved by display.SAVE. Functions and variables need to be saved along with the script. If the script is not saved in nonvolatile memory, it will be lost when the TSP are turned off. See Example 2 below.If you do not make a selection for memory, the code is automatically saved to nonvolatile memory.display.loadmenu.delete()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14704.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.add("Test9", "Test9()")
--- 
--- --Assume a user script named "Test9" has been loaded into the runtime environment. Adds the menu entry to the User menu to run the script after loading.
--- display.loadmenu.add(
---    "Test", "DUT1() beeper.beep(2, 500)", display.SAVE)
--- 
--- --Assume a script with a function named "DUT1" has already been loaded into the instrument, and the script has NOT been saved in nonvolatile memory.
--- --Now assume you want to add a test named "Test" to the USER TESTS menu. You want the test to run the function named "DUT1" and sound the beeper. This example adds "Test" to the menu, defines the code, and then saves the displayName and code in nonvolatile memory.
--- --When "Test" is run from the front panel USER TESTS menu, the function named "DUT1" executes and the beeper beeps for two seconds.
--- --Now assume you turn off instrument power. Because the script was not saved in nonvolatile memory, the function named "DUT1" is lost when you turn the instrument on. When "Test" is again run from the front panel, an error is generated because DUT1 no longer exists in the instrument as a function.
--- display.loadmenu.add("Part1", "testpart([[Part1]], 5.0)", display.SAVE)
--- 
--- --Adds an entry called "Part1" to the front panel "USER TESTS" load menu for the code testpart([[Part1]], 5.0), and saves it in nonvolatile memory.
--- ```
---@param displayName string The name that is added to the User menu.
---@param code string The code that is run from the User menu.
---@param memory displayloadmenuaddmemory Determines if code is saved to nonvolatile memory
---@overload fun(displayName:string,code:string)
function display.loadmenu.add(displayName, code, memory) end


--- **This function creates an iterator for the User menu items, accessed using the LOAD key on the instrument front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Each time through the loop, displayName and code will take on the values in the User menu.The list that is returned is in random order.display.loadmenu.add()display.loadmenu.delete()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14705.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- for myNames, listCode in display.loadmenu.catalog() do
---    print(myNames, listCode)
--- end
--- 
--- --Output:
--- --Test	DUT1() beeper.beep(2, 500)
--- --Part1	testpart([[Part1]], 5.0)
--- --Test9	Test9()
--- ```
---@overload fun()
function display.loadmenu.catalog() end


--- **This function removes an entry from the User menu, which can be accessed using the LOAD key on the instrument front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you delete an entry from the User menu, you can no longer run it by pressing the LOAD key.display.loadmenu.add()display.loadmenu.catalog()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14706.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.delete("Test9")
--- for displayName, code in display.loadmenu.catalog() do
---    print(displayName, code)
--- end
--- 
--- --Deletes the script named "Test9"
--- -- 
--- --Output:
--- --Test   DUT1() beeper.beep(2, 500)
--- --Part1   testpart([[Part1]], 5.0)   
--- ```
---@param displayName string The name to be deleted from the User menu
function display.loadmenu.delete(displayName) end
---@class display.trigger
display.trigger = {}




--- **This constant describes the trigger event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to front panel trigger events.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14716.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@type eventID
display.trigger.EVENT_ID= nil
---@class lan.config
lan.config = {}




--- **This attribute describes the LAN default gateway address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the default gateway IP address to use when manual or DLLA configuration methods are used to configure the LAN. If DHCP is enabled, this setting is ignored.This attribute does not indicate the actual setting currently in effect. Use the lan.status attributes to determine the current operating state of the LAN.The IP address must be formatted in four groups of numbers each separated by a decimal.lan.status.gatewaylan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14904.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.gateway)
--- 
--- --Returns the default gateway address. For example, you might see the output:
--- --010.060.008.001
--- ```
lan.config.gateway = 0



--- **This attribute describes the LAN IP address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the LAN IP address to use when the LAN is configured using the manual configuration method. This setting is ignored when DLLA or DHCP is used.This attribute does not indicate the actual setting currently in effect. Use the lan.status attributes to determine the current operating state of the LAN.lan.restoredefaults()lan.status.ipaddress
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14905.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ipaddress = lan.config.ipaddress
--- 
--- --Returns the presently set LAN IP address.
--- ```
lan.config.ipaddress = 0


lan.AUTO = 1
lan.MANUAL = 0

---@alias lanconfigmethodmethod
---|`lan.AUTO`
---|`lan.MANUAL`



--- **This attribute describes the LAN settings configuration method.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls how the LAN IP address, subnet mask, default gateway address, and DNS server addresses are determined.When method is lan.AUTO, the instrument first attempts to configure the LAN settings using dynamic host configuration protocol (DHCP). If DHCP fails, it tries dynamic link local addressing (DLLA). If DLLA fails, it uses the manually specified settings.When method is lan.MANUAL, only the manually specified settings are used. Neither DHCP nor DLLA are attempted.lan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14906.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.method)
--- 
--- --Returns the current method.
--- -- 
--- --For example:
--- --1.00000e+00
--- ```
---@type lanconfigmethodmethod
lan.config.method = 0



--- **This attribute describes the LAN subnet mask.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the LAN subnet mask to use when the manual configuration method is used to configure the LAN. This setting is ignored when DLLA or DHCP is used.This attribute does not indicate the actual setting currently in effect. Use the lan.status.subnetmask attribute to determine the current operating state of the LAN.lan.restoredefaults()lan.status.subnetmask
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14908.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.subnetmask)
--- 
--- --Returns the LAN subnet mask, such as:
--- --255.255.255.000
--- ```
lan.config.subnetmask = 0

---@class lan.status
lan.status = {}



lan.FULL = 1
lan.HALF = 0

---@alias lanstatusduplexduplex
---|`lan.FULL`
---|`lan.HALF`



--- **This attribute describes which duplex mode is currently in use by the LAN interface.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14911.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.duplex)
--- 
--- --Returns the present LAN duplex mode, such as:
--- --1.00000e+00
--- ```
---@type lanstatusduplexduplex
lan.status.duplex = 0



--- **This attribute reads the LAN default gateway address.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The value of gatewayaddress is a string that indicates the IP address of the default gateway in dotted decimal notation.lan.config.gateway
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14912.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.gateway)
--- 
--- --Returns the gateway address, such as:
--- --10.60.8.1
--- ```
lan.status.gateway = 0



--- **This attribute reads the LAN IP address currently in use.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The IP address is a character string that represents the IP address assigned to the instrument.lan.config.ipaddress
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14913.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.ipaddress)
--- 
--- --Returns the LAN IP address currently in use, such as:
--- --10.60.8.83
--- ```
lan.status.ipaddress = 0



--- **This attribute returns the LAN MAC address.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The MAC address is a character string representing the instrument's MAC address in hexadecimal notation. The string includes colons that separate the address octets (see Example).None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14914.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.macaddress)
--- 
--- --Returns the MAC address of the instrument, for example:
--- --00:60:1A:00:00:57
--- ```
lan.status.macaddress = 0



--- **This attribute reads the LAN speed.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the transmission speed currently in use by the LAN interface.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14919.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.speed)
--- 
--- --Returns the instrument's transmission speed presently in use, such as:
--- --1.00000e+02
--- ```
lan.status.speed = 0



--- **This attribute reads the LAN subnet mask that is presently in use.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14920.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.subnetmask)
--- 
--- --Returns the subnet mask of the instrument that is presently in use, such as:
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
--- Generates and sends a LAN trigger packet for the LAN event number specified.Sets the pseudostate to the appropriate state.The following indexes provide the listed events:lan.trigger[N].clear()lan.trigger[N].modelan.trigger[N].overrunlan.trigger[N].stimuluslan.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14921.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].assert()
--- 
--- --Creates a trigger with LAN packet 5.
--- ```
function lantriggerArr.assert() end



--- **This function clears the event detector for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A trigger's event detector remembers if an event has been detected since the last call. This function clears a trigger's event detector and discards the previous history of the trigger packet.This function clears all overruns associated with this LAN trigger.lan.trigger[N].assert()lan.trigger[N].overrunlan.trigger[N].stimuluslan.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14922.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].clear()
--- 
--- --Clears the event detector with LAN packet 5.
--- ```
function lantriggerArr.clear() end



--- **This function connects the lan.trigger instance to the listeners specified by protocol and IP address.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Prepares the event generator to send event messages. For TCP connections, this opens the TCP connection.The event generator automatically disconnects when either the lan.trigger[N].protocol or lan.trigger[N].ipaddress attributes for this event are changed.lan.trigger[N].assert()lan.trigger[N].ipaddresslan.trigger[N].overrunlan.trigger[N].protocollan.trigger[N].stimuluslan.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14923.html"])
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
--- Set to true when the LAN trigger is connected and ready to send trigger events following a successful lan.trigger[N].connect() command. If the LAN trigger is not ready to send trigger events, this value is set to false.Set to false when either lan.trigger[N].protocol or lan.trigger[N].ipaddress attributes are changed or the remote connection closes the connection.lan.trigger[N].connect()lan.trigger[N].ipaddresslan.trigger[N].protocol
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14924.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[1].protocol = lan.MULTICAST
--- print(lan.trigger[1].connected)
--- 
--- --Returns true if connected, or false if not connected.
--- --Example output:
--- --false
--- ```
lantriggerArr.connected= 0



--- **This function disconnects the LAN trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- For TCP connections, this closes the TCP connection.The LAN trigger automatically disconnects when either the lan.trigger[N].protocol or lan.trigger[N].ipaddress attributes for this event are changed.lan.trigger[N].ipaddresslan.trigger[N].protocol
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14925.html"])
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
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to incoming LAN trigger packets.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14926.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[14].stimulus = lan.trigger[1].EVENT_ID
--- 
--- --Route an occurrence of a trigger on LAN trigger 1 to digital I/O trigger 14, then generate the event ID for digital I/O trigger 14.
--- ```
lantriggerArr.EVENT_ID= 0



--- **This attribute specifies the address (in dotteddecimal format) of UDP or TCP listeners.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Sets the IP address for outgoing trigger events.Set to "0.0.0.0" for multicast.After changing this setting, the lan.trigger[N].connect() command must be called before outgoing messages can be sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14927.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
lantriggerArr.ipaddress= 0



--- **This attribute sets the trigger operation and detection mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the mode in which the trigger event detector and the output trigger generator operate on the given trigger. These settings are intended to provide behavior similar to the digital I/O triggers.lan.TRIG_RISING and lan.TRIG_RISINGA are the same.lan.TRIG_RISING and lan.TRIG_RISINGM are the same.lan.TRIG_SYNCHRONOUS is provided for compatibility with the digital I/O and TSPLink triggering on older firmware. Use of lan.TRIG_SYNCHRONOUSA or lan.TRIG_SYNCHRONOUSM (instead of lan.TRIG_SYNCHRONOUS) is preferred.digio functions and attributestsplink functions and attributes
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14928.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.trigger[1].mode)
--- 
--- --Returns the present LAN trigger mode of LAN event 1.
--- -- 
--- ```
lantriggerArr.mode= 0



--- **This attribute describes event detector overrun status.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute Indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event.It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.lan.trigger[N].assert()lan.trigger[N].clear()lan.trigger[N].stimuluslan.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14929.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = lan.trigger[5].overrun
--- print(overrun)
--- 
--- --Checks the overrun status of a trigger with LAN packet 5 and return the value, such as:
--- --false
--- ```
lantriggerArr.overrrun= 0


lan.TCP = nil
lan.UDP = nil
lan.MULTICAST = nil

---@alias lantriggerprotocolprotocol
---|`lan.TCP`
---|`lan.UDP`
---|`lan.MULTICAST`



--- **This attribute sets the LAN protocol to use for sending trigger messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The LAN trigger listens for trigger messages from either protocol but uses the designated protocol for sending outgoing messages. After changing this setting, lan.trigger[N].connect() must be called before outgoing event messages can be sent.When the lan.MULTICAST protocol is selected, the ipAddress attribute is ignored and event messages are sent to the multicast address 224.0.23.159.lan.trigger[N].connect()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14930.html"])
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
--- This attribute can initialize the pseudo state to a known value.Setting this attribute will not cause the LAN trigger to generate any events or output packets.ON or OFF cannot be used when setting the pseudostate.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14931.html"])
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
--- If one or more trigger events have been detected since the last time lan.trigger[N].wait() or lan.trigger[N].clear() was called, this function returns immediately.After waiting for a LAN trigger event with this function, the event detector is automatically reset and rearmed regardless of the number of events detected.lan.trigger[N].assert()lan.trigger[N].clear()lan.trigger[N].overrunlan.trigger[N].stimulus
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14933.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = lan.trigger[5].wait(3)
--- 
--- --Wait for a trigger with LAN packet 5 with a timeout of 3 seconds.
--- ```
---@return any triggered Trigger detection indication
---@param timeout number Maximum amount of time in seconds to wait for the trigger event
function lantriggerArr.wait(timeout) end



--- **This attribute specifies events that cause this trigger to assert.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. The events (triggerStimulus) may be one of the existing trigger event IDs, shown in the following table.Setting this attribute to zero disables automatic trigger generation.If any events are detected prior to calling lan.trigger[N].connect(), the event is ignored and the action overrun is set.lan.trigger[N].assert()lan.trigger[N].clear()lan.trigger[N].connect()lan.trigger[N].overrunlan.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17679.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].stimulus  = trigger.timer[1].EVENT_ID
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
--- The returned resolution for time depends on how long it has been since the timer was reset. It starts with 1 ?s resolution and starts to lose resolution after about 2.8 minutes.timer.reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15281.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- timer.reset()
--- ...
--- time = timer.measure.t()
--- print(time)
--- 
--- --Resets the timer and measures the time since the reset.
--- -- 
--- --Output:
--- --1.469077e+01
--- --The output will vary. The above output indicates that timer.measure.t() was executed 14.69077 seconds after timer.reset().
--- beeper.beep(0.5, 2400)
--- print("reset timer")
--- timer.reset()
--- delay(0.5)
--- dt = timer.measure.t()
--- print("timer after delay:", dt)
--- beeper.beep(0.5, 2400)
--- 
--- --Sets the beeper, resets the timer, sets a delay, then verifies the time of the delay before the next beeper.
--- -- 
--- --Output:
--- --reset timer
--- --timer after delay: 5.00e-01
--- -- 
--- ```
---@return number time Returns the elapsed time in seconds (1 ?s resolution)
function timer.measure.t() end
---@class tsplinktriggerArr
tsplinktriggerArr = {}

---@type tsplinktriggerArr[]
tsplink.trigger = {}




--- **This function simulates the occurrence of the trigger and generates the corresponding event ID.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The set pulse width determines how long the trigger is asserted.tsplink.trigger[N].clear()tsplink.trigger[N].modetsplink.trigger[N].overruntsplink.trigger[N].pulsewidthtsplink.trigger[N].release()tsplink.trigger[N].stimulustsplink.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15292.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[2].assert()
--- 
--- --Asserts trigger on trigger line 2.
--- ```
function tsplinktriggerArr.assert() end



--- **This function clears the event detector for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- tsplink.trigger[N].modetsplink.trigger[N].overruntsplink.trigger[N].release()tsplink.trigger[N].stimulustsplink.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15293.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[2].clear()
--- 
--- --Clears trigger event on synchronization Line 2.
--- ```
function tsplinktriggerArr.clear() end



--- **This attribute identifies the number that is used for the trigger events.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This number is used by the TSP-Link trigger line when it detects an input trigger.Set the stimulus of any trigger event detector to the value of this constant to have it respond to trigger events from this line.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15294.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
tsplinktriggerArr.EVENT_ID= 0



--- **This attribute defines the trigger operation and detection mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the mode in which the trigger event detector and the output trigger generator operate on the given trigger line.The setting for mode can be one of the following values:When programmed to any other mode, the output state of the I/O line is controlled by the trigger logic, and the user-specified output state of the line is ignored.When the trigger mode is set to tsplink.TRIG_RISING, the userspecified output state of the line will be examined. If the output state selected when the mode is changed is high, the actual mode used will be tsplink.TRIG_RISINGA. If the output state selected when the mode is changed is low, the actual mode used will be tsplink.TRIG_RISINGM.The custom variable mode stores the trigger mode as a numeric value when the attribute is read.To control the line state, use the tsplink.TRIG_BYPASS mode with the tsplink.writebit() and the tsplink.writeport() commands.digio.writebit()digio.writeport()tsplink.trigger[N].assert()tsplink.trigger[N].clear()tsplink.trigger[N].overruntsplink.trigger[N].release()tsplink.trigger[N].reset()tsplink.trigger[N].stimulustsplink.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15295.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].mode = tsplink.TRIG_RISINGM
--- 
--- --Sets the trigger mode for the synchronization Line 3 to tsplink.TRIG_RISINGM.
--- ```
tsplinktriggerArr.mode= 0



--- **This attribute indicates if the event detector ignored an event while in the detected state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates that an event was ignored because the event detector was in the detected state when the event was detected.Indicates the overrun state of the event detector built into the line itself.It does not indicate whether an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.It does not indicate output trigger overrun.<CT2600_only_start> Output trigger overrun indications are provided in the status model.<CT2600_only_end>tsplink.trigger[N].assert()tsplink.trigger[N].clear()tsplink.trigger[N].modetsplink.trigger[N].release()tsplink.trigger[N].reset()tsplink.trigger[N].stimulustsplink.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15296.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(tsplink.trigger[1].overrun)
--- 
--- --If an event was ignored, displays true; if an event was not ignored, displays false.
--- -- 
--- ```
tsplinktriggerArr.overrun= 0



--- **This attribute the length of time that the trigger line is asserted for output triggers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to 0 (seconds) asserts the trigger indefinitely.tsplink.trigger[N].release()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15297.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].pulsewidth = 20e-6
--- 
--- --Sets pulse width for trigger Line 3 to 20 s.
--- ```
tsplinktriggerArr.pulsewidth= 0



--- **This function releases a latched trigger on the given TSPLink trigger line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulse width, as well as a trigger that was latched in response to receiving a synchronous mode trigger.tsplink.trigger[N].assert()tsplink.trigger[N].clear()tsplink.trigger[N].modetsplink.trigger[N].overruntsplink.trigger[N].pulsewidthtsplink.trigger[N].stimulustsplink.trigger[N].wait()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15298.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].release()
--- 
--- --Releases trigger Line 3.
--- ```
function tsplinktriggerArr.release() end



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to the timeout value for an input trigger. If one or more trigger events were detected since the last time tsplink.trigger[N].wait() or tsplink.trigger[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.tsplink.trigger[N].clear()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15300.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = tsplink.trigger[3].wait(10)
--- print(triggered)
---  
--- 
--- --Waits up to 10 seconds for a trigger on TSP-Link line 3.
--- --If false is returned, no trigger was detected during the 10-second timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered Trigger detection indication
---@param timeout number The timeout value in seconds
function tsplinktriggerArr.wait(timeout) end



--- **This function resets some of the TSP-Link trigger settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tsplink.trigger[N].reset() function resets the following attributes to their factory defaults:This also clears tsplink.trigger[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17669.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function tsplinktriggerArr.reset() end



--- **This attribute specifies the event that causes the synchronization line to assert a trigger.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To disable automatic trigger assertion on the synchronization line, set this attribute to 0.Do not use this attribute when triggering under script control. Use tsplink.trigger[N].assert() instead.The eventID parameter may be one of the existing trigger event IDs shown in the following table.tsplink.trigger[N].assert()tsplink.trigger[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17682.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@type eventID|0
tsplinktriggerArr.stimulus= 0

---@class triggerblenderArr
triggerblenderArr = {}

---@type triggerblenderArr[]
trigger.blender = {}




--- **This function clears the blender event detector and resets blender N.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the blender event detector to the undetected state and resets the event detector's overrun indicator.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15785.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function triggerblenderArr.clear() end



--- **This attribute sets the trigger blender event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to trigger events from this trigger blender.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15786.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
triggerblenderArr.EVENT_ID= 0



--- **This attribute selects whether the blender operates in OR mode or AND mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects whether the blender waits for any one event (the "OR" mode) or waits for all selected events (the "AND" mode) before signaling an output event.trigger.blender[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15787.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
triggerblenderArr.orenable= 0



--- **This attribute indicates whether or not an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates if an event was ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector that is built into the event blender itself.This attribute does not indicate if an overrun occurred in any other part of the trigger model or in any other trigger object that is monitoring the event. It also is not an indication of an action overrun.trigger.blender[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15788.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.blender[1].overrun)
--- 
--- --If an event was ignored, the output is true; If the event was not ignored, the output is false.
--- ```
triggerblenderArr.overrun= 0



--- **This function waits for a blender trigger event to occur.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits for an event blender trigger event. If one or more trigger events were detected since the last time trigger.blender[N].wait() or trigger.blender[N].clear() was called, this function returns immediately.After detecting a trigger with this function, the event detector automatically resets and rearms. This is true regardless of the number of events detected.trigger.blender[N].clear()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15790.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].mode = digio.TRIG_FALLING
--- digio.trigger[5].mode = digio.TRIG_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
---  
--- print(trigger.blender[1].wait(3))
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens either on line 3 or 5.
--- -- 
--- --Wait three seconds while checking if trigger blender 1 event has occurred.
--- -- 
--- --If the blender trigger event has happened, then true is returned. If the trigger event has not happend, then false is returning after the timeout expires.
--- ```
---@return boolean triggered Trigger detection indication for blender
---@param timeout number Maximum amount of time in seconds to wait for the trigger blender event
function triggerblenderArr.wait(timeout) end



--- **This function resets some of the trigger blender settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.blender[N].reset() function resets the following attributes to their factory defaults:It also clears trigger.blender[N].overrun.trigger.blender[N].orenabletrigger.blender[N].overruntrigger.blender[N].stimulus[M]
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17666.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function triggerblenderArr.reset() end



--- **This attribute specifies which events trigger the blender.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- There are four acceptors that can each select a different event. The eventID parameter can be the event ID of any trigger event.The eventID parameter may be one of the existing trigger event IDs shown in the following table.Use zero to disable the blender input.trigger.blender[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17684.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].mode = digio.TRIG_FALLING
--- digio.trigger[5].mode = digio.TRIG_FALLING
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
---  
--- scan.trigger.arm.stimulus = trigger.blender[1].EVENT_ID
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens on line 3 or 5.
--- -- 
--- -- 
--- -- 
--- --Set the trigger blender 1 event to start a scan.
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
--- This function sets the timer event detector to the undetected state and resets the overrun indicator.trigger.timer[N].count
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15793.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function triggertimerArr.clear() end



--- **This attribute sets and reads the timer delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Each time the timer is triggered, it uses this delay period.Assigning a value to this attribute is equivalent to:This creates a delay list of one value.Reading this attribute returns the delay interval that will be used the next time the timer is triggered.trigger.timer[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15794.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].delay = 50e-6
--- 
--- --Set the trigger timer 1 to delay for 50 ms.
--- ```
triggertimerArr.delay= 0



--- **This attribute sets an array of timer intervals that are used when triggered.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Each time the timer is triggered, it uses the next delay period from the array.After all elements in the array have been used, the delays restart at the beginning of the list.trigger.timer[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15795.html"])
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
--- --Set a delay list on trigger timer 3 with three delays (50 s, 100  s, and 150  s).
--- -- 
--- --Read the delay list on trigger timer 3:
--- -- 
--- --Output (assuming the list was set with three delays (50 s, 100 s, and 150 s):
--- -- 5.000000000e-05
--- --   1.000000000e-04
--- --   1.500000000e-04
--- ```
triggertimerArr.delaylist= 0



--- **This constant contains the trigger timer event number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This constant is an identification number that identifies events generated by this timer.Set the stimulus of any trigger event detector to the value of this constant to have it respond to events from this timer.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15796.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
triggertimerArr.EVENT_ID= 0



--- **This attribute indicates if an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates if an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the timer itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other construct that is monitoring the delay completion event. It also is not an indication of a delay overrun.<CT2600_only_start>Delay overrun indications are provided in the status model.<CT2600_only_end>trigger.timer[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15797.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].overrun)
--- 
--- --If an event was ignored, the output is true; if the event was not ignored, the output is false.
--- ```
triggertimerArr.overrun= 0



--- **This attribute enables or disables the timer trigger passthrough.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When enabled, triggers are passed through immediately and initiate the delay. When disabled, a trigger only initiates a delay.trigger.timer[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15798.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
triggertimerArr.passthrough= 0



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If one or more trigger events were detected since the last time trigger.timer[N].wait() or trigger.timer[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.trigger.timer[N].clear()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15800.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.timer[3].wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 seconds for a trigger on timer 3.
--- --If false is returned, no trigger was detected during the 10-second timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered Trigger detection indication
---@param timeout number Maximum amount of time in seconds to wait for the trigger
function triggertimerArr.wait(timeout) end



--- **This attribute sets the number of events to generate each time the timer is triggered.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If count is set to a number greater than 1, the timer automatically starts the next delay at expiration of the previous delay.Set count to zero (0) to cause the timer to generate trigger events indefinitely.trigger.timer[N].clear()trigger.timer[N].reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15820.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].count)
--- 
--- --Read retrigger count for timer number 1.
--- ```
triggertimerArr.count= 0



--- **This function resets some of the trigger timer settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.timer[N].reset() function resets the following attributes to their factory defaults:It also clears trigger.timer[N].overrun.trigger.timer[N].counttrigger.timer[N].delaytrigger.timer[N].delaylisttrigger.timer[N].overruntrigger.timer[N].passthroughtrigger.timer[N].stimulus
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17668.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function triggertimerArr.reset() end



--- **This attribute specifies which event starts the timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The eventID parameter may be one of the trigger event IDs shown in the following table.Set this attribute to the eventID of any trigger event to wait for that event.Use zero to disable event processing.trigger.timer[N].reset()

---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17688.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].stimulus)
--- 
--- --Prints the event that will start a trigger 1 timer action.
--- ```
---@type eventID|0
triggertimerArr.stimulus= 0

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
--- This function allows you to print or delete all user-created channel patterns in the runtime environment. The entries that are returned are listed in random order.channel.pattern.delete()channel.pattern.getimage()channel.pattern.setimage()channel.pattern.snapshot()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15934.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("1A01,1A02",
---    "patternA")
--- channel.pattern.setimage("1B01,1B02",
---    "patternB")
--- channel.pattern.setimage("1C01,1C02",
---    "patternC")
---  
--- for name in channel.pattern.catalog() do
---    print(name .. " = " ..
---       channel.pattern.getimage(name))
---    channel.pattern.delete(name)
--- end
--- 
--- --This example prints the names and items associated with all user-created channel patterns. It then deletes the channel pattern.
--- --patternC = 1C01,1C02
--- --patternA = 1A01,1A02
--- --patternB = 1B01,1B02
--- ```
function channel.pattern.catalog() end


--- **This function deletes a channel pattern.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- An error is generated if the name does not exist.channel.pattern.catalog()channel.pattern.getimage()channel.pattern.setimage()channel.pattern.snapshot()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15935.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.delete("Channels")
--- 
--- --Deletes a channel pattern called Channels
--- ```
---@param name string A string representing the name of the channel pattern to delete
function channel.pattern.delete(name) end


--- **This function queries a channel pattern for associated channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The returned string lists the channels in the slot, row, column format, even if a channel pattern was used to create it. Results for multiple channel patterns are delimited by a semicolon (;), and commas delimit the specific channels within a single channel pattern in the string.channel.pattern.catalog()channel.pattern.delete()channel.pattern.getimage()channel.pattern.setimage()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17284.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("1A01:1A05", "myPattern")
--- channel.pattern.setimage("1B01,1B03,1B05", "myRoute")
---  
--- myImage = channel.pattern.getimage("myPattern")
--- print(myImage)
--- print(channel.pattern.getimage("myRoute")) 
--- print(channel.pattern.getimage("myRoute, myPattern"))
--- 
--- --Using a Model 7174 (or similar model) card in Slot 1, this example creates two channel patterns and then queries these patterns.
--- -- 
--- --Output:
--- --1A01,1A02,1A03,1A04,1A05
--- --1B01,1B03,1B05
--- --1B01,1B03,1B05;1A01,1A02,1A03,1A04,1A05
--- ```
---@return string channelList A string specifying a list of channels that are represented by the name
---@param name string A string representing the name of the channel pattern to query
function channel.pattern.getimage(name) end


--- **This function creates a channel pattern and associates it with the specified name.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If name is used for an existing channel pattern, that pattern is overwritten with the new pattern channel image (if no errors occur). The previous image associated with the name is lost. The channel pattern is not created if an error is detected. You can create a channel pattern with an empty channelList parameter.Once a channel pattern is created, the only way to add a channel to an existing pattern is to delete the old pattern and recreate the pattern with the new desired items. Alternatively, include the additional channels in the channelList with the channel pattern when using.Channel patterns are lost when power is cycled. Channel patterns are stored when you run the createconfigscript() command. The following restrictions exist when naming a channel pattern:Examples of valid names:Examples of invalid names:An error is generated if:createconfigscript()channel.pattern.catalog()channel.pattern.delete()channel.pattern.getimage()channel.pattern.snapshot()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17296.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.setimage("1A01:1A10", "Channels")
---  
--- oldList = channel.pattern.getimage("Channels")
--- newList = oldList .. ", 1C11"
--- channel.pattern.delete("Channels")
--- channel.pattern.setimage(newList, "Channels")
--- channel.close("Channels, 1D11")
---  
--- Items = channel.pattern.getimage("Channels")
--- channel.pattern.setimage(Items, "Pattern")
--- channel.pattern.delete("Channels")
--- 
--- --For this example, assume there is a Keithley Model 7174 or similar card in Slot 1. 
--- -- 
--- --Creates a pattern, appends a channel to the pattern by retrieving the pattern and recreating it, and then renames the pattern.
--- -- 
--- ```
---@param channelList string A string listing the channels and channel patterns to use when creating the new channel pattern
---@param name string A string representing the name to associate with the new channel pattern
function channel.pattern.setimage(channelList, name) end


--- **This function creates a channel pattern.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command stores the image of presently closed channels and associates them with the name parameter in memory.If name is already used for an existing channel pattern, that pattern is overwritten with the new pattern channel image (if no errors occur). The previous image associated with the name is lost. An error is generated if:Issuing this function on an existing pattern invalidates the existing scan list (the pattern may or may not be used in the current scan list). Creating a new pattern does not invalidate the existing scan list.Snapshots are lost when power is cycled. Channel patterns are stored when the createsconfigcript()  command is executed. Use the created script to restore them.createconfigscript()channel.pattern.catalog()channel.pattern.delete()channel.pattern.getimage()channel.pattern.setimage()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17299.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- channel.pattern.snapshot("voltagePath")
--- 
--- --Creates a pattern named voltagePath that contains the presently closed channels.
--- ```
---@param name string A string representing the name to associate with the present state of channels
function channel.pattern.snapshot(name) end
---@class scan.trigger
scan.trigger = {}




--- **This function clears the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the arm and channel event detectors of the trigger model to the undetected state.scan.trigger.channel.set()scan.trigger.channel.stimulusTrigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16977.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.clear()
--- 
--- --Clears the trigger model.
--- ```
function scan.trigger.clear() end
---@type slotArr[]
slotArr.poles = {}




--- **This attribute indicates if a four-pole setting is supported for the channels on the card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute only exists if a card is installed and if the card supports fourpole settings for the channels on the card. If not, the value is nil. If supported, the value is 1.slot[X].poles.oneslot[X].poles.two
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16335.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- fourPole3 = slot[3].poles.four
--- print(fourPole3)
--- 
--- --Queries if Slot 3 supports four-pole settings for the channels on the card.
--- --Output if card supports four pole:
--- --1.000000000e+00
--- --Output if card does not support four pole:
--- --nil
--- ```
slotArr.poles.four= 0



--- **This attribute indicates if a one-pole setting is supported for the channels on the card.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute only exists if a card is installed and if the card supports onepole settings for the channels on the card. If not, the value is nil. If supported, the value is 1.slot[X].poles.fourslot[X].poles.two
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16336.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(slot[3].poles.one)
--- 
--- --Query to see if Slot 3 supports one-pole settings for the channels on the card.
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
--- This attribute only exists is a card is installed and if the card supports a twopole setting for the channels on the card.If not, the value is nil. If supported, the value is 1.slot[X].poles.oneslot[X].poles.four
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16337.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- twoPole3 = slot[3].poles.two
--- print(twoPole3)
--- 
--- --Query to see if Slot 3 supports two-pole settings for the channels on the card.
--- --Output if card supports two pole:
--- --1.000000000e+00
--- --Output if card does not support two pole:
--- --nil
--- ```
slotArr.poles.two= 0

---@class script.user
script.user = {}




--- **This function returns an iterator that can be used in a for loop to iterate over all the scripts stored in nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16862.html"])
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
---@class script.anonymous
script.anonymous = {}


---@class localnode.define
localnode.define = {}


---@class lan.config.dns
lan.config.dns = {}




--- **Configures DNS server IP addresses.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is an array of DNS (domain name system) server addresses. These addresses take priority for DNS lookups and are consulted before any server addresses that are obtained using DHCP. This allows local DNS servers to be specified that take priority over DHCPconfigured global DNS servers.You can specify up to two addresses. The address specified by 1 is consulted first for DNS lookups.Unused entries will be returned as "0.0.0.0" when read. dnsAddress must be a string specifying the DNS server's IP address in dotted decimal notation. To disable an entry, set its value to "0.0.0.0" or the empty string "".Although only two address may be manually specified here, the instrument will use up to three DNS server addresses. If two are specified here, only one that is given by a DHCP server is used. If no entries are specified here, up to three addresses that are given by a DHCP server are used. The IP address obtained from the DHCP server takes priority for all DNS lookups.lan.config.dns.domainlan.config.dns.dynamiclan.config.dns.hostnamelan.config.dns.verifylan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14898.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- dnsaddress = "164.109.48.173"
--- lan.config.dns.address[1] = dnsaddress
--- 
--- --Write a DNS address of 164.109.48.173 as address 1.
--- --Set the DNS address to dnsaddress
--- ```
---@type integer[]
lan.config.dns.address = 0



--- **Configures the dynamic DNS domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute holds the domain to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the domain specified in this attribute with the DNS server.The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 255 characters are allowed, you must make sure the combined length is also no more than 255 characters.lan.config.dns.dynamiclan.config.dns.hostnamelan.config.dns.verifylan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14899.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.domain)
--- 
--- --Returns the present dynamic DNS domain. For example, if the domain is "Matrix", the response would be:
--- --Matrix
--- ```
lan.config.dns.domain = 0


lan.ENABLE = 1
lan.DISABLE = 0

---@alias lanconfigdnsdynamicstate
---|`lan.ENABLE`
---|`lan.DISABLE`



--- **Enables or disables the dynamic DNS registration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Dynamic DNS registration works with DHCP to register the host name with the DNS server. The host name is specified in the lan.config.dns.hostname attribute.lan.config.dns.hostnamelan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14900.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.dynamic)
--- 
--- --Returns the dynamic registration state.
--- -- 
--- --If dynamic DNS registration is enabled, the response is:
--- --1.00000e+00
--- ```
---@type lanconfigdnsdynamicstate
lan.config.dns.dynamic = 0



--- **This attribute defines the dynamic DNS host name.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute holds the host name to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the host name specified in this attribute with the DNS server.The format for hostname is "K<model number><serial number>", where <model number> and <serial number> are replaced with the actual model number and serial number of the instrument (for example, "K707B1234567")Note that hyphens separate the characters of hostname. The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 255 characters can be entered here, care must be taken to be sure the combined length is also no more than 255 characters.lan.config.dns.dynamiclan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14901.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.hostname)
--- 
--- --Returns the present dynamic DNS host name.
--- ```
lan.config.dns.hostname = 0


lan.ENABLE = 1
lan.DISABLE = 0

---@alias lanconfigdnsverifystate
---|`lan.ENABLE`
---|`lan.DISABLE`



--- **This attribute defines the DNS host name verification state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is enabled, the instrument performs DNS lookups to verify that the DNS host name matches the value specified by lan.config.dns.hostname.lan.config.dns.hostnamelan.restoredefaults()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14902.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.config.dns.verify)
--- 
--- --Returns the present DNS host name verification state.
--- -- 
--- --If it is enabled, the return is:
--- --1.00000e+00
--- ```
---@type lanconfigdnsverifystate
lan.config.dns.verify = 0

---@class lan.status.dns
lan.status.dns = {}




--- **Reads DNS server IP addresses.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is an array of DNS server addresses. The system can use up to three addresses.Unused or disabled entries are returned as "0.0.0.0" when read. The dnsAddress returned is a string specifying the IP address of the DNS server in dotted decimal notation.You can only specify two addresses manually. However, the instrument uses up to three DNS server addresses. If two are specified, only the one given by a DHCP server is used. If no entries are specified here, up to three address given by a DHCP server are used.The value of lan.status.dns.address[1] is referenced first for all DNS lookups. The values of lan.status.dns.address[2] and lan.status.dns.address[3] are referenced second and third, respectively.lan.status.dns.name
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14909.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.dns.address[1])
--- 
--- --Returns DNS server address 1, such as:
--- --164.109.48.173
--- ```
---@type integer[]
lan.status.dns.address = 0



--- **Reads present DNS fully qualified host name.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- A fully qualified domain name (FQDN), sometimes referred to as an absolute domain name, is a domain name that specifies its exact location in the tree hierarchy of the Domain Name System (DNS).A FQDN is the complete domain name for a specific computer or host on the LAN. The FQDN consists of two parts: the host name and the domain name.If the DNS host name for an instrument is not found, this attribute stores the IP address in dotted decimal notation.lan.config.dns.address[N]lan.config.dns.hostname
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14910.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.dns.name)
--- 
--- --Returns the dynamic DNS host name.
--- ```
lan.status.dns.name = 0

---@class lan.status.port
lan.status.port = {}




--- **This attribute reads the LAN dead socket termination port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute holds the TCP port number used to reset all other LAN socket connections.To reset all LAN connections, open a connection to the DST port number.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14915.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.dst)
--- 
--- --Returns the LAN dead socket termination port number, such as:
--- --5.03000e+03
--- ```
lan.status.port.dst = 0



--- **This attribute reads the LAN raw socket connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Stores the TCP port number used to connect the instrument and to control the instrument over a raw socket communication interface.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14916.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.rawsocket)
--- 
--- --Returns the TSP raw socket port number, such as:
--- --5.025000000e+03
--- ```
lan.status.port.rawsocket = 0



--- **This attribute gets the LAN Telnet connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute holds the TCP port number used to connect to the instrument to control it over a Telnet interface.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14917.html"])
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



--- **This attribute gets the LAN VXI-11 connection port number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute stores the TCP port number used to connect to the instrument over a VXI-11 interface.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14918.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.vxi11)
--- 
--- --Returns the VXI-11 number, such as:
--- --1.024000000e+03
--- ```
lan.status.port.vxi11 = 0

---@class status.operation.user
status.operation.user = {}


---@class scan.trigger.arm
scan.trigger.arm = {}




--- **This function clears the arm event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the trigger model's arm event detector to the undetected state.scan.trigger.arm.set()scan.trigger.arm.stimulusTrigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16256.html"])
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
--- This function sets the arm event detector of the trigger model to the detected state.scan.trigger.arm.clear()scan.trigger.arm.stimulusTrigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16257.html"])
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
--- This attribute selects which events cause the arm event detector to enter the detected state.Set this attribute to 0 to start the scan without waiting for an event. eventID may be one of the following trigger event IDs:scan.trigger.arm.clear()scan.trigger.arm.set()Trigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16258.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.arm.stimulus =    scan.trigger.EVENT_SCAN_READY
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
--- This function clears the channel event detector of the trigger model (sets it to the undetected state).scan.trigger.channel.set()scan.trigger.channel.stimulusTrigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16259.html"])
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
--- This function sets the channel event detector of the trigger model to the detected state.scan.trigger.channel.clear()scan.trigger.channel.stimulusTrigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16260.html"])
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
--- This attribute selects which events cause the channel event detector to enter the detected state. Set this attribute to 0 to start the channel action immediately. The eventID parameter may be one of the following trigger event IDs:scan.trigger.channel.clear()scan.trigger.channel.set()Trigger model
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/16976.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- scan.trigger.channel.stimulus =
---    scan.trigger.EVENT_SCAN_START
--- 
--- --Sets the trigger stimulus of the channel event detector to scan start event.
--- scan.trigger.channel.stimulus = 0
--- 
--- --Starts the channel action immediately after the Scan Start Event.
--- ```
---@type triggerEvents|0
scan.trigger.channel.stimulus= 0



--- **This function resets commands to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The reset() command in its simplest form resets the entire TSPenabled system, including the controlling node and all subordinate nodes.If you want to reset a specific instrument, use either the localnode.reset() or node[X].reset() command. The localnode.reset() command is used for the local instrument. The node[X].reset() command is used to reset an instrument on a subordinate node.When no value is specified for system, the default value is true.Resetting the entire system using the reset(true) function is only permitted if the reset command sent from the controlling node. If the node is not the controller, sending this command generates an error.localnode.reset()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13933.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset(true)
--- 
--- --If sent from the controlling node, the entire system is reset (if not sent from the controlling node, an error is generated).
--- ```
---@param system boolean true
---@overload fun()
function reset(system) end


--- **This function delays the execution of the commands that follow it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- It is impossible to delay for zero seconds.The system delays execution of the commands for at least the specified number of seconds and fractional seconds. However, the processing time may cause the system to delay 5 s to 10 s (typical) more than the requested delay.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13949.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.beep(0.5, 2400)
--- delay(0.250)
--- beeper.beep(0.5, 2400)
--- 
--- --Emit a doublebeep at 2400 Hz. The sequence is 0.5 s on, 0.25 s off, 0.5 s on.
--- dataqueue.clear()
--- dataqueue.add(35)
--- timer.reset()
--- delay(0.5)
--- dt = timer.measure.t()
--- print("Delay time was " .. dt)
--- print(dataqueue.next())
--- 
--- --Clear the data queue, add 35 to it, then delay 0.5 seconds before reading it.
--- -- 
--- --Output:
--- --Delay time was 0.500099
--- --3.500000000e+01
--- ```
---@param seconds number The number of seconds to delay, maximum 100,000
function delay(seconds) end


--- **This function waits for all overlapped commands in a specified group to complete.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function will wait for all previously started overlapped commands to complete. Currently the Models 707B and 708B have no overlapped commands implemented. However, other TSPenabled products like the Models 707B and 708B have overlapped commands. Therefore, when the Model 707B or 708B is a TSP master to a slave device with overlapped commands, use this function to wait until all overlapped operations are completed.A group number may only be specified from the master node.If no group is specified, the local group is used.If 0 is specified for the group, this function waits for all nodes in the system.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/13986.html"])
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
function waitcomplete(group) end


--- **This function stops a script that is presently running.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Terminates script execution when called from a script that is being executed.This command does not wait for overlapped commands to complete before terminating script execution. If overlapped commands are required to finish, use the waitcomplete() function before calling exit().waitcomplete()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/14769.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function exit() end


--- **This function creates a function to get the value of an attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful for aliasing attributes to improve execution speed. Calling the function created with makegetter() executes faster than accessing the attribute directly.Creating a getter function is only useful if it is going to be called several times. Otherwise, the overhead of creating the getter function outweighs the overhead of accessing the attribute directly.makesetter()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15041.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- getRule = makegetter(channel, "connectrule")
--- ...
--- r = getrule()
--- 
--- --Creates a getter function called getRule.
--- --When getRule is called, it returns the value of connectrule.
--- ```
---@return function getter The return value
---@param table table Readonly table where the attribute is located
---@param attributeName string The string name of the attribute
function makegetter(table, attributeName) end


--- **This function creates a function that, when called, sets the value of an attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful for aliasing attributes to improve execution speed. Calling the setter function will execute faster than accessing the attribute directly.Creating a setter function is only useful if it is going to be called several times. Otherwise, the overhead of creating the setter function outweighs the overhead of accessing the attribute directly.
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15042.html"])
---
---<br>*Examples:*<br>
--- ```lua
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
--- This function causes the operation complete bit in the Standard Event Status Register to be set when all previously started local overlapped commands are complete. Note that each node independently sets its operation complete bits in its own status model. Any nodes not actively performing overlapped commands will set their bits immediately. All remaining nodes will set their own bits as they complete their own overlapped commands.For additional information, see Status Model.waitcomplete()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15054.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function opc() end


--- **This function prints data from tables or reading buffer subtables.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The correct usage of this function for a buffer containing n elements is:Where n refers to the index of the last entry in the tables to be printed.If endIndex < startIndex or n < startIndex, no data is printed. If startIndex = 1, 1 is used as startIndex. If n < endIndex, n is used as endIndex.When any given reading buffers are being used in overlapped commands that have not yet completed, at least to the desired index, this function returns data as it becomes available.When there are outstanding overlapped commands to acquire data, n refers to the index that the last entry in the table will have after all the measurements have completed.If you do not specify a subtable in a reading buffer, default subtables are automatically used.At least one table or subtable must be specified.This command generates a single response message that contains all data. The response message is stored in the output queue.The format.data attribute controls the format of the response message.format.asciiprecisionformat.byteorderformat.dataprint()printnumber()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15057.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- format.data = format.ASCII
--- format.asciiprecision = 6
--- printbuffer(1, rb1.n, rb1)
--- 
--- --This assumes that rb1 is a valid reading buffer in the runtime environment.
--- --Example of returned data (rb1.readings):
--- --4.07205e-05, 4.10966e-05, 4.06867e-05, 4.08865e-05, 4.08220e-05, 4.08988e-05, 4.08250e-05, 4.09741e-05, 4.07174e-05, 4.07881e-05
--- ```
---@param startIndex number Beginning index of the buffer that is to be printed
---@param endPointIndex any Ending index of the buffer that is to be printed
---@param buffer1 bufferMethods
---@param buffer2 bufferMethods 
---@overload fun(startIndex:number,endPointIndex:any, buffer1: bufferMethods)
---@overload fun(startIndex:number,endPointIndex:any,...:any)
function printbuffer(startIndex, endPointIndex, buffer1,buffer2) end


--- **This function prints numbers using the configured format.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are multiple ways to use this function, depending on how many numbers are to be printed.This function prints the given numbers using the data format specified by format.data, format.asciiprecision, and other associated attributes.At least one number must be given.format.asciiprecisionformat.byteorderformat.dataprint()printbuffer()
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/15058.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- format.asciiprecision = 10
--- x = 2.54
--- printnumber(x)
--- format.asciiprecision = 3
--- printnumber(x, 2.54321, 3.1)
--- 
--- -- 
--- --Output:
--- --2.5400000e+00
--- --2.54e+00, 2.54e+00, 3.10e+00
--- ```
---@overload fun(value:number,...:number)
function printnumber(value) end


--- **This function returns the value of the argument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- TSP-enabled instruments do not have inherent query commands. Like any other scripting environment, the print() command and other related print() commands generate output. The print() command creates one response message.None
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17645.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- x = 10
--- print(x)
--- 
--- --Example of an output response message:
--- --1.00000e+01
--- --Note that your output might be different if you set your ASCII precision setting to a different value.
--- ```
---@overload fun()
---@overload fun()
function print(value1, value2) end


--- **This function captures the present settings of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If name is set to autoexec, the autoexec script in the instrument will be replaced by the new configuration script.If the name is set to the name of an existing script, the existing script will be overwritten.Once created, the configuration script can be run and edited like any other script.Save the present configuration
---
---[command help](command:kic.viewHelpDocument?["Commands_70xB/17655.html"])
---
---<br>*Examples:*<br>
--- ```lua
--- createconfigscript("August2010")
--- 
--- --Captures the present settings of the instrument into a script named August2010
--- ```
---@param name any The name of the script that will be created
function createconfigscript(name) end
