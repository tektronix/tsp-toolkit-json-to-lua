---@meta

---@class io_object
local io_object={}
---@class script_object
local script_object={}
---@class eventID

---@class file_object
local file_object ={}

---@class bufferMethods
local bufferMethods={}
---@class digio
 digio = {}

---@class tsplink
 tsplink = {}

---@class lan
  lan = {}

---@class tspnetConnectionID
local tspnetConnectionID = {}

---@class userstring
userstring = {}




--- **This function adds a user-defined string to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function associates the string value with the string name and stores this key-value pair in nonvolatile memory.Use the userstring.get() function to retrieve the value associated with the specified name.You can use the userstring functions to store custom, instrument-specific information in the instrument, such as department number, asset number, or manufacturing plant location.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/13987.htm"])
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


--- **This function creates an iterator for the user-defined string catalog.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The catalog provides access for user-defined string pairs, allowing you to manipulate all the key-value pairs in nonvolatile memory. The entries are enumerated in no particular order.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/13988.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in userstring.catalog() do
---    userstring.delete(name)
--- end
--- 
--- --Deletes all user-defined strings in nonvolatile memory.
--- userstring.add("assetnumber", "236")
--- userstring.add("product", "Widgets")
--- userstring.add("contact", "John Doe")
--- for name in userstring.catalog() do
---    print(name .. " = " ..
---       userstring.get(name))
--- end
--- 
--- --Prints all userstring key-value pairs.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/13989.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- userstring.delete("assetnumber")
--- userstring.delete("product")
--- userstring.delete("contact")
--- 
--- --Deletes the user-defined strings associated with the assetnumber, product, and contact names.
--- ```
---@param name string The name (key) of the key-value pair of the user-defined string to delete
function userstring.delete(name) end


--- **This function retrieves a user-defined string from nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the string that is associated with name from nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/13990.htm"])
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
---@return number value The value of the user-defined string key-value pair
---@param name string The name (key) of the user-defined string
function userstring.get(name) end
---@class upgrade
upgrade = {}




--- **This function returns to a previous version of the DMM7510 firmware.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function allows you to revert to an earlier version of the firmware.When you send this function, the instrument searches the USB flash drive in the front-panel USB port for an upgrade file. If the file is found, the instrument performs the upgrade. An error is returned if an upgrade file is not found.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14062.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function upgrade.previous() end


--- **This function upgrades the DMM7510 firmware.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When upgrade.unit() is used, the firmware is only loaded if the version of the firmware is newer than the existing version. If the version is older or at the same revision level, it is not upgraded.When you send this function, the instrument searches the USB flash drive in the front-panel USB port for an upgrade file. If the file is found, the instrument verifies that the file is a newer version. If the version is older or at the same revision level, it is not upgraded, although it does request a reboot. If it is a newer version, the instrument performs the upgrade. An error event message is returned if no upgrade file is found.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14063.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14073.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.write(testdevice, "print([[hello]])")
--- print(tspnet.readavailable(testdevice))
---  
---  
---  
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
--- This command connects a device to another device through the LAN interface. If the portNumber is 23, the interface uses the Telnet protocol and sets appropriate termination characters to communicate with the device.If a portNumber and initString are provided, it is assumed that the remote device is not TSP-enabled. The DMM7510 does not perform any extra processing, prompt handling, error handling, or sending of commands. In addition, the tspnet.tsp.* commands cannot be used on devices that are not TSP-enabled.If neither a portNumber nor an initString is provided, the remote device is assumed to be a Keithley Instruments TSP-enabled device. Depending on the state of the tspnet.tsp.abortonconnect attribute, the DMM7510 sends an abort command to the remote device on connection. You can simultaneously connect to a maximum of 32 remote devices.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14074.htm"])
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
--- --Connect to a device that is not TSP-enabled.
--- ```
---@return tsplinkConnectionID connectionID The connection ID to be used as a handle in all other tspnet function calls
---@param ipAddress string IP address to which to connect in a string
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14076.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- testID = tspnet.connect("192.0.2.0")
--- -- Use the connection
--- tspnet.disconnect(testID)
--- 
--- --Create a TSP-Net session.
--- -- 
--- --Close the session.
--- ```
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.disconnect(connectionID) end


--- **This function sends a command string to the remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sends a command string to the remote instrument. A termination is added to the command string when it is sent to the remote instrument (tspnet.termination()). You can also specify a format string, which causes the command to wait for a response from the remote instrument. The DMM7510 decodes the response message according to the format specified in the format string and returns the message as return values from the function (see tspnet.read() for format specifiers).When this command is sent to a TSP-enabled instrument, the DMM7510 suspends operation until a timeout error is generated or until the instrument responds. The TSP prompt from the remote instrument is read and discarded. The DMM7510 places any remotely generated errors and events into its event queue. When the optional format string is not specified, this command is equivalent to tspnet.write(), except that a termination is automatically added to the end of the command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14077.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14078.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- deviceID = tspnet.connect("192.0.2.1")
--- print(tspnet.idn(deviceID))
--- tspnet.disconnect(deviceID)
--- 
--- --Assume the instrument is at IP address 192.0.2.1.
--- --The output that is produced when you connect to the instrument and read the identification string may appear as:
--- --KEITHLEY INSTRUMENTS,MODEL DMM7510,00000170,1.0.0a
--- ```
---@return string idnString The returned *IDN? string
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.idn(connectionID) end


--- **This function reads data from a remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads available data from the remote instrument and returns responses for the specified number of arguments.The format string can contain the following specifiers:A maximum of 10 format specifiers can be used for a maximum of 10 return values.If formatString is not provided, the command returns a string that contains the data until a new line is reached. If no data is available, the DMM7510 pauses operation until the requested data is available or until a timeout error is generated. Use tspnet.timeout to specify the timeout period.When the DMM7510 reads from a TSP-enabled remote instrument, the DMM7510 removes Test Script Processor (TSP®) prompts and places any errors or events it receives from the remote instrument into its own event queue. The DMM7510 prefaces events and errors from the remote device with Remote Error, followed by the event number and description.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14079.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14080.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ID = tspnet.connect("192.0.2.1")
--- tspnet.write(ID, "*idn?\r\n")
---  
--- repeat bytes = tspnet.readavailable(ID) until bytes > 0
---  
--- print(tspnet.read(ID))
--- tspnet.disconnect(ID)
--- 
--- --Send commands that will create data.
--- -- 
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14081.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function tspnet.reset() end


--- **This attribute sets the timeout value for the tspnet.connect(), tspnet.execute(), and tspnet.read() commands. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the amount of time the tspnet.connect(), tspnet.execute(), and tspnet.read() commands will wait for a response.The time is specified in seconds. The timeout may be specified to millisecond resolution but is only accurate to the nearest 10 ms.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14084.htm"])
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
--- The tspnet.write() function sends inputString to the remote instrument. It does not wait for command completion on the remote instrument.The DMM7510 sends inputString to the remote instrument exactly as indicated. The inputString must contain any necessary new lines, termination, or other syntax elements needed to complete properly.Because tspnet.write() does not process output from the remote instrument, do not send commands that generate too much output without processing the output. This command can stop executing if there is too much unprocessed output from previous commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14089.htm"])
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

tspnet.TERM_LF = nil
tspnet.TERM_LFCR = nil
tspnet.TERM_CRLF = nil
tspnet.TERM_CR = nil

---@alias tspnetterminationtype
---|`tspnet.TERM_LF`
---|`tspnet.TERM_LFCR`
---|`tspnet.TERM_CRLF`
---|`tspnet.TERM_CR`


tspnet.TERM_LF = nil
tspnet.TERM_LFCR = nil
tspnet.TERM_CRLF = nil
tspnet.TERM_CR = nil

---@alias tspnetterminationtermSequence
---|`tspnet.TERM_LF`
---|`tspnet.TERM_LFCR`
---|`tspnet.TERM_CRLF`
---|`tspnet.TERM_CR`



--- **This function sets the device line termination sequence.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets and gets the termination character sequence that is used to indicate the end of a line for a TSP-Net connection.Using the termSequence parameter sets the termination sequence. The present termination sequence is always returned.For the termSequence parameter, use the same values listed in the table above for type. There are four possible combinations, all of which are made up of line feeds (LF or 0x10) and carriage returns (CR or 0x13). For TSP-enabled devices, the default is tspnet.TERM_LF. For devices that are not TSP-enabled, the default is tspnet.TERM_CRLF.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34363.htm"])
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
---@return tspnetterminationtype type The termination type
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
---@param termSequence tspnetterminationtermSequence The termination sequence
---@overload fun(connectionID:tspnetConnectionID):tspnetterminationtype
function tspnet.termination(connectionID, termSequence) end
---@class dataqueue
dataqueue = {}




--- **This function adds an entry to the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot use the timeout value when accessing the data queue from a remote node (you can only use the timeout value while adding data to the local data queue).The timeout value is ignored if the data queue is not full.The dataqueue.add() function returns false:If the value is a table, a duplicate of the table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14654.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14655.htm"])
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
--- *Type:*  Constant
---
--- *Details:*<br>
--- This constant always returns the maximum number of entries that can be stored in the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14656.htm"])
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
---@type dataqueueCAPACITYcount
dataqueue.CAPACITY = 0



--- **This attribute contains the number of items in the data queue.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The count is updated as entries are added with dataqueue.add() and read from the data queue with dataqueue.next(). It is also updated when the data queue is cleared with dataqueue.clear().A maximum of dataqueue.CAPACITY items can be stored at any one time in the data queue.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14657.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14658.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14808.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14810.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14811.htm"])
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
function fs.is_dir(path) end


--- **This function creates a directory at the specified path.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the parent folder of the new directory does not exist, or if a file system entry already exists at the given path.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14812.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14814.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14815.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14824.htm"])
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
function fs.is_file(path) end
---@class gpib
gpib = {}




--- **This attribute contains the GPIB address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The address can be set to any address value from 1 to 30. However, the address must be unique in the system. It cannot conflict with an address that is assigned to another instrument or to the GPIB controller.A new GPIB address takes effect when the command to change it is processed. If there are response messages in the output queue when this command is processed, they must be read at the new address.If command messages are being queued (sent before this command has executed), the new settings may take effect in the middle of a subsequent command message, so care should be exercised when setting this attribute from the GPIB interface.You should allow sufficient time for the command to be processed before attempting to communicate with the instrument again.The reset() function does not affect the GPIB address.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14860.htm"])
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

---@class lan
lan = {}




--- **This attribute contains the LXI domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the LXI domain number.All outgoing LXI packets are generated with this domain number. All inbound LXI packets are ignored unless they have this domain number.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14893.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.lxidomain)
--- 
--- --Displays the LXI domain.
--- ```
lan.lxidomain = 0


lan.MODE_AUTO = nil
lan.MODE_MANUAL = nil

---@alias lanipconfigmethod
---|`lan.MODE_AUTO`
---|`lan.MODE_MANUAL`



--- **This function specifies the LAN configuration for the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command specifies how the LAN IP address and other LAN settings are assigned. If automatic configuration is selected, the instrument automatically determines the LAN information. When method is automatic, the instrument first attempts to configure the LAN settings using dynamic host configuration protocol (DHCP). If DHCP fails, it tries dynamic link local addressing (DLLA). If DLLA fails, an error occurs.If manual is selected, you must define the IP address. You can also assign a subnet mask, and default gateway. The IP address, subnet mask, and default gateway must be formatted in four groups of numbers, each separated by a decimal. If you do not specify a subnet mask or default gateway, the previous settings are used.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25725.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.ipconfig(lan.MODE_AUTO)
--- print(lan.ipconfig())
--- lan.ipconfig(lan.MODE_MANUAL, "192.168.0.7", "255.255.240.0", "192.168.0.3")
--- print(lan.ipconfig())
--- 
--- --Set the IP configuration method to automatic. Request the IP configuration. Example output:
--- --lan.MODE_AUTO 134.63.78.136   255.255.254.0   134.63.78.1
--- --Set the IP configuration method to manual. Request the IP configuration. Output:
--- --lan.MODE_MANUAL 192.168.0.7    255.255.240.0  192.168.0.3
--- ```
---@return lanipconfigmethod method The method for configuring LAN settings; it can be one of the following values
---@return string ipV4Address LAN IP address; must be a string specifying the IP address in dotted decimal notation
---@return string subnetMask The LAN subnet mask; must be a string in dotted decimal notation
---@return string gateway The LAN default gateway; must be a string in dotted decimal notation
---@overload fun(method:lanipconfigmethod):string
---@overload fun(method:lanipconfigmethod,ipV4Address:string):string
---@overload fun(method:lanipconfigmethod,ipV4Address:string,subnetMask:string):string
---@overload fun(method:lanipconfigmethod,ipV4Address:string,subnetMask:string,gateway:string):string
function lan.ipconfig() end


--- **This attribute describes the LAN MAC address.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The MAC address is a character string representing the MAC address of the instrument in hexadecimal notation. The string includes colons that separate the address octets.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28423.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.macaddress)
--- 
--- --Returns the MAC address. For example:
--- --08:00:11:00:00:57
--- ```
lan.macaddress = 0

---@class nodeArr
local nodeArr = {}

---@type nodeArr[]
node = {}




--- **This function starts test scripts on a remote TSP-Link node. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is only applicable to TSP-Link systems. You can use this command to use the remote master node to run a script on the specified node. This function does not run test scripts on the master node; only on the subordinate node when initiated by the master node.This function may only be called when the group number of the node is different than the node of the master.This function does not wait for the script to finish execution.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15009.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15010.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15020.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
--- 
--- --Outputs the model number of the local node. For example:
--- --DMM7510 
--- ```
localnode.model = 0



--- **This function sets the date and time of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Internally, the instrument bases time in UTC time. UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).When called without a parameter (the first form), the function returns the current time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25726.htm"])
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

eventlog.SEV_ERROR = nil
eventlog.SEV_ALL = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil

---@alias localnodeshoweventserrorMode
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_ALL`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`



--- **This attribute sets whether or not the instrument automatically outputs generated events to the remote interface.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Enable this attribute to have the instrument output generated events to the remote interface.Events are output after a command message is executed but before prompts are issued (if prompts are enabled with localnode.prompts).If this attribute is disabled, use eventlog.next() to retrieve unread events from the event log.Events are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable show events when the GPIB connection is active, they will not be enabled for a subsequent USB connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30504.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.showevents = eventlog.SEV_ERROR | eventlog.SEV_INFO
--- trigger.digin[3].edge = trigger.EDGE_EITHER
--- 
--- --Send generated error and warning messages.
--- --Example output if the edge cannot be sent to either:
--- --1805, Settings conflict: setting input edge when line 3 set for digital
--- ```
---@type localnodeshoweventserrorMode
localnode.showevents = 0



--- **This function retrieves the instrument date and time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The time is returned in UTC time. UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32416.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute indicates the version number of the firmware that is presently running in the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32595.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.version)
--- 
--- --Outputs the present version level. Example output:
--- --1.0.0a
--- ```
localnode.version = 0



--- **This attribute stores the instrument's serial number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This indicates the instrument serial number.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32597.htm"])
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
localnode.serialno = 0



--- **This attribute contains the power line frequency setting that is used for NPLC calculations.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The instrument automatically detects the power line frequency when the instrument is powered on. Power line frequency can be 50 Hz or 60 Hz.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32628.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- frequency = localnode.linefreq
--- print(frequency)
--- 
--- --Reads the line frequency setting.
--- ```
localnode.linefreq = 0


localnode.ACCESS_PROTECTED = nil
localnode.ACCESS_FULL = nil
localnode.ACCESS_LOCKOUT = nil
localnode.ACCESS_EXCLUSIVE = nil

---@alias localnodeaccessaccessType
---|`localnode.ACCESS_PROTECTED`
---|`localnode.ACCESS_FULL`
---|`localnode.ACCESS_LOCKOUT`
---|`localnode.ACCESS_EXCLUSIVE`



--- **This attribute contains the type of access users have to the instrument through different interfaces.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When access is set to full, the instrument accepts commands from any interface with no login or password.When access is set to exclusive, you must log out of one remote interface and log into another one to change interfaces. You do not need a password with this access.Protected access is similar to exclusive access, except that you must enter a password when logging in.When the access is set to locked out, a password is required to change interfaces, including the front-panel interface.Under any access type, if a script is running on one remote interface when a command comes in from another remote interface, the command is ignored and the message "FAILURE: A script is running, use ABORT to stop it" is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33140.htm"])
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


localnode.DISABLE = nil
localnode.ENABLE = nil

---@alias localnodepromptsprompting
---|`localnode.DISABLE`
---|`localnode.ENABLE`



--- **This attribute determines if the instrument generates prompts in response to command messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the prompting mode is enabled, the instrument generates prompts when the instrument is ready to take another command. Because the prompt is not generated until the previous command completes, enabling prompts provides handshaking with the instrument to prevent buffer overruns.When prompting is enabled, the instrument might generate the following prompts:Commands do not generate prompts. The instrument generates prompts in response to command completion.Prompts are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable prompts when the LAN connection is active, they will not be enabled for a subsequent USB connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33148.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts = localnode.ENABLE
--- 
--- --Enable prompting.
--- ```
---@type localnodepromptsprompting
localnode.prompts = 0



--- **This attribute stores the instrument password.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When the access to the instrument is set to protected or lockout, this is the password that is used to gain access.If you forget the password, you can reset the password to the default:You can also reset the password and the LAN settings from the rear panel by inserting a straightened paper clip into hole below LAN RESET.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34629.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.password = "N3wpa55w0rd"
--- 
--- --Changes the password to N3wpa55w0rd.
--- ```
localnode.password = 0


localnode.DISABLE = nil
localnode.ENABLE = nil

---@alias localnodeprompts4882prompting
---|`localnode.DISABLE`
---|`localnode.ENABLE`



--- **This attribute enables and disables the generation of prompts for IEEE Std 488.2 common commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is enabled, the IEEE Std 488.2 common commands generate prompts if prompting is enabled with the localnode.prompts attribute. If localnode.prompts4882 is enabled, limit the number of *trg commands sent to a running script to 50 regardless of the setting of the localnode.prompts attribute.When this attribute is disabled, IEEE Std 488.2 common commands will not generate prompts. When using the *trg command with a script that executes trigger.wait() repeatedly, disable prompting to avoid problems associated with the command interface input queue filling.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40235.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts4882 = localnode.DISABLE
--- 
--- --Disables IEEE Std 488.2 common command prompting.
--- ```
---@type localnodeprompts4882prompting
localnode.prompts4882 = 0



--- **This attribute returns the internal temperature of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Returns the last recorded value of internal temperature of the instrument in Celsius (°C). The instrument checks internal temperature when it updates references when autozero is on. Internal temperature is not checked if autozero is set to off. It can also become stale when digitize measurements are used or when measurements take a long time.If the temperature changes more than ±5 °C, the instrument logs an event and displays a message on the front panel that recommends that you perform autocalibration.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43771.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.internaltemp)
--- 
--- --Returns the internal temperature of the instrument.
--- --Example output:
--- --53.732574528
--- ```
localnode.internaltemp = 0

---@class tsplink
tsplink = {}




--- **This attribute contains the group number of a TSP-Link node. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To remove the node from all groups, set the attribute value to 0.When the node is turned off, the group number for that node changes to 0.The master node can be assigned to any group. You can also include other nodes in the group that includes the master. Note that any nodes that are set to 0 are automatically included in the group that contains the master node, regardless of the group that is assigned to the master node.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15285.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15287.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15289.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- When the instrument power is first turned on, the state is offline. After tsplink.initialize() or tsplink.reset() is successful, the state is online.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15291.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state = tsplink.state
--- print(state)
--- 
--- --Read the state of the TSP-Link system. If it is online, the output is:
--- --online
--- ```
tsplink.state = 0



--- **This function writes to all TSP-Link synchronization lines as a digital I/O port. **
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern that is written to the I/O port. For example, a data value of 2 has a binary equivalent of 010. Line 2 is set high (1), and the other two lines are set low (0).The reset() function does not affect the present states of the trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15302.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
--- 
--- --Sets the synchronization lines 1 and 2 high (binary 011).
--- ```
---@param data number Value to write to the port (0 to 7)
function tsplink.writeport(data) end


--- **This attribute contains the write‑protect mask that protects bits from changes by the tsplink.writebit() and tsplink.writeport() functions. This attribute is not available on the Models 2604A/2614A/2634A.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The binary equivalent of mask indicates the mask to be set for the TSP-Link trigger line. For example, a mask value of 5 has a binary equivalent of 101. This mask write‑protects TSP-Link trigger lines 1 and 3.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/17630.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeprotect = 5
--- 
--- --Write‑protects TSP-Link trigger lines 1 and 3.
--- ```
tsplink.writeprotect = 0



--- **This function initializes all instruments and enclosures in the TSP-Link system.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the only node on the TSP-Link network is the one running the command and expectedNodes is not provided, this function generates an error event. If you set expectedNodes to 1, the node is initialized.If you include expectedNodes, if nodesFound is less than expectedNodes, an error event is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30551.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- nodesFound = tsplink.initialize(2)
--- print("Nodes found = " .. nodesFound)
--- 
--- --Perform a TSP-Link initialization and indicate how many nodes are found.
--- --Example output if two nodes are found:Nodes found = 2
--- --Example output if fewer nodes are found and if localnode.showevents = 7:1219, TSP-Link found fewer nodes than expectedNodes found = 1
--- ```
---@param expectedNodes any The number of nodes expected on the system (1 to 32)
---@overload fun()
---@overload fun()
function tsplink.initialize(expectedNodes) end


--- **This attribute reads the node number assigned to the master node.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute returns the node number of the master in a set of instruments connected using TSP-Link.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32565.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- LinkMaster = tsplink.master
--- 
--- --Store the TSP-Link master node number in a variable called LinkMaster.
--- ```
tsplink.master = 0

---@class trigger
trigger = {}




--- **This function clears any pending command triggers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A command trigger indicates if a trigger event has been detected over a command interface since the last trigger.wait() command was sent. Command triggers are generated by:trigger.clear() clears the command triggers and discards the history of trigger events.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25637.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- *TRG
--- print(trigger.wait(1))
--- trigger.clear()
--- print(trigger.wait(1))
--- 
--- --Generate a trigger event.
--- --Check if there are any pending trigger events. 
--- --Output: true
--- --Clear any pending command triggers.
--- --Check if there are any pending trigger events.
--- --Output: false
--- ```
function trigger.clear() end


--- **This function waits for a trigger event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to timeout seconds for a trigger on the active command interface. A command interface trigger occurs when:If one or more of these trigger events were previously detected, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25639.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.wait(10)
--- print(triggered)
--- 
--- --Waits up to 10 s for a trigger.
--- --If false is returned, no trigger was detected during the 10 s timeout.
--- --If true is returned, a trigger was detected.
--- ```
---@return boolean triggered A trigger was detected during the timeout period
---@param timeout number Maximum amount of time in seconds to wait for the trigger
function trigger.wait(timeout) end


--- **This function defines a trigger model block that clears the reading buffer.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When trigger model execution reaches the buffer clear trigger block, the instrument empties the specified reading buffer. The specified buffer can be the default buffer or a buffer that you defined.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30574.htm"])
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


trigger.CLEAR_NEVER = nil
trigger.CLEAR_ENTER = nil

---@alias triggermodelsetblocktriggerBLOCK_WAITclear
---|`trigger.CLEAR_NEVER`
---|`trigger.CLEAR_ENTER`


trigger.WAIT_AND = nil
trigger.WAIT_OR = nil

---@alias triggermodelsetblocktriggerBLOCK_WAITlogic
---|`trigger.WAIT_AND`
---|`trigger.WAIT_OR`



--- **This function defines a trigger model block that waits for an event before allowing the trigger model to continue.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The following table shows the constants for the events.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31093.htm"])
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
---    ```trigger.CLEAR_NEVER```<br>
---    ```trigger.CLEAR_ENTER```<br>
--- - *logic*: If each event must occur before the trigger model continues<br>
---    ```trigger.WAIT_AND```<br>
---    ```trigger.WAIT_OR```<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_WAIT, event)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_WAIT, event, clear)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_WAIT, event, clear, logic, event)
trigger.BLOCK_WAIT = 0


trigger.COUNT_INFINITE = nil
trigger.COUNT_AUTO = nil
trigger.COUNT_STOP = nil

---@alias triggermodelsetblocktriggerBLOCK_MEASURE_DIGITIZEcount
---|`trigger.COUNT_INFINITE`
---|`trigger.COUNT_AUTO`
---|`trigger.COUNT_STOP`



--- **This function defines a trigger block that makes or digitizes a measurement.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When you set the count to auto, the trigger model uses the count value that is active for the selected function instead of a specific value. You can use this with configuration lists to change the count value each time a measure/digitize block is encountered.Firmware versions of the DMM7510 before version 1.7.0 had a separate measure and digitize block. If you have code that is using that block, it works in this version of the DMM7510 firmware.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31094.htm"])
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
---    ```trigger.COUNT_INFINITE```<br>
---    ```trigger.COUNT_AUTO```<br>
---    ```trigger.COUNT_STOP```<br>
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31096.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31097.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31098.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31101.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31102.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31103.htm"])
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



--- **This function branches to a specified block when a specified trigger event occurs.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If you are using a timer, it must be started before it can expire. One method to start the timer in the trigger model is to include a Notify block before the On Event block. Set the Notify block to use the same timer as the On Event block.The following table shows the constants for the events.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31104.htm"])
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


trigger.LIMIT_OUTSIDE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_ABOVE = nil
trigger.LIMIT_INSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_CONSTANTlimitType
---|`trigger.LIMIT_OUTSIDE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_INSIDE`


trigger.LIMIT_OUTSIDE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_ABOVE = nil
trigger.LIMIT_INSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_CONSTANTlimitA
---|`trigger.LIMIT_OUTSIDE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_INSIDE`


