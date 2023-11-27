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

---@class userstring
userstring = {}




--- **This function adds a user-defined string to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function associates the string value with the string name and stores this key-value pair in nonvolatile memory.Use the userstring.get() function to retrieve the value associated with the specified name.You can use the userstring functions to store custom, instrument-specific information in the instrument, such as department number, asset number, or manufacturing plant location.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/13987.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/13988.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/13989.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/13990.htm"])
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




--- **This function returns to a previous version of the Model 2461 firmware.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function allows you to revert to an earlier version of the firmware.When you send this function, the instrument searches the USB flash drive in the front-panel USB port for an upgrade file. If the file is found, the instrument performs the upgrade. An error is returned if an upgrade file is not found.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14062.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function upgrade.previous() end


--- **This function upgrades the Model 2461 firmware.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When upgrade.unit() is used, the firmware is only loaded if the version of the firmware is newer than the existing version. If the version is older or at the same revision level, it is not upgraded.When you send this function, the instrument searches the USB flash drive in the front-panel USB port for an upgrade file. If the file is found, the instrument verifies that the file is a newer version. If the version is older or at the same revision level, it is not upgraded, although it does request a reboot. If it is a newer version, the instrument performs the upgrade. An error event message is returned if no upgrade file is found.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14063.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14073.htm"])
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
--- --6.0000000e+00
--- -- 
--- --Clear data and print how much data is available again.
--- --Output:
--- --0.0000000e+00
--- ```
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.clear(connectionID) end


--- **This function establishes a network connection with another LAN instrument or device through the LAN interface.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command connects a device to another device through the LAN interface. If the portNumber is 23, the interface uses the Telnet protocol and sets appropriate termination characters to communicate with the device.If a portNumber and initString are provided, it is assumed that the remote device is not TSP-enabled. The Model 2461 does not perform any extra processing, prompt handling, error handling, or sending of commands. In addition, the tspnet.tsp.* commands cannot be used on devices that are not TSP-enabled.If neither a portNumber nor an initString is provided, the remote device is assumed to be a Keithley Instruments TSP-enabled device. Depending on the state of the tspnet.tsp.abortonconnect attribute, the Model 2461 sends an abort command to the remote device on connection. The Model 2461 also enables TSP prompts on the remote device and event management. The Model 2461 places remote errors and events from the TSP-enabled device in its own event queue and prefaces these events with Remote Error, followed by an event description. Do not manually change either the prompt functionality (localnode.prompts) or show events by changing localnode.showerrors or localnode.showevents on the remote TSP-enabled device. If you do this, subsequent tspnet.tsp.* commands using the connection may fail.You can simultaneously connect to a maximum of 32 remote devices.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14074.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14076.htm"])
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
--- This command sends a command string to the remote instrument. A termination is added to the command string when it is sent to the remote instrument (tspnet.termination()). You can also specify a format string, which causes the command to wait for a response from the remote instrument. The Model 2461 decodes the response message according to the format specified in the format string and returns the message as return values from the function (see tspnet.read() for format specifiers).When this command is sent to a TSP-enabled instrument, the Model 2461 suspends operation until a timeout error is generated or until the instrument responds. The TSP prompt from the remote instrument is read and discarded. The Model 2461 places any remotely generated errors and events into its event queue. When the optional format string is not specified, this command is equivalent to tspnet.write(), except that a termination is automatically added to the end of the command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14077.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14078.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- deviceID = tspnet.connect("192.0.2.1")
--- print(tspnet.idn(deviceID))
--- tspnet.disconnect(deviceID)
--- 
--- --Assume the instrument is at IP address 192.0.2.1.
--- --The output that is produced when you connect to the instrument and read the identification string may appear as:
--- --KEITHLEY INSTRUMENTS,MODEL 2461,00000170,1.0.0a
--- ```
---@return string idnString The returned *IDN? string
---@param connectionID tspnetConnectionID The connection ID returned from tspnet.connect()
function tspnet.idn(connectionID) end


--- **This function reads data from a remote device.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads available data from the remote instrument and returns responses for the specified number of arguments.The format string can contain the following specifiers:A maximum of 10 format specifiers can be used for a maximum of 10 return values.If formatString is not provided, the command returns a string that contains the data until a new line is reached. If no data is available, the Model 2461 pauses operation until the requested data is available or until a timeout error is generated. Use tspnet.timeout to specify the timeout period.When the Model 2461 reads from a TSP-enabled remote instrument, the Model 2461 removes Test Script Processor (TSP®) prompts and places any errors or events it receives from the remote instrument into its own event queue. The Model 2461 prefaces events and errors from the remote device with Remote Error, followed by the event number and description.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14079.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14080.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14081.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14084.htm"])
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
--- The tspnet.write() function sends inputString to the remote instrument. It does not wait for command completion on the remote instrument.The Model 2461 sends inputString to the remote instrument exactly as indicated. The inputString must contain any necessary new lines, termination, or other syntax elements needed to complete properly.Because tspnet.write() does not process output from the remote instrument, do not send commands that generate too much output without processing the output. This command can stop executing if there is too much unprocessed output from previous commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14089.htm"])
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
tspnet.TERM_CR = nil
tspnet.TERM_CRLF = nil
tspnet.TERM_LFCR = nil

---@alias tspnetterminationtype
---|`tspnet.TERM_LF`
---|`tspnet.TERM_CR`
---|`tspnet.TERM_CRLF`
---|`tspnet.TERM_LFCR`


tspnet.TERM_LF = nil
tspnet.TERM_CR = nil
tspnet.TERM_CRLF = nil
tspnet.TERM_LFCR = nil

---@alias tspnetterminationtermSequence
---|`tspnet.TERM_LF`
---|`tspnet.TERM_CR`
---|`tspnet.TERM_CRLF`
---|`tspnet.TERM_LFCR`



--- **This function sets the device line termination sequence.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets and gets the termination character sequence that is used to indicate the end of a line for a TSP-Net connection.Using the termSequence parameter sets the termination sequence. The present termination sequence is always returned.For the termSequence parameter, use the same values listed in the table above for type. There are four possible combinations, all of which are made up of line feeds (LF or 0x10) and carriage returns (CR or 0x13). For TSP-enabled devices, the default is tspnet.TERM_LF. For devices that are not TSP-enabled, the default is tspnet.TERM_CRLF.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/34363.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14654.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14655.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14656.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14657.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14658.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14808.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14810.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14811.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14812.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14814.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14815.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14824.htm"])
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
--- The address can be set to any address value from 1 to 30. However, the address must be unique in the system. It cannot conflict with an address that is assigned to another instrument or to the GPIB controller.A new GPIB address takes effect when the command to change it is processed. If there are response messages in the output queue when this command is processed, they must be read at the new address.If command messages are being queued (sent before this command has executed), the new settings may take effect in the middle of a subsequent command message, so care should be exercised when setting this attribute from the GPIB interface.You should allow sufficient time for the command to be processed before attempting to communicate with the instrument again.The reset() function does not affect the GPIB address.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14860.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14893.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25725.htm"])
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
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The MAC address is a character string representing the MAC address of the instrument in hexadecimal notation. The string includes colons that separate the address octets.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28423.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.macaddress)
--- 
--- --Returns the MAC address. For example:
--- --08:00:11:00:00:57
--- ```
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15009.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15010.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15020.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
--- 
--- --Outputs the model number of the local node. For example:
--- --2461 
--- ```


--- **This function sets the date and time of the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Internally, the instrument bases time in UTC time. UTC time is specified as the number of seconds since Jan 1, 1970, UTC. You can use UTC time from a local time specification, or you can use UTC time from another source (for example, your computer).When called without a parameter (the first form), the function returns the current time.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25726.htm"])
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
eventlog.SEV_WARN = nil
eventlog.SEV_ERROR = nil
eventlog.SEV_WARN = nil
eventlog.SEV_INFO = nil
eventlog.SEV_INFO = nil
eventlog.SEV_ERROR = nil
eventlog.SEV_INFO = nil
eventlog.SEV_WARN = nil
eventlog.SEV_ALL = nil

---@alias localnodeshoweventserrorMode
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_ERROR`
---|`eventlog.SEV_INFO`
---|`eventlog.SEV_WARN`
---|`eventlog.SEV_ALL`



--- **This attribute sets whether or not the instrument automatically outputs generated events to the remote interface.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Enable this attribute to have the instrument output generated events to the remote interface.Events are output after a command message is executed but before prompts are issued (if prompts are enabled with localnode.prompts).If this attribute is disabled, use eventlog.next() to retrieve unread events from the event log.Events are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable show events when the GPIB connection is active, they will not be enabled for a subsequent USB connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30504.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32416.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32595.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32597.htm"])
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
--- The instrument automatically detects the power line frequency when the instrument is powered on. Power line frequency can be 50 Hz or 60 Hz.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/32628.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33140.htm"])
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


localnode.DISABLEG = nil
localnode.ENABLE = nil

---@alias localnodepromptsprompting
---|`localnode.DISABLEG`
---|`localnode.ENABLE`



--- **This attribute determines if the instrument generates prompts in response to command messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the prompting mode is enabled, the instrument generates prompts when the instrument is ready to take another command. Because the prompt is not generated until the previous command completes, enabling prompts provides handshaking with the instrument to prevent buffer overruns.When prompting is enabled, the instrument might generate the following prompts:Commands do not generate prompts. The instrument generates prompts in response to command completion.Prompts are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable prompts when the LAN connection is active, they will not be enabled for a subsequent USB connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/33148.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34629.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.password = "N3wpa55w0rd"
--- 
--- --Changes the password to N3wpa55w0rd.
--- ```

localnode.DISABLEE = nil
localnode.ENABLE = nil

---@alias localnodeprompts4882prompting
---|`localnode.DISABLEE`
---|`localnode.ENABLE`



--- **This attribute enables and disables the generation of prompts for IEEE Std 488.2 common commands.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is enabled, the IEEE Std 488.2 common commands generate prompts if prompting is enabled with the localnode.prompts attribute. If localnode.prompts4882 is enabled, limit the number of *trg commands sent to a running script to 50 regardless of the setting of the localnode.prompts attribute.When this attribute is disabled, IEEE Std 488.2 common commands will not generate prompts. When using the *trg command with a script that executes trigger.wait() repeatedly, disable prompting to avoid problems associated with the command interface input queue filling.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/40235.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.prompts4882 = localnode.DISABLE
--- 
--- --Disables IEEE Std 488.2 common command prompting.
--- ```
---@type localnodeprompts4882prompting
localnode.prompts4882 = 0

---@class tsplink
tsplink = {}




--- **This attribute contains the group number of a TSP-Link node. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To remove the node from all groups, set the attribute value to 0.When the node is turned off, the group number for that node changes to 0.The master node can be assigned to any group. You can also include other nodes in the group that includes the master. Note that any nodes that are set to 0 are automatically included in the group that contains the master node, regardless of the group that is assigned to the master node.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/15285.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15287.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15289.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15291.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15302.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
--- 
--- --Sets the synchronization lines 1 and 2 high (binary 011).
--- ```
---@param data number Value to write to the port (0 to 7)
function tsplink.writeport(data) end


--- **This function initializes all instruments and enclosures in the TSP-Link system.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the only node on the TSP-Link network is the one running the command and expectedNodes is not provided, this function generates an error event. If you set expectedNodes to 1, the node is initialized.If you include expectedNodes, if nodesFound is less than expectedNodes, an error event is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30551.htm"])
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
---@return any nodesFound The number of nodes found on the system, including the node on which the command is running
---@overload fun():any
---@overload fun(expectedNodes:any):any
function tsplink.initialize() end


--- **This attribute reads the node number assigned to the master node.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This attribute returns the node number of the master in a set of instruments connected using TSP-Link.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/32565.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- LinkMaster = tsplink.master
--- 
--- --Store the TSP-Link master node number in a variable called LinkMaster.
--- ```
---@class trigger
trigger = {}




--- **This function clears any pending command triggers.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A command trigger indicates if a trigger event has been detected over a command interface since the last trigger.wait() command was sent. Command triggers are generated by:trigger.clear() clears the command triggers and discards the history of trigger events.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25637.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25639.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30574.htm"])
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
--- The following table shows the constants for the events.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31093.htm"])
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
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31094.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
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
--- smu.measure.configlist.create("countactive")
--- smu.measure.count = 2
--- smu.measure.configlist.store("countactive")  -- index1
--- smu.measure.count = 10
--- smu.measure.configlist.store("countactive")  -- index2
--- smu.measure.count = 3
--- smu.measure.configlist.store("countactive")  -- index3
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
--- --Set the measure count to 2 (replace smu.measure.count with smu.digitize.count if using a digitize function.)
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


smu.OFFT = nil
smu.ON = nil

---@alias triggermodelsetblocktriggerBLOCK_SOURCE_OUTPUTstate
---|`smu.OFFT`
---|`smu.ON`



--- **This function defines a trigger block that turns the output source on or off.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31095.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(2, trigger.BLOCK_SOURCE_OUTPUT, smu.ON)
--- 
--- --Set trigger model to turn the source on when it reaches block 2.
--- ```
--- Additional paramteres are:
--- - *state*: Turn the source off<br>
---    ```smu.OFFT```<br>
---    ```smu.ON```<br>
trigger.BLOCK_SOURCE_OUTPUT = 0



--- **This function recalls the system settings that are stored in a source or measure configuration list, or both a source and measure configuration list.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If two configuration lists are specified with this command, they must not be of the same type. For example, if the first configuration list is a measure configuration list, the second configuration list must be a source configuration list. The order of the configuration lists does not matter with this command, as long as they are of the opposite type.When the trigger model reaches a configuration recall block, the settings in the specified configuration list are recalled if a single configuration list is specified. If both measure and source configuration lists are specified, measure and source settings are recalled from the next index in each list when this block is reached. The index numbers recalled may not match; it depends on the number of indexes in each list and what index number each list is on.You can restore a specific set of configuration settings in the configuration list by defining the index.If you need to swap the source and measure configuration lists, you need to delete this block and create a new Config List Recall block.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31096.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(3, trigger.BLOCK_CONFIG_RECALL, "measTrigList", 5)
--- 
--- --Configure trigger block 3 to load index 5 from the configuration list named measTrigList.
--- trigger.model.setblock(3, trigger.BLOCK_CONFIG_RECALL, "measTrigList", 5,
---    "sourTrigList")   
--- print(trigger.model.getblocklist())
--- 
--- --Configure trigger block 3 to load index 5 from the configuration list named measTrigList and load index 1 from the configuration list name sourTrigList.
--- --Query the configuration of the block.
--- --Output:
--- --5) CONFIG_RECALL   CONFIG_LIST: measTrigList and sourTrigList  INDEX: 5 and 1
--- ```
--- Additional paramteres are:
--- - *configurationList*: A string that defines the source or measure configuration list to recall<br>
--- - *index*: The index in the configuration list to recall; default is 1<br>
--- - *optionalConfigList*: A string that defines the second configuration list to recall the index from; must be the opposite type of list than the first; for example, if the first configuration list is a measure list, the second configuration list must be a source list<br>
--- - *optionalIndex*: The index to recall from the second configuration list; defaults to 1<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_CONFIG_RECALL, configurationList)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_CONFIG_RECALL, configurationList, index)
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_CONFIG_RECALL, configurationList, index, optionalConfigList)
trigger.BLOCK_CONFIG_RECALL = 0



--- **This function recalls the settings at the next index of a source or measure configuration list, or both a source and measure configuration list.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If two configuration lists are specified with this command, they must not be of the same type. For example, if the first configuration list is a measure configuration list, the second configuration list must be a source configuration list. The order of the configuration lists does not matter with this command, as long as they are of the opposite type.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31097.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(5, trigger.BLOCK_CONFIG_NEXT, "measTrigList")
--- 
--- --Configure trigger block 5 to load the next index in the configuration list named measTrigList.
--- trigger.model.load("Empty")
--- trigger.model.setblock(1, trigger.BLOCK_CONFIG_RECALL, "measTrigList")
--- trigger.model.setblock(2, trigger.BLOCK_BUFFER_CLEAR)
--- trigger.model.setblock(3, trigger.BLOCK_CONFIG_NEXT, "measTrigList")
--- print(trigger.model.getblocklist())
--- 
--- --Clear the trigger model.
--- --Recall index 1 of a configuration list named measTrigList.
--- --Clear reading buffer named defbuffer1.
--- --Recall the second index of a configuration list named measTrigList.
--- --Output:
--- --1) CONFIG_RECALL         CONFIG_LIST: measTrigList  INDEX: 1
--- --2) BUFFER_CLEAR          BUFFER: defbuffer1
--- --3) CONFIG_NEXT           CONFIG_LIST: measTrigList
--- trigger.model.setblock(7, trigger.BLOCK_CONFIG_NEXT, "measTrigList", "sourTrigList")
--- 
--- --Configure trigger block 7 to load the next index in both the configuration list named measTrigList and the configuration list named sourTrigList. 
--- ```
--- Additional paramteres are:
--- - *configurationList*: A string that defines the source or measure configuration list to recall<br>
--- - *optionalConfigList*: The name of the second configuration list to recall the index from; must be the opposite type of list than the first; for example, if the first configuration list is a measure list, the second configuration list must be a source list<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_CONFIG_NEXT, configurationList)
trigger.BLOCK_CONFIG_NEXT = 0



--- **This function defines a trigger model block that recalls the settings stored at the previous index in a source or measure configuration list, or both a source and measure configuration list.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- If two configuration lists are specified with this command, they must not be of the same type. For example, if the first configuration list is a measure configuration list, the second configuration list must be a source configuration list. The order of the configuration lists does not matter with this command, as long as they are of the opposite type.The Config List Prev block defines a trigger model block that recalls the settings stored at the previous index in a source or measure configuration list if a single configuration list is specified. If both measure and source configuration lists are specified, measure and source settings are each recalled from the previous index in each list when this block is reached. The index numbers recalled may not match; it depends on the number of indexes in each list and what index number each list is on.The configuration list previous index trigger block type recalls the previous index in a configuration list. It configures the source or measure settings of the instrument based on the settings at that index. The trigger model executes the settings at that index before the next block is executed.The first time the trigger model encounters this block, the last index in the configuration list is recalled if the list has not already had an index recalled by the recall block command in an earlier trigger model block. If the configuration list has recalled an index with the recall block, the previous index in the list is called instead of the last. For example, the recall block recalls index 1 by default, so if the trigger model uses a recall block before this one, the first time the previous block is reached after that recall, the last index is recalled. However, if the recall block recalled index 3, the previous block would recall index 2. Each subsequent time trigger model execution reaches a configuration list previous block for this configuration list, it goes backward one index. When the first index in the list is reached, it goes to the last index in the configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31098.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(8, trigger.BLOCK_CONFIG_PREV, "measTrigList")
--- 
--- --Configure trigger block 8 to load the previous index in the configuration list named measTrigList.
--- trigger.model.load("Empty")
--- trigger.model.setblock(1, trigger.BLOCK_CONFIG_RECALL, "measTrigList", 3)
--- trigger.model.setblock(2, trigger.BLOCK_BUFFER_CLEAR)
--- trigger.model.setblock(3, trigger.BLOCK_CONFIG_PREV, "measTrigList")
--- print(trigger.model.getblocklist())
--- 
--- --Clear the trigger model.
--- --Recall index 3 of a configuration list named measTrigList.
--- --Clear reading buffer named defbuffer1.
--- --Then, recall the second index of a configuration list named measTrigList.
--- --Output:
--- --1) CONFIG_RECALL         CONFIG_LIST: measTrigList  INDEX: 3
--- --2) BUFFER_CLEAR          BUFFER: defbuffer1
--- --3) CONFIG_PREV           CONFIG_LIST: measTrigList
--- trigger.model.setblock(7, trigger.BLOCK_CONFIG_PREV, "measTrigList", "sourTrigList")
--- 
--- --Configure trigger block 7 to load the previous index in both the configuration list named measTrigList and the configuration list named sourTrigList.
--- ```
--- Additional paramteres are:
--- - *configurationList*: A string that defines the source or measure configuration list to recall<br>
--- - *optionalConfigList*: A string that defines the second configuration list to recall the index from; must be the opposite type of list than the first; for example, if the first configuration list is a measure list, the second configuration list must be a source list<br>
--
--- Overloads are:
--- - trigger.model.setblock(blockNumber, trigger.BLOCK_CONFIG_PREV, configurationList)
trigger.BLOCK_CONFIG_PREV = 0


trigger.USER_DELAY_M = nil
trigger.USER_DELAY_S = nil

---@alias triggermodelsetblocktriggerBLOCK_DELAY_DYNAMICuserDelay
---|`trigger.USER_DELAY_M`
---|`trigger.USER_DELAY_S`



--- **This function adds a user delay to the execution of the trigger model.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- Each measure function can have up to five unique user delay times (M1 to M5). Digitize user delays are handled as measure user delays, so you can have a total of five measure and digitize user delays. Each source function can also have up to five unique user delay times (S1 to S5). The delay time is set by the user-delay command, which is only available over a remote interface. Though the trigger model can be used with any function, the user delay is set per function. Make sure you are setting the delay for the function you intend to use with the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31101.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.userdelay[1] = 5
--- trigger.model.setblock(1, trigger.BLOCK_SOURCE_OUTPUT, smu.ON)
--- trigger.model.setblock(2, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M1)
--- trigger.model.setblock(3, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(4, trigger.BLOCK_SOURCE_OUTPUT, smu.OFF)
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_COUNTER, 10, 1)
--- trigger.model.initiate()
--- 
--- --Set user delay for measure 1 to 5 s.
--- --Set trigger block 1 to turn the source output on.
--- --Set trigger block 2 to a dynamic delay that calls measure user delay 1.
--- --Set trigger block 3 to make a measurement.
--- --Set trigger block 4 to turn the source output off.
--- --Set trigger block 5 to branch to block 1 ten times.
--- --Start the trigger model.
--- ```
--- Additional paramteres are:
--- - *userDelay*: The number of the user delay<br>
---    ```trigger.USER_DELAY_M```<br>
---    ```trigger.USER_DELAY_S```<br>
trigger.BLOCK_DELAY_DYNAMIC = 0



--- **This function defines a trigger model block that sets the lines on the digital I/O port high or low.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The bit mask defines the bits in the pattern that are driven high or low. A binary 1 in the bit mask indicates that the corresponding I/O line should be driven according to the bit pattern. To drive all lines, specify all ones (63, 0x3F, 0b111111) or omit this parameter. If the bit for a line in the bit pattern is set to 1, the line is driven high. If the bit is set to 0 in the bit pattern, the line is driven low.For this block to work as expected, make sure you configure the trigger type and line state of the digital line for use with the trigger model (use the digital line mode command).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31102.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31103.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31104.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31105.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31107.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31108.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31109.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31110.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31112.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31114.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31347.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/35428.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/35431.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/41689.htm"])
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


smu.OFFT = nil
smu.ON = nil

---@alias triggermodelsetblocktriggerBLOCK_SOURCE_PULSE_OUTPUTstate
---|`smu.OFFT`
---|`smu.ON`



--- **This function defines a pulse trigger block that turns the pulse source on or off. **
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When you list trigger blocks, this block is listed as PULSE_OUTPUT.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63477.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.setblock(4, trigger.BLOCK_SOURCE_OUTPUT, smu.ON)
--- trigger.model.setblock(5, trigger.BLOCK_SOURCE_PULSE_OUTPUT, smu.ON)
--- 
--- --Set trigger model to turn the source on when it reaches block 4 and source pulse on when it reaches block 5.
--- print(trigger.model.getblocklist())
--- 
--- --Query the configuration of the blocks in the trigger model.
--- --Output:
--- --4) SOURCE_OUTPUT         OUTPUT: ON
--- --5) SOURCE_PULSE_OUTPUT   PULSE OUTPUT: ON
--- ```
--- Additional paramteres are:
--- - *state*: Turn the source pulse off<br>
---    ```smu.OFFT```<br>
---    ```smu.ON```<br>
trigger.BLOCK_SOURCE_PULSE_OUTPUT = 0


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
---[command help](command:kic.viewHelpDocument?["Commands_2461/88463.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.continuous = trigger.CONT_OFF
--- 
--- --When the instrument starts up, the measurement method is set to idle.
--- ```
---@type triggercontinuoussetting
trigger.continuous = 0