trigger.LIMIT_OUTSIDE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_ABOVE = nil
trigger.LIMIT_INSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_CONSTANTlimitB
---|`trigger.LIMIT_OUTSIDE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_INSIDE`



--- **This function defines a trigger model block that goes to a specified block if a measurement meets preset criteria.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The type of limit can be:The measurement block must be a measure/digitize block that occurs in the trigger model before the branch-on-constant-limits block. The last measurement from a measure/digitize block is used.If the limit A is more than the limit B, the values are automatically swapped so that the lesser value is used as the lower limit.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31105.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_LIMIT_CONSTANT, trigger.LIMIT_ABOVE, 0.1, 1, 2)
--- 
--- --Sets trigger block 5 to be a constant limit that branches to block 2 when the measurement is above the value set for limit B (which is set to 1). Note that limit A must be set but is ignored. 
--- ```
--- Additional paramteres are:
--- - *limitType*: The type of limit, which can be one of the following types<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_INSIDE```<br>
--- - *limitA*: The lower limit that the measurement is tested against; if limitType is set to<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_INSIDE```<br>
--- - *limitB*: The upper limit that the measurement is tested against; if limitType is set to<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_INSIDE```<br>
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31107.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31108.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31109.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31110.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31112.htm"])
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


trigger.LIMIT_OUTSIDE = nil
trigger.LIMIT_BELOW = nil
trigger.LIMIT_ABOVE = nil
trigger.LIMIT_INSIDE = nil

---@alias triggermodelsetblocktriggerBLOCK_BRANCH_LIMIT_DYNAMIClimitType
---|`trigger.LIMIT_OUTSIDE`
---|`trigger.LIMIT_BELOW`
---|`trigger.LIMIT_ABOVE`
---|`trigger.LIMIT_INSIDE`



--- **This function defines a trigger model block that goes to a specified block in the trigger model if a measurement meets user-defined criteria.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The measure/digitize block must occur in the trigger model before the branch-on-dynamic-limits block. If no block is defined, the measurement from the previous measure/digitize block is used. If no previous measure/digitize block exists, an error is reported.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31114.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(7, trigger.BLOCK_BRANCH_LIMIT_DYNAMIC, trigger.LIMIT_OUTSIDE, 2, 10, 5)
--- 
--- --Configure block 7 to check if limit 2 is outside its limit values, based on the measurements made in block 5. If values are outside the measurements, branch to block 10. If the values are not outside the measurements, trigger model execution continues to block 8.
--- ```
--- Additional paramteres are:
--- - *limitType*: The type of limit, which can be one of the following types<br>
---    ```trigger.LIMIT_OUTSIDE```<br>
---    ```trigger.LIMIT_BELOW```<br>
---    ```trigger.LIMIT_ABOVE```<br>
---    ```trigger.LIMIT_INSIDE```<br>
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31347.htm"])
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


trigger.LOG_WARN_ABORT = nil
trigger.LOG_INFO = nil
trigger.LOG_ERROR = nil
trigger.LOG_WARN = nil

---@alias triggermodelsetblocktriggerBLOCK_LOG_EVENTeventNumber
---|`trigger.LOG_WARN_ABORT`
---|`trigger.LOG_INFO`
---|`trigger.LOG_ERROR`
---|`trigger.LOG_WARN`



--- **This function allows you to log an event in the event log when the trigger model is running.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- Note that using this block too often in a trigger model could overflow the event log. It may also take away from the time needed to process more critical trigger model blocks.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35428.htm"])
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
---    ```trigger.LOG_WARN_ABORT```<br>
---    ```trigger.LOG_INFO```<br>
---    ```trigger.LOG_ERROR```<br>
---    ```trigger.LOG_WARN```<br>
--- - *message*: A string up to 31 characters<br>
trigger.BLOCK_LOG_EVENT = 0



--- **This function creates a placeholder that performs no action in the trigger model; available only using remote commands.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If you remove a trigger model block, you can use this block as a placeholder for the block number so that you do not need to renumber the other blocks.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35431.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41689.htm"])
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


trigger.CONT_AUTO = nil
trigger.CONT_OFF = nil
trigger.CONT_RESTART = nil

---@alias triggercontinuoussetting
---|`trigger.CONT_AUTO`
---|`trigger.CONT_OFF`
---|`trigger.CONT_RESTART`



--- **This attribute determines the trigger mode setting after bootup.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Conditions must be valid before continuous measurements can start.When the restart parameter is selected, the instrument is placed in local mode, aborts any running scripts, and aborts any trigger models that are running. If the command is in a script, it is the last command that runs before the script is aborted. The restart parameter is not stored in nonvolatile memory, so it does not affect start up behavior.The off and automatic parameters are stored in nonvolatile memory, so they affect start up behavior.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/88463.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35753.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.reset()
--- 
--- --Resets the DMM commands to their default settings.
--- ```
function dmm.reset() end

dmm.TERMINALS_FRONT = nil
dmm.TERMINALS_REAR = nil

---@alias dmmterminalsterminals
---|`dmm.TERMINALS_FRONT`
---|`dmm.TERMINALS_REAR`



--- **This attribute describes which set of input and output terminals the instrument is using.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You must use the front-panel TERMINALS switch to change which set of terminals the instrument reads.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41309.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.terminals)
--- 
--- --Request information on which terminals are used.
--- --Output if the instrument is using the front terminals:
--- --dmm.TERMINALS_FRONT
--- ```
---@type dmmterminalsterminals
dmm.terminals = 0

---@class scriptVar
scriptVar = {}




--- **This function runs a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scriptVar.run() function runs the script referenced by scriptVar. You can also run the script by using scriptVar().
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/16856.htm"])
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
--- The scriptVar.save() function saves a script to nonvolatile memory or a USB flash drive. The root folder of the USB flash drive has the absolute path /usb1/.If no filename is specified, the script is saved to internal nonvolatile memory. If a filename is given, the script is saved to the USB flash drive.If you set scriptVar to autoexec, the script is run when the instrument powers up. You must delete the existing autoexec script before saving the new one. Note that performing a system reset does not delete the autoexec script.You can add the file extension, but it is not required. The only allowed extension is .tsp (see Example 2).
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/16863.htm"])
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
---@param filename string A string that contains the file name to use when saving the script to a USB flash drive
---@overload fun()
function script_object.save(filename) end


--- **This attribute contains the source code of a script.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The body of the script is a single string with lines separated by the new line character.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33395.htm"])
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
script_object.source = 0

---@class channel
channel = {}




--- **This function closes the channels and channel patterns that are specified by the channel list parameter without opening any channels.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Channels closed with this command are appended to the already closed channels (no previously closed channels are opened by this command).Actions associated with this function include:An error is generated if:Once an error is detected, the command stops processing and no channels are closed. 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/17229.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@param channelList string A string that lists the channels and channel patterns to close
function channel.close(channelList) end


--- **This function opens the specified channels and channel patterns.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function opens the specified channels based on the channel's switching configuration.The settling time associated with a channel must elapse before the command completes. User delay is not added when a relay opens.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/17548.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- channelList
--- 
--- --String listing the channels and channel patterns to open
--- channel.open("slot3, slot5")
--- 
--- --Opens all channels on slots 3 and 5.
--- channel.open("allslots")
--- 
--- --Opens all channels on all slots.
--- ```
---@param channelList string String listing the channels and channel patterns to open
function channel.open(channelList) end


--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- scanner.enable = ON or OFFScanner card support. Do we want scanner or go with scan?  Not intended to support scan like 37xx so scanner may be a better prefix but, for SCPI can't support SCAN and SCAN as short form to SCANner
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41359.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
channel.enable = 0

---@class buffer
buffer = {}




--- **This function returns statistics from a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that was placed in the reading buffer.The instrument automatically updates reading buffer statistics as data is added to the reading buffer.When the reading buffer is configured to fill continuously and overwrite old data with new data, the buffer statistics include the data that was overwritten. To get statistics that do not include data that has been overwritten, define a large buffer size that will accommodate the number of readings you will make. The table returned from this function provides statistics at the time the function is called. Although the instrument continues to update the statistics, the table that is returned is not updated. To get fresh statistics, call this function again.The statsVar parameter contains the values described in the following table.If n equals zero (0), all other values are nil. If n equals 1, stddev is nil because the standard deviation of a sample size of 1 is undefined.Use the following command to get values from statsVar; a table with the following entries in it: n, min, max, mean, and stddev:Use the following commands to print these entries:To print all the entries, send:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25624.htm"])
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
--- ```
---@return statsVar statsVar A table that contains the entries for buffer statistics; see Details for information on the entries
---@param bufferVar bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@param absStartTime number An integer that represents the absolute start time in seconds
---@param absStartFractional number An integer that represents the portion of the absolute start time that is in fractional seconds
---@param absEndTime number An integer that represents the absolute end time in seconds
---@param absEndFractional number An integer that represents the portion of the absolute end time that is in fractional seconds
---@overload fun():statsVar
---@overload fun(bufferVar:bufferMethods):statsVar
---@overload fun(bufferVar:bufferMethods,relStartTime:number,relEndTime:number):statsVar
function buffer.getstats(bufferVar, absStartTime, absStartFractional, absEndTime, absEndFractional) end

buffer.STYLE_COMPACT = nil
buffer.STYLE_WRITABLE_FULL = nil
buffer.STYLE_WRITABLE = nil
buffer.STYLE_STANDARD = nil
buffer.STYLE_FULL = nil

---@alias buffermakestyle
---|`buffer.STYLE_COMPACT`
---|`buffer.STYLE_WRITABLE_FULL`
---|`buffer.STYLE_WRITABLE`
---|`buffer.STYLE_STANDARD`
---|`buffer.STYLE_FULL`



--- **This function creates a user-defined reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot assign user-defined reading buffers the name defbuffer1 or defbuffer2. In addition, the buffer name must not already exist as a global variable, a local variable, table, or array.If you create a reading buffer that has the same name as an existing user-defined buffer, the existing buffer is overwritten by the new buffer. Any data in the existing buffer is lost.When you create a reading buffer, it becomes the active buffer. If you create two reading buffers, the last one you create becomes the active buffer.If you select 0, the instrument creates the largest reading buffer possible based on the available memory when the buffer is created.The default fill mode of a user-defined buffer is once. You can change it to continuous later.Once the buffer style is selected, it cannot be changed.Once you store the first reading in a compact buffer, you cannot change certain measurement settings, including range, display digits, and units; you must clear the buffer first.Not all remote commands are compatible with the compact, writable, and full writable buffer styles. Check the Details section of the command descriptions before using them with any of these buffer styles.Writable reading buffers are used to bring external data into the instrument. You cannot assign them to collect data from the instrument.You can change the buffer capacity for an existing buffer through the front panel or by using the bufferVar.capacity command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25629.htm"])
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

buffer.SAVE_RELATIVE_TIME = nil
buffer.SAVE_TIMESTAMP_TIME = nil
buffer.SAVE_FORMAT_TIME = nil
buffer.SAVE_RAW_TIME = nil

---@alias buffersaveappendtimeFormat
---|`buffer.SAVE_RELATIVE_TIME`
---|`buffer.SAVE_TIMESTAMP_TIME`
---|`buffer.SAVE_FORMAT_TIME`
---|`buffer.SAVE_RAW_TIME`



--- **This function appends data from the reading buffer to a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the file you specify does not exist on the USB flash drive, this command creates the file.For options that save more than one item of time information, each item is comma-delimited. For example, the default format is date, time, and fractional seconds for each reading.The file extension .csv is appended to the file name if necessary. Any file extension other than .csv generates an error.The index column entry in the .csv file starts at 1 for each append operation.Examples of valid destination file names:Invalid destination file name examples:— The period is not followed by csv.— The only allowed extension is .csv. If .csv is not assigned, it is automatically added.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25642.htm"])
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
--- The file name must specify the full path (including /usb1/). If included, the file extension must be set to .csv. If no file extension is specified, .csv is added.Examples of valid destination file names:The DMM7510 does not check for existing files when you save. Verify that you are using a unique name to avoid overwriting any existing CSV files on the flash drive.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33210.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33981.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34560.htm"])
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

buffer.UNIT_FARAD = nil
buffer.UNIT_CUSTOM3 = nil
buffer.UNIT_RATIO = nil
buffer.UNIT_VOLT = nil
buffer.UNIT_WATT = nil
buffer.UNIT_SECOND = nil
buffer.UNIT_AMP_AC = nil
buffer.UNIT_X = nil
buffer.UNIT_DECIBEL = nil
buffer.UNIT_DIO = nil
buffer.UNIT_CELSIUS = nil
buffer.UNIT_DBM = nil
buffer.UNIT_TOT = nil
buffer.UNIT_RECIPROCAL = nil
buffer.UNIT_OHM = nil
buffer.UNIT_DAC = nil
buffer.UNIT_FAHRENHEIT = nil
buffer.UNIT_NONE = nil
buffer.UNIT_CUSTOM1 = nil
buffer.UNIT_KELVIN = nil
buffer.UNIT_PERCENT = nil
buffer.UNIT_AMP = nil
buffer.UNIT_HERTZ = nil
buffer.UNIT_CUSTOM2 = nil
buffer.UNIT_VOLT_AC = nil

---@alias buffermathunit
---|`buffer.UNIT_FARAD`
---|`buffer.UNIT_CUSTOM3`
---|`buffer.UNIT_RATIO`
---|`buffer.UNIT_VOLT`
---|`buffer.UNIT_WATT`
---|`buffer.UNIT_SECOND`
---|`buffer.UNIT_AMP_AC`
---|`buffer.UNIT_X`
---|`buffer.UNIT_DECIBEL`
---|`buffer.UNIT_DIO`
---|`buffer.UNIT_CELSIUS`
---|`buffer.UNIT_DBM`
---|`buffer.UNIT_TOT`
---|`buffer.UNIT_RECIPROCAL`
---|`buffer.UNIT_OHM`
---|`buffer.UNIT_DAC`
---|`buffer.UNIT_FAHRENHEIT`
---|`buffer.UNIT_NONE`
---|`buffer.UNIT_CUSTOM1`
---|`buffer.UNIT_KELVIN`
---|`buffer.UNIT_PERCENT`
---|`buffer.UNIT_AMP`
---|`buffer.UNIT_HERTZ`
---|`buffer.UNIT_CUSTOM2`
---|`buffer.UNIT_VOLT_AC`



--- **This function allows you to run a mathematical expression on a measurement. The expression is applied when the measurement is placed in the reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/73595.htm"])
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


--- **This function allows you to create up to three custom units of measure for use in buffers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use custom units of measures in buffer math and writable buffers.If you specify more than two characters, the additional characters are ignored. Some characters are converted to other symbols:This unit is reset when power is cycled. It is not affected by reset.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/76401.htm"])
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
--- --Instrument has terminals set to FRONT.
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
---@param UNIT_CUSTOMN bufferCustomUnit Custom unit user can create, The number of the custom unit, 1, 2, or 3
---@param unitOfMeasure string A string that defines the custom unit; up to three characters; defaults are X for custom unit 1, Y for unit 2, and Z for unit 3
function buffer.unit(UNIT_CUSTOMN, unitOfMeasure) end




--- **This attribute contains the number of readings in the specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You can call this command to return the number of readings stored in the specified reading buffer.You can use the bufferVar.n attribute in other commands. For example, to print all the readings in a buffer, use the following command:Where bufferVar is the name of the buffer to use.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25630.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(100)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.n)
--- print(defbuffer1.n)
--- print(defbuffer2.n)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- --Print the number of readings in testData.
--- --Output:
--- --3
--- --Print the number of readings in defbuffer1.
--- --Example output:
--- --0
--- --Print the number of readings in defbuffer2.
--- --Example output:
--- --0
--- ```
bufferMethods.n = 0


--- **This attribute contains the stored readings shown as numbers with units and prefixes.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute is an array that contains the stored readings. The readings are shown as numbers with prefixes before the units symbol.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25640.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.formattedreadings[1])
--- printbuffer(1, testData.n, testData.formattedreadings)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- --Print the first reading.
--- --Example output:
--- ---0.0001901 V
--- --Print all readings in the reading buffer.
--- --Example output:
--- ---0.0001901 V, +000.08537 mV, -000.13050 mV
--- ```
bufferMethods.formattedreadings = 0


--- **This attribute contains the unit of measure that is stored with readings in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute contains the unit of measure that is stored with readings in the reading buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25641.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(50)
--- testData.fillmode = buffer.FILL_CONTINUOUS
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, testData.n, testData.units)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, testData.n, testData.units)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- --Set the buffer to fill continuously.
--- --Set the measure function to current.
--- --Make three readings.
--- --Print the units for the readings.
--- --Output:
--- --Amp DC, Amp DC, Amp DC
--- --Set the measure function to voltage.
--- --Make three readings.
--- --Output:
--- --Volt DC, Volt DC, Volt DC
--- ```
bufferMethods.units = 0


--- **This attribute sets the number of readings a buffer can store.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command allows you to change or view how many readings a buffer can store. Changing the size of a buffer will cause any existing data in the buffer to be lost.If you select 0, the instrument creates the largest reading buffer possible based on the available memory when the buffer is created.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25706.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(500)
--- capTest = buffer.make(300)
--- bufferCapacity = capTest.capacity
---  
--- print(bufferCapacity)
---  
---  
--- print(testData.capacity)
---  
---  
--- testData.capacity = 600
--- print(testData.capacity)
--- print(defbuffer1.capacity)
--- 
--- --Create two user-defined reading buffers: testData and capTest.
--- -- 
--- --Create a variable called bufferCapacity to hold the capacity of the capTest buffer.
--- --Print bufferCapacity.
--- --Output:
--- --300
--- --Print the capacity of testData.
--- --Output:
--- --500
--- --Changes the capacity of testData to 600.
--- --Print the capacity of testData.
--- --Output:
--- --600
--- --Print the capacity of the default buffer defbuffer1.
--- --Output:
--- --100000
--- ```
bufferMethods.capacity = 0


--- **This attribute contains the timestamps, in seconds, when each reading occurred, relative to the timestamp of the first entry in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute is an array of timestamps, in seconds, of when each reading occurred relative to the timestamp of the first entry in the reading buffer. These timestamps are equal to the time that has lapsed for each reading since the first reading was stored in the buffer. Therefore, the relative timestamp for the first entry number in the reading buffer equals 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25712.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.relativetimestamps[1])
--- printbuffer(1, 3, testData.relativetimestamps)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- -- 
--- --Print the relative timestamp for the first reading in the buffer.
--- --Example output:
--- --0
--- --Print the relative timestamp for the reading 1 through 3 in the buffer.
--- --Example output:
--- --0, 0.383541, 0.772005
--- ```
bufferMethods.relativetimestamps = 0


--- **This attribute contains the timestamp of a reading in seconds, in UTC format.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute contains the nonfractional seconds portion of the timestamp when the reading was stored in Coordinated Universal Time (UTC) format.The nonfractional seconds portion of the timestamp gives the lowest resolution down to 1 second. To access additional resolution of a timestamp, see bufferVar.fractionalseconds.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25713.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 6, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, 6, testData.seconds)
--- 
--- --Create a reading buffer named testData, configure the instrument to make six measurements, and store the readings in the buffer.
--- --Print the seconds portion for readings 1 to 6 in testData. 
--- --Example output:
--- --1362261492, 1362261492, 1362261493, 1362261493, 1362261493, 1362261494
--- ```
bufferMethods.seconds = 0


--- **This attribute contains the time when the instrument made the reading.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25715.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.times[1])
--- printbuffer(1, 3, testData.times)
--- 
--- --This example creates a reading buffer named testData and makes three measurements.
--- --The print() command outputs the time of the first reading. 
--- --Output:
--- --23:09:43
--- --The printbuffer() command outputs the time of readings 1 to 3 in the reading buffer. 
--- --Output:
--- --23:09:43, 23:09:43, 23:09:43
--- ```
bufferMethods.times = 0


--- **This attribute contains the timestamp when each reading saved in the specified reading buffer occurred.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute contains the timestamps (date, hours, minutes, seconds, and fractional seconds) of readings stored in the reading buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25716.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.timestamps[1])
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- --Print the first reading date. 
--- --Output:
--- --03/01/2018 14:46:07.714614838
--- for x = 1, 3 do printbuffer(x, x, testData.timestamps) end
--- 
--- --For the buffer created in Example 1, print the timestamps for the readings.
--- --Output:
--- --03/01/2018 14:46:07.71461483803/01/2018 14:46:08.10046883803/01/2018 14:46:08.487631838
--- ```
bufferMethods.timestamps = 0


--- **This function clears all readings and statistics from the specified buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30485.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, testData.n, testData)
--- testData.clear()
--- print("Readings in buffer after clear ="    .. testData.n)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, testData.n, testData)
--- 
--- --Create a reading buffer named testData, make three readings and store them in testData, and then view the readings.
--- --Print number of readings in testData.
--- --Output:
--- ---4.5010112303956e-10, -3.9923108222095e-12, -4.5013931471161e-10
--- --Clear the readings in testData.
--- --Verify that there are no readings in testData.
--- --Output:
--- --Readings in buffer after clear = 0
--- --Store three new readings in testData and view those when complete.
--- --Output:
--- --4.923509754e-07, 3.332266330e-07, 3.974883867e-07
--- ```
function bufferMethods.clear() end


--- **This attribute contains the dates of readings that are stored in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The dates are formatted as month, day, year.This is not available if the reading buffer style is set to compact.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30488.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 1, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.dates[1])
--- printbuffer(1, testData.n, testData.dates)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- --Print the first reading date. 
--- --Example output:
--- --11/27/2017
--- --Prints the dates for readings 1 through the last reading in the buffer.
--- --Example output:
--- --11/27/2017, 11/27/2017, 11/27/2017
--- ```
bufferMethods.dates = 0

buffer.FILL_CONTINUOUS = nil
buffer.FILL_ONCE = nil

---@alias bufferVarfillmodefillMode
---|`buffer.FILL_CONTINUOUS`
---|`buffer.FILL_ONCE`



--- **This attribute determines if a reading buffer is filled continuously or is filled once and stops.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When a reading buffer is set to fill once, no data is overwritten in the buffer. When the buffer is filled, no more data is stored in that buffer and new readings are discarded.When a reading buffer is set to fill continuously, the oldest data is overwritten by the newest data after the buffer fills.When you change the fill mode of a buffer, any data in the buffer is cleared.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30489.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(50)
--- print(testData.fillmode)
--- testData.fillmode = buffer.FILL_CONTINUOUS
--- print(testData.fillmode)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer. Print the fill mode setting for the testData buffer.
--- --Output:
--- --0
--- --Set fill mode to continuous. 
--- --Print the fill mode setting for the testData buffer.
--- --Output:
--- --1
--- ```
---@type bufferVarfillmodefillMode
bufferMethods.fillmode = 0


--- **This attribute contains the fractional second portion of the timestamp of each reading in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute is an array of the fractional portion of the timestamp, in seconds, when each reading occurred. Seconds are shown as fractions.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30542.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 6, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- print(testData.fractionalseconds[1])
--- printbuffer(1, 6, testData.fractionalseconds)
--- 
--- --Create a reading buffer named testData and make six measurements.
--- --Print the fractional portion of the timestamp for the first reading in the buffer.
--- --Example output:
--- --0.647118937
--- --Print the fractional portion of the timestamp for the first six readings in the buffer.
--- --Example output:
--- --0.647118937, 0.064543, 0.48196127, 0.89938724, 0.316800064, 0.734218263
--- ```
bufferMethods.fractionalseconds = 0


--- **This attribute contains the readings stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30545.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 3, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, 3, testData.readings)
--- 
--- --Create a reading buffer named testData, configure the instrument to make three measurements, and store the readings in the buffer.
--- --Print the three readings in testData.
--- --Output:
--- ---9.6420389034124e-12, -4.5509945811872e-10, -9.1078204006445e-12
--- ```
bufferMethods.readings = 0

buffer.OFF = nil
buffer.ON = nil

---@alias bufferVarlogstatelogState
---|`buffer.OFF`
---|`buffer.ON`



--- **This attribute indicates if information events are logged when the specified reading buffer is at 0% or 100% filled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- If this is set to on, when the reading buffer is cleared (0% filled) or full (100% filled), an event is logged in the event log. If this is set to off, reading buffer status is not reported in the event log.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30577.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- MyBuffer = buffer.make(500)
--- print(MyBuffer.logstate)
--- 
--- --Create the user-defined buffer MyBuffer.
--- --Print the log state of MyBuffer.
--- --Output:
--- --0
--- ```
---@type bufferVarlogstatelogState
bufferMethods.logstate = 0


--- **This attribute contains the status values of readings in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command is not available if the buffer style is set to compact.This read-only attribute is an array of status values for the readings in the buffer. The status values are floating-point numbers that encode the status value. Refer to the following table for values.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33164.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
--- testData = buffer.make(50)
--- trigger.model.load("SimpleLoop", 2, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, 2, testData.statuses)
--- 
--- --Create a reading buffer named testData, configure the instrument to make two measurements, and store the readings in the buffer.
--- --Print the status for the readings in testData.
--- --Output:
--- --64, 64
--- --Indicating that the status is buffer.STAT_LIMIT1_LOW.
--- ```
bufferMethods.statuses = 0


--- **This attribute contains the additional values in a reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute contains an additional value, such as the sense voltage from a DC voltage ratio measurement. The reading buffer style must be set to full to use this option.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46323.htm"])
---
---<br>*Examples:*<br>
--- ```lua
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
--- testData = buffer.make(50, buffer.STYLE_FULL)
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.read(testData)
--- print(testData.extravalues[1])
--- printbuffer(1, 1, testData.extravalues)
--- 
--- --Reset the instrument.
--- --Create a reading buffer named testData that can hold a maximum of 50 readings and is set to the style full.
--- --Make a measurement and save it to the testData buffer.
--- --Print the first extra reading value.
--- --Example output:
--- ---7.4235309424
--- ---7.4235309424
--- ```
bufferMethods.extravalues = 0