---@class scriptVar
scriptVar = {}




--- **This function runs a script.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The scriptVar.run() function runs the script referenced by scriptVar. You can also run the script by using scriptVar().
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/16856.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/16863.htm"])
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
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The body of the script is a single string with lines separated by the new line character.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/33395.htm"])
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
---@class smu
smu = {}



smu.TERMINALS_FRONTU = nil
smu.TERMINALS_REAR = nil

---@alias smuterminalsterminals
---|`smu.TERMINALS_FRONTU`
---|`smu.TERMINALS_REAR`



--- **This attribute describes which set of input and output terminals the instrument is using.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command selects which set of input and output terminals the instrument uses. You can select front panel or rear panel terminals.If the output is on when you change from one set of terminals to the other, the output is turned off.This command replaces the smu.measure.terminals command, which is deprecated.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25737.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.terminals = smu.TERMINALS_FRONT
--- 
--- --Use the front-panel terminals for measurements.
--- ```
---@type smuterminalsterminals
smu.terminals = 0



--- **This function turns off the output and resets the commands that begin with smu. to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function turns off the output and resets the commands that begin with smu. to their default settings. It also deletes source and measure configuration lists.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30521.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.reset()
--- 
--- --Turns off the output and resets the SMU commands to their default settings.
--- ```
function smu.reset() end

smu.FASTRANGE_OFF = nil
smu.FASTRANGE_ON = nil
smu.FASTRANGE_PERSIST = nil
smu.ON = nil

---@alias smufastrangechangestate
---|`smu.FASTRANGE_OFF`
---|`smu.FASTRANGE_ON`
---|`smu.FASTRANGE_PERSIST`
---|`smu.ON`



--- **This attribute allows you to suppress checks that are normally done before range changes.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the Model 2461 changes ranges, it normally performs check for issues such as transients or overshoots to provide optimum measurements. When fast range change is set to on or persist, the instrument bypasses the normal checks when the range changes. Depending on your application, this can reduce the time required for measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91593.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- -- Set fast range change on.
--- smu.fastrangechange = smu.FASTRANGE_ON
--- -- Reset the instrument.reset()
--- -- Show that fast range change is set to off after the reset.
--- print(smu.fastrangechange)
--- -- Set fast range change to persist through a reset.
--- smu.fastrangechange = smu.FASTRANGE_PERSIST
--- -- Reset the instrument.
--- reset()-- Show that fast range change is set to on after the reset.
--- print(smu.fastrangechange)
--- 
--- --This example demonstrates the difference between the smu.FASTRANGE_ON and smu.FASTRANGE_PERSIST options.
--- ```
---@type smufastrangechangestate
smu.fastrangechange = 0


smu.OFF = nil
smu.ON = nil

---@alias smupriorityvoltagestate
---|`smu.OFF`
---|`smu.ON`



--- **This attribute changes the method the instrument uses to select the power supply rail that drives the output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The Model 2461 uses three internal power supply rails to drive the output. The selection of which rail is determined by the limit range setting. To seamlessly supply the requested output voltage for the maximum current allowed, the instrument selects the highest power supply rail that supports the voltage for the current. Therefore, when the voltage priority is off, the selection of the rails is determined as shown in the following table.In cases where a test sequence switches frequently between low and high current ranges, there is a lot of switching between the rails, which can slow measurement speed.For tests that are low voltage, the switching is not necessary. In this case, you can turn voltage priority on to change the selection of the power supply rail to be based on the voltage range instead of the current range. When voltage priority is on, the selection of the rails is determined as shown in the following table.This allows low voltage tests to change from low to high current ranges with no rail switching. Depending on the test sequence, this can result in significant time savings.Turning voltage priority on if the test sequency uses more voltage range changes could cause more rail switching, which will result in a longer test times.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91596.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.priorityvoltage = smu.ON
--- 
--- --Use the voltage range to select the rail.
--- ```
---@type smupriorityvoltagestate
smu.priorityvoltage = 0

---@class buffer
buffer = {}




--- **This function returns statistics from a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that was placed in the reading buffer.The instrument automatically updates reading buffer statistics as data is added to the reading buffer.When the reading buffer is configured to fill continuously and overwrite old data with new data, the buffer statistics include the data that was overwritten. To get statistics that do not include data that has been overwritten, define a large buffer size that will accommodate the number of readings you will make. The table returned from this function provides statistics at the time the function is called. Although the instrument continues to update the statistics, the table that is returned is not updated. To get fresh statistics, call this function again.The statsVar parameter contains the values described in the following table.If n equals zero (0), all other values are nil. If n equals 1, stddev is nil because the standard deviation of a sample size of 1 is undefined.Use the following command to get values from statsVar; a table with the following entries in it: n, min, max, mean, and stddev:Use the following commands to print these entries:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25624.htm"])
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

buffer.STYLE_COMPACTS = nil
buffer.STYLE_STANDARD = nil
buffer.STYLE_FULLS = nil
buffer.STYLE_WRITABLES = nil
buffer.STYLE_WRITABLE_FULL = nil

---@alias buffermakestyle
---|`buffer.STYLE_COMPACTS`
---|`buffer.STYLE_STANDARD`
---|`buffer.STYLE_FULLS`
---|`buffer.STYLE_WRITABLES`
---|`buffer.STYLE_WRITABLE_FULL`



--- **This function creates a user-defined reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot assign user-defined reading buffers the name defbuffer1 or defbuffer2. In addition, the buffer name must not already exist as a global variable, a local variable, table, or array.If you create a reading buffer that has the same name as an existing user-defined buffer, the existing buffer is overwritten by the new buffer. Any data in the existing buffer is lost.When you create a reading buffer, it becomes the active buffer. If you create two reading buffers, the last one you create becomes the active buffer.If you select 0, the instrument creates the largest reading buffer possible based on the available memory when the buffer is created.The default fill mode of a user-defined buffer is once. You can change it to continuous later.Once the buffer style is selected, it cannot be changed.Once you store the first reading in a compact buffer, you cannot change certain measurement settings, including range, display digits, and units; you must clear the buffer first.Not all remote commands are compatible with the compact, writable, and full writable buffer styles. Check the Details section of the command descriptions before using them with any of these buffer styles.Writable reading buffers are used to bring external data into the instrument. You cannot assign them to collect data from the instrument.You can change the buffer capacity for an existing buffer through the front panel or by using the bufferVar.capacity command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25629.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25642.htm"])
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
--- smu.measure.range = 10.0
--- -- Set the measurement count to 100.
--- smu.measure.count = 100
--- -- Set up reading buffers.
--- -- Ensure the default measurement buffer size matches the count.
--- defbuffer1.capacity = smu.measure.count
--- smu.measure.read()
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
--- The file name must specify the full path (including /usb1/). If included, the file extension must be set to .csv. If no file extension is specified, .csv is added.Examples of valid destination file names:The Model 2461 does not check for existing files when you save. Verify that you are using a unique name to avoid overwriting any existing CSV files on the flash drive.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/33210.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33981.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buf400 = buffer.make(400)
--- smu.measure.read(buf400)
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34560.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/73595.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- mathExp = buffer.make(200, buffer.STYLE_FULL)
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
---  
--- buffer.math(mathExp, buffer.UNIT_NONE, buffer.EXPR_MULTIPLY)
--- for x = 1, 3 do 
---      print("Reading: ", smu.measure.read(mathExp))
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
--- You can use custom units of measures in buffer math and writable buffers.If you specify more than two characters, the additional characters are ignored. Some characters are converted to other symbols:This unit is reset when power is cycled. It is not affected by reset.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/76401.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- mathExp = buffer.make(200, buffer.STYLE_FULL)
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- buffer.unit(buffer.UNIT_CUSTOM1, "fb") 
---  
--- buffer.math(mathExp, buffer.UNIT_CUSTOM1, buffer.EXPR_MULTIPLY)
--- for x = 1, 3 do 
---      print("Reading "..x..":", smu.measure.read(mathExp))
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
---@param UNIT_CUSTOMN bufferunitUNIT_CUSTOMN buffer.UNIT_CUSTOMN
---@param unitOfMeasure string A string that defines the custom unit; up to three characters; defaults are X for custom unit 1, Y for unit 2, and Z for unit 3
function buffer.unit(UNIT_CUSTOMN, unitOfMeasure) end
---@class timer
timer = {}




--- **This function measures the elapsed time since the timer was last cleared.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25635.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25636.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25702.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/27637.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/27658.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30552.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34730.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25719.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25722.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30502.htm"])
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
display.SCREEN_HISTOGRAMGRAPH = nil
display.SCREEN_GRAPH_SWIPESETTINGS = nil
display.SCREEN_SETTINGS_SWIPESOURCE = nil
display.SCREEN_SOURCE_SWIPESTATISTICS = nil
display.SCREEN_STATS_SWIPEUSER = nil
display.SCREEN_USER_SWIPEO = nil
display.SCREEN_PROCESSING = nil

---@alias displaychangescreenscreenName
---|`display.SCREEN_HOMEH`
---|`display.SCREEN_HOME_LARGE_READINGR`
---|`display.SCREEN_READING_TABLEG`
---|`display.SCREEN_GRAPHH`
---|`display.SCREEN_HISTOGRAMGRAPH`
---|`display.SCREEN_GRAPH_SWIPESETTINGS`
---|`display.SCREEN_SETTINGS_SWIPESOURCE`
---|`display.SCREEN_SOURCE_SWIPESTATISTICS`
---|`display.SCREEN_STATS_SWIPEUSER`
---|`display.SCREEN_USER_SWIPEO`
---|`display.SCREEN_PROCESSING`



--- **This function changes which front-panel screen is displayed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30503.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33260.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.sweeplinear("test", 1, 10, 10)
--- display.prompt(display.BUTTONS_YESNO, "Would you like to start the sweep now?") 
--- sweepTest, result = display.waitevent()
--- if result == display.BUTTON_YES then
---       trigger.model.initiate()   
--- end
--- display.prompt(display.BUTTONS_YESNO, "Would you like to switch to the Graph screen?")
--- promptID, result = display.waitevent()
--- if result == display.BUTTON_YES then
---    display.changescreen(display.SCREEN_GRAPH)
--- end
--- 
--- --Create a linear sweep.
--- --Display the prompt "Would you like to start the sweep now?"
--- --If the user presses Yes, the sweep starts.
--- --If the user presses No, the sweep does not start and the message is removed.
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33261.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.sweeplinear("test", 1, 10, 10)
--- display.prompt(display.BUTTONS_YESNO, "Would you like to start the sweep now?") 
--- sweepTest, result = display.waitevent()
--- if result == display.BUTTON_YES then
---       trigger.model.initiate()   
--- end
--- display.prompt(display.BUTTONS_YESNO, "Would you like to switch to the Graph screen?")
--- promptID, result = display.waitevent()
--- if result == display.BUTTON_YES then
---    display.changescreen(display.SCREEN_GRAPH)
--- end
--- 
--- --Create a linear sweep.
--- --Display the prompt "Would you like to start the sweep now?"
--- --If the user presses Yes, the sweep starts.
--- --If the user presses No, the sweep does not start, and the message is removed.
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33459.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/38977.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- removePrompt3 = display.prompt(display.BUTTONS_NONE, "This prompt will disappear in 3 seconds")
--- delay(3)
--- display.delete(removePrompt3)
--- 
--- --This example displays a prompt that is automatically removed in three seconds.
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/81840.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/25723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- file.mkdir("TestData")
--- 
--- --Create a new directory named TestData.
--- ```
---@param path string A string that contains the path of the directory
function file.mkdir(path) end

file.MODE_APPENDR = nil
file.MODE_READW = nil
file.MODE_WRITE = nil

---@alias fileopenaccessType
---|`file.MODE_APPENDR`
---|`file.MODE_READW`
---|`file.MODE_WRITE`



--- **This function opens a file on the USB flash drive for later reference.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path to the file to open must be absolute.The root folder of the USB flash drive has the following absolute path:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25724.htm"])
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

file.READ_LINER = nil
file.READ_NUMBERR = nil
file.READ_ALL = nil

---@alias filereadreadAction
---|`file.READ_LINER`
---|`file.READ_NUMBERR`
---|`file.READ_ALL`



--- **This function reads data from a file on the USB flash drive.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command reads data from a file.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/27929.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/27930.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/27934.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/27958.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Fix the range to 10 V
--- smu.measure.range = 10
---  
--- -- Set the measurement count to 100
--- smu.measure.count = 100
---  
--- -- Set up reading buffers
--- -- Ensure the default measurement buffer size matches the count
--- defbuffer1.capacity = 100
--- smu.measure.read()
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34905.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- local response
--- local xMax = 10
---  
--- for x = 1, xMax do
---  -- Make xMax readings and store them in defbuffer1.
---  smu.measure.read()
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



format.BIGENDIANL = nil
format.LITTLEENDIAN = nil

---@alias formatbyteorderorder
---|`format.BIGENDIANL`
---|`format.LITTLEENDIAN`



--- **This attribute sets the binary byte order for the data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the byte order in which data is written when you are printing data values with the printnumber() and printbuffer() functions. The byte order attribute is only used with the format.REAL32 and format.REAL64 data formats.If you are sending data to a computer with a Microsoft Windows operating system, select the format.LITTLEENDIAN byte order.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28048.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/28056.htm"])
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
--- --2.54000000000e+00
--- -- 
--- --2.54e+00
--- ```
format.asciiprecision = 0


format.ASCIIS = nil
format.REAL32D = nil
format.REAL64 = nil

---@alias formatdatavalue
---|`format.ASCIIS`
---|`format.REAL32D`
---|`format.REAL64`



--- **This attribute sets the data format for data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can control the precision of numeric values with the format.asciiprecision attribute. If format.REAL32 or format.REAL64 is selected, you can select the byte order with the format.byteorder attribute.The IEEE Std 754 binary formats use four bytes for single-precision values and eight bytes for double-precision values.When data is written with any of the binary formats, the response message starts with #0 and ends with a new line. When data is written with the ASCII format, elements are separated with a comma and space.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28063.htm"])
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
--- You can use the beeper of the instrument to provide an audible signal at a specific frequency and time duration. For example, you can use the beeper to signal the end of a lengthy sweep.Using this function from a remote interface does not affect audible errors or key click settings that were made from the Model 2461 front panel.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29636.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30567.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- statusByte = status.condition
--- print(statusByte)
--- 
--- --Returns statusByte.
--- --Example output:
--- --1.2900000e+02
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32386.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33635.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30981.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31368.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33286.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33290.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33394.htm"])
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
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The number of times that autocalibration has been run since the last factory calibration. The count restarts at 1 after a factory calibration.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/43634.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.count)
--- 
--- --Returns the number of times autocalibration has been run.
--- --Example output:
--- --15
--- ```


--- **This function immediately runs autocalibration and stores the constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- During autocalibration, a progress message is displayed on the front panel, all necessary autocalibration steps are completed, calibration constants are updated, and autocalibration last run information is updated. At completion, an event message is generated.When an autocalibration command is received, the instrument runs the autocalibration to completion before executing the next command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/43640.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- acal.run()
--- 
--- --Autocalibration starts running.
--- ```
function acal.run() end
---@class tspnet.tsp
tspnet.tsp = {}




--- **This function causes the TSP-enabled instrument to stop executing any of the commands that were sent to it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.Sends an abort command to the remote instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/14085.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14086.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14090.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- times =   tspnet.tsp.rbtablecopy(testTspdevice,
---    "testRemotebuffername.timestamps", 1, 3)
--- print(times)
--- 
--- --Copy the specified timestamps table for items 1 through 3, then display the table. Example output:
--- --01/01/2015 10:10:10.0000013,01/01/2015 10:10:10.0000233,01/01/2015 10:10:10.0000576
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32684.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15785.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15787.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15788.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/17666.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34428.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/35118.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15793.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15794.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15795.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15800.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15820.htm"])
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
--- --Set the trigger timer 4 stimulus to off.
--- --Set the timer event to occur when the timer delay elapses.
--- --Set the trigger timer 4 count to 20.
--- --Enable trigger timer 4.
--- -- 
--- --Clear the trigger model.
--- --Set trigger model block 1 to clear the buffer.
--- --Set trigger model block 2 to generate the notify 8 event.
--- --Set trigger model block 3 to wait for the trigger timer 4 to occur.
--- --Set trigger model block 4 to make a measurement and store it in default buffer 1.
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30576.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31076.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].reset()
--- 
--- --Resets the attributes associated with timer 1 to their default values.
--- ```
function triggertimerArr.reset() end

---@class smu.measure
smu.measure = {}



smu.FUNC_DC_VOLTAGEC = nil
smu.FUNC_DC_CURRENT = nil
smu.FUNC_RESISTANCEN = nil
smu.FUNC_NONE = nil

---@alias smumeasurefuncmFunction
---|`smu.FUNC_DC_VOLTAGEC`
---|`smu.FUNC_DC_CURRENT`
---|`smu.FUNC_RESISTANCEN`
---|`smu.FUNC_NONE`



--- **This attribute selects the active measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this command to the type of measurement you want to make.Reading this command returns the measure function that is presently active.When you select a function, settings for other commands that are related to the function become active. For example, assume that:If you return to the current function, the math function returns to reciprocal. If you then switch from the current function to the voltage function, the math function returns to percent. All attributes that begin with smu.measure. are saved with the active measure function unless otherwise indicated in the command description.If a digitize measurement function is selected, this returns smu.FUNC_NONE. The smu.FUNC_NONE setting is made automatically if you select a function using the smu.digitize.func command or through the options from the front-panel Digitize functions tab.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25622.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.math.format = smu.MATH_PERCENT
--- smu.measure.math.enable = smu.ON
--- smu.measure.func = smu.FUNC_RESISTANCE
--- smu.measure.math.format = smu.MATH_RECIPROCAL
--- smu.measure.math.enable = smu.ON
--- print(smu.measure.math.format)
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- print(smu.measure.math.format)
--- 
--- --Sets the instrument to measure voltage and set the math format to percent and enable the math functions.
--- --Set the instrument to measure resistance and set the math format to reciprocal and enable the math functions.
--- --Print the math format while the resistance measurement function is selected. The output is:
--- --smu.MATH_RECIPROCAL
--- --Change the function to voltage. Print the math format. The output is:
--- --smu.MATH_PERCENT
--- ```
---@type smumeasurefuncmFunction
smu.measure.func = 0



--- **This function makes measurements, places them in a reading buffer, and returns the last reading.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function makes a measurement using the present function setting, stores the reading in a reading buffer, and returns the last reading.The smu.measure.count attribute determines how many measurements are performed. You can also use the trigger model Simple Loop.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25688.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- voltMeasBuffer = buffer.make(10000)
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- print(smu.measure.read(voltMeasBuffer))
--- 
--- --Create a buffer named voltMeasBuffer. Set the instrument to measure voltage.
--- --Make a measurement that is stored in the voltMeasBuffer and is also printed.
--- ```
---@return number[] reading The last reading of the measurement process
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is defined, it defaults to defbuffer1
---@overload fun():number[]
function smu.measure.read(bufferName) end

smu.SENSE_2WIREF = nil
smu.SENSE_4WIRE = nil

---@alias smumeasuresensesensing
---|`smu.SENSE_2WIREF`
---|`smu.SENSE_4WIRE`



--- **This attribute selects local (2-wire) or remote (4-wire) sensing.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines if 2-wire (local) or 4-wire (remote) sensing is used.When you use 4-wire sensing, voltages are measured at the device under test (DUT). For the source voltage, if the sensed voltage is lower than the programmed amplitude, the voltage source increases the voltage until the sensed voltage is the same as the programmed amplitude. This compensates for IR drop in the output test leads.Using 4-wire sensing with voltage measurements eliminates any voltage drops that may be in the test leads between the Model 2461 and the DUT.When you are using 2-wire sensing, voltage is measured at the output connectors.When you are measuring resistance, you can enable 4-wire sensing to make 4-wire resistance measurements.When the output is off, 4-wire sensing is disabled and the instrument uses 2-wire sense, regardless of the sense setting. When the output is on, the selected sense setting is used.If the output is on when you change the sense setting, the output is turned off. 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25730.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_RESISTANCE
--- smu.measure.sense = smu.SENSE_4WIRE
--- 
--- --Set the measurement function to resistance.
--- --Set the sense to 4-wire remote.
--- ```
---@type smumeasuresensesensing
smu.measure.sense = 0


smu.DIGITS_6_55 = nil
smu.DIGITS_5_54 = nil
smu.DIGITS_4_53 = nil
smu.DIGITS_3_5 = nil

---@alias smumeasuredisplaydigitsdigits
---|`smu.DIGITS_6_55`
---|`smu.DIGITS_5_54`
---|`smu.DIGITS_4_53`
---|`smu.DIGITS_3_5`



--- **This attribute determines the number of digits that are displayed for measurements on the front panel for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28416.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.displaydigits = smu.DIGITS_6_5
--- 
--- --Set the measurement function to voltage with a front-panel display resolution of 6½.
--- ```
---@type smumeasuredisplaydigitsdigits
smu.measure.displaydigits = 0



--- **This command sets the time that the input signal is measured for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the amount of time that the input signal is measured.The amount of time is specified as the number of power line cycles (NPLCs). Each PLC for 60 Hz is 16.67 ms (1/60) and each PLC for 50 Hz is 20 ms (1/50). For 60 Hz, if you set the NPLC to 0.1, the measure time is 1.667 ms.This command is set for the measurement of specific functions (current, resistance, or voltage).The shortest amount of time results in the fastest reading rate but increases the reading noise and decreases the number of usable digits.The longest amount of time provides the lowest reading noise and more usable digits but has the slowest reading rate.Settings between the fastest and slowest number of power line cycles are a compromise between speed and noise.If you change the PLCs, you may want to adjust the displayed digits to reflect the change in usable digits.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29064.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.nplc = 0.5
--- 
--- --Set the measurement function to DC Voltage.
--- --Set the NPLC value to 0.5, which is 0.0083 seconds (0.5/60).
--- ```
smu.measure.nplc = 0


smu.OFFE = nil
smu.ON = nil

---@alias smumeasureoffsetcompensationstate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute determines if offset compensation is used.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This feature is only available for resistance measurements or when the smu.measure.unit is set to smu.UNIT_OHM.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29137.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_RESISTANCE
--- smu.measure.sense = smu.SENSE_4WIRE
--- smu.measure.offsetcompensation = smu.ON
--- smu.source.output = smu.ON
--- print(smu.measure.read())
--- smu.source.output = smu.OFF
--- 
--- --Sets the measurement function to resistance. Set the instrument for 4-wire measurements and turn offset compensation on. Turn on the source, make a measurement, and turn the source off.
--- --Example output:
--- --81592000
--- ```
---@type smumeasureoffsetcompensationstate
smu.measure.offsetcompensation = 0


smu.OFFS = nil
smu.ON = nil

---@alias smumeasureautorangeautoRange
---|`smu.OFFS`
---|`smu.ON`



--- **This attribute determines if the measurement range is set manually or automatically for the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Autorange selects the best range in which to measure the signal that is applied to the input terminals of the instrument. When autorange is enabled, the range increases at 120 percent of range. The range decreases occur when the reading is <10 percent of nominal range.This command determines how the range is selected.When this command is set to off, you must set the range. If you do not set the range, the instrument remains at the range that was last selected by autorange.When this command is set to on, the instrument automatically goes to the most sensitive range to perform the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29393.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.autorange = smu.ON
--- 
--- --Set the measurement function to current.
--- --Set the range to be set automatically.
--- ```
---@type smumeasureautorangeautoRange
smu.measure.autorange = 0