--- **This attribute indicates the starting index in a reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Use this attribute to find the starting index in a reading buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/56793.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test1 = buffer.make(100)
--- dmm.measure.count = 6
--- dmm.measure.read(test1)
--- print(test1.startindex, test1.endindex, test1.capacity)
--- 
--- --Create a buffer named test1 with a capacity of 100 readings.Set the measure count to 6.
--- --Make measurements and store them in buffer test1.Get the start index, end index, and capacity of test1.
--- --Output:
--- --1, 6, 100
--- ```
bufferMethods.startindex = 0


--- **This attribute indicates the last index in a reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Use this attribute to find the ending index in a reading buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/56794.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test1 = buffer.make(100)
--- dmm.measure.count = 6
--- dmm.measure.read(test1)
--- print(test1.startindex, test1.endindex, test1.capacity)
--- dmm.measure.read(test1)
--- print(test1.startindex, test1.endindex)
--- 
--- --Create a buffer named test1 with a capacity of 100 readings.Set the measure count to 6.
--- --Make measurements and store them in buffer test1.Get the start index, end index, and capacity of test1.
--- --Output:
--- --1, 6, 100
--- --Make six more measurements and store them in buffer test1.
--- --Get the start index and end index of test1.
--- --Output:
--- --1, 12
--- ```
bufferMethods.endindex = 0


--- **This attribute contains the measurement and the unit of measure of the additional values in a reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute contains the measurement and the unit of measure of an additional value, such as the sense voltage from a DC voltage ratio measurement. The reading buffer style must be set to full to use this option.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/81089.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- mathExp = buffer.make(400, buffer.STYLE_FULL)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- buffer.math(mathExp, buffer.UNIT_NONE, buffer.EXPR_MULTIPLY)
--- for x = 1, 3 do 
---      print("Reading: ", dmm.measure.read(mathExp))
--- end
--- display.changescreen(display.SCREEN_READING_TABLE)
--- print("Extra value reading 1: ", mathExp.extraformattedvalues[1])
--- print("Extra value reading 2: ", mathExp.extraformattedvalues[2])
--- print("Extra value reading 3: ", mathExp.extraformattedvalues[3])
--- 
--- --Reset the instrument.
--- --Make a buffer named mathExp set to hold 400 readings with a buffer style of FULL.
--- --Set the measure function to DC voltage.
--- --Set the buffer math expression to multiply readings against the previous readings.
--- --Make three readings.
--- --Display the reading table on the front panel of the instrument, where you can view the extra readings.
--- --Print the extra values (the calculated values).
--- --Example output:
--- --Reading: 	7.1233589551e-06
--- --Reading: 	7.1233080234e-06
--- --Reading: 	7.2616603575e-06
--- --Extra value reading 1: 	+7.1233590 u
--- --Extra value reading 2: 	+50.741880 p
--- --Extra value reading 3: 	+51.727043 p
--- reset()
--- testData = buffer.make(50, buffer.STYLE_FULL)
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.read(testData)
--- printbuffer(1, testData.n, testData.extraformattedvalues)
--- 
--- --Reset the instrument.
--- --Create a reading buffer named testData that can hold a maximum of 50 readings and is set to the style full.
--- --Make a measurement and save it to the testData buffer.
--- --Print the first extra value with the unit of measure.
--- --Example output:
--- ---5.716896 RA
--- ```
bufferMethods.extraformattedvalues = 0


--- **This attribute contains the units of the additional values in a reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute contains the unit of measure of an additional value, such as the sense voltage from a DC voltage ratio measurement. The reading buffer style must be set to full to use this option.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/81090.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- extBuffer = buffer.make(100, buffer.STYLE_WRITABLE_FULL)
--- buffer.write.format(extBuffer, buffer.UNIT_WATT, buffer.DIGITS_3_5,   buffer.UNIT_WATT, buffer.DIGITS_3_5)
--- buffer.write.reading(extBuffer, 1, 7)
--- buffer.write.reading(extBuffer, 2, 8)
--- buffer.write.reading(extBuffer, 3, 9)
--- buffer.write.reading(extBuffer, 4, 10)
--- buffer.write.reading(extBuffer, 5, 11)
--- buffer.write.reading(extBuffer, 6, 12)
--- printbuffer(1, 6, extBuffer.readings, extBuffer.extravalueunits)
--- 
--- --Creates a 100-point reading buffer named extBuffer. Style is full writable.
--- --Set the data format to show units of watts with 3½ digit resolution for the first value and for the second value in the buffer index.
--- --Write 12 pieces of data into the buffer.
--- --Print the buffer, including the readings and extra value units.
--- --Read the buffer.
--- --Output:
--- --1, Watt DC, 2, Watt DC, 3, Watt DC, 4, Watt DC, 5, Watt DC, 6, Watt DC
--- reset()
--- testData = buffer.make(50, buffer.STYLE_FULL)
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.read(testData)
--- printbuffer(1, testData.n, testData.extravalueunits)
--- 
--- --Reset the instrument.
--- --Create a reading buffer named testData that can hold a maximum of 50 readings and is set to the style full.
--- --Make a measurement and save it to the testData buffer.
--- --Print the unit of measure of the first extra value.
--- --Example output:
--- --Ratio
--- ```
bufferMethods.extravalueunits = 0
---@class timer
timer = {}




--- **This function measures the elapsed time since the timer was last cleared.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dataqueue.clear()
--- dataqueue.add(35)
--- timer.cleartime()
--- delay(0.5)
--- dt = timer.gettime()
--- print("Delay time was " .. dt)
--- print(dataqueue.next())
--- 
--- --Clear the data queue, add 35 to it, and then delay 0.5 seconds before reading it.
--- --Output:
--- --Delay time was 0.500099
--- --35
--- ```
---@return number time The elapsed time in seconds (1 µs resolution)
function timer.gettime() end


--- **This function resets the timer to zero (0) seconds.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25636.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dataqueue.clear()
--- dataqueue.add(35)
--- timer.cleartime()
--- delay(0.5)
--- dt = timer.gettime()
--- print("Delay time was " .. dt)
--- print(dataqueue.next())
--- 
--- --Clear the data queue, add 35 to it, and then delay 0.5 seconds before reading it.
--- --Output:
--- --Delay time was 0.500099
--- --35
--- ```
function timer.cleartime() end
---@class eventlog
eventlog = {}



eventlog.SEV_ERROR = nil
eventlog.SEV_ALL = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil

---@alias eventlogsaveeventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_ALL`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`



--- **This function saves the event log to a file on a USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command saves all event log entries to a USB flash drive.If you do not define an event type, the instrument saves all event log entries.The extension .csv is automatically added to the file name.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25702.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/27637.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function eventlog.clear() end

eventlog.SEV_ERROR = nil
eventlog.SEV_ALL = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil

---@alias eventlognexteventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_ALL`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`



--- **This function returns the oldest unread event message from the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When an event occurs on the instrument, it is placed in the event log. The eventlog.next() command retrieves an unread event from the event log. Once an event is read, it can no longer be accessed remotely. However, it can be viewed on the front panel. When localnode.showevents is enabled, this command never returns an event because those events are automatically read and sent to the remote interface.To read multiple events, execute this command multiple times.If there are no entries in the event log, the following is returned:If the event type is not defined, an event of any type is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/27658.htm"])
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

eventlog.SEV_ERROR = nil
eventlog.SEV_ALL = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil

---@alias eventloggetcounteventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_ALL`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`



--- **This function returns the number of unread events in the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A count finds the number of unread events in the event log. You can specify the event types to return or return the count for all events.This command reports the number of events that have occurred since the command was last sent or since the event log was last cleared.Events are read automatically when localnode.showevents is enabled. You can also read them individually with eventlog.next().
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30552.htm"])
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

eventlog.SEV_ERROR = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil

---@alias eventlogposteventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`



--- **This function allows you to post your own text to the event log.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this command to create your own event log entries and assign a severity level to them. This can be useful for debugging and status reporting.From the front panel, you must set the Log Warnings and Log Information options on to have the custom warning and information events placed into the event log.You can send use the following codes to create special characters in the message.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34730.htm"])
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

eventlog.SEV_ERROR = nil
eventlog.SEV_ALL = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil

---@alias eventlogsuppresseventType
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_ALL`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`



--- **This command allows you to suppress system events from generating a popup on the front‑panel interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The eventType parameter allows you to suppress groups of events (errors, warnings, and information). You can combine the event types to suppress more than one type. For example, to suppress information and error events, send the command:You can use the eventNumber parameter to suppress individual system This command does not prevent system events from appearing in the event log or in a file on a USB flash drive.An event number is the number that accompanies an error, warning, or information message that is reported in the event log. For example, for the error "Error -109, Missing parameter," the event number is –109. Note that some messages that are displayed on the front panel are not recorded in the event log. Only messages that include an event number can be suppressed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40049.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- eventlog.suppress(-109)
--- 
--- --Suppress -109, the missing parameter message, from displaying a popup on the front panel.
--- ```
---@param eventNumber number The number of a specific event to be suppressed
---@overload fun(eventType:eventlogsuppresseventType)
function eventlog.suppress(eventNumber) end
---@class display
display = {}



display.FORMAT_PREFIX = nil
display.FORMAT_EXPONENT = nil

---@alias displayreadingformatformat
---|`display.FORMAT_PREFIX`
---|`display.FORMAT_EXPONENT`



--- **This attribute determines the format that is used to display measurement readings on the front-panel display of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting persists through reset() and power cycles.When Prefix is selected, prefixes are added to the units symbol, such as k (kilo) or m (milli). When Exponent is selected, exponents are used instead of prefixes. When the prefix option is selected, very large or very small numbers may be displayed with exponents.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25719.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.readingformat = display.FORMAT_EXPONENT
--- 
--- --Change front-panel display to show readings in exponential format.
--- ```
---@type displayreadingformatformat
display.readingformat = 0


display.TEXT2 = nil
display.TEXT1 = nil

---@alias displaysettextDisplayText
---|`display.TEXT2`
---|`display.TEXT1`



--- **This function defines the text that is displayed on the front-panel USER swipe screen.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command defines text messages for the USER swipe screen.If you enter too many characters, the instrument displays a warning event and shortens the message to fit.When the instrument is reset, the user test is removed and the USER swipe screen is hidden until another message is defined.You can send use the following codes to create special characters in the message.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25722.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30502.htm"])
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

display.SCREEN_SETTINGS_SWIPE = nil
display.SCREEN_HISTOGRAM = nil
display.SCREEN_GRAPH_SWIPE = nil
display.SCREEN_PROCESSING = nil
display.SCREEN_GRAPH = nil
display.SCREEN_USER_SWIPE = nil
display.SCREEN_FUNCTIONS_SWIPE = nil
display.SCREEN_HOME = nil
display.SCREEN_HOME_LARGE_READING = nil
display.SCREEN_READING_TABLE = nil
display.SCREEN_STATS_SWIPE = nil
display.SCREEN_SECONDARY_SWIPE = nil

---@alias displaychangescreenscreenName
---|`display.SCREEN_SETTINGS_SWIPE`
---|`display.SCREEN_HISTOGRAM`
---|`display.SCREEN_GRAPH_SWIPE`
---|`display.SCREEN_PROCESSING`
---|`display.SCREEN_GRAPH`
---|`display.SCREEN_USER_SWIPE`
---|`display.SCREEN_FUNCTIONS_SWIPE`
---|`display.SCREEN_HOME`
---|`display.SCREEN_HOME_LARGE_READING`
---|`display.SCREEN_READING_TABLE`
---|`display.SCREEN_STATS_SWIPE`
---|`display.SCREEN_SECONDARY_SWIPE`



--- **This function changes which front-panel screen is displayed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30503.htm"])
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

display.BUTTONS_OK = nil
display.BUTTONS_YESNO = nil
display.BUTTONS_NONE = nil
display.BUTTONS_CANCEL = nil
display.BUTTONS_YESNOCANCEL = nil
display.BUTTONS_OKCANCEL = nil

---@alias displaypromptbuttonID
---|`display.BUTTONS_OK`
---|`display.BUTTONS_YESNO`
---|`display.BUTTONS_NONE`
---|`display.BUTTONS_CANCEL`
---|`display.BUTTONS_YESNOCANCEL`
---|`display.BUTTONS_OKCANCEL`



--- **This function allows you to create an interactive dialog prompt that displays a custom message on the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command displays buttons and text on the front panel. You can set up scripts that respond to the buttons when they are selected.If you send display.BUTTONS_NONE, the operator needs to press the EXIT key to clear the message from the front-panel display. You can also use the display.delete() command to remove the prompt.Only one prompt can be active at a time.When the user presses a button, the button presses are returned as one of the following options:To capture return values, you need to use display.waitevent() to wait for the user button selection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33260.htm"])
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

display.BUTTON_CANCEL = nil
display.BUTTON_YES = nil
display.BUTTON_NO = nil
display.BUTTON_OK = nil

---@alias displaywaiteventsubID
---|`display.BUTTON_CANCEL`
---|`display.BUTTON_YES`
---|`display.BUTTON_NO`
---|`display.BUTTON_OK`



--- **This function causes the instrument to wait for a user to respond to a prompt that was created with a prompt command.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command waits until a user responds to a front-panel prompt that was created with the display.prompt() command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33261.htm"])
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

display.STATE_LCD_50 = nil
display.STATE_LCD_75 = nil
display.STATE_LCD_100 = nil
display.STATE_LCD_25 = nil
display.STATE_LCD_OFF = nil
display.STATE_BLACKOUT = nil

---@alias displaylightstatebrightness
---|`display.STATE_LCD_50`
---|`display.STATE_LCD_75`
---|`display.STATE_LCD_100`
---|`display.STATE_LCD_25`
---|`display.STATE_LCD_OFF`
---|`display.STATE_BLACKOUT`



--- **This attribute sets the light output level of the front-panel display.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command changes the light output of the front panel when a test requires different instrument illumination levels.The change in illumination is temporary. The normal backlight settings are restored after a power cycle. You can use this to reset a display that is already dimmed by the front-panel Backlight Dimmer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33459.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/38977.htm"])
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


--- **This attribute determines which buffer is used for measurements that are displayed on the front panel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The buffer defined by this command is used to store measurements data and is shown in the reading buffer indicator on the home screen of the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/81840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.activebuffer = buffer2
--- 
--- --Set the front panel to use buffer2 as the active reading buffer.
--- ```
display.activebuffer = 0

---@class file
file = {}




--- **This function creates a directory at the specified path on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The directory path must be absolute. The name of the directory must not already exist on the flash drive.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- file.mkdir("TestData")
--- 
--- --Create a new directory named TestData.
--- ```
---@param path string A string that contains the path of the directory
function file.mkdir(path) end

file.MODE_WRITE = nil
file.MODE_APPEND = nil
file.MODE_READ = nil

---@alias fileopenaccessType
---|`file.MODE_WRITE`
---|`file.MODE_APPEND`
---|`file.MODE_READ`



--- **This function opens a file on the USB flash drive for later reference.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path to the file to open must be absolute.If you use file.MODE_APPEND and the file specified to open is not on the flash drive, the file is created.The root folder of the USB flash drive has the following absolute path:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25724.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- file_num = file.open("/usb1/testfile.txt", file.MODE_WRITE)
--- if file_num != nil then
---    file.write(file_num, "This is my test file")
---    file.close(file_num)
--- end
--- 
--- --Opens file testfile.txt for writing. If no errors were found while opening, writes This is my test file and closes the file.
--- ```
---@return file_object fileNumber A number identifying the open file that you use with other file commands to write, read, flush, or close the file after opening
---@param fileName string A string that contains the file name to open, including the full path of file
---@param accessType fileopenaccessType The type of action to do
function file.open(fileName, accessType) end

file.READ_ALL = nil
file.READ_LINE = nil
file.READ_NUMBER = nil

---@alias filereadreadAction
---|`file.READ_ALL`
---|`file.READ_LINE`
---|`file.READ_NUMBER`



--- **This function reads data from a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads data from a file.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/27929.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- file_num = file.open("/usb1/testfile.txt", file.MODE_READ)
--- if file_num != nil then
---    file_contents = file.read(file_num, file.READ_ALL)
---    file.close(file_num)
--- end
--- 
--- --Open testfile.txt on the USB flash drive for reading. If it opens successfully, read the entire contents of the file and store it in variable file_contents.
--- --Close the file.
--- ```
---@return string fileContents The contents of the file based on the readAction parameter
---@param fileNumber file_object The file number returned from the file.open() function to read
---@param readAction filereadreadAction The action
function file.read(fileNumber, readAction) end


--- **This function closes a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Note that files are automatically closed when the file descriptors are garbage collected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/27930.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- file_num = file.open("/usb1/GENTRIGGER", file.MODE_WRITE)
--- file.close(file_num)
--- 
--- --Open the file GENTRIGGER for writing, then close it.
--- ```
---@param fileNumber file_object The file number returned from the file.open() function to close
function file.close(fileNumber) end


--- **This function writes data to a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file.write() function may include data that is buffering; it may not be written to the USB flash drive immediately. Use the file.flush() function to immediately write buffered data to the drive.You must use the file.close() command to close the file after writing.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/27934.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- file_num = file.open("testfile.txt", file.MODE_WRITE)
--- if file_num != nil then
---    file.write(file_num, "This is my test file")
---    file.close(file_num)
--- end
--- 
--- --Opens file testfile.txt for writing. If no errors were found while opening, writes This is my test file and closes the file.
--- ```
---@param fileNumber file_object The file number returned from the file.open() function to write
---@param string string A string that contains the data to write to the file
function file.write(fileNumber, string) end


--- **This function writes buffering data to a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The file.write() function may be buffering data instead of writing immediately to the USB flash drive. Use file.flush() to flush this data. Data may be lost if the file is not closed or flushed before a script ends.If there is going to be a time delay before more data is written to a file, flush the file to prevent loss of data because of an aborted test.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/27958.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Fix the range to 10 V
--- dmm.measure.range = 10
---  
--- -- Set the measurement count to 100
--- dmm.measure.count = 100
---  
--- -- Set up reading buffers
--- -- Ensure the default measurement buffer size matches the count
--- defbuffer1.capacity = 100
--- dmm.measure.read()
---  
--- testDir = "TestData5"
---  
--- -- create a directory on the USB drive for the data
--- file.mkdir(testDir)
--- fileName = "/usb1/" .. testDir .. "/myTestData.csv"
--- buffer.save(defbuffer1, fileName)
---  
--- if file.usbdriveexists() != 0 then
---    -- testDir = "TestData3"
---  
---    -- Create a directory on the USB drive for the data
---    -- file.mkdir(testDir)
---    -- Open the file where the data will be stored
---    -- fileName = "/usb1/" .. testDir .. "/myTestData.csv"
---    fileNumber = file.open(fileName, file.MODE_APPEND)
--- -- Write header separator to file
---    file.write(fileNumber, "\n\n====================================================================\n")
--- -- Write the string data to a file
---    file.write(fileNumber, "Tested to Company Standard ABC.123\n")
--- -- Ensure a hurry-up of data written to the file before close or script end
---    file.flush(fileNumber)
--- -- Close the data file
---    file.close(fileNumber)
---  
--- end
--- 
--- --This example writes a string that indicates that the readings were made for a certain reason, such as to test to a company standard.
--- ```
---@param fileNumber file_object The file number returned from the file.open() function to flush
function file.flush(fileNumber) end


--- **This function detects if a USB flash drive is inserted into the front-panel USB port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can call this command from a script to verify that a USB flash drive is inserted before attempting to write data to it.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34905.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local response
--- local xMax = 10
---  
--- for x = 1, xMax do
---  -- Make xMax readings and store them in defbuffer1.
---  dmm.measure.read()
--- end
---  
--- if (file.usbdriveexists() == 1) then 
---    response = display.BUTTON_YES
--- else
---    response = display.input.prompt(display.BUTTONS_YESNO, "Insert a USB flash drive.\nPress Yes to write data or No to not write data.") 
--- end
---  
--- if (response == display.BUTTON_YES) then
---    if (file.usbdriveexists() == 1) then 
---    FileNumber = file.open("/usb1/TenReadings.csv", file.MODE_WRITE)
---  file.write(FileNumber,"Reading,Seconds\n")
---  
---  -- Print out the measured values in a two-column format.
---  print("\nIteration:\tReading:\tTime:\n")
---  
---  for i = 1, xMax do
---  print(i, defbuffer1[i], defbuffer1.relativetimestamps[i])
---  file.write(FileNumber, string.format("%g, %g\r\n",defbuffer1.readings[i], defbuffer1.relativetimestamps[i]))
---  end
---  file.close(FileNumber)
---    else
---       response = display.input.prompt(display.BUTTONS_OK,
---       "No drive detected. Allow more time after inserting a drive.") 
---    end
--- end
--- 
--- --Make measurements.
--- --Verify that a flash drive is inserted into the instrument.
--- --If the flash drive is inserted, write the data to the flash drive.
--- --Print data into a two-column format.
--- --If the flash drive is not inserted after selecting Yes, another prompt is displayed.
--- ```
---@return any driveInserted 0
function file.usbdriveexists() end
---@class format
format = {}



format.BIGENDIAN = nil
format.LITTLEENDIAN = nil

---@alias formatbyteorderorder
---|`format.BIGENDIAN`
---|`format.LITTLEENDIAN`



--- **This attribute sets the binary byte order for the data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the byte order in which data is written when you are printing data values with the printnumber() and printbuffer() functions. The byte order attribute is only used with the format.REAL32 and format.REAL64 data formats.If you are sending data to a computer with a Microsoft Windows operating system, select the format.LITTLEENDIAN byte order.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28048.htm"])
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
--- --#0¤p??
--- --#0??p¤
--- ```
---@type formatbyteorderorder
format.byteorder = 0



--- **This attribute sets the precision (number of digits) for all numbers returned in the ASCII format.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the precision (number of digits) for numeric data printed with the print(), printbuffer(), and printnumber() functions. The format.asciiprecision attribute is only used with the ASCII format. The precision value must be a number from 0 to 16.Note that the precision is the number of significant digits printed. There is always one digit to the left of the decimal point; be sure to include this digit when setting the precision.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28056.htm"])
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


format.ASCII = nil
format.REAL64 = nil
format.REAL32 = nil

---@alias formatdatavalue
---|`format.ASCII`
---|`format.REAL64`
---|`format.REAL32`



--- **This attribute sets the data format for data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can control the precision of numeric values with the format.asciiprecision attribute. If format.REAL32 or format.REAL64 is selected, you can select the byte order with the format.byteorder attribute.The IEEE Std 754 binary formats use four bytes for single-precision values and eight bytes for double-precision values.When data is written with any of the binary formats, the response message starts with #0 and ends with a new line. When data is written with the ASCII format, elements are separated with a comma and space.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28063.htm"])
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
--- --Output a number represented by x in ASCII using a precision of 10, then output the same number in binary using double precision format.
--- --Output:
--- --3.141592650e+00
--- --#0ñÔÈSû!   @
--- ```
---@type formatdatavalue
format.data = 0

---@class beeper
beeper = {}




--- **This function generates an audible tone.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use the beeper of the instrument to provide an audible signal at a specific frequency and time duration.Using this function from a remote interface does not affect audible errors or key click settings that were made from the DMM7510 front panel.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/29636.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30567.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- You can use this command to read the status byte, which is returned as a numeric value. When an enabled status event occurs, a summary bit is set in this register to indicate the event occurrence. The returned value can indicate that one or more status events occurred. If more than one bit of the register is set, statusByte equals the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).The meanings of the individual bits of this register are shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31635.htm"])
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
status.condition = 0



--- **This attribute stores the settings of the Service Request (SRQ) Enable Register.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets or clears the individual bits of the Status Request Enable Register.The Status Request Enable Register is cleared when power is cycled or when a parameter value of 0 is sent with this command.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32386.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33635.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30981.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31368.htm"])
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
---@class script
script = {}




--- **This function creates a script from a specified file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The name that is used for scriptVar must not already exist as a global variable. In addition, the scriptVar name must be a global reference and not a local variable, table, or array.For external scripts, the root folder of the USB flash drive has the absolute path /usb1/.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33286.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- test8 = script.load("/usb1/testSetup.tsp")
--- 
--- --Loads the script with the file name testSetup.tsp that is on the USB flash drive and names it test8.
--- ```
---@param file string A string that contains the path and file name of the script file to load; if scriptVar is not defined, this name is used as the global variable name for this script
---@return script_object scriptVar The created script; a global variable with this name is used to reference the script
---@overload fun(file:string):script_object
function script.load(file) end


--- **This function returns an iterator that can be used in a for loop to iterate over all the scripts stored in nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function accesses the catalog of scripts stored in nonvolatile memory, which allows you to process all scripts in nonvolatile memory. The entries are enumerated in no particular order.Each time the body of the function executes, name takes on the name of one of the scripts stored in nonvolatile memory. The for loop repeats until all scripts have been iterated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33290.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in script.catalog() do
---    print(name)
--- end
--- 
--- --Retrieve the catalog listing for user scripts.
--- --print(name) represent the body parameter shown in the Usage.
--- ```
function script.catalog() end


--- **This function deletes a script from the run-time memory and nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When a script is deleted, the global variable referring to this script is also deleted.You must delete an existing script before you can use the name of that script again. Scripts are not automatically overwritten.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33394.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- script.delete("test8")
--- 
--- --Deletes a user script named test8 from nonvolatile memory and the global variable named test8.
--- ```
---@param scriptName string A string that represents the name of the script
function script.delete(scriptName) end
---@class acal
acal = {}