--- **This attribute determines the positive full-scale measure range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can assign any real number using this command. The instrument selects the closest fixed range that is large enough to measure the entered number. For example, for current measurements, if you expect a reading of approximately 9 mA, set the range to 9 mA to select the 10 mA range. When you read this setting, you see the positive full-scale value of the measurement range that the instrument is presently using.This command is primarily intended to eliminate the time that is required by the instrument to automatically search for a range.When a range is fixed, any signal greater than the entered range generates an overrange condition. When an overrange condition occurs, the front panel displays "Overflow" and the remote interface returns 9.9e+37.If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is the same as the source range, regardless of measurement range setting. However, the setting for the measure range is retained, and when the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.If you change the range while the output is off, the instrument does not update the hardware settings, but if you read the range setting, the return is the setting that will be used when the output is turned on. If you set a range while the output is on, the new setting takes effect immediately.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29407.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.range = 0.5
--- 
--- --Set the source function to current.
--- --Set the measurement function to voltage.
--- --Instrument selects the 2 V measurement range.
--- ```
smu.measure.range = 0



--- **This attribute selects the lower limit for measurements of the selected function when the range is selected automatically.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can use this command when automatic range selection is enabled. It prevents the instrument from selecting a range that is below this limit. Because the lowest ranges generally require longer settling times, setting the low limit that is appropriate for your application but above the lowest possible range can make measurements require less settling time.The lower limit must be less than the upper limit.Though you can send any value when you send this command, the instrument selects the next highest range value. For example, if you send 15 for the lowest voltage range, the instrument will be set to the 20 V range as the low limit. If the lower limit is equal to the upper limit, automatic range setting is effectively disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29423.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.autorange = smu.ON
--- smu.measure.autorangelow = 2
--- 
--- --Sets the low range for voltage measurements to 2 V.
--- ```
smu.measure.autorangelow = 0


smu.FUNC_DC_VOLTAGEC = nil
smu.FUNC_DC_CURRENTO = nil
smu.FUNC_RESISTANCE = nil

---@alias smumeasureautorangehighmeasFunction
---|`smu.FUNC_DC_VOLTAGEC`
---|`smu.FUNC_DC_CURRENTO`
---|`smu.FUNC_RESISTANCE`



--- **When autorange is selected, this attribute represents the highest measurement range that is used when the instrument selects the measurement range automatically.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command can be written to and read for resistance measurements. For current and voltage measurements, it can only be read.For current and voltage measurements, the upper limit is controlled by the current or voltage limit.For resistance measurements, you can use this command when automatic range selection is enabled to put an upper bound on the range that is used for resistance measurements.The upper limit must be more than the lower limit.If the lower limit is equal to the upper limit, automatic range setting is effectively disabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29432.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.autorange = smu.ON
--- print(smu.measure.autorangehigh)
--- 
--- --Sets the measurement function to voltage and turn autorange on. Check the high range for voltage measurements.
--- ```


--- **This attribute sets the number of measurements to make when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the number of measurements that are made when a measurement is requested. This command does not affect the trigger model.When smu.measure.count or if the function for smu.measure.setattribute is the active function, this command sets the count for all measure functions. When you send smu.measure.setattribute for a function that is not active, only the count for the specified function is changed.If you set the count to a value that is larger than the capacity of the reading buffer and the buffer fill mode is set to continuous, the buffer wraps until the number of readings specified have occurred. The earliest readings in the count are overwritten. If the buffer is set to fill once, readings stop when the buffer is filled, even if the count is not complete.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30505.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Set up measure function
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.terminals = smu.TERMINALS_REAR
--- smu.measure.autorange = smu.ON
--- smu.measure.nplc = 1
--- smu.measure.count = 200
---  
--- -- Set up source function
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.ilimit.level = 0.1
--- smu.source.level = 20
--- smu.source.delay = 0.1
--- smu.source.highc = smu.OFF
---  
--- -- Turn on output and initiate readings
--- smu.source.output = smu.ON
--- smu.measure.read(defbuffer1)
---  
--- -- Parse index and data into three columns
--- print("Rdg #", "Time (s)", "Current (A)")
--- for i = 1, defbuffer1.n do
---       print(i, defbuffer1.relativetimestamps[i], defbuffer1[i])
--- end
---  
--- -- Discharge the capacitor to 0 V and turn off the output
--- smu.source.level = 0
--- delay(2)
--- smu.source.output = smu.OFF
--- 
--- --This example uses smu.measure.count to do a capacitor test. This outputs 200 readings that are similar to the following output:
--- --Rdg #   Time (s)   Current (A)
--- --1   0   8.5718931952528e-11
--- --2   0.151875   1.6215984111057e-10
--- --3   0.303727   1.5521139928865e-10
--- --. . .
--- --198   29.91579194   1.5521250951167e-10
--- --199   30.067648716   1.4131290582142e-10
--- --200   30.219497716   1.5521067764368e-10
--- reset()
---  
--- -- Set up measure function
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.terminals = smu.TERMINALS_REAR
--- smu.measure.autorange = smu.ON
--- smu.measure.nplc = 1
---  
--- -- Set up source function
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.ilimit.level = 0.1
--- smu.source.level = 20
--- smu.source.delay = 0.1
--- smu.source.highc = smu.OFF
---  
--- -- Turn on output and initiate readings
--- smu.source.output = smu.ON
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
--- -- Discharge the capacitor to 0 V and turn off the output
--- smu.source.level = 0
--- delay(2)
--- smu.source.output = smu.OFF
--- 
--- --This example demonstrates how to use the SimpleLoop trigger-model template instead of smu.measure.count to do a capacitor test. Similar to Example 1, this also outputs 200 readings that are similar to the following:
--- --Rdg #   Time (s)   Current (A)
--- --1   0   8.5718931952528e-11
--- --2   0.151875   1.6215984111057e-10
--- --3   0.303727   1.5521139928865e-10
--- --. . .
--- --198   29.91579194   1.5521250951167e-10
--- --199   30.067648716   1.4131290582142e-10
--- --200   30.219497716   1.5521067764368e-10
--- ```
smu.measure.count = 0


smu.UNIT_AMP = nil
smu.UNIT_OHM = nil
smu.UNIT_VOLT = nil
smu.UNIT_WATT = nil

---@alias smumeasureunitunitOfMeasure
---|`smu.UNIT_AMP`
---|`smu.UNIT_OHM`
---|`smu.UNIT_VOLT`
---|`smu.UNIT_WATT`



--- **This attribute sets the units of measurement that are displayed on the front panel of the instrument and stored in the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change in measurement units is displayed when the next measurement is made.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30560.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.unit = smu.UNIT_WATT
--- 
--- --Changes the front-panel display and buffer readings for voltage measurements to be displayed as power readings in watts.
--- ```
---@type smumeasureunitunitOfMeasure
smu.measure.unit = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31441.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.userdelay[1] = 5
--- trigger.model.setblock(1, trigger.BLOCK_SOURCE_OUTPUT, smu.ON)
--- trigger.model.setblock(2, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M1)
--- trigger.model.setblock(3, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(4, trigger.BLOCK_SOURCE_OUTPUT, smu.OFF)
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_COUNTER, 10, 1)
--- trigger.model.initiate()
--- 
--- --Set user delay for measure 1 to 5 s.
--- --Set trigger block 1 to turn the source output on.
--- --Set trigger block 2 to a dynamic delay that calls measure user delay 1.
--- --Set trigger block 3 to make a measurement.
--- --Set trigger block 4 to turn the source output off.
--- --Set trigger block 5 to branch to block 1 ten times.
--- --Start the trigger model.
--- ```
---@type integer[]
smu.measure.userdelay= 0



--- **This function initiates measurements and returns the last actual measurement and time information in UTC format without using the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates measurements using the present function setting, stores the readings in a reading buffer, and returns the last reading.The smu.measure.count attribute determines how many measurements are performed.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31457.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.measure.readwithtime(defbuffer1))
--- 
--- --Print the last measurement and time information from defbuffer1 in UTC format, which will look similar to:
--- ---1.405293589829e-11  1400904629  0.1950935
--- ```
---@return number[] reading The last reading of the measurement process
---@return number seconds Seconds in UTC format
---@return number fractional Fractional seconds
---@overload fun(bufferName:bufferMethods):number
function smu.measure.readwithtime() end

smu.OFFR = nil
smu.ON = nil

---@alias smumeasureautorangereboundstate
---|`smu.OFFR`
---|`smu.ON`



--- **This attribute determines if the instrument restores the measure range to match the limit range after making a measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When autorange rebound is enabled, it prevents the source from being limited to a value that is below the source limit. After an autoranged measurement is made, the measure range is restored to match the limit range once the autoranged measurement is complete. This ensures that the source does not limit at less than the full limit setting.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/88860.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.autorange = smu.ON
--- smu.measure.autorangerebound = smu.ON
--- 
--- --Set the measurement function to current.
--- --Set the range to be set automatically.
--- --Set the measure range to be automatically restored to match the source limit value after each measurement.
--- ```
---@type smumeasureautorangereboundstate
smu.measure.autorangerebound = 0


smu.FUNC_DC_VOLTAGEC = nil
smu.FUNC_DC_CURRENT = nil
smu.FUNC_RESISTANCED = nil
smu.FUNC_DIGITIZE_CURRENTD = nil
smu.FUNC_DIGITIZE_VOLTAGE = nil

---@alias smumeasuregetattributemeasFunction
---|`smu.FUNC_DC_VOLTAGEC`
---|`smu.FUNC_DC_CURRENT`
---|`smu.FUNC_RESISTANCED`
---|`smu.FUNC_DIGITIZE_CURRENTD`
---|`smu.FUNC_DIGITIZE_VOLTAGE`



--- **This function returns the setting for a function attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can retrieve one attribute at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91266.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.measure.getattribute(smu.FUNC_DC_VOLTAGE, smu.ATTR_MEAS_RANGE))
--- print(smu.measure.getattribute(smu.FUNC_DC_VOLTAGE, smu.ATTR_MEAS_NPLC))
--- print(smu.measure.getattribute(smu.FUNC_DC_VOLTAGE, smu.ATTR_MEAS_DIGITS))
--- 
--- --Retrieve the range, NPLC, and digits settings for the DC voltage function.
--- --Example return:
--- --0.02
--- --1
--- --smu.DIGITS_4_5
--- ```
---@return number value The attribute value
---@param measFunction smumeasuregetattributemeasFunction The measurement function
---@param setting functionAttributes | functions The attribute for the function; refer to smu.measure.setattribute() for available settings
function smu.measure.getattribute(measFunction, setting) end

smu.FUNC_DC_VOLTAGEC = nil
smu.FUNC_DC_CURRENT = nil
smu.FUNC_RESISTANCED = nil
smu.FUNC_DIGITIZE_CURRENTD = nil
smu.FUNC_DIGITIZE_VOLTAGE = nil

---@alias smumeasuresetattributemeasFunction
---|`smu.FUNC_DC_VOLTAGEC`
---|`smu.FUNC_DC_CURRENT`
---|`smu.FUNC_RESISTANCED`
---|`smu.FUNC_DIGITIZE_CURRENTD`
---|`smu.FUNC_DIGITIZE_VOLTAGE`



--- **This function allows you to set up a measure function whether or not the function is active.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The lists following the Example and Also See information show the attributes that are available for each function, with links to the descriptions of the corresponding TSP command descriptions. The options for each attribute are the same as the settings for the TSP commands.Aperture: smu.ATTR_DIGI_APERTURECount: smu.ATTR_DIGI_COUNTDisplay digits: smu.ATTR_DIGI_DIGITSRange: smu.ATTR_DIGI_RANGERelative offset enable: smu.ATTR_DIGI_REL_ENABLERelative offset level: smu.ATTR_DIGI_REL_LEVELSample rate: smu.ATTR_DIGI_SAMPLE_RATESense: smu.ATTR_DIGI_SENSEUnit: smu.ATTR_DIGI_UNITUser delay N (where N is 1 to 5): smu.ATTR_DIGI_USER_DELAY_NEnable math: smu.ATTR_DIGI_MATH_ENABLEb (offset) value: smu.ATTR_DIGI_MATH_MXB_BFm (scalar) value: smu.ATTR_DIGI_MATH_MXB_MFMath format: smu.ATTR_DIGI_MATH_FORMATPercent: smu.ATTR_DIGI_MATH_PERCENTLimit 1 audible: smu.ATTR_MEAS_LIMIT_AUDIBLE_1Limit 1 auto clear: smu.ATTR_MEAS_LIMIT_AUTO_CLEAR_1Limit 1 enable: smu.ATTR_MEAS_LIMIT_ENABLE_1Limit 1 fail: smu.ATTR_MEAS_LIMIT_FAIL_1Limit 1 high value: smu.ATTR_MEAS_LIMIT_HIGH_1Limit 1 low value: smu.ATTR_MEAS_LIMIT_LOW_1Limit 2 audible: smu.ATTR_MEAS_LIMIT_AUDIBLE_2Limit 2 auto clear: smu.ATTR_MEAS_LIMIT_AUTO_CLEAR_2Limit 2 enable: smu.ATTR_MEAS_LIMIT_ENABLE_2Limit 2 fail: smu.ATTR_MEAS_LIMIT_FAIL_2Limit 2 high value: smu.ATTR_MEAS_LIMIT_HIGH_2Limit 2 low value: smu.ATTR_MEAS_LIMIT_LOW_2Limit 1 audible: smu.ATTR_DIGI_LIMIT_AUDIBLE_1Limit 1 auto clear: smu.ATTR_DIGI_LIMIT_AUTO_CLEAR_1Limit 1 enable: smu.ATTR_DIGI_LIMIT_ENABLE_1Limit 1 fail: smu.ATTR_DIGI_LIMIT_FAIL_1Limit 1 high value: smu.ATTR_DIGI_LIMIT_HIGH_1Limit 1 low value: smu.ATTR_DIGI_LIMIT_LOW_1Limit 2 audible: smu.ATTR_DIGI_LIMIT_AUDIBLE_2Limit 2 auto clear: smu.ATTR_DIGI_LIMIT_AUTO_CLEAR_2Limit 2 enable: smu.ATTR_DIGI_LIMIT_ENABLE_2Limit 2 fail: smu.ATTR_DIGI_LIMIT_FAIL_2Limit 2 high value: smu.ATTR_DIGI_LIMIT_HIGH_2Limit 2 low value: smu.ATTR_DIGI_LIMIT_LOW_2
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91445.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.setattribute(smu.FUNC_DC_VOLTAGE, smu.ATTR_MEAS_REL_LEVEL, 0.55)
--- smu.measure.setattribute(smu.FUNC_DC_VOLTAGE, smu.ATTR_MEAS_LIMIT_HIGH_1, 0.64)
--- smu.measure.setattribute(smu.FUNC_DC_VOLTAGE, smu.ATTR_MEAS_LIMIT_LOW_1, 0.32)
--- smu.measure.configlist.create("MyMeasList")
--- smu.measure.configlist.storefunc("MyMeasList", smu.FUNC_DC_VOLTAGE)
--- 
--- --Configure the DC Voltage function settings for the relative offset level, limit 1 high value, and limit 1 low value whether or not DC Voltage is the active function.
--- --Create a configuration list named MyMeasList.
--- --Store the settings for the DC Voltage function in MyMeasList at index 1.
--- ```
---@param measFunction smumeasuresetattributemeasFunction The measurement function
---@param setting functionAttributes | functions The attribute for the function; refer to Details and the tables following the examples
---@param value number The attribute value
function smu.measure.setattribute(measFunction, setting, value) end
---@class trigger.model
trigger.model = {}




--- **This function stops all trigger model commands on the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When this command is received, the instrument stops the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25628.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.abort()
--- 
--- --Terminates all commands related to the trigger model on the instrument.
--- ```
function trigger.model.abort() end

trigger.STATE_ABORTED = nil
trigger.STATE_ABORTING = nil
trigger.STATE_BUILDING = nil
trigger.STATE_EMPTY = nil
trigger.STATE_FAILED = nil
trigger.STATE_IDLE = nil
trigger.STATE_RUNNING = nil
trigger.STATE_WAITING = nil

---@alias triggermodelstatestatus
---|`trigger.STATE_ABORTED`
---|`trigger.STATE_ABORTING`
---|`trigger.STATE_BUILDING`
---|`trigger.STATE_EMPTY`
---|`trigger.STATE_FAILED`
---|`trigger.STATE_IDLE`
---|`trigger.STATE_RUNNING`
---|`trigger.STATE_WAITING`



--- **This function returns the present state of the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command returns the state of the trigger model. The instrument checks the state of a started trigger model every 100 ms.This command returns the trigger state and the block that the trigger model last executed.The trigger model states are:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25741.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30569.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30570.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30571.htm"])
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
--- When you load this trigger-model template, you can specify amount of time to make a measurement and the length of the delay before the measurement.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30588.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Set up measure function
--- smu.measure.func = smu.FUNC_DC_CURRENT
---  
--- -- Set up source function
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.level = 5
---  
--- -- Turn on output, initiate readings, and store them in defbuffer1
--- trigger.model.load("DurationLoop", 10, 0.01, defbuffer1)
--- trigger.model.initiate()
--- 
--- --Reset the instrument. Set the instrument to source voltage at 5 V. Set to measure current.
--- --Load the duration loop trigger model to take measurements for 10 s with a 10 ms delay before each measurement.
--- --Start the trigger model.
--- ```
---@param DurationLoop loadFunConstParam load function constant param
---@param duration number The amount of time for which to make measurements (167 ns to 100 ks)
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@overload fun(DurationLoop:loadFunConstParam,duration:number)
---@overload fun(DurationLoop:loadFunConstParam,duration:number,delay:number)
function trigger.model.load(DurationLoop, duration, delay, bufferName) end


--- **This function loads a trigger-model template configuration that uses source and measure configuration lists.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger-model template incorporates a source configuration list and measure configuration list. You must set up the configuration lists before loading the trigger model. If the configuration lists change, you must resend this command.You can also set a delay and change the reading buffer.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/35126.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.configlist.create("SOURCE_LIST")
--- smu.measure.configlist.create("MEASURE_LIST")
--- smu.source.level = 1
--- smu.source.configlist.store("SOURCE_LIST")
--- smu.measure.range = 1e-3
--- smu.measure.configlist.store("MEASURE_LIST")
--- smu.source.level = 5
--- smu.source.configlist.store("SOURCE_LIST")
--- smu.measure.range = 10e-3
--- smu.measure.configlist.store("MEASURE_LIST")
--- smu.source.level = 10
--- smu.source.configlist.store("SOURCE_LIST")
--- smu.measure.range = 100e-3
--- smu.measure.configlist.store("MEASURE_LIST")
--- trigger.model.load("ConfigList", "MEASURE_LIST", "SOURCE_LIST")
--- trigger.model.initiate()
--- 
--- --Set up a source configuration list named SOURCE_LIST and a measurement configuration list named MEASURE_LIST. Load the configuration list trigger model, using these two configuration lists. Start the trigger model.
--- ```
---@param ConfigList loadFunConstParam load function constant param
---@param measureConfigList string A string that contains the name of the measurement configuration list to use
---@param sourceConfigList string A string that contains the name of the source configuration list to use
---@param delay number The delay time before each measurement (167 ns to 10 ks); default is 0 for no delay
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1.
---@overload fun(ConfigList:loadFunConstParam,measureConfigList:string,sourceConfigList:string)
---@overload fun(ConfigList:loadFunConstParam,measureConfigList:string,sourceConfigList:string,delay:number)
function trigger.model.load(ConfigList, measureConfigList, sourceConfigList, delay, bufferName) end


--- **This function clears the trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When you load this trigger-model template, any blocks that have been defined in the trigger model are cleared so the trigger model has no blocks defined.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/35127.htm"])
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



--- **This function loads a trigger-model template configuration that sets up a logic trigger through the digital I/O.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This trigger model waits for a digital input event to occur, makes a measurement, and issues a notify event. The notify event asserts a digital output line.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/35128.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.model.load("LogicTrigger", 1, 2, 10, 0.001, defbuffer1)
--- 
--- --Set up the template to use the digital in line and wait for a pulse from digital in line 1 to trigger measurements.
--- --Pulse digital out line 2 when the measurement is complete.
--- --Make 10 measurements, with a delay of 1 ms before each measurement.
--- --Store the measurements in defbuffer1.
--- ```
---@param LogicTrigger loadFunConstParam load function constant param
---@param digInLine number The digital input line (1 to 6); also, the event that the trigger model will wait on in block 1
---@param digOutLine number The digital output line (1 to 6)
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
--- This command sets up a loop that sets a delay, makes a measurement, and then repeats the loop the number of times you define in the Count parameter.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger-model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/46034.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Set up measure function
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.terminals = smu.TERMINALS_REAR
--- smu.measure.autorange = smu.ON
--- smu.measure.nplc = 1
---  
--- -- Set up source function
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.ilimit.level = 0.1
--- smu.source.level = 20
--- smu.source.delay = 0.1
--- smu.source.highc = smu.OFF
---  
--- -- Turn on output and initiate readings
--- smu.source.output = smu.ON
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
--- -- Discharge the capacitor to 0 V and turn off the output
--- smu.source.level = 0
--- delay(2)
--- smu.source.output = smu.OFF
--- 
--- --This example uses the SimpleLoop trigger-model template to do a capacitor test. This example produces 200 readings that have output similar to the following example:
--- --Rdg #   Time (s)   Current (A)
--- --1   0             8.5718931952528e-11
--- --2   0.151875      1.6215984111057e-10
--- --3   0.303727      1.5521139928865e-10
--- --. . .
--- --198   29.91579194   1.5521250951167e-10
--- --199   30.067648716   1.4131290582142e-10
--- --200   30.219497716   1.5521067764368e-10
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
--- The event constant is the event that ends infinite triggering or ends readings set to occur before the trigger and start post-trigger readings. The trigger model makes readings until it detects the event constant. After the event, it makes a finite number of readings, based on the setting of the trigger position.The position marks the location in the reading buffer where the trigger will occur. The position is set as a percentage of the buffer capacity. The buffer captures measurements until a trigger occurs. When the trigger occurs, the buffer retains the percentage of readings specified by the position, then captures remaining readings until 100 percent of the buffer is filled. For example, if this is set to 75 for a reading buffer that holds 10,000 readings, the trigger model makes 2500 readings after it detects the source event. There are 7500 pre-trigger readings and 2500 post-trigger readings.The instrument makes two sets of readings. The first set is made until the trigger event occurs. The second set is made after the trigger event occurs, up to the number of readings calculated by the position parameter.You cannot have the event constant set at none when you run this trigger-model template.The following table lists the options that are available for triggerEvent.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/46040.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
---  
--- -- Set up measure function
--- smu.measure.func = smu.FUNC_DC_CURRENT
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
--- This trigger-model template allows you to grade components and place them into up to four bins, based on the comparison to limits.To set a limit as unused, set the high value for the limit to be less than the low limit.All limit patterns and the pass pattern are sent on digital I/O lines 1 to 4, where 1 is the least significant bit.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/46058.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@param GradeBinning loadFunConstParam load function constant param
---@param components number The number of components to measure (1 to 268,435,455)
---@param startInLine number The input line that starts the test; 5 for digital line 5, 6 for digital line 6; default is 5
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
--- This trigger-model template allows you to sort components and place them into up to four bins, based on the comparison to limits.To set a limit as unused, set the high value for the limit to be less than the low limit.All limit patterns and the all fail pattern are sent on digital I/O lines 1 to 4, where 1 is the least significant bit.After selecting a trigger-model template, you can view the trigger-model blocks in a graphical format by pressing the front-panel MENU key and under Trigger, selecting Configure. You can also add or delete blocks and change trigger-model settings from this screen. You can use the trigger.model.getblocklist() command to view the trigger model blocks in a list format.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/46066.htm"])
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
---@param startInLine number The input line that starts the test; 5 for digital line 5, 6 for digital line 6; default is 5
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


--- **This function pauses a running trigger model.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command pauses the trigger model.To continue the trigger model, send the resume command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/72471.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/73512.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
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
---@class smu.source
smu.source = {}



smu.OFFS = nil
smu.ON = nil

---@alias smusourceoutputsourceOutput
---|`smu.OFFS`
---|`smu.ON`



--- **This attribute enables or disables the source output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the output is switched on, the instrument sources either voltage or current, as set by smu.source.func.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28022.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.output = smu.ON
--- 
--- --Switch the source output of the instrument to on.
--- ```
---@type smusourceoutputsourceOutput
smu.source.output = 0



--- **This attribute contains the source delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets a delay for the selected source function. This delay is in addition to normal settling times.After the programmed source is turned on, this delay allows the source level to settle before a measurement is made.If you set a specific source delay (smu.source.delay), source autodelay is turned off.When source autodelay is turned on, the manual source delay setting is overwritten with the autodelay setting.When either a source delay or autodelay is set, the delay is applied to the first source output and then only when the magnitude of the source changes.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29079.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.delay = 3
--- 
--- --Set the function to voltage. Set a 3 s delay after the source is turned on before a measurement is made.
--- ```
smu.source.delay = 0


smu.OFFMODE_NORMAL = nil
smu.OFFMODE_ZERO = nil
smu.OFFMODE_HIGHZ = nil
smu.OFFMODE_GUARD = nil

---@alias smusourceoffmodesourceOffMode
---|`smu.OFFMODE_NORMAL`
---|`smu.OFFMODE_ZERO`
---|`smu.OFFMODE_HIGHZ`
---|`smu.OFFMODE_GUARD`



--- **This attribute defines the state of the source when the output is turned off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.offmode = smu.OFFMODE_HIGHZ
--- 
--- --Sets the output-off state so that the instrument opens the output relay when the output is turned off.
--- ```
---@type smusourceoffmodesourceOffMode
smu.source.offmode = 0


smu.FUNC_DC_CURRENTV = nil
smu.FUNC_DC_VOLTAGE = nil

---@alias smusourcefuncsFunction
---|`smu.FUNC_DC_CURRENTV`
---|`smu.FUNC_DC_VOLTAGE`



--- **This attribute contains the source function, which can be voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When you set this command, it configures the instrument as either a voltage source or a current source.When you read this command, it returns the output setting of the source.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29382.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_CURRENT
--- 
--- --Sets the source function of the instrument to be a current source.
--- ```
---@type smusourcefuncsFunction
smu.source.func = 0



--- **This attribute selects the range for the source for the selected source function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command manually selects the measurement range for the specified source.To select the range, specify the approximate source value that you will use. The instrument selects the lowest range that can accommodate that level. For example, if you expect to source levels around 3 V, set the source level to 3. The Model 2461 selects the 20 V range.If you select a specific source range, the range must be large enough to source the value. If not, an overrange condition can occur.If an overrange condition occurs, an event is displayed and the change to the setting is ignored.The fixed current source ranges are 1 µA, 10 µA, 100 µA, 1 mA, 10 mA, 100 mA, 1 A, 4 A, 5 A, 7 A, and 10 A. Note that if the 10 A range is selected, the maximum source output level is 7.35 A unless pulsing is active.The fixed voltage source ranges are 200 mV, 2 V, 7 V, 10 V, 20 V, and 100 V.When you read this value, the instrument returns the positive full-scale value that the instrument is presently using.This command is intended to eliminate the time required by the automatic range selection.To select the range, you can specify the approximate source value that you will use. The instrument  selects the lowest range that can accommodate that level. For example, if you expect to source levels around 50 mV, send 0.05 (or 50e-3) to select the 200 mV range.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29383.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.autorange = smu.OFF
--- smu.source.range = 1
--- 
--- --Set the instrument to source current.
--- --Turn autorange off.
--- --Set the source range to 1 A.
--- ```
smu.source.range = 0


smu.OFFE = nil
smu.ON = nil

---@alias smusourceautorangesourceAutorange
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute determines if the range is selected manually or automatically for the selected source function or voltage source.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command indicates the state of the range for the selected source. When automatic source range is disabled, the source range is set manually.When automatic source range is enabled, the instrument selects the range that is most appropriate for the value that is being sourced. The output level controls the range. If you read the range after the output level is set, the instrument returns the range that the instrument chose as appropriate for that source level.If the source range is set to a specific value from the front panel or a remote command, the setting for automatic range is set to disabled.Only available for the current and voltage functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29386.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.autorange = smu.ON
--- 
--- --Set the source function to current.
--- --Set the instrument to select the source range automatically.
--- ```
---@type smusourceautorangesourceAutorange
smu.source.autorange = 0



--- **This attribute immediately selects a fixed amplitude for the selected source function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the output level of the voltage or current source. If the output is on, the new level is sourced immediately.The sign of the source level dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.If a manual source range is selected, the level cannot exceed the specified range. For example, if the voltage source is on the 2 V range, you cannot set the voltage source level to 3 V. When autorange is selected, the amplitude can be set to any level supported by the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29907.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.level = 1
--- 
--- --Set the instrument to source voltage and set it to source 1 V.
--- ```
smu.source.level = 0


smu.DELAY_AUTO = 0

---@alias smusourcesweeplinearsDelay
---|`smu.DELAY_AUTO`


smu.INFINITEF = nil

---@alias smusourcesweeplinearcount
---|`smu.INFINITEF`


smu.RANGE_AUTOB = nil
smu.RANGE_BEST = nil
smu.RANGE_FIXED = nil

---@alias smusourcesweeplinearrangeType
---|`smu.RANGE_AUTOB`
---|`smu.RANGE_BEST`
---|`smu.RANGE_FIXED`


smu.OFFA = nil
smu.ON = nil

---@alias smusourcesweeplinearfailAbort
---|`smu.OFFA`
---|`smu.ON`


smu.OFF = nil
smu.ON = nil

---@alias smusourcesweeplineardual
---|`smu.OFF`
---|`smu.ON`



--- **This function sets up a linear sweep for a fixed number of measurement points.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the sweep is started, the instrument sources a specific voltage or current value to the device under test (DUT). A measurement is made for each point of the sweep.When the sweep command is sent, it clears any existing trigger models, creates a source configuration list, and populates the trigger model. To run the sweep, initiate the trigger model.The sweep continues until the source outputs the specified stop level. At this level, the instrument performs another measurement and then stops the sweep.When you specify a delay, a delay block is added to the sweep trigger model. This delay is added to any source delay you may have set. For example, if you set 10 ms for the source delay and 25 ms for the sweep delay, the actual delay is 35 ms.The range type specifies the source range that is used for the sweep. You can select the following options:You cannot use a writable reading buffer to collect data from a sweep. 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30563.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.range = 20
--- smu.source.sweeplinear("VoltLinSweep", 0, 10, 20, 1e-3, 1, smu.RANGE_FIXED)
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.range = 100e-6
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its defaults.
--- --Set the source function to voltage.
--- --Set the source range to 20 V.
--- --Set up a linear sweep that sweeps from 0 to 10 V in 20 steps with a source delay of 1 ms, a sweep count of 1, and a fixed source range. Name the configuration list that is created for this sweep VoltLinSweep.
--- --Set the measure function to current.
--- --Set the current range to 100 μA.
--- --Start the sweep.
--- ```
---@param configListName string A string that contains the name of the configuration list that the instrument will create for this sweep
---@param start number The voltage or current source level at which the sweep starts
---@param stop number The voltage or current at which the sweep stops
---@param points number The number of source-measure points between the start and stop values of the sweep (2 to 1e6); to calculate the number of source-measure points in a sweep, use the following formula
---@param sDelay smusourcesweeplinearsDelay The delay between measurement points; default is smu.DELAY_AUTO, which enables autodelay, or a specific delay value from 50 µs to 10 ks, or 0 for no delay
---@param count smusourcesweeplinearcount The number of times to run the sweep; default is 1
---@param rangeType smusourcesweeplinearrangeType The source range that is used for the sweep
---@param failAbort smusourcesweeplinearfailAbort Complete the sweep if the source limit is exceeded
---@param dual smusourcesweeplineardual Determines if the sweep runs from start to stop and then from stop to start
---@param bufferName bufferMethods The name of a reading buffer; the default buffers (defbuffer1 or defbuffer2) or the name of a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@overload fun(configListName:string,start:number,stop:number,points:number)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplinearsDelay)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplinearsDelay,count:smusourcesweeplinearcount)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplinearsDelay,count:smusourcesweeplinearcount,rangeType:smusourcesweeplinearrangeType)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplinearsDelay,count:smusourcesweeplinearcount,rangeType:smusourcesweeplinearrangeType,failAbort:smusourcesweeplinearfailAbort)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplinearsDelay,count:smusourcesweeplinearcount,rangeType:smusourcesweeplinearrangeType,failAbort:smusourcesweeplinearfailAbort,dual:smusourcesweeplineardual)
function smu.source.sweeplinear(configListName, start, stop, points, sDelay, count, rangeType, failAbort, dual, bufferName) end

smu.DELAY_AUTO = 0

---@alias smusourcesweeplinearstepsDelay
---|`smu.DELAY_AUTO`


smu.INFINITEF = nil

---@alias smusourcesweeplinearstepcount
---|`smu.INFINITEF`


smu.RANGE_AUTOB = nil
smu.RANGE_BEST = nil
smu.RANGE_FIXED = nil

---@alias smusourcesweeplinearsteprangeType
---|`smu.RANGE_AUTOB`
---|`smu.RANGE_BEST`
---|`smu.RANGE_FIXED`


smu.OFFA = nil
smu.ON = nil

---@alias smusourcesweeplinearstepfailAbort
---|`smu.OFFA`
---|`smu.ON`


smu.OFF = nil
smu.ON = nil

---@alias smusourcesweeplinearstepdual
---|`smu.OFF`
---|`smu.ON`



--- **This function sets up a linear source sweep configuration list and trigger model with a fixed number of steps.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the sweep is started, the instrument sources a specific voltage or current voltage to the device under test (DUT). A measurement is made for each point of the sweep.When the sweep command is sent, it deletes the existing trigger model and creates a trigger model with a uniform series of ascending or descending voltage or current changes, called steps. To run the sweep, initiate the trigger model.The sweep continues until the source outputs the stop level, which is calculated from the number of steps. A measurement is performed at each source step (including the start and stop levels). At this level, the instrument performs another measurement and then stops the sweep.The instrument uses the step size parameter to determine the number of source level changes. The source level changes in equal steps from the start level to the stop level. To avoid a setting conflicts error, make sure the step size is greater than the start value and less than the stop value. To calculate the number of source-measure points in a sweep, use the following formula:     Points = [(Stop - Start) / Step] + 1When you specify a delay, a delay block is added to the sweep trigger model. This delay is added to any source delay you may have set. For example, if you set 10 ms for the source delay and 25 ms for the delay in the for the log sweep command, the actual delay is 35 ms.The range type specifies the source range that is used for the sweep. You can select the following options:You cannot use a writable reading buffer to collect data from a sweep.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30565.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.range = 1
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.range = 20
--- smu.source.sweeplinearstep("CurrLogSweep", -1.05, 1.05, .25, 10e-3, 1, smu.RANGE_FIXED)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its defaults.
--- --Set the source function to current.
--- --Set the source range to 1 A. Set the measure function to voltage with a range of 20 V.
--- --Set up a linear step sweep that sweeps from -1.05 A to 1.05 A in 0.25 A increments with a source delay of 1 ms, a sweep count of 1, and a fixed source range. Name the configuration list that is created for this sweep CurrLogSweep.
--- --Start the sweep.
--- ```
---@param configListName string A string that contains the name of the configuration list that the instrument will create for this sweep
---@param start number The voltage or current source level at which the sweep starts
---@param stop number The voltage or current at which the sweep stops
---@param step number The step size at which the source level will change; must be more than 0
---@param sDelay smusourcesweeplinearstepsDelay The delay between measurement points; default is smu.DELAY_AUTO, which enables autodelay, a specific delay value from 50 μs to 10 ks, or 0 for no delay
---@param count smusourcesweeplinearstepcount The number of times to run the sweep; default is 1
---@param rangeType smusourcesweeplinearsteprangeType The source range that is used for the sweep
---@param failAbort smusourcesweeplinearstepfailAbort Complete the sweep if the source limit is exceeded
---@param dual smusourcesweeplinearstepdual Determines if the sweep runs from start to stop and then from stop to start
---@param bufferName bufferMethods The name of a reading buffer; the default buffers (defbuffer1 or defbuffer2) or the name of a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@overload fun(configListName:string,start:number,stop:number,step:number)
---@overload fun(configListName:string,start:number,stop:number,step:number,sDelay:smusourcesweeplinearstepsDelay)
---@overload fun(configListName:string,start:number,stop:number,step:number,sDelay:smusourcesweeplinearstepsDelay,count:smusourcesweeplinearstepcount)
---@overload fun(configListName:string,start:number,stop:number,step:number,sDelay:smusourcesweeplinearstepsDelay,count:smusourcesweeplinearstepcount,rangeType:smusourcesweeplinearsteprangeType)
---@overload fun(configListName:string,start:number,stop:number,step:number,sDelay:smusourcesweeplinearstepsDelay,count:smusourcesweeplinearstepcount,rangeType:smusourcesweeplinearsteprangeType,failAbort:smusourcesweeplinearstepfailAbort)
---@overload fun(configListName:string,start:number,stop:number,step:number,sDelay:smusourcesweeplinearstepsDelay,count:smusourcesweeplinearstepcount,rangeType:smusourcesweeplinearsteprangeType,failAbort:smusourcesweeplinearstepfailAbort,dual:smusourcesweeplinearstepdual)
function smu.source.sweeplinearstep(configListName, start, stop, step, sDelay, count, rangeType, failAbort, dual, bufferName) end

smu.DELAY_AUTO = 0

---@alias smusourcesweeplogsDelay
---|`smu.DELAY_AUTO`


smu.INFINITEF = nil

---@alias smusourcesweeplogcount
---|`smu.INFINITEF`


smu.RANGE_AUTOB = nil
smu.RANGE_BEST = nil
smu.RANGE_FIXED = nil

---@alias smusourcesweeplograngeType
---|`smu.RANGE_AUTOB`
---|`smu.RANGE_BEST`
---|`smu.RANGE_FIXED`


smu.OFFA = nil
smu.ON = nil

---@alias smusourcesweeplogfailAbort
---|`smu.OFFA`
---|`smu.ON`


smu.OFF = nil
smu.ON = nil

---@alias smusourcesweeplogdual
---|`smu.OFF`
---|`smu.ON`



--- **This function sets up a logarithmic sweep for a set number of measurement points.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the sweep is started, the instrument sources a specific voltage or current value to the device under test (DUT). A measurement is made for each point of the sweep.When the sweep command is sent, it clears the existing trigger model and creates a new trigger model. To run the sweep, initiate the trigger model.The sweep continues until the source outputs the specified stop level. At this level, the instrument performs another measurement and then stops the sweep.When you specify a delay, a delay block is added to the sweep trigger model. This delay is added to any source delay you may have set. For example, if you set 10 ms for the source delay and 25 ms for the delay in the for the log sweep command, the actual delay is 35 ms.The range type specifies the source range that is used for the sweep. You can select the following options:You cannot use a writable reading buffer to collect data from a sweep. The asymptote changes the inflection of the sweep curve and allows it to sweep through zero. You can use the asymptote parameter to customize the inflection and offset of the source value curve. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep. The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30566.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.range = 20
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.range = 100e-6
--- smu.source.sweeplog("VoltLogSweep", 1, 10, 20, 1e-3, 1, smu.RANGE_FIXED)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its defaults.
--- --Set the source function to voltage.
--- --Set the source range to 20 V.
--- --Set the measure function to current.
--- --Set the current range to 100 uA.
--- --Set up a log sweep that sweeps from 1 to 10 V in 20 steps with a source delay of 1 ms, a sweep count of 1, and a fixed source range. Name the configuration list that is created for this sweep VoltLogSweep.
--- --Start the sweep.
--- ```
---@param configListName string A string that contains the name of the configuration list that the instrument will create for this sweep
---@param start number The voltage or current source level at which the sweep starts
---@param stop number The voltage or current at which the sweep stops
---@param points number The number of source-measure points between the start and stop values of the sweep (2 to 1e6); to calculate the number of source-measure points in a sweep, use the following formula
---@param sDelay smusourcesweeplogsDelay The delay between measurement points; default is smu.DELAY_AUTO, which enables autodelay, or a specific delay value from 50 μs to 10 ks, or 0 for no delay
---@param count smusourcesweeplogcount The number of times to run the sweep; default is 1
---@param rangeType smusourcesweeplograngeType The source range that is used for the sweep
---@param failAbort smusourcesweeplogfailAbort Complete the sweep if the source limit is exceeded
---@param dual smusourcesweeplogdual Determines if the sweep runs from start to stop and then from stop to start
---@param bufferName bufferMethods The name of a reading buffer; the default buffers (defbuffer1 or defbuffer2) or the name of a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@param asymptote number Default is 0; see Details
---@overload fun(configListName:string,start:number,stop:number,points:number)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplogsDelay)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplogsDelay,count:smusourcesweeplogcount)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplogsDelay,count:smusourcesweeplogcount,rangeType:smusourcesweeplograngeType)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplogsDelay,count:smusourcesweeplogcount,rangeType:smusourcesweeplograngeType,failAbort:smusourcesweeplogfailAbort)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplogsDelay,count:smusourcesweeplogcount,rangeType:smusourcesweeplograngeType,failAbort:smusourcesweeplogfailAbort,dual:smusourcesweeplogdual)
---@overload fun(configListName:string,start:number,stop:number,points:number,sDelay:smusourcesweeplogsDelay,count:smusourcesweeplogcount,rangeType:smusourcesweeplograngeType,failAbort:smusourcesweeplogfailAbort,dual:smusourcesweeplogdual,bufferName:bufferMethods)
function smu.source.sweeplog(configListName, start, stop, points, sDelay, count, rangeType, failAbort, dual, bufferName, asymptote) end

smu.OFFE = nil
smu.ON = nil

---@alias smusourcereadbackstate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute determines if the instrument records the measured source value or the configured source value when making a measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When source readback is off, the instrument records and displays the source value you set. When you use the actual source value (source readback on), the instrument measures the actual source value immediately before making the measurement of the device under test.Using source readback results in more accurate measurements, but also a reduction in measurement speed.When source readback is on, the front-panel display shows the measured source value and the buffer records the measured source value immediately before the device-under-test measurement. When source readback is off, the front-panel display shows the configured source value and the buffer records the configured source value immediately before the device-under-test measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30579.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- testDataBuffer = buffer.make(100)
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.source.readback = smu.ON
--- smu.source.level = 10
--- smu.measure.count = 100
--- smu.source.output = smu.ON
--- smu.measure.read(testDataBuffer)
--- smu.source.output = smu.OFF
--- printbuffer(1, 100, testDataBuffer.sourcevalues, testDataBuffer)
--- 
--- --Reset the instrument to default settings.
--- --Make a buffer named testDataBuffer that can hold 100 readings.
--- --Set source function to voltage.
--- --Set the measurement function to current.
--- --Set read back on.
--- --Set the instrument to take 100 readings.
--- --Turn the output on.
--- --Take the measurements.
--- --Turn the output off.
--- --Get the source values and measurements from the buffer.
--- ```
---@type smusourcereadbackstate
smu.source.readback = 0


smu.OFFT = nil
smu.ON = nil

---@alias smusourcehighcstate
---|`smu.OFFT`
---|`smu.ON`



--- **This attribute enables or disables high-capacitance mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the instrument is measuring low current and is driving a capacitive load, you may see overshoot, ringing, and instability. You can enable the high capacitance mode to minimize these problems.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30580.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.highc = smu.ON
--- 
--- --Turn the high capacitance mode on.
--- ```
---@type smusourcehighcstate
smu.source.highc = 0


smu.INFINITEF = nil

---@alias smusourcesweeplistcount
---|`smu.INFINITEF`


smu.OFFA = nil
smu.ON = nil

---@alias smusourcesweeplistfailAbort
---|`smu.OFFA`
---|`smu.ON`



--- **This function sets up a sweep based on a configuration list, which allows you to customize the sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to set up a custom sweep, using a configuration list to specify the source levels.When you specify a delay, a delay block is added to the sweep trigger model. This delay is added to any source delay you may have set. For example, if you set 10 ms for the source delay and 25 ms for the delay in the for the log sweep command, the actual delay is 35 ms.To run the sweep, initiate the trigger model.You cannot use a writable reading buffer to collect data from a sweep.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31499.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.configlist.create("CurrListSweep")
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.range = 100e-3
--- smu.source.level = 1e-3
--- smu.source.configlist.store("CurrListSweep")
--- smu.source.level = 10e-6
--- smu.source.configlist.store("CurrListSweep")
--- smu.source.level = 7e-3
--- smu.source.configlist.store("CurrListSweep")
--- smu.source.level = 11e-3
--- smu.source.configlist.store("CurrListSweep")
--- smu.source.level = 9e-3
--- smu.source.configlist.store("CurrListSweep")
--- smu.source.sweeplist("CurrListSweep", 1, 0.001)
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.range = 20
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its defaults
--- --Create a source configuration list called CurrListSweep.
--- --Set the source function to current.
--- --Set the source current range to 100 mA.
--- --Set the source current level to 1 mA.
--- --Save the source settings to CurrListSweep.
--- --Set the source current level to 10 uA.
--- --Save the source settings to CurrListSweep.
--- --Set the source current level to 7 mA.
--- --Save the source settings to CurrListSweep.
--- --Set the source current level to 11 mA.
--- --Save the source settings to CurrListSweep.
--- --Set the source current level to 9 mA.
--- --Save the source settings to CurrListSweep.
--- --Set up a list sweep that uses the entries from the CurrListSweep configuration list and starts at index 1 of the list.
--- --Set a source delay of 1 ms.
--- --Start the sweep.
--- ```
---@param configListName string The name of the source configuration list that the sweep uses; this must be defined before sending this command
---@param index number The index in the configuration list where the sweep starts; default is 1
---@param sDelay number The delay between measurement points; default is 0 for no delay or you can set a specific delay value from 50 us to 10 ks
---@param count smusourcesweeplistcount The number of times to run the sweep; default is 1
---@param failAbort smusourcesweeplistfailAbort Complete the sweep if the source limit is exceeded
---@param bufferName bufferMethods The name of a reading buffer; the default buffers (defbuffer1 or defbuffer2) or the name of a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@overload fun(configListName:string)
---@overload fun(configListName:string,index:number)
---@overload fun(configListName:string,index:number,sDelay:number)
---@overload fun(configListName:string,index:number,sDelay:number,count:smusourcesweeplistcount)
---@overload fun(configListName:string,index:number,sDelay:number,count:smusourcesweeplistcount,failAbort:smusourcesweeplistfailAbort)
function smu.source.sweeplist(configListName, index, sDelay, count, failAbort, bufferName) end

smu.OFFE = nil
smu.ON = nil

---@alias smusourceautodelaystate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables the automatic delay that occurs when the source is turned on.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When autodelay is turned on, the actual delay that is set depends on the range.When source autodelay is on, if you set a source delay, the autodelay is turned off.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/33143.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.autodelay = smu.OFF
--- 
--- --Turn off auto delay when current is being sourced.
--- ```
---@type smusourceautodelaystate
smu.source.autodelay = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/34973.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.userdelay[1] = 5
--- trigger.model.setblock(1, trigger.BLOCK_SOURCE_OUTPUT, smu.ON)
--- trigger.model.setblock(2, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_S1)
--- trigger.model.setblock(3, trigger.BLOCK_MEASURE_DIGITIZE)
--- trigger.model.setblock(4, trigger.BLOCK_SOURCE_OUTPUT, smu.OFF)
--- trigger.model.setblock(5, trigger.BLOCK_BRANCH_COUNTER, 10, 1)
--- trigger.model.initiate()
--- 
--- --Set user delay for source 1 to 5 s.
--- --Set trigger block 1 to turn the source output on.
--- --Set trigger block 2 to a dynamic delay that calls source user delay 1.
--- --Set trigger block 3 to make a measurement.
--- --Set trigger block 4 to turn the source output off.
--- --Set trigger block 5 to branch to block 1 ten times.
--- --Start the trigger model.
--- ```
---@type integer[]
smu.source.userdelay= 0


smu.INFINITEF = nil

---@alias smusourcepulsetraincount
---|`smu.INFINITEF`


smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsetrainmeasEnable
---|`smu.ON`
---|`smu.OFF`


smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsetrainfailAbort
---|`smu.ON`
---|`smu.OFF`



--- **This function defines a sequence of source pulses and creates a trigger model to generate the pulse train.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to set up and configure settings for a pulse train.Before configuring a pulse operation, configure your measure settings. Pulse operations use the measure settings that were last defined before the pulse operation; you may get unexpected results if you do not define the measure settings first.The bias level must be within the normal DC operating area (not the pulse-only area) of the operating boundaries. It must be low enough that it does not exceed the power settings defined by the bias limit and pulse limit parameters.The pulse level is not limited to the normal operating area; it can be set to any value within the operating boundaries. When the pulse level is set to a value in the pulse-only operating area, the pulse width is limited.The bias limit is limited to the normal operating area and is affected by either the maximum pulse level or bias level setting, whichever is greater in magnitude.The pulse limit is not limited to the normal operating area.The name of the source configuration list determines the name of the measure configuration list; Meas is appended to the beginning of the name. If the name of your configuration list is greater than 28 characters, it is truncated to include only the first 28 characters (including the prefix Meas that is added for the measure configuration list). For example, if the source configuration list is named VoltagePulseTrainSweepList (26 characters), the resulting measure configuration list is named MeasVoltagePulseTrainSweepList (30 characters). If the source configuration list is named MyLongPulseNameSweepConfigList (30 characters), the resulting measure configuration list is MeasMyLongPulseNameSweepConfigLi (32 characters).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63470.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.readback = smu.ON
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.range = 20
--- smu.digitize.samplerate = 25000
--- smu.source.pulsetrain("DigitizeTrain", -1, -3, 10e-3, 3, smu.ON, defbuffer1, 0, 90e-3, 15, 15)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its default settings.
--- --Set the source function to current and turn on source readback.
--- --Set the digitize function to voltage and the digitize voltage range to 20 V.
--- --Set the digitize sample rate to 25000 readings per second.
--- --Set up a pulse train with a bias level of -1 A and a pulse level of -3 A. Set the train to create three pulses with a pulse length of 10 ms and an off time of 90 ms. Set the pulse voltage limit and the bias voltage limit to 15 V.
--- --Start the pulse train.
--- ```
---@param configListName string The name of the source configuration list that the sweep uses; this must be defined before sending this command
---@param biasLevel number Output level the instrument sources before the first pulse and returns to between pulses (delay and off time)
---@param pulseLevel number The amplitude current or voltage from zero (not from the bias level)
---@param pulseWidth number The time at the amplitude level for each pulse
---@param count smusourcepulsetraincount The number of pulses in the pulse train; default is 1
---@param measEnable smusourcepulsetrainmeasEnable Enable or disable measurements at the top of each pulse
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@param sDelay number The amount of time that the instrument stays at bias level before each pulse (in seconds)
---@param offTime number The amount of time that the instrument stays at bias level after each pulse (in seconds)
---@param xBiasLimit number The current or voltage limit for the defined bias level
---@param xPulseLimit number The current or voltage limit for the defined pulse level
---@param failAbort smusourcepulsetrainfailAbort Determines if the pulse train is stopped immediately if a limit is exceeded; options are
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount)
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount,measEnable:smusourcepulsetrainmeasEnable)
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount,measEnable:smusourcepulsetrainmeasEnable,bufferName:bufferMethods)
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount,measEnable:smusourcepulsetrainmeasEnable,bufferName:bufferMethods,sDelay:number)
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount,measEnable:smusourcepulsetrainmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number)
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount,measEnable:smusourcepulsetrainmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,xBiasLimit:number)
---@overload fun(configListName:string,biasLevel:number,pulseLevel:number,pulseWidth:number,count:smusourcepulsetraincount,measEnable:smusourcepulsetrainmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,xBiasLimit:number,xPulseLimit:number)
function smu.source.pulsetrain(configListName, biasLevel, pulseLevel, pulseWidth, count, measEnable, bufferName, sDelay, offTime, xBiasLimit, xPulseLimit, failAbort) end

smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplinearstepmeasEnable
---|`smu.ON`
---|`smu.OFF`


smu.INFINITEF = nil

---@alias smusourcepulsesweeplinearstepcount
---|`smu.INFINITEF`


smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplinearstepfailAbort
---|`smu.ON`
---|`smu.OFF`


smu.OFF = nil
smu.ON = nil

---@alias smusourcepulsesweeplinearstepdual
---|`smu.OFF`
---|`smu.ON`



--- **This function sets up a linear source pulse sweep configuration list model with a fixed number of steps.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before configuring a pulse operation, configure your measure settings. Pulse operations use the measure settings that were last defined before the pulse operation; you may get unexpected results if you do not define the measure settings first.When the pulse sweep is started, the instrument sources a specific voltage or current voltage to the device under test (DUT). A pulse is output for each step of the pulse sweep. When the pulse sweep command is sent, it deletes the existing trigger model and creates a trigger model with a uniform series of ascending or descending voltage or current changes, called steps. To run the pulse sweep, initiate the trigger model.The pulse sweep continues until the source outputs the stop level, which is calculated from the number of steps. If measurements are enabled, a measurement is also made for each step of the pulse sweep (including the start and stop levels). At this level, the instrument performs another measurement and then stops the pulse sweep.The instrument uses the step size parameter to determine the number of source level changes. The source level changes in equal steps from the start level to the stop level. To avoid a setting conflicts error, make sure the step size is greater than the start value and less than the stop value. To calculate the number of source-measure points in a sweep, use the following formula:          Points = [(Stop - Start) / Step] + 1The name of the source configuration list determines the name of the measure configuration list; Meas is appended to the beginning of the name. If the name of your configuration list is greater than 28 characters, it is truncated to include only the first 28 characters (including the prefix Meas that is added for the measure configuration list). For example, if the source configuration list is named VoltagePulseLinearSweepList (27 characters), the resulting measure configuration list is named MeasVoltagePulseLinearSweepList (31 characters). If the source configuration list is named MyLongPulseNameSweepConfigList (30 characters), the resulting measure configuration list is MeasMyLongPulseNameSweepConfigLi (32 characters).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63471.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.range = 3
--- smu.source.readback = smu.OFF
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.range = 10
--- smu.measure.autozero.enable = smu.OFF
--- smu.measure.nplc = .01
--- smu.source.pulsesweeplinearstep("CurrPulseLinSweepList",0 ,-3, 3, .25, 10e-3, smu.ON, defbuffer1, 0, 100e-3, 1, 10, 10, smu.OFF, smu.OFF)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its default settings.
--- --Set the source function to current and the source range to 3 A.
--- --Turn source readback off.
--- --Set the measure function to voltage and the measure range to 10 V.
--- --Turn off autozero and set the NPLC to .01.
--- --Set up a linear pulse step sweep from -3 A to 3 A in 250 mA steps. Set the pulse width to 10 ms, the off time to 100 ms and the bias level to 0 A.
--- --Start the pulse sweep.
--- ```
---@param configListName string The name of the source configuration list that the sweep uses; this must be defined before sending this command
---@param biasLevel number Output level the instrument sources before the first pulse and returns to between pulses (delay and off time)
---@param start number The voltage or current source level at which the pulse sweep starts
---@param stop number The voltage or current source level at which the pulse sweep stops
---@param step number The step size at which the source level will change; step size must be greater than 0; to calculate the number of source-measure points in a sweep, use the following formula
---@param pulseWidth number The time at the amplitude level for each pulse
---@param measEnable smusourcepulsesweeplinearstepmeasEnable Enable or disable measurements at the top of each pulse
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@param sDelay number The amount of time that the instrument stays at bias level before each pulse (in seconds)
---@param offTime number The amount of time that the instrument stays at bias level after each pulse (in seconds)
---@param count smusourcepulsesweeplinearstepcount The number of pulse sweeps; default is 1
---@param xBiasLimit number The current or voltage limit for the defined bias level
---@param xPulseLimit number The current or voltage limit for the defined pulse level
---@param failAbort smusourcepulsesweeplinearstepfailAbort Determines if the sweep is stopped immediately if a limit is exceeded; options are
---@param dual smusourcepulsesweeplinearstepdual Determines if the sweep runs from start to stop and then from stop to start
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods,sDelay:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearstepcount)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearstepcount,xBiasLimit:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearstepcount,xBiasLimit:number,xPulseLimit:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,step:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearstepmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearstepcount,xBiasLimit:number,xPulseLimit:number,failAbort:smusourcepulsesweeplinearstepfailAbort)
function smu.source.pulsesweeplinearstep(configListName, biasLevel, start, stop, step, pulseWidth, measEnable, bufferName, sDelay, offTime, count, xBiasLimit, xPulseLimit, failAbort, dual) end

smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplinearmeasEnable
---|`smu.ON`
---|`smu.OFF`


smu.INFINITEF = nil

---@alias smusourcepulsesweeplinearcount
---|`smu.INFINITEF`


smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplinearfailAbort
---|`smu.ON`
---|`smu.OFF`


smu.OFF = nil
smu.ON = nil

---@alias smusourcepulsesweeplineardual
---|`smu.OFF`
---|`smu.ON`



--- **This function sets up a linear pulse sweep for a fixed number of pulse points.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before configuring a pulse operation, configure your measure settings. Pulse operations use the measure settings that were last defined before the pulse operation; you may get unexpected results if you do not define the measure settings first.When the pulse sweep is started, the instrument sources a specific voltage or current value to the device under test (DUT). A pulse is output for each point of the sweep. If measurements are enabled, a measurement is also made for each point of the sweep.When the pulse sweep command is sent, it clears any existing trigger models, creates a source and measure pulse configuration list, and populates the trigger model. To run the pulse sweep, initiate the trigger model.The pulse sweep continues until the source outputs the specified stop level. At this level, the instrument performs another measurement and then stops the sweep.When you specify a delay, a delay block is added to the pulse sweep trigger model.The name of the source configuration list determines the name of the measure configuration list; Meas is appended to the beginning of the name. If the name of your configuration list is greater than 28 characters, it is truncated to include only the first 28 characters (including the prefix Meas that is added for the measure configuration list). For example, if the source configuration list is named VoltagePulseLinearSweepList (27 characters), the resulting measure configuration list is named MeasVoltagePulseLinearSweepList (31 characters). If the source configuration list is named MyLongPulseNameSweepConfigList (30 characters), the resulting measure configuration list is MeasMyLongPulseNameSweepConfigLi (32 characters).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63472.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.range = 20
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.range = 100e-6
--- smu.measure.nplc = 0.01
--- smu.measure.autozero.enable = smu.OFF
--- smu.source.pulsesweeplinear("VoltLinSweep", 0, 0, 10, 20, 2e-3)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its default settings.
--- --Set the source function to voltage and the source range to 20 V.
--- --Set up a linear pulse sweep that sweeps from 0 to 10 V in 20 steps with a pulse width of 2 ms and a sweep count of 1. Name the configuration list that is created for this sweep VoltLinSweep.
--- --Set the measure function to current and the current range to 100 uA.
--- --Start the pulse sweep.
--- ```
---@param configListName string The name of the source configuration list that the sweep uses; this must be defined before sending this command
---@param biasLevel number Output level the instrument sources before the first pulse and returns to between pulses (delay and off time)
---@param start number The voltage or current source level at which the pulse sweep starts
---@param stop number The voltage or current source level at which the pulse sweep stops
---@param points number The number of pulse-measure points between the start and stop values of the pulse sweep (2 to 1e6)
---@param pulseWidth number The time at the amplitude level for each pulse
---@param measEnable smusourcepulsesweeplinearmeasEnable Enable or disable measurements at the top of each pulse
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@param sDelay number The amount of time that the instrument stays at bias level before each pulse (in seconds)
---@param offTime number The amount of time that the instrument stays at bias level after each pulse (in seconds)
---@param count smusourcepulsesweeplinearcount The number of pulse sweeps; default is 1
---@param xBiasLimit number The current or voltage limit for the defined bias level
---@param xPulseLimit number The current or voltage limit for the defined pulse level
---@param failAbort smusourcepulsesweeplinearfailAbort Determines if the sweep is stopped immediately if a limit is exceeded; options are
---@param dual smusourcepulsesweeplineardual Determines if the sweep runs from start to stop and then from stop to start
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearmeasEnable)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearmeasEnable,bufferName:bufferMethods)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearmeasEnable,bufferName:bufferMethods,sDelay:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearcount)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearcount,xBiasLimit:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearcount,xBiasLimit:number,xPulseLimit:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplinearmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplinearcount,xBiasLimit:number,xPulseLimit:number,failAbort:smusourcepulsesweeplinearfailAbort)
function smu.source.pulsesweeplinear(configListName, biasLevel, start, stop, points, pulseWidth, measEnable, bufferName, sDelay, offTime, count, xBiasLimit, xPulseLimit, failAbort, dual)  end

smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplogmeasEnable
---|`smu.ON`
---|`smu.OFF`


smu.INFINITEF = nil

---@alias smusourcepulsesweeplogcount
---|`smu.INFINITEF`


smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplogfailAbort
---|`smu.ON`
---|`smu.OFF`


smu.OFF = nil
smu.ON = nil

---@alias smusourcepulsesweeplogdual
---|`smu.OFF`
---|`smu.ON`



--- **This function sets up a logarithmic pulse sweep for a set number of source points.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before configuring a pulse operation, configure your measure settings. Pulse operations use the measure settings that were last defined before the pulse operation; you may get unexpected results if you do not define the measure settings first.When the pulse sweep is started, the instrument sources a specific voltage or current value to the device under test (DUT). A measurement is made for each point of the pulse sweep.When the pulse sweep command is sent, it clears the existing trigger model and creates a new trigger model. To run the pulse sweep, initiate the trigger model.The pulse sweep continues until the source outputs the specified stop level. At this level, the instrument performs another measurement and then stops the pulse sweep.When you specify a delay, a delay block is added to the pulse sweep trigger model.The asymptote changes the inflection of the pulse sweep curve and allows it to sweep through zero. You can use the asymptote parameter to customize the inflection and offset of the source value curve. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep. It must be outside of the range defined by the starting and ending values.The name of the source configuration list determines the name of the measure configuration list; Meas is appended to the beginning of the name. If the name of your configuration list is greater than 28 characters, it is truncated to include only the first 28 characters (including the prefix Meas that is added for the measure configuration list). For example, if the source configuration list is named VoltPulseLogarithSweepList (26 characters), the resulting measure configuration list is named MeasVoltPulseLogarithSweepList (30 characters). If the source configuration list is named MyLongPulseNameSweepConfigList (30 characters), the resulting measure configuration list is MeasMyLongPulseNameSweepConfigLi (32 characters).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63473.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.range = 100
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.range = 1
--- smu.source.readback = smu.ON
--- smu.measure.autozero.enable = smu.ON
--- smu.measure.nplc = .1
--- smu.source.pulsesweeplog("VoltLogSweep", 0, 1, 100, 50, 20e-3, smu.ON, defbuffer1, 0, 80e-3, 5, 1, 1)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its default settings.
--- --Set the source function to voltage and the source voltage range to 100 V.
--- --Set the measure function to current and the measure current range to 1 A.
--- --Turn on source readback, enable autozero and set the NPLC to 0.1.
--- --Set up a logarithmic sweep from 1 V to 100 V in 50 steps. Set the pulse width to 20 ms, the off time to 80 ms,  and repeat the sweep five times.
--- --Start the pulse sweep.
--- ```
---@param configListName string The name of the source configuration list that the sweep uses; this must be defined before sending this command
---@param biasLevel number Output level the instrument sources before the first pulse and returns to between pulses (delay and off time)
---@param start number The voltage or current source level at which the pulse sweep starts
---@param stop number The voltage or current source level at which the pulse sweep stops
---@param points number The number of pulse-measure points between the start and stop values of the pulse sweep (2 to 1e6)
---@param pulseWidth number The time at the amplitude level for each pulse
---@param measEnable smusourcepulsesweeplogmeasEnable Enable or disable measurements at the top of each pulse
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@param sDelay number The amount of time that the instrument stays at bias level before each pulse (in seconds)
---@param offTime number The amount of time that the instrument stays at bias level after each pulse (in seconds)
---@param count smusourcepulsesweeplogcount The number of pulse sweeps; default is 1
---@param xBiasLimit number The current or voltage limit for the defined bias level
---@param xPulseLimit number The current or voltage limit for the defined pulse level
---@param failAbort smusourcepulsesweeplogfailAbort Determines if the sweep is stopped immediately if a limit is exceeded; options are
---@param dual smusourcepulsesweeplogdual Determines if the sweep runs from start to stop and then from stop to start
---@param asymptote number Default is 0; see Details
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplogcount)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplogcount,xBiasLimit:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplogcount,xBiasLimit:number,xPulseLimit:number)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplogcount,xBiasLimit:number,xPulseLimit:number,failAbort:smusourcepulsesweeplogfailAbort)
---@overload fun(configListName:string,biasLevel:number,start:number,stop:number,points:number,pulseWidth:number,measEnable:smusourcepulsesweeplogmeasEnable,bufferName:bufferMethods,sDelay:number,offTime:number,count:smusourcepulsesweeplogcount,xBiasLimit:number,xPulseLimit:number,failAbort:smusourcepulsesweeplogfailAbort,dual:smusourcepulsesweeplogdual)
function smu.source.pulsesweeplog(configListName, biasLevel, start, stop, points, pulseWidth, measEnable, bufferName, sDelay, offTime, count, xBiasLimit, xPulseLimit, failAbort, dual, asymptote) end

smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplistmeasEnable
---|`smu.ON`
---|`smu.OFF`


smu.INFINITEF = nil

---@alias smusourcepulsesweeplistcount
---|`smu.INFINITEF`


smu.ON = nil
smu.OFF = nil

---@alias smusourcepulsesweeplistfailAbort
---|`smu.ON`
---|`smu.OFF`



--- **This function sets up a pulse sweep based on a configuration list, which allows you to customize the sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command allows you to set up a custom pulse sweep using a configuration list to specify the pulse levels.Before configuring a pulse operation, configure your measure settings. Pulse operations use the measure settings that were last defined before the pulse operation; you may get unexpected results if you do not define the measure settings first.When you specify a delay, a delay block is added to the pulse sweep trigger model. A source configuration list must be created before you send this command. The name of the source configuration list determines the name of the measure configuration list; Meas is appended to the beginning of the name. If the name of your configuration list is greater than 28 characters, it is truncated to include only the first 28 characters (including the prefix Meas that is added for the measure configuration list). For example, if the source configuration list is named CurrentPulseCustomSweepList (27 characters), the resulting measure configuration list is named MeasCurrentPulseCustomSweepList (31 characters). If the source configuration list is named MyLongPulseNameSweepConfigList (30 characters), the resulting measure configuration list is MeasMyLongPulseNameSweepConfigLi (32 characters)To run the pulse sweep, initiate the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63474.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.source.configlist.create("CurrPulseListSweep")
--- smu.source.func = smu.FUNC_DC_CURRENT
--- smu.source.level = 0
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.range = 10
--- smu.source.pulse.vlimit.level = 10
--- smu.source.pulse.level = .5
--- smu.source.configlist.store("CurrPulseListSweep")
--- smu.source.pulse.level = .3
--- smu.source.configlist.store("CurrPulseListSweep")
--- smu.source.pulse.level = .7
--- smu.source.configlist.store("CurrPulseListSweep")
--- smu.source.pulse.level = .1
--- smu.source.configlist.store("CurrPulseListSweep")
--- smu.source.pulse.level = .6
--- smu.source.configlist.store("CurrPulseListSweep")
--- smu.source.pulsesweeplist("CurrPulseListSweep", 100e-3, smu.ON, defbuffer1, 1, 1,
---    0, 100e-3, smu.ON)
--- trigger.model.initiate()
--- 
--- --Reset the instrument to its default settings.
--- --Create a source configuration list called CurrPulseListSweep.
--- --Set the source function to current, the source current range to 1 A.
--- --Set the measure function to voltage, the measure range to 10 V and the source pulse limit to 10 V.
--- --Set the source current level to 500 mA and save the source settings to CurrPulseListSweep.
--- --Set the source current level to 300 mA and save the source settings to CurrPulseListSweep.
--- --Set the source current level to 700 mA and save the source settings to CurrPulseListSweep.
--- --Set the source current level to 100 mA and save the source settings to CurrPulseListSweep.
--- --Set the source current level to 600 mA and save the source settings to CurrPulseListSweep.
--- -- 
--- --Sets up a pulse sweep that uses the entries from CurrPulseListSweep. Set a pulse width of 100 ms and an off time of 100 ms. Start the sweep at index 1 and save the measure results to defbuffer1.
--- --Set a source delay of 1 ms.
--- --Start the pulse sweep.
--- ```
---@param configListName string The name of the source configuration list that the sweep uses; this must be defined before sending this command
---@param pulseWidth number The time at the amplitude level for each pulse
---@param measEnable smusourcepulsesweeplistmeasEnable Enable or disable measurements at the top of each pulse
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; defaults to defbuffer1
---@param count smusourcepulsesweeplistcount The number of pulse sweeps; default is 1
---@param sDelay number The amount of time that the instrument stays at bias level before each pulse (in seconds)
---@param offTime number The amount of time that the instrument stays at bias level after each pulse (in seconds)
---@param failAbort smusourcepulsesweeplistfailAbort Determines if the sweep is stopped immediately if a limit is exceeded; options are
---@overload fun(configListName:string,pulseWidth:number)
---@overload fun(configListName:string,pulseWidth:number,measEnable:smusourcepulsesweeplistmeasEnable)
---@overload fun(configListName:string,pulseWidth:number,measEnable:smusourcepulsesweeplistmeasEnable,bufferName:bufferMethods)
---@overload fun(configListName:string,pulseWidth:number,measEnable:smusourcepulsesweeplistmeasEnable,bufferName:bufferMethods)
---@overload fun(configListName:string,pulseWidth:number,measEnable:smusourcepulsesweeplistmeasEnable,bufferName:bufferMethods,count:smusourcepulsesweeplistcount)
---@overload fun(configListName:string,pulseWidth:number,measEnable:smusourcepulsesweeplistmeasEnable,bufferName:bufferMethods,count:smusourcepulsesweeplistcount,sDelay:number)
---@overload fun(configListName:string,pulseWidth:number,measEnable:smusourcepulsesweeplistmeasEnable,bufferName:bufferMethods,count:smusourcepulsesweeplistcount,sDelay:number,offTime:number)
function smu.source.pulsesweeplist(configListName, pulseWidth, measEnable, bufferName, start_index, count, sDelay, offTime, failAbort) end

smu.FUNC_DC_CURRENTV = nil
smu.FUNC_DC_VOLTAGE = nil

---@alias smusourcesetattributemeasFunction
---|`smu.FUNC_DC_CURRENTV`
---|`smu.FUNC_DC_VOLTAGE`



--- **This function allows you to set up a source function whether or not the function is active.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can set the following parameters. The links in the list below link to the descriptions of the corresponding TSP command descriptions. The settings available for each parameter are the same as the settings for the TSP commands.The parameters you can set are:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91275.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.setattribute(smu.FUNC_DC_CURRENT, smu.ATTR_SRC_RANGE, 0.007)
--- smu.source.setattribute(smu.FUNC_DC_CURRENT, smu.ATTR_SRC_DELAY, 0.35)
--- smu.source.setattribute(smu.FUNC_DC_CURRENT, smu.ATTR_SRC_LEVEL, 0.035)
--- 
--- --Sets the range, delay, and level settings for DC current, whether or not DC current is the active function.
--- ```
---@param measFunction smusourcesetattributemeasFunction The source function; set to one of the following values
---@param setting functionAttributes | functions The parameter to be set; see Details
---@param value number The function or setting value
function smu.source.setattribute(measFunction, setting, value) end

smu.FUNC_DC_CURRENTV = nil
smu.FUNC_DC_VOLTAGE = nil

---@alias smusourcegetattributemeasFunction
---|`smu.FUNC_DC_CURRENTV`
---|`smu.FUNC_DC_VOLTAGE`



--- **This function returns the setting for a function attribute.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can retrieve one attribute at a time.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91276.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.source.getattribute(smu.FUNC_DC_CURRENT, smu.ATTR_SRC_DELAY))
--- 
--- --Retrieve the source delay setting for DC current.
--- --Example return:
--- --1.05e-07
--- ```
---@return number value The attribute value
---@param measFunction smusourcegetattributemeasFunction The source function
---@param setting functionAttributes | functions The setting of the attribute; refer to smu.source.setattribute() for the list of attributes
function smu.source.getattribute(measFunction, setting) end
---@class smu.interlock
smu.interlock = {}



smu.OFF = nil
smu.ON = nil

---@alias smuinterlocktrippedinterlockStatus
---|`smu.OFF`
---|`smu.ON`