--- **This attribute returns the number of times autocalibration has been run.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The number of times that autocalibration has been run since the last factory calibration. The count restarts at 1 after a factory calibration.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43634.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.count)
--- 
--- --Returns the number of times autocalibration has been run.
--- --Example output:
--- --15
--- ```
acal.count = 0


acal.ACTION_RUN = nil
acal.ACTION_NONE = nil
acal.ACTION_NOTIFY = nil

---@alias acalscheduleaction
---|`acal.ACTION_RUN`
---|`acal.ACTION_NONE`
---|`acal.ACTION_NOTIFY`


acal.INTERVAL_16HR = nil
acal.INTERVAL_14DAY = nil
acal.INTERVAL_8HR = nil
acal.INTERVAL_30DAY = nil
acal.INTERVAL_1DAY = nil
acal.INTERVAL_90DAY = nil
acal.INTERVAL_7DAY = nil

---@alias acalscheduleinterval
---|`acal.INTERVAL_16HR`
---|`acal.INTERVAL_14DAY`
---|`acal.INTERVAL_8HR`
---|`acal.INTERVAL_30DAY`
---|`acal.INTERVAL_1DAY`
---|`acal.INTERVAL_90DAY`
---|`acal.INTERVAL_7DAY`



--- **This function sets how often autocalibration occurs or prompts you to run it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When autocalibration is scheduled to run at a scheduled interval, but it runs at a time other than the scheduled interval, subsequent scheduled intervals are adjusted according to the actual autocalibration start time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43638.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- acal.schedule(acal.ACTION_RUN, acal.INTERVAL_1DAY, 8)
--- 
--- --Sets autocalibration to run every day at 8 am.
--- ```
---@param action acalscheduleaction Determines when and if the instrument automatically runs autocalibration
---@param interval acalscheduleinterval Determines how often autocalibration should be run or notification should occur
---@param hour any Specify when the autocalibration should occur; specify in 24-hour time format (0 to 23; default is 0); not available for the 8-hour or 16-hour interval
---@overload fun()
---@overload fun(action:acalscheduleaction)
---@overload fun(action:acalscheduleaction,interval:acalscheduleinterval)
function acal.schedule(action, interval, hour) end


--- **This function returns autocalibration constants to the previous constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reverts the present set of autocalibration constants to the previous set of autocalibration constants.The last run time and internal temperature are reverted to the previous values. The autocalibration count is reset to 1.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43639.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- acal.revert()
--- 
--- --Autocalibration values are reverted to the previous set of autocalibration constants.
--- ```
function acal.revert() end


--- **This function immediately runs autocalibration and stores the constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- During autocalibration, a progress message is displayed on the front panel, all necessary autocalibration steps are completed, calibration constants are updated, and autocalibration last run information is updated. At completion, an event message is generated.If you have set up autocalibration to run at a scheduled interval, when you send the run command, the instrument adjusts the next scheduled autocalibration to be the next interval. For example, if autocalibration is scheduled to run every 7 days, but you run autocalibration on day 3, the next autocalibration will run 7 days after day 3.When an autocalibration command is received, the instrument runs the autocalibration to completion before executing the next command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43640.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- acal.run()
--- 
--- --Autocalibration starts running. When it is complete, an information message is generated in the event log.
--- ```
function acal.run() end
---@class fan
fan = {}



fan.LEVEL_NORMAL = nil
fan.LEVEL_QUIET = nil

---@alias fanlevelfanLevel
---|`fan.LEVEL_NORMAL`
---|`fan.LEVEL_QUIET`



--- **This attribute sets the speed of the instrument fan.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this command to lower the audible noise level of the instrument fan.When you set the fan level to quiet:Instrument performance can be improved with the use of autocalibration. Allow 90 minutes between changing fan level and running autocalibration.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/56834.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- fan.level = fan.LEVEL_QUIET
--- 
--- --Set the fan speed to the quiet level. The audible noise of the fan decreases.
--- ```
---@type fanlevelfanLevel
fan.level = 0

---@class tspnet.tsp
tspnet.tsp = {}




--- **This function causes the TSP-enabled instrument to stop executing any of the commands that were sent to it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.Sends an abort command to the remote instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14085.htm"])
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
--- This setting determines if the instrument sends an abort message when it attempts to connect to a TSP-enabled instrument using the tspnet.connect() function.When you send the abort command on an interface, it causes any other active interface on that instrument to close. If you do not send an abort command (or if tspnet.tsp.abortonconnect is set to 0) and another interface is active, connecting to a TSP-enabled remote instrument results in a connection. However, the instrument will not respond to subsequent reads or executes because control of the instrument is not obtained until an abort command has been sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14086.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.abortonconnect = 0
--- 
--- --Configure the instrument so that it does not send an abort command when connecting to a TSP-enabled instrument.
--- ```
tspnet.tsp.abortonconnect = 0



--- **This function copies a reading buffer synchronous table from a remote instrument to a TSP-enabled instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is only appropriate for TSP-enabled instruments.This function reads the data from a reading buffer on a remote instrument and returns an array of numbers or a string representing the data. The startIndex and endIndex parameters specify the portion of the reading buffer to read. If no index is specified, the entire buffer is copied. The function returns a table if the table is an array of numbers; otherwise a comma-delimited string is returned.This command is limited to transferring 50,000 readings at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14090.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.timeout = 5
--- -- change the IP address in the following command
--- ID = tspnet.connect("134.63.79.7")
--- tspnet.write(ID, "login admin\r\n")
--- print(tspnet.read(ID))
--- tspnet.write(ID, "*idn?\r\n")
--- print(tspnet.read(ID))
--- print(eventlog.next())
--- times =
---    tspnet.tsp.rbtablecopy(ID,
---    "defbuffer1.timestamps", 1, 3)
--- print(times)
--- tspnet.disconnect(ID)
--- 
--- --Connect to another TSP-Net enabled instrument. Copy the specified timestamps table for items 1 through 3, then display the table. Example output:
--- --SUCCESS: Logged in
--- --KEITHLEY INSTRUMENTS,MODEL DMM7510,04089762,1.6.3d
--- --0	No error	0	0	0	0
--- --05/19/2017 13:10:43.948592060,05/19/2017 13:10:44.017861380,05/19/2017 13:10:44.087080980
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
--- This function is appropriate only for TSP-enabled instruments.This function downloads a script to a remote instrument and runs it. It automatically adds the appropriate loadscript and endscript commands around the script, captures any errors, and reads back any prompts. No additional substitutions are done on the text.The script is automatically loaded, compiled, and run.Any output from previous commands is discarded.This command does not wait for the script to complete.If you do not want the script to do anything immediately, make sure the script only defines functions for later use. Use the tspnet.execute() function to execute those functions later.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32684.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tspnet.tsp.runscript(myConnection, "myTest",
--- "print([[start]]) for d = 1, 10 do print([[work]]) end print([[end]])")
--- 
--- --Load and run a script entitled myTest on the TSP-enabled instrument connected with myConnection.
--- ```
---@param connectionID tspnetConnectionID Integer value used as an identifier for other tspnet commands
---@param name string The name that is assigned to the script
---@param script string The body of the script as a string
function tspnet.tsp.runscript(connectionID, name, script) end
---@class triggerblenderArr
local triggerblenderArr = {}

---@type triggerblenderArr[]
trigger.blender = {}




--- **This function clears the blender event detector and resets the overrun indicator of blender N.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the blender event detector to the undetected state and resets the overrun indicator of the event detector.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15785.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15787.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates if an event was ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector that is built into the event blender itself.This command does not indicate if an overrun occurred in any other part of the trigger model or in any other trigger object that is monitoring the event. It also is not an indication of an action overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15788.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.blender[1].overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If an event was not ignored, the output is false.
--- ```
triggerblenderArr.overrun= 0



--- **This function resets some of the trigger blender settings to their factory defaults.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger.blender[N].reset() function resets the following attributes to their factory defaults:It also clears trigger.blender[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/17666.htm"])
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
--- There are four stimulus inputs that can each select a different event.Use none to disable the blender input.The event parameter may be any of the trigger events shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34428.htm"])
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



--- **This function waits for a blender trigger event to occur.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits for an event blender trigger event. If one or more trigger events were detected since the last time trigger.blender[N].wait() or trigger.blender[N].clear() was called, this function returns immediately.After detecting a trigger with this function, the event detector automatically resets and rearms. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35118.htm"])
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

---@class triggertimerArr
local triggertimerArr = {}

---@type triggertimerArr[]
trigger.timer = {}




--- **This function clears the timer event detector and overrun indicator for the specified trigger timer number.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets the timer event detector to the undetected state and resets the overrun indicator.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15793.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15794.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15795.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15800.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15820.htm"])
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


trigger.ON = nil
trigger.OFF = nil

---@alias triggertimerenablestate
---|`trigger.ON`
---|`trigger.OFF`



--- **This attribute enables the trigger timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the timer performs the delay operation.When this command is set to off, there is no timer on the delay operation.You must enable a timer before it can use the delay settings or the alarm configuration. For expected results from the timer, it is best to disable the timer before changing a timer setting, such as delay or start seconds.To use the timer as a simple delay or pulse generator with digital I/O lines, make sure the timer start time in seconds and fractional seconds is configured for a time in the past. To use the timer as an alarm, configure the timer start time in seconds and fractional seconds for the desired alarm time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30576.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31076.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/16068.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_THERMOCOUPLE
--- dmm.measure.unit = dmm.UNIT_CELSIUS
--- dmm.measure.simreftemperature = 30
--- 
--- --Sets 30 degrees Celsius as the simulated reference temperature for thermocouples.
--- ```
dmm.measure.simreftemperature = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31441.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31457.htm"])
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
--- Set this command to the type of measurement you want to make.Reading this command returns the measure function that is presently active.When you select a function, settings for other commands that are related to the function become active. For example, assume that:If you return to the current function, the math function returns to reciprocal. If you then switch from the current function to the voltage function, the math function returns to percent. All attributes that begin with dmm.measure. are saved with the active measure function unless otherwise indicated in the command description.If a digitize measurement function is active, calling this command returns dmm.FUNC_NONE. The no function setting is automatically made if you select a function with dmm.digitize.func or through the options from the front-panel Digitize Functions tab.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40942.htm"])
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
--- ```
dmm.measure.func = 0



--- **This function makes measurements, places them in a reading buffer, and returns the last reading.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates measurements using the present function setting, stores the readings in a reading buffer, and returns the last reading.The dmm.measure.count attribute determines how many measurements are made.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40948.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- voltMeasBuffer = buffer.make(10000)
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- print(dmm.measure.read(voltMeasBuffer))
--- 
--- --Create a buffer named voltMeasBuffer. Set the instrument to measure voltage.
--- --Make a measurement that is stored in the voltMeasBuffer and is also printed.
--- ```
---@return any reading The last reading of the measurement process
---@param bufferName any The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is defined, it defaults to defbuffer1
---@overload fun():any
function dmm.measure.read(bufferName) end

dmm.DIGITS_4_5 = nil
dmm.DIGITS_6_5 = nil
dmm.DIGITS_7_5 = nil
dmm.DIGITS_5_5 = nil
dmm.DIGITS_3_5 = nil

---@alias dmmmeasuredisplaydigitsvalue
---|`dmm.DIGITS_4_5`
---|`dmm.DIGITS_6_5`
---|`dmm.DIGITS_7_5`
---|`dmm.DIGITS_5_5`
---|`dmm.DIGITS_3_5`



--- **This attribute determines the number of digits that are displayed for measurements on the front panel.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41099.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.displaydigits = dmm.DIGITS_5_5
--- 
--- --Set the measurement function to voltage with a front-panel display resolution of 5½.
--- ```
---@type dmmmeasuredisplaydigitsvalue
dmm.measure.displaydigits = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureautorangestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if the measurement range is set manually or automatically for the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines how the range is selected.When this command is set to off, you must set the range. If you do not set the range, the instrument remains at the range that was last selected by autorange.When this command is set to on, the instrument automatically goes to the most sensitive range to perform the measurement.If a range is manually selected through the front panel or a remote command, this command is automatically set to off.Autorange selects the best range in which to measure the signal that is applied to the input terminals of the instrument. When autorange is enabled, the range increases at 120 percent of range. The range decreases occur when the reading is <10 percent of nominal range. For example, if you are on the 1 V range and autorange is enabled, the instrument autoranges up to the 10 V range when the measurement exceeds 1.2 V. It autoranges down to the 100 mV range when the measurement falls below 1 V.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41117.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.autorange = dmm.ON
--- 
--- --Select the measurement function to be DC voltage. Set autorange on.
--- ```
---@type dmmmeasureautorangestate
dmm.measure.autorange = 0



--- **This function determines the aperture setting for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The aperture sets the amount of time the ADC takes when making a measurement, which is the integration period for the selected measurement function. The integration period is specified in seconds. In general, a short integration period provides a fast reading rate, while a long integration period provides better accuracy. The selected integration period is a compromise between speed and accuracy.During the integration period, if an external trigger with a count of 1 is sent, the trigger is ignored. If the count is set to more than 1, the first reading is initialized by this trigger. Subsequent readings occur as rapidly as the instrument can make them. If a trigger occurs during the group measurement, the trigger is latched and another group of measurements with the same count will be triggered after the current group completes.You can also set the integration rate by setting the number of power-line cycles (NPLCs). Changing the NPLC value changes the aperture time and changing the aperture time changes the NPLC value.To calculate the aperture based on the NPLC value, use the following formula.where:If you set the NPLCs, the aperture setting changes to reflect that value. If you set the aperture, the NPLC setting is changed.For the AC voltage and AC current functions, if the detector bandwidth setting is set to 3 Hz or 30 Hz, the aperture value is fixed and cannot be changed.If line synchronization is enabled, the integration period does not start until the beginning of the next power-line cycle. For example, if a reading is triggered at the positive peak of a power-line cycle, the integration period does not start until that power-line cycle is completed. The integration period starts when the positive-going sine wave crosses 0 volts.To see the line frequency that is auto-detected by the instrument, use the localnode.linefreq command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41141.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.aperture = 0.0035
--- 
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41144.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.unit = dmm.UNIT_DB
--- dmm.measure.dbreference = 5
--- 
--- --Sets the units to decibel and sets the dB reference to 5 for DC volts.
--- ```
dmm.measure.dbreference = 0


dmm.DETECTBW_300HZ = nil
dmm.DETECTBW_30HZ = nil
dmm.DETECTBW_3HZ = nil

---@alias dmmmeasuredetectorbandwidthvalue
---|`dmm.DETECTBW_300HZ`
---|`dmm.DETECTBW_30HZ`
---|`dmm.DETECTBW_3HZ`



--- **This attribute selects the detector bandwidth for AC current and AC voltage measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can set the detector bandwidth to improve measurement accuracy. Select the bandwidth that contains the lowest frequency component of the input signal. For example, if the lowest frequency component of your input signal is 40 Hz, use a bandwidth setting of 30 Hz.If the bandwidth is set to 3 Hz or 30 Hz, the autozero feature is always enabled and the integration unit is set to Sampling. In addition, the Sampling Time is displayed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41147.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_AC_CURRENT
--- dmm.measure.detectorbandwidth = dmm.DETECTBW_3HZ
--- 
--- --Set the measure function to AC current.
--- --Set the bandwidth to 3 Hz.
--- ```
---@type dmmmeasuredetectorbandwidthvalue
dmm.measure.detectorbandwidth = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasuredrycircuitstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the dry circuit feature of the 4-wire resistance measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Enabling dry circuit limits the open-circuit voltage to below 20 mV, which is often required with low-glitch measurements, such as measuring switch and relay contact resistance.When dry circuit is enabled, offset compensation is automatically enabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41155.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_4W_RESISTANCE
--- dmm.measure.drycircuit = dmm.ON
--- 
--- --Set the measure function to 4-wire resistance and enable dry circuit.
--- ```
---@type dmmmeasuredrycircuitstate
dmm.measure.drycircuit = 0


dmm.RTD_D100 = nil
dmm.RTD_USER = nil
dmm.RTD_PT3916 = nil
dmm.RTD_PT100 = nil
dmm.RTD_PT385 = nil
dmm.RTD_F100 = nil

---@alias dmmmeasurefourrtdRTDType
---|`dmm.RTD_D100`
---|`dmm.RTD_USER`
---|`dmm.RTD_PT3916`
---|`dmm.RTD_PT100`
---|`dmm.RTD_PT385`
---|`dmm.RTD_F100`



--- **This attribute defines the type of 4-wire RTD that is being used**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type must be set to temperature and the transducer must be set to 4-wire RTD before you can set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41175.htm"])
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
--- ```
---@type dmmmeasurefourrtdRTDType
dmm.measure.fourrtd = 0


dmm.RTD_D100 = 3
dmm.RTD_USER = nil
dmm.RTD_PT3916 = nil
dmm.RTD_PT100 = nil
dmm.RTD_PT385 = nil
dmm.RTD_F100 = nil

---@alias dmmmeasurethreertdvalue
---|`dmm.RTD_D100`
---|`dmm.RTD_USER`
---|`dmm.RTD_PT3916`
---|`dmm.RTD_PT100`
---|`dmm.RTD_PT385`
---|`dmm.RTD_F100`



--- **This attribute defines the type of three-wire RTD that is being used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type must be set to temperature and the transducer must be set to 3-wire RTD before you can set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41176.htm"])
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
--- ```
---@type dmmmeasurethreertdvalue
dmm.measure.threertd = 0


dmm.TRANS_THREERTD = nil
dmm.TRANS_THERMOCOUPLE = nil
dmm.TRANS_FOURRTD = nil
dmm.TRANS_THERMISTOR = nil

---@alias dmmmeasuretransducertype
---|`dmm.TRANS_THREERTD`
---|`dmm.TRANS_THERMOCOUPLE`
---|`dmm.TRANS_FOURRTD`
---|`dmm.TRANS_THERMISTOR`



--- **This attribute sets the transducer type for the temperature measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The transducer type determines the type of temperature measurement that is made. Each transducer type has related settings that must also be set. For example, thermocouple measurements are only made if the type is set is set to thermocouple. You also need to set the thermocouple type when setting up a thermocouple. For the RTD transducer types, you also set the RTD type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41181.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41182.htm"])
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
--- ```
dmm.measure.rtdalpha = 0



--- **This attribute contains the beta value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41186.htm"])
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
--- ```
dmm.measure.rtdbeta = 0



--- **This attribute contains the delta value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41188.htm"])
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
--- ```
dmm.measure.rtddelta = 0



--- **This attribute contains the zero value of a user-defined RTD.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is only valid when:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41191.htm"])
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
--- ```
dmm.measure.rtdzero = 0


dmm.THERM_2252 = nil
dmm.THERM_10000 = nil
dmm.THERM_5000 = nil

---@alias dmmmeasurethermistorvalue
---|`dmm.THERM_2252`
---|`dmm.THERM_10000`
---|`dmm.THERM_5000`



--- **This attribute describes the type of thermistor.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only applicable when the transducer type is set to thermistor.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41192.htm"])
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
--- ```
---@type dmmmeasurethermistorvalue
dmm.measure.thermistor = 0


dmm.THERMOCOUPLE_J = nil
dmm.THERMOCOUPLE_R = nil
dmm.THERMOCOUPLE_B = nil
dmm.THERMOCOUPLE_N = nil
dmm.THERMOCOUPLE_E = nil
dmm.THERMOCOUPLE_S = nil
dmm.THERMOCOUPLE_K = nil
dmm.THERMOCOUPLE_T = nil

---@alias dmmmeasurethermocouplevalue
---|`dmm.THERMOCOUPLE_J`
---|`dmm.THERMOCOUPLE_R`
---|`dmm.THERMOCOUPLE_B`
---|`dmm.THERMOCOUPLE_N`
---|`dmm.THERMOCOUPLE_E`
---|`dmm.THERMOCOUPLE_S`
---|`dmm.THERMOCOUPLE_K`
---|`dmm.THERMOCOUPLE_T`



--- **This attribute indicates the thermocouple type.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only applicable when the transducer type is set to thermocouple.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41197.htm"])
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
--- ```
---@type dmmmeasurethermocouplevalue
dmm.measure.thermocouple = 0


dmm.REFJUNCTION_EXTERNAL = nil
dmm.REFJUNCTION_INTERNAL = nil
dmm.REFJUNCTION_SIMULATED = nil

---@alias dmmmeasurerefjunctionstate
---|`dmm.REFJUNCTION_EXTERNAL`
---|`dmm.REFJUNCTION_INTERNAL`
---|`dmm.REFJUNCTION_SIMULATED`



--- **This attribute defines the type of the thermocouple reference junction.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41198.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = "temperature"
--- dmm.transducer = dmm.TEMP_THERMOCOUPLE
--- dmm.refjunction = dmm.REF_JUNCTION_SIMULATED
--- 
--- --Describe
--- ```
---@type dmmmeasurerefjunctionstate
dmm.measure.refjunction = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureinputdividerstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the 10 MW input divider.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41202.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
---@type dmmmeasureinputdividerstate
dmm.measure.inputdivider = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasurelinesyncstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if line synchronization is used during the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When line synchronization is enabled, measurements are initiated at the first positive-going zero crossing of the power line cycle after the trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41233.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.linesync = dmm.ON
--- 
--- --Set line synchronization on for DC current measurements.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41296.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.count = 10
--- dmm.measure.read()
--- 
--- --Set the instrument to make 10 measurements.
--- --Request 10 measurements.
--- ```
dmm.measure.count = 0



--- **This command sets the time that the input signal is measured for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the amount of time that the input signal is measured.The amount of time is specified as the number of power line cycles (NPLCs). Each PLC for 60 Hz is 16.67 ms (1/60) and each PLC for 50 Hz is 20 ms (1/50). For 60 Hz, if you set the NPLC to 0.1, the measure time is 1.667 ms.The shortest amount of time results in the fastest reading rate but increases the reading noise and decreases the number of usable digits.The longest amount of time provides the lowest reading noise and more usable digits but has the slowest reading rate.Settings between the fastest and slowest number of power line cycles are a compromise between speed and noise.If you change the PLCs, you may want to adjust the displayed digits to reflect the change in usable digits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41301.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.nplc = 0.5
--- 
--- --Sets the measurement function to DC voltage. Set the NPLC value to 0.5.
--- ```
dmm.measure.nplc = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureopendetectorstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if the detection of open leads is enabled or disabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For temperature measurements, this is only available when the transducer is set to a thermocouple or one of the RTDs.Long lengths of thermocouple wire can have a large amount of capacitance, which is seen at the input of the DMM. If an intermittent open occurs in the thermocouple circuit, the capacitance can cause an erroneous on-scale reading. The open thermocouple detection circuit, when enabled, applies a 100 µA pulse of current to the thermocouple before the start of each temperature measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41303.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41304.htm"])
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
--- ```
dmm.measure.range = 0


dmm.UNIT_KELVIN = nil
dmm.UNIT_FAHRENHEIT = nil
dmm.UNIT_CELSIUS = nil
dmm.UNIT_DBM = nil
dmm.UNIT_VOLT = nil
dmm.UNIT_DB = nil

---@alias dmmmeasureunitvalue
---|`dmm.UNIT_KELVIN`
---|`dmm.UNIT_FAHRENHEIT`
---|`dmm.UNIT_CELSIUS`
---|`dmm.UNIT_DBM`
---|`dmm.UNIT_VOLT`
---|`dmm.UNIT_DB`



--- **This attribute sets the units of measurement that are displayed on the front panel of the instrument and stored in the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change in measurement units is displayed when the next measurement is made. You can only change the units for the listed functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41308.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.unit = dmm.UNIT_DB
--- 
--- --Changes the front-panel display and buffer readings for voltage measurements to be displayed as decibel readings.
--- ```
---@type dmmmeasureunitvalue
dmm.measure.unit = 0


dmm.DELAY_OFF = nil
dmm.DELAY_ON = nil

---@alias dmmmeasureautodelayvalue
---|`dmm.DELAY_OFF`
---|`dmm.DELAY_ON`



--- **This attribute enables or disables the automatic delay that occurs before each measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is enabled, a delay is added after a range or function change to allow the instrument to settle.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41421.htm"])
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
--- ```
---@type dmmmeasureautodelayvalue
dmm.measure.autodelay = 0


dmm.IMPEDANCE_AUTO = nil
dmm.IMPEDANCE_10M = nil

---@alias dmmmeasureinputimpedancesetting
---|`dmm.IMPEDANCE_AUTO`
---|`dmm.IMPEDANCE_10M`



--- **This attribute determines when the 10 MΩ input divider is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Choosing automatic input impedance is a balance between achieving low DC voltage noise on the 100 mV and 1 V ranges and optimizing measurement noise due to charge injection. The DMM7510 is optimized for low noise and charge injection when the DUT has less than 100 kΩ input resistance. When the DUT input impedance is more than 100 kΩ, selecting an input impedance of 10 MΩ optimizes the measurement for lowest noise on the 100 mV and 1 V ranges. You can achieve short-term low noise and low charge injection on the 100 mV and 1 V ranges with autozero off. For the 10 V to 1000 V ranges, both input impedance settings achieve low charge injection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/44539.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.inputimpedance = dmm.IMPEDANCE_AUTO
--- 
--- --Set input impedance to be set automatically when the DC voltage function is selected.
--- ```
---@type dmmmeasureinputimpedancesetting
dmm.measure.inputimpedance = 0



--- **This attribute defines the decibel-milliwatts (dBm) reference.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This value only applied when the unit setting for the function is set to dBm.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/81432.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.unit = dmm.UNIT_DBM
--- dmm.measure.dbmreference = 85
--- 
--- --Sets the units to dBm and sets the dBm reference to 85 Ω.
--- ```
dmm.measure.dbmreference = 0



--- **This function returns the setting for a function attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The options for function are shown in the following table.You can retrieve one attribute at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/91266.htm"])
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
--- The lists that follow the example and "also see" listings show the parameters that are available for each function. Each parameter includes a link to the descriptions of the corresponding TSP command descriptions. The options for each parameter are the same as the settings for the TSP commands.Aperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZEROdB reference: dmm.ATTR_MEAS_DB_REFERENCEdBm reference: dmm.ATTR_MEAS_DBM_REFERENCEDisplay digits: dmm.ATTR_MEAS_DIGITSInput impedance: dmm.ATTR_MEAS_INPUT_IMPEDANCELine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZEROdB reference: dmm.ATTR_MEAS_DB_REFERENCEdBm reference: dmm.ATTR_MEAS_DBM_REFERENCEDetector bandwidth: dmm.ATTR_MEAS_DETECTBWDisplay digits: dmm.ATTR_MEAS_DIGITSNPLC: dmm.ATTR_MEAS_NPLCMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODetector bandwidth: dmm.ATTR_MEAS_DETECTBWDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_N3-wire RTD type: dmm.ATTR_MEAS_THREE_RTD4-wire RTD type: dmm.ATTR_MEAS_FOUR_RTDAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCOffset Compensation: dmm.ATTR_MEAS_OFFCOMP_ENABLEOpen lead detector: dmm.ATTR_MEAS_OPEN_DETECTORRTD Alpha: dmm.ATTR_MEAS_RTD_ALPHARTD Beta: dmm.ATTR_MEAS_RTD_BETARTD Delta: dmm.ATTR_MEAS_RTD_DELTARTD Zero: dmm.ATTR_MEAS_RTD_ZEROSimulated reference temperature: dmm.ATTR_MEAS_SIM_REF_TEMPThermistor: dmm.ATTR_MEAS_THERMISTORThermocouple: dmm.ATTR_MEAS_THERMOCOUPLETransducer: dmm.ATTR_MEAS_TRANSDUCERUnit: dmm.ATTR_MEAS_UNITUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSDry circuit: dmm.ATTR_MEAS_DRY_CIRCUITLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCOffset compensation: dmm.ATTR_MEAS_OFFCOMP_ENABLEOpen lead detector: dmm.ATTR_MEAS_OPEN_DETECTORRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto zero: dmm.ATTR_MEAS_AUTO_ZEROBias level: dmm.ATTR_MEAS_BIAS_LEVELDisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTODisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTRange: dmm.ATTR_MEAS_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAuto delay: dmm.ATTR_MEAS_AUTO_DELAYDisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYDisplay digits: dmm.ATTR_MEAS_DIGITSMeasure count: dmm.ATTR_MEAS_COUNTThreshold autorange: dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTOThreshold level: dmm.ATTR_MEAS_THRESHOLD_LEVELThreshold range: dmm.ATTR_MEAS_THRESHOLD_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYMeasure count: dmm.ATTR_MEAS_COUNTThreshold autorange: dmm.ATTR_MEAS_THRESHOLD_RANGE_AUTOThreshold level: dmm.ATTR_MEAS_THRESHOLD_LEVELThreshold range: dmm.ATTR_MEAS_THRESHOLD_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAperture: dmm.ATTR_MEAS_APERTUREAuto delay: dmm.ATTR_MEAS_AUTO_DELAYAuto range: dmm.ATTR_MEAS_RANGE_AUTOAuto zero: dmm.ATTR_MEAS_AUTO_ZERODisplay digits: dmm.ATTR_MEAS_DIGITSLine sync: dmm.ATTR_MEAS_LINE_SYNCMeasure count: dmm.ATTR_MEAS_COUNTNPLC: dmm.ATTR_MEAS_NPLCRange: dmm.ATTR_MEAS_RANGESense auto range: dmm.ATTR_MEAS_SENSE_RANGE_AUTOSense range: dmm.ATTR_MEAS_SENSE_RANGEUser delay N (where N is 1 to 5): dmm.ATTR_MEAS_USER_DELAY_NAC coupling filter: dmm.ATTR_DIGI_COUPLING_AC_FILTERAC coupling frequency: dmm.ATTR_DIGI_COUPLING_AC_FREQUENCYAperture: dmm.ATTR_DIGI_APERTURECount: dmm.ATTR_DIGI_COUNTDisplay digits: dmm.ATTR_DIGI_DIGITSRange: dmm.ATTR_DIGI_RANGESample rate: dmm.ATTR_DIGI_SAMPLE_RATESignal coupling type: dmm.ATTR_DIGI_COUPLING_TYPEUnit: dmm.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): dmm.ATTR_DIGI_USER_DELAY_NAperture: dmm.ATTR_DIGI_APERTURECount: dmm.ATTR_DIGI_COUNTDecibel reference: dmm.ATTR_DIGI_DB_REFERENCEDecibel-milliwatts reference: dmm.ATTR_DIGI_DBM_REFERENCEDisplay digits: dmm.ATTR_DIGI_DIGITSInput impedance: dmm.ATTR_DIGI_INPUT_IMPEDANCERange: dmm.ATTR_DIGI_RANGERelative enable: dmm.ATTR_DIGI_REL_ENABLERelative level: dmm.ATTR_DIGI_REL_LEVELSample rate: dmm.ATTR_DIGI_SAMPLE_RATEUnit: dmm.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): dmm.ATTR_DIGI_USER_DELAY_NEnable math: dmm.ATTR_MEAS_MATH_ENABLEb (offset) value: dmm.ATTR_MEAS_MATH_MXB_BFm (scalar) value: dmm.ATTR_MEAS_MATH_MXB_MFMath format: dmm.ATTR_MEAS_MATH_FORMATPercent: dmm.ATTR_MEAS_MATH_PERCENTEnable math: dmm.ATTR_DIGI_MATH_ENABLEb (offset) value: dmm.ATTR_DIGI_MATH_MXB_BFm (scalar) value: dmm.ATTR_DIGI_MATH_MXB_MFMath format: dmm.ATTR_DIGI_MATH_FORMATPercent: dmm.ATTR_DIGI_MATH_PERCENTLimit 1 audible: dmm.ATTR_MEAS_LIMIT_AUDIBLE_1Limit 1 auto clear: dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_1Limit 1 enable: dmm.ATTR_MEAS_LIMIT_ENABLE_1Limit 1 fail: dmm.ATTR_MEAS_LIMIT_FAIL_1Limit 1 high value: dmm.ATTR_MEAS_LIMIT_HIGH_1Limit 1 low value: dmm.ATTR_MEAS_LIMIT_LOW_1Limit 2 audible: dmm.ATTR_MEAS_LIMIT_AUDIBLE_2Limit 2 auto clear: dmm.ATTR_MEAS_LIMIT_AUTO_CLEAR_2Limit 2 enable: dmm.ATTR_MEAS_LIMIT_ENABLE_2Limit 2 fail: dmm.ATTR_MEAS_LIMIT_FAIL_2Limit 2 high value: dmm.ATTR_MEAS_LIMIT_HIGH_2Limit 2 low value: dmm.ATTR_MEAS_LIMIT_LOW_2Limit 1 audible: dmm.ATTR_DIGI_LIMIT_AUDIBLE_1Limit 1 auto clear: dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_1Limit 1 enable: dmm.ATTR_DIGI_LIMIT_ENABLE_1Limit 1 fail: dmm.ATTR_DIGI_LIMIT_FAIL_1Limit 1 high value: dmm.ATTR_DIGI_LIMIT_HIGH_1Limit 1 low value: dmm.ATTR_DIGI_LIMIT_LOW_1Limit 2 audible: dmm.ATTR_DIGI_LIMIT_AUDIBLE_2Limit 2 auto clear: dmm.ATTR_DIGI_LIMIT_AUTO_CLEAR_2Limit 2 enable: dmm.ATTR_DIGI_LIMIT_ENABLE_2Limit 2 fail: dmm.ATTR_DIGI_LIMIT_FAIL_2Limit 2 high value: dmm.ATTR_DIGI_LIMIT_HIGH_2Limit 2 low value: dmm.ATTR_DIGI_LIMIT_LOW_2Edge level: dmm.ATTR_MEAS_ATRIG_EDGE_LEVELEdge slope: dmm.ATTR_MEAS_ATRIG_EDGE_SLOPEHigh-frequency rejection: dmm.ATTR_MEAS_ATRIG_HFREJECTMode: dmm.ATTR_DIGI_ATRIG_MODEPulse condition: dmm.ATTR_MEAS_ATRIG_PULSE_CONDITIONPulse level: dmm.ATTR_MEAS_ATRIG_PULSE_LEVELPulse polarity: dmm.ATTR_MEAS_ATRIG_PULSE_POLARITYPulse width: dmm.ATTR_MEAS_ATRIG_PULSE_WIDTHWindow direction: dmm.ATTR_MEAS_ATRIG_WINDOW_DIRECTIONWindow level high: dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_HIGHWindow level low: dmm.ATTR_MEAS_ATRIG_WINDOW_LEVEL_LOWEdge level: dmm.ATTR_DIGI_ATRIG_EDGE_LEVELEdge slope: dmm.ATTR_DIGI_ATRIG_EDGE_SLOPEHigh-frequency rejection: dmm.ATTR_DIGI_ATRIG_HFREJECTMode: dmm.ATTR_DIGI_ATRIG_MODEPulse condition: dmm.ATTR_DIGI_ATRIG_PULSE_CONDITIONPulse level: dmm.ATTR_DIGI_ATRIG_PULSE_LEVELPulse polarity: dmm.ATTR_DIGI_ATRIG_PULSE_POLARITYPulse width: dmm.ATTR_DIGI_ATRIG_PULSE_WIDTHWindow direction: dmm.ATTR_DIGI_ATRIG_WINDOW_DIRECTIONWindow level high: dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_HIGHWindow level low: dmm.ATTR_DIGI_ATRIG_WINDOW_LEVEL_LOWFilter enable: dmm.ATTR_MEAS_FILTER_ENABLEFilter count: dmm.ATTR_MEAS_FILTER_COUNTFilter type: dmm.ATTR_MEAS_FILTER_TYPEFilter window: dmm.ATTR_MEAS_FILTER_WINDOWRelative offset enable: dmm.ATTR_MEAS_REL_ENABLERelative offset method (DCV ratio measurements only): dmm.ATTR_MEAS_REL_METHODRelative offset value: dmm.ATTR_MEAS_REL_LEVELRelative offset enable: dmm.ATTR_DIGI_REL_ENABLERelative offset value: dmm.ATTR_DIGI_REL_LEVEL
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/91267.htm"])
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