--- **This attribute indicates that the interlock has been tripped.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command gives you the status of the interlock. When the safety interlock signal is asserted, all voltage ranges of the instrument are available. However, when the safety interlock signal is not asserted, the 100 V range is hardware limited to a nominal output of less than ±42 V.When the interlock is not asserted:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25729.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.interlock.tripped)
--- 
--- --If the interlock is not asserted, returns smu.OFF.
--- --If the interlock is asserted, returns smu.ON.
--- ```

smu.OFFO = nil
smu.ON = nil

---@alias smuinterlockenablestate
---|`smu.OFFO`
---|`smu.ON`



--- **This attribute determines if the output can be turned on when the interlock is not engaged.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/88873.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.interlock.enable = smu.ON
--- 
--- --The source output is disabled unless the interlock is engaged.
--- ```
---@type smuinterlockenablestate
smu.interlock.enable = 0

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
---[command help](command:kic.viewHelpDocument?["Commands_2461/28111.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31397.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31398.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31413.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = trigger.lanin[5].overrun
--- print(overrun)
--- 
--- --Checks the overrun status of a trigger on LAN5 and outputs the value, such as:
--- --false
--- ```
---@class triggerdigoutArr
triggerdigoutArr = {}

---@type triggerdigoutArr[]
trigger.digout = {}




--- **This attribute selects the event that causes a trigger to be asserted on the digital output line.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The digital trigger pulsewidth command determines how long the trigger is asserted.The trigger stimulus for a digital I/O line can be set to one of the trigger events that are described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30501.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31385.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31392.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31395.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33159.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30523.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31637.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31638.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.request_enable = status.OSB 
--- status.operation.setmap(0, 4918, 4917)
--- status.operation.enable = 1
--- defbuffer1.clear()
--- defbuffer1.fillmode = buffer.FILL_ONCE
--- defbuffer1.capacity = 10
--- smu.measure.count = 10
--- smu.measure.read()
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31639.htm"])
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
--- You can map events to bits in the event registers with this command. This allows you to cause bits in the condition and event registers to be set or cleared when the specified events occur. You can use any valid event number as the event that sets or clears bits.When a mapped event is programmed to set bits, the corresponding bits in both the condition register and event register are set when the event is detected.When a mapped event is programmed to clear bits, the bit in the condition register is set to 0 when the event is detected.If the event is set to zero (0), the bit is never set.See Event numbers for information about event numbers.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31648.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30524.htm"])
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
--- You can map events to bits in the event registers with this command. This allows you to cause bits in the condition and event registers to be set or cleared when the specified events occur. You can use any valid event number as the event that sets or clears bits.When a mapped event is programmed to set bits, the corresponding bits in both the condition register and event register are set when the event is detected.When a mapped event is programmed to clear bits, the bit in the condition register is set to 0 when the event is detected.If the event is set to zero (0), the bit is never set.See Event numbers for information about event numbers.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/31612.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31613.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31614.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31615.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30525.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31653.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30982.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31363.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31393.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31360.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31373.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31378.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31394.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31396.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31401.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31404.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31406.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31409.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31416.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/31419.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.lanout[5].stimulus = trigger.EVENT_TIMER1
--- 
--- --Use the timer 1 trigger event as the source for LAN trigger 5 stimulus.
--- ```
---@type eventID|0
triggerlanoutArr.stimulus= 0


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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33157.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32538.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32541.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32542.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32539.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32551.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32552.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32561.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32540.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32549.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32553.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32555.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/32558.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/40051.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_CURRENT
--- testcurrent = display.input.number("Enter a Test Current (0 to 1 A)", display.NFORMAT_PREFIX, 0, 0, 1)
--- smu.source.level = testcurrent
--- 
--- --This example displays a number pad on the screen that defaults to 0 and allows entries from 0 to 1. The number that the operator enters is assigned to the source current level. If the operator enters a value outside of the range, an error message is displayed.
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/40052.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/40053.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/40054.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value = display.input.string("Enter Test Name", display.SFORMAT_ANY)
--- print(value)
--- 
--- --This example displays the prompt "Enter Test Name" and a keyboard that the operator can use to enter a response.
--- --
--- --The return is the response from the operator.
--- ```
---@return string|nil textEntered The text that is entered from the front-panel display; nil if Cancel is pressed on the keypad
---@param dialogTitle string A string that contains the text to be displayed as the title of the dialog box on the front-panel display; up to 32 characters
---@param textFormat displayinputstringtextFormat The format of the entered text
---@overload fun(dialogTitle:string):string|nil
function display.input.string(dialogTitle, textFormat) end
---@class smu.digitize
smu.digitize = {}




--- **This function makes digitize measurements, places them in a reading buffer, and returns the last reading.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must set the instrument to make digitize measurements before sending this command with the smu.digitize.func attribute.This command initiates measurements using the present function settings, stores the readings in a reading buffer, and returns the last reading.This command makes the number of digitize measurements that is set by the smu.digitize.count attribute.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41093.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- voltMeasBuffer = buffer.make(10000)
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- print(smu.digitize.read(voltMeasBuffer))
--- 
--- --Create a buffer named voltMeasBuffer. Set the instrument to digitize voltage.
--- --Make a measurement that is stored in the voltMeasBuffer and is also printed.
--- ```
---@return number reading The last reading of the measurement process
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if nothing is specified, the reading is stored in defbuffer1
---@overload fun():number
function smu.digitize.read(bufferName) end

smu.DIGITS_6_55 = nil
smu.DIGITS_5_54 = nil
smu.DIGITS_4_53 = nil
smu.DIGITS_3_5 = nil

---@alias smudigitizedisplaydigitsvalue
---|`smu.DIGITS_6_55`
---|`smu.DIGITS_5_54`
---|`smu.DIGITS_4_53`
---|`smu.DIGITS_3_5`



--- **This attribute describes the number of digits that are displayed on the front panel for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command affects how the reading for a measurement is displayed on the front panel of the instrument. It does not affect the number of digits returned in a remote command reading. It also does not affect the accuracy or speed of measurements.The display digits setting is saved with the function setting, so if you use another function, then return to the function for which you set display digits, the display digits setting you set previously is retained.The change in digits occurs the next time a measurement is made.To change the number of digits returned in a remote command reading, use format.asciiprecision.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41150.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.displaydigits = smu.DIGITS_3_5
--- 
--- --Set the instrument to use the digitize current measure function.
--- --Set the front panel to display 3½ digits.
--- ```
---@type smudigitizedisplaydigitsvalue
smu.digitize.displaydigits = 0



--- **This attribute sets a user-defined delay that you can use in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To use this command in a trigger model, assign the delay to the dynamic delay block.The delay is specific to the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41269.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.userdelay[2] = 0.5
--- trigger.model.setblock(6, trigger.BLOCK_DELAY_DYNAMIC, trigger.USER_DELAY_M2)
--- 
--- --Set user delay 2 to be 0.5 s. Sets trigger-model block 6 to use the delay.
--- ```
---@type integer[]
smu.digitize.userdelay= 0



--- **This attribute sets the number of measurements to digitize when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The digitize function makes the number of readings set by this command in the time set by the sample rate. This command does not affect the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41297.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.aperture = smu.APERTURE_AUTO
--- smu.digitize.samplerate = 1000000
--- smu.digitize.count = 10
--- print(smu.digitize.read())
--- 
--- --Set the digitize function to measure current. Set the sample rate to 1,000,000, with a count of 10, and automatic aperture.
--- --Make a digitize measurement.
--- --Example output:
--- ---0.0039799990218
--- ```
smu.digitize.count = 0



--- **This attribute determines the positive full-scale measure range for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When you assign a range value, the instrument selects a fixed range that is large enough to measure the assigned value. The instrument selects the best range for measuring the maximum expected value.For example, for digitize current measurements, if you expect a reading of approximately 9 mA, set the range to 9 mA to select the 10 mA range.When you read this setting, you see the positive full-scale value of the measurement range that the instrument is presently using.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41306.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.range = 90
--- 
--- --Set the function to digitize voltage. Set the range to 90 V, which selects the 100 V range.
--- ```
smu.digitize.range = 0


smu.FUNC_DIGITIZE_CURRENTV = nil
smu.FUNC_DIGITIZE_VOLTAGEN = nil
smu.FUNC_NONE = nil

---@alias smudigitizefuncvalue
---|`smu.FUNC_DIGITIZE_CURRENTV`
---|`smu.FUNC_DIGITIZE_VOLTAGEN`
---|`smu.FUNC_NONE`



--- **This attribute determines which digitize function is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this command to the type of measurement you want to digitize.Reading this command returns the digitize function that is presently active.If a basic (non-digitize) measurement function is selected, this returns smu.FUNC_NONE. The none setting is automatically made if you select a function with smu.measure.func or through the options from the front-panel Measure Functions tab.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41428.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- 
--- --Set the measurement function to digitize current.
--- ```
---@type smudigitizefuncvalue
smu.digitize.func = 0


smu.APERTURE_AUTO = nil

---@alias smudigitizeaperturetime
---|`smu.APERTURE_AUTO`



--- **This attribute determines the aperture setting for the selected function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The aperture is the actual acquisition time of the instrument on the signal. The aperture can be set to automatic or to a specific value in 1 μs intervals. If the value is not specified in microseconds, the value is rounded down to the nearest microsecond resolution. When automatic is selected, the aperture setting is set to the maximum value possible for the selected sample rate.The aperture must be less than the reciprocal of the sample rate. The minimum aperture is 1 μs when the maximum sampling rate is 1,000,000 samples per second.Set the sample rate before changing the aperture.The maximum aperture available is 1 divided by the sample rate. The aperture cannot be set to more than this value.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41431.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.samplerate = 200000
--- smu.digitize.aperture = smu.APERTURE_AUTO
--- smu.digitize.count = 1
--- print(smu.digitize.read())
--- 
--- --Set the digitize function to measure current. Set the sample rate to 200,000, with a count of 1, and automatic aperture.
--- --Make a digitize measurement.
--- ```
---@type smudigitizeaperturetime
smu.digitize.aperture = 0



--- **This attribute defines the precise acquisition rate at which the digitizing measurements are made.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The sample rate determines how fast the Model 2461 acquires a digitized reading.Set the sample rate before setting the aperture. If the aperture setting is too high for the selected sample rate, it is automatically adjusted to the highest aperture that can be used with the sample rate.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41433.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.samplerate = 200000
--- smu.digitize.aperture = smu.APERTURE_AUTO
--- smu.digitize.count = 1
--- print(smu.digitize.read())
--- 
--- --Set the digitize function to digitize current. Set the sample rate to 200,000, with a count of 1, and automatic aperture.
--- --Make a digitize measurement.
--- ```
smu.digitize.samplerate = 0



--- **This function initiates digitize measurements and returns the last actual measurement and time information in UTC format without using the trigger mode.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command initiates digitize measurements using the present function settings, stores the readings in a reading buffer, and returns the last reading.The smu.digitize.count attribute determines how many measurements are performed.When you use a reading buffer with a command or action that makes multiple readings, all readings are available in the reading buffer. However, only the last reading is returned as a reading with the command.If you define a specific reading buffer, the reading buffer must exist before you make the measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41622.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.digitize.readwithtime(defbuffer1))
--- 
--- --Print the last digitize measurement and time information from defbuffer1 in UTC format, which will look similar to:
--- ---0.0003882925875	1415795836	0.946164546
--- ```
---@return number reading The last reading of the measurement process
---@return number seconds Seconds in UTC format
---@return number fractional Fractional seconds
---@param bufferName bufferMethods The name of the reading buffer, which may be a default buffer (defbuffer1 or defbuffer2) or a user-defined buffer; if no buffer is specified, this parameter defaults to defbuffer1
---@overload fun():number
function smu.digitize.readwithtime(bufferName) end

smu.UNIT_VOLTO = nil
smu.UNIT_OHMW = nil
smu.UNIT_WATTU = nil
smu.UNIT_AMPO = nil
smu.UNIT_OHMW = nil
smu.UNIT_WATT = nil

---@alias smudigitizeunitvalue
---|`smu.UNIT_VOLTO`
---|`smu.UNIT_OHMW`
---|`smu.UNIT_WATTU`
---|`smu.UNIT_AMPO`
---|`smu.UNIT_OHMW`
---|`smu.UNIT_WATT`



--- **This attribute sets the units of measurement that are displayed on the front panel of the instrument and stored in the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The change in measurement units is displayed when the next measurement is made.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/43717.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.unit = smu.UNIT_WATT
--- 
--- --Set the measure function to digitize voltage.
--- --Set the units to display as watts.
--- ```
---@type smudigitizeunitvalue
smu.digitize.unit = 0


smu.SENSE_2WIREF = nil
smu.SENSE_4WIRE = nil

---@alias smudigitizesensesensing
---|`smu.SENSE_2WIREF`
---|`smu.SENSE_4WIRE`



--- **This attribute selects local (2-wire) or remote (4-wire) sensing for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command determines if 2-wire (local) or 4-wire (remote) sensing is used.When you use 4-wire sensing, voltages are measured at the device under test (DUT). For the source voltage, if the sensed voltage is lower than the programmed amplitude, the voltage source increases the voltage until the sensed voltage is the same as the programmed amplitude. This compensates for IR drop in the output test leads.Using 4-wire sensing with voltage measurements eliminates any voltage drops that may be in the test leads between the Model 2461 and the DUT.When you are using 2-wire sensing, voltage is measured at the output connectors.When you are measuring resistance, you can enable 4-wire sensing to make 4-wire resistance measurements.When the output is off, 4-wire sensing is disabled and the instrument uses 2-wire sense, regardless of the sense setting. When the output is on, the selected sense setting is used.If the output is on when you change the sense setting, the output is turned off. 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63460.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_CURRENT
--- smu.digitize.sense = smu.SENSE_4WIRE
--- 
--- --Set the measurement function to digitize current.
--- --Set the sense to 4-wire remote.
--- ```
---@type smudigitizesensesensing
smu.digitize.sense = 0

---@class acal.lastrun
acal.lastrun = {}




--- **This attribute returns the internal temperature of the instrument when autocalibration was run.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The temperature is displayed in Celsius (°C).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/43635.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.lastrun.internaltemp)
--- 
--- --Returns the internal temperature of the instrument when autocalibration was last run.
--- --Example output:
--- --63.167084
--- ```


--- **This attribute returns the date and time when autocalibration was last run.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The date and time is returned in the format:MM/DD/YYYY HH:MM:SS.NNNNNNNNNWhere:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/43636_1.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.lastrun.time)
--- 
--- --Returns the date and time when the autocalibration was last run.
--- --Example output:
--- --08/11/2014 16:30:26.745369595
--- ```


--- **This attribute returns the difference between the internal temperature and the temperature when autocalibration was last run.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- The temperature is displayed in Celsius (°C).
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/46331.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(acal.lastrun.tempdiff)
--- 
--- --Returns the difference between the temperature of the instrument when autocalibration was run and the present internal temperature.
--- --Example output:
--- --4.5678
--- ```
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/46427.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/46428.htm"])
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
---@class smu.contact
smu.contact = {}



smu.OND = nil
smu.OFF = nil

---@alias smucontactenablestate
---|`smu.OND`
---|`smu.OFF`



--- **This attribute indicates whether the contact check function is enabled or disabled on the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this command to enable or disable the contact check function. To avoid getting error messages, contact check must be enabled before checking the status of instrument connections.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63461.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.contact.enable = smu.ON
---  
--- print(smu.contact.enable)
--- 
--- --Enable contact check operation.
--- -- 
--- --Query whether contact check is enabled.
--- --Output:
--- --smu.ON
--- --Indicates contact check is enabled.
--- ```
---@type smucontactenablestate
smu.contact.enable = 0


smu.THRESHOLD_2_OHM15 = nil
smu.THRESHOLD_15_OHM50 = nil
smu.THRESHOLD_50_OHM = nil

---@alias smucontactthresholdlevel
---|`smu.THRESHOLD_2_OHM15`
---|`smu.THRESHOLD_15_OHM50`
---|`smu.THRESHOLD_50_OHM`



--- **This attribute sets the threshold value for contact resistance for the contact check status functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The contact check functions indicate a failure when the connection path resistance exceeds the value specified by this command.This command can be sent when contact check isn't enabled. However, you must enable contact check before checking the status of connections.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63462.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.contact.threshold = smu.THRESHOLD_15_OHM
---  
--- print(smu.contact.threshold)
--- 
--- --Set the contact check function to indicate a failure if resistance is greater than 15 Ω.
--- --Query the contact check threshold setting.
--- --Output: 
--- --smu.THRESHOLD_15_OHM
--- --Indicates that the contact check threshold is set to 15 Ω.
--- ```
---@type smucontactthresholdlevel
smu.contact.threshold = 0



--- **This function indicates whether one or more connections failed the contact check operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- result = smu.contact.check()Use this function to check for excessive contact resistance at any of the connections to the device under test (DUT).Use the print() command to query the result of the contact check operation. The query returns false if one or more connections exceed the threshold resistance level set by the smu.contact.threshold attribute, or it returns true if no connections exceed that value. If you get a failed indication when sending this function, you can use the smu.contact.checkall() function to determine which connection failed the contact check test.Sending this command when contact check is not enabled results in an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63463.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.contact.enable = smu.ON
--- print(smu.contact.check())
--- 
--- --Enable contact check
--- --Check connections for excessive contact resistance.
--- --Output:
--- --true
--- --Indicates that all connections passed the contact check operation.
--- ```
---@return any result The result of the contact check operation
function smu.contact.check() end


--- **This function checks the high, low, and guard connections for excessive contact resistance.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to check the high, low, and guard connections to the device under test (DUT) for excessive contact resistance. Use the print() command to query the result of the contact check operation. For each of the three connections, this command returns false if the threshold resistance exceeds the level specified by the smu.contact.threshold command, or true if it does not exceed that value.If you get a failed indication when sending the smu.contact.check() function, use this function to determine which connection failed.Sending this command when contact check is not enabled results in an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63464.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.contact.enable = smu.ON
--- print(smu.contact.checkall())
--- 
--- --Enable contact check.
--- --Get the status of high, low, and guard connections for contact check.
--- --Output:
--- --false false true
--- --Indicates that the high and low connections exceeded the specified contact check resistance threshold value, but the guard connection did not exceed that value.
--- ```
---@return any high The result of the contact check operation for the high connection
---@return any low The result of the contact check operation for the low connection
---@return any guard The result of the contact check operation for the guard connection
function smu.contact.checkall() end
---@class smu.measure.math
smu.measure.math = {}



smu.OFFE = nil
smu.ON = nil

---@alias smumeasuremathenablevalue
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables math operations on measurements for the selected measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25644.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.math.format = smu.MATH_PERCENT
--- smu.measure.math.enable = smu.ON
--- 
--- --When voltage measurements are made, the math format is enabled and set to percent.
--- ```
---@type smumeasuremathenablevalue
smu.measure.math.enable = 0


smu.MATH_MXBP = nil
smu.MATH_PERCENTR = nil
smu.MATH_RECIPROCAL = nil

---@alias smumeasuremathformatoperation
---|`smu.MATH_MXBP`
---|`smu.MATH_PERCENTR`
---|`smu.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This specifies which math operation is performed on measurements for the selected measurement function.You can choose one of the following math operations:Math calculations are applied to the input signal after relative offset and before limit tests.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25687.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.math.format = smu.MATH_RECIPROCAL
--- smu.measure.math.enable = smu.ON
--- 
--- --Enables the reciprocal math operation on voltage measurements.
--- ```
---@type smumeasuremathformatoperation
smu.measure.math.format = 0



--- **This attribute specifies the reference constant that is used when math operations are set to percent.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This is the constant that is used when the math operation is set to percent for the selected measurement function.The percent math function displays measurements as percent deviation from a specified reference constant. The percent calculation is:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.math.format = smu.MATH_PERCENT
--- smu.measure.math.percent = 50
--- smu.measure.math.enable = smu.ON
--- 
--- --Set the measurement function to voltage.
--- --Set the math operations to percent.
--- --Set the percentage value to 50 for voltage measurements.
--- --Enable math operations.
--- ```
smu.measure.math.percent = 0

---@class smu.measure.rel
smu.measure.rel = {}




--- **This function acquires a measurement and stores it as the relative offset value.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command triggers the instrument to make a new measurement for the selected function. This measurement is then stored as the new relative offset level.When you send this command, the instrument does not apply any math, limit test, or filter settings to the measurement, even if they are set. It is a measurement that is made as if these settings are disabled.If an error event occurs during the measurement, nil is returned and the relative offset level remains at the last valid setting.You must change to the function for which you want to acquire a value before sending this command.The instrument must have relative offset enabled to use the acquired relative offset value.After executing this command, you can use the smu.measure.rel.level attribute to see the last relative level value that was acquired or that was set.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25645.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- rel_value = smu.measure.rel.acquire()
--- smu.measure.rel.enable = smu.ON
--- 
--- --Acquires a relative offset level value for voltage measurements and turns the relative offset feature on.
--- ```
---@return number relativeValue The internal measurement acquired for the relative offset value
function smu.measure.rel.acquire() end

smu.OFFE = nil
smu.ON = nil

---@alias smumeasurerelenablerelEnable
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables the application of a relative offset value to the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value calculated when you acquire the relative offset value.Each returned measured relative reading is the result of the following calculation:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29986.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- rel_value = smu.measure.rel.acquire()
--- smu.measure.rel.enable = smu.ON
--- 
--- --Acquires a relative offset level value for voltage measurements and turns the relative offset feature on.
--- ```
---@type smumeasurerelenablerelEnable
smu.measure.rel.enable = 0



--- **This attribute contains the relative offset value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the relative offset value that can be applied to new measurements. When relative offset is enabled, all subsequent measured readings are offset by the value that is set for this command.You can set this value, or have the instrument acquire a value. If the instrument acquires the value, read this setting to return the value that was measured internally.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29987.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.rel.level = smu.measure.read()
--- smu.measure.rel.enable = smu.ON
--- 
--- --Sets the measurement function to current, performs a current measurement, uses it as the relative offset value, and enables the relative offset for current measurements.
--- ```
smu.measure.rel.level = 0

---@class smumeasurelimitArr
smumeasurelimitArr = {}

---@type smumeasurelimitArr[]
smu.measure.limit = {}



smu.OFFE = nil
smu.ON = nil

---@alias smumeasurelimitautoclearvalue
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25682.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.limit[1].autoclear = smu.ON
--- 
--- --Turns on autoclear for limit 1 when measuring DC current.
--- ```
---@type smumeasurelimitautoclearvalue
smumeasurelimitArr.autoclear= 0



--- **This function clears the results of the limit test defined by Y for the selected measurement function.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to clear the test results of limit Y when the limit auto clear option is turned off. Both the high and low test results are cleared.To avoid the need to manually clear the test results for a limit, turn the auto clear option on.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25683.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.limit[2].clear()
--- 
--- --Clears the test result for the high and low limit 2 for current measurements.
--- ```
function smumeasurelimitArr.clear() end


smu.FAIL_NONE = nil
smu.FAIL_HIGH = nil
smu.FAIL_LOW = nil
smu.FAIL_BOTH = nil

---@alias smumeasurelimitfailresult
---|`smu.FAIL_NONE`
---|`smu.FAIL_HIGH`
---|`smu.FAIL_LOW`
---|`smu.FAIL_BOTH`


smu.FUNC_DC_VOLTAGEC = nil
smu.FUNC_DC_CURRENT = nil
smu.FUNC_RESISTANCE = nil

---@alias smumeasurelimitfailmeasFunction
---|`smu.FUNC_DC_VOLTAGEC`
---|`smu.FUNC_DC_CURRENT`
---|`smu.FUNC_RESISTANCE`



--- **This attribute queries the results of a limit test.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command queries the result of a limit test for the selected measurement function.The response message indicates if the limit test passed or how it failed (on the high or low limit).If autoclear is set to off, reading the results of a limit test does not clear the fail indication of the test. To clear a failure, send the clear command. To automatically clear the results, set auto clear on.If auto clear is set to on and you are making a series of measurements, the last measurement limit determines the fail indication for the limit. If auto clear is turned off, the results return a test fail if any of one of the readings failed.To use this attribute, you must set the limit state to on.If the readings are stored in a reading buffer, you can use the bufferVar.statuses command to see the results.This example enables limits 1 and 2 for voltage, measurements. Limit 1 is checking for readings to be between 3 and 5 V, while limit 2 is checking for the readings to be between 1 and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25684.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- -- set the instrument source current
--- smu.source.func = smu.FUNC_DC_CURRENT
--- -- set the instrument to measure voltage
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- -- set the range to 10 V
--- smu.measure.range = 10
--- -- set the nplc to 0.1
--- smu.measure.nplc = 0.1
--- -- disable auto clearing for limit 1
--- smu.measure.limit[1].autoclear = smu.OFF
--- -- set high limit on 1 to fail if reading exceeds 5 V
--- smu.measure.limit[1].high.value = 5
--- -- set low limit on 1 to fail if reading is less than 3 V
--- smu.measure.limit[1].low.value = 3
--- --- set the beeper to sound if the reading exceeds the limits for limit 1
--- smu.measure.limit[1].audible = smu.AUDIBLE_FAIL
--- -- enable limit 1 checking for voltage measurements
--- smu.measure.limit[1].enable = smu.ON
--- -- disable auto clearing for limit 2
--- smu.measure.limit[2].autoclear = smu.OFF
--- -- set high limit on 2 to fail if reading exceeds 7 V
--- smu.measure.limit[2].high.value = 7
--- -- set low limit on 2 to fail if reading is less than 1 V
--- smu.measure.limit[2].low.value = 1
--- -- enable limit 2 checking for voltage measurements
--- smu.measure.limit[2].enable = smu.ON
--- -- set the measure count to 50
--- smu.measure.count = 50
--- -- create a reading buffer that can store 100 readings
--- LimitBuffer = buffer.make(100)
--- -- make 50 readings and store them in LimitBuffer
--- smu.measure.read(LimitBuffer)
--- -- Check if any of the 50 readings were outside of the limits
--- print("limit 1 results = " .. smu.measure.limit[1].fail)
--- print("limit 2 results = " .. smu.measure.limit[2].fail)
--- -- clear limit 1 conditions
--- smu.measure.limit[1].clear()
--- -- clear limit 2 conditions
--- smu.measure.limit[2].clear()
--- 
--- --Example output that shows all readings are within limit values (all readings between 3 V and 5 V):
--- --limit 1 results = smu.FAIL_NONE
--- --limit 2 results = smu.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 high values (a 6 V reading would cause this condition or a reading greater than 5 V but less than 7 V):
--- --limit 1 results = smu.FAIL_HIGH
--- --limit 2 results = smu.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 and 2 low values (a 0.5 V reading would cause this condition or a reading less than 1 V):
--- --limit 1 results = smu.FAIL_LOW
--- --limit 2 results = smu.FAIL_LOW
--- ```

smu.OFFE = nil
smu.ON = nil

---@alias smumeasurelimitenablestate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables a limit test on the measurement from the selected measure function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables a limit test for the selected measurement function. When this attribute is enabled, the limit Y testing occurs on each measurement made by the instrument. Limit Y testing compares the measurements to the high-limit and low-limit values. If a measurement falls outside these limits, the test fails.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29884.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.limit[1].enable = smu.ON
--- 
--- --Enable testing for limit 1 when measuring voltage.
--- ```
---@type smumeasurelimitenablestate
smumeasurelimitArr.enable= 0


smu.AUDIBLE_NONEO = nil
smu.AUDIBLE_FAILO = nil
smu.AUDIBLE_PASS = nil

---@alias smumeasurelimitaudiblestate
---|`smu.AUDIBLE_NONEO`
---|`smu.AUDIBLE_FAILO`
---|`smu.AUDIBLE_PASS`



--- **This attribute determines if the instrument beeper sounds when a limit test passes or fails.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The tone and length of beeper cannot be adjusted.See smu.measure.limit[Y].fail for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41684.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state
--- 
--- --When the beeper sounds:
--- --Never: smu.AUDIBLE_NONEOn test failure: smu.AUDIBLE_FAILOn test pass: smu.AUDIBL--- ```
---@type smumeasurelimitaudiblestate
smumeasurelimitArr.audible= 0

---@class smu.measure.configlist
smu.measure.configlist = {}




--- **This function creates an empty measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command creates an empty configuration list. To add configuration indexes to this list, you need to use the store command.Configuration lists are not saved when the instrument is turned off. To save a configuration list, create a configuration script to save instrument settings, including any defined configuration lists.Configuration list names must be unique. For example, the name of a source configuration list cannot be the same as the name of a measure configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25691.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.configlist.create("MyMeasList")
--- 
--- --Create a measure configuration list named MyMeasList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
function smu.measure.configlist.create(listName) end


--- **This function returns the name of one measure configuration list that is stored on the instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this command to retrieve the names of measure configuration lists that are stored in the instrument. This command returns one name each time you send it. This command returns nil to indicate that there are no more names to return. If the command returns nil the first time you send it, no measure configuration lists have been created for the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28417.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.measure.configlist.catalog())
--- 
--- --Request the name of one measure configuration list that is stored in the instrument. Send the command again until it returns nil to get all stored lists.
--- ```
function smu.measure.configlist.catalog() end


--- **This function returns a list of TSP commands and parameter settings that are stored in the specified configuration index.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command recalls data for one configuration index.For additional information about the information this command recalls when using a configuration list query command, see Settings stored in a measure configuration index.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28418.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.range = 35e-3
--- smu.measure.configlist.create("MyDigiCurrList")
--- smu.measure.configlist.store("MyDigiCurrList")
--- print(smu.measure.configlist.query("MyDigiCurrList", 1, '\n'))
--- 
--- --Set the digitize function to current and the range to 35 mA. Create a configuration list named MyDigiCurrList and store the active digitize settings in index 1 of that list. Then query for all of the digitize settings for index 1 in that list.
--- -- 
--- --Output:
--- --smu.measure.func = is not used
--- --smu.measure.range = is not used
--- --smu.measure.autorange = = smu.OFF
--- --smu.measure.autorangelow = is not used
--- --smu.measure.autozero.enable = = smu.OFF
--- --smu.measure.displaydigits = is not used
--- --smu.measure.filter.enable = = smu.OFF
--- --smu.measure.filter.count = is not used
--- --smu.measure.filter.type = is not used
--- --smu.measure.limit[1].autoclear = = smu.OFF
--- --smu.measure.limit[1].enable = = smu.OFF
--- --smu.measure.limit[1].audible = is not used
--- --smu.measure.limit[1].high.value = is not used
--- --smu.measure.limit[1].low.value = is not used
--- --smu.measure.limit[2].autoclear = = smu.OFF
--- --smu.measure.limit[2].audible = is not used
--- --smu.measure.limit[2].enable = = smu.OFF
--- --smu.measure.limit[2].high.value = is not used
--- --smu.measure.limit[2].low.value = is not used
--- --smu.measure.math.enable = = smu.OFF
--- --smu.measure.math.format = is not used
--- --smu.measure.math.mxb.bfactor = is not used
--- --smu.measure.math.mxb.mfactor = is not used
--- --smu.measure.math.percent = is not used
--- --smu.measure.userdelay[1] = is not used
--- --smu.measure.userdelay[2] = is not used
--- --smu.measure.userdelay[3] = is not used
--- --smu.measure.userdelay[4] = is not used
--- --smu.measure.userdelay[5] = is not used
--- --smu.measure.nplc = is not used
--- --smu.measure.offsetcompensation = = smu.OFF
--- --smu.measure.autorangehigh = is not used
--- --smu.measure.sense = is not used
--- --smu.measure.unit = is not used
--- --smu.measure.rel.enable = = smu.OFF
--- --smu.measure.rel.level = is not used
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@param fieldSeparator string String that represents the separator for the data; use one of the following
---@overload fun(listName:string,index:number)
function smu.measure.configlist.query(listName, index, fieldSeparator) end


--- **This function recalls a configuration index in a measure configuration list and an optional source configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to recall the settings stored in a specific configuration index in a measure configuration list. If you do not specify an index when you send the command, it recalls the settings stored in the first configuration index in the specified measure configuration list. You can optionally specify a source configuration list and index to recall with the measure settings. If you do not specify a source index, the source index defaults to match the measure index. Specify a measure and source list together with this command to allow the instrument to coordinate the application of the settings in the two lists appropriately. If you do not need the source and measure configuration lists coordinated, you can specify just the measure configuration list with this command and use the smu.source.configlist.recall() command to recall source settings separately in your application.If you recall an invalid index (for example, calling index 3 when there are only two indexes in the configuration list) or try to recall an index from an empty configuration list, an error message is displayed.Each index contains the settings for the selected function of that index. Settings for other functions are not affected when the configuration list index is recalled. A single index stores the settings associated with a single measure or digitize function.This command recalls data for one configuration index from the specified measure configuration list and from the source configuration list (if specified).For additional information about the information this command recalls when using a configuration list query command, see Settings stored in a measure configuration index.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28419.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.configlist.recall("MyMeasList")
--- 
--- --Because an index was not specified, this command recalls configuration index 1 from a configuration list named MyMeasList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the measure configuration list
---@param sourceListName number A string that represents the name of a source configuration list
---@param sourceIndex any A number that defines a specific configuration index in the source configuration list
---@overload fun(listName:string)
---@overload fun(listName:string,index:number)
---@overload fun(listName:string,index:number,sourceListName:number)
function smu.measure.configlist.recall(listName, index, sourceListName, sourceIndex) end


--- **This function deletes a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Deletes a configuration list. If the index is not specified, the entire configuration list is deleted. If the index is specified, only the specified configuration index in the list is deleted.When an index is deleted from a configuration list, the index numbers of the following indexes are shifted up by one. For example, if you have a configuration list with 10 indexes and you delete index 3, the index that was numbered 4 becomes index 3, and the all the following indexes are renumbered in sequence to index 9. Because of this, if you want to delete several nonconsecutive indexes in a configuration list, it is best to delete the higher numbered index first, then the next lower index, and so on. This also means that if you want to delete all the indexes in a configuration list, you must delete index 1 repeatedly until all indexes have been removed.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/28421.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.configlist.delete("myMeasList")
--- 
--- --Delete a measure configuration list named myMeasList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@overload fun(listName:string)
function smu.measure.configlist.delete(listName, index) end


--- **This function stores the active measure or digitize settings into the named configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to store the active measure or digitize settings to a configuration index in a configuration list. If the index parameter is not provided, the new settings are appended to the end of the list. The index only stores the active settings for a single active measure or digitize function.A measure configuration list can store measure or digitize settings. If the active function is a digitize function, digitize settings are saved. When the index is queried, digitize settings and their values are listed, but measure settings are listed as not being used. Similarly, if the active function is a measure function, measure settings are saved. When the index is queried, the measure settings and their values are listed, but the digitize settings are listed as not used.Configuration lists are not saved when the instrument is turned off or reset. To save a configuration list, create a configuration script to save instrument settings, including any defined configuration lists.Refer to Settings stored in a measure configuration index for a complete list of measure settings that the instrument stores.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30559.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.configlist.store("MyConfigList")
--- 
--- --Stores the active settings of the instrument to the end of the configuration list MyConfigList.
--- ```
---@param listName string A string that represents the name of a measure configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@overload fun(listName:string)
function smu.measure.configlist.store(listName, index) end


--- **This function returns the size (number of configuration indexes) of a measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/32926.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.measure.configlist.size("testMeasList"))
--- 
--- --Returns the number of configuration indexes in a measure configuration list named testMeasList.
--- --Example output:
--- --1
--- ```
---@return number indexCount A number that represents the total count of indexes stored in the specified measure configuration list
---@param listName string A string that represents the name of a measure configuration list
function smu.measure.configlist.size(listName) end

smu.FUNC_DC_VOLTAGEC = nil
smu.FUNC_DC_CURRENT = nil
smu.FUNC_RESISTANCED = nil
smu.FUNC_DIGITIZE_CURRENTD = nil
smu.FUNC_DIGITIZE_VOLTAGE = nil

---@alias smumeasureconfigliststorefuncmeasFunction
---|`smu.FUNC_DC_VOLTAGEC`
---|`smu.FUNC_DC_CURRENT`
---|`smu.FUNC_RESISTANCED`
---|`smu.FUNC_DIGITIZE_CURRENTD`
---|`smu.FUNC_DIGITIZE_VOLTAGE`



--- **This function allows you to store the settings for a measure function into a measure configuration list whether or not the function is active.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You must create the configuration list before using this command.If index is not specified, the settings are stored to the next available index in the configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91273.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.configlist.create("MyMeasList")
--- smu.measure.configlist.storefunc("MyMeasList", smu.FUNC_DC_VOLTAGE)
--- 
--- --Create a measure configuration list named MyMeasList.
--- --Store the attributes for the DC Voltage settings in index 1.
--- ```
---@param listName string Name of the configuration list in which to store the function settings
---@param measFunction smumeasureconfigliststorefuncmeasFunction The measure function settings to save into the configuration list
---@param index number The number of the configuration list index in which to store the settings
---@overload fun(listName:string)
function smu.measure.configlist.storefunc(listName, measFunction, index) end
---@class smu.source.configlist
smu.source.configlist = {}




--- **This function stores the active source settings into the named configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to store the active source settings to a configuration index in a configuration list. If the index is defined, the configuration list is stored in that index. If the index is not defined, the configuration index is appended to the end of the list. If a configuration index already exists for the specified index, the new configuration overwrites the existing configuration index.Refer to Settings stored in a source configuration index for information about the settings this command stores.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25693.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.configlist.store("MyConfigList")
--- 
--- --Store the active settings of the instrument to the source configuration list MyConfigList. Settings are saved at the end of the list since no index parameter is specified.
--- ```
---@param listName string A string that represents the name of a source configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@overload fun(listName:string)
function smu.source.configlist.store(listName, index) end


--- **This function returns the name of one source configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this command to retrieve the names of source configuration lists that are stored in the instrument.This command returns one name each time you send it. This command returns nil to indicate that there are no more names to return. If the command returns nil the first time you send it, no source configuration lists have been created for the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25695.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.source.configlist.catalog())
--- 
--- --Request the name of one source configuration list that is stored in the instrument. Send the command again until it returns nil to get all stored lists.
--- ```
function smu.source.configlist.catalog() end


--- **This function creates an empty source configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command creates an empty configuration list. To add configuration indexes to this list, you need to use the store command.Configuration lists are not saved when the instrument is turned off. If you want to save a configuration list through a power cycle, create a configuration script to save instrument settings, including any defined configuration lists.Configuration list names must be unique. For example, the name of a source configuration list cannot be the same as the name of a measure configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25696.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset() 
---  
--- smu.source.configlist.create("MyScrList")
---  
--- print(smu.source.configlist.catalog())
---  
--- print(smu.source.configlist.catalog())
---  
---  
---  
--- smu.source.configlist.store("MyScrList")
--- smu.source.configlist.store("MyScrList")
--- print(smu.source.configlist.size("MyScrList"))
--- 
--- --Create a source configuration list named MyScrLst.
--- --Print the name of one configuration list stored in volatile memory.
--- --Output:
--- --MyScrList
--- --Print the name of one configuration list.
--- --Output:
--- --nil
--- --Nil indicates that no more configuration lists are stored.
--- --Store a configuration index in MyScrList.
--- --Store a configuration index in MyScrList.
--- --Print the number of configuration indexes in MyScrList.
--- --Output:
--- --2
--- ```
---@param listName string A string that represents the name of a source configuration list
function smu.source.configlist.create(listName) end


--- **This function deletes a source configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Deletes a configuration list. If the index is not specified, the entire configuration list is deleted. If the index is specified, only the specified configuration index in the list is deleted.When an index is deleted from a configuration list, the index numbers of the following indexes are shifted up by one. For example, if you have a configuration list with 10 indexes and you delete index 3, the index that was numbered 4 becomes index 3, and the all the following indexes are renumbered in sequence to index 9. Because of this, if you want to delete several nonconsecutive indexes in a configuration list, it is best to delete the higher numbered index first, then the next lower index, and so on. This also means that if you want to delete all the indexes in a configuration list, you must delete index 1 repeatedly until all indexes have been removed.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25697.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.configlist.delete("mySourceList")
--- 
--- --Deletes a configuration list named mySourceList.
--- ```
---@param listName string A string that represents the name of a source configuration list
---@param index number A number that defines a specific configuration index in the configuration list
---@overload fun(listName:string)
function smu.source.configlist.delete(listName, index) end


--- **This function returns a list of TSP commands and parameter settings that are stored in the specified configuration index.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command can only return data for one configuration index. To get data for additional configuration indexes, resend the command and specify different configuration indexes. Refer to Settings stored in a source configuration list for a complete list of source settings that the instrument stores in a source configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25698.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.source.configlist.query("MyScrList", 2))
--- 
--- --Returns the TSP commands and parameter settings that represent the settings in configuration index 2.
--- ```
---@param listName string A string that represents the name of a source configuration list
---@param index number A number that defines a specific configuration index in the configuration list; the default is the first index in the configuration list
---@param fieldSeparator string String that represents the separator for the data; use one of the following
---@overload fun(listName:string,index:number)
function smu.source.configlist.query(listName, index, fieldSeparator) end


--- **This function returns the number of configuration indexes in a source configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The size of the list is equal to the number of configuration indexes in a configuration list.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25700.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.source.configlist.size("MyScrList"))
--- 
--- --Determine the number of configuration indexes in a source configuration list named MyScrList.
--- --Example output:
--- --2
--- ```
---@return number indexCount A number that represents the total quantity of indexes stored in the specified source configuration list
---@param listName string A string that represents the name of a source configuration list
function smu.source.configlist.size(listName) end


--- **This function recalls a specific configuration index in a specific source configuration list and an optional measure configuration list.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to recall the settings stored in a specific configuration index in a specific source configuration list. If you do not specify an index when you send the command, it recalls the settings stored in the first configuration index in the specified source configuration list of that index.You can optionally specify a measure configuration list and index to recall with the source settings. If you do not specify a measure index, the measure index defaults to match the source index. Specify a source and measure list together with this command to allow the instrument to coordinate the application of the settings in the two lists appropriately. If you do not need have the application of the source and measure configuration lists coordinated, you can specify just the source configuration list with this command and use the smu.measure.configlist.recall() command to recall measure settings separately in your application.If you recall an invalid index (for example, calling index 3 when there are only two indexes in the configuration list) or try to recall an index from an empty configuration list, event code 2790, "Configuration list, error, does not exist" is displayed.Each index contains the settings for the selected function of that index. Settings for other functions are not affected when the configuration list index is recalled. To see the settings that are recalled with an index, use the smu.source.configlist.query() command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/33155.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.configlist.recall("MySourceList")
--- 
--- --Because an index was not specified, this command recalls configuration index 1 from a configuration list named MySourceList.
--- ```
---@param listName string A string that represents the name of a source configuration list
---@param index number A number that defines a specific configuration index in the source configuration list
---@param measureListName string A string that represents the name of a measure configuration list
---@param measureIndex number A number that defines a specific configuration index in the measure configuration list
---@overload fun(listName:string,index:number)
---@overload fun(listName:string,index:number,measureListName:string)
function smu.source.configlist.recall(listName, index, measureListName, measureIndex) end

smu.FUNC_DC_CURRENTV = nil
smu.FUNC_DC_VOLTAGE = nil

---@alias smusourceconfigliststorefuncmeasFunction
---|`smu.FUNC_DC_CURRENTV`
---|`smu.FUNC_DC_VOLTAGE`



--- **This function allows you to store the settings for a source function into a source configuration list whether or not the function is active.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The configuration list must be created before you send this function.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/91274.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.configlist.create("sourcelist")
--- smu.source.configlist.storefunc("sourcelist", smu.FUNC_DC_CURRENT)
--- 
--- --Create a configuration list named sourcelist.
--- --Store the settings for the DC current source function into the configuration list in index 1.
--- ```
---@param ConfigListName string Name of the configuration list in which to store the function settings
---@param measFunction smusourceconfigliststorefuncmeasFunction The function to save into the configuration list
---@param index number The number of the configuration list index in which to store the settings
---@overload fun(ConfigListName:string)
function smu.source.configlist.storefunc(ConfigListName, measFunction, index) end
---@class smu.measure.autozero
smu.measure.autozero = {}



smu.OFFE = nil
smu.ON = nil

---@alias smumeasureautozeroenablestate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To ensure the accuracy of readings, the instrument must periodically get new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture that is being used for measurements. The Model 2461 uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made.The time to make the reference measurements is in addition to the normal measurement time. If timing is critical, such as in sweeps, you can disable autozero to avoid this time penalty.When autozero is set to off, the instrument may gradually drift out of specification. To minimize the drift, you can send the once command to make a reference and zero measurement immediately before a test sequence.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29048.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.autozero.enable = smu.OFF
--- 
--- --Set autozero off for voltage measurements.
--- ```
---@type smumeasureautozeroenablestate
smu.measure.autozero.enable = 0



--- **This function causes the instrument to refresh the reference and zero measurements once.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command forces a refresh of the reference and zero measurements that are used for the present aperture setting for the selected function.When autozero is set to off, the instrument may gradually drift out of specification. To minimize the drift, you can send the once command to make a reference and zero measurement immediately before a test sequence.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29049.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.autozero.once()
--- 
--- --Do a one-time refresh of the reference and zero measurements.
--- ```
function smu.measure.autozero.once() end
---@class smu.source.protect
smu.source.protect = {}




--- **This attribute sets the overvoltage protection setting of the source output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Overvoltage protection restricts the maximum voltage level that the instrument can source. It is in effect when either current or voltage is sourced.This protection is in effect for both positive and negative output voltages.When this attribute is used in a test sequence, it should be set before turning the source on.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/29072.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.protect.level = smu.PROTECT_40V
--- 
--- --Sets the maximum voltage limit of the instrument to 40 V.
--- ```
---@type smuSourceProtectionLevel
smu.source.protect.level = 0


smu.OFFO = nil
smu.ON = nil

---@alias smusourceprotecttrippedvalue
---|`smu.OFFO`
---|`smu.ON`


smu.FUNC_DC_CURRENTV = nil
smu.FUNC_DC_VOLTAGE = nil

---@alias smusourceprotecttrippedmeasFunction
---|`smu.FUNC_DC_CURRENTV`
---|`smu.FUNC_DC_VOLTAGE`



--- **This attribute indicates if the overvoltage source protection feature is active.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- When overvoltage protection is active, the instrument restricts the maximum voltage level that the instrument can source.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30235.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.source.protect.tripped)
--- 
--- --If overvoltage protection is active, the output is:
--- --smu.ON
--- ```
---@class smu.measure.filter
smu.measure.filter = {}




--- **This attribute sets the number of measurements that are averaged when filtering is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The filter count is the number of readings that are acquired and stored in the filter stack for the averaging calculation. When the filter count is larger, more filtering is done, and the data is less noisy.This command is set for the selected function.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30064.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.filter.count = 10
--- smu.measure.filter.type = smu.FILTER_MOVING_AVG
--- smu.measure.filter.enable = smu.ON
--- 
--- --Set the measurement function to current.
--- --Set the averaging filter type to moving average, with a filter count of 10.
--- --Enable the averaging filter.
--- ```
smu.measure.filter.count = 0


smu.FILTER_MOVING_AVGR = nil
smu.FILTER_REPEAT_AVG = nil

---@alias smumeasurefiltertypefilterType
---|`smu.FILTER_MOVING_AVGR`
---|`smu.FILTER_REPEAT_AVG`