--- **This function stops all trigger model commands on the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When this command is received, the instrument stops the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25628.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.abort()
--- 
--- --Terminates all commands related to the trigger model on the instrument.
--- ```
function trigger.model.abort() end

trigger.STATE_IDLE = nil
trigger.STATE_ABORTED = nil
trigger.STATE_WAITING = nil
trigger.STATE_BUILDING = nil
trigger.STATE_RUNNING = nil
trigger.STATE_PAUSED = nil
trigger.STATE_FAILED = nil
trigger.STATE_EMPTY = nil
trigger.STATE_ABORTING = nil

---@alias triggermodelstatestatus
---|`trigger.STATE_IDLE`
---|`trigger.STATE_ABORTED`
---|`trigger.STATE_WAITING`
---|`trigger.STATE_BUILDING`
---|`trigger.STATE_RUNNING`
---|`trigger.STATE_PAUSED`
---|`trigger.STATE_FAILED`
---|`trigger.STATE_EMPTY`
---|`trigger.STATE_ABORTING`



--- **This function returns the present state of the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command returns the state of the trigger model. The instrument checks the state of a started trigger model every 100 ms.This command returns the trigger state and the block that the trigger model last executed.The trigger model states are:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25741.htm"])
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
function trigger.model.state() end


--- **This function returns the settings for all trigger model blocks.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This returns the settings for the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30569.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30570.htm"])
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


--- **This function starts the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30571.htm"])
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
--- When you load this trigger-model template, you can specify amount of time to make a measurement and the length of the delay before the measurement.The out line of the EXT TRIG IN/OUT rear-panel terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30588.htm"])
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
--- This trigger-model template incorporates a configuration list. You must set up the configuration lists before loading the trigger model. If the configuration lists change, you must resend this command.You can also set a delay and change the reading buffer.The out line of the EXT TRIG IN/OUT rear-panel terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35126.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35127.htm"])
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

trigger.CLEAR_NEVER = nil
trigger.CLEAR_ENTER = nil

---@alias triggermodelloadLogicTriggerclear
---|`trigger.CLEAR_NEVER`
---|`trigger.CLEAR_ENTER`



--- **This function loads a trigger-model template configuration that sets up a logic trigger through the digital or external I/O.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger model waits for a digital input or external trigger input event to occur, makes a measurement, and issues a notify event. If a digital output line is selected, a notify event asserts a digital output line. A notify event asserts the external trigger output line regardless of the line settings. You can set the line to 7 to assert only the external trigger output line, or to another setting to assert both a digital output line and the external trigger output line.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.This command replaces the trigger.model.load() — ExtDigTrigger command, which is deprecated.The following usage has been deprecated; replace it with the usage above that includes the clear parameter.trigger.model.load("LogicTrigger", digInLine, digOutLine, count)trigger.model.load("LogicTrigger", digInLine, digOutLine, count, delay)trigger.model.load("LogicTrigger", digInLine, digOutLine, count, delay, bufferName)trigger.model.load("LogicTrigger", digInLine, digOutLine, count, delay, bufferName, readingBlock)
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35128.htm"])
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


--- **This function loads a predefined trigger model configuration.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets up a loop that sets a delay, makes a measurement, and then repeats the loop the number of times you defined in the count parameter.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/35129.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- --set up measure function
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.terminals = smu.TERMINALS_REAR
--- smu.measure.autorange = smu.ON
--- smu.measure.nplc = 1
---  
--- --set up source function
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.ilimit.level = 0.1
--- smu.source.level = 20
--- smu.source.delay = 0.1
--- smu.source.highc = smu.OFF
---  
--- --turn on output and initiate readings
--- smu.source.output = smu.ON
--- trigger.model.load("SimpleLoop", 200)
--- trigger.model.initiate()
--- waitcomplete()
---  
--- --Parse index and data into three columns
--- print("Rdg #", "Time (s)", "Current (A)")
--- for i = 1, defbuffer1.n do
---       print(i, defbuffer1.relativetimestamps[i], defbuffer1[i])
--- end
---  
--- --Discharge the capacitor to 0 V and turn off the output
--- smu.source.level = 0
--- delay(2)
--- smu.source.output = smu.OFF
--- 
--- --This example uses the Simple Loop trigger model template to do a capacitor test. This example produces 200 readings that have output similar to the following example:
--- --Rdg #	Time (s)	Current (A)
--- --1	0             8.5718931952528e-11
--- --2	0.151875      1.6215984111057e-10
--- --3	0.303727      1.5521139928865e-10
--- --. . .
--- --198	29.91579194	1.5521250951167e-10
--- --199	30.067648716	1.4131290582142e-10
--- --200	30.219497716	1.5521067764368e-10
--- ```
---@overload fun()
---@overload fun()
function trigger.model.load(SimpleLoop, count, delay, bufferName) end


--- **This function loads a predefined trigger model configuration that uses a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger model template incorporates a configuration list.You must set up the configuration lists before loading the trigger model.You can also set a delay and change the reading buffer.The out line of the EXT TRIG IN/OUT rear‑panel terminal is asserted at the end of each measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46023.htm"])
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
--- --Load the configuration list trigger model, using the points in this configuration list.
--- --Start the trigger model.
--- --Wait for the trigger model to complete.
--- --Return the results from the reading buffer.
--- --Example output:
--- --9.9246953126e-07, 6.9921188254e-06, 3.8904102673e-05
--- ```
---@overload fun()
---@overload fun()
---@overload fun()
function trigger.model.load(ConfigList, measureConfigList, delay, bufferName, readingBlock) end


--- **This function loads a predefined trigger model configuration that makes continuous measurements for a specified amount of time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you load this predefined trigger model, you can specify amount of time to make a measurement and the length of the delay before the measurement.The out line of the EXT TRIG IN/OUT rear‑panel terminal is asserted at the end of each measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46033.htm"])
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
---@overload fun()
---@overload fun()
---@overload fun()
function trigger.model.load(DurationLoop, duration, delay, bufferName, readingBlock) end


--- **This function loads a trigger-model template configuration that makes a specific number of measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command sets up a loop that sets a delay, makes a measurement, and then repeats the loop the number of times you define in the Count parameter.The out line of the EXT TRIG IN/OUT rear-panel terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger-model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46034.htm"])
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


--- **This function loads a predefined trigger model configuration that sets up an external trigger through the digital I/O or external I/O line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger model waits for a digital input or external trigger input event to occur, makes a measurement, and issues a notify event. If a digital output line is selected, a notify event asserts a digital output line. A notify event asserts the external output line regardless of the line settings. You can set the line to 7 to assert only the external output line, or to another setting to assert both a digital output line and the external output line.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46037.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("ExtDigTrigger", 7, 2, 10, 0.001, defbuffer1)
--- 
--- --Set up the template to use the external in line and wait for a pulse from the external in to trigger measurements.
--- --Pulse digital out line 2 and external out when the measurement is complete.
--- --Make 10 measurements, with a delay of 1 ms before each measurement.
--- --Store the measurements in defbuffer1.
--- ```
---@overload fun()
---@overload fun()
---@overload fun()
function trigger.model.load(ExtDigTrigger, digInLine, digOutLine, count, delay, bufferName, readingBlock) end

trigger.CLEAR_NEVER = nil
trigger.CLEAR_ENTER = nil

---@alias triggermodelloadLoopUntilEventclear
---|`trigger.CLEAR_NEVER`
---|`trigger.CLEAR_ENTER`



--- **This function loads a trigger-model template configuration that makes continuous measurements until the specified event occurs.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event constant is the event that ends infinite triggering or ends readings set to occur before the trigger and start post-trigger readings. The trigger model makes readings until it detects the event constant. After the event, it makes a finite number of readings, based on the setting of the trigger position.The position marks the location in the reading buffer where the trigger will occur. The position is set as a percentage of the buffer capacity. The buffer captures measurements until a trigger occurs. When the trigger occurs, the buffer retains the percentage of readings specified by the position, then captures remaining readings until 100 percent of the buffer is filled. For example, if this is set to 75 for a reading buffer that holds 10,000 readings, the trigger model makes 2500 readings after it detects the source event. There are 7500 pre-trigger readings and 2500 post-trigger readings.The instrument makes two sets of readings. The first set is made until the trigger event occurs. The second set is made after the trigger event occurs, up to the number of readings calculated by the position parameter.You cannot have the event constant set at none when you run this trigger-model template.The out line of the EXT TRIG IN/OUT rear-panel terminal is asserted at the end of each measurement.The following table lists the options that are available for triggerEvent.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.The following usage has been deprecated; replace it with the usage above that includes the clear parameter.trigger.model.load("LoopUntilEvent", triggerEvent, position)trigger.model.load("LoopUntilEvent", triggerEvent, position, delay)trigger.model.load("LoopUntilEvent", triggerEvent, position, delay, bufferName)trigger.model.load("LoopUntilEvent", triggerEvent, position, delay, bufferName, readingBlock)
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46040.htm"])
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
--- This trigger-model template allows you to grade components and place them into up to four bins, based on the comparison to limits.To set a limit as unused, set the high value for the limit to be less than the low limit.All limit patterns and the pass pattern are sent on digital I/O lines 1 to 4, where 1 is the least significant bit.The out line of the EXT TRIG IN/OUT rear-panel terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.For a detailed example, see the DMM7510 User's Manual section “Grading and binning resistors.”
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46058.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- components
--- 
--- --The number of components to measure (1 to 268,435,455)
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
--- This trigger-model template allows you to sort components and place them into up to four bins, based on the comparison to limits.To set a limit as unused, set the high value for the limit to be less than the low limit.All limit patterns and the all fail pattern are sent on digital I/O lines 1 to 4, where 1 is the least significant bit.The out line of the EXT TRIG IN/OUT rear-panel terminal is asserted at the end of each measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.For a detailed example, see the section in the Model DMM7510 User’s Manual named “Grading and binning resistors.”
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46066.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- components
--- 
--- --The number of components to measure (1 to 268,435,455)
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

trigger.ON = nil
trigger.OFF = nil

---@alias triggermodelloadKeithley2001arm1Bypass
---|`trigger.ON`
---|`trigger.OFF`


trigger.ON = nil
trigger.OFF = nil

---@alias triggermodelloadKeithley2001arm2Bypass
---|`trigger.ON`
---|`trigger.OFF`


trigger.ON = nil
trigger.OFF = nil

---@alias triggermodelloadKeithley2001trigBypass
---|`trigger.ON`
---|`trigger.OFF`



--- **This function loads a trigger-model template configuration that emulates a Keithley Instruments 2001 trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the trigger layer is not bypassed, the external trigger in/out rear-panel terminal is asserted. The arm layers do not assert the external in/out terminal.You can use this template to emulate trigger models for products such as the Keithley Instruments Model 2000 and Model 2001 if you use only one of the arm layers. Set the other arm layers to a source of trigger.EVENT_NONE, a count of 1, and a delay of 0 to simulate the immediate trigger option of a Model 2001 trigger model.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.Refer to the application notes for the DMM7510 on the Keithley Instruments website for an example with additional detail about this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46073.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- No trigger event (immediate)
--- 
--- --trigger.EVENT_NONE
--- ```
---@param Keithley2001 any load function constant param
---@param arm1Bypass triggermodelloadKeithley2001arm1Bypass Bypass Arm 1
---@param arm1Source any The event that triggers Arm 1; see Details
---@param arm1Count any The number of times to repeat the Arm 1 layer
---@param arm2Bypass triggermodelloadKeithley2001arm2Bypass Bypass Arm 2
---@param arm2Source any The event that triggers Arm 2; see Details
---@param arm2Count any The number of times to repeat the Arm 2 layer
---@param arm2Delay any The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param trigBypass triggermodelloadKeithley2001trigBypass Bypass the trigger layer
---@param trigSource any The event that triggers the trigger layer; see Details
---@param trigCount any The number of times to repeat the trigger layer
---@param trigDelay any The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
function trigger.model.load(Keithley2001, arm1Bypass, arm1Source, arm1Count, arm2Bypass, arm2Source, arm2Count, arm2Delay, trigBypass, trigSource, trigCount, trigDelay) end


--- **This function pauses a running trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command pauses the trigger model.To continue the trigger model, send the resume command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/72471.htm"])
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


--- **This function continues a paused trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command continues running the trigger model operation if the trigger model was paused.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/73512.htm"])
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
local triggerlaninArr = {}

---@type triggerlaninArr[]
trigger.lanin = {}




--- **This attribute sets the trigger operation and detection mode of the specified LAN event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command controls how the trigger event detector and the output trigger generator operate on the given trigger. These settings are intended to provide behavior similar to the digital I/O triggers.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28111.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31397.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31398.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event.It also is not an indication of an output trigger overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31413.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.lanin[5].overrun
--- print(overrun)
--- 
--- --Checks the overrun status of a trigger on LAN5 and outputs the value, such as:
--- --false
--- ```
triggerlaninArr.overrun= 0

---@class triggerdigoutArr
local triggerdigoutArr = {}

---@type triggerdigoutArr[]
trigger.digout = {}




--- **This attribute selects the event that causes a trigger to be asserted on the digital output line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The digital trigger pulsewidth command determines how long the trigger is asserted.The trigger stimulus for a digital I/O line can be set to one of the trigger events that are described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30501.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[2].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[2].stimulus = trigger.EVENT_TIMER3
--- 
--- --Set the stimulus for output digital trigger line 2 to be the expiration of trigger timer 3.
--- ```
---@type eventID|0
triggerdigoutArr.stimulus= 0



--- **This attribute describes the length of time that the trigger line is asserted for output triggers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely. To release the trigger line, use trigger.digout[N].release().
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31385.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31392.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31395.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.line[4].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[4].release()
--- 
--- --Releases digital I/O trigger line 4.
--- ```
function triggerdigoutArr.release() end


trigger.LOGIC_POSITIVE = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggerdigoutlogiclogicType
---|`trigger.LOGIC_POSITIVE`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute sets the output logic of the trigger event generator to positive or negative for the specified line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the logic that the output trigger generator uses on the given trigger line.The output state of the digital I/O line is controlled by the trigger logic, and the user-specified output state of the line is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33159.htm"])
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

---@class status.operation
status.operation = {}




--- **This function requests the mapped set event and mapped clear event status for a bit in the Operation Event Registers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you query the mapping for a specific bit, the instrument returns the events that were mapped to set and clear that bit. Zero (0) indicates that the bits have not been set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30523.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31637.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute reads the operation event register of the status model.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31638.htm"])
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
status.operation.event = 0



--- **This attribute reads the Operation Event Register of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command reads the contents of the Operation Condition Register, which is one of the Operation Event Registers.For detail on interpreting the value of a register, see Understanding bit settings.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31639.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.operation.condition)
--- 
--- --Returns the contents of the register.
--- ```
status.operation.condition = 0



--- **This function allows you to map events to bits in the Operation Event Register.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can map events to bits in the event registers with this command. This allows you to cause bits in the condition and event registers to be set or cleared when the specified events occur. You can use any valid event number as the event that sets or clears bits.When a mapped event is programmed to set bits, the corresponding bits in both the condition register and event register are set when the event is detected.When a mapped event is programmed to clear bits, the bit in the condition register is set to 0 when the event is detected.If the event is set to zero (0), the bit is never set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31648.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This query reads the contents of the questionable status event register. After sending this command and addressing the instrument to talk, a value is sent to the computer. This value indicates which bits in the appropriate register are set.The Questionable Register can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set the Questionable Register to the sum of their decimal weights. For example, to set bits B12 and B13, set the Questionable Register to 12,288 (which is the sum of 4,096 + 8,192).
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30524.htm"])
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
status.questionable.event = 0



--- **This function maps events to bits in the questionable event registers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can map events to bits in the event registers with this command. This allows you to cause bits in the condition and event registers to be set or cleared when the specified events occur. You can use any valid event number as the event that sets or clears bits.When a mapped event is programmed to set bits, the corresponding bits in both the condition register and event register are set when the event is detected.When a mapped event is programmed to clear bits, the bit in the condition register is set to 0 when the event is detected.If the event is set to zero (0), the bit is never set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31612.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31613.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command reads the contents of the Questionable Condition Register, which is one of the Questionable Event Registers.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31614.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.questionable.condition)
--- 
--- --Reads the Questionable Condition Register.
--- ```
status.questionable.condition = 0