--- **This attribute sets the type of averaging filter that is used for the selected measure function when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You can select one of two types of averaging filters: repeating average or moving average.When the repeating average filter is selected, a set of measurements are made. These measurements are stored in a measurement stack and averaged together to produce the averaged sample. Once the averaged sample is produced, the stack is flushed, and the next set of data is used to produce the next averaged sample. This type of filter is the slowest, since the stack must be completely filled before an averaged sample can be produced.When the moving average filter is selected, the measurements are added to the stack continuously on a first-in, first-out basis. As each measurement is made, the oldest measurement is removed from the stack. A new averaged sample is produced using the new measurement and the data that is now in the stack.The repeating average filter produces slower results but produces more stable results than the moving average filter. For either method, the greater the number of measurements that are averaged, the slower the averaged sample rate, but the lower the noise error. Trade-offs between speed and noise are normally required to tailor the instrumentation to your measurement application.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30065.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.filter.count = 10
--- smu.measure.filter.type = smu.FILTER_MOVING_AVG
--- smu.measure.filter.enable = smu.ON
--- 
--- --Set the measurement function to current.
--- --Set the averaging filter type to moving average, with a filter count of 10.
--- --Enable the averaging filter.
--- ```
---@type smumeasurefiltertypefilterType
smu.measure.filter.type = 0


smu.OFFE = nil
smu.ON = nil

---@alias smumeasurefilterenablefilterState
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables the averaging filter for the selected measurement function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the averaging filter. When this is enabled, the reading returned by the instrument is an averaged value, taken from multiple measurements. The settings of the filter count and filter type for the selected measure function determines how the reading is averaged.Filters are not available for digitize functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30066.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_CURRENT
--- smu.measure.filter.count = 10
--- smu.measure.filter.type = smu.FILTER_MOVING_AVG
--- smu.measure.filter.enable = smu.ON
--- 
--- --Set the measurement function to current.
--- --Set the averaging filter type to moving average, with a filter count of 10.
--- --Enable the averaging filter.
--- ```
---@type smumeasurefilterenablefilterState
smu.measure.filter.enable = 0

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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30536.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/30553.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].start.overrun)
--- 
--- --If an event was ignored, the output is true.
--- --If the event was not ignored, the output is false.
--- ```


--- **This attribute describes the event that starts the trigger timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the stimulus to any trigger event to start the timer when that event occurs.Set the stimulus to none to disable event processing and use the timer as a timer or alarm based on the start time.Trigger events are described in the table below.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30555.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33984.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/33985.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].start.fractionalseconds = 0.4
--- 
--- --Set the trigger timer to start in 0.4 s.
--- ```
triggertimerArr.start.fractionalseconds= 0

---@class smu.source.xlimit
smu.source.xlimit = {}




--- **This attribute selects the source limit for measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the source limit for measurements. The values that can be set for this command are limited by the setting for the overvoltage protection limit.The Model 2461 cannot source levels that exceed this limit.If you change the measure range to a range that is not appropriate for this limit, the instrument changes the source limit to a limit that is appropriate to the range and a warning is generated. Depending on the source range, your actual maximum limit value could be lower. The instrument makes adjustments to stay in the operating boundaries.This value can also be limited by the measurement range. If a specific measurement range is set, the limit must be 10.6% or higher of the measurement range. If you set the measurement range to be automatically selected, the measurement range does not affect the limit.Limits are absolute values.You can use smu.source.xlimit.tripped to check the limit state of the pulse source output.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30561.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.ilimit.level = 1
--- 
--- --Set the source function to voltage with the current limit set to 1 A.
--- ```
smu.source.xlimit.level = 0


smu.FUNC_DC_CURRENTV = nil
smu.FUNC_DC_VOLTAGE = nil

---@alias smusourcexlimittrippedmeasFunction
---|`smu.FUNC_DC_CURRENTV`
---|`smu.FUNC_DC_VOLTAGE`



--- **This attribute indicates if the source exceeded the limits that were set for the selected measurements.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- You can use this command to check the limit state of the source.If the limits were exceeded, the instrument clamps the source to keep the source within the set limits.If you check the limit for the source that is not presently selected, nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30562.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smu.source.vlimit.tripped)
--- 
--- --Check the state of the source limit for voltage. If the limit was exceeded, the output is:
--- --smu.ON
--- ```
---@class smudigitizelimitArr
smudigitizelimitArr = {}

---@type smudigitizelimitArr[]
smu.digitize.limit = {}



smu.OFFE = nil
smu.ON = nil

---@alias smudigitizelimitautoclearstate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute indicates if the test result for limit Y should be cleared automatically or not.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When auto clear is set to on, limit conditions are cleared automatically after each measurement. If you are making a series of measurements, the instrument shows the limit test result of the last measurement for the pass or fail indication for the limit.If you want to know if any of a series of measurements failed the limit, set the auto clear setting to off. When this is set to off, a failed indication is not cleared automatically. It remains set until it is cleared with the clear command.The auto clear setting affects both the high and low limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.limit[1].autoclear = smu.OFF
--- 
--- --Turns off autoclear for limit 1 when measuring digitize voltage.
--- ```
---@type smudigitizelimitautoclearstate
smudigitizelimitArr.autoclear= 0



--- **This attribute clears the results of the limit test defined by Y.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this command to clear the test results of limit Y when the limit auto clear option is turned off. Both the high and low test results are cleared.To avoid the need to manually clear the test results for a limit, turn the auto clear option on.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.limit[1].clear()
--- 
--- --Set the digitize function to voltage.
--- --Clear the results of limit test 1.
--- ```
function smudigitizelimitArr.clear() end


smu.FAIL_NONE = nil
smu.FAIL_HIGH = nil
smu.FAIL_LOW = nil
smu.FAIL_BOTH = nil

---@alias smudigitizelimitfailvalue
---|`smu.FAIL_NONE`
---|`smu.FAIL_HIGH`
---|`smu.FAIL_LOW`
---|`smu.FAIL_BOTH`


smu.FUNC_DIGITIZE_CURRENTV = nil
smu.FUNC_DIGITIZE_VOLTAGE = nil

---@alias smudigitizelimitfailmeasFunction
---|`smu.FUNC_DIGITIZE_CURRENTV`
---|`smu.FUNC_DIGITIZE_VOLTAGE`



--- **This attribute queries the results of a limit test.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This command queries the result of a limit test for the selected digitize function.The response message indicates if the limit test passed or how it failed (on the high or low limit).If autoclear is set to off, reading the results of a limit test does not clear the fail indication of the test. To clear a failure, send the clear command. To automatically clear the results, set auto clear on.If auto clear is set to on and you are making a series of measurements, the last measurement limit determines the fail indication for the limit. If auto clear is turned off, the results return a test fail if any of one of the readings failed.To use this attribute, you must set the limit state to on.If the readings are stored in a reading buffer, you can use the bufferVar.statuses command to see the results.See smu.digitize.limit[Y].low.value for examples of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41221.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value
--- 
--- --The results of the limit test for limit Y:
--- --smu.FAIL_NONE: Test passed; measurement under or equal to the high limitsmu.FAIL_HIGH: Test failed; measurement exceeded high limitsmu.FAIL_LOW: Test failed; measurement exceeded low limitsmu.FAIL_BOTH: Test failed; measurement exceeded both --- ```

smu.OFFE = nil
smu.ON = nil

---@alias smudigitizelimitenablestate
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables a limit test on the measurement from the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables a limit test for the selected digitize function. When this attribute is enabled, the limit Y testing occurs on each measurement made by the instrument. Limit Y testing compares the measurements to the high and low limit values. If a measurement falls outside these limits, the test fails.See smu.digitize.limit[Y].low.value for examples of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41225.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- state
--- 
--- --Limit Y testing:
--- --Disable: smu.OFFEnable: --- ```
---@type smudigitizelimitenablestate
smudigitizelimitArr.enable= 0


smu.AUDIBLE_NONEO = nil
smu.AUDIBLE_FAILO = nil
smu.AUDIBLE_PASS = nil

---@alias smudigitizelimitaudiblevalue
---|`smu.AUDIBLE_NONEO`
---|`smu.AUDIBLE_FAILO`
---|`smu.AUDIBLE_PASS`



--- **This attribute determines if the instrument beeper sounds when a limit test passes or fails.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The tone and length of beeper cannot be adjusted.See smu.digitize.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41685.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- value
--- 
--- --When the beeper sounds:
--- --Never: smu.AUDIBLE_NONEOn test failure: smu.AUDIBLE_FAILOn test pass: smu.AUDIBL--- ```
---@type smudigitizelimitaudiblevalue
smudigitizelimitArr.audible= 0

---@class smu.digitize.rel
smu.digitize.rel = {}




--- **This function acquires a measurement and stores it as the relative offset value for the selected digitize function.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command triggers the instrument to make a new measurement for the selected function. This measurement is then stored as the new relative offset level.When you send this command, the instrument does not apply any math, limit test, or filter settings to the measurement, even if they are set. It is a measurement that is made as if these settings are disabled.If an error event occurs during the measurement, nil is returned and the relative offset level remains at the last valid setting.You must change to the function for which you want to acquire a value before sending this command.The instrument must have relative offset enabled to use the acquired relative offset value.After executing this command, you can use the smu.digitize.rel.level attribute to see the last relative level value that was acquired or that was set.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41236.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- rel_value = smu.digitize.rel.acquire()
--- smu.digitize.rel.enable = smu.ON
--- print(rel_value)
--- 
--- --Acquires a relative offset level value for the digitize current function and turns the relative offset feature on.
--- --Output the value of the offset.
--- ```
function smu.digitize.rel.acquire() end


--- **This attribute contains the relative offset value.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command specifies the relative offset value that can be applied to new digitized measurements. When relative offset is enabled, all subsequent digitized readings are offset by the value that is set for this command.You can set this value, or have the instrument acquire a value. If the instrument acquires the value, read this setting to return the value that was measured internally.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41275.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.rel.level = smu.digitize.read()
--- smu.digitize.rel.enable = smu.ON
--- 
--- --Set the digitize function to digitize current.
--- --Set the relative offset level to be the reading with any calculations included.
--- --Enable the relative offset.
--- ```
smu.digitize.rel.level = 0


smu.OND = nil
smu.OFF = nil

---@alias smudigitizerelenablestate
---|`smu.OND`
---|`smu.OFF`



--- **This attribute enables or disables the application of a relative offset value to the measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When relative measurements are enabled, all subsequent digitized readings are offset by the relative offset value that was calculated when you acquired the relative offset value.Each returned measured relative reading is the result of the following calculation:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41280.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.rel.acquire()
--- smu.digitize.rel.enable = smu.ON
--- 
--- --Enables the relative measurements for digitize current after using the acquire command to set the relative level.
--- ```
---@type smudigitizerelenablestate
smu.digitize.rel.enable = 0

---@class smu.digitize.math
smu.digitize.math = {}



smu.OFFE = nil
smu.ON = nil

---@alias smudigitizemathenablevalue
---|`smu.OFFE`
---|`smu.ON`



--- **This attribute enables or disables math operations on measurements for the selected digitize function.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this command is set to on, the math operation specified by the math format command is performed before completing a measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41240.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.math.format = smu.MATH_PERCENT
--- smu.digitize.count = 1
--- smu.digitize.math.percent = smu.digitize.read()
--- smu.digitize.math.enable = smu.ON
--- smu.digitize.count = 5
--- MathBuffer = buffer.make(100)
--- smu.digitize.read(MathBuffer)
--- printbuffer(1, MathBuffer.n, MathBuffer.formattedreadings)
--- smu.digitize.count = 1
--- for x = 1, 3 do 
---     print(smu.digitize.read(MathBuffer))
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
---@type smudigitizemathenablevalue
smu.digitize.math.enable = 0


smu.MATH_MXBP = nil
smu.MATH_PERCENTR = nil
smu.MATH_RECIPROCAL = nil

---@alias smudigitizemathformatoperation
---|`smu.MATH_MXBP`
---|`smu.MATH_PERCENTR`
---|`smu.MATH_RECIPROCAL`



--- **This attribute specifies which math operation is performed on measurements when math operations are enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This specifies which math operation is performed on measurements for the selected digitize function.You can choose one of the following math operations:Math calculations are applied to the input signal after relative offset and before limit tests.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41243.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- smu.digitize.math.format = smu.MATH_RECIPROCAL
--- smu.digitize.math.enable = smu.ON
--- 
--- --Enables the reciprocal math operation on digitize voltage measurements.
--- ```
---@type smudigitizemathformatoperation
smu.digitize.math.format = 0



--- **This attribute specifies the reference constant that is used when math operations are set to percent.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The percent math function displays measurements as percent deviation from a specified reference constant. The percent calculation is:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41257.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.math.format = smu.MATH_PERCENT
--- smu.digitize.math.percent = 42
--- smu.digitize.math.enable = smu.ON
--- 
--- --Set the measurement function to digitize current.
--- --Set the math operations to percent.
--- --Set the percentage value to 42.
--- --Enable math operations.
--- ```
smu.digitize.math.percent = 0

---@class smu.source.pulse
smu.source.pulse = {}




--- **This attribute selects a fixed amplitude for the selected source function when pulsing.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the output level of the voltage or current source pulse when pulsing.The sign of the source level dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.If a manual source range is selected, the level cannot exceed the specified range. For example, if the voltage source is on the 2 V range, you cannot set the voltage source level to 3 V. When autorange is selected, the amplitude can be set to any level supported by the instrument.Use this command with a source configuration list to build a custom pulse sweep list that has unique pulse level points. Then use that custom source configuration list as a parameter to the smu.source.pulsesweeplist() command to configure the instrument for the pulse sweep.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63469.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.configlist.create("CustomVoltSweep")
--- smu.source.pulse.level = 1.17
--- smu.source.configlist.store("CustomVoltSweep")
--- smu.source.pulse.level = 1.27
--- smu.source.configlist.store("CustomVoltSweep")
--- smu.source.pulse.level = 1.33
--- smu.source.configlist.store("CustomVoltSweep")
--- smu.source.pulse.level = 1.39
--- smu.source.configlist.store("CustomVoltSweep")
--- smu.source.pulsesweeplist("CustomVoltSweep", 0.03, smu.OFF, defbuffer1, 1, 3, 0, .005)
--- 
--- --Set the source function to voltage and create a source list called CustomVoltSweep.
--- --Set the pulse level to 1.17 V and store that pulse level at the next index (1) in CustomVoltSweep.
--- --Set the pulse level to 1.27 V and store that pulse level at the next index (2) in CustomVoltSweep.
--- --Set the pulse level to 1.33 V and store that pulse level at the next index (3) in CustomVoltSweep.
--- --Set the pulse level to 1.39 V and store that pulse level at the next index (4) in CustomVoltSweep.
--- --Creates a pulse sweep using the CustomVoltSweep source list that steps through four pulse levels three times, for a total of 12 pulses. Each pulse has a width of 30 ms and an off time of 5 ms.  Readings are not taken during this pulse sweep. Start the sweep at index 1. Then query the pulse list. Output:  1.17,1.270000E+00,1.330000E+00,1.390000E+00
--- ```
smu.source.pulse.level = 0

---@type smumeasurelimitArr[]
smumeasurelimitArr.high = {}




--- **This attribute specifies the upper limit for a limit test.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the high limit for the limit Y test for the selected measurement function. When limit Y testing is enabled, the instrument generates a fail indication when the measurement value is more than this value.See the example in smu.measure.limit[Y].fail.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25685.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- highLimit
--- 
--- --The value of the high limit (-9.99999e+11 to +9.99999e+11)
--- ```
smumeasurelimitArr.high.value= 0

---@type smumeasurelimitArr[]
smumeasurelimitArr.low = {}




--- **This attribute specifies the lower limit for limit tests.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the lower limit for the limit Y test for the selected measure function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.See the example in smu.measure.limit[Y].fail.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/25686.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lowLimit
--- 
--- --The low limit value of limit Y (-9.99999E+11 to 9.99999E+11)
--- ```
smumeasurelimitArr.low.value= 0

---@class smu.measure.math.mxb
smu.measure.math.mxb = {}




--- **This attribute specifies the offset, b, for the y = mx + b operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset (b) for an mx + b operation.The mx + b math operation lets you manipulate normal display readings (x) mathematically based on the calculation:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.math.format = smu.MATH_MXB
--- smu.measure.math.mxb.mfactor = 0.80
--- smu.measure.math.mxb.bfactor = 50
--- smu.measure.math.enable = smu.ON
--- 
--- --Set the measurement function to voltage.
--- --Set the math operation to mx+b.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 50.
--- --Enable the math function.
--- ```
smu.measure.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/30108.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.measure.func = smu.FUNC_DC_VOLTAGE
--- smu.measure.math.format = smu.MATH_MXB
--- smu.measure.math.mxb.mfactor = 0.80
--- smu.measure.math.mxb.bfactor = 50
--- smu.measure.math.enable = smu.ON
--- 
--- --Set the measurement function to voltage.
--- --Set the math operation to mx+b.
--- --Set the scale factor for the mx+b operation to 0.80.
--- --Set the offset factor to 50.
--- --Enable the math function.
--- ```
smu.measure.math.mxb.mfactor = 0

---@type smudigitizelimitArr[]
smudigitizelimitArr.low = {}




--- **This attribute specifies the lower limit for limit tests.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the lower limit for the limit Y test for the selected digitize function. When limit Y testing is enabled, this causes a fail indication to occur when the measurement value is less than this value.This example enables limits 1 and 2 for digitize voltage measurements. Limit 1 is checking for readings to be between 3 V and 5 V, while limit 2 is checking for the readings to be between 1 V and 7 V. The auto clear feature is disabled, so if any reading is outside these limits, the corresponding fail is 1. Therefore, if any one of the fails is 1, analyze the reading buffer data to find out which reading failed the limits.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41215.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- -- Set the instrument to measure digitized voltage 
--- smu.digitize.func = smu.FUNC_DIGITIZE_VOLTAGE
--- -- Set the range to 10 V
--- -- Set the instrument to source current
--- smu.source.func=smu.FUNC_DC_CURRENT
--- smu.digitize.range = 10
--- -- Disable auto clearing for limit 1
--- smu.digitize.limit[1].autoclear = smu.OFF
--- -- Set high limit on 1 to fail if reading exceeds 5 V
--- smu.digitize.limit[1].high.value = 5
--- -- Set low limit on 1 to fail if reading is less than 3 V
--- smu.digitize.limit[1].low.value = 3
--- -- Enable limit 1 checking for digitized voltage measurements
--- smu.digitize.limit[1].enable = smu.ON
--- -- Disable auto clearing for limit 2
--- smu.digitize.limit[2].autoclear = smu.OFF
--- -- Set high limit on 2 to fail if reading exceeds 7 V
--- smu.digitize.limit[2].high.value = 7
--- -- Set low limit on 2 to fail if reading is less than 1 V
--- smu.digitize.limit[2].low.value = 1
--- -- Set the beeper to sound if the reading exceeds the limits for limit 2
--- smu.digitize.limit[2].audible = smu.AUDIBLE_FAIL 
--- -- Enable limit 2 checking for digitized voltage measurements
--- smu.digitize.limit[2].enable = smu.ON
--- -- Set the digitize count to 50
--- smu.digitize.count = 50
--- -- Create a reading buffer that can store 100 readings
--- LimitBuffer = buffer.make(100)
--- -- Make 50 readings and store them in LimitBuffer
--- smu.digitize.read(LimitBuffer)
--- -- Check if any of the 50 readings were outside of the limits
--- print("limit 1 results = " .. smu.digitize.limit[1].fail)
--- print("limit 2 results = " .. smu.digitize.limit[2].fail)
--- -- Clear limit 1 conditions
--- smu.digitize.limit[1].clear()
--- -- Clear limit 2 conditions
--- smu.digitize.limit[2].clear()
--- 
--- --Example output that shows all readings are within limit values (all readings between 3 V and 5 V):
--- --limit 1 results = smu.FAIL_NONE
--- --limit 2 results = smu.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 high values (a 6 V reading would cause this condition or a reading greater than 5 V but less than 7 V):
--- --limit 1 results = smu.FAIL_HIGH
--- --limit 2 results = smu.FAIL_NONE
--- -- 
--- --Example output showing at least one reading failed limit 1 and 2 low values (a 0.5 V reading would cause this condition or a reading less than 1 V):
--- --limit 1 results = smu.FAIL_LOW
--- --limit 2 results = smu.FAIL_LOW
--- ```
smudigitizelimitArr.low.value= 0

---@type smudigitizelimitArr[]
smudigitizelimitArr.high = {}




--- **This attribute specifies the upper limit for a limit test.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the high limit for the limit Y test for the selected digitize function. When limit Y testing is enabled, the instrument generates a fail indication when the measurement value is more than this value.See smu.digitize.limit[Y].low.value for an example of how to use this command.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41227.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- highLimit
--- 
--- --The value of the upper limit (-9.99999e+11 to +9.99999e+11)
--- ```
smudigitizelimitArr.high.value= 0

---@class smu.digitize.math.mxb
smu.digitize.math.mxb = {}




--- **This attribute specifies the offset, b, for the y = mx + b operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset (b) for an mx + b operation.The mx + b math operation lets you manipulate normal display readings (x) mathematically based on the calculation:Where:
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41252.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.math.format = smu.MATH_MXB
--- smu.digitize.math.mxb.mfactor = 0.80
--- smu.digitize.math.mxb.bfactor = 42
--- smu.digitize.math.enable = smu.ON
--- 
--- --Set the digitize function to digitize current.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 42.
--- --Enable the math function.
--- ```
smu.digitize.math.mxb.bfactor = 0



--- **This attribute specifies the scale factor, m, for the y = mx + b math operation.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the scale factor (m) for an mx + b operation for the selected measurement function.The mx + b math operation lets you manipulate normal display readings (x) mathematically according to the following calculation:Where: 
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/41255.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.digitize.func = smu.FUNC_DIGITIZE_CURRENT
--- smu.digitize.math.format = smu.MATH_MXB
--- smu.digitize.math.mxb.mfactor = 0.80
--- smu.digitize.math.mxb.bfactor = 42
--- smu.digitize.math.enable = smu.ON
--- 
--- --Set the digitize function to digitize current.
--- --Set the scale factor for the mx +b operation to 0.80.
--- --Set the offset factor to 42.
--- --Enable the math function.
--- ```
smu.digitize.math.mxb.mfactor = 0

---@class smu.source.pulse.xlimit
smu.source.pulse.xlimit = {}




--- **This attribute sets the source limit for pulsed output for the selected function when pulsing.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the source limit for pulse outputs. The Model 2461 cannot source pulse levels that exceed this limit.The values that can be set for this command are limited by the setting for the overvoltage protection limit. Also, if an interlock is not installed, the values are limited.This value can also be limited by the measurement range. If a specific measurement range is set, the limit must be more than 1 percent of the measurement range. If you set the measurement range to be automatically selected, the measurement range is selected based on the pulse and bias limits.If you change the source range to a level that is not appropriate for this limit, the instrument changes the source limit to a limit that is appropriate to the range and a warning is generated.Limits are absolute values.You can use the smu.source.xlimit.tripped command to check the limit state of the pulse source output.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/63723.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smu.source.func = smu.FUNC_DC_VOLTAGE
--- smu.source.pulse.ilimit.level = 1
--- print(smu.source.pulse.ilimit.level)
--- 
--- --Set the source function to voltage with the pulse current limit set to 1 A.
--- --Query the source pulse current limit setting.
--- --Output:
--- --1
--- --Indicates that the source pulse current limit is 1 A.
--- ```
smu.source.pulse.xlimit.level = 0



--- **This function delays the execution of the commands that follow it.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The instrument delays execution of the commands for at least the specified number of seconds and fractional seconds. However, the processing time may cause the instrument to delay 5 μs to 10 μs (typical) more than the requested delay.
---
---[command help](command:kic.viewHelpDocument?["Commands_2461/13949.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/13986.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/14769.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15057.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/15058.htm"])
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
--- --2.54000000000e+00
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/17645.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/29846.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34054.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/34589.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_2461/89066.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(available(gpib))
--- 
--- --Returns true if GPIB communications are available. Returns false if GPIB communications are not available.
--- ```
---@return boolean presence If the functionality is present, returns true; if not, returns false
function available(functionality) end

--- **This function defines a trigger model block.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command defines a trigger model building block that branches to another block using a counter to iterate a specified number of times. Counters increment every time the trigger model reaches them until they are more than or equal to the count value. At that point, the trigger model continues to the next building block in the sequence. The counter is reset to 0 when the trigger model starts. It is incremented each time trigger model execution reaches the counter block. If you are using remote commands, you can query the counter. The counter is incremented immediately before the branch compares the actual counter value to the set counter value. Therefore, the counter is at 0 until the first comparison. When the trigger model reaches the set counter value, branching stops and the counter value is one greater than the setting. Use trigger.model.getbranchcount() to query the counter.
----@param blockNumber number The sequence of the block in the trigger model
---@param block setblockalias Condition to branch to specified block.
function trigger.model.setblock(blockNumber,block) end