--- **This attribute sets or reads the contents of the questionable event enable register of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets or reads the contents of the Enable register of the Questionable Event Register.When one of these bits is set, when the corresponding bit in the Questionable Event Register or Questionable Condition Register is set, the MSB and QSM bits in the Status Byte Register are set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31615.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30525.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- When this command returns zero (0), no bits are set. You can send 0 to clear all bits.The instrument returns a decimal value that corresponds to the binary-weighted sum of all bits set in the register.Command errors include:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31653.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(status.standard.event)
--- 
--- --May return the value 129, showing that the Standard Event Status Register contains binary 10000001
--- ```
status.standard.event = 0

---@class digiolineArr
local digiolineArr = {}

---@type digiolineArr[]
digio.line = {}



digio.STATE_LOW = nil
digio.STATE_HIGH = nil

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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30982.htm"])
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


digio.MODE_DIGITAL_OPEN_DRAIN = nil
digio.MODE_SYNCHRONOUS_ACCEPTOR = nil
digio.MODE_DIGITAL_OUT = nil
digio.MODE_DIGITAL_IN = nil
digio.MODE_TRIGGER_IN = nil
digio.MODE_SYNCHRONOUS_MASTER = nil
digio.MODE_TRIGGER_OPEN_DRAIN = nil
digio.MODE_TRIGGER_OUT = nil

---@alias digiolinemodelineMode
---|`digio.MODE_DIGITAL_OPEN_DRAIN`
---|`digio.MODE_SYNCHRONOUS_ACCEPTOR`
---|`digio.MODE_DIGITAL_OUT`
---|`digio.MODE_DIGITAL_IN`
---|`digio.MODE_TRIGGER_IN`
---|`digio.MODE_SYNCHRONOUS_MASTER`
---|`digio.MODE_TRIGGER_OPEN_DRAIN`
---|`digio.MODE_TRIGGER_OUT`



--- **This attribute sets the mode of the digital I/O line to be a digital line, trigger line, or synchronous line and sets the line to be input, output, or open-drain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31363.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31393.htm"])
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
local triggerdiginArr = {}

---@type triggerdiginArr[]
trigger.digin = {}



trigger.EDGE_FALLING = nil
trigger.EDGE_RISING = nil
trigger.EDGE_EITHER = nil

---@alias triggerdiginedgedetectedEdge
---|`trigger.EDGE_FALLING`
---|`trigger.EDGE_RISING`
---|`trigger.EDGE_EITHER`



--- **This attribute sets the edge used by the trigger event detector on the given trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the logic on which the trigger event detector and the output trigger generator operate on the specified trigger line.To directly control the line state, set the mode of the line to digital and use the write command. When the digital line mode is set for open drain, the edge settings assert a TTL low-pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31360.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31373.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31378.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.digin[1].overrun
--- print(overrun)
--- 
--- --If there is no trigger overrun on digital input 1, the output is:
--- --false
--- ```
triggerdiginArr.overrun= 0



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses for up to timeout seconds for an input trigger. If one or more trigger events are detected since the last time trigger.digin[N].wait() or trigger.digin[N].clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and is ready to detect the next trigger. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31394.htm"])
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

---@class triggerlanoutArr
local triggerlanoutArr = {}

---@type triggerlanoutArr[]
trigger.lanout = {}




--- **This function simulates the occurrence of the trigger and generates the corresponding event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Generates and sends a LAN trigger packet for the LAN event number specified.Sets the pseudo line state to the appropriate state.The following indexes provide the listed LXI events:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31396.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31401.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31404.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function triggerlanoutArr.disconnect() end



--- **This attribute contains the LAN event connection state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This is set to true when the LAN trigger is connected and ready to send trigger events after a successful trigger.lanout[N].connect() command. If the LAN trigger is not ready to send trigger events, this value is false.This attribute is also false when the trigger.lanout[N].protocol or trigger.lanout[N].ipaddress attribute is changed or when the remote connection closes the connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31406.htm"])
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
triggerlanoutArr.connected= 0



--- **This attribute specifies the address (in dotted-decimal format) of UDP or TCP listeners.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Sets the IP address for outgoing trigger events.After you change this setting, you must send the connect command before outgoing messages can be sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31409.htm"])
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
lan.PROTOCOL_MULTICAST = nil
lan.PROTOCOL_UDP = nil

---@alias triggerlanoutprotocolprotocol
---|`lan.PROTOCOL_TCP`
---|`lan.PROTOCOL_MULTICAST`
---|`lan.PROTOCOL_UDP`



--- **This attribute sets the LAN protocol to use for sending trigger messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The LAN trigger listens for trigger messages on all the supported protocols. However, it uses the designated protocol for sending outgoing messages.After you change this setting, you must re-connect the LAN trigger event generator before you can send outgoing event messages.When multicast is selected, the trigger IP address is ignored, and event messages are sent to the multicast address 224.0.23.159.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31416.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.lanout[1].protocol)
--- 
--- --Get LAN protocol that is being used for sending trigger messages for LAN event 1.
--- ```
---@type triggerlanoutprotocolprotocol
triggerlanoutArr.protocol= 0



--- **This attribute specifies events that cause this trigger to assert.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. Set the event to one of the existing trigger events, which are shown in the following table.Setting this attribute to none disables automatic trigger generation.If any events are detected before the trigger LAN connection is sent, the event is ignored, and the action overrun is set.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/31419.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[5].stimulus = trigger.EVENT_TIMER1
--- 
--- --Use the timer 1 trigger event as the source for LAN trigger 5 stimulus.
--- ```
---@type eventID|0
triggerlanoutArr.stimulus= 0


trigger.LOGIC_POSITIVE = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggerlanoutlogiclogicType
---|`trigger.LOGIC_POSITIVE`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute sets the logic on which the trigger event detector and the output trigger generator operate on the given trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33157.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[2].logic = trigger.LOGIC_POSITIVE
--- 
--- --Set the logic for LAN trigger line 2 to positive.
--- ```
---@type triggerlanoutlogiclogicType
triggerlanoutArr.logic= 0

---@class tsplinklineArr
local tsplinklineArr = {}

---@type tsplinklineArr[]
tsplink.line = {}




--- **This attribute defines the trigger operation of a TSP-Link line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command defines whether or not the line is used as a digital or trigger control line and if it is an input or output.The line mode can be set to the following options:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32538.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.line[3].reset()
--- 
--- --Resets TSP-Link trigger line 3 attributes to default values.
--- ```
function tsplinklineArr.reset() end


tsplink.STATE_LOW = nil
tsplink.STATE_HIGH = nil

---@alias tsplinklinestatelineState
---|`tsplink.STATE_LOW`
---|`tsplink.STATE_HIGH`



--- **This attribute reads or writes the digital state of a TSP-Link synchronization line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use tsplink.writeport() to write to all TSP-Link synchronization lines.The reset function does not affect the present states of the TSP-Link trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32542.htm"])
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
local triggertsplinkinArr = {}

---@type triggertsplinkinArr[]
trigger.tsplinkin = {}



trigger.EDGE_FALLING = nil
trigger.EDGE_RISING = nil
trigger.EDGE_EITHER = nil

---@alias triggertsplinkinedgedetectedEdge
---|`trigger.EDGE_FALLING`
---|`trigger.EDGE_RISING`
---|`trigger.EDGE_EITHER`



--- **This attribute indicates which trigger edge controls the trigger event detector for a trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the edge is detected, the instrument asserts a TTL-low pulse for the output.The output state of the I/O line is controlled by the trigger logic. The user-specified output state of the line is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32539.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32551.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself.It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. It also is not an indication of an output trigger overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32552.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.tsplinkin[1].overrun)
--- 
--- --If an event on line 1 was ignored, displays true; if no additional event occurred, displays false.
--- ```
triggertsplinkinArr.overrun= 0



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to the timeout value for an input trigger. If one or more trigger events are detected since the last time this command or trigger.tsplinkin[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32561.htm"])
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
local triggertsplinkoutArr = {}

---@type triggertsplinkoutArr[]
trigger.tsplinkout = {}



trigger.LOGIC_POSITIVE = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggertsplinkoutlogiclogicType
---|`trigger.LOGIC_POSITIVE`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute defines the trigger output with output logic for a trigger line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the logic that the output trigger generator uses on the given trigger line.The output state of the digital I/O line is controlled by the trigger logic, and the user-specified output state of the line is ignored.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32540.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32549.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32553.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32555.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32558.htm"])
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



display.NFORMAT_EXPONENT = nil
display.NFORMAT_DECIMAL = nil
display.NFORMAT_INTEGER = nil
display.NFORMAT_PREFIX = nil

---@alias displayinputnumbernumberFormat
---|`display.NFORMAT_EXPONENT`
---|`display.NFORMAT_DECIMAL`
---|`display.NFORMAT_INTEGER`
---|`display.NFORMAT_PREFIX`



--- **This function allows you to create a prompt that requests a number from the user on the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command prompts the instrument operator to enter a value.The prompt is displayed until it has been responded to.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40051.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.rel.enable = dmm.ON
--- relativeoffset = display.input.number("Relative offset value", display.NFORMAT_INTEGER, 0, -1000, 1000)
--- dmm.measure.rel.level = relativeoffset
--- 
--- --This example displays a number pad on the screen that defaults to 0 and allows entries from -1000 to 1000. The number that the operator enters is assigned to the relative offset level. If the operator enters a value outside of the range, an error message is displayed.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40052.htm"])
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

display.BUTTON_CANCEL = nil
display.BUTTON_YES = nil
display.BUTTON_NO = nil
display.BUTTON_OK = nil

---@alias displayinputpromptbuttonReturn
---|`display.BUTTON_CANCEL`
---|`display.BUTTON_YES`
---|`display.BUTTON_NO`
---|`display.BUTTON_OK`


display.BUTTONS_OK = nil
display.BUTTONS_YESNO = nil
display.BUTTONS_CANCEL = nil
display.BUTTONS_YESNOCANCEL = nil
display.BUTTONS_OKCANCEL = nil

---@alias displayinputpromptbuttonSet
---|`display.BUTTONS_OK`
---|`display.BUTTONS_YESNO`
---|`display.BUTTONS_CANCEL`
---|`display.BUTTONS_YESNOCANCEL`
---|`display.BUTTONS_OKCANCEL`



--- **This function allows you to create a prompt that accepts a user response from the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command waits for a user response to the prompt. You can use the text to ask questions that can be used to configure your test.The prompt is displayed until it has been responded to by the user. You can only send one input prompt command at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40053.htm"])
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
display.SFORMAT_UPPER_LOWER = nil
display.SFORMAT_BUFFER_NAME = nil
display.SFORMAT_UPPER = nil

---@alias displayinputstringtextFormat
---|`display.SFORMAT_ANY`
---|`display.SFORMAT_UPPER_LOWER`
---|`display.SFORMAT_BUFFER_NAME`
---|`display.SFORMAT_UPPER`



--- **This function allows you to create a dialog box that requests text from the user through the front-panel display.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command creates a prompt to the instrument operator to enter a string value.The prompt is displayed until it has been responded to. You can only send one input prompt command at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/40054.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41093.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- voltMeasBuffer = buffer.make(10000)
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- print(dmm.digitize.read(voltMeasBuffer))
--- 
--- --Create a buffer named voltMeasBuffer. Set the instrument to digitize voltage.
--- --Make a measurement that is stored in the voltMeasBuffer and is also printed.
--- ```
---@return number reading The last reading of the measurement process
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if nothing is specified, the reading is stored in defbuffer1
---@overload fun():number
function dmm.digitize.read(bufferName) end

dmm.DIGITS_5_5 = nil
dmm.DIGITS_4_5 = nil
dmm.DIGITS_3_5 = nil
dmm.DIGITS_6_5 = nil

---@alias dmmdigitizedisplaydigitsvalue
---|`dmm.DIGITS_5_5`
---|`dmm.DIGITS_4_5`
---|`dmm.DIGITS_3_5`
---|`dmm.DIGITS_6_5`



--- **This attribute describes the number of digits that are displayed on the front panel for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41150.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.displaydigits = dmm.DIGITS_3_5
--- 
--- --Set the instrument to use the digitize current measure function.
--- --Set the front panel to display 3½ digits.
--- ```
---@type dmmdigitizedisplaydigitsvalue
dmm.digitize.displaydigits = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizeinputdividervalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the 10 MW input divider.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Is automatically ON when range is 100 V or 1000 VOnly available for DC volts.dmm.digitize.func = dmm.FUNC_DCV_DIGITIZERThe default is dmm.OFF for all ranges except 100 V and 1000  V. For the 100 V and 1000 V ranges, this is automatically turned ON. *** can it be turned off for those two ranges?  ***see dmm.measure.inputdivider
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41205.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DCV_DIGITIZER
--- dmm.digitize.inputdivider = dmm.ON
--- 
--- --Describe
--- ```
---@type dmmdigitizeinputdividervalue
dmm.digitize.inputdivider = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41269.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.userdelay[2] = 0.5
--- trigger.model.setblock(6, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M2)
--- 
--- --Set user delay 2 to be 0.5 s. Sets trigger-model block 6 to use the delay.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41297.htm"])
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
--- ```
dmm.digitize.count = 0



--- **This attribute determines the positive full-scale measure range for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When you assign a range value, the instrument selects a fixed range that is large enough to measure the assigned value. The instrument selects the best range for measuring the maximum expected value.For example, for digitize current measurements, if you expect a reading of approximately 9 mA, set the range to 9 mA to select the 10 mA range.When you read this setting, you see the positive full-scale value of the measurement range that the instrument is presently using.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41306.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.range = 90
--- 
--- --Set the function to digitize voltage. Set the range to 90 V, which selects the 100 V range.
--- ```
dmm.digitize.range = 0


dmm.FUNC_DIGITIZE_VOLTAGE = nil
dmm.FUNC_DIGITIZE_CURRENT = nil
dmm.FUNC_NONE = nil

---@alias dmmdigitizefuncvalue
---|`dmm.FUNC_DIGITIZE_VOLTAGE`
---|`dmm.FUNC_DIGITIZE_CURRENT`
---|`dmm.FUNC_NONE`



--- **This attribute determines which digitize function is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this command to the type of measurement you want to digitize.Reading this command returns the digitize function that is presently active.If a basic (non-digitize) measurement function is selected, this returns dmm.FUNC_NONE. The none setting is automatically made if you select a function with dmm.measure.func or through the options from the front-panel Measure Functions tab.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41428.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- 
--- --Set the measurement function to digitize current.
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
--- The aperture is the actual acquisition time of the instrument on the signal. The aperture can be set to automatic or to a specific value in 1 μs intervals. If the value is not specified in microseconds, the value is rounded down to the nearest microsecond resolution. When automatic is selected, the aperture setting is set to the maximum value possible for the selected sample rate.The aperture must be less than the reciprocal of the sample rate. The minimum aperture is 1 μs when the maximum sampling rate is 1,000,000 samples per second.Set the sample rate before changing the aperture.The maximum aperture available is 1 divided by the sample rate. The aperture cannot be set to more than this value.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41431.htm"])
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
--- ```
---@type dmmdigitizeaperturetime
dmm.digitize.aperture = 0



--- **This attribute defines the precise acquisition rate at which the digitizing measurements are made.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The sample rate determines how fast the DMM7510 acquires a digitized reading.Set the sample rate before setting the aperture. If the aperture setting is too high for the selected sample rate, it is automatically adjusted to the highest aperture that can be used with the sample rate.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41433.htm"])
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
--- ```
dmm.digitize.samplerate = 0



--- **This function initiates digitize measurements and returns the last actual measurement and time information in UTC format without using the trigger mode.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates digitize measurements using the present function settings, stores the readings in a reading buffer, and returns the last reading.The dmm.digitize.count attribute determines how many measurements are performed.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41622.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.digitize.readwithtime(defbuffer1))
--- 
--- --Print the last digitize measurement and time information from defbuffer1 in UTC format, which will look similar to:
--- ---0.0003882925875	1415795836	0.946164546
--- ```
---@return number reading The last reading of the measurement process
---@return number seconds Seconds in UTC format
---@return number fractional Fractional seconds
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@overload fun():number
function dmm.digitize.readwithtime(bufferName) end

dmm.UNIT_DB = nil
dmm.UNIT_AMP = nil
dmm.UNIT_DBM = nil
dmm.UNIT_VOLT = nil

---@alias dmmdigitizeunitvalue
---|`dmm.UNIT_DB`
---|`dmm.UNIT_AMP`
---|`dmm.UNIT_DBM`
---|`dmm.UNIT_VOLT`



--- **This attribute sets the units of measurement that are displayed on the front panel of the instrument and stored in the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change in measurement units is displayed when the next measurement is made. You can only change the units for the listed functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43717.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.unit = dmm.UNIT_DB
--- 
--- --Set the measure function to digitize voltage.
--- --Set the units to display in decibels.
--- ```
---@type dmmdigitizeunitvalue
dmm.digitize.unit = 0


dmm.IMPEDANCE_AUTO = nil
dmm.IMPEDANCE_10M = nil

---@alias dmmdigitizeinputimpedancesetting
---|`dmm.IMPEDANCE_AUTO`
---|`dmm.IMPEDANCE_10M`



--- **This attribute determines when the 10 MΩ input divider is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Choosing automatic input impedance is a balance between achieving low DC voltage noise on the 100 mV and 1 V ranges and optimizing measurement noise due to charge injection. The DMM7510 is optimized for low noise and charge injection when the DUT has less than 100 kΩ input resistance. When the DUT input impedance is more than 100 kΩ, selecting an input impedance of 10 MΩ optimizes the measurement for lowest noise on the 100 mV and 1 V ranges. You can achieve short-term low noise and low charge injection on the 100 mV and 1 V ranges with autozero off. For the 10 V to 1000 V ranges, both input impedance settings achieve low charge injection.The input impedance setting is only available when coupling is set to DC.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/44541.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.inputimpedance = dmm.IMPEDANCE_AUTO
--- 
--- --Set input impedance to be set automatically when the digitize voltage function is selected.
--- ```
---@type dmmdigitizeinputimpedancesetting
dmm.digitize.inputimpedance = 0



--- **This attribute defines the decibel (dB) reference setting for the DMM in volts.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This value only applies when the unit setting for the function is set to decibels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46371.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.unit = dmm.UNIT_DB
--- dmm.digitize.dbreference = 5
--- 
--- --Sets the units to decibel and sets the dB reference to 5 for DC volts.
--- ```
dmm.digitize.dbreference = 0



--- **This attribute defines the decibel-milliwatts (dBm) reference.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This value only applied when the unit setting for the function is set to dBm.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/81719.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.unit = dmm.UNIT_DBM
--- dmm.digitize.dbmreference = 85
--- 
--- --Sets the units to dBm and sets the dBm resistance to 85 Ω.
--- ```
dmm.digitize.dbmreference = 0

---@class trigger.extin
trigger.extin = {}




--- **This function clears the trigger event on the external in line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event detector of a trigger enters the detected state when an event is detected. This command clears the event detector, discards the history, and clears the overrun status (sets the overrun status to false).
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41331.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extin.clear()
--- 
--- --Clears the trigger event detector on I/O line 2.
--- ```
function trigger.extin.clear() end

trigger.EDGE_FALLING = nil
trigger.EDGE_RISING = nil
trigger.EDGE_EITHER = nil

---@alias triggerextinedgedetectedEdge
---|`trigger.EDGE_FALLING`
---|`trigger.EDGE_RISING`
---|`trigger.EDGE_EITHER`



--- **This attribute sets the type of edge that is detected as an input on the external trigger in line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The input state of the external I/O line is controlled by the type of edge specified by this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41332.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extin.edge = trigger.EDGE_RISING
--- 
--- --Sets the external I/O input line to detect rising-edge triggers as inputs.
--- ```
---@type triggerextinedgedetectedEdge
trigger.extin.edge = 0



--- **This attribute returns the event detector overrun status.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41333.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.extin.overrun
--- print(overrun)
--- 
--- --If there is no trigger overrun on the external input, the output is:
--- --false
--- ```
trigger.extin.overrun = 0



--- **This function waits for a trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses for up to timeout seconds for an input trigger. If one or more trigger events are detected since the last time trigger.extin.wait() or trigger.extin.clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and is ready to detect the next trigger. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41334.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = trigger.extin.wait(3)
--- print(triggered)
--- 
--- --Waits up to 3 s for a trigger to be detected on the external trigger line, then outputs the results.
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




--- **This function asserts a trigger on the external output line.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Initiates a trigger event and does not wait for completion.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41335.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extout.assert()
--- 
--- --Asserts a trigger on external output line 2.
--- ```
function trigger.extout.assert() end

trigger.LOGIC_POSITIVE = nil
trigger.LOGIC_NEGATIVE = nil

---@alias triggerextoutlogiclogicType
---|`trigger.LOGIC_POSITIVE`
---|`trigger.LOGIC_NEGATIVE`



--- **This attribute sets the output logic of the trigger event generator to positive or negative for the external I/O out line. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the trigger event generator to assert a TTL pulse for output logic. Positive is a high pulse; negative is a low pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41336.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.ext.reset()
--- trigger.extin.clear() 
--- trigger.extout.logic = trigger.LOGIC_NEGATIVE
--- trigger.extout.stimulus = trigger.EVENT_EXTERNAL
--- trigger.extin.edge = trigger.EDGE_FALLING
--- 
--- --Reset the external I/O line values to their defaults.
--- --Clear any event triggers on the external input line.
--- --Set the output logic to negative (it asserts a low pulse).
--- --Set the stimulus to the external I/O input.
--- --Set the external input to detect a falling edge.
--- ```
---@type triggerextoutlogiclogicType
trigger.extout.logic = 0



--- **This function releases an indefinite length or latched trigger.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulse width time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.Releases a trigger that was asserted with an indefinite pulsewidth time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.*** <AIT_DELETE_END>
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41337.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].release()
--- 
--- --Releases digital I/O trigger line 4.
--- digio.line[4].mode = digio.MODE_TRIGGER_OUT
--- trigger.digout[4].release()
--- 
--- --Releases digital I/O trigger line 4.
--- ```
function trigger.digout[N].release() end


--- **This attribute selects the event that causes a trigger to be asserted on the external output line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The trigger stimulus for the external output line can be set to one of the trigger events described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41338.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.extout.stimulus = trigger.EVENT_TIMER3
--- 
--- --Set the stimulus for the external output line to be the expiration of trigger timer 3.
--- ```
---@type triggerEvents|0
trigger.extout.stimulus= 0

---@class trigger.ext
trigger.ext = {}




--- **This function resets the edge, logic, and stimulus values for the external in/out line to their default values.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the following attributes to their default values:It also clears trigger.extin.overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41343.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- Set the external I/O trigger line for a rising edge
--- trigger.extin.edge = trigger.EDGE_RISING
--- -- Set the logic to negative
--- trigger.extout.logic = trigger.LOGIC_NEGATIVE
--- -- Set the stimulus to timer 3
--- trigger.extout.stimulus = trigger.EVENT_TIMER3
--- -- Print configuration (before reset)
--- print(trigger.extin.edge, trigger.extout.logic, trigger.extout.stimulus)
--- -- Reset the external I/O trigger line to default values.
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
---@class trigger.limit
trigger.limit = {}




--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- hardware trigger limit commands
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41442.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
trigger.limit.direction = 0



--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- trigger.limit.EVENT_IDhardware trigger limit commands
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41444.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
---@type eventID
trigger.limit.EVENT_ID= nil


--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- trigger.limit.valuehardware trigger limit commands
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41448.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
trigger.limit.value = 0

---@class acal.lastrun
acal.lastrun = {}




--- **This attribute returns the internal temperature of the instrument when autocalibration was run.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The temperature is displayed in Celsius (°C).The instrument updates the internal temperature value when the instrument refreshes autozero. If autozero is set to off or if autozero is not available for the selected function (such as capacitance, continuity, frequency, or period), the internal temperature value is not updated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.lastrun.internaltemp)
--- 
--- --Returns the internal temperature of the instrument when autocalibration was last run.
--- --Example output:
--- --63.167084
--- ```
acal.lastrun.internaltemp = 0



--- **This attribute returns the date and time when autocalibration was last run.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The date and time is returned in the format:MM/DD/YYYY HH:MM:SS.NNNNNNNNNWhere:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43636.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.lastrun.time)
--- 
--- --Returns the date and time when the autocalibration was last run.
--- --Example output:
--- --08/11/2014 16:30:26.745369595
--- ```
acal.lastrun.time = 0



--- **This attribute returns the difference between the internal temperature and the temperature when autocalibration was last run.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The temperature is displayed in Celsius (°C).The instrument updates the internal temperature value when the instrument refreshes autozero. If autozero is set to off or if autozero is not available for the selected function (such as capacitance, continuity, frequency, or period), the internal temperature value is not updated.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46331.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.lastrun.tempdiff)
--- 
--- --Returns the difference between the temperature of the instrument when autocalibration was run and the present internal temperature.
--- --Example output:
--- --4.5678
--- ```
acal.lastrun.tempdiff = 0

---@class acal.nextrun
acal.nextrun = {}




--- **This attribute returns the date and time when the next autocalibration is scheduled to be run.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The date and time is returned in the format:MM/DD/YYYY HH:MM:SS.NNNNNNNNNWhere:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43637.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.nextrun.time)
--- 
--- --Returns date and time when autocalibration is next scheduled to be run.
--- --Example output:
--- --05/29/2014 17:11:17.000000000
--- ```
acal.nextrun.time = 0

---@class dmm.trigger
dmm.trigger = {}


---@class buffer.write
buffer.write = {}



buffer.UNIT_AMP_AC = nil
buffer.UNIT_DECIBEL = nil
buffer.UNIT_CUSTOM1 = nil
buffer.UNIT_CUSTOM3 = nil
buffer.UNIT_DBM = nil
buffer.UNIT_DIO = nil
buffer.UNIT_FARAD = nil
buffer.UNIT_AMP = nil
buffer.UNIT_CELSIUS = nil
buffer.UNIT_DAC = nil
buffer.UNIT_CUSTOM2 = nil
buffer.UNIT_FAHRENHEIT = nil

---@alias bufferwriteformatunits
---|`buffer.UNIT_AMP_AC`
---|`buffer.UNIT_DECIBEL`
---|`buffer.UNIT_CUSTOM1`
---|`buffer.UNIT_CUSTOM3`
---|`buffer.UNIT_DBM`
---|`buffer.UNIT_DIO`
---|`buffer.UNIT_FARAD`
---|`buffer.UNIT_AMP`
---|`buffer.UNIT_CELSIUS`
---|`buffer.UNIT_DAC`
---|`buffer.UNIT_CUSTOM2`
---|`buffer.UNIT_FAHRENHEIT`


buffer.DIGITS_6_5 = nil
buffer.DIGITS_7_5 = nil
buffer.DIGITS_5_5 = nil
buffer.DIGITS_8_5 = nil
buffer.DIGITS_3_5 = nil
buffer.DIGITS_4_5 = nil

---@alias bufferwriteformatdisplayDigits
---|`buffer.DIGITS_6_5`
---|`buffer.DIGITS_7_5`
---|`buffer.DIGITS_5_5`
---|`buffer.DIGITS_8_5`
---|`buffer.DIGITS_3_5`
---|`buffer.DIGITS_4_5`



--- **This function sets the units and number of digits of the readings that are written into the reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command is valid when the buffer style is writable or full writable. When the buffer style is set to full writable, you can include an extra value.The format defines the units and the number of digits that are reported for the data. This command affects how the data is shown in the reading buffer and what is shown on the front-panel Home, Histogram, Reading Table, and Graph screens.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46427.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46428.htm"])
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
--- ```
---@param bufferVar bufferMethods The name of the buffer
---@param readingValue number The first value that is recorded in the buffer index
---@param extraValue number A second value that is recorded in the buffer index (only valid for buffer style WRITABLE_FULL)
---@param seconds number An integer that represents the seconds
---@param fractionalSeconds number The portion of the time that represents the fractional seconds
---@param status readingStatus Additional information about the reading; see Details
---@overload fun(bufferVar:bufferMethods,readingValue:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number,seconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number,fractionalSeconds:number)
---@overload fun(bufferVar:bufferMethods,readingValue:number,seconds:number,fractionalSeconds:number,status:readingStatus)
---@overload fun(bufferVar:bufferMethods,readingValue:number,extraValue:number,seconds:number,fractionalSeconds:number)
function buffer.write.reading(bufferVar, readingValue, extraValue, seconds, fractionalSeconds, status) end
---@class dmm.measure.configlist
dmm.measure.configlist = {}




--- **This function creates an empty measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command creates an empty configuration list. To add configuration indexes to this list, you need to use the store command.Configuration lists are not saved when the instrument is turned off. To save a configuration list, create a configuration script to save instrument settings, including any defined configuration lists.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/25691.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28417.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28418.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28419.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/28421.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30559.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/32926.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/91273.htm"])
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
--- This command forces a refresh of the reference and zero measurements that are used for the present aperture setting.When autozero is set to off, the instrument may gradually drift out of specification. To minimize the drift, you can send the once command to make a reference and zero measurement immediately before a test sequence.dmm.measure.autozero.once() 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41130.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DCI_DIGITIZER
--- dmm.digitize.autozero.once()
--- 
--- --Description or output
--- ```
function dmm.digitize.autozero.once() end

dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureautozeroenablestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To ensure the accuracy of readings, the instrument must periodically get new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture that is being used for measurements. The DMM7510 uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made.The time to make the reference measurements is in addition to the normal measurement time. If timing is critical, you can disable autozero to avoid this time penalty.When autozero is set to off, the instrument may gradually drift out of specification. To minimize the drift, you can send the once command to make a reference and zero measurement immediately before a test sequence.For AC voltage and AC current measurements where the detector bandwidth is set to 3 Hz or 30 Hz, autozero is set on and cannot be changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.autozero.enable = dmm.OFF
--- 
--- --Set autozero off for voltage measurements.
--- ```
---@type dmmmeasureautozeroenablestate
dmm.measure.autozero.enable = 0

---@type triggertimerArr[]
triggertimerArr.start = {}



trigger.ON = nil
trigger.OFF = nil

---@alias triggertimerstartgeneratestate
---|`trigger.ON`
---|`trigger.OFF`



--- **This attribute specifies when timer events are generated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this is set to on, a trigger event is generated immediately when the timer is triggered.When it is set to off, a trigger event is generated when the timer elapses. This generates the event trigger.EVENT_TIMERN.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30536.htm"])
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
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates if an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the timer itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other construct that is monitoring the delay completion event. It also is not an indication of a delay overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30553.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].start.overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If the event was not ignored, the output is false.
--- ```
triggertimerArr.start.overrun= 0



--- **This attribute describes the event that starts the trigger timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the stimulus to any trigger event to start the timer when that event occurs.Set the stimulus to none to disable event processing and use the timer as a timer or alarm based on the start time.Trigger events are described in the table below.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/30555.htm"])
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



--- **This attribute configures the seconds of an alarm or a time in the future when the timer will start.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command configures the alarm of the timer.When the timer is enabled, the timer starts immediately if the timer is configured for a start time that has passed.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33984.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/33985.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].start.fractionalseconds = 0.4
--- 
--- --Set the trigger timer to start in 0.4 s.
--- ```
triggertimerArr.start.fractionalseconds= 0

---@class dmm.measure.filter
dmm.measure.filter = {}




--- **This attribute sets the number of measurements that are averaged when filtering is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The filter count is the number of readings that are acquired and stored in the filter stack for the averaging calculation. When the filter count is larger, more filtering is done, and the data is less noisy.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41157.htm"])
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
--- ```
dmm.measure.filter.count = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasurefilterenablefilterState
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the averaging filter for measurements of the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the averaging filter. When this is enabled, the reading returned by the instrument is an averaged value, taken from multiple measurements. The settings of the filter count and filter type for the selected measure function determines how the reading is averaged.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41161.htm"])
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
--- ```
---@type dmmmeasurefilterenablefilterState
dmm.measure.filter.enable = 0


dmm.FILTER_MOVING_AVG = nil
dmm.FILTER_REPEAT_AVG = nil

---@alias dmmmeasurefiltertypetype
---|`dmm.FILTER_MOVING_AVG`
---|`dmm.FILTER_REPEAT_AVG`



--- **This attribute defines the type of averaging filter that is used for the selected measure function when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the repeating average filter is selected, a set of measurements are made. These measurements are stored in a measurement stack and averaged together to produce the averaged sample. Once the averaged sample is produced, the stack is flushed, and the next set of data is used to produce the next averaged sample. This type of filter is the slowest, since the stack must be completely filled before an averaged sample can be produced.When the moving average filter is selected, the measurements are added to the stack continuously on a first-in, first-out basis. As each measurement is made, the oldest measurement is removed from the stack. A new averaged sample is produced using the new measurement and the data that is now in the stack.The repeating average filter produces slower results but produces more stable results than the moving average filter. For either method, the greater the number of measurements that are averaged, the slower the averaged sample rate, but the lower the noise error. Trade-offs between speed and noise are normally required to tailor the instrumentation to your measurement application.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.measure.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.measure.filter.enable = dmm.ON
--- 
--- --Set the measurement function to DC current. Set the filter type to moving average and enable filtered measurements.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41173.htm"])
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
--- ```
dmm.measure.filter.window = 0

---@class dmm.digitize.filter
dmm.digitize.filter = {}




--- **This attribute sets the number of measurements that are averaged when filtering is enabled**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- dmm.measure.filter.countThe filter count is the number of readings that are acquired and stored in the filter stack for the averaging calculation. The larger the filter count, the more filtering that is performed.This command is set for the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41160.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
dmm.digitize.filter.count = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizefilterenablevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the averaging filter for measurements of the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the averaging filter. When this is enabled, the measurements for the selected measurement function are averaged as set by the filter count and filter type.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41163.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DCI_DIGITIZER
--- 
--- --Describe
--- ```
---@type dmmdigitizefilterenablevalue
dmm.digitize.filter.enable = 0


dmm.FILTER_MOVING_AVG = nil
dmm.FILTER_REPEAT_AVG = nil

---@alias dmmdigitizefiltertypevalue
---|`dmm.FILTER_MOVING_AVG`
---|`dmm.FILTER_REPEAT_AVG`



--- **This attribute defines the type of averaging filter that is used for the selected measurement function when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- dmm.digitize.func = dmm.FUNC_DCI_DIGITIZER or dmm.FUNC_DCV_DIGITIZER
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41164.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.func = "twowireohms"
--- dmm.filter.type = dmm.FILTER_MOVING_AVG
--- dmm.filter.enable = dmm.ON
--- 
--- --Set the filter type for 2-wire ohms to moving average and enable filtered measurements.
--- ```
---@type dmmdigitizefiltertypevalue
dmm.digitize.filter.type = 0



--- **This attribute sets the window for the averaging filter that is used for measurements for the selected function when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DCI_DIGITIZER
--- dmm.digitize.filter.window = 5
--- 
--- -- 
--- ```
dmm.digitize.filter.window = 0

---@class dmmmeasurelimitArr
local dmmmeasurelimitArr = {}

---@type dmmmeasurelimitArr[]
dmm.measure.limit = {}



dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasurelimitautoclearvalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41208.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
function dmmmeasurelimitArr.clear() end


dmm.FAIL_HIGH = nil
dmm.FAIL_NONE = nil
dmm.FAIL_LOW = nil
dmm.FAIL_BOTH = nil

---@alias dmmmeasurelimitfailvalue
---|`dmm.FAIL_HIGH`
---|`dmm.FAIL_NONE`
---|`dmm.FAIL_LOW`
---|`dmm.FAIL_BOTH`



--- **This attribute queries the results of a limit test.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command queries the result of a limit test for the selected measurement function.The response message indicates if the limit test passed or how it failed (on the high or low limit).If autoclear is set to off, reading the results of a limit test does not clear the fail indication of the test. To clear a failure, send the clear command. To automatically clear the results, set auto clear on.If auto clear is set to on and you are making a series of measurements, the last measurement limit determines the fail indication for the limit. If auto clear is turned off, the results return a test fail if any of one of the readings failed.To use this attribute, you must set the limit state to on.If the readings are stored in a reading buffer, you can use the bufferVar.statuses command to see the results.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41214.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
---@type dmmmeasurelimitfailvalue
dmmmeasurelimitArr.fail= 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasurelimitenablestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables a limit test on the measurement from the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables a limit test for the selected measurement function. When this attribute is enabled, the limit Y testing occurs on each measurement made by the instrument. Limit Y testing compares the measurements to the high-limit and low-limit values. If a measurement falls outside these limits, the test fails.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41231.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.FUNC_DC_VOLTAGE
--- 
--- --dmm.FUNC_RESISTANCE
--- ```
---@type dmmmeasurelimitenablestate
dmmmeasurelimitArr.enable= 0


dmm.AUDIBLE_FAIL = nil
dmm.AUDIBLE_PASS = nil
dmm.AUDIBLE_NONE = nil

---@alias dmmmeasurelimitaudiblestate
---|`dmm.AUDIBLE_FAIL`
---|`dmm.AUDIBLE_PASS`
---|`dmm.AUDIBLE_NONE`



--- **This attribute determines if the instrument beeper sounds when a limit test passes or fails.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The tone and length of beeper cannot be adjusted.See dmm.measure.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41684.htm"])
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
local dmmdigitizelimitArr = {}

---@type dmmdigitizelimitArr[]
dmm.digitize.limit = {}



dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizelimitautoclearstate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.limit[1].autoclear = dmm.OFF
--- 
--- --Turns off autoclear for limit 1 when measuring digitize voltage.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.limit[1].clear()
--- 
--- --Set the digitize function to voltage.
--- --Clear the results of limit test 1.
--- ```
function dmmdigitizelimitArr.clear() end


dmm.FAIL_HIGH = nil
dmm.FAIL_NONE = nil
dmm.FAIL_LOW = nil
dmm.FAIL_BOTH = nil

---@alias dmmdigitizelimitfailvalue
---|`dmm.FAIL_HIGH`
---|`dmm.FAIL_NONE`
---|`dmm.FAIL_LOW`
---|`dmm.FAIL_BOTH`



--- **This attribute queries the results of a limit test.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command queries the result of a limit test for the selected digitize function.The response message indicates if the limit test passed or how it failed (on the high or low limit).If autoclear is set to off, reading the results of a limit test does not clear the fail indication of the test. To clear a failure, send the clear command. To automatically clear the results, set auto clear on.If auto clear is set to on and you are making a series of measurements, the last measurement limit determines the fail indication for the limit. If auto clear is turned off, the results return a test fail if any of one of the readings failed.To use this attribute, you must set the limit state to on.If the readings are stored in a reading buffer, you can use the bufferVar.statuses command to see the results.See dmm.digitize.limit[Y].low.value for examples of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41221.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value
--- 
--- --The results of the limit test for limit Y:
--- --dmm.FAIL_NONE: Test passed; measurement under or equal to the high limitdmm.FAIL_HIGH: Test failed; measurement exceeded high limitdmm.FAIL_LOW: Test failed; measurement exceeded low limitdmm.FAIL_BOTH: Test failed; measurement exceeded both --- ```
---@type dmmdigitizelimitfailvalue
dmmdigitizelimitArr.fail= 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizelimitenablestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables a limit test on the measurement from the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables a limit test for the selected digitize function. When this attribute is enabled, the limit Y testing occurs on each measurement made by the instrument. Limit Y testing compares the measurements to the high and low limit values. If a measurement falls outside these limits, the test fails.See dmm.digitize.limit[Y].low.value for examples of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41225.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state
--- 
--- --Limit Y testing:
--- --Disable: dmm.OFFEnable: --- ```
---@type dmmdigitizelimitenablestate
dmmdigitizelimitArr.enable= 0


dmm.AUDIBLE_FAIL = nil
dmm.AUDIBLE_PASS = nil
dmm.AUDIBLE_NONE = nil

---@alias dmmdigitizelimitaudiblevalue
---|`dmm.AUDIBLE_FAIL`
---|`dmm.AUDIBLE_PASS`
---|`dmm.AUDIBLE_NONE`



--- **This attribute determines if the instrument beeper sounds when a limit test passes or fails.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The tone and length of beeper cannot be adjusted.See dmm.digitize.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41685.htm"])
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



dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasuremathenablevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables math operations on measurements for the selected measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41235.htm"])
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
--- ```
---@type dmmmeasuremathenablevalue
dmm.measure.math.enable = 0


dmm.MATH_PERCENT = nil
dmm.MATH_MXB = nil
dmm.MATH_RECIPROCAL = nil

---@alias dmmmeasuremathformatoperation
---|`dmm.MATH_PERCENT`
---|`dmm.MATH_MXB`
---|`dmm.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This specifies which math operation is performed on measurements for the selected measurement function.You can choose one of the following math operations:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41245.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.math.format = dmm.MATH_RECIPROCAL
--- dmm.measure.math.enable = dmm.ON
--- 
--- --Enables the reciprocal math operation on voltage measurements.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41248.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41236.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41275.htm"])
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
--- ```
dmm.digitize.rel.level = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizerelenablestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the application of a relative offset value to the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When relative measurements are enabled, all subsequent digitized readings are offset by the relative offset value that was calculated when you acquired the relative offset value.Each returned measured relative reading is the result of the following calculation:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41280.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_CURRENT
--- dmm.digitize.rel.acquire()
--- dmm.digitize.rel.enable = dmm.ON
--- 
--- --Enables the relative measurements for digitize current after using the acquire command to set the relative level.
--- ```
---@type dmmdigitizerelenablestate
dmm.digitize.rel.enable = 0

---@class dmm.digitize.math
dmm.digitize.math = {}



dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizemathenablevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables math operations on measurements for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41240.htm"])
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
--- ```
---@type dmmdigitizemathenablevalue
dmm.digitize.math.enable = 0


dmm.MATH_PERCENT = nil
dmm.MATH_MXB = nil
dmm.MATH_RECIPROCAL = nil

---@alias dmmdigitizemathformatoperation
---|`dmm.MATH_PERCENT`
---|`dmm.MATH_MXB`
---|`dmm.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This specifies which math operation is performed on measurements for the selected digitize function.You can choose one of the following math operations:Math calculations are applied to the input signal after relative offset and before limit tests.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41243.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.math.format = dmm.MATH_RECIPROCAL
--- dmm.digitize.math.enable = dmm.ON
--- 
--- --Enables the reciprocal math operation on digitize voltage measurements.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41257.htm"])
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
--- ```
dmm.digitize.math.percent = 0

---@class dmm.measure.offsetcompensation
dmm.measure.offsetcompensation = {}



dmm.OCOMP_AUTO = 4
dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureoffsetcompensationenablestate
---|`dmm.OCOMP_AUTO`
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if offset compensation is used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41259.htm"])
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
--- ```
---@type dmmmeasureoffsetcompensationenablestate
dmm.measure.offsetcompensation.enable = 0

---@class dmm.measure.rel
dmm.measure.rel = {}



dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasurerelenablestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables the application of a relative offset value to the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value. You can enter a relative offset value or have the instrument acquire a relative offset value.Each returned measured relative reading is the result of the following calculation:
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41271.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_AC_CURRENT
--- dmm.measure.rel.acquire()
--- dmm.measure.rel.enable = dmm.ON
--- 
--- --Enables the relative measurements for AC current and uses the acquire command to set the relative level attribute.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41272.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41273.htm"])
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
--- ```
dmm.measure.rel.level = 0


dmm.METHOD_PARTS = nil
dmm.METHOD_RESULT = nil

---@alias dmmmeasurerelmethodvalue
---|`dmm.METHOD_PARTS`
---|`dmm.METHOD_RESULT`



--- **This attribute determines if relative offset is applied to the measurements before calculating the DC voltage ratio value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines if relative offset is applied to the voltage measurements before the ratio calculation or if the relative offset is applied to the final calculated value.When the parts method is selected, the individual readings each have the relative offset value applied before being used to calculate the measurement reading. The relative offset value is working with smaller ranges, so an error may occur. Reduce the relative offset value if you receive an error. When a relative offset value is acquired when the parts method is selected, the relative offset levels are made and applied to both input and sense.A relative offset is applied to the sense value and then to the input value.When the results method is selected, the individual readings do not have the relative offset value applied. The relative offset value is applied to the final calculation.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41691.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.rel.method = dmm.METHOD_PARTS
--- 
--- --Set the measure function to DC voltage ratio.
--- --Set the method to apply relative offset before generating the ratio.
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41283.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_ACV_PERIOD
--- dmm.measure.threshold.range = 50
--- 
--- --Set the threshold range for the selected function to the nearest range of 100 V.
--- ```
dmm.measure.threshold.range = 0



--- **This attribute determines the signal level where the instrument makes frequency or period measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You need to set an appropriate voltage trigger level in order for the frequency counter to operate properly. The frequency counter only counts cycles when the signal amplitude reaches the trigger level. For example, if you set the trigger level for 10 V, any cycles with peak amplitude less than 10 V are not counted.You must select a specific threshold range (autorange must be set to off) before setting a level that is not zero.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41287.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_ACV_FREQUENCY
--- dmm.measure.threshold.range = 10
--- dmm.measure.threshold.level = 5
--- 
--- --Set the measure function to frequency.
--- --Set the threshold range to 10 V.
--- --Set the threshold level to 5 V.
--- ```
dmm.measure.threshold.level = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasurethresholdautorangestate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if the threshold range is set manually or automatically.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines how the range is selected.When this command is set to off, you must set the range. If you do not set the range, the instrument remains at the range that was last selected by autorange.When this command is set to on, the instrument uses the signal to determine the most sensitive range on which to perform the measurement. The instrument sets the range when a measurement is requested. To set the range, the instrument makes a measurement to determine the range before making the final measurement, which can result in slower reading times. Turn autorange off and set a specific range to increase measure time.If a range is manually selected through the front panel or a remote command, this command is automatically set to off.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41289.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_ACV_PERIOD
--- dmm.measure.threshold.autorange = dmm.ON
--- 
--- --Set the measure function to period.
--- --Set the threshold autorange on.
--- ```
---@type dmmmeasurethresholdautorangestate
dmm.measure.threshold.autorange = 0

---@class dmm.digitize.coupling
dmm.digitize.coupling = {}



dmm.COUPLING_AC = nil
dmm.COUPLING_DC = nil

---@alias dmmdigitizecouplingtypecouplingType
---|`dmm.COUPLING_AC`
---|`dmm.COUPLING_DC`



--- **This attribute determines if AC or DC signal coupling is used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command selects the type of input coupling that is used for the selected function.When DC is selected, the instrument measures AC and DC components of the signal. When AC is selected, the instrument only measures the AC components of the signal.If AC coupling is selected, you can change input impedance settings, but they do not take effect until DC coupling is selected.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41380.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.coupling.type = dmm.COUPLING_AC
--- 
--- --Set the digitize voltage coupling to AC.
--- ```
---@type dmmdigitizecouplingtypecouplingType
dmm.digitize.coupling.type = 0


dmm.AC_FILTER_FAST = nil
dmm.AC_FILTER_SLOW = nil

---@alias dmmdigitizecouplingacfiltertype
---|`dmm.AC_FILTER_FAST`
---|`dmm.AC_FILTER_SLOW`



--- **This attribute selects the instrument settling time when coupling is set to AC.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This option is only used when digitize signal coupling is set to AC.When the signal coupling is set to AC, there may still be some DC signal content that comes in with the AC signal. To allow this signal to settle out, you can set AC coupling filter to slow. When the filter is set to slow, the instrument adds an 800 ms delay before making measurements.When the AC coupling filter is set to fast, the instrument adds an 80 ms delay before making measurements. Set the AC filter to fast for faster settling when measuring rapidly changing inputs. For most digitize voltage measurements, the 80 ms delay is enough time for the range to settle.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41743.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.coupling.type = dmm.COUPLING_AC
--- dmm.digitize.coupling.acfilter = dmm.AC_FILTER_FAST
--- 
--- --Set the measure function to digitize voltage.
--- --Set the coupling type to AC.
--- --Set the filter to fast.
--- ```
---@type dmmdigitizecouplingacfiltertype
dmm.digitize.coupling.acfilter = 0



--- **This attribute allows you to optimize the amplitude to compensate for signal loss across the coupling capacitor when AC coupling is selected.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only used when the digitize coupling type is set to AC.For example, if you are measuring a 50 Hz signal, you could set this to 50 Hz to compensate for voltage drop across the coupling capacitor.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41744.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.coupling.type = dmm.COUPLING_AC
--- dmm.digitize.coupling.acfrequency = 50
--- 
--- --Set the digitize function to voltage.
--- --Set the coupling type to AC.
--- --Set the frequency to 500 Hz.
--- ```
dmm.digitize.coupling.acfrequency = 0

---@class dmm.digitize.analogtrigger
dmm.digitize.analogtrigger = {}



dmm.MODE_PULSE = nil
dmm.MODE_WINDOW = nil
dmm.MODE_EDGE = nil
dmm.MODE_OFF = nil

---@alias dmmdigitizeanalogtriggermodesetting
---|`dmm.MODE_PULSE`
---|`dmm.MODE_WINDOW`
---|`dmm.MODE_EDGE`
---|`dmm.MODE_OFF`



--- **This attribute configures the type of signal behavior that can generate an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When edge is selected, the analog trigger occurs when the signal crosses a certain level. You also specify if the analog trigger occurs on the rising or falling edge of the signal.When pulse is selected, the analog trigger occurs when a pulse passes through the specified level and meets the constraint that you set on its width. You also specify the polarity of the signal (above or below the trigger level).When window is selected, the analog trigger occurs when the signal enters or exits the window defined by the low and high signal levels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41391.htm"])
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
--- ```
---@type dmmdigitizeanalogtriggermodesetting
dmm.digitize.analogtrigger.mode = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmdigitizeanalogtriggerhighfreqrejectsetting
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables high frequency rejection on analog trigger events.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- False triggering around the set analog trigger level may occur with low frequency signals that are noisy, DC, or have low amplitude and slew rate during the peaks of input sine waves less than 250 Hz. High-frequency rejection avoids false triggers by requiring the trigger event to be sustained for at least 64 μs. This behavior is similar to a low pass filter effect with a 4 kHz 3 dB bandwidth.When high frequency rejection is on, 64 μs of additional trigger latency is incurred. You may also need to adjust the trigger levels to ensure that the trigger condition is satisfied for at least 64 μs.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/44466.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DC_VOLTAGE
--- dmm.digitize.analogtrigger.highfreqreject = dmm.ON
--- 
--- --Set the measure function to DC voltage and turn high frequency rejection for the analog trigger to on.
--- ```
---@type dmmdigitizeanalogtriggerhighfreqrejectsetting
dmm.digitize.analogtrigger.highfreqreject = 0

---@class dmm.measure.analogtrigger
dmm.measure.analogtrigger = {}



dmm.MODE_PULSE = nil
dmm.MODE_WINDOW = nil
dmm.MODE_EDGE = nil
dmm.MODE_OFF = nil

---@alias dmmmeasureanalogtriggermodesetting
---|`dmm.MODE_PULSE`
---|`dmm.MODE_WINDOW`
---|`dmm.MODE_EDGE`
---|`dmm.MODE_OFF`



--- ** This attribute configures the type of signal behavior that can generate an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When edge is selected, the analog trigger occurs when the signal crosses a certain level. You also specify if the analog trigger occurs on the rising or falling edge of the signal.When pulse is selected, the analog trigger occurs when a pulse passes through the specified level and meets the constraint that you set on its width. You also specify the polarity of the signal (above or below the trigger level).When window is selected, the analog trigger occurs when the signal enters or exits the window defined by the low and high signal levels.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41389.htm"])
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
--- ```
---@type dmmmeasureanalogtriggermodesetting
dmm.measure.analogtrigger.mode = 0


dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureanalogtriggerhighfreqrejectsetting
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute enables or disables high frequency rejection on analog trigger events.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- False triggering around the set analog trigger level may occur with low frequency signals that are noisy, DC, or have low amplitude and slew rate during the peaks of input sine waves less than 250 Hz. High-frequency rejection avoids false triggers by requiring the trigger event to be sustained for at least 64 μs. This behavior is similar to a low pass filter effect with a 4 kHz 3 dB bandwidth.When high frequency rejection is on, 64 μs of additional trigger latency is incurred. You may also need to adjust the trigger levels to ensure that the trigger condition is satisfied for at least 64 μs.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/44464.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.analogtrigger.highfreqreject = dmm.ON
--- 
--- --Set the measure function to DC voltage and turn high frequency rejection for the analog trigger to on.
--- ```
---@type dmmmeasureanalogtriggerhighfreqrejectsetting
dmm.measure.analogtrigger.highfreqreject = 0

---@class dmm.digitize.comparator
dmm.digitize.comparator = {}



dmm.EDGE_FALLING = nil
dmm.EDGE_RISING = nil

---@alias dmmdigitizecomparatoredgevalue
---|`dmm.EDGE_FALLING`
---|`dmm.EDGE_RISING`



--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- analog trigger was level trigger (leveltrigger).non-digitize: where <value> is dependent on measure DC current range for min and max values and default is 0used when analog trigger mode set to edgedigitize: where <value> is dependent on active digitize function range for min and max values and default is 0
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41396.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DCI_DIGITIZER
--- dmm.digitize.comparator.mode = dmm.MODE_LEVEL
--- dmm.digitize.comparator.edge = dmm.EDGE_RISING
--- 
--- -- 
--- ```
---@type dmmdigitizecomparatoredgevalue
dmm.digitize.comparator.edge = 0

---@class dmm.measure.sense
dmm.measure.sense = {}



dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasuresenseautorangevalue
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute determines if the sense range is set manually or automatically.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This selects whether the range for the denominator of the ratio is selected manually or automatically.This command determines how the range is selected.When this command is set to off, you must set the range. If you do not set the range, the instrument remains at the range that was last selected by autorange.When this command is set to on, the instrument automatically goes to the most sensitive range to perform the measurement.If a range is manually selected through the front panel or a remote command, this command is automatically set to off.Autorange selects the best range in which to measure the signal that is applied to the input terminals of the instrument. When autorange is enabled, the range increases at 120 percent of range. The range decreases occur when the reading is <10 percent of nominal range. For example, if you are on the 1 V range and autorange is enabled, the instrument autoranges up to the 10 V range when the measurement exceeds 1.2 V. It autoranges down to the 100 mV range when the measurement falls below 1 V.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41434.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.sense.autorange = dmm.OFF
--- 
--- --Select the DC voltage ratio function.
--- --Set the sense range to be set manually.
--- ```
---@type dmmmeasuresenseautorangevalue
dmm.measure.sense.autorange = 0



--- **This attribute determines the positive full-scale range for the sense measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The full-scale input for the reference measurement in the denominator of the ratio. It affects the accuracy of the measurements and the maximum signal that can be measured. Autorange is automatically set to off if a specific value is set.When you assign a range value, the instrument is set on a fixed range that is large enough to measure the assigned value. The instrument selects the best range for measuring the maximum expected value. For example, if you expect a sense reading of approximately 9 V, set the range to 9 V to select the 10 V range.This command is primarily intended to eliminate the time that is required by the instrument to select an automatic range.Note that when you select a fixed range, an overflow condition can occur.When you read this setting, you see the positive full-scale value of the sense range that the instrument is presently using.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41436.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DCV_RATIO
--- dmm.measure.sense.range = 1
--- 
--- --Select the DC voltage ratio function.
--- --Set the sense range to 1 V.
--- ```
dmm.measure.sense.range = 0

---@class dmm.measure.bias
dmm.measure.bias = {}




--- **This attribute selects the amount of current the instrument sources when it makes measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the amount of current that is sourced by the instrument to make measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41438.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.bias.level = 0.0001
--- 
--- --Set a bias level of 100 µA.
--- ```
dmm.measure.bias.level = 0



--- **This attribute returns the amount of current the instrument is sourcing when it makes measurements.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Reads the actual amount of current that is sourced by the instrument when a measurement is made.For the 1 Ω to 1 MΩ ranges, a constant current source is used to calculate resistance. The dmm.measure.bias.actual attribute returns the calibrated current for the programmed range. For the 10 MΩ to 1 GΩ ranges, the DMM7510 uses the ratiometric technique. Ratiometric ohms measurement has lower noise and better repeatability for testing devices at ranges greater than 1 MΩ, but has variable current through the device under test (DUT). The dmm.measure.bias.actual attribute returns the ideal maximum current when the DUT is at 0 Ω (0.69 µA).
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/46264.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(dmm.measure.bias.actual)
--- 
--- --Read the actual bias level.
--- ```
dmm.measure.bias.actual = 0

---@class dmm.trigger.measure
dmm.trigger.measure = {}




--- **This attribute sets the instrument to make a measurement the next time it detects the specified trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is intended to provide the lowest possible latency between an event such as digital I/O and a reading. It forces the instrument to make a measurement the next time it detects the specified trigger event. Options for the trigger event parameter are listed in the following table.A measure function must be active before sending this command. The measurement is made for the active measure function. If a digitize function is active, an error is generated.Before using this command, set the active reading buffer. Readings are stored in the active reading buffer.If the count is set to more than 1, the first reading is initialized by this trigger. Subsequent readings occur as rapidly as the instrument can make them. If a trigger occurs during the group measurement, the trigger is latched and another group of measurements with the same count will be triggered after the current group completes. If the stimulus is set to none, this command has no effect on readings.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/44068.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- dmm.trigger.measure.stimulus = trigger.EVENT_DISPLAY
--- dmm.measure.count = 10
--- 
--- --Reset the instrument.
--- --Set the function to DC current.
--- --Set the trigger stimulus to be the front-panel TRIGGER key.
--- --Set the count to 10.
--- --Press the TRIGGER key to generate 10 readings that are stored in the active reading buffer.
--- ```
---@type triggerEvents|0
dmm.trigger.measure.stimulus= 0

---@class dmm.trigger.digitize
dmm.trigger.digitize = {}




--- **This attribute sets the instrument to digitize a measurement the next time it detects the specified trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is intended to provide the lowest possible latency between a trigger event such as digital I/O and a reading. It forces the instrument to make a digitize measurement the next time it detects the specified trigger event. Options for the trigger event parameter are listed in the following table.A digitize function must be active before sending this command. The measurement is digitized for the active function. If a measure function is active, an error is generated.Before using this command, set the active reading buffer. Readings are stored in the active reading buffer.If the count is set to more than 1, the first reading is initialized by this trigger. Subsequent readings occur as rapidly as the instrument can make them. If a trigger occurs during the group measurement, the trigger is latched and another group of measurements with the same count will be triggered after the current group completes.If the stimulus is set to none, this command has no effect on readings.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/44069.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_EDGE
--- dmm.digitize.analogtrigger.edge.slope = dmm.SLOPE_RISING
--- dmm.digitize.analogtrigger.edge.level = 0.5
--- dmm.trigger.digitize.stimulus = trigger.EVENT_ANALOGTRIGGER
--- 
--- --Reset the instrument.
--- --Set the function to digitize voltage.
--- --Set the analog trigger mode to edge.
--- --Set the slope to rising.
--- --Set the level to 0.5 V.
--- --Set the stimulus to be the analog trigger.
--- ```
---@type triggerEvents|0
dmm.trigger.digitize.stimulus= 0

---@type dmmdigitizelimitArr[]
dmmdigitizelimitArr.low = {}




--- **This attribute specifies the lower limit for limit tests.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the lower limit for the limit Y test for the selected digitize function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.This example enables limits 1 and 2 for digitize voltage measurements. Limit 1 is checking for readings to be between 3 V and 5 V, while limit 2 is checking for the readings to be between 1 V and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41215.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41227.htm"])
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
--- This command sets the lower limit for the limit Y test for the selected measure function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.Default is 0.3 for limit 1 when the diode function is selected. The default for limit 2 for the diode function is –1.This example enables limits 1 and 2 for voltage measurements. Limit 1 is checking for readings to be between 3 and 5 V, while limit 2 is checking for the readings to be between 1 and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to determine which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41229.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41230.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41246.htm"])
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
--- --Set the scale factor for the mx + b operation to 0.80.
--- --Set the offset factor to 50.
--- --Enable the math function.
--- ```
dmm.measure.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41247.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41252.htm"])
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
--- --Set the scale factor for the mx + b operation to 0.80.
--- --Set the offset factor to 42.
--- --Enable the math function.
--- ```
dmm.digitize.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41255.htm"])
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
--- --Set the scale factor for the mx + b operation to 0.80.
--- --Set the offset factor to 42.
--- --Enable the math function.
--- ```
dmm.digitize.math.mxb.mfactor = 0

---@class dmm.measure.offsetcompensation.delay
dmm.measure.offsetcompensation.delay = {}



dmm.ON = nil
dmm.OFF = nil

---@alias dmmmeasureoffsetcompensationdelayautostate
---|`dmm.ON`
---|`dmm.OFF`



--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available for the temperature function if the transducer is set to four RTD or three RTD.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41261.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_FOURRTD
--- dmm.measure.offsetcompensation.delay.auto = dmm.OFF
--- 
--- --Describe
--- ```
---@type dmmmeasureoffsetcompensationdelayautostate
dmm.measure.offsetcompensation.delay.auto = 0



--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For temperature measurements, this command is only available for the temperature function if the transducer is set to four RTD or three RTD.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41264.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_TEMPERATURE
--- dmm.measure.transducer = dmm.TRANS_FOURRTD
--- dmm.measure.offsetcompensation.delay.currenton = .1
--- 
--- --Describe
--- ```
dmm.measure.offsetcompensation.delay.currenton = 0



--- **This attribute describes something.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available for the temperature function if the transducer is set to four‑wire RTD or three‑wire RTD.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41267.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- group.attribute = 2
--- 
--- --Describe
--- ```
dmm.measure.offsetcompensation.delay.currentoff = 0

---@class dmm.digitize.analogtrigger.pulse
dmm.digitize.analogtrigger.pulse = {}



dmm.CONDITION_LESS = nil
dmm.CONDITION_GREATER = nil

---@alias dmmdigitizeanalogtriggerpulseconditionvalue
---|`dmm.CONDITION_LESS`
---|`dmm.CONDITION_GREATER`



--- **This attribute defines if the pulse must be greater than or less than the incoming pulse must have a duration greater than or less than the threshold pulse width before an analog trigger is generated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41385.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.digitize.analogtrigger.pulse.level = 5
--- dmm.digitize.analogtrigger.pulse.width = 30e-6
--- dmm.digitize.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.digitize.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
---@type dmmdigitizeanalogtriggerpulseconditionvalue
dmm.digitize.analogtrigger.pulse.condition = 0



--- **This attribute defines the threshold value for the pulse width.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This option is only available when the analog trigger mode is set to pulse.This option sets either the minimum or maximum pulse width that generates an analog trigger event. The value of pulse condition determines whether this value is interpreted as the minimum or maximum pulse width.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41400.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.digitize.analogtrigger.pulse.level = 5
--- dmm.digitize.analogtrigger.pulse.width = 30e-6
--- dmm.digitize.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.digitize.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
dmm.digitize.analogtrigger.pulse.width = 0


dmm.POLARITY_BELOW = nil
dmm.POLARITY_ABOVE = nil

---@alias dmmdigitizeanalogtriggerpulsepolarityvalue
---|`dmm.POLARITY_BELOW`
---|`dmm.POLARITY_ABOVE`



--- **This attribute defines the polarity of the pulse that generates an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only used when analog trigger mode is pulse.Determines if the analog trigger occurs when the pulse is above the defined signal level or below the defined signal level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41402.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.digitize.analogtrigger.pulse.level = 5
--- dmm.digitize.analogtrigger.pulse.width = 30e-6
--- dmm.digitize.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.digitize.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
---@type dmmdigitizeanalogtriggerpulsepolarityvalue
dmm.digitize.analogtrigger.pulse.polarity = 0



--- **This attribute defines the pulse level that generates an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41416.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.digitize.func = dmm.FUNC_DIGITIZE_VOLTAGE
--- dmm.digitize.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.digitize.analogtrigger.pulse.level = 5
--- dmm.digitize.analogtrigger.pulse.width = 30e-6
--- dmm.digitize.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.digitize.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set function to digitize voltage.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
dmm.digitize.analogtrigger.pulse.level = 0

---@class dmm.measure.analogtrigger.pulse
dmm.measure.analogtrigger.pulse = {}



dmm.CONDITION_LESS = nil
dmm.CONDITION_GREATER = nil

---@alias dmmmeasureanalogtriggerpulseconditionvalue
---|`dmm.CONDITION_LESS`
---|`dmm.CONDITION_GREATER`



--- **This attribute defines if the pulse must be greater than or less than the incoming pulse must have a duration greater than or less than the threshold pulse width before an analog trigger is generated.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41387.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.measure.analogtrigger.pulse.level = 5
--- dmm.measure.analogtrigger.pulse.width = 30e-6
--- dmm.measure.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.measure.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
---@type dmmmeasureanalogtriggerpulseconditionvalue
dmm.measure.analogtrigger.pulse.condition = 0



--- **This attribute defines the pulse level that generates an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to pulse.To use the analog trigger with the measure functions, a range must be set (you cannot use autorange) and autozero must be disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41404.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.measure.analogtrigger.pulse.level = 5
--- dmm.measure.analogtrigger.pulse.width = 30e-6
--- dmm.measure.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.measure.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
dmm.measure.analogtrigger.pulse.level = 0



--- **This attribute defines the threshold value for the pulse width.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This option is only available when the analog trigger mode is set to pulse.This option sets either the minimum or maximum pulse width that generates an analog trigger event. The value of pulse condition determines whether this value is interpreted as the minimum or maximum pulse width.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41412.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.measure.analogtrigger.pulse.level = 5
--- dmm.measure.analogtrigger.pulse.width = 30e-6
--- dmm.measure.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.measure.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
dmm.measure.analogtrigger.pulse.width = 0


dmm.POLARITY_BELOW = nil
dmm.POLARITY_ABOVE = nil

---@alias dmmmeasureanalogtriggerpulsepolarityvalue
---|`dmm.POLARITY_BELOW`
---|`dmm.POLARITY_ABOVE`



--- **This attribute defines the polarity of the pulse that generates an analog trigger event.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only used when analog trigger mode is pulse.Determines if the analog trigger occurs when the pulse is above the defined signal level or below the defined signal level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41414.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- dmm.measure.func = dmm.FUNC_DC_VOLTAGE
--- dmm.measure.range = 10
--- dmm.measure.autozero.enable = dmm.OFF
--- dmm.measure.analogtrigger.mode = dmm.MODE_PULSE
--- dmm.measure.analogtrigger.pulse.level = 5
--- dmm.measure.analogtrigger.pulse.width = 30e-6
--- dmm.measure.analogtrigger.pulse.condition = dmm.CONDITION_LESS
--- dmm.measure.analogtrigger.pulse.polarity = dmm.POLARITY_BELOW
--- 
--- --Set measure function to DC voltage.
--- --Set range to 10 V.
--- --Disable autozero.
--- --Set the analog trigger mode to pulse.
--- --Set the analog trigger level to 5 V.
--- --Set the analog trigger pulse width to 30 us.
--- --Set the condition to be detect trigger within the pulse width.
--- --Set the trigger to occur when the pulse is below the level.
--- ```
---@type dmmmeasureanalogtriggerpulsepolarityvalue
dmm.measure.analogtrigger.pulse.polarity = 0

---@class dmm.digitize.analogtrigger.edge
dmm.digitize.analogtrigger.edge = {}




--- **This attribute defines the signal level that generates the analog trigger event for the edge trigger mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only available when the analog trigger mode is set to edge.The edge level can be set to any value in the active measurement range. See the DMM7510 specifications for more information on the resolution and accuracy of the analog trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41394.htm"])
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
--- ```
dmm.digitize.analogtrigger.edge.level = 0


dmm.SLOPE_FALLING = nil
dmm.SLOPE_RISING = nil

---@alias dmmdigitizeanalogtriggeredgeslopevalue
---|`dmm.SLOPE_FALLING`
---|`dmm.SLOPE_RISING`



--- **This attribute defines the slope of the analog trigger edge.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to edge.Rising causes an analog trigger event when the analog signal trends from below the analog signal level to above the level.Falling causes an analog trigger event when the signal trends from above to below the level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43708.htm"])
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
--- ```
---@type dmmdigitizeanalogtriggeredgeslopevalue
dmm.digitize.analogtrigger.edge.slope = 0

---@class dmm.digitize.analogtrigger.window
dmm.digitize.analogtrigger.window = {}



dmm.DIRECTION_LEAVE = nil
dmm.DIRECTION_ENTER = nil

---@alias dmmdigitizeanalogtriggerwindowdirectionvalue
---|`dmm.DIRECTION_LEAVE`
---|`dmm.DIRECTION_ENTER`



--- **This attribute defines if the analog trigger occurs when the signal enters or leaves the defined high and low analog signal level boundaries.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to window.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41398.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41406.htm"])
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
--- ```
dmm.digitize.analogtrigger.window.levelhigh = 0



--- **This attribute defines the lower boundary of the analog trigger window.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to window.The low level must be less than the high level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41724.htm"])
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
--- ```
dmm.digitize.analogtrigger.window.levellow = 0

---@class dmm.measure.analogtrigger.edge
dmm.measure.analogtrigger.edge = {}




--- **This attribute defines the signal level that generates the analog trigger event for the edge trigger mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command is only available when the analog trigger mode is set to edge.The edge level can be set to any value in the active measurement range. See the DMM7510 specifications for more information on the resolution and accuracy of the analog trigger.To use the analog trigger with the measure functions, a range must be set (you cannot use autorange) and autozero must be disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41407.htm"])
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
--- ```
dmm.measure.analogtrigger.edge.level = 0


dmm.SLOPE_FALLING = nil
dmm.SLOPE_RISING = nil

---@alias dmmmeasureanalogtriggeredgeslopevalue
---|`dmm.SLOPE_FALLING`
---|`dmm.SLOPE_RISING`



--- **This attribute defines the slope of the analog trigger edge.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to edge.Rising causes an analog trigger event when the analog signal trends from below the analog signal level to above the level.Falling causes an analog trigger event when the signal trends from above to below the level.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41410.htm"])
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
--- ```
---@type dmmmeasureanalogtriggeredgeslopevalue
dmm.measure.analogtrigger.edge.slope = 0

---@class dmm.measure.analogtrigger.window
dmm.measure.analogtrigger.window = {}



dmm.DIRECTION_LEAVE = nil
dmm.DIRECTION_ENTER = nil

---@alias dmmmeasureanalogtriggerwindowdirectionvalue
---|`dmm.DIRECTION_LEAVE`
---|`dmm.DIRECTION_ENTER`



--- **This attribute defines if the analog trigger occurs when the signal enters or leaves the defined high and low analog signal level boundaries.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is only available when the analog trigger mode is set to window.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/41727.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43709.htm"])
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
--- ```
dmm.measure.analogtrigger.window.levelhigh = 0



--- **This attribute defines the lower boundary of the analog trigger window.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Only available when the analog trigger mode is set to window.The high level must be greater than the low level.To use the analog trigger with the measure functions, a range must be set (you cannot use autorange) and autozero must be disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/43710.htm"])
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
--- ```
dmm.measure.analogtrigger.window.levellow = 0



--- **This function delays the execution of the commands that follow it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The instrument delays execution of the commands for at least the specified number of seconds and fractional seconds. However, the processing time may cause the instrument to delay 5 μs to 10 μs (typical) more than the requested delay.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/13949.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- beeper.beep(0.5, 2400)
--- delay(0.250)
--- beeper.beep(0.5, 2400)
--- 
--- --Emit a double-beep at 2400 Hz. The sequence is 0.5 s on, 0.25 s off, 0.5 s on.
--- dataqueue.clear()
--- dataqueue.add(35)
--- timer.cleartime()
--- delay(0.5)
--- dt = timer.gettime()
--- print("Delay time was " .. dt)
--- print(dataqueue.next())
--- 
--- --Clear the data queue, add 35 to it, and then delay 0.5 seconds before reading it.
--- --Output:
--- --Delay time was 0.500099
--- --35
--- ```
---@param seconds number The number of seconds to delay (0 to 100 ks)
function delay(seconds) end


--- **This function waits for all previously started overlapped commands to complete.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- There are two types of instrument commands:The waitcomplete() command suspends the execution of commands until the instrument operations of all previous overlapped commands are finished. This command is not needed for sequential commands.A group number may only be specified when this node is the master node.If no group is specified, the local group is used.If zero (0) is specified for the group, this function waits for all nodes in the system.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/13986.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/14769.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function exit() end


--- **This function prints data from tables or reading buffer subtables.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If startIndex is set to less than 1 or if endIndex is more than the size of the index, 9.910000e+37 is returned for each value outside the allowed index and an event is generated.If overlapped commands use the specified reading buffers and the commands are not complete (at least to the specified index), this function outputs data as it becomes available.When there are outstanding overlapped commands to acquire data, n refers to the index that the last entry in the table has after all the readings have completed.If you pass a reading buffer instead of a reading buffer subtable, the default subtable for that reading buffer is used.This command generates a single response message that contains all data.The output of printbuffer() is affected by the data format selected by format.data. If you set format.data to format.REAL32 or format.REAL64, you have fewer options for buffer elements. With these formats, the only buffer elements available are readings, relativetimestamps, and extravalues. If you request a buffer element that is not permitted for the selected data format, the instrument returns 9.91e37.You can use the bufferVar attributes that are listed in the following table with the print buffer command. For example, if testData is the buffer, you can use testData.dates attribute to print the date of each reading in the testData buffer.You can use bufferVar.n to retrieve the number of readings in the specified reading buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15057.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- dmm.measure.func = dmm.FUNC_DC_CURRENT
--- testData = buffer.make(200)
--- format.data = format.ASCII
--- format.asciiprecision = 6
--- trigger.model.load("SimpleLoop", 6, 0, testData)
--- trigger.model.initiate()
--- waitcomplete()
--- printbuffer(1, testData.n, testData.readings, testData.units,   testData.relativetimestamps)
--- 
--- --Reset the instrument.
--- --Set the measure function to DC current.
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
---@param bufferVar bufferMethods Name of first table or reading buffer subtable to print; may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer
---@param bufferVar2 any Second table or reading buffer subtable to print; may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/15058.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/17645.htm"])
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


--- **This function sets the operation complete (OPC) bit after all pending commands, including overlapped commands, have been executed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the operation complete bit in the Status Event Status Register to be set when all previously started local overlapped commands are complete. Note that each node independently sets its operation complete bits in its own status model. Any nodes that are not actively performing overlapped commands set their bits immediately. All remaining nodes set their own bits as they complete their own overlapped commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/29846.htm"])
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


--- **This function resets commands to their default settings and clears the buffers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The reset() command in its simplest form resets the entire TSP-enabled system, including the controlling node and all subordinate nodes.If you want to reset a specific instrument, use the node[N].reset() command. Also use the node[N].reset() command to reset an instrument on a subordinate node.When no value is specified for system, the default value is true.You can only reset the entire system using reset(true) if the node is the master. If the node is not the master node, executing this command generates an error event.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34054.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset(true)
--- 
--- --If the node is the master node, the entire system is reset; if the node is not the master node, an error event is generated.
--- ```
---@param system boolean If the node is the master, the entire system is reset
---@overload fun()
function reset(system) end


--- **This function creates a setup file that captures most of the present settings of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function does not automatically overwrite existing scripts with the same name. If scriptName is set to the name of an existing script, an event message is returned. You must delete the existing script before using the same script name. This includes the autoexec script, which runs automatically when the instrument power is turned on. You can set scriptName to autoexec, but you must delete the existing autoexec script first using the script.delete("autoexec") command.Once created, the script that contains the settings can be run and edited like any other script.
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/34589.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- createconfigscript("myConfigurationScript")
--- reset()
--- myConfigurationScript()
--- 
--- --Capture the present settings of the instrument into a script named myConfigurationScript.
--- --Reset the instrument.
--- --Restore the settings stored in myConfigurationScript.
--- ```
---@param scriptName any A string that represents the name of the script that will be created
function createconfigscript(scriptName) end


--- **This function checks for the presence of specific instrument functionality.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_DMM7510/89066.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(available(gpib))
--- 
--- --Returns true if GPIB communications are available. Returns false if GPIB communications are not available.
--- ```
---@return boolean presence If the functionality is present, returns true; if not, returns false
function available(functionality) end

---@type bufferMethods
defbuffer1 = {}

---@type bufferMethods
defbuffer2 = {}