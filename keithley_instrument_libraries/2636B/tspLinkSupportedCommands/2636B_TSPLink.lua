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

---@class beeper
beeper = {}

beeper.ON = 0
beeper.OFF = 1

---@alias beeperenablestate
---|`beeper.ON`
---|`beeper.OFF`



--- **This command allows you to turn the beeper on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the beeper. When enabled, a beep signals that a front‑panel key has been pressed. Disabling the beeper also disables front‑panel key clicks.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14435.htm"])
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
--- You can use the beeper of the 2600B to provide an audible signal at a specified frequency and time duration. For example, you can use the beeper to signal the end of a lengthy sweep.The beeper does not sound if it is disabled. It can be disabled or enabled with the beeper enable command, or through the front panel.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18841.htm"])
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
---@class dataqueue
dataqueue = {}


--- **This function adds an entry to the data queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You cannot use the timeout value when accessing the data queue from a remote node (you can only use the timeout value while adding data to the local data queue).The timeout value is ignored if the data queue is not full.The dataqueue.add() function returns false:If the value is a table, a duplicate of the table and any subtables is made. The duplicate table does not contain any references to the original table or to any subtables.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14654.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14655.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14656.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14657.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14658.htm"])
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


--- **This function reads one digital I/O line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A returned value of zero (0) indicates that the line is low. A returned value of one (1) indicates that the line is high.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14668.htm"])
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


--- **This function reads the digital I/O port. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the value of the input lines on the I/O port. The least significant bit (bit B1) of the binary number corresponds to line 1; bit B14 corresponds to line 14.For example, a returned value of 170 has a binary equivalent of 000000010101010, which indicates that lines 2, 4, 6, and 8 are high (1), and the other 10 lines are low (0).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14669.htm"])
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


--- **This function sets a digital I/O line high or low. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the output line is write‑protected using the digio.writeprotect attribute, the command is ignored.The reset() function does not affect the present state of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.The data must be zero (0) to clear the bit. Any value other than zero (0) sets the bit.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14680.htm"])
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


--- **This function writes to all digital I/O lines. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern to be written to the I/O port. For example, a data value of 170 has a binary equivalent of 00000010101010. Lines 2, 4, 6, and 8 are set high (1), and the other 10 lines are set low (0).Write‑protected lines are not changed.The reset() function does not affect the present states of the digital I/O lines.Use the digio.writebit() and digio.writeport() commands to control the output state of the synchronization line when trigger operation is set to digio.TRIG_BYPASS.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14681.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.writeport(255)
--- 
--- --Sets digital I/O Lines 1 through 8 high (binary 00000011111111).
--- ```
---@param data number Value to write to the port (0 to 16383)
function digio.writeport(data) end


--- **This attribute contains the write‑protect mask that protects bits from changes from the digio.writebit() and digio.writeport() functions. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Bits that are set to one cause the corresponding line to be write‑protected.The binary equivalent of mask indicates the mask to be set for the I/O port. For example, a mask value of 7 has a binary equivalent of 00000000000111. This mask write‑protects lines 1, 2, and 3.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14682.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14699.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14700.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14702.htm"])
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
--- The format parameter uses zeros (0), the decimal point, polarity sign, and exponents to define how the input field is formatted. The format parameter can include the options shown in the following table.The default parameter is the value shown when the value is first displayed.You can use the minimum and maximum parameters to limit the values that can be entered. When + is not selected for format, the minimum limit must be more than or equal to zero (0). When limits are used, you cannot enter values above or below these limits.The input value is limited to ±1e37.Before calling display.inputvalue(), you should send a message prompt to the operator using display.prompt(). Make sure to position the cursor where the edit field should appear.After this command is sent, script execution pauses until you enter a value and press the ENTER key.For positive and negative entry (plus sign (+) used for the value field and the exponent field), polarity of a nonzero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel. Polarity is also toggled when using the navigation wheel to decrease or increase the value or exponent past zero. A zero (0) value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After executing this command and pressing the EXIT (LOCAL) key, the function returns nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14703.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14707.htm"])
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
--- The menu consists of the menu name string on the top line, and a selectable list of items on the bottom line. The menu items must be a single string with each item separated by whitespace. The name for the top line is limited to 20 characters.After sending this command, script execution pauses for the operator to select a menu item. An item is selected by rotating the navigation wheel to place the blinking cursor on the item, and then pressing the navigation wheel (or the ENTER key). When an item is selected, the text of that selection is returned.Pressing the EXIT (LOCAL) key does not abort the script while the menu is displayed, but it does return nil. The script can be aborted by calling the exit function when nil is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14708.htm"])
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

display.DISABLE = nil
display.ENABLE = nil

---@alias displaynumpadnumericKeypad
---|`display.DISABLE`
---|`display.ENABLE`



--- **This attribute controls whether the front panel keys act as a numeric keypad during value entry.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The numeric keypad feature is only available when editing a numeric value at the same time that the EDIT indicator is lit.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14709.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.numpad = display.ENABLE
--- 
--- --Turn on the numeric keypad feature.
--- ```
---@type displaynumpadnumericKeypad
display.numpad = 0



--- **This function sets the position of the cursor.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Sending this command selects the user screen and then moves the cursor to the given location.The display.clear(), display.setcursor(), and display.settext() functions are overlapped commands. That is, the script does not wait for one of these commands to complete. These functions do not immediately update the display. For performance considerations, they update the display as soon as processing time becomes available.An out‑of-range parameter for row sets the cursor to row 2. An out‑of‑range parameter for column sets the cursor to column 20 for row 1, or 32 for row 2.An out‑of‑range parameter for style sets it to 0 (invisible).A blinking cursor is only visible when it is positioned over displayed text. It cannot be seen when positioned over a space character.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14711.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14712.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14719.htm"])
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
--- This function creates an editable input field at the present cursor position, and an input prompt message on the bottom line. Example of a displayed input field and prompt:0.00VInput 0 to +2VThe format parameter uses zeros (0), the decimal point, polarity sign, and exponents to define how the input field is formatted.The format parameter can include the options shown in the following table.You can use the minimum and maximum parameters to limit the values that can be entered. When a plus sign (+) is not selected for format, the minimum limit must be greater than or equal to zero (0). When limits are used, the operator cannot enter values above or below these limits.The input value is limited to ±1e37.After sending this command, script execution pauses for the operator to enter a value and press ENTER.For positive and negative entry (plus sign (+) used for the value field and the exponent field), polarity of a nonzero value or exponent can be toggled by positioning the cursor on the polarity sign and turning the navigation wheel. Polarity also toggles when using the navigation wheel to decrease or increase the value or exponent past zero. A zero value or exponent (for example, +00) is always positive and cannot be toggled to negative polarity.After executing this command and pressing the EXIT (LOCAL) key, the value returns nil.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14740.htm"])
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

display.SMUA_SMUB = nil
display.USER = nil
display.SMUA = nil
display.SMUB = nil

---@alias displayscreendisplayID
---|`display.SMUA_SMUB`
---|`display.USER`
---|`display.SMUA`
---|`display.SMUB`



--- **This attribute contains the selected display screen.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting this attribute selects the display screen for the front panel. This performs the same action as pressing the DISPLAY key on the front panel. The text for the display screen is set by display.settext().Read this attribute to determine which of the available display screens was last selected.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14741.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.screen = display.SMUA
--- 
--- --Selects the source-measure and compliance limit display for SMU A.
--- ```
---@type displayscreendisplayID
display.screen = 0



--- **This function retrieves the key code for the last pressed key.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- A history of the key code for the last pressed front‑panel key is maintained by the instrument. When the instrument is turned on, or when it is transitioning from local to remote operation, the key code is set to 0 (display.KEY_NONE).Pressing the EXIT (LOCAL) key normally aborts a script. To use this function with the EXIT (LOCAL) key, you must set display.locallockout to display.LOCK.The table below lists the keyCode value for each front‑panel action.You cannot use this function to track the OUTPUT ON/OFF controls for SMU A or SMU B.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17047.htm"])
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


--- **This function captures the key code value for the next front‑panel action.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After you send this function, script execution pauses until a front‑panel action (for example, pressing a key or the navigation wheel, or turning the navigation wheel). After the action, the value of the key (or action) is returned.If the EXIT (LOCAL) key is pressed while this function is waiting for a front‑panel action, the script is not aborted.A typical use for this function is to prompt the user to press the EXIT (LOCAL) key to abort the script or press any other key to continue. For example, if the keyCode value 75 is returned (the EXIT (LOCAL) key was pressed), you can call the exit() function to abort the script.The table below lists the keyCode values for each front panel action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/20642.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- key = display.waitkey()
--- print(key)
--- 
--- --Pause script execution until the operator presses a key or the navigation wheel, or rotates the navigation wheel.
--- --If the output is:
--- --8.60000e+01
--- --It indicates that the MEAS(A) key was pressed.
--- ```
---@return number keyCode See Details for more information
function display.waitkey() end


--- **This function sends a code that simulates the action of a front‑panel control.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This command simulates pressing a front‑panel key or navigation wheel, or turning the navigation wheel one click to the left or right.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/98308.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.sendkey(display.KEY_RUN)
--- 
--- --Simulates pressing the RUN key.
--- ```
---@param keyCode number A parameter that specifies the key press to simulate; see Details for more information
function display.sendkey(keyCode) end
---@class errorqueue
errorqueue = {}


--- **This function clears all entries out of the error queue.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14749.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14750.htm"])
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
--- Entries are stored in a first-in, first-out (FIFO) queue. This function reads the oldest entry and removes it from the queue.Error codes and messages are listed in the Error summary list.If there are no entries in the queue, code 0, Queue is Empty, is returned.In an expanded system, each TSP‑Link enabled instrument is assigned a node number. The variable errorNode stores the node number where the error originated. The errorNode is always 1 on the 2604B/2614B/2634B.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17242.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14756.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14757.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14758.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function eventlog.clear() end

eventlog.DISCARD_OLDEST = nil
eventlog.DISCARD_NEWEST = nil

---@alias eventlogoverwritemethodmethod
---|`eventlog.DISCARD_OLDEST`
---|`eventlog.DISCARD_NEWEST`



--- **This attribute controls how the event log processes events if the event log is full.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to eventlog.DISCARD_NEWEST, new entries are not logged.When this attribute is set to eventlog.DISCARD_OLDEST, the oldest entry is discarded when a new entry is added.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14759.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14760.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(eventlog.enable)
--- eventlog.enable = eventlog.DISABLE
--- print(eventlog.enable)
--- 
--- --Displays the present status of the 2600B event log.
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14761.htm"])
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

format.NORMAL = nil
format.LITTLEENDIAN = nil
format.BIGENDIANL = nil
format.NETWORK = nil
format.SWAPPED = nil

---@alias formatbyteorderorder
---|`format.NORMAL`
---|`format.LITTLEENDIAN`
---|`format.BIGENDIANL`
---|`format.NETWORK`
---|`format.SWAPPED`



--- **This attribute sets the binary byte order for the data that is printed using the printnumber() and printbuffer() functions.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute selects the byte order in which data is written when you are printing data values with the printnumber() and printbuffer() functions. The byte order attribute is only used with the format.SREAL, format.REAL, format.REAL32, and format.REAL64 data formats.format.NORMAL, format.BIGENDIAN, and format.NETWORK select the same byte order. format.SWAPPED and format.LITTLEENDIAN select the same byte order. Selecting which to use is a matter of preference.Select the format.SWAPPED or format.LITTLEENDIAN byte order when sending data to a computer with a Microsoft Windows operating system.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14801.htm"])
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

---@class fs
fs = {}


--- **This function sets the current working directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The new working directory path may be absolute or relative to the current working directory.An error is logged to the error queue if the given path does not exist.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14808.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14810.htm"])
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
--- The file system path may be absolute or relative to the current working system path.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14811.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14812.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14814.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14815.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14824.htm"])
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
---@class io
io = {}


--- **This function closes a file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If a file is not specified, the default output file closes.Only io.close(), used without specifying a parameter, can be accessed from a remote node.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14868.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14870.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function io.flush() end


--- **This function assigns a previously opened file or opens a new file as the default output file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The path of the file to open may be absolute or relative to the current working directory.When accessed from a remote node using the TSP-Link network, this command does not accept a file descriptor parameter and does not return a value.If the function fails, an error message is returned.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14873.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14874.htm"])
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


--- **This function writes data to the default output file.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- All data parameters must be either strings or numbers.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14877.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/66560.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14890.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.applysettings()
--- 
--- --Re-initialize the LAN interface with new settings.
--- ```
function lan.applysettings() end

lan.ENABLE = nil
lan.DISABLE = nil

---@alias lanautoconnectstate
---|`lan.ENABLE`
---|`lan.DISABLE`



--- **This attribute is used to enable or disable link monitoring.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the LAN link monitoring and automatic connection state.When this is set to lan.ENABLE, all connections are closed if the link to the LAN is lost for more than the time specified by lan.linktimeout.Set this attribute to lan.ENABLE to automatically reset the LAN connection after the LAN link is established.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14891.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.autoconnect = lan.ENABLE
--- 
--- --Enable LAN link monitoring.
--- ```
---@type lanautoconnectstate
lan.autoconnect = 0



--- **This attribute contains the LAN link timeout period.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- You must enable the command lan.autoconnect before you can use this attribute.The timeout value represents the amount of time that passes before the instrument disconnects from the LAN due to the loss of the LAN link integrity.The LAN interface does not disconnect if the connection to the LAN is reestablished before the timeout value expires.If the LAN link integrity is not restored before the timeout value expires, the instrument begins to monitor for a new connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14892.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.linktimeout)
--- 
--- --Outputs the present LAN link timeout setting.
--- ```
lan.linktimeout = 0



--- **This attribute contains the LXI domain.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the LXI domain number.All outgoing LXI packets are generated with this domain number. All inbound LXI packets are ignored unless they have this domain number.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14893.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14894.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14895.htm"])
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
--- The settings that are restored are shown in the following table.This command is run when lan.reset() is sent.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14896.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.restoredefaults()
--- 
--- --Restores the LAN defaults.
--- ```
function lan.restoredefaults() end


--- **This attribute contains the LAN timed-wait state interval.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the amount of time that resources are allocated to closed TCP connections. When a TCP connection is closed, the connection is put in a timed-wait state and resources remain allocated for the connection until the timed-wait state ends. During the timed-wait interval, the instrument processes delayed packets that arrive after the connection is closed.Use this attribute to tailor the timed-wait state interval for the instrument.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14897.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.timedwait = 30
--- 
--- --Set the amount of time resources are allocated to TCP connection to 30 s.
--- ```
lan.timedwait = 0

---@class localnode
localnode = {}


--- **This attribute enables or disables automatic power line frequency detection at start‑up.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to true, the power line frequency is detected automatically the next time the 2600B powers up. After the power line frequency is automatically detected at power-up, the localnode.linefreq attribute is set automatically to 50 or 60.If the localnode.linefreq attribute is explicitly set, localnode.autolinefreq is automatically set to false.When using this command from a remote node, replace localnode with the node reference, for example node[5].autolinefreq.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15007.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
localnode.autolinefreq = 0



--- **This attribute stores a user-defined description and mDNS service name of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores a string that contains a description of the instrument. This value appears on LXI welcome page of the instrument. The value of this attribute is also used as the mDNS service name of the instrument.The factory default value of this attribute is "Keithley Instruments SMU <model number> - <serial number>", where <model number> and <serial number> are replaced with the actual model number and serial number of the instrument. Setting this attribute to an empty string (in other words, setting this attribute to a string of length zero or a string consisting entirely of whitespace characters) reverts the description to the factory default value.When using this command from a remote node, replace localnode with the node reference, for example node[5].description.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15008.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- description = "System in Lab 05"
--- localnode.description = description
--- 
--- --Set description to System in Lab 05.
--- ```
localnode.description = 0



--- **This attribute contains the power line frequency setting that is used for NPLC calculations.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To achieve optimum noise rejection when performing measurements at integer NPLC apertures, set the line frequency attribute to match the frequency (50 Hz or 60 Hz) of the ac power line. When using this command from a remote node, replace localnode with the node reference, for example node[5].linefreq. When this attribute is set, the localnode.autolinefreq attribute is automatically set to false. You can have the instrument automatically detect the ac power line frequency and set this attribute with the line frequency detected when the instrument power is turned on by setting the localnode.autolinefreq attribute to true.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15012.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- frequency = localnode.linefreq
--- 
--- --Reads line frequency setting.
--- localnode.linefreq = 60
--- 
--- --Sets the line frequency to 60 Hz.
--- ```
localnode.linefreq = 0



--- **This attribute stores the model number.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15013.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.model)
--- 
--- --Outputs the model number of the local node. For example:
--- --2602B
--- ```
localnode.model = 0



--- **This attribute stores the remote access password.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- This write-only attribute stores the password that is set for any remote interface. When password usage is enabled (localnode.passwordmode), you must supply a password to change the configuration or to control an instrument from a remote command interface.The instrument continues to use the old password for all interactions until the command to change it executes. When changing the password, give the instrument time to execute the command before attempting to use the new password.You cannot retrieve a lost password from any command interface.You can reset the password by resetting the LAN from the front panel or by sending the lan.reset() command.When using this command from a remote node, localnode should be replaced with the node reference, for example, node[5].password.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15014.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.password = "N3wpa55w0rd"
--- 
--- --Changes the remote interface password to N3wpa55w0rd.
--- ```
localnode.password = 0


localnode.PASSWORD_LAN = nil
localnode.PASSWORD_ALL = nil
localnode.PASSWORD_NONE = nil
localnode.PASSWORD_WEB = nil

---@alias localnodepasswordmodemode
---|`localnode.PASSWORD_LAN`
---|`localnode.PASSWORD_ALL`
---|`localnode.PASSWORD_NONE`
---|`localnode.PASSWORD_WEB`



--- **This attribute stores the password enable mode for remote access to the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls if and where remote access passwords are required. Set this attribute to one of the values below to enable password checking:When using this command from a remote node, replace localnode with the node reference, for example node[5].passwordmode.If you enable password mode, you must also assign a password.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15015.htm"])
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
---@type localnodepasswordmodemode
localnode.passwordmode = 0



--- **This attribute determines if the instrument generates prompts in response to command messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When the prompting mode is enabled, the instrument generates prompts when the instrument is ready to take another command. Because the prompt is not generated until the previous command completes, enabling prompts provides handshaking with the instrument to prevent buffer overruns.When prompting is enabled, the instrument might generate the following prompts:Commands do not generate prompts. The instrument generates prompts in response to command completion.Prompts are enabled or disabled only for the remote interface that is active when you send the command. For example, if you enable prompts when the LAN connection is active, they are not enabled for a subsequent USB connection.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15016.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15017.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15018.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.revision)
--- 
--- --Outputs the present revision level.
--- --Sample output:
--- --1.0.0
--- ```
localnode.revision = 0



--- **This attribute stores the serial number of the instrument.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This indicates the instrument serial number.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15019.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15022.htm"])
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
--- If you want to reset a specific instrument or a subordinate node, use the node[X].reset() command.A local node reset includes:A localnode.reset() is different than a reset() because reset() resets the entire system. When using this command from a remote node, localnode should be replaced with the node reference, for example node[5].reset().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/16978.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- localnode.reset()
--- 
--- --Resets the local node.
--- ```
function localnode.reset() end


--- **This attribute returns the product license agreements.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/92667.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(localnode.license)
--- 
--- --Returns the license agreements for the 2600B.
--- ```
localnode.license = 0

---@class nodeArr
local nodeArr = {}

---@type nodeArr[]
node = {}


--- **This function returns the value of a global variable. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function retrieves the value of a global variable from the runtime environment of this node.Do not use this command to retrieve the value of a global variable from the local node. Instead, access the global variable directly. This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15010.htm"])
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



--- **This function sets the value of a global variable. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- From a remote node, use this function to assign the given value to a global variable.Do not use this command to create or set the value of a global variable from the local node (set the global variable directly instead). This command should only be used from a remote master when controlling this instrument over a TSP-Link network.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15020.htm"])
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



--- **This function starts test scripts from a remote node. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Only the remote master node can use the execute command to run a script on this node. This function does not run test scripts on the master node; only on this node when initiated by the master node.This function may only be called when the group number of the node is different than the node of the master.This function does not wait for the script to finish execution.This command should only be used from a remote master when controlling this instrument over a TSP-Link®.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- node[2].execute(sourcecode)
--- 
--- --Runs script code on node 2. The code is in a string variable called sourcecode.
--- node[3].execute("x = 5")
--- 
--- --Runs script code in string constant ("x = 5") to set x
--- --equal to 5 on node 3.
--- node[32].execute(TestDut.source)
--- 
--- --Runs the test script stored in the variable TestDut
--- --(previously stored on the master node) on node 32.
--- ```
---@param scriptCode string A string containing the source code
function nodeArr.execute(scriptCode) end

---@class serial
serial = {}


--- **This attribute configures the baud rate for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new baud rate setting takes effect when the command to change it is processed.The reset function has no effect on data bits.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15068.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- serial.baud = 1200
--- 
--- --Sets the baud rate to 1200.
--- ```
serial.baud = 0



--- **This attribute configures character width (data bits) for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new data width setting takes effect when the command to change it is processed.The reset function has no effect on data bits.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15069.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- serial.databits = 8
--- 
--- --Sets data width to 8.
--- ```
serial.databits = 0


serial.FLOW_HARDWARE = nil
serial.FLOW_NONE = nil

---@alias serialflowcontrolflow
---|`serial.FLOW_HARDWARE`
---|`serial.FLOW_NONE`



--- **This attribute configures flow control for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new flow control setting takes effect when the command to change it is processed.The reset function has no effect on flow control.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15070.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- serial.flowcontrol = serial.FLOW_NONE
--- 
--- --Sets flow control to none.
--- ```
---@type serialflowcontrolflow
serial.flowcontrol = 0


serial.PARITY_ODD = nil
serial.PARITY_NONE = nil
serial.PARITY_EVEN = nil

---@alias serialparityparity
---|`serial.PARITY_ODD`
---|`serial.PARITY_NONE`
---|`serial.PARITY_EVEN`



--- **This attribute configures parity for the RS-232 port.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- A new parity setting takes effect when the command to change it is processed.The reset function has no effect on parity.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15071.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- serial.parity = serial.PARITY_NONE
--- 
--- --Sets parity to none.
--- ```
---@type serialparityparity
serial.parity = 0



--- **This function reads available characters (data) from the serial port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function reads available characters from the serial port. It does not wait for new characters to arrive. As long as maxchars is less than 200 characters, all characters that are received by the serial port (before the serial.read() command is executed) are returned. If too many characters are received between calls to this function, the RS-232 buffers overflow and some characters may be lost.Call this function as many times as necessary to receive the required number of characters. For optimal performance, use a small delay between repeated calls to this function.The data returned is the raw data stream read from the port. No characters, such as control characters or terminator characters, are interpreted.If you attempt to use this function when the serial port is enabled as a command interface, a settings conflict error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15072.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- data = serial.read(200)
---  
--- print(data)
--- 
--- --Read data from the serial port.
--- --Output:
--- --John Doe
--- --The above output indicates that the string "John Doe" was read from the serial port.
--- ```
---@return string data A string that consists of all data read from the serial port
---@param maxchars number An integer that specifies the maximum number of characters to read
function serial.read(maxchars) end


--- **This function writes data to the serial port.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function writes the specified string to the serial port, where it can be read by connected equipment (for example, a component handler). No terminator characters are added to the data, and data is written exactly as specified by the data parameter.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15073.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- serial.write("1 2 3 4")
--- 
--- --Write data string "1 2 3 4" to the serial port.
--- ```
---@param data string A string representing the data to write
function serial.write(data) end
---@class setup
setup = {}


--- **This attribute specifies which saved setup to recall when the instrument is turned on.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When id = 0, the instrument uses the factory default setup when it is turned on. When id is set to 1 to 5, it uses the setup saved with setup.save().Only setups stored in nonvolatile memory are available (you cannot recall a script from a USB flash drive with this command).To save a script that is used when the instrument is powered on, you can create a configuration script and name it autoexec.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15081.htm"])
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
--- When the id parameter is an integer (n), it is interpreted as the setup number to save to the nonvolatile memory of the instrument.When the id parameter is a string, it is interpreted as the path and file name of the location to save the present setup on a USB flash drive. The path may be absolute or relative to the current working directory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15083.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setup.save(5)
--- 
--- --Saves the present setup to the internal memory of the instrument at location 5.
--- ```
---@param id number|string An integer or string specifying where to save the user setup
function setup.save(id) end


--- **This function recalls settings from a saved setup.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the id parameter is an integer (n), it is interpreted as the setup number to restore from the instrument's nonvolatile memory. When n = 0, the instrument recalls the factory default setup; when n = 1 to 5, the instrument recalls a user-saved setup.When the id parameter is a string, it is interpreted as the path and file name of the setup to restore from a file on a USB flash drive. The path may be absolute or relative to the current working directory.Before a setup is recalled, an instrument reset is performed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/66566.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- setup.recall(1)
--- 
--- --Recall the user-saved setup at location 1.
--- setup.recall("/usb1/KEITHLEY_30730.set")
--- 
--- --Recall a user-saved setup stored in a file named KEITHLEY_30730 on a USB flash drive.
--- ```
---@param id number|string An integer or string that specifies the location of the setup to recall
function setup.recall(id) end
---@class smua
smua = {}


--- **This function terminates all overlapped operations on the specified source‑measure unit (SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.abort() function does not turn the output off or change any settings.If this function is used to abort a sweep, when it is executed, the SMU exits its trigger model immediately and returns to the idle state of the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15088.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.abort()
--- 
--- --Terminates all overlapped operations on SMU channel A.
--- ```
function smua.abort() end


--- **This function creates a reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this function to create and dynamically allocate reading buffers. Use bufferSize to designate the number of readings the buffer can store.You can use dynamically allocated reading buffers interchangeably with the smuX.nvbufferY buffers.To delete a reading buffer, set all references to the reading buffer equal to nil, then run the garbage collector (see the collectgarbage() function in Standard libraries).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15105.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- mybuffer2 = smua.makebuffer(200)
--- 
--- --Creates a 200 element reading buffer (mybuffer2) for SMU channel A.
--- ```
---@return bufferMethods bufferVar The created reading buffer
---@param bufferSize number Maximum number of readings that can be stored
function smua.makebuffer(bufferSize) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smua.measurevandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smua.measureiandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smua.measurerandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smua.measurepandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@param sourceValue number Source value to be set after the measurement is made
---@return number iReading The current reading before stepping the source
---@return number vReading The voltage reading before stepping the source
---@overload fun(sourceValue:number):number
function smua.measureivandstep(sourceValue) end


--- **This attribute contains a dedicated reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15126.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
--- 
--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 1.
--- ```

---@type bufferMethods
smua.nvbuffer1 = 0



--- **This attribute contains a dedicated reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15126.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
--- 
--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 1.
--- ```

---@type bufferMethods
smua.nvbuffer2 = 0



--- **This function turns off the output and resets the commands that begin with smuX. to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function turns off the output and returns the specified SMU to its default settings.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15136.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
--- 
--- --Turns off the output and resets SMU channel A to its default settings.
--- ```
function smua.reset() end


--- **This function saves one source‑measure unit (SMU) dedicated reading buffer to nonvolatile memory (there are two dedicated reading buffers for each SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the instrument is turned off and back on, the dedicated reading buffers are restored from nonvolatile memory to their last saved values.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15137.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.savebuffer(smua.nvbuffer1)
---  
--- 
--- --Saves buffer 1 (SMU channel A) to internal memory.
--- ```
---@param buffer bufferMethods Buffer variable
function smua.savebuffer(buffer) end

smua.SENSE_REMOTE = nil
smua.SENSE_CALA = nil
smua.SENSE_LOCAL = nil

---@alias smuasensesenseMode
---|`smua.SENSE_REMOTE`
---|`smua.SENSE_CALA`
---|`smua.SENSE_LOCAL`



--- **This attribute contains the state of the sense mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Source-measure operations are performed using either 2-wire local sense connections or 4-wire remote sense connections. Writing to this attribute selects the sense mode.The smuX.SENSE_CALA mode is only used for calibration and may only be selected when calibration is enabled.The sense mode can be changed between local and remote while the output is on.The calibration sense mode cannot be selected while the output is on.Resetting the instrument selects the local sense mode.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15138.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.sense = smua.SENSE_REMOTE
--- 
--- --Selects remote sensing for SMU channel A.
--- ```
---@type smuasensesenseMode
smua.sense = 0

---@class smub
smub = {}


--- **This function terminates all overlapped operations on the specified source‑measure unit (SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.abort() function does not turn the output off or change any settings.If this function is used to abort a sweep, when it is executed, the SMU exits its trigger model immediately and returns to the idle state of the trigger model.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15088.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.abort()
--- 
--- --Terminates all overlapped operations on SMU channel A.
--- ```
function smub.abort() end


--- **This function creates a reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- You can use this function to create and dynamically allocate reading buffers. Use bufferSize to designate the number of readings the buffer can store.You can use dynamically allocated reading buffers interchangeably with the smuX.nvbufferY buffers.To delete a reading buffer, set all references to the reading buffer equal to nil, then run the garbage collector (see the collectgarbage() function in Standard libraries).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15105.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- mybuffer2 = smua.makebuffer(200)
--- 
--- --Creates a 200 element reading buffer (mybuffer2) for SMU channel A.
--- ```
---@return bufferMethods bufferVar The created reading buffer
---@param bufferSize number Maximum number of readings that can be stored
function smub.makebuffer(bufferSize) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smub.measurevandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smub.measureiandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smub.measurerandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@return number reading The measured reading before stepping the source
---@param sourceValue number Source value to be set after the measurement is made
function smub.measurepandstep(sourceValue) end


--- **This function makes one or two measurements and then steps the source.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The smuX.measureYandstep() function makes a measurement and then sets the source to sourceValue. Usage of the smuX.measureivandstep() function is similar, but makes two measurements simultaneously, one for current (i) and one for voltage (v).Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.Make sure the specified source value is appropriate for the selected source function. For example, if the source voltage function is selected, then sourceValue is expected to be a new voltage level.Both source and measure autorange must be disabled before using this function. This function cannot be used if source high capacitance mode is enabled (high capacitance mode requires autoranging to be enabled).This function is provided for very fast execution of source-measure loops. The measurement is made before the source is stepped. Before using this function, and before any loop this function may be used in, set the source value to its initial level.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15125.htm"])
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
--- 
--- --This use of the SMU channel A measure and step function measures current starting at a source value of 0 V. After each current measurement, the source is stepped 100 mV for the next current measurement. The final source level is 1 V, where current is again measured. 
--- -- 
--- ```
---@param sourceValue number Source value to be set after the measurement is made
---@return number iReading The current reading before stepping the source
---@return number vReading The voltage reading before stepping the source
---@overload fun(sourceValue:number):number
function smub.measureivandstep(sourceValue) end


--- **This attribute contains a dedicated reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15126.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
--- 
--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 1.
--- ```

---@type bufferMethods
smub.nvbuffer1 = 0



--- **This attribute contains a dedicated reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15126.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.overlappedv(smua.nvbuffer1)
--- 
--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 1.
--- ```

---@type bufferMethods
smub.nvbuffer2 = 0



--- **This function turns off the output and resets the commands that begin with smuX. to their default settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function turns off the output and returns the specified SMU to its default settings.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15136.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.reset()
--- 
--- --Turns off the output and resets SMU channel A to its default settings.
--- ```
function smub.reset() end


--- **This function saves one source‑measure unit (SMU) dedicated reading buffer to nonvolatile memory (there are two dedicated reading buffers for each SMU).**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- When the instrument is turned off and back on, the dedicated reading buffers are restored from nonvolatile memory to their last saved values.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15137.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.savebuffer(smua.nvbuffer1)
---  
--- 
--- --Saves buffer 1 (SMU channel A) to internal memory.
--- ```
---@param buffer bufferMethods Buffer variable
function smub.savebuffer(buffer) end

smub.SENSE_REMOTE = nil
smub.SENSE_CALA = nil
smub.SENSE_LOCAL = nil

---@alias smubsensesenseMode
---|`smub.SENSE_REMOTE`
---|`smub.SENSE_CALA`
---|`smub.SENSE_LOCAL`



--- **This attribute contains the state of the sense mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Source-measure operations are performed using either 2-wire local sense connections or 4-wire remote sense connections. Writing to this attribute selects the sense mode.The smuX.SENSE_CALA mode is only used for calibration and may only be selected when calibration is enabled.The sense mode can be changed between local and remote while the output is on.The calibration sense mode cannot be selected while the output is on.Resetting the instrument selects the local sense mode.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15138.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.sense = smua.SENSE_REMOTE
--- 
--- --Selects remote sensing for SMU channel A.
--- ```
---@type smubsensesenseMode
smub.sense = 0



--- **This attribute sets the state of the append mode of the reading buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the buffer append mode. This value can only be changed with an empty buffer. Use bufferVar.clear() to empty the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.If the append mode is set to 0, any stored readings in the buffer are cleared before new ones are stored. If append mode is set to 1, any stored readings remain in the buffer and new readings are added to the buffer after the stored readings.With append mode on, the first new measurement is stored at rb[n+1], where n is the number of readings stored in buffer rb.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15127.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- buffer1.appendmode = 1
--- 
--- --Append new readings to contents of the reading buffer named buffer1.
--- ```
bufferMethods.appendmode = 0


--- **This attribute contains the timestamp that indicates when the first reading was stored in the buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute contains the timestamp (in seconds) of the first reading stored in a buffer (rb[1] stored in reading buffer rb). The timestamp is the number of seconds since 12:00 am January 1, 1970 (UTC) that the measurement was performed and stored.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.See the smuX.nvbufferY attribute for details on accessing dedicated reading buffers.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15128.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- basetime = smua.nvbuffer1.basetimestamp
--- print(basetime)
--- 
--- --Read the timestamp for the first reading stored in dedicated reading buffer 1.
--- --Output:
--- --1.57020e+09
--- --This output indicates that the timestamp is 1,570,200,000 seconds (which is Friday, October 4, 2019 at 14:40:00 pm).
--- ```
bufferMethods.basetimestamp = 0


--- **This attribute sets the number of readings a buffer can store.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute reads the number of readings that can be stored in the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.The capacity of the buffer does not change as readings fill the buffer. A dedicated reading buffer that only collects basic items can store over 140,000 readings. Turning on additional collection items, such as timestamps and source values, decreases the capacity of a dedicated reading buffer (for example, smua.nvbuffer1), but does not change the capacity of a user-defined dynamically allocated buffer. A user-defined dynamically allocated buffer has a fixed capacity that is set when the buffer is created.See the smuX.nvbufferY attribute for details on accessing dedicated reading buffers. See the smuX.makebuffer() function for information on creating user-defined dynamically allocated reading buffers.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15129.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- bufferCapacity = smua.nvbuffer1.capacity
---  
--- print(bufferCapacity)
--- 
--- --Reads the capacity of dedicated readingbuffer 1 (source‑measure unit (SMU) channel A).
--- --Output:
--- --1.49789e+05
--- --The above output indicates that the buffer can hold 149789 readings.
--- ```
bufferMethods.capacity = 0


--- **This function empties the buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all readings and related recall attributes from the buffer (for example, bufferVar.timestamps and bufferVar.statuses) from the specified buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15130.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.clear()
--- 
--- --Clears dedicated reading buffer 1 (source‑measure unit (SMU) channel A).
--- ```
function bufferMethods.clear() end


--- **This function clears the cache.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function clears all readings from the specified cache. If you run successive operations that overwrite reading buffer data, the reading buffer may return stale cache data. This can happen when you:To avoid this, you can include explicit calls to the bufferVar.clearcache() function to remove stale values from the reading buffer cache.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15131.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.clearcache()
--- 
--- --Clears the reading buffer cache for dedicated reading buffer 1.
--- ```
function bufferMethods.clearcache() end


--- **This attribute sets whether or not source values are stored with the readings in the buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the storage of source values. Reading this attribute returns the state of source value collection. This value can only be changed with an empty buffer. Empty the buffer using the bufferVar.clear() function.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.When on, source values are stored with readings in the buffer. This requires four extra bytes of storage for each reading. Turning on additional collection items, such as source values (this attribute) and timestamps, decreases the capacity of a dedicated reading buffer, but does not change the capacity of a user-defined dynamically allocated buffer.You cannot collect source values when smuX.trigger.measure.action is set to smuX.ASYNC, so bufferVar.collectsourcevalues must be set to 0 when the measurement action is set to be asynchronous.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15132.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.collectsourcevalues = 1
--- 
--- --Include source values with readings for dedicated reading buffer 1.
--- ```
bufferMethods.collectsourcevalues = 0


--- **This attribute sets whether or not timestamp values are stored with the readings in the buffer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the storage of timestamps. Reading this attribute returns the state of timestamp collection. For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.When on, timestamp values are stored with readings in the buffer. This requires four extra bytes of storage for each reading. Turning on additional collection items, such as timestamps (this attribute) and source values, decreases the capacity of a dedicated reading buffer (for example, smua.nvbuffer1), but does not change the capacity of a user-defined dynamically allocated buffer.The state variable can only be changed when the buffer is empty. Empty the buffer using the bufferVar.clear() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15133.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.collecttimestamps = 1
--- 
--- --Include timestamps with readings for dedicated reading buffer 1.
--- ```
bufferMethods.collecttimestamps = 0


--- **This attribute contains the number of readings in the buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute contains the number of readings presently stored in the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15134.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- numberOfReadings = smua.nvbuffer1.n
--- print(numberOfReadings)
--- 
--- --Reads the number of readings stored in dedicated reading buffer 1 (source‑measure unit (SMU) channel A).
--- --Output:
--- --1.25000+02
--- --The above output indicates that there are 125 readings stored in the buffer.
--- ```
bufferMethods.n = 0


--- **This attribute contains the resolution of the timestamp.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute sets the resolution for the timestamps. Reading this attribute returns the timestamp resolution value. This value can only be changed with an empty buffer. Empty the buffer using the bufferVar.clear() function.The finest timestamp resolution is 0.000001 seconds (1 μs). At this resolution, the reading buffer can store unique timestamps for up to 71 minutes. You can increase this value for very long tests.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15135.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.timestampresolution = 0.000008
---  
--- 
--- --Sets the timestamp resolution of dedicated reading buffer 1 to 8 μs.
--- ```
bufferMethods.timestampresolution = 0


--- **This attribute enables or disables the reading buffer cache (on or off).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Assigning a value to this attribute enables or disables the reading buffer cache. When enabled, the reading buffer cache improves access speed to reading buffer data. If you run successive operations that overwrite reading buffer data, the reading buffer may return stale cache data. This can happen when initiating successive sweeps without reconfiguring the sweep measurements or when overwriting data in the reading buffer by setting the bufferVar.fillmode attribute to smuX.FILL_WINDOW. To avoid this, make sure that you include commands that automatically invalidate the cache as needed (for example, explicit calls to the bufferVar.clearcache() function) or disable the cache using this attribute (bufferVar.cachemode).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.cachemode = 1
--- 
--- --Enables reading buffer cache of dedicated reading buffer 1 (source‑measure unit (SMU) channel A).
--- ```
bufferMethods.cachemode = 0


--- **This attribute sets the reading buffer fill count.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The reading buffer fill count sets the number of readings to store before restarting at index 1. If the value is zero (0), then the capacity of the buffer is used. Use this attribute to control when the SMU restarts filling the buffer at index 1, rather than having it restart when the buffer is full. If the bufferVar.fillcount attribute is set to a value higher than the capacity of the buffer, after storing the element at the end of the buffer, the SMU overwrites the reading at index 1, the reading after that overwrites the reading at index 2, and so on.This attribute is only used when the bufferVar.fillmode attribute is set to smuX.FILL_WINDOW.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18551.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.fillcount = 50
--- 
--- --Sets fill count of dedicated reading buffer 1 to 50.
--- ```
bufferMethods.fillcount = 0

smua.FILL_ONCE = nil
smua.FILL_WINDOW = nil

---@alias bufferVarfillmodefillMode
---|`smua.FILL_ONCE`
---|`smua.FILL_WINDOW`



--- **This attribute sets the reading buffer fill mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When this attribute is set to smuX.FILL_ONCE, the reading buffer does not overwrite readings. If the buffer fills up, new readings are discarded. When this attribute is set to smuX.FILL_WINDOW, new readings are added after existing data until the buffer holds bufferVar.fillcount elements. Continuing the sequence, the next reading overwrites the reading at index 1, the reading after that overwrites the reading at index 2, and so on. For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18552.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.nvbuffer1.fillmode = smua.FILL_ONCE
--- 
--- --Sets fill mode of dedicated reading buffer 1 to fill once (do not overwrite old data).
--- ```
---@type bufferVarfillmodefillMode
bufferMethods.fillmode = 0


--- **This attribute contains the measurement function that was used to acquire a reading stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The measurefunctions buffer recall attribute is like an array (a Lua table) of strings indicating the function measured for the reading.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19914.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- measurefunction = smua.nvbuffer1.measurefunctions[5]
--- 
--- --Store the measure function used to make reading number 5.
--- printbuffer(1, 5, smua.nvbuffer1.measurefunctions)
--- 
--- --Print the measurement function that was used to measure the first five readings saved in dedicated reading buffer 1.
--- --Example output:
--- --Current, Current, Current, Current, Current
--- ```
---@type integer[]
bufferMethods.measurefunctions= {}


--- **This attribute contains the measurement range values that were used for readings stored in a specified buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The measureranges buffer recall attribute is like an array (a Lua table) of full-scale range values for the measure range used when the measurement was made.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19915.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- measurerange = smua.nvbuffer1.measureranges[1]
--- 
--- --Store the measure range that was used to make reading number 1.
--- printbuffer(1, 10, smua.nvbuffer1.measureranges)
--- 
--- --Print the range values that were used for the first 10 readings saved in dedicated reading buffer 1.
--- --Example output:
--- --1.00000e-07, 1.00000e-07,1.00000e-07, 1.00000e-07,1.00000e-07, 1.00000e-07,1.00000e-07, 1.00000e-07,1.00000e-07, 1.00000e-07
--- ```
---@type integer[]
bufferMethods.measureranges= {}


--- **This attribute contains the source function that was being used when the readings were stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.sourcefunctions buffer recall attribute is like an array (a Lua table) of strings indicating the source function at the time of the measurement.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19916.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- sourcefunction = smua.nvbuffer1.sourcefunctions[3]
--- print(sourcefunction)
--- 
--- --Store the source function used to make reading number 3 and output the value.
--- printbuffer(1, 10, smua.nvbuffer1.sourcefunctions)
--- 
--- --Print the source function used for 10 readings stored in dedicated reading buffer 1.
--- --Example output:
--- --Voltage, Voltage, Voltage, Voltage, Voltage, Voltage, Voltage, Voltage, Voltage, Voltage
--- ```
---@type integer[]
bufferMethods.sourcefunctions= {}


--- **This attribute indicates the state of the source output for readings that are stored in a specified buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.sourceoutputstates buffer recall attribute is similar to an array (a Lua table) of strings. This array indicates the state of the source output (Off or On) at the time of the measurement.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19917.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- printbuffer(1, 1, smua.nvbuffer1.sourceoutputstates)
--- 
--- --Print the source output for the first reading stored in dedicated reading buffer 1.
--- --Example output:
--- --On
--- ```
---@type integer[]
bufferMethods.sourceoutputstates= {}


--- **This attribute contains the source range that was used for readings stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.sourceranges buffer recall attribute is like an array (a Lua table) of full-scale range values for the source range used when the measurement was made.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19918.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- sourcerange = smua.nvbuffer1.sourceranges[1]
--- 
--- --Store the source range that was used for the first reading stored in dedicated reading buffer 1.
--- printbuffer(1, 6, smua.nvbuffer1.sourceranges)
--- 
--- --Print the source ranges that were used for the first 6 readings stored in source‑measure unit (SMU) A, buffer 1.
--- --Example output:
--- --1.00000e-04, 1.00000e-04, 1.00000e-04, 1.00000e-04, 1.00000e-04, 1.00000e-04
--- ```
---@type integer[]
bufferMethods.sourceranges= {}


--- **When enabled by the bufferVar.collectsourcevalues attribute, this attribute contains the source levels being output when readings in the reading buffer were acquired.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If the bufferVar.collectsourcevalues attribute is enabled before readings are made, the bufferVar.sourcevalues buffer recall attribute is like an array (a Lua table) of the sourced value in effect at the time of the reading.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19919.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- sourcevalue = smua.nvbuffer1.sourcevalues[1]
---  
--- 
--- --Get the sourced value of the first reading stored in dedicated reading buffer 1.
--- printbuffer(1, 6, smua.nvbuffer1.sourcevalues)
--- 
--- --Print the sourced value of the first 6 readings stored in source‑measure unit (SMU) A, buffer 1.
--- --Example output:
--- --1.00000e-04, 1.00000e-04,
--- --1.00000e-04, 1.00000e-04,
--- --1.00000e-04, 1.00000e-04
--- ```
---@type integer[]
bufferMethods.sourcevalues= {}


--- **This attribute contains the readings stored in a specified reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.readings buffer recall attribute is like an array (a Lua table) of the readings stored in the reading buffer. This array holds the same data that is returned when the reading buffer is accessed directly; that is, rb[2] and rb.readings[2] access the same value.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19920.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(smua.nvbuffer1.readings[1])
--- 
--- --Output the first reading saved in source‑measure unit (SMU) channel A, dedicated reading buffer 1.
--- --Output:
--- --8.81658e-08
--- ```
---@type integer[]
bufferMethods.readings= {}


--- **This attribute contains the status values of readings in the reading buffer.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read‑only buffer recall attribute is like an array (a Lua table) of the status values for all the readings in the buffer. The status values are floating-point numbers that encode the status value; see the following table for values. For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19921.htm"])
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
--- 
--- --Reset the instrument.
--- --Set the voltage source function to dc volts. Set the range to auto.
--- --Set the voltage source to 5 V.
--- --Set current measure limit to 10 mA.
--- --Set the current measure range to 10 mA.
--- --Turn on the output.
--- --Print and place the current reading in the reading buffer.
--- --Turn off the output.
--- --Output status value of the first measurement in the reading buffer. 
--- --Output example:
--- --3.99470e-06
--- --4.00000e+00
--- ```
---@type integer[]
bufferMethods.statuses= {}


--- **When enabled by the bufferVar.collecttimestamps attribute, this attribute contains the timestamp when each reading saved in the specified reading buffer occurred.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- The bufferVar.timestamps information from a reading buffer is only available if the bufferVar.collecttimestamps attribute is set to 1 (default setting). If it is set to 0, you cannot access any time information from a reading buffer. If enabled, this buffer recall attribute is like an array (a Lua table) that contains timestamps, in seconds, of when each reading occurred. These are relative to the bufferVar.basetimestamp for the buffer.For dedicated reading buffers, all buffer attributes are saved to nonvolatile memory only when the reading buffer is saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19922.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- timestamp = smua.nvbuffer1.timestamps[1]
---  
--- 
--- --Get the timestamp of the first reading stored in source‑measure unit (SMU) A, buffer 1.
--- ```
---@type integer[]
bufferMethods.timestamps= {}
---@class timer
timer = {}


--- **This function resets the timer to zero (0) seconds.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15282.htm"])
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


--- **This attribute contains the group number of a TSP‑Link node. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To remove the node from all groups, set the attribute value to 0.When the node is turned off, the group number for that node changes to 0.The master node can be assigned to any group. You can also include other nodes in the group that includes the master. Note that any nodes that are set to 0 are automatically included in the group that contains the master node, regardless of the group that is assigned to the master node.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15285.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.group = 3
--- 
--- --Assign the instrument to TSP-Link group number 3.
--- ```
tsplink.group = 0



--- **This attribute reads the node number assigned to the master node. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- After doing a TSP-Link reset (tsplink.reset()), use this attribute to access the node number of the master in a set of instruments connected over TSP-Link.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15286.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- LinkMaster = tsplink.master
--- 
--- --Store the TSP-Link master node number in a variable called LinkMaster.
--- ```
tsplink.master = 0



--- **This attribute defines the node number. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command sets the TSP‑Link node number and saves the value in nonvolatile memory.Changes to the node number do not take effect until tsplink.reset() from an earlier TSP‑Link instrument is executed on any node in the system.Each node connected to the TSP-Link system must be assigned a different node number.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15287.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.node = 3
--- 
--- --Sets the TSP‑Link node for this instrument to number 3.
--- ```
tsplink.node = 0



--- **This function reads the state of a TSP-Link synchronization line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Returns a value of zero (0) if the line is low and 1 if the line is high.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15288.htm"])
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


--- **This function reads the TSP-Link trigger lines as a digital I/O port. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary equivalent of the returned value indicates the input pattern on the I/O port. The least significant bit of the binary number corresponds to line 1 and the value of bit 3 corresponds to line 3. For example, a returned value of 2 has a binary equivalent of 010. This indicates that line 2 is high (1), and that the other two lines are low (0).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15289.htm"])
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


--- **This attribute describes the TSP‑Link online state. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- When the instrument power is first turned on, the state is offline. After tsplink.reset() is successful, the state is online.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15291.htm"])
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



--- **This function sets a TSP-Link trigger line high or low. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use tsplink.writebit() and tsplink.writeport() to control the output state of the trigger line when trigger operation is set to tsplink.TRIG_BYPASS.If the output line is write‑protected by the tsplink.writeprotect attribute, this command is ignored.The reset function does not affect the present states of the TSP-Link trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15301.htm"])
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


--- **This function writes to all TSP‑Link synchronization lines. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The binary representation of data indicates the output pattern that is written to the I/O port. For example, a data value of 2 has a binary equivalent of 010. Line 2 is set high (1), and the other two lines are set low (0).Write‑protected lines are not changed.Use the tsplink.writebit() and tsplink.writeport() commands to control the output state of the synchronization line when trigger operation is set to tsplink.TRIG_BYPASS.The reset() function does not affect the present states of the trigger lines.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15302.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeport(3)
--- 
--- --Sets the synchronization lines 1 and 2 high (binary 011).
--- ```
---@param data number Value to write to the port (0 to 7)
function tsplink.writeport(data) end


--- **This attribute contains the write‑protect mask that protects bits from changes by the tsplink.writebit() and tsplink.writeport() functions. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The binary equivalent of mask indicates the mask to be set for the TSP-Link trigger line. For example, a mask value of 5 has a binary equivalent of 101. This mask write‑protects TSP-Link trigger lines 1 and 3.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17630.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.writeprotect = 5
--- 
--- --Write‑protects TSP-Link trigger lines 1 and 3.
--- ```
tsplink.writeprotect = 0



--- **This constant contains the command interface trigger event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- You can set the stimulus of any trigger object to the value of this constant to have the trigger object respond to command interface trigger events.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15792.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = trigger.EVENT_ID
--- 
--- --Sets the trigger stimulus of trigger timer 1 to the command interface trigger event.
--- ```
---@type eventID
trigger.EVENT_ID= nil
---@class status
status = {}


--- **This attribute stores the system node enable register. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to read or write to the system node enable register. Reading the system node enable register returns a value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitAssigning a value to this attribute enables one or more status events. When an enabled status event occurs, a summary bit is set in the appropriate system summary register. The register and bit that is set depends on the TSP-Link node number assigned to this instrument.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set the B0 bit of the system node enable register, set status.node_enable = status.MSB.In addition to the above values, nodeEnableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set nodeEnableRegister to the sum of their decimal weights. For example, to set bits B0 and B7, set nodeEnableRegister to 129 (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15830.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15831.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15861.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17593.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17594.htm"])
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



--- **This attribute stores the status byte condition register.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This attribute is used to read the status byte, which is returned as a numeric value. The binary equivalent of the value of this attribute indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B7. For example, if a value of 1.29000e+02 (which is 129) is read as the value of this register, the binary equivalent is 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitThe returned value can indicate one or more status events occurred. When an enabled status event occurs, a summary bit is set in this register to indicate the event occurrence.The individual bits of this register have the following meanings:In addition to the above constants, when more than one bit of the register is set, statusByte equals the sum of their decimal weights. For example, if 129 is returned, bits B0 and B7 are set (1 + 128).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29255.htm"])
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

---@class os
os = {}


--- **This function deletes the file or directory with a given name.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Directories must be empty before using the os.remove() function to delete them.If this function fails, it returns nil (for success) and an error message string (for msg).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19929.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- os.remove("testFile")
--- 
--- --Delete the file named testFile.
--- ```
---@return boolean|nil success A success indicator (true or nil)
---@return string|nil msg A message value (nil or an error message)
---@param filename string A string representing the name of the file or directory to delete
function os.remove(filename) end


--- **This function renames an existing file or directory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If this function fails, it returns nil (for success) and an error message string (for msg).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19930.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- os.rename("testFile", "exampleFile")
---  
--- 
--- --Changes the name of the existing file testFile to the name exampleFile.
--- ```
---@return boolean|nil success A success indicator (true or nil)
---@return string msg A message value (nil or an error message)
---@param oldname string String representing the name of the file or directory to rename
---@param newname string String representing the new name of the file or directory
function os.rename(oldname, newname) end


--- **This function generates a time value in UTC time.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The timespec is a table using the fields listed in the table below.If the time (hour, minute, and second) options are not used, they default to noon for that day. When called without a parameter (the first form), the function returns the current time.Set the time zone before calling the os.time() function.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/25959.htm"])
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


--- **This function loads and runs a script on a remote TSP-enabled instrument.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is appropriate only for TSP-enabled instruments.This function downloads a script to a remote instrument and runs it. It automatically adds the appropriate loadscript and endscript commands around the script, captures any errors, and reads back any prompts. No additional substitutions are done on the text.The script is automatically loaded, compiled, and run.Any output from previous commands is discarded.This command does not wait for the script to complete.If you do not want the script to do anything immediately, make sure the script only defines functions for later use. Use the tspnet.execute() function to execute those functions later.If no name is specified, the script is loaded as the anonymous script.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15280.htm"])
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
local digiotriggerArr = {}

---@type digiotriggerArr[]
digio.trigger = {}


--- **This function asserts a trigger pulse on one of the digital I/O lines. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The pulse width that is set determines how long the instrument asserts the trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14670.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].assert()
--- 
--- --Asserts a trigger on digital I/O line 2.
--- ```
function digiotriggerArr.assert() end



--- **This function clears the trigger event on a digital I/O line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The event detector of a trigger enters the detected state when an event is detected. It is cleared when digio.trigger[N].wait() or digio.trigger[N].clear() is called.digio.trigger[N].clear() clears the event detector of the specified trigger line, discards the history of the trigger line, and clears the digio.trigger[N].overrun attribute.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14671.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].clear()
--- 
--- --Clears the trigger event detector on I/O line 2.
--- ```
function digiotriggerArr.clear() end



--- **This constant identifies the trigger event generated by the digital I/O line N. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- To have another trigger object respond to trigger events generated by the trigger line, set the stimulus attribute of the other object to the value of this constant.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14672.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[5].stimulus = digio.trigger[3].EVENT_ID
--- 
--- --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for digital I/O trigger line 5.
--- ```
digiotriggerArr.EVENT_ID= 0



--- **This attribute sets the mode in which the trigger event detector and the output trigger generator operate on the given trigger line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set triggerMode to one of the following values:When programmed to any mode except digio.TRIG_BYPASS, the output state of the I/O line is controlled by the trigger logic, and the user‑specified output state of the line is ignored.Use of either digio.TRIG_SYNCHRONOUSA or digio.TRIG_SYNCHRONOUSM is preferred over digio.TRIG_SYNCHRONOUS, because digio.TRIG_SYNCHRONOUS is provided for compatibility with the digital I/O and TSP-Link triggering on older firmware.To control the line state, set the mode to digio.TRIG_BYPASS and use the digio.writebit() and digio.writeport() commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14674.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].mode = 2
--- 
--- --Sets the trigger mode for I/O line 4 to digio.TRIG_RISING.
--- ```
digiotriggerArr.mode= 0



--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14675.htm"])
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



--- **This function releases an indefinite length or latched trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulsewidth time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14677.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].release()
--- 
--- --Releases digital I/O trigger line 4.
--- ```
function digiotriggerArr.release() end



--- **This function waits for a trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function pauses trigger operation up to the seconds set by timeout for an input trigger. If one or more trigger events are detected since the last time digio.trigger[N].wait() or digio.trigger[N].clear() was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and ready to detect the next trigger. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14679.htm"])
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



--- **This attribute describes the length of time that the trigger line is asserted for output triggers. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely. To release the trigger line, use digio.trigger[N].release().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17691.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[4].pulsewidth = 20e-6
--- 
--- --Sets the pulse width for trigger line 4 to 20 μs.
--- ```
digiotriggerArr.pulsewidth= 0



--- **This function resets trigger values to their factory defaults. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function resets the following attributes to factory default settings:It also clears digio.trigger[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17719.htm"])
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



--- **This attribute selects the event that causes a trigger to be asserted on the digital output line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to zero (0) to disable the automatic trigger output.Do not use this attribute to generate output triggers under script control. Use digio.trigger[N].assert() instead.The trigger stimulus for a digital I/O line may be set to one of the existing trigger event IDs described in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/26898.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[3].stimulus = 0
--- 
--- --Clear the trigger stimulus of digital I/O line 3.
--- digio.trigger[3].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID
--- 
--- --Set the trigger stimulus of digital I/O line 3 to be the source complete event.
--- ```
---@type eventID|0
digiotriggerArr.stimulus= 0



--- **This function removes an entry from the USER menu, which can be accessed using the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you delete an entry from the USER menu, you can no longer run it by pressing the LOAD key.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14706.htm"])
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
---@param displayName string The name to be deleted from the USER menu
function display.loadmenu.delete(displayName) end

display.SAVE = nil
display.DONT_SAVE = nil

---@alias displayloadmenuaddmemory
---|`display.SAVE`
---|`display.DONT_SAVE`



--- **This function adds an entry to the USER menu, which can be accessed by pressing the LOAD key on the front panel.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- After adding code to the load menu, you can run it from the front panel by pressing the LOAD key, then selecting USER to select from the available code to load. Pressing the RUN key then runs the script.You can add items in any order. They are always displayed in alphabetical order when the menu is selected.Any Lua code can be included in the code parameter. If memory is set to display.SAVE, the entry (name and code) is saved in nonvolatile memory. Scripts, functions, and variables used in the code are not saved by display.SAVE. Functions and variables need to be saved with the code. If the code is not saved in nonvolatile memory, it is lost when the 2600B is turned off. See Example 2 below.If you do not make a selection for memory, the code is automatically saved to nonvolatile memory.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19382.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.loadmenu.add("Test9", "Test9()")
--- 
--- --Assume a user script named Test9 is loaded into the runtime environment. Adds the menu entry to the USER menu to run the script after loading.
--- display.loadmenu.add("Test", "DUT1() beeper.beep(2, 500)", display.SAVE)
--- 
--- --Assume a script with a function named “DUT1” is loaded into the instrument, and the script has not been saved in nonvolatile memory.
--- --Now assume you want to add a test named “Test” to the USER menu. You want the test to run the function named DUT1 and sound the beeper. This example adds Test to the menu, defines the code, and then saves the displayName and code in nonvolatile memory.
--- --When Test is run from the front panel USER menu, the function named DUT1 executes and the beeper beeps for two seconds.
--- --Now assume you turn off instrument power. Because the script was not saved in nonvolatile memory, the function named DUT1 is lost when you turn the instrument on. When Test is run again from the front panel, an error is generated because DUT1 no longer exists in the instrument as a function.
--- display.loadmenu.add("Part1", "testpart([[Part1]], 5.0)", display.SAVE)
--- 
--- --Adds an entry called Part1 to the front‑panel USER load menu for the code testpart([[Part1]], 5.0) and saves it in nonvolatile memory.
--- ```
---@param displayName string The name that is added to the USER menu
---@param code string The code that is run from the USER menu
---@param memory displayloadmenuaddmemory Determines if code is saved to nonvolatile memory
---@overload fun(displayName:string,code:string)
function display.loadmenu.add(displayName, code, memory) end
---@class display.smua
display.smua = {}

display.DIGITS_5_5 = nil
display.DIGITS_6_5 = nil
display.DIGITS_4_5 = nil

---@alias displaysmuadigitsdigits
---|`display.DIGITS_5_5`
---|`display.DIGITS_6_5`
---|`display.DIGITS_4_5`



--- **This attribute sets the front‑panel display resolution of the selected measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- SMU A and SMU B can be set for different measurement display resolutions.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14713.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.digits = display.DIGITS_5_5
--- 
--- --Select 5½ digit resolution for SMU A.
--- ```
---@type displaysmuadigitsdigits
display.smua.digits = 0

---@class display.smub
display.smub = {}

display.DIGITS_5_5 = nil
display.DIGITS_6_5 = nil
display.DIGITS_4_5 = nil

---@alias displaysmubdigitsdigits
---|`display.DIGITS_5_5`
---|`display.DIGITS_6_5`
---|`display.DIGITS_4_5`



--- **This attribute sets the front‑panel display resolution of the selected measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- SMU A and SMU B can be set for different measurement display resolutions.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14713.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.digits = display.DIGITS_5_5
--- 
--- --Select 5½ digit resolution for SMU A.
--- ```
---@type displaysmubdigitsdigits
display.smub.digits = 0

---@class display.trigger
display.trigger = {}


--- **This function clears the front‑panel trigger event detector.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector remembers if an event has been detected since the last display.trigger.wait() call. This function clears the trigger event detector and discards the previous history of TRIG key presses.This attribute also clears the display.trigger.overrun attribute.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14715.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function display.trigger.clear() end


--- **This constant is the event ID of the event generated when the front‑panel TRIG key is pressed.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to front-panel trigger key events.None
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14716.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
---@type eventID
display.trigger.EVENT_ID= nil


--- **This function waits for the TRIG key on the front panel to be pressed.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If the trigger key was previously pressed and one or more trigger events were detected, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.Use the display.trigger.clear() call to clear the trigger event detector.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14717.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- triggered = display.trigger.wait(5)
--- print(triggered)
--- 
--- --Waits up to five seconds for the TRIG key to be pressed. If TRIG is pressed within five seconds, the output is true. If not, the output is false.
--- ```
---@return boolean triggered true
---@param timeout number Timeout in seconds
function display.trigger.wait(timeout) end


--- **This attribute contains the event detector overrun status.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates if a trigger event was ignored because the event detector was already in the detected state when the TRIG button was pressed.Indicates the overrun state of the event detector built into the display.This attribute does not indicate whether an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14739.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- overrun = display.trigger.overrun
--- 
--- --Sets the variable overrun equal to the present state of the event detector built into the display. 
--- ```
display.trigger.overrun = 0

---@class lan.config
lan.config = {}

lan.HALF = nil
lan.FULL = nil

---@alias lanconfigduplexduplex
---|`lan.HALF`
---|`lan.FULL`



--- **This attribute defines the LAN duplex mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute does not indicate the actual setting currently in effect. Use the lan.status.duplex attribute to determine the present operating state of the LAN.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14903.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.config.duplex = lan.FULL
--- 
--- --Set the LAN duplex mode to full.
--- ```
---@type lanconfigduplexduplex
lan.config.duplex = 0



--- **This attribute contains the LAN default gateway address.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the default gateway IP address to use when manual or DLLA configuration methods are used to configure the LAN. If DHCP is enabled, this setting is ignored.This attribute does not indicate the actual setting that is presently in effect. Use the lan.status.gateway attribute to determine the present operating state of the LAN.The IP address must be formatted in four groups of numbers, each separated by a decimal.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14904.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14905.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14906.htm"])
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



--- **This attribute contains the LAN speed used when restarting in manual configuration mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the speed that is used if the LAN is restarted for manual configuration operation.This attribute does not indicate the actual setting presently in effect. Use the lan.status.speed attribute to determine the present operating state of the LAN.The LAN speed is measured in megabits per second (Mbps).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14907.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.config.speed = 100
--- 
--- --Configure LAN speed for 100.
--- ```
lan.config.speed = 0



--- **This attribute contains the LAN subnet mask.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the LAN subnet mask that is used when the manual configuration method is used to configure the LAN. This setting is ignored when DLLA or DHCP is used.This attribute does not indicate the actual setting presently in effect. Use the lan.status.subnetmask attribute to determine the present operating state of the LAN.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14908.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14911.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14912.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14913.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14914.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14919.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14920.htm"])
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
local lantriggerArr = {}

---@type lantriggerArr[]
lan.trigger = {}


--- **This function simulates the occurrence of the trigger and generates the corresponding event ID.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Generates and sends a LAN trigger packet for the LAN event number specified.Sets the pseudo line state to the appropriate state.The following indexes provide the listed LXI events:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14921.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14922.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14923.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14924.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14925.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- ```
function lantriggerArr.disconnect() end



--- **This constant is the event identifier used to route the LAN trigger to other subsystems (using stimulus properties).**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to incoming LAN trigger packets.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14926.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14927.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14928.htm"])
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
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event.It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14929.htm"])
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


lan.UDP2 = nil
lan.TCP1 = nil
lan.MULTICAST = nil

---@alias lantriggerprotocolprotocol
---|`lan.UDP2`
---|`lan.TCP1`
---|`lan.MULTICAST`



--- **This attribute sets the LAN protocol to use for sending trigger messages.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The LAN trigger listens for trigger messages on all supported protocols, but uses the designated protocol for sending outgoing messages. After changing this setting, lan.trigger[N].connect() must be called before outgoing event messages can be sent.When the lan.MULTICAST protocol is selected, the lan.trigger[N].ipaddress attribute is ignored and event messages are sent to the multicast address 224.0.23.159.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14930.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14931.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14933.htm"])
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
--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. Set triggerStimulus to one of the trigger event IDs, which are shown in the following table.Setting this attribute to zero disables automatic trigger generation.If any events are detected prior to calling lan.trigger[N].connect(), the event is ignored and the action overrun is set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17679.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- lan.trigger[5].stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Use timer 1 trigger event as the source for LAN packet 5 trigger stimulus.
--- ```
---@type eventID|0
lantriggerArr.stimulus= 0

---@class smua.cal
smua.cal = {}


--- **This function disables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before you can lock calibration, the calibration constants must be written to nonvolatile memory or a previous calibration set must be restored. Error code 5012, "Cal data not saved - save or restore before lock," results if this function is called when the calibration state is smuX.CALSTATE_CALIBRATING.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15089.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.lock()
--- 
--- --Disables calibration functions for SMU channel A.
--- ```
function smua.cal.lock() end

smua.CALSET_NOMINAL = nil
smua.CALSET_FACTORY = nil
smua.CALSET_PREVIOUS = nil
smua.CALSET_DEFAULT = nil

---@alias smuacalrestorecalset
---|`smua.CALSET_NOMINAL`
---|`smua.CALSET_FACTORY`
---|`smua.CALSET_PREVIOUS`
---|`smua.CALSET_DEFAULT`



--- **This function loads a stored set of calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function overwrites the present set of calibration constants with constants read from nonvolatile memory.This function is disabled until a successful call to smuX.cal.unlock() is made.If calset is not specified, smuX.CALSET_DEFAULT is used.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15090.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.restore()
--- 
--- --Restores factory calibration constants for SMU channel A.
--- ```
---@param calset smuacalrestorecalset The calibration set to be loaded; set calset to one of the following values
---@overload fun()
function smua.cal.restore(calset) end


--- **This function stores the active calibration constants to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function stores the active set of calibration constants to nonvolatile memory. The previous calibration constants (from the default calibration set) are copied to the previous calibration set (smuX.CALSET_PREVIOUS) before overwriting the default calibration set.This function is disabled until a successful call to smuX.cal.unlock() is made.If any of the calibration constants have been changed, this function is disabled unless the calibration date, the calibration due date, and the calibration adjust date have been assigned new values.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15091.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.save()
--- 
--- --Stores calibration constants for SMU channel A in nonvolatile memory.
--- ```
function smua.cal.save() end


--- **This function enables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function enables the calibration functions to change the calibration settings.The password when the instrument is shipped from the factory is "KI0026XX".
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15092.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.unlock("KI0026XX")
--- 
--- --Unlocks calibration for SMU channel A.
--- ```
---@param password string Calibration password
function smua.cal.unlock(password) end


--- **This attribute stores the date of the last calibration adjustment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the adjustment date associated with the active calibration set. The adjustment date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function.You cannot change the adjustment date without first making a change to the calibration constants.Once you change any calibration constants, you must set the adjustment date before you can save the calibration data to the nonvolatile memory of the SMU.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.adjustdate must be set to the date the adjustment was done using the UTC time and date. The date is stored as the number of seconds since UTC, 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.adjustdate is only accurate to within a few minutes of the value set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15093.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.adjustdate = os.time()
--- 
--- --Sets the adjustment date for SMU channel A to the current time set on the instrument.
--- ```
smua.cal.adjustdate = 0



--- **This attribute stores the calibration date of the active calibration set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration date that is associated with the active calibration set. The calibration date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the instrument was calibrated.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.date must be set to the date the calibration was done using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.date is accurate to within a few minutes of the value set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15094.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.date = os.time()
--- 
--- --Sets calibration date for SMU channel A to the present time set on the instrument.
--- ```
smua.cal.date = 0



--- **This attribute stores the calibration due date for the next calibration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration due date associated with the active calibration set. The calibration due date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the next calibration should be performed.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the due date stored with that set.smuX.cal.due must be set to the date the next calibration is required using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.due is only accurate to within a few minutes of the value set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15095.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.due = os.time() + 365 * 24 * 60 * 60
--- 
--- --Sets the SMU channel A calibration due date equal to one year from the present time set on the instrument.
--- ```
smua.cal.due = 0



--- **This attribute stores the password required to enable calibration.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- A new password can only be assigned when calibration has been unlocked.The calibration password is write-only and cannot be read.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15096.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.password = "LetMeIn"
--- 
--- --Assigns a new calibration password for SMU channel A.
--- ```
smua.cal.password = 0


smua.CAL_NEGATIVE = nil
smua.CAL_AUTO = nil
smua.CAL_POSITIVE = nil

---@alias smuacalpolaritycalPolarity
---|`smua.CAL_NEGATIVE`
---|`smua.CAL_AUTO`
---|`smua.CAL_POSITIVE`



--- **This attribute controls which calibration constants are used for all subsequent measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls which polarity calibration constants are used to make all subsequent measurements.This attribute does not affect the smuX.measure.calibrateY() command. The polarity for smuX.measure.calibrateY() is dictated by the range parameter that is defined for it. The measurement calibration commands require the measurements provided to have been made using the polarity being calibrated.When making measurements for calibration points far away from zero, the desired polarity constants are inherently used. However, when making measurements near zero, it is possible that the instrument could use the calibration constants from the wrong polarity. Setting smuX.cal.polarity to positive or negative forces measurements to be made using the calibration constants for a given polarity, rather than basing the choice on the raw measurement data.This attribute can only be set to positive or negative when calibration is unlocked. This attribute is automatically set to smuX.CAL_AUTO when calibration is locked.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15097.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.polarity = smua.CAL_POSITIVE
--- 
--- --Selects positive calibration constants for all subsequent measurements on SMU channel A.
--- ```
---@type smuacalpolaritycalPolarity
smua.cal.polarity = 0


smua.CALSTATE_CALIBRATING = nil
smua.CALSTATE_LOCKED = nil
smua.CALSTATE_UNLOCKED = nil

---@alias smuacalstatecalState
---|`smua.CALSTATE_CALIBRATING`
---|`smua.CALSTATE_LOCKED`
---|`smua.CALSTATE_UNLOCKED`



--- **This attribute returns the present calibration state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute indicates the calibration state of the instrument: Locked, calibrating, or unlocked.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15098.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- calstate = smua.cal.state
--- print(calstate)
--- 
--- --Reads calibration state for SMU channel A.
--- --Output:
--- --0.000000e+00
--- --The above output indicates that calibration is locked.
--- ```
---@type smuacalstatecalState
smua.cal.state = 0

---@class smub.cal
smub.cal = {}


--- **This function disables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Before you can lock calibration, the calibration constants must be written to nonvolatile memory or a previous calibration set must be restored. Error code 5012, "Cal data not saved - save or restore before lock," results if this function is called when the calibration state is smuX.CALSTATE_CALIBRATING.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15089.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.lock()
--- 
--- --Disables calibration functions for SMU channel A.
--- ```
function smub.cal.lock() end

smub.CALSET_NOMINAL = nil
smub.CALSET_FACTORY = nil
smub.CALSET_PREVIOUS = nil
smub.CALSET_DEFAULT = nil

---@alias smubcalrestorecalset
---|`smub.CALSET_NOMINAL`
---|`smub.CALSET_FACTORY`
---|`smub.CALSET_PREVIOUS`
---|`smub.CALSET_DEFAULT`



--- **This function loads a stored set of calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function overwrites the present set of calibration constants with constants read from nonvolatile memory.This function is disabled until a successful call to smuX.cal.unlock() is made.If calset is not specified, smuX.CALSET_DEFAULT is used.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15090.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.restore()
--- 
--- --Restores factory calibration constants for SMU channel A.
--- ```
---@param calset smubcalrestorecalset The calibration set to be loaded; set calset to one of the following values
---@overload fun()
function smub.cal.restore(calset) end


--- **This function stores the active calibration constants to nonvolatile memory.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function stores the active set of calibration constants to nonvolatile memory. The previous calibration constants (from the default calibration set) are copied to the previous calibration set (smuX.CALSET_PREVIOUS) before overwriting the default calibration set.This function is disabled until a successful call to smuX.cal.unlock() is made.If any of the calibration constants have been changed, this function is disabled unless the calibration date, the calibration due date, and the calibration adjust date have been assigned new values.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15091.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.save()
--- 
--- --Stores calibration constants for SMU channel A in nonvolatile memory.
--- ```
function smub.cal.save() end


--- **This function enables the commands that change calibration settings.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function enables the calibration functions to change the calibration settings.The password when the instrument is shipped from the factory is "KI0026XX".
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15092.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.unlock("KI0026XX")
--- 
--- --Unlocks calibration for SMU channel A.
--- ```
---@param password string Calibration password
function smub.cal.unlock(password) end


--- **This attribute stores the date of the last calibration adjustment.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the adjustment date associated with the active calibration set. The adjustment date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function.You cannot change the adjustment date without first making a change to the calibration constants.Once you change any calibration constants, you must set the adjustment date before you can save the calibration data to the nonvolatile memory of the SMU.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.adjustdate must be set to the date the adjustment was done using the UTC time and date. The date is stored as the number of seconds since UTC, 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.adjustdate is only accurate to within a few minutes of the value set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15093.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.adjustdate = os.time()
--- 
--- --Sets the adjustment date for SMU channel A to the current time set on the instrument.
--- ```
smub.cal.adjustdate = 0



--- **This attribute stores the calibration date of the active calibration set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration date that is associated with the active calibration set. The calibration date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the instrument was calibrated.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the date stored with that set.smuX.cal.date must be set to the date the calibration was done using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.date is accurate to within a few minutes of the value set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15094.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.date = os.time()
--- 
--- --Sets calibration date for SMU channel A to the present time set on the instrument.
--- ```
smub.cal.date = 0



--- **This attribute stores the calibration due date for the next calibration.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute stores the calibration due date associated with the active calibration set. The calibration due date can be read at any time but can only be assigned a new value when calibration has been enabled with the smuX.cal.unlock() function. It is typically set to the date when the next calibration should be performed.This attribute is stored with the active calibration set. If a different calibration set is restored, this attribute reflects the due date stored with that set.smuX.cal.due must be set to the date the next calibration is required using the UTC time and date. The date is stored as the number of seconds since UTC 12:00 am Jan 1, 1970.Due to the internal storage format, smuX.cal.due is only accurate to within a few minutes of the value set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15095.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.due = os.time() + 365 * 24 * 60 * 60
--- 
--- --Sets the SMU channel A calibration due date equal to one year from the present time set on the instrument.
--- ```
smub.cal.due = 0



--- **This attribute stores the password required to enable calibration.**
---
--- *Type:*  Attribute_WO
---
--- *Details:*<br>
--- A new password can only be assigned when calibration has been unlocked.The calibration password is write-only and cannot be read.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15096.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.password = "LetMeIn"
--- 
--- --Assigns a new calibration password for SMU channel A.
--- ```
smub.cal.password = 0


smub.CAL_NEGATIVE = nil
smub.CAL_AUTO = nil
smub.CAL_POSITIVE = nil

---@alias smubcalpolaritycalPolarity
---|`smub.CAL_NEGATIVE`
---|`smub.CAL_AUTO`
---|`smub.CAL_POSITIVE`



--- **This attribute controls which calibration constants are used for all subsequent measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls which polarity calibration constants are used to make all subsequent measurements.This attribute does not affect the smuX.measure.calibrateY() command. The polarity for smuX.measure.calibrateY() is dictated by the range parameter that is defined for it. The measurement calibration commands require the measurements provided to have been made using the polarity being calibrated.When making measurements for calibration points far away from zero, the desired polarity constants are inherently used. However, when making measurements near zero, it is possible that the instrument could use the calibration constants from the wrong polarity. Setting smuX.cal.polarity to positive or negative forces measurements to be made using the calibration constants for a given polarity, rather than basing the choice on the raw measurement data.This attribute can only be set to positive or negative when calibration is unlocked. This attribute is automatically set to smuX.CAL_AUTO when calibration is locked.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15097.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.cal.polarity = smua.CAL_POSITIVE
--- 
--- --Selects positive calibration constants for all subsequent measurements on SMU channel A.
--- ```
---@type smubcalpolaritycalPolarity
smub.cal.polarity = 0


smub.CALSTATE_CALIBRATING = nil
smub.CALSTATE_LOCKED = nil
smub.CALSTATE_UNLOCKED = nil

---@alias smubcalstatecalState
---|`smub.CALSTATE_CALIBRATING`
---|`smub.CALSTATE_LOCKED`
---|`smub.CALSTATE_UNLOCKED`



--- **This attribute returns the present calibration state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This read-only attribute indicates the calibration state of the instrument: Locked, calibrating, or unlocked.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15098.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- calstate = smua.cal.state
--- print(calstate)
--- 
--- --Reads calibration state for SMU channel A.
--- --Output:
--- --0.000000e+00
--- --The above output indicates that calibration is locked.
--- ```
---@type smubcalstatecalState
smub.cal.state = 0

---@class smua.contact
smua.contact = {}


--- **This function adjusts the high/sense high contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement calibration does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15099.htm"])
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
--- 
--- --The instrument performs a contact check.
--- --Install and measure two resistors.
--- --The user sends the contact check LO calibration command.
--- --The user sends the contact check HI calibration command.
--- ```
---@param cp1Measured any The value measured by this SMU for point 1
---@param cp1Reference any The reference measurement for point 1 as measured externally
---@param cp2Measured any The value measured by this SMU for point 2
---@param cp2Reference any The reference measurement for point 2 as measured externally
function smua.contact.calibratehi(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function adjusts the low/sense low contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement adjustment does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the active calibration set. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15100.htm"])
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
--- 
--- --The instrument performs a contact check.
--- --Install and measure two resistors.
--- --The user sends the contact check LO calibration command.
--- --The user sends the contact check HI calibration command.
--- ```
---@param cp1Measured any The value measured by this SMU for point 1
---@param cp1Reference any The reference measurement for point 1 as measured externally
---@param cp2Measured any The value measured by this SMU for point 2
---@param cp2Reference any The reference measurement for point 2 as measured externally
function smua.contact.calibratelo(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function determines if contact resistance is lower than the threshold. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns true if the contact resistance is below the threshold; this function returns false if it is above the threshold. The threshold value is set by the smuX.contact.threshold attribute.An error is generated when the output is on and:An error is generated when the output is off and:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15101.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    -- take action
--- end
--- 
--- --Takes action if contact check on SMU channel A fails.
--- ```
function smua.contact.check() end


--- **This function measures aggregate contact resistance. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you attempt to perform a contact resistance measurement when any of the following conditions exist, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15102.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    smua.contact.speed = smua.CONTACT_SLOW
---    rhi, rlo = smua.contact.r()
---    print(rhi, rlo)
---    exit()
--- end
--- 
--- --Check contacts against threshold.
--- --Set speed for SMU channel A to slow.
--- --Get resistance readings.
--- --Output contact resistances to the host.
--- --Terminate execution.
--- ```
---@return any rhi The measured aggregate contact resistance on the HI/sense HI side
---@return any rlo The measured aggregate contact resistance on the LO/sense LO side
function smua.contact.r() end

smua.CONTACT_SLOW = nil
smua.CONTACT_FAST1 = nil
smua.CONTACT_MEDIUM2 = nil

---@alias smuacontactspeedspeedSetting
---|`smua.CONTACT_SLOW`
---|`smua.CONTACT_FAST1`
---|`smua.CONTACT_MEDIUM2`



--- **This attribute stores the speed setting for contact check measurements. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting controls the aperture of measurements made for contact check. It does not affect the smuX.measure.nplc aperture setting.The speed setting can have a dramatic effect on the accuracy of the measurement (see specifications).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15103.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.speed = smua.CONTACT_SLOW
--- 
--- --Configure contact check for higher accuracy on SMU channel A.
--- ```
---@type smuacontactspeedspeedSetting
smua.contact.speed = 0



--- **This attribute stores the resistance threshold for the smuX.contact.check() function. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the threshold to less than 1 kΩ.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15104.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.threshold = 5
--- 
--- --Set the contact check threshold for SMU channel A to 5 Ω.
--- ```
smua.contact.threshold = 0

---@class smub.contact
smub.contact = {}


--- **This function adjusts the high/sense high contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement calibration does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15099.htm"])
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
--- 
--- --The instrument performs a contact check.
--- --Install and measure two resistors.
--- --The user sends the contact check LO calibration command.
--- --The user sends the contact check HI calibration command.
--- ```
---@param cp1Measured any The value measured by this SMU for point 1
---@param cp1Reference any The reference measurement for point 1 as measured externally
---@param cp2Measured any The value measured by this SMU for point 2
---@param cp2Reference any The reference measurement for point 2 as measured externally
function smub.contact.calibratehi(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function adjusts the low/sense low contact check measurement. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Contact check measurement adjustment does not require range information.Typically, points one and two are near 0 Ω and 50 Ω, respectively.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the active calibration set. If not, corruption of the calibration constants may result.The new calibration constants are activated immediately but are not written to nonvolatile memory. Use smuX.cal.save() to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is disabled until a successful call to smuX.cal.unlock() is made.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15100.htm"])
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
--- 
--- --The instrument performs a contact check.
--- --Install and measure two resistors.
--- --The user sends the contact check LO calibration command.
--- --The user sends the contact check HI calibration command.
--- ```
---@param cp1Measured any The value measured by this SMU for point 1
---@param cp1Reference any The reference measurement for point 1 as measured externally
---@param cp2Measured any The value measured by this SMU for point 2
---@param cp2Reference any The reference measurement for point 2 as measured externally
function smub.contact.calibratelo(cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function determines if contact resistance is lower than the threshold. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns true if the contact resistance is below the threshold; this function returns false if it is above the threshold. The threshold value is set by the smuX.contact.threshold attribute.An error is generated when the output is on and:An error is generated when the output is off and:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15101.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    -- take action
--- end
--- 
--- --Takes action if contact check on SMU channel A fails.
--- ```
function smub.contact.check() end


--- **This function measures aggregate contact resistance. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you attempt to perform a contact resistance measurement when any of the following conditions exist, an error is generated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15102.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- if not smua.contact.check() then
---    smua.contact.speed = smua.CONTACT_SLOW
---    rhi, rlo = smua.contact.r()
---    print(rhi, rlo)
---    exit()
--- end
--- 
--- --Check contacts against threshold.
--- --Set speed for SMU channel A to slow.
--- --Get resistance readings.
--- --Output contact resistances to the host.
--- --Terminate execution.
--- ```
---@return any rhi The measured aggregate contact resistance on the HI/sense HI side
---@return any rlo The measured aggregate contact resistance on the LO/sense LO side
function smub.contact.r() end

smub.CONTACT_SLOW = nil
smub.CONTACT_FAST1 = nil
smub.CONTACT_MEDIUM2 = nil

---@alias smubcontactspeedspeedSetting
---|`smub.CONTACT_SLOW`
---|`smub.CONTACT_FAST1`
---|`smub.CONTACT_MEDIUM2`



--- **This attribute stores the speed setting for contact check measurements. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This setting controls the aperture of measurements made for contact check. It does not affect the smuX.measure.nplc aperture setting.The speed setting can have a dramatic effect on the accuracy of the measurement (see specifications).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15103.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.speed = smua.CONTACT_SLOW
--- 
--- --Configure contact check for higher accuracy on SMU channel A.
--- ```
---@type smubcontactspeedspeedSetting
smub.contact.speed = 0



--- **This attribute stores the resistance threshold for the smuX.contact.check() function. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set the threshold to less than 1 kΩ.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15104.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.contact.threshold = 5
--- 
--- --Set the contact check threshold for SMU channel A to 5 Ω.
--- ```
smub.contact.threshold = 0

---@class smua.measure
smua.measure = {}


--- **This attribute controls the use of an analog filter when measuring on the lowest current ranges (2634B, 2635B, and 2636B only).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute engages an approximately 1 Hz analog filter across the current range elements.The analog filter is only active when using the 1 nA and 100 pA measurement ranges.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15106.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.analogfilter = 0
--- 
--- --Turns off the SMU channel A analog filter.
--- ```
smua.measure.analogfilter = 0


smua.AUTORANGE_ON = nil
smua.AUTORANGE_OFF = nil
smua.AUTORANGE_FOLLOW_LIMIT = nil

---@alias smuameasureautorangevautoRange
---|`smua.AUTORANGE_ON`
---|`smua.AUTORANGE_OFF`
---|`smua.AUTORANGE_FOLLOW_LIMIT`



--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables voltage measurement autoranging for SMU channel A.
--- ```
---@type smuameasureautorangevautoRange
smua.measure.autorangev = 0


smua.AUTORANGE_ON = nil
smua.AUTORANGE_OFF = nil
smua.AUTORANGE_FOLLOW_LIMIT = nil

---@alias smuameasureautorangeiautoRange
---|`smua.AUTORANGE_ON`
---|`smua.AUTORANGE_OFF`
---|`smua.AUTORANGE_FOLLOW_LIMIT`



--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables voltage measurement autoranging for SMU channel A.
--- ```
---@type smuameasureautorangeiautoRange
smua.measure.autorangei = 0


smua.AUTOZERO_OFF = nil
smua.AUTOZERO_ONCE = nil
smua.AUTOZERO_AUTO = nil

---@alias smuameasureautozeroazMode
---|`smua.AUTOZERO_OFF`
---|`smua.AUTOZERO_ONCE`
---|`smua.AUTOZERO_AUTO`



--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The analog-to-digital converter (ADC) uses a ratiometric A/D conversion technique. To ensure the accuracy of readings, the instrument must periodically obtain new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture being used for measurements. The 2600B uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made. If the reference measurements have expired when a signal measurement is made, the instrument automatically takes two more A/D conversions, one for the reference and one for the zero, before returning the result. Thus, occasionally, a measurement takes more time than normal.This additional time can cause problems in sweeps and other test sequences in which measurement timing is critical. To avoid the time that is needed for the reference measurements in these situations, you can use the smuX.measure.autozero attribute to disable the automatic reference measurements.Disabling automatic reference measurements may allow the instrument to gradually drift out of specification. To minimize the drift, make a reference and zero measurement immediately before any critical test sequences. You can use the smuX.AUTOZERO_ONCE setting to force a refresh of the reference and zero measurements that are used for the present aperture setting.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15108.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autozero = smua.AUTOZERO_ONCE
--- 
--- --Performs autozero once for SMU channel A.
--- ```
---@type smuameasureautozeroazMode
smua.measure.autozero = 0



--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
--- 
--- --Adjust SMU channel A voltage measurement using the following values:
--- --1 V calibration range1e−4 for +zero measurement reading1e−5 for +zero DMM measurement reading0.92 for +FS measurement reading0.903 for the +FS DMM measurement r--- ```
---@param range number The measurement range to adjust
---@param cp1Measured number The value measured by this SMU for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Measured number The value measured by this SMU for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smua.measure.calibratev(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
--- 
--- --Adjust SMU channel A voltage measurement using the following values:
--- --1 V calibration range1e−4 for +zero measurement reading1e−5 for +zero DMM measurement reading0.92 for +FS measurement reading0.903 for the +FS DMM measurement r--- ```
---@param range number The measurement range to adjust
---@param cp1Measured number The value measured by this SMU for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Measured number The value measured by this SMU for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smua.measure.calibratei(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end

smua.DELAY_OFF = nil
smua.DELAY_AUTO = nil

---@alias smuameasuredelaymDelay
---|`smua.DELAY_OFF`
---|`smua.DELAY_AUTO`



--- **This attribute controls the measurement delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) before making a measurement. If you define the value instead of using the automatic delay value, the delay you set is used regardless of the range.The smuX.DELAY_AUTO setting causes a current range-dependent delay to be inserted when a current measurement is requested. This happens when a current measurement command is executed, when the measure action is being performed in a sweep, or after changing ranges during an autoranged measurement.If smuX.measure.count is greater than 1, the measurement delay is only inserted before the first measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15111.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delay = 0.010
--- 
--- --Sets a 10 ms measurement delay for SMU channel A.
--- ```
---@type smuameasuredelaymDelay
smua.measure.delay = 0



--- **This attribute stores a multiplier to the delays that are used when smuX.measure.delay is set to smuX.DELAY_AUTO.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The delay factor is only applied when smuX.measure.delay = smuX.DELAY_AUTO.This attribute can be set to a value less than 1 (for example, 0.5) to decrease the automatic delay.This attribute can be set to a value greater than 1 (for example, 1.5 or 2.0) to increase the automatic delay.Setting this attribute to zero disables delays when smuX.measure.delay = smuX.DELAY_AUTO.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15112.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delayfactor = 2.0
--- 
--- --Doubles the measure delay for SMU channel A.
--- ```
smua.measure.delayfactor = 0



--- **This attribute contains a delay multiplier that is only used during range changes when the high-capacitance mode is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This delay multiplier is only active when the high-capacitance mode is active.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15116.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.highcrangedelayfactor = 5
--- 
--- --Increases the delay used during range changes for SMU channel A by a factor of 5.
--- ```
smua.measure.highcrangedelayfactor = 0



--- **This attribute sets the interval between multiple measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the time interval between measurements when smuX.measure.count is set to a value greater than 1. The SMU attempts to start each measurement when scheduled. If the SMU cannot keep up with the interval setting, measurements are made as quickly as possible.If filtered measurements are being made, the time interval is from the start of the first measurement for the filtered reading to the first measurement for a subsequent filtered reading. Extra measurements made to satisfy a filtered reading are not paced by this interval.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15117.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.interval = 0.5
--- 
--- --Sets the measure interval for SMU channel A to 0.5 s.
--- ```
smua.measure.interval = 0



--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15118.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
--- 
--- --Sets voltage low range for SMU channel A to 1 V.
--- ```
smua.measure.lowrangev = 0



--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15118.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
--- 
--- --Sets voltage low range for SMU channel A to 1 V.
--- ```
smua.measure.lowrangei = 0



--- **This command sets the integration aperture for measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the integration aperture for the analog‑to‑digital converter (ADC).The integration aperture is based on the number of power line cycles (NPLC), where 1 PLC for 60 Hz is 16.67 ms (1/60) and 1 PLC for 50 Hz is 20 ms (1/50).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15119.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.nplc = 0.5
--- 
--- --Sets the integration time for SMU channel A to 0.5.
--- ```
smua.measure.nplc = 0



--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15121.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
--- 
--- --Selects the 1 V measurement range for SMU channel A.
--- ```
smua.measure.rangev = 0



--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15121.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
--- 
--- --Selects the 1 V measurement range for SMU channel A.
--- ```
smua.measure.rangei = 0



--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smua.measure.v(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smua.measure.i(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smua.measure.r(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smua.measure.p(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return number iReading The last reading of the current measurement process
---@return number vReading The last reading of the voltage measurement process
---@param iReadingBuffer bufferMethods A reading buffer object where current readings are stored
---@param vReadingBuffer bufferMethods A reading buffer object where voltage readings are stored
---@overload fun():number
---@overload fun():number
---@overload fun(readingBuffer:bufferMethods):number
---@overload fun(iReadingBuffer:bufferMethods):number
function smua.measure.iv(iReadingBuffer, vReadingBuffer) end


--- **This attribute sets the number of measurements made when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the number of measurements made any time a measurement is requested. When using a reading buffer with a measure command, this attribute also controls the number of readings to be stored.If the count is set to a value greater than 1, any measurement delay set by smuX.measure.delay only occurs before the first measurement, while the smuX.measure.interval controls the interval between successive measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/77107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- 
--- --Sets the SMU channel A measure count to 10.
--- ```
smua.measure.count = 0

---@class smub.measure
smub.measure = {}


--- **This attribute controls the use of an analog filter when measuring on the lowest current ranges (2634B, 2635B, and 2636B only).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute engages an approximately 1 Hz analog filter across the current range elements.The analog filter is only active when using the 1 nA and 100 pA measurement ranges.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15106.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.analogfilter = 0
--- 
--- --Turns off the SMU channel A analog filter.
--- ```
smub.measure.analogfilter = 0


smub.AUTORANGE_ON = nil
smub.AUTORANGE_OFF = nil
smub.AUTORANGE_FOLLOW_LIMIT = nil

---@alias smubmeasureautorangevautoRange
---|`smub.AUTORANGE_ON`
---|`smub.AUTORANGE_OFF`
---|`smub.AUTORANGE_FOLLOW_LIMIT`



--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables voltage measurement autoranging for SMU channel A.
--- ```
---@type smubmeasureautorangevautoRange
smub.measure.autorangev = 0


smub.AUTORANGE_ON = nil
smub.AUTORANGE_OFF = nil
smub.AUTORANGE_FOLLOW_LIMIT = nil

---@alias smubmeasureautorangeiautoRange
---|`smub.AUTORANGE_ON`
---|`smub.AUTORANGE_OFF`
---|`smub.AUTORANGE_FOLLOW_LIMIT`



--- **This attribute stores the measurement autorange setting.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the measurement autorange state. Its value is smuX.AUTORANGE_OFF when the SMU measure circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed range. The fixed range is the present SMU measure range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU measure circuit in autorange mode. It remains on its present measure range until the next measurement is requested.If source high capacitance mode is enabled, current autorange is set to smuX.AUTORANGE_FOLLOW_LIMIT and cannot be changed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables voltage measurement autoranging for SMU channel A.
--- ```
---@type smubmeasureautorangeiautoRange
smub.measure.autorangei = 0


smub.AUTOZERO_OFF = nil
smub.AUTOZERO_ONCE = nil
smub.AUTOZERO_AUTO = nil

---@alias smubmeasureautozeroazMode
---|`smub.AUTOZERO_OFF`
---|`smub.AUTOZERO_ONCE`
---|`smub.AUTOZERO_AUTO`



--- **This attribute enables or disables automatic updates to the internal reference measurements (autozero) of the instrument.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The analog-to-digital converter (ADC) uses a ratiometric A/D conversion technique. To ensure the accuracy of readings, the instrument must periodically obtain new measurements of its internal ground and voltage reference. The time interval between updates to these reference measurements is determined by the integration aperture being used for measurements. The 2600B uses separate reference and zero measurements for each aperture.By default, the instrument automatically checks these reference measurements whenever a signal measurement is made. If the reference measurements have expired when a signal measurement is made, the instrument automatically takes two more A/D conversions, one for the reference and one for the zero, before returning the result. Thus, occasionally, a measurement takes more time than normal.This additional time can cause problems in sweeps and other test sequences in which measurement timing is critical. To avoid the time that is needed for the reference measurements in these situations, you can use the smuX.measure.autozero attribute to disable the automatic reference measurements.Disabling automatic reference measurements may allow the instrument to gradually drift out of specification. To minimize the drift, make a reference and zero measurement immediately before any critical test sequences. You can use the smuX.AUTOZERO_ONCE setting to force a refresh of the reference and zero measurements that are used for the present aperture setting.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15108.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.autozero = smua.AUTOZERO_ONCE
--- 
--- --Performs autozero once for SMU channel A.
--- ```
---@type smubmeasureautozeroazMode
smub.measure.autozero = 0



--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
--- 
--- --Adjust SMU channel A voltage measurement using the following values:
--- --1 V calibration range1e−4 for +zero measurement reading1e−5 for +zero DMM measurement reading0.92 for +FS measurement reading0.903 for the +FS DMM measurement r--- ```
---@param range number The measurement range to adjust
---@param cp1Measured number The value measured by this SMU for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Measured number The value measured by this SMU for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smub.measure.calibratev(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end


--- **This function generates and activates new measurement calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the instrument must be adjusted separately. Use a positive value for the range parameter to adjust the positive polarity and a negative value for the range parameter to adjust the negative polarity.All four measurements (cp1Measured, cp1Reference, cp2Measured, and cp2Reference) must be made with the calibration set that is active. Corruption of the calibration constants may result if this is ignored.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15109.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.calibratev(1, 1e-4, 1e-5, 0.92, 0.903)
--- 
--- --Adjust SMU channel A voltage measurement using the following values:
--- --1 V calibration range1e−4 for +zero measurement reading1e−5 for +zero DMM measurement reading0.92 for +FS measurement reading0.903 for the +FS DMM measurement r--- ```
---@param range number The measurement range to adjust
---@param cp1Measured number The value measured by this SMU for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Measured number The value measured by this SMU for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smub.measure.calibratei(range, cp1Measured, cp1Reference, cp2Measured, cp2Reference) end

smub.DELAY_OFF = nil
smub.DELAY_AUTO = nil

---@alias smubmeasuredelaymDelay
---|`smub.DELAY_OFF`
---|`smub.DELAY_AUTO`



--- **This attribute controls the measurement delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) before making a measurement. If you define the value instead of using the automatic delay value, the delay you set is used regardless of the range.The smuX.DELAY_AUTO setting causes a current range-dependent delay to be inserted when a current measurement is requested. This happens when a current measurement command is executed, when the measure action is being performed in a sweep, or after changing ranges during an autoranged measurement.If smuX.measure.count is greater than 1, the measurement delay is only inserted before the first measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15111.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delay = 0.010
--- 
--- --Sets a 10 ms measurement delay for SMU channel A.
--- ```
---@type smubmeasuredelaymDelay
smub.measure.delay = 0



--- **This attribute stores a multiplier to the delays that are used when smuX.measure.delay is set to smuX.DELAY_AUTO.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The delay factor is only applied when smuX.measure.delay = smuX.DELAY_AUTO.This attribute can be set to a value less than 1 (for example, 0.5) to decrease the automatic delay.This attribute can be set to a value greater than 1 (for example, 1.5 or 2.0) to increase the automatic delay.Setting this attribute to zero disables delays when smuX.measure.delay = smuX.DELAY_AUTO.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15112.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.delayfactor = 2.0
--- 
--- --Doubles the measure delay for SMU channel A.
--- ```
smub.measure.delayfactor = 0



--- **This attribute contains a delay multiplier that is only used during range changes when the high-capacitance mode is active.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This delay multiplier is only active when the high-capacitance mode is active.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15116.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.highcrangedelayfactor = 5
--- 
--- --Increases the delay used during range changes for SMU channel A by a factor of 5.
--- ```
smub.measure.highcrangedelayfactor = 0



--- **This attribute sets the interval between multiple measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the time interval between measurements when smuX.measure.count is set to a value greater than 1. The SMU attempts to start each measurement when scheduled. If the SMU cannot keep up with the interval setting, measurements are made as quickly as possible.If filtered measurements are being made, the time interval is from the start of the first measurement for the filtered reading to the first measurement for a subsequent filtered reading. Extra measurements made to satisfy a filtered reading are not paced by this interval.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15117.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.interval = 0.5
--- 
--- --Sets the measure interval for SMU channel A to 0.5 s.
--- ```
smub.measure.interval = 0



--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15118.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
--- 
--- --Sets voltage low range for SMU channel A to 1 V.
--- ```
smub.measure.lowrangev = 0



--- **This attribute sets the lowest measurement range that is used when the instrument is autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with autoranging to put a lower bound on the range used. Since lower ranges generally require greater settling times, setting a lowest range limit might make measurements require less settling time.If the instrument is set to autorange and it is on a range lower than the one specified, the range is changed to the lowRange range value.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15118.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.lowrangev = 1
--- 
--- --Sets voltage low range for SMU channel A to 1 V.
--- ```
smub.measure.lowrangei = 0



--- **This command sets the integration aperture for measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the integration aperture for the analog‑to‑digital converter (ADC).The integration aperture is based on the number of power line cycles (NPLC), where 1 PLC for 60 Hz is 16.67 ms (1/60) and 1 PLC for 50 Hz is 20 ms (1/50).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15119.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.nplc = 0.5
--- 
--- --Sets the integration time for SMU channel A to 0.5.
--- ```
smub.measure.nplc = 0



--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15121.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
--- 
--- --Selects the 1 V measurement range for SMU channel A.
--- ```
smub.measure.rangev = 0



--- **This attribute contains the positive full‑scale value of the measurement range for voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the positive full-scale value of the measurement range that the SMU is currently using. Assigning a value to this attribute sets the SMU on a fixed range large enough to measure the assigned value. The instrument selects the best range for measuring a value of rangeValue.This attribute is primarily intended to eliminate the time that is required by the automatic range selection performed by a measuring instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, measuring 10.0 V on the 2601B, 2602B, or 2604B 6 V range or measuring 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange. The value 9.91000E+37 is returned when this occurs. If the source function is the same as the measurement function (for example, sourcing voltage and measuring voltage), the measurement range is locked to be the same as the source range. However, the setting for the measure range is retained. If the source function is changed (for example, from sourcing voltage to sourcing current), the retained measurement range is used.2601B, 2602B, or 2604B example: Assume the source function is voltage. The source range is 1 V and you set the measure range for 6 V. Since the source range is 1 V, the SMU performs voltage measurements on the 1 V range. If you now change the source function to current, voltage measurements are made on the 6 V range.Explicitly setting a measure range disables measure autoranging for that function. Autoranging is controlled separately for each source and measurement function: source voltage, source current, measure voltage and measure current. Autoranging is enabled for all four by default.Changing the range while the output is off does not update the hardware settings, but querying returns the range setting that is used when the output is turned on. Setting a range while the output is on takes effect immediately.With measure autoranging enabled, the range is changed only when a measurement is made. Querying the range after a measurement returns the range selected for that measurement.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15121.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rangev = 0.5 
--- 
--- --Selects the 1 V measurement range for SMU channel A.
--- ```
smub.measure.rangei = 0



--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smub.measure.v(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smub.measure.i(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smub.measure.r(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return any reading Returned value of the last (or only) reading of the measurement process
---@param readingBuffer bufferMethods A reading buffer object where all readings are stored
---@overload fun():any
function smub.measure.p(readingBuffer) end


--- **This function makes one or more measurements.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- If you use this function without specifying a reading buffer, it makes one measurement and returns that measurement as reading. To use the additional information that is acquired while making a measurement or to return multiple readings, specify a reading buffer. If the instrument is configured to return multiple readings for a measurement and readingBuffer is specified, all readings are available in readingBuffer, but only the last measurement is returned as reading.Measurements are in the following units of measure:The smuX.measure.iv() function returns the last actual current measurement and voltage measurement as iReading and vReading, respectively. Additionally, it can store current and voltage readings if buffers are provided (iReadingBuffer and vReadingBuffer ).The smuX.measure.count attribute determines how many measurements are performed. When using a reading buffer, it also determines the number of readings to store in the buffer. If a reading buffer is not specified, the SMU ignores the smuX.measure.count attribute and only makes one measurement.The readingBuffer is cleared before making any measurements unless the buffer is configured to append data.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15122.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- 
--- --Makes 10 voltage measurements using SMU channel A and stores them in a buffer.
--- ```
---@return number iReading The last reading of the current measurement process
---@return number vReading The last reading of the voltage measurement process
---@param iReadingBuffer bufferMethods A reading buffer object where current readings are stored
---@param vReadingBuffer bufferMethods A reading buffer object where voltage readings are stored
---@overload fun():number
---@overload fun():number
---@overload fun(readingBuffer:bufferMethods):number
---@overload fun(iReadingBuffer:bufferMethods):number
function smub.measure.iv(iReadingBuffer, vReadingBuffer) end


--- **This attribute sets the number of measurements made when a measurement is requested.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the number of measurements made any time a measurement is requested. When using a reading buffer with a measure command, this attribute also controls the number of readings to be stored.If the count is set to a value greater than 1, any measurement delay set by smuX.measure.delay only occurs before the first measurement, while the smuX.measure.interval controls the interval between successive measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/77107.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.count = 10
--- 
--- --Sets the SMU channel A measure count to 10.
--- ```
smub.measure.count = 0

---@class smua.source
smua.source = {}

smua.AUTORANGE_ON = nil
smua.AUTORANGE_OFF = nil

---@alias smuasourceautorangevsourceAutorange
---|`smua.AUTORANGE_ON`
---|`smua.AUTORANGE_OFF`



--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15139.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables volts source autorange for SMU channel A.
--- ```
---@type smuasourceautorangevsourceAutorange
smua.source.autorangev = 0


smua.AUTORANGE_ON = nil
smua.AUTORANGE_OFF = nil

---@alias smuasourceautorangeisourceAutorange
---|`smua.AUTORANGE_ON`
---|`smua.AUTORANGE_OFF`



--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15139.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables volts source autorange for SMU channel A.
--- ```
---@type smuasourceautorangeisourceAutorange
smua.source.autorangei = 0



--- **This attribute contains the state of source compliance. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Reading this attribute updates the status model and the front panel with generated compliance information. See Current Limit (ILMT) in the status model diagram for the Measurement event registers. The Voltage Limit (VLMT) is not shown in the status model diagram for the Measurement event registers but is similar to the Current Limit (ILMT).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15141.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- compliance = smua.source.compliance
---  
--- print(compliance)
--- 
--- --Reads the source compliance state for SMU channel A.
--- --Output:
--- --true
--- --This output indicates that a configured limit has been reached (voltage, current, or power limit).
--- ```
smua.source.compliance = 0


smua.DELAY_OFF = nil
smua.DELAY_AUTO = nil

---@alias smuasourcedelaysDelay
---|`smua.DELAY_OFF`
---|`smua.DELAY_AUTO`



--- **This attribute contains the source delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) after an output step.The smuX.DELAY_AUTO setting causes a range-dependent delay to be inserted when the source is changed. Range-dependent delays are based on the output settling time values as defined in the 2600B specifications.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15142.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.delay = smua.DELAY_AUTO
--- 
--- --Sets the delay for SMU channel A to automatic (a range-dependent delay is inserted whenever the source is changed).
--- ```
---@type smuasourcedelaysDelay
smua.source.delay = 0



--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15143.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
--- 
--- --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement.
--- ```
---@param range number The measurement range to adjust
---@param cp1Expected any The source value set for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Expected any The source value set for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smua.source.calibratev(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end


--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15143.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
--- 
--- --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement.
--- ```
---@param range number The measurement range to adjust
---@param cp1Expected any The source value set for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Expected any The source value set for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smua.source.calibratei(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end

smua.OUTPUT_DCVOLTS = nil
smua.OUTPUT_DCAMPS = nil

---@alias smuasourcefuncsFunction
---|`smua.OUTPUT_DCVOLTS`
---|`smua.OUTPUT_DCAMPS`



--- **This attribute contains the source function, which can be voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute indicates the output function of the source for the specified SMU channel. Setting this attribute configures the SMU channel as either a voltage source or a current source.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15144.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.func = smua.OUTPUT_DCAMPS
--- 
--- --Sets the source function of SMU channel A to be a current source.
--- ```
---@type smuasourcefuncsFunction
smua.source.func = 0


smua.DISABLE = nil
smua.ENABLE = nil

---@alias smuasourcehighchighC
---|`smua.DISABLE`
---|`smua.ENABLE`



--- **This attribute enables or disables high-capacitance mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When enabled, the high-capacitance mode has the following effects on the SMU settings:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
--- 
--- --Activates high-capacitance mode for SMU channel A.
--- ```
---@type smuasourcehighchighC
smua.source.highc = 0



--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
--- 
--- --Sets voltage source of SMU channel A to 1 V.
--- ```
smua.source.levelv = 0



--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
--- 
--- --Sets voltage source of SMU channel A to 1 V.
--- ```
smua.source.leveli = 0



--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15148.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
--- 
--- --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage.
--- ```
smua.source.lowrangev = 0



--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15148.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
--- 
--- --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage.
--- ```
smua.source.lowrangei = 0



--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15149.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
--- 
--- --Changes the normal output-off mode limit to 10 mA for SMU channel A.
--- ```
smua.source.offlimitv = 0



--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15149.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
--- 
--- --Changes the normal output-off mode limit to 10 mA for SMU channel A.
--- ```
smua.source.offlimiti = 0


smua.OUTPUT_NORMAL = nil
smua.OUTPUT_HIGH_Z = nil
smua.OUTPUT_ZERO = nil

---@alias smuasourceoffmodesourceOffMode
---|`smua.OUTPUT_NORMAL`
---|`smua.OUTPUT_HIGH_Z`
---|`smua.OUTPUT_ZERO`



--- **This attribute sets the source output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output-off mode of the source. Setting this attribute configures the SMU output-off mode.The default sourceOffMode is smuX.OUTPUT_NORMAL. In this mode, the source function is configured according to the smuX.source.offfunc attribute. The smuX.source.offfunc attribute controls whether the SMU is configured as a 0 V voltage source or a 0 A current source. When the SMU is operating as a 0 A current source, the smuX.source.offlimitv attribute sets the voltage limit (similar to how the smuX.source.offlimiti attribute sets the current limit when the SMU is operating as a 0 V voltage source).When the sourceOffMode is set to smuX.OUTPUT_ZERO, the source is configured to output 0 V just as smuX.OUTPUT_NORMAL mode with smuX.source.offfunc = smuX.OUTPUT_DCVOLTS. If the source function is voltage, the current limit is not changed. If the source function is current, the current limit is set to the current source level or 10 percent of the current source range, whichever is greater.When sourceOffMode is set to smuX.OUTPUT_HIGH_Z, the SMU opens the output relay when the output is turned off.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15150.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_HIGH_Z
--- 
--- --Sets the output‑off mode for SMU channel A to open the output relay when the output is turned off.
--- ```
---@type smuasourceoffmodesourceOffMode
smua.source.offmode = 0


smua.OUTPUT_OFF = nil
smua.OUTPUT_HIGH_Z = nil
smua.OUTPUT_ON = nil

---@alias smuasourceoutputsourceOutput
---|`smua.OUTPUT_OFF`
---|`smua.OUTPUT_HIGH_Z`
---|`smua.OUTPUT_ON`



--- **This attribute enables or disables the source output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output state of the source. Setting this attribute switches the output of the source on or off.When the output is switched on, the SMU sources either voltage or current, as set by smuX.source.func.Setting this attribute to smuX.OUTPUT_HIGH_Z causes the output to turn off and go to the High Z mode. If the smuX.source.output is read after setting this attribute to smuX.OUTPUT_HIGH_Z, it returns 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15151.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.output = smua.OUTPUT_ON
--- 
--- --Turns on the SMU channel A source output.
--- ```
---@type smuasourceoutputsourceOutput
smua.source.output = 0


smua.OE_NONE = nil
smua.OE_OUTPUT_OFF = nil

---@alias smuasourceoutputenableactionoutputAction
---|`smua.OE_NONE`
---|`smua.OE_OUTPUT_OFF`



--- **This attribute controls output enable action of the source.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For 2601B, 2602B, or 2604B, this attribute controls the action the SMU takes when the output enable line is deasserted.When set to smuX.OE_NONE, the SMU takes no action when the output enable line goes low (deasserted).When set to smuX.OE_OUTPUT_OFF and the output enable line is de-asserted, the SMU turns its output off as if the smuX.source.output = smuX.OUTPUT_OFF command had been received.The SMU does not automatically turn its output on when the output enable line returns to the high state.If the output enable line is not asserted when this attribute is set to smuX.OE_OUTPUT_OFF and the output is on, the output turns off immediately.Detection of the output enable line going low does not abort any running scripts. This may cause execution errors.For models that have a safety interlock (2611B, 2612B, 2614B, 2635B, 2636B, and 2634B), this attribute dictates the source output behavior when the interlock line is not engaged and the source is configured for safe operation. In the following situations, source output automatically turns off when the interlock is disengaged and the output cannot be turned on unless the interlock is engaged:In the following situations, the source ignores the state of the interlock signal and the output can be turned on regardless of the interlock state:In the following situations, the source output automatically turns off when the interlock is disengaged, the output cannot be turned on unless the interlock is engaged, and the smuX.source.outputenableaction attribute is ignored:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15152.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.outputenableaction = smua.OE_OUTPUT_OFF
--- 
--- --Sets SMU channel A to turn off the output if the output enable line goes low (deasserted).
--- ```
---@type smuasourceoutputenableactionoutputAction
smua.source.outputenableaction = 0



--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15153.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
--- 
--- --Selects the 1 V source range for SMU channel A.
--- ```
smua.source.rangev = 0



--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15153.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
--- 
--- --Selects the 1 V source range for SMU channel A.
--- ```
smua.source.rangei = 0


smua.SETTLE_SMOOTH_100NA = nil
smua.SETTLE_FAST_ = nil
smua.SETTLE_FAST_ALL = nil
smua.SETTLE_FAST_POLARITY = nil
smua.SETTLE_DIRECT_IRANGE = nil
smua.SETTLE_SMOOTH = nil
smua.SETTLE_FAST_RANGE = nil

---@alias smuasourcesettlingsettleOption
---|`smua.SETTLE_SMOOTH_100NA`
---|`smua.SETTLE_FAST_`
---|`smua.SETTLE_FAST_ALL`
---|`smua.SETTLE_FAST_POLARITY`
---|`smua.SETTLE_DIRECT_IRANGE`
---|`smua.SETTLE_SMOOTH`
---|`smua.SETTLE_FAST_RANGE`



--- **This attribute contains the source settling mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Using smuX.SETTLE_FAST_RANGE may cause the SMU to exceed the range change overshoot specification.smuX.SETTLE_FAST_POLARITY does not go to zero when changing polarity and may create inconsistencies at the zero crossing.smuX.SETTLE_DIRECT_IRANGE switches the SMU directly to the target range instead of the default “range-by-range” method. This option is mutually exclusive of any other smuX.SETTLE_FAST_* commands.smuX.SETTLE_SMOOTH_100NA is disabled by default in the 2601B, 2602B, 2604B, 2611B, 2612B, and 2614B. In the 2634B, 2635B, and 2636B, it is always enabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15154.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.settling = smua.SETTLE_FAST_POLARITY
--- 
--- --Selects fast polarity changing for SMU channel A.
--- ```
---@type smuasourcesettlingsettleOption
smua.source.settling = 0


smua.DISABLE = nil
smua.ENABLE = nil

---@alias smuasourcesinksinkMode
---|`smua.DISABLE`
---|`smua.ENABLE`



--- **This attribute turns sink mode on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables sink mode. When sink mode is enabled, it reduces the source limit inaccuracy that occurs when operating in quadrants II and IV (quadrants I and III show this source limit inaccuracy).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15155.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.sink = smua.ENABLE
--- 
--- --Enables sink mode for SMU channel A.
--- ```
---@type smuasourcesinksinkMode
smua.source.sink = 0



--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
--- 
--- --Sets the voltage limit of SMU channel A to 15 V.
--- ```
smua.source.limitv = 0



--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
--- 
--- --Sets the voltage limit of SMU channel A to 15 V.
--- ```
smua.source.limiti = 0



--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
--- 
--- --Sets the voltage limit of SMU channel A to 15 V.
--- ```
smua.source.limitp = 0


smua.OUTPUT_DCVOLTS = nil
smua.OUTPUT_DCAMPS = nil

---@alias smuasourceofffuncofffunc
---|`smua.OUTPUT_DCVOLTS`
---|`smua.OUTPUT_DCAMPS`



--- **This attribute sets the source function that is used (source 0 A or 0 V) when the output is turned off and the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the source function used when the output is turned off and smuX.source.offmode is set to smuX.OUTPUT_NORMAL.Set this attribute to smuX.OUTPUT_DCVOLTS for the source to be a 0 V source when the output is off (smuX.source.offlimiti is used).Set it to smuX.OUTPUT_DCAMPS for the source to be a 0 A source when the output is off (smuX.source.offlimitv is used).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19504.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_NORMAL
--- smua.source.offfunc = smua.OUTPUT_DCVOLTS
--- 
--- --Sets the normal output-off mode to source 0 V when the output is turned off for SMU channel A.
--- ```
---@type smuasourceofffuncofffunc
smua.source.offfunc = 0

---@class smub.source
smub.source = {}

smub.AUTORANGE_ON = nil
smub.AUTORANGE_OFF = nil

---@alias smubsourceautorangevsourceAutorange
---|`smub.AUTORANGE_ON`
---|`smub.AUTORANGE_OFF`



--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15139.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables volts source autorange for SMU channel A.
--- ```
---@type smubsourceautorangevsourceAutorange
smub.source.autorangev = 0


smub.AUTORANGE_ON = nil
smub.AUTORANGE_OFF = nil

---@alias smubsourceautorangeisourceAutorange
---|`smub.AUTORANGE_ON`
---|`smub.AUTORANGE_OFF`



--- **This attribute contains the state of the source autorange control (on/off). **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute indicates the source autorange state. Its value is smuX.AUTORANGE_OFF when the SMU source circuit is on a fixed range and smuX.AUTORANGE_ON when it is in autorange mode.Setting this attribute to smuX.AUTORANGE_OFF puts the SMU on a fixed source range. The fixed range used is the present SMU source circuit range.Setting this attribute to smuX.AUTORANGE_ON puts the SMU source circuit into autorange mode. If the source output is on, the SMU immediately changes range to the range most appropriate for the value being sourced if that range is different than the present SMU range.Autorange is disabled if the source level is edited from the front panel. Setting the source range also turns off autorange when set by using the smuX.source.rangeY attribute.Resetting the instrument selects the smuX.AUTORANGE_ON.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15139.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.autorangev = smua.AUTORANGE_ON
--- 
--- --Enables volts source autorange for SMU channel A.
--- ```
---@type smubsourceautorangeisourceAutorange
smub.source.autorangei = 0



--- **This attribute contains the state of source compliance. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Reading this attribute updates the status model and the front panel with generated compliance information. See Current Limit (ILMT) in the status model diagram for the Measurement event registers. The Voltage Limit (VLMT) is not shown in the status model diagram for the Measurement event registers but is similar to the Current Limit (ILMT).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15141.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- compliance = smua.source.compliance
---  
--- print(compliance)
--- 
--- --Reads the source compliance state for SMU channel A.
--- --Output:
--- --true
--- --This output indicates that a configured limit has been reached (voltage, current, or power limit).
--- ```
smub.source.compliance = 0


smub.DELAY_OFF = nil
smub.DELAY_AUTO = nil

---@alias smubsourcedelaysDelay
---|`smub.DELAY_OFF`
---|`smub.DELAY_AUTO`



--- **This attribute contains the source delay.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute allows for additional delay (settling time) after an output step.The smuX.DELAY_AUTO setting causes a range-dependent delay to be inserted when the source is changed. Range-dependent delays are based on the output settling time values as defined in the 2600B specifications.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15142.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.delay = smua.DELAY_AUTO
--- 
--- --Sets the delay for SMU channel A to automatic (a range-dependent delay is inserted whenever the source is changed).
--- ```
---@type smubsourcedelaysDelay
smub.source.delay = 0



--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15143.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
--- 
--- --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement.
--- ```
---@param range number The measurement range to adjust
---@param cp1Expected any The source value set for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Expected any The source value set for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smub.source.calibratev(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end


--- **This function generates and activates new source calibration constants.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function generates and activates new calibration constants for the given range.The positive and negative polarities of the source must be adjusted separately. Use a positive value for range to adjust the positive polarity and a negative value for range to adjust the negative polarity. Do not use 0.0 for a negative point; 0.0 is considered to be a positive number.Typically, the two points that are used are near zero for point 1 and 90% of full scale for point 2. Full scale for point 2 should be avoided if the source of the SMU is substantially out of calibration.The two reference measurements must be made with the source using the active calibration set. For example, source a value, measure it, and do not change the active calibration set before issuing this command.The new calibration constants are activated immediately but they are not written to nonvolatile memory. Use the smuX.cal.save() function to save the new constants to nonvolatile memory. The active calibration constants stay in effect until the instrument is power cycled or a calibration set is loaded from nonvolatile memory with the smuX.cal.restore() function.This function is only available when calibration is unlocked using smuX.cal.unlock().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15143.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.calibratev(1, 1e-10, 1e-5, 0.9, 0.903)
--- 
--- --Generates and activates new source calibration constants for the 1 A range. For point 1, it uses 1e−10 as the source value and 1e−5 as the reference measurement. For point 2, it uses 0.9 for the source value and 0.903 for the reference measurement.
--- ```
---@param range number The measurement range to adjust
---@param cp1Expected any The source value set for point 1
---@param cp1Reference number The reference measurement for point 1 as measured externally
---@param cp2Expected any The source value set for point 2
---@param cp2Reference number The reference measurement for point 2 as measured externally
function smub.source.calibratei(range, cp1Expected, cp1Reference, cp2Expected, cp2Reference) end

smub.OUTPUT_DCVOLTS = nil
smub.OUTPUT_DCAMPS = nil

---@alias smubsourcefuncsFunction
---|`smub.OUTPUT_DCVOLTS`
---|`smub.OUTPUT_DCAMPS`



--- **This attribute contains the source function, which can be voltage or current.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute indicates the output function of the source for the specified SMU channel. Setting this attribute configures the SMU channel as either a voltage source or a current source.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15144.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.func = smua.OUTPUT_DCAMPS
--- 
--- --Sets the source function of SMU channel A to be a current source.
--- ```
---@type smubsourcefuncsFunction
smub.source.func = 0


smub.DISABLE = nil
smub.ENABLE = nil

---@alias smubsourcehighchighC
---|`smub.DISABLE`
---|`smub.ENABLE`



--- **This attribute enables or disables high-capacitance mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When enabled, the high-capacitance mode has the following effects on the SMU settings:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.highc = smua.ENABLE
--- 
--- --Activates high-capacitance mode for SMU channel A.
--- ```
---@type smubsourcehighchighC
smub.source.highc = 0



--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
--- 
--- --Sets voltage source of SMU channel A to 1 V.
--- ```
smub.source.levelv = 0



--- **This attribute sets the source level.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute configures the output level of the voltage or current source.If the source is configured as a voltage source and the output is on, the new smuX.source.levelv setting is sourced immediately. If the output is off or the source is configured as a current source, the voltage level is sourced when the source is configured as a voltage source and the output is turned on.If the source is configured as a current source and the output is on, the new smuX.source.leveli setting is sourced immediately. If the output is off or the source is configured as a voltage source, the current level is sourced when the source is configured as a current source and the output is turned on.The sign of sourceLevel dictates the polarity of the source. Positive values generate positive voltage or current from the high terminal of the source relative to the low terminal. Negative values generate negative voltage or current from the high terminal of the source relative to the low terminal.The reset() function sets the source levels to 0 V and 0 A.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.levelv = 1
--- 
--- --Sets voltage source of SMU channel A to 1 V.
--- ```
smub.source.leveli = 0



--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15148.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
--- 
--- --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage.
--- ```
smub.source.lowrangev = 0



--- **This attribute sets the lowest source range that is used during autoranging.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used with source autoranging to put a lower bound on the range that is used. Lower ranges generally require greater settling times. If you set a low range value, you might be able to source small values with less settling time.If the instrument is set to autorange and it is on a range lower than the one specified by sourceRangeLow, the source range is changed to the range specified by sourceRangeLow.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15148.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.lowrangev = 1
--- 
--- --Sets volts low range for Models 2601B, 2602B, 2604B SMU A to 1 V. This prevents the source from using the 100 mV range when sourcing voltage.
--- ```
smub.source.lowrangei = 0



--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15149.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
--- 
--- --Changes the normal output-off mode limit to 10 mA for SMU channel A.
--- ```
smub.source.offlimitv = 0



--- **This attribute sets the limit (current or voltage) used when the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the current limit to lower than 1 mA may interfere with operation of the contact check function. See smuX.contact.check() and smuX.contact.r() for details.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15149.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offlimiti = 10e-3
--- 
--- --Changes the normal output-off mode limit to 10 mA for SMU channel A.
--- ```
smub.source.offlimiti = 0


smub.OUTPUT_NORMAL = nil
smub.OUTPUT_HIGH_Z = nil
smub.OUTPUT_ZERO = nil

---@alias smubsourceoffmodesourceOffMode
---|`smub.OUTPUT_NORMAL`
---|`smub.OUTPUT_HIGH_Z`
---|`smub.OUTPUT_ZERO`



--- **This attribute sets the source output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output-off mode of the source. Setting this attribute configures the SMU output-off mode.The default sourceOffMode is smuX.OUTPUT_NORMAL. In this mode, the source function is configured according to the smuX.source.offfunc attribute. The smuX.source.offfunc attribute controls whether the SMU is configured as a 0 V voltage source or a 0 A current source. When the SMU is operating as a 0 A current source, the smuX.source.offlimitv attribute sets the voltage limit (similar to how the smuX.source.offlimiti attribute sets the current limit when the SMU is operating as a 0 V voltage source).When the sourceOffMode is set to smuX.OUTPUT_ZERO, the source is configured to output 0 V just as smuX.OUTPUT_NORMAL mode with smuX.source.offfunc = smuX.OUTPUT_DCVOLTS. If the source function is voltage, the current limit is not changed. If the source function is current, the current limit is set to the current source level or 10 percent of the current source range, whichever is greater.When sourceOffMode is set to smuX.OUTPUT_HIGH_Z, the SMU opens the output relay when the output is turned off.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15150.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_HIGH_Z
--- 
--- --Sets the output‑off mode for SMU channel A to open the output relay when the output is turned off.
--- ```
---@type smubsourceoffmodesourceOffMode
smub.source.offmode = 0


smub.OUTPUT_OFF = nil
smub.OUTPUT_HIGH_Z = nil
smub.OUTPUT_ON = nil

---@alias smubsourceoutputsourceOutput
---|`smub.OUTPUT_OFF`
---|`smub.OUTPUT_HIGH_Z`
---|`smub.OUTPUT_ON`



--- **This attribute enables or disables the source output.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Reading this attribute returns the output state of the source. Setting this attribute switches the output of the source on or off.When the output is switched on, the SMU sources either voltage or current, as set by smuX.source.func.Setting this attribute to smuX.OUTPUT_HIGH_Z causes the output to turn off and go to the High Z mode. If the smuX.source.output is read after setting this attribute to smuX.OUTPUT_HIGH_Z, it returns 0.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15151.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.output = smua.OUTPUT_ON
--- 
--- --Turns on the SMU channel A source output.
--- ```
---@type smubsourceoutputsourceOutput
smub.source.output = 0


smub.OE_NONE = nil
smub.OE_OUTPUT_OFF = nil

---@alias smubsourceoutputenableactionoutputAction
---|`smub.OE_NONE`
---|`smub.OE_OUTPUT_OFF`



--- **This attribute controls output enable action of the source.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- For 2601B, 2602B, or 2604B, this attribute controls the action the SMU takes when the output enable line is deasserted.When set to smuX.OE_NONE, the SMU takes no action when the output enable line goes low (deasserted).When set to smuX.OE_OUTPUT_OFF and the output enable line is de-asserted, the SMU turns its output off as if the smuX.source.output = smuX.OUTPUT_OFF command had been received.The SMU does not automatically turn its output on when the output enable line returns to the high state.If the output enable line is not asserted when this attribute is set to smuX.OE_OUTPUT_OFF and the output is on, the output turns off immediately.Detection of the output enable line going low does not abort any running scripts. This may cause execution errors.For models that have a safety interlock (2611B, 2612B, 2614B, 2635B, 2636B, and 2634B), this attribute dictates the source output behavior when the interlock line is not engaged and the source is configured for safe operation. In the following situations, source output automatically turns off when the interlock is disengaged and the output cannot be turned on unless the interlock is engaged:In the following situations, the source ignores the state of the interlock signal and the output can be turned on regardless of the interlock state:In the following situations, the source output automatically turns off when the interlock is disengaged, the output cannot be turned on unless the interlock is engaged, and the smuX.source.outputenableaction attribute is ignored:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15152.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.outputenableaction = smua.OE_OUTPUT_OFF
--- 
--- --Sets SMU channel A to turn off the output if the output enable line goes low (deasserted).
--- ```
---@type smubsourceoutputenableactionoutputAction
smub.source.outputenableaction = 0



--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15153.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
--- 
--- --Selects the 1 V source range for SMU channel A.
--- ```
smub.source.rangev = 0



--- **This attribute contains the source range.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute contains a value that sets the source‑measure unit (SMU) to a fixed range large enough to source the value. When read, the attribute contains the range the instrument is presently on when in autorange.Assigning a value to this attribute sets the SMU to a fixed range large enough to source the assigned value. The instrument selects the best range for sourcing a value of rangeValue.Reading this attribute returns the positive full-scale value of the source range the SMU is currently using. With source autoranging enabled, the output level controls the range. Querying the range after the level is set returns the range the instrument chose as appropriate for that source level.This attribute is primarily intended to eliminate the time required by the automatic range selection performed by a sourcing instrument. Because selecting a fixed range prevents autoranging, an overrange condition can occur. For example, sourcing 10.0 V on the Model 2601B, 2602B, or 2604B 6 V range or sourcing 5.0 V on the 2611B, 2612B, or 2614B 2 V range causes an overrange condition.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15153.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.rangev = 1
--- 
--- --Selects the 1 V source range for SMU channel A.
--- ```
smub.source.rangei = 0


smub.SETTLE_SMOOTH_100NA = nil
smub.SETTLE_FAST_ = nil
smub.SETTLE_FAST_ALL = nil
smub.SETTLE_FAST_POLARITY = nil
smub.SETTLE_DIRECT_IRANGE = nil
smub.SETTLE_SMOOTH = nil
smub.SETTLE_FAST_RANGE = nil

---@alias smubsourcesettlingsettleOption
---|`smub.SETTLE_SMOOTH_100NA`
---|`smub.SETTLE_FAST_`
---|`smub.SETTLE_FAST_ALL`
---|`smub.SETTLE_FAST_POLARITY`
---|`smub.SETTLE_DIRECT_IRANGE`
---|`smub.SETTLE_SMOOTH`
---|`smub.SETTLE_FAST_RANGE`



--- **This attribute contains the source settling mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Using smuX.SETTLE_FAST_RANGE may cause the SMU to exceed the range change overshoot specification.smuX.SETTLE_FAST_POLARITY does not go to zero when changing polarity and may create inconsistencies at the zero crossing.smuX.SETTLE_DIRECT_IRANGE switches the SMU directly to the target range instead of the default “range-by-range” method. This option is mutually exclusive of any other smuX.SETTLE_FAST_* commands.smuX.SETTLE_SMOOTH_100NA is disabled by default in the 2601B, 2602B, 2604B, 2611B, 2612B, and 2614B. In the 2634B, 2635B, and 2636B, it is always enabled.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15154.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.settling = smua.SETTLE_FAST_POLARITY
--- 
--- --Selects fast polarity changing for SMU channel A.
--- ```
---@type smubsourcesettlingsettleOption
smub.source.settling = 0


smub.DISABLE = nil
smub.ENABLE = nil

---@alias smubsourcesinksinkMode
---|`smub.DISABLE`
---|`smub.ENABLE`



--- **This attribute turns sink mode on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables sink mode. When sink mode is enabled, it reduces the source limit inaccuracy that occurs when operating in quadrants II and IV (quadrants I and III show this source limit inaccuracy).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15155.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.sink = smua.ENABLE
--- 
--- --Enables sink mode for SMU channel A.
--- ```
---@type smubsourcesinksinkMode
smub.source.sink = 0



--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
--- 
--- --Sets the voltage limit of SMU channel A to 15 V.
--- ```
smub.source.limitv = 0



--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
--- 
--- --Sets the voltage limit of SMU channel A to 15 V.
--- ```
smub.source.limiti = 0



--- **This attribute sets compliance limits.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use the smuX.source.limiti attribute to limit the current output of the voltage source. Use smuX.source.limitv to limit the voltage output of the current source. The SMU always uses autoranging for the limit setting. Use the smuX.source.limitp attribute to limit the output power of the source.Set this attribute in the test sequence before the turning the source on.Using a limit value of 0 results in error code 1102, "Parameter too small," for v and i. Setting this attribute to zero disables power compliance for p. When setting the power compliance limit to a nonzero value, the SMU adjusts the source limit where appropriate to limit the output to the specified power. The SMU uses the lower of the programmed compliance value (the compliance level that is if power compliance is disabled) or the limit calculated from the power compliance setting.Reading this attribute indicates the presently set compliance value. Use smuX.source.compliance to read the state of source compliance.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.limitv = 15
--- 
--- --Sets the voltage limit of SMU channel A to 15 V.
--- ```
smub.source.limitp = 0


smub.OUTPUT_DCVOLTS = nil
smub.OUTPUT_DCAMPS = nil

---@alias smubsourceofffuncofffunc
---|`smub.OUTPUT_DCVOLTS`
---|`smub.OUTPUT_DCAMPS`



--- **This attribute sets the source function that is used (source 0 A or 0 V) when the output is turned off and the source‑measure unit (SMU) is in normal output-off mode.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the source function used when the output is turned off and smuX.source.offmode is set to smuX.OUTPUT_NORMAL.Set this attribute to smuX.OUTPUT_DCVOLTS for the source to be a 0 V source when the output is off (smuX.source.offlimiti is used).Set it to smuX.OUTPUT_DCAMPS for the source to be a 0 A source when the output is off (smuX.source.offlimitv is used).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19504.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.source.offmode = smua.OUTPUT_NORMAL
--- smua.source.offfunc = smua.OUTPUT_DCVOLTS
--- 
--- --Sets the normal output-off mode to source 0 V when the output is turned off for SMU channel A.
--- ```
---@type smubsourceofffuncofffunc
smub.source.offfunc = 0

---@class smua.trigger
smua.trigger = {}

trigger.ARMED_EVENT_ID = nil

---@alias smuatriggerARMED_EVENT_IDa
---|`trigger.ARMED_EVENT_ID`



--- **This constant contains the number of the armed event.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to armed events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15159.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.ARMED_EVENT_ID
--- 
--- --Trigger timer when the SMU passes through the arm layer.
--- ```
---@type eventID
smua.trigger.ARMED_EVENT_ID= nil

smua.DISABLE = nil
smua.ENABLE = nil

---@alias smuatriggerautoclearautoClear
---|`smua.DISABLE`
---|`smua.ENABLE`



--- **This attribute turns automatic clearing of the event detectors on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables automatic clearing of the trigger model state machine event detectors when the SMU transitions from the arm layer to the trigger layer.Only the detected states of the event detectors are cleared.The overrun statuses of the event detectors are not automatically cleared when the SMU transitions from the arm layer to the trigger layer.The event detectors are always cleared when a sweep is initiated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15160.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.autoclear = smua.ENABLE
--- 
--- --Automatically clear the event detectors for the trigger mode state.
--- ```
---@type smuatriggerautoclearautoClear
smua.trigger.autoclear = 0



--- **This attribute sets the trigger count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the trigger layer of the trigger model the number of times set by this attribute. After performing the iterations, the SMU returns to the arm layer.If this count is set to zero (0), the SMU stays in the trigger model indefinitely until aborted.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15161.htm"])
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
--- 
--- --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms.
--- --Alias the trigger timers to use for pulse width and period.
--- --Create a fixed level voltage sweep.
--- --Set the pulse width and trigger the pulse width timer with a period timer.
--- --Set the pulse period to output one pulse per period and the count to generate 10 pulses.
--- --Trigger the pulse period timer when a sweep is initiated.
--- --Configure the timer to output a trigger event when it starts the first delay.
--- --Trigger the SMU source action using pulse period timer.
--- --Trigger the SMU end pulse action using pulse width timer.
--- --Set the trigger model counts.
--- --Configure the SMU to execute a 10-point pulse train.
--- --Start the trigger model.
--- --Wait for the sweep to complete.
--- ```
smua.trigger.count = 0


trigger.IDLE_EVENT_ID = nil

---@alias smuatriggerIDLE_EVENT_IDa
---|`trigger.IDLE_EVENT_ID`



--- **This constant contains the idle event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to idle events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.IDLE_EVENT_ID
--- 
--- --Trigger timer 1 when the SMU returns to the idle layer.
--- ```
---@type eventID
smua.trigger.IDLE_EVENT_ID= nil


--- **This function initiates a sweep operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to clear the four trigger model event detectors and enter its trigger model (moves the SMU from the idle state into the arm layer).To perform source actions during the sweep, before calling this function, it is necessary to configure and enable one of the following sweep source actions:To make measurements during the sweep, you must also configure and enable the measure action using smuX.trigger.measure.Y().If you run this function more than once without reconfiguring the sweep measurements, the caches on the configured measurement reading buffers hold stale data. Use the bufferVar.clearcache() function to remove stale values from the reading buffer cache.This function initiates an overlapped operation.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15168.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.initiate()
--- 
--- --Starts a preconfigured sweep and clears the event detectors for SMU channel A.
--- ```
function smua.trigger.initiate() end

trigger.MEASURE_COMPLETE_EVENT_ID = nil

---@alias smuatriggerMEASURE_COMPLETE_EVENT_IDa
---|`trigger.MEASURE_COMPLETE_EVENT_ID`



--- **This constant contains the measurement complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to measure complete events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15173.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smuX.trigger.MEASURE_COMPLETE_EVENT_ID
--- 
--- --Trigger the timer when the SMU completes a measurement.
--- ```
---@type eventID
smua.trigger.MEASURE_COMPLETE_EVENT_ID= nil

trigger.PULSE_COMPLETE_EVENT_ID = nil

---@alias smuatriggerPULSE_COMPLETE_EVENT_IDa
---|`trigger.PULSE_COMPLETE_EVENT_ID`



--- **This constant contains the pulse complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to pulse complete events.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15174.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.PULSE_COMPLETE_EVENT_ID
--- 
--- --Trigger a timer when the SMU completes a pulse.
--- ```
---@type eventID
smua.trigger.PULSE_COMPLETE_EVENT_ID= nil

trigger.SOURCE_COMPLETE_EVENT_ID = nil

---@alias smuatriggerSOURCE_COMPLETE_EVENT_IDa
---|`trigger.SOURCE_COMPLETE_EVENT_ID`



--- **This constant contains the source complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to source complete events from this source‑measure unit (SMU).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15175.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID
--- 
--- --Trigger the timer when the SMU updates the source level or starts a pulse.
--- ```
---@type eventID
smua.trigger.SOURCE_COMPLETE_EVENT_ID= nil

trigger.SWEEP_COMPLETE_EVENT_ID = nil

---@alias smuatriggerSWEEP_COMPLETE_EVENT_IDa
---|`trigger.SWEEP_COMPLETE_EVENT_ID`



--- **This constant contains the sweep complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweep complete events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15176.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].mode = digio.TRIG_RISINGA
--- digio.trigger[2].clear()
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
--- digio.trigger[4].mode = digio.TRIG_RISINGM
--- digio.trigger[4].pulsewidth = 0.001
--- digio.trigger[4].stimulus = smua.trigger.SWEEP_COMPLETE_EVENT_ID
--- 
--- --Configure the 2600B to detect a rising edge on digital I/O line 2.
--- --Configure SMU A to start its source action when a  trigger event occurs on digital I/O line 2.
--- --Configure digital I/O line 4 to output a 1 ms rising-edge trigger pulse at the completion of the SMU sweep.
--- ```
---@type eventID
smua.trigger.SWEEP_COMPLETE_EVENT_ID= nil

trigger.SWEEPING_EVENT_ID = nil

---@alias smuatriggerSWEEPING_EVENT_IDa
---|`trigger.SWEEPING_EVENT_ID`



--- **This constant contains the sweeping event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweeping events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15177.htm"])
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
--- 
--- --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms.
--- --Alias the trigger timers to use for pulse width and period.
--- --Create a fixed level voltage sweep.
--- --Set the pulse width and trigger the pulse width timer with a period timer.
--- --Set the pulse period to output one pulse per period and the count to generate 10 pulses.
--- --Trigger the pulse period timer when a sweep is initiated.
--- --Configure the timer to output a trigger event when it starts the first delay.
--- --Trigger the SMU source action using pulse period timer.
--- --Trigger the SMU end pulse action using pulse width timer.
--- --Set the trigger model counts.
--- --Configure the SMU to execute a 10-point pulse train.
--- --Start the trigger model.
--- --Wait for the sweep to complete.
--- ```
---@type eventID
smua.trigger.SWEEPING_EVENT_ID= nil
---@class smub.trigger
smub.trigger = {}

trigger.ARMED_EVENT_ID = nil

---@alias smubtriggerARMED_EVENT_IDb
---|`trigger.ARMED_EVENT_ID`



--- **This constant contains the number of the armed event.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to armed events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15159.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.ARMED_EVENT_ID
--- 
--- --Trigger timer when the SMU passes through the arm layer.
--- ```
---@type eventID
smub.trigger.ARMED_EVENT_ID= nil

smub.DISABLE = nil
smub.ENABLE = nil

---@alias smubtriggerautoclearautoClear
---|`smub.DISABLE`
---|`smub.ENABLE`



--- **This attribute turns automatic clearing of the event detectors on or off.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables automatic clearing of the trigger model state machine event detectors when the SMU transitions from the arm layer to the trigger layer.Only the detected states of the event detectors are cleared.The overrun statuses of the event detectors are not automatically cleared when the SMU transitions from the arm layer to the trigger layer.The event detectors are always cleared when a sweep is initiated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15160.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.autoclear = smua.ENABLE
--- 
--- --Automatically clear the event detectors for the trigger mode state.
--- ```
---@type smubtriggerautoclearautoClear
smub.trigger.autoclear = 0



--- **This attribute sets the trigger count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the trigger layer of the trigger model the number of times set by this attribute. After performing the iterations, the SMU returns to the arm layer.If this count is set to zero (0), the SMU stays in the trigger model indefinitely until aborted.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15161.htm"])
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
--- 
--- --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms.
--- --Alias the trigger timers to use for pulse width and period.
--- --Create a fixed level voltage sweep.
--- --Set the pulse width and trigger the pulse width timer with a period timer.
--- --Set the pulse period to output one pulse per period and the count to generate 10 pulses.
--- --Trigger the pulse period timer when a sweep is initiated.
--- --Configure the timer to output a trigger event when it starts the first delay.
--- --Trigger the SMU source action using pulse period timer.
--- --Trigger the SMU end pulse action using pulse width timer.
--- --Set the trigger model counts.
--- --Configure the SMU to execute a 10-point pulse train.
--- --Start the trigger model.
--- --Wait for the sweep to complete.
--- ```
smub.trigger.count = 0


trigger.IDLE_EVENT_ID = nil

---@alias smubtriggerIDLE_EVENT_IDb
---|`trigger.IDLE_EVENT_ID`



--- **This constant contains the idle event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to idle events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.IDLE_EVENT_ID
--- 
--- --Trigger timer 1 when the SMU returns to the idle layer.
--- ```
---@type eventID
smub.trigger.IDLE_EVENT_ID= nil


--- **This function initiates a sweep operation.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to clear the four trigger model event detectors and enter its trigger model (moves the SMU from the idle state into the arm layer).To perform source actions during the sweep, before calling this function, it is necessary to configure and enable one of the following sweep source actions:To make measurements during the sweep, you must also configure and enable the measure action using smuX.trigger.measure.Y().If you run this function more than once without reconfiguring the sweep measurements, the caches on the configured measurement reading buffers hold stale data. Use the bufferVar.clearcache() function to remove stale values from the reading buffer cache.This function initiates an overlapped operation.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15168.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.initiate()
--- 
--- --Starts a preconfigured sweep and clears the event detectors for SMU channel A.
--- ```
function smub.trigger.initiate() end

trigger.MEASURE_COMPLETE_EVENT_ID = nil

---@alias smubtriggerMEASURE_COMPLETE_EVENT_IDb
---|`trigger.MEASURE_COMPLETE_EVENT_ID`



--- **This constant contains the measurement complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to measure complete events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15173.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smuX.trigger.MEASURE_COMPLETE_EVENT_ID
--- 
--- --Trigger the timer when the SMU completes a measurement.
--- ```
---@type eventID
smub.trigger.MEASURE_COMPLETE_EVENT_ID= nil

trigger.PULSE_COMPLETE_EVENT_ID = nil

---@alias smubtriggerPULSE_COMPLETE_EVENT_IDb
---|`trigger.PULSE_COMPLETE_EVENT_ID`



--- **This constant contains the pulse complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to pulse complete events.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15174.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.PULSE_COMPLETE_EVENT_ID
--- 
--- --Trigger a timer when the SMU completes a pulse.
--- ```
---@type eventID
smub.trigger.PULSE_COMPLETE_EVENT_ID= nil

trigger.SOURCE_COMPLETE_EVENT_ID = nil

---@alias smubtriggerSOURCE_COMPLETE_EVENT_IDb
---|`trigger.SOURCE_COMPLETE_EVENT_ID`



--- **This constant contains the source complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to source complete events from this source‑measure unit (SMU).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15175.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID
--- 
--- --Trigger the timer when the SMU updates the source level or starts a pulse.
--- ```
---@type eventID
smub.trigger.SOURCE_COMPLETE_EVENT_ID= nil

trigger.SWEEP_COMPLETE_EVENT_ID = nil

---@alias smubtriggerSWEEP_COMPLETE_EVENT_IDb
---|`trigger.SWEEP_COMPLETE_EVENT_ID`



--- **This constant contains the sweep complete event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweep complete events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15176.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[2].mode = digio.TRIG_RISINGA
--- digio.trigger[2].clear()
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
--- digio.trigger[4].mode = digio.TRIG_RISINGM
--- digio.trigger[4].pulsewidth = 0.001
--- digio.trigger[4].stimulus = smua.trigger.SWEEP_COMPLETE_EVENT_ID
--- 
--- --Configure the 2600B to detect a rising edge on digital I/O line 2.
--- --Configure SMU A to start its source action when a  trigger event occurs on digital I/O line 2.
--- --Configure digital I/O line 4 to output a 1 ms rising-edge trigger pulse at the completion of the SMU sweep.
--- ```
---@type eventID
smub.trigger.SWEEP_COMPLETE_EVENT_ID= nil

trigger.SWEEPING_EVENT_ID = nil

---@alias smubtriggerSWEEPING_EVENT_IDb
---|`trigger.SWEEPING_EVENT_ID`



--- **This constant contains the sweeping event number.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to sweeping events from this SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15177.htm"])
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
--- 
--- --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms.
--- --Alias the trigger timers to use for pulse width and period.
--- --Create a fixed level voltage sweep.
--- --Set the pulse width and trigger the pulse width timer with a period timer.
--- --Set the pulse period to output one pulse per period and the count to generate 10 pulses.
--- --Trigger the pulse period timer when a sweep is initiated.
--- --Configure the timer to output a trigger event when it starts the first delay.
--- --Trigger the SMU source action using pulse period timer.
--- --Trigger the SMU end pulse action using pulse width timer.
--- --Set the trigger model counts.
--- --Configure the SMU to execute a 10-point pulse train.
--- --Start the trigger model.
--- --Wait for the sweep to complete.
--- ```
---@type eventID
smub.trigger.SWEEPING_EVENT_ID= nil
---@class timer.measure
timer.measure = {}


--- **This function measures the elapsed time since the timer was last reset.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15281.htm"])
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
local tsplinktriggerArr = {}

---@type tsplinktriggerArr[]
tsplink.trigger = {}


--- **This function simulates the occurrence of the trigger and generates the corresponding event ID. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The set pulse width determines how long the trigger is asserted.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15292.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[2].assert()
--- 
--- --Asserts trigger on trigger line 2.
--- ```
function tsplinktriggerArr.assert() end



--- **This function clears the event detector for a LAN trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The trigger event detector enters the detected state when an event is detected. tsplink.trigger[N].clear() clears a trigger event detector, discards the history of the trigger line, and clears the tsplink.trigger[N].overrun attribute.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15293.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[2].clear()
--- 
--- --Clears trigger event on synchronization line 2.
--- ```
function tsplinktriggerArr.clear() end



--- **This constant identifies the number that is used for the trigger events. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- This number is used by the TSP-Link trigger line when it detects an input trigger.Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to trigger events from this line.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15294.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = tsplink.trigger[2].EVENT_ID
--- 
--- --Sets the trigger stimulus of trigger timer 1 to the TSP-Link trigger 2 event.
--- ```
tsplinktriggerArr.EVENT_ID= 0



--- **This attribute defines the trigger operation and detection mode. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute controls the mode in which the trigger event detector and the output trigger generator operate on the given trigger line.The setting for the mode parameter can be one of the values shown in the following table.When programmed to any mode except tsplink.TRIG_BYPASS, the output state of the I/O line is controlled by the trigger logic and the user-specified output state of the line is ignored.When the trigger mode is set to tsplink.TRIG_RISING, the user‑specified output state of the line is examined. If the output state selected when the mode is changed is high, the actual mode that is used is tsplink.TRIG_RISINGA. If the output state selected when the mode is changed is low, the actual mode that is used is tsplink.TRIG_RISINGM.The mode parameter stores the trigger mode as a numeric value when the attribute is read.To control the line state, use the tsplink.TRIG_BYPASS mode with the tsplink.writebit() and the tsplink.writeport() commands.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15295.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].mode = tsplink.TRIG_RISINGM
--- 
--- --Sets the trigger mode for synchronization line 3 to tsplink.TRIG_RISINGM.
--- ```
tsplinktriggerArr.mode= 0



--- **This attribute indicates if the event detector ignored an event while in the detected state. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the synchronization line itself.It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15296.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(tsplink.trigger[1].overrun)
--- 
--- --If an event was ignored, displays true; if an event was not ignored, displays false.
--- ```
tsplinktriggerArr.overrun= 0



--- **This attribute sets the length of time that the trigger line is asserted for output triggers. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Setting the pulse width to 0 (seconds) asserts the trigger indefinitely.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15297.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].pulsewidth = 20e-6
--- 
--- --Sets pulse width for trigger line 3 to 20 μs.
--- ```
tsplinktriggerArr.pulsewidth= 0



--- **This function releases a latched trigger on the given TSP‑Link trigger line. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Releases a trigger that was asserted with an indefinite pulse width. It also releases a trigger that was latched in response to receiving a synchronous mode trigger.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15298.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].release()
--- 
--- --Releases trigger line 3.
--- ```
function tsplinktriggerArr.release() end



--- **This function waits for a trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function waits up to the timeout value for an input trigger. If one or more trigger events were detected since the last time tsplink.trigger[N].wait() or tsplink.trigger[N].clear() was called, this function returns immediately.After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15300.htm"])
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



--- **This function resets some of the TSP-Link trigger attributes to their factory defaults. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The tsplink.trigger[N].reset() function resets the following attributes to their factory defaults:This also clears tsplink.trigger[N].overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17669.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- tsplink.trigger[3].reset()
--- 
--- --Resets TSP-Link trigger line 3 attributes back to factory default values.
--- ```
function tsplinktriggerArr.reset() end



--- **This attribute specifies the event that causes the synchronization line to assert a trigger. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- To disable automatic trigger assertion on the synchronization line, set this attribute to zero (0).Do not use this attribute when triggering under script control. Use tsplink.trigger[N].assert() instead.The eventID parameter may be one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17682.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(tsplink.trigger[3].stimulus)
--- 
--- --Prints the event that starts TSP-Link trigger line 3 action.
--- ```
---@type eventID|0
tsplinktriggerArr.stimulus= 0

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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15785.htm"])
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
--- *Type:*  Constant
---
--- *Details:*<br>
--- Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to trigger events from this trigger blender.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15786.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15787.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.blender[1].orenable = true
--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID
--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID
--- 
--- --Generate a trigger blender 1 event when a digital I/O trigger happens on line 3 or 5.
--- ```
triggerblenderArr.orenable= 0



--- **This attribute indicates whether or not an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- Indicates if an event was ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector that is built into the event blender itself.This command does not indicate if an overrun occurred in any other part of the trigger model or in any other trigger object that is monitoring the event. It also is not an indication of an action overrun.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15788.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15790.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17666.htm"])
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
--- There are four stimulus inputs that can each select a different event. The eventID parameter can be the event ID of any trigger event.Use zero to disable the blender input. The eventID parameter may be one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17684.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15793.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15794.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15795.htm"])
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
--- *Type:*  Constant
---
--- *Details:*<br>
--- This constant is an identification number that identifies events generated by this timer.Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to events from this timer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15796.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].stimulus = tsplink.trigger[2].EVENT_ID
--- 
--- --Sets the trigger stimulus of trigger timer 1 to the TSP-Link trigger 2 event.
--- ```
triggertimerArr.EVENT_ID= 0



--- **This attribute indicates if an event was ignored because of the event detector state.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- This command indicates if an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the timer itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other construct that is monitoring the delay completion event. It also is not an indication of a delay overrun.Delay overrun indications are provided in the status model.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15797.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15798.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15800.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15820.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17668.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.timer[1].reset()
--- 
--- --Resets the attributes associated with timer 1 back to factory default values.
--- ```
function triggertimerArr.reset() end



--- **This attribute specifies which event starts the timer.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The eventID parameter may be one of the trigger event IDs shown in the following table.Set this attribute to the eventID of any trigger event to cause the timer to start when that event occurs.Set this attribute to zero (0) to disable event processing.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/17688.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(trigger.timer[1].stimulus)
--- 
--- --Prints the event that starts a trigger 1 timer action.
--- ```
---@type eventID|0
triggertimerArr.stimulus= 0

---@class status.operation
status.operation = {}


--- **These attributes manage the operation status register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15833.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.USER + status.operation.PROG
--- status.operation.enable = operationRegister
--- 
--- --Uses constants to set the USER and PROG bits of the operation status enable register.
--- -- decimal 20480 = binary 0101 0000 0000 0000
--- operationRegister = 20480
--- status.operation.enable = operationRegister
--- 
--- --Uses a decimal value to set the USER and PROG bits of the operation status enable register.
--- ```
status.operation.condition = 0



--- **These attributes manage the operation status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15833.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.USER + status.operation.PROG
--- status.operation.enable = operationRegister
--- 
--- --Uses constants to set the USER and PROG bits of the operation status enable register.
--- -- decimal 20480 = binary 0101 0000 0000 0000
--- operationRegister = 20480
--- status.operation.enable = operationRegister
--- 
--- --Uses a decimal value to set the USER and PROG bits of the operation status enable register.
--- ```
status.operation.enable = 0



--- **These attributes manage the operation status register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15833.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.USER + status.operation.PROG
--- status.operation.enable = operationRegister
--- 
--- --Uses constants to set the USER and PROG bits of the operation status enable register.
--- -- decimal 20480 = binary 0101 0000 0000 0000
--- operationRegister = 20480
--- status.operation.enable = operationRegister
--- 
--- --Uses a decimal value to set the USER and PROG bits of the operation status enable register.
--- ```
status.operation.event = 0



--- **These attributes manage the operation status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15833.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.USER + status.operation.PROG
--- status.operation.enable = operationRegister
--- 
--- --Uses constants to set the USER and PROG bits of the operation status enable register.
--- -- decimal 20480 = binary 0101 0000 0000 0000
--- operationRegister = 20480
--- status.operation.enable = operationRegister
--- 
--- --Uses a decimal value to set the USER and PROG bits of the operation status enable register.
--- ```
status.operation.ntr = 0



--- **These attributes manage the operation status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write the operation status registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.04800e+04 (which is 20,480) is read as the value of the condition register, the binary equivalent is 0101 0000 0000 0000. This value indicates that bit B14 (PROGRAM_RUNNING) and bit B12 (USER) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B12 of the operation status enable register, set status.operation.enable = status.operation.USER.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B12 and B14, set operationRegister to 20,480 (which is the sum of 4,096 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15833.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.USER + status.operation.PROG
--- status.operation.enable = operationRegister
--- 
--- --Uses constants to set the USER and PROG bits of the operation status enable register.
--- -- decimal 20480 = binary 0101 0000 0000 0000
--- operationRegister = 20480
--- status.operation.enable = operationRegister
--- 
--- --Uses a decimal value to set the USER and PROG bits of the operation status enable register.
--- ```
status.operation.ptr = 0

---@class status.questionable
status.questionable = {}


--- **These attributes manage the questionable status register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15853.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.enable = status.questionable.OTEMP
--- 
--- --Uses a constant to set the OTEMP bit of the questionable status enable register.
--- ```
status.questionable.condition = 0



--- **These attributes manage the questionable status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15853.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.enable = status.questionable.OTEMP
--- 
--- --Uses a constant to set the OTEMP bit of the questionable status enable register.
--- ```
status.questionable.enable = 0



--- **These attributes manage the questionable status register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15853.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.enable = status.questionable.OTEMP
--- 
--- --Uses a constant to set the OTEMP bit of the questionable status enable register.
--- ```
status.questionable.event = 0



--- **These attributes manage the questionable status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15853.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.enable = status.questionable.OTEMP
--- 
--- --Uses a constant to set the OTEMP bit of the questionable status enable register.
--- ```
status.questionable.ntr = 0



--- **These attributes manage the questionable status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status registers. Reading a status register returns a value. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.22880e+04 (which is 12,288) is read as the value of the condition register, the binary equivalent is 0011 0000 0000 0000. This value indicates that bits B12 and B13 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B9 of the questionable status enable register, set status.questionable.enable = status.questionable.UO.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B12 and B13, set questionableRegister to 12,288 (which is the sum of 4,096 + 8,192). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15853.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.enable = status.questionable.OTEMP
--- 
--- --Uses a constant to set the OTEMP bit of the questionable status enable register.
--- ```
status.questionable.ptr = 0

---@class status.standard
status.standard = {}


--- **These attributes manage the standard event status register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15862.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- standardRegister = status.standard.OPC + status.standard.EXE
--- status.standard.enable = standardRegister
--- 
--- --Uses constants to set the OPC and EXE bits of the standard event status enable register.
--- -- decimal 17 = binary 0001 0001
--- standardRegister = 17
--- status.standard.enable = standardRegister
--- 
--- --Uses the decimal value to set the OPC and EXE bits of the standard event status enable register.
--- ```
status.standard.condition = 0



--- **These attributes manage the standard event status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15862.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- standardRegister = status.standard.OPC + status.standard.EXE
--- status.standard.enable = standardRegister
--- 
--- --Uses constants to set the OPC and EXE bits of the standard event status enable register.
--- -- decimal 17 = binary 0001 0001
--- standardRegister = 17
--- status.standard.enable = standardRegister
--- 
--- --Uses the decimal value to set the OPC and EXE bits of the standard event status enable register.
--- ```
status.standard.enable = 0



--- **These attributes manage the standard event status register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15862.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- standardRegister = status.standard.OPC + status.standard.EXE
--- status.standard.enable = standardRegister
--- 
--- --Uses constants to set the OPC and EXE bits of the standard event status enable register.
--- -- decimal 17 = binary 0001 0001
--- standardRegister = 17
--- status.standard.enable = standardRegister
--- 
--- --Uses the decimal value to set the OPC and EXE bits of the standard event status enable register.
--- ```
status.standard.event = 0



--- **These attributes manage the standard event status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15862.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- standardRegister = status.standard.OPC + status.standard.EXE
--- status.standard.enable = standardRegister
--- 
--- --Uses constants to set the OPC and EXE bits of the standard event status enable register.
--- -- decimal 17 = binary 0001 0001
--- standardRegister = 17
--- status.standard.enable = standardRegister
--- 
--- --Uses the decimal value to set the OPC and EXE bits of the standard event status enable register.
--- ```
status.standard.ntr = 0



--- **These attributes manage the standard event status register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the standard event status registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the standard event status enable register, set status.standard.enable = status.standard.OPC.In addition to the above constants, standardRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set standardRegister to the sum of their decimal weights. For example, to set bits B0 and B4, set standardRegister to 17 (which is the sum of 1 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15862.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- standardRegister = status.standard.OPC + status.standard.EXE
--- status.standard.enable = standardRegister
--- 
--- --Uses constants to set the OPC and EXE bits of the standard event status enable register.
--- -- decimal 17 = binary 0001 0001
--- standardRegister = 17
--- status.standard.enable = standardRegister
--- 
--- --Uses the decimal value to set the OPC and EXE bits of the standard event status enable register.
--- ```
status.standard.ptr = 0

---@class status.system
status.system = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15863.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system.NODE11 + status.system.NODE14
--- status.system.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary enable register.
--- ```
status.system.condition = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15863.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system.NODE11 + status.system.NODE14
--- status.system.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary enable register.
--- ```
status.system.enable = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15863.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system.NODE11 + status.system.NODE14
--- status.system.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary enable register.
--- ```
status.system.event = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15863.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system.NODE11 + status.system.NODE14
--- status.system.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary enable register.
--- ```
status.system.ntr = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 1 through 14. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary status enable register, set status.system.enable = status.system.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15863.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system.NODE11 + status.system.NODE14
--- status.system.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary enable register.
--- ```
status.system.ptr = 0

---@class status.system2
status.system2 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15864.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system2.NODE25 + status.system2.NODE28
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 2 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system2.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 2 enable register.
--- ```
status.system2.condition = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15864.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system2.NODE25 + status.system2.NODE28
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 2 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system2.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 2 enable register.
--- ```
status.system2.enable = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15864.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system2.NODE25 + status.system2.NODE28
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 2 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system2.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 2 enable register.
--- ```
status.system2.event = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15864.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system2.NODE25 + status.system2.NODE28
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 2 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system2.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 2 enable register.
--- ```
status.system2.ntr = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 15 through 28. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 2 enable register, set status.system2.enable = status.system2.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15864.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system2.NODE25 + status.system2.NODE28
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 2 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system2.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 2 enable register.
--- ```
status.system2.ptr = 0

---@class status.system3
status.system3 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15865.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system3.NODE39 + status.system3.NODE42
--- status.system3.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 3 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system3.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 3 enable register.
--- ```
status.system3.condition = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15865.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system3.NODE39 + status.system3.NODE42
--- status.system3.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 3 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system3.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 3 enable register.
--- ```
status.system3.enable = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15865.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system3.NODE39 + status.system3.NODE42
--- status.system3.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 3 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system3.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 3 enable register.
--- ```
status.system3.event = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15865.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system3.NODE39 + status.system3.NODE42
--- status.system3.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 3 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system3.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 3 enable register.
--- ```
status.system3.ntr = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 29 through 42. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0 and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 3 enable register, set status.system3.enable = status.system3.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15865.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system3.NODE39 + status.system3.NODE42
--- status.system3.enable = enableRegister
--- 
--- --Uses constants to set bits B11 and B14 of the system summary 3 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system3.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the system summary 3 enable register.
--- ```
status.system3.ptr = 0

---@class status.system4
status.system4 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15866.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system4.NODE53 + status.system4.NODE56
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bit B11 and bit B14 of the system summary 4 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system4.enable = enableRegister
--- 
--- --Uses a decimal value to set bit B11 and bit B14 of the system summary 4 enable register.
--- ```
status.system4.condition = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15866.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system4.NODE53 + status.system4.NODE56
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bit B11 and bit B14 of the system summary 4 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system4.enable = enableRegister
--- 
--- --Uses a decimal value to set bit B11 and bit B14 of the system summary 4 enable register.
--- ```
status.system4.enable = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15866.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system4.NODE53 + status.system4.NODE56
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bit B11 and bit B14 of the system summary 4 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system4.enable = enableRegister
--- 
--- --Uses a decimal value to set bit B11 and bit B14 of the system summary 4 enable register.
--- ```
status.system4.event = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15866.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system4.NODE53 + status.system4.NODE56
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bit B11 and bit B14 of the system summary 4 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system4.enable = enableRegister
--- 
--- --Uses a decimal value to set bit B11 and bit B14 of the system summary 4 enable register.
--- ```
status.system4.ntr = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 43 through 56. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bit B0 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the system summary 4 enable register, set status.system4.enable = status.system4.enable.EXT.In addition to the above constants, enableRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal values. For example, to set bits B11 and B14, set enableRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15866.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system4.NODE53 + status.system4.NODE56
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bit B11 and bit B14 of the system summary 4 enable register.
--- -- decimal 18432 = binary 0100 1000 0000 0000
--- enableRegister = 18432
--- status.system4.enable = enableRegister
--- 
--- --Uses a decimal value to set bit B11 and bit B14 of the system summary 4 enable register.
--- ```
status.system4.ptr = 0

---@class status.system5
status.system5 = {}


--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15867.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system5.NODE57 + status.system5.NODE60
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B1 and B4 of the system summary 5 enable register.
--- -- decimal 18 = binary 0000 0000 0001 0010
--- enableRegister = 18
--- status.system5.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B1 and B4 of the system summary 5 enable register.
--- ```
status.system5.condition = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15867.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system5.NODE57 + status.system5.NODE60
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B1 and B4 of the system summary 5 enable register.
--- -- decimal 18 = binary 0000 0000 0001 0010
--- enableRegister = 18
--- status.system5.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B1 and B4 of the system summary 5 enable register.
--- ```
status.system5.enable = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15867.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system5.NODE57 + status.system5.NODE60
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B1 and B4 of the system summary 5 enable register.
--- -- decimal 18 = binary 0000 0000 0001 0010
--- enableRegister = 18
--- status.system5.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B1 and B4 of the system summary 5 enable register.
--- ```
status.system5.event = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15867.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system5.NODE57 + status.system5.NODE60
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B1 and B4 of the system summary 5 enable register.
--- -- decimal 18 = binary 0000 0000 0001 0010
--- enableRegister = 18
--- status.system5.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B1 and B4 of the system summary 5 enable register.
--- ```
status.system5.ntr = 0



--- **These attributes manage the TSP-Link® system summary register of the status model for nodes 57 through 64. These commands are not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- In an expanded system (TSP-Link), these attributes are used to read or write to the system summary registers. They are set using a constant or a numeric value, but are returned as a numeric value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.30000e+02 (which is 130) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0010. This value indicates that bit B1 and bit B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the system summary 5 enable register, set status.system5.enable = status.system5.NODE57.In addition to the above constants, enableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set enableRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set enableRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15867.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- enableRegister = status.system5.NODE57 + status.system5.NODE60
--- status.system2.enable = enableRegister 
--- 
--- --Uses constants to set bits B1 and B4 of the system summary 5 enable register.
--- -- decimal 18 = binary 0000 0000 0001 0010
--- enableRegister = 18
--- status.system5.enable = enableRegister
--- 
--- --Uses the decimal value to set bits B1 and B4 of the system summary 5 enable register.
--- ```
status.system5.ptr = 0

---@class smua.buffer
smua.buffer = {}


--- **This function returns the statistics for a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that is placed in the buffer.The SMU automatically updates reading buffer statistics as data is added to the reading buffer. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten.The table returned from this function is a snapshot. Although the SMU continues to update the statistics, the table returned is not updated. To get fresh statistics, call this function again.The statistics parameter has the attributes described in the following table.If n equals zero (0), all other attributes are nil. If n equals 1, the stddev attribute is nil because the standard deviation of a sample size of 1 is undefined.The min and max entries each have the attributes defined in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18554.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smua.nvbuffer1.clear()
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- stats = smua.buffer.getstats(smua.nvbuffer1)
--- print("n= "..stats.n)
--- print("mean= "..stats.mean)
--- print("stddev= "..stats.stddev)
--- print("min= "..stats.min.reading)
--- print("max= "..stats.max.reading)
--- 
--- --Make measurements and store them in nvbuffer1. Print the statistics for the data.
--- --Example output:
--- --n= 10
--- --mean= -2.3851394871599e-05
--- --stddev= 4.406545187484e-07
--- --min= -2.4557113647461e-05
--- --max= -2.322196996829e-05
--- ```
---@return statistics statistics The statistical data about the data in the reading buffer
---@param bufferVar bufferMethods The reading buffer to process
function smua.buffer.getstats(bufferVar) end


--- **This function recalculates the statistics of the specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to regenerate the reading buffer statistics about the specified reading buffer. Because the SMU automatically updates reading buffer statistics when data is added to the reading buffer, this function is generally not needed. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten. Use this function to recalculate the statistics that include only the data that is presently stored in the buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18556.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.buffer.recalculatestats(smua.nvbuffer1)
--- 
--- --Recalculates the statistics of buffer smua.nvbuffer1.
--- ```
---@param bufferVar bufferMethods The reading buffer to process
function smua.buffer.recalculatestats(bufferVar) end
---@class smub.buffer
smub.buffer = {}


--- **This function returns the statistics for a specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function returns a table with statistical data about the data that is placed in the buffer.The SMU automatically updates reading buffer statistics as data is added to the reading buffer. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten.The table returned from this function is a snapshot. Although the SMU continues to update the statistics, the table returned is not updated. To get fresh statistics, call this function again.The statistics parameter has the attributes described in the following table.If n equals zero (0), all other attributes are nil. If n equals 1, the stddev attribute is nil because the standard deviation of a sample size of 1 is undefined.The min and max entries each have the attributes defined in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18554.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- reset()
--- smua.nvbuffer1.clear()
--- smua.measure.count = 10
--- smua.measure.v(smua.nvbuffer1)
--- stats = smua.buffer.getstats(smua.nvbuffer1)
--- print("n= "..stats.n)
--- print("mean= "..stats.mean)
--- print("stddev= "..stats.stddev)
--- print("min= "..stats.min.reading)
--- print("max= "..stats.max.reading)
--- 
--- --Make measurements and store them in nvbuffer1. Print the statistics for the data.
--- --Example output:
--- --n= 10
--- --mean= -2.3851394871599e-05
--- --stddev= 4.406545187484e-07
--- --min= -2.4557113647461e-05
--- --max= -2.322196996829e-05
--- ```
---@return statistics statistics The statistical data about the data in the reading buffer
---@param bufferVar bufferMethods The reading buffer to process
function smub.buffer.getstats(bufferVar) end


--- **This function recalculates the statistics of the specified reading buffer.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function causes the SMU to regenerate the reading buffer statistics about the specified reading buffer. Because the SMU automatically updates reading buffer statistics when data is added to the reading buffer, this function is generally not needed. When the reading buffer is configured to wrap around and overwrite older data with new data, the buffer statistics include the data that was overwritten. Use this function to recalculate the statistics that include only the data that is presently stored in the buffer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/18556.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.buffer.recalculatestats(smua.nvbuffer1)
--- 
--- --Recalculates the statistics of buffer smua.nvbuffer1.
--- ```
---@param bufferVar bufferMethods The reading buffer to process
function smub.buffer.recalculatestats(bufferVar) end
---@class script.factory
script.factory = {}


--- **This function returns an iterator that can be used in a for loop to iterate over all the factory scripts.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Accessing this catalog of scripts allows you to process the factory scripts. The entries are enumerated in no particular order.Each time the body of the function executes, name takes on the name of one of the factory scripts. The for loop repeats until all scripts have been iterated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/19931.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- for name in script.factory.catalog() do
---    print(name)
--- end
--- 
--- --Retrieve the catalog listing for factory scripts.
--- ```
function script.factory.catalog() end
---@class status.measurement
status.measurement = {}


--- **This attribute contains the measurement event register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.enable = status.measurement.BAV
--- 
--- --Sets the BAV bit of the measurement event enable register.
--- ```
status.measurement.condition = 0



--- **This attribute contains the measurement event register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.enable = status.measurement.BAV
--- 
--- --Sets the BAV bit of the measurement event enable register.
--- ```
status.measurement.enable = 0



--- **This attribute contains the measurement event register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.enable = status.measurement.BAV
--- 
--- --Sets the BAV bit of the measurement event enable register.
--- ```
status.measurement.event = 0



--- **This attribute contains the measurement event register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.enable = status.measurement.BAV
--- 
--- --Sets the BAV bit of the measurement event enable register.
--- ```
status.measurement.ntr = 0



--- **This attribute contains the measurement event register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write the measurement event registers.Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the measurement event enable register, set status.measurement.enable = status.measurement.BAV. In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27145.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.enable = status.measurement.BAV
--- 
--- --Sets the BAV bit of the measurement event enable register.
--- ```
status.measurement.ptr = 0

---@class triggergeneratorArr
local triggergeneratorArr = {}

---@type triggergeneratorArr[]
trigger.generator = {}


--- **This function generates a trigger event.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- Use this function to directly trigger events from the command interface or a script. For example, you can trigger a sweep while the instrument is under script control.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29218.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- trigger.generator[2].assert()
--- 
--- --Generates a trigger event on generator 2.
--- ```
function triggergeneratorArr.assert() end



--- **This constant identifies the trigger event generated by the trigger event generator.**
---
--- *Type:*  Constant
---
--- *Details:*<br>
--- This constant is an identification number that identifies events generated by this generator.To have another trigger object respond to trigger events generated by this generator, set the other object's stimulus attribute to the value of this constant.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29219.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- digio.trigger[5].stimulus = trigger.generator[2].EVENT_ID
--- 
--- --Uses a trigger event on generator 2 to be the stimulus for digital I/O trigger line 5.
--- ```
triggergeneratorArr.EVENT_ID= 0

---@class display.smua.measure
display.smua.measure = {}

display.MEASURE_DCVOLTS = nil
display.MEASURE_DCAMPS = nil
display.MEASURE_WATTS = nil
display.MEASURE_OHMS = nil

---@alias displaysmuameasurefuncfunc
---|`display.MEASURE_DCVOLTS`
---|`display.MEASURE_DCAMPS`
---|`display.MEASURE_WATTS`
---|`display.MEASURE_OHMS`



--- **This attribute specifies the type of measurement that is being displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the measurement function that is displayed on the front panel: Amps, volts, ohms, or watts.SMU A and SMU B can be set for different measurement functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14714.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.measure.func = display.MEASURE_DCAMPS
--- 
--- --Selects the current measure function for SMU A.
--- ```
---@type displaysmuameasurefuncfunc
display.smua.measure.func = 0

---@class display.smub.measure
display.smub.measure = {}

display.MEASURE_DCVOLTS = nil
display.MEASURE_DCAMPS = nil
display.MEASURE_WATTS = nil
display.MEASURE_OHMS = nil

---@alias displaysmubmeasurefuncfunc
---|`display.MEASURE_DCVOLTS`
---|`display.MEASURE_DCAMPS`
---|`display.MEASURE_WATTS`
---|`display.MEASURE_OHMS`



--- **This attribute specifies the type of measurement that is being displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the measurement function that is displayed on the front panel: Amps, volts, ohms, or watts.SMU A and SMU B can be set for different measurement functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14714.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.measure.func = display.MEASURE_DCAMPS
--- 
--- --Selects the current measure function for SMU A.
--- ```
---@type displaysmubmeasurefuncfunc
display.smub.measure.func = 0

---@class lan.config.dns
lan.config.dns = {}


--- **Configures DNS server IP addresses.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is an array of Domain Name System (DNS) server addresses. These addresses take priority for DNS lookups and are consulted before any server addresses that are obtained using DHCP. This allows local DNS servers to be specified that take priority over DHCP‑configured global DNS servers.You can specify up to two addresses. The address specified by 1 is consulted first for DNS lookups. dnsAddress must be a string specifying the IP address of the DNS server in dotted decimal notation.Unused entries are returned as "0.0.0.0" when read. To disable an entry, set its value to "0.0.0.0" or the empty string "".Although only two addresses may be manually specified here, the instrument uses up to three DNS server addresses. If two are specified here, only one that is given by a DHCP server is used. If no entries are specified here, up to three addresses that are given by a DHCP server are used.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14898.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14899.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14900.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14902.htm"])
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
--- This attribute holds the host name to request during dynamic DNS registration. Dynamic DNS registration works with DHCP to register the host name specified in this attribute with the DNS server.The factory default value for hostName is "k‑<model number>‑<serial number>", where <model number> and <serial number> are replaced with the actual model number and serial number of the instrument (for example, "k‑2602B‑1234567"). Note that hyphens separate the characters of hostName. The length of the fully qualified host name (combined length of the domain and host name with separator characters) must be less than or equal to 255 characters. Although up to 63 characters can be entered here, you must make sure the combined length is no more than 255 characters.Setting this attribute to an empty string (in other words, setting this attribute to a string of length zero or a string that consists entirely of whitespace characters) reverts the host name to the factory default value.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/66559.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14909.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14910.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14915.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14916.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14917.htm"])
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
---[command help](command:kic.viewHelpDocument?["Commands_26XX/14918.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- print(lan.status.port.vxi11)
--- 
--- --Outputs the VXI-11 number, such as:
--- --1.02400e+03
--- ```
lan.status.port.vxi11 = 0

---@class smua.measure.filter
smua.measure.filter = {}


--- **This command sets the number of measured readings that are required to yield one filtered measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the size of the stack used for filtered measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15113.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
--- 
--- --Sets the filter count for SMU channel A to 10.
--- --Sets the filter type to moving average.
--- --Enables the filter.
--- ```
smua.measure.filter.count = 0


smua.FILTER_ON = nil
smua.FILTER_OFF = nil

---@alias smuameasurefilterenablefilterState
---|`smua.FILTER_ON`
---|`smua.FILTER_OFF`



--- **This command enables or disables filtered measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the filter.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15114.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
--- 
--- --Sets the filter count for SMU channel A to 10.
--- --Sets the filter type to moving average.
--- --Enables the filter.
--- ```
---@type smuameasurefilterenablefilterState
smua.measure.filter.enable = 0


smua.FILTER_MEDIAN = nil
smua.FILTER_MOVING_AVG = nil
smua.FILTER_REPEAT_AVG = nil

---@alias smuameasurefiltertypefilterType
---|`smua.FILTER_MEDIAN`
---|`smua.FILTER_MOVING_AVG`
---|`smua.FILTER_REPEAT_AVG`



--- **This command sets the type of filter used for measurements when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The 2600B provides a moving average, repeating average, and median filter type.For the repeating filter, the stack (filter count) is filled, and the conversions are averaged to yield a reading. The stack is then cleared, and the process starts over. The moving average filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the measurement conversions are averaged, yielding a reading. For each subsequent conversion placed into the stack, the oldest conversion is discarded. The stack is re-averaged, yielding a new reading.The median filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the reading nearest to the middle is returned. For each subsequent conversion placed into the stack, the oldest reading is discarded. The stack is then re-sorted, yielding a new reading. If the filter count is an even number, the reading returned is the average of the two middle readings.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
--- 
--- --Sets the filter count for SMU channel A to 10.
--- --Sets the filter type to moving average.
--- --Enables the filter.
--- ```
---@type smuameasurefiltertypefilterType
smua.measure.filter.type = 0

---@class smub.measure.filter
smub.measure.filter = {}


--- **This command sets the number of measured readings that are required to yield one filtered measurement.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute sets the size of the stack used for filtered measurements.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15113.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
--- 
--- --Sets the filter count for SMU channel A to 10.
--- --Sets the filter type to moving average.
--- --Enables the filter.
--- ```
smub.measure.filter.count = 0


smub.FILTER_ON = nil
smub.FILTER_OFF = nil

---@alias smubmeasurefilterenablefilterState
---|`smub.FILTER_ON`
---|`smub.FILTER_OFF`



--- **This command enables or disables filtered measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This command enables or disables the filter.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15114.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
--- 
--- --Sets the filter count for SMU channel A to 10.
--- --Sets the filter type to moving average.
--- --Enables the filter.
--- ```
---@type smubmeasurefilterenablefilterState
smub.measure.filter.enable = 0


smub.FILTER_MEDIAN = nil
smub.FILTER_MOVING_AVG = nil
smub.FILTER_REPEAT_AVG = nil

---@alias smubmeasurefiltertypefilterType
---|`smub.FILTER_MEDIAN`
---|`smub.FILTER_MOVING_AVG`
---|`smub.FILTER_REPEAT_AVG`



--- **This command sets the type of filter used for measurements when the measurement filter is enabled.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- The 2600B provides a moving average, repeating average, and median filter type.For the repeating filter, the stack (filter count) is filled, and the conversions are averaged to yield a reading. The stack is then cleared, and the process starts over. The moving average filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the measurement conversions are averaged, yielding a reading. For each subsequent conversion placed into the stack, the oldest conversion is discarded. The stack is re-averaged, yielding a new reading.The median filter uses a first-in, first-out stack. When the stack (filter count) becomes full, the reading nearest to the middle is returned. For each subsequent conversion placed into the stack, the oldest reading is discarded. The stack is then re-sorted, yielding a new reading. If the filter count is an even number, the reading returned is the average of the two middle readings.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15115.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.filter.count = 10
--- smua.measure.filter.type = smua.FILTER_MOVING_AVG
--- smua.measure.filter.enable = smua.FILTER_ON
--- 
--- --Sets the filter count for SMU channel A to 10.
--- --Sets the filter type to moving average.
--- --Enables the filter.
--- ```
---@type smubmeasurefiltertypefilterType
smub.measure.filter.type = 0

---@class smua.measure.rel
smua.measure.rel = {}

smua.REL_ON = nil
smua.REL_OFF = nil

---@alias smuameasurerelenablevrelEnable
---|`smua.REL_ON`
---|`smua.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smuameasurerelenablevrelEnable
smua.measure.rel.enablev = 0


smua.REL_ON = nil
smua.REL_OFF = nil

---@alias smuameasurerelenableirelEnable
---|`smua.REL_ON`
---|`smua.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smuameasurerelenableirelEnable
smua.measure.rel.enablei = 0


smua.REL_ON = nil
smua.REL_OFF = nil

---@alias smuameasurerelenablerrelEnable
---|`smua.REL_ON`
---|`smua.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smuameasurerelenablerrelEnable
smua.measure.rel.enabler = 0


smua.REL_ON = nil
smua.REL_OFF = nil

---@alias smuameasurerelenableprelEnable
---|`smua.REL_ON`
---|`smua.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smuameasurerelenableprelEnable
smua.measure.rel.enablep = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smua.measure.rel.levelv = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smua.measure.rel.leveli = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smua.measure.rel.levelr = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smua.measure.rel.levelp = 0

---@class smub.measure.rel
smub.measure.rel = {}

smub.REL_ON = nil
smub.REL_OFF = nil

---@alias smubmeasurerelenablevrelEnable
---|`smub.REL_ON`
---|`smub.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smubmeasurerelenablevrelEnable
smub.measure.rel.enablev = 0


smub.REL_ON = nil
smub.REL_OFF = nil

---@alias smubmeasurerelenableirelEnable
---|`smub.REL_ON`
---|`smub.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smubmeasurerelenableirelEnable
smub.measure.rel.enablei = 0


smub.REL_ON = nil
smub.REL_OFF = nil

---@alias smubmeasurerelenablerrelEnable
---|`smub.REL_ON`
---|`smub.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smubmeasurerelenablerrelEnable
smub.measure.rel.enabler = 0


smub.REL_ON = nil
smub.REL_OFF = nil

---@alias smubmeasurerelenableprelEnable
---|`smub.REL_ON`
---|`smub.REL_OFF`



--- **This attribute turns relative measurements on or off. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute enables or disables relative measurements. When relative measurements are enabled, all subsequent measured readings are offset by the relative offset value specified by smuX.measure.rel.levelY. Each returned measured relative reading is the result of the following calculation:Relative reading = Actual measured reading − Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15123.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.enablev = smua.REL_ON
--- 
--- --Enables relative voltage measurements for SMU channel A.
--- ```
---@type smubmeasurerelenableprelEnable
smub.measure.rel.enablep = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smub.measure.rel.levelv = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smub.measure.rel.leveli = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smub.measure.rel.levelr = 0



--- **This attribute sets the offset value for relative measurements.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute specifies the offset value used for relative measurements. When relative measurements are enabled (see smuX.measure.rel.enableY), all subsequent measured readings are offset by the value of this attribute. Each returned measured relative reading is the result of the following calculation: Relative reading = Actual measured reading - Relative offset value
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15124.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.measure.rel.levelv = smua.measure.v()
--- 
--- --Performs a voltage measurement using SMU channel A and then uses it as the relative offset value.
--- ```
smub.measure.rel.levelp = 0

---@class smua.trigger.arm
smua.trigger.arm = {}


--- **This attribute sets the arm count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the arm layer of the trigger model this many times. After performing this many iterations, the SMU returns to an idle state.If this count is set to zero, the SMU stays in the trigger model indefinitely until aborted.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15156.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.count = 5
--- 
--- --Sets the SMU channel A to iterate through the arm layer of the trigger model five times and then return to the idle state.
--- ```
smua.trigger.arm.count = 0



--- **This function sets the arm event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.A typical example that uses this function is when you want the SMU to immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur. This function start actions on the SMU if a trigger event is missed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15157.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.set()
--- 
--- --Sets the arm event detector to the detected state for SMU channel A.
--- ```
function smua.trigger.arm.set() end


--- **This attribute selects the event that causes the arm event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event.Set this attribute to zero to bypass waiting for events at the arm event detector (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15158.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --An event on trigger timer 1 causes the arm event detector to enter the detected state.
--- ```
---@type triggerEvents|0
smua.trigger.arm.stimulus= 0

---@class smub.trigger.arm
smub.trigger.arm = {}


--- **This attribute sets the arm count in the trigger model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- During a sweep, the SMU iterates through the arm layer of the trigger model this many times. After performing this many iterations, the SMU returns to an idle state.If this count is set to zero, the SMU stays in the trigger model indefinitely until aborted.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15156.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.count = 5
--- 
--- --Sets the SMU channel A to iterate through the arm layer of the trigger model five times and then return to the idle state.
--- ```
smub.trigger.arm.count = 0



--- **This function sets the arm event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.A typical example that uses this function is when you want the SMU to immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur. This function start actions on the SMU if a trigger event is missed.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15157.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.set()
--- 
--- --Sets the arm event detector to the detected state for SMU channel A.
--- ```
function smub.trigger.arm.set() end


--- **This attribute selects the event that causes the arm event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event.Set this attribute to zero to bypass waiting for events at the arm event detector (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15158.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.arm.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --An event on trigger timer 1 causes the arm event detector to enter the detected state.
--- ```
---@type triggerEvents|0
smub.trigger.arm.stimulus= 0

---@class smua.trigger.endpulse
smua.trigger.endpulse = {}

smua.SOURCE_IDLE1 = nil
smua.SOURCE_HOLD = nil

---@alias smuatriggerendpulseactionpulseAction
---|`smua.SOURCE_IDLE1`
---|`smua.SOURCE_HOLD`



--- **This attribute enables or disables pulse mode sweeps.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When set to smuX.SOURCE_HOLD, this attribute disables pulse mode sweeps, holding the source level for the remainder of the step. When set to smuX.SOURCE_IDLE, this attribute enables pulse mode sweeps, setting the source level to the programmed (idle) level at the end of the pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15162.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Configure the end pulse action to achieve a pulse and configure trigger timer 1 to control the end of pulse.
--- ```
---@type smuatriggerendpulseactionpulseAction
smua.trigger.endpulse.action = 0



--- **This function sets the end pulse event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the end pulse event detector to the detected state.The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Therefore, call smuX.trigger.endpulse.set() after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.endpulse.set() is issued after the SMU has entered the trigger layer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15163.htm"])
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
--- 
--- --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms.
--- --Alias the trigger timers to use for pulse width and period.
--- --Create a fixed level voltage sweep.
--- --Set the pulse width and trigger the pulse width timer with a period timer.
--- --Set the pulse period to output one pulse per period and the count to generate 10 pulses.
--- --Trigger the pulse period timer when a sweep is initiated.
--- --Configure the timer to output a trigger event when it starts the first delay.
--- --Trigger the SMU source action using pulse period timer.
--- --Trigger the SMU end pulse action using pulse width timer.
--- --Set the trigger model counts.
--- --Configure the SMU to execute a 10-point pulse train.
--- --Start the trigger model.
--- --Wait for the sweep to complete.
--- ```
function smua.trigger.endpulse.set() end


--- **This attribute defines which event causes the end pulse event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. To bypass waiting for an event, set this value of this attribute to 0. Set eventID to one of the existing trigger event IDs, which are shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Configure the end pulse action to achieve a pulse and select the event, trigger.timer[1].EVENT_ID, that causes the arm event detector to enter the detected state.
--- ```
---@type triggerEvents|0
smua.trigger.endpulse.stimulus= 0

---@class smub.trigger.endpulse
smub.trigger.endpulse = {}

smub.SOURCE_IDLE1 = nil
smub.SOURCE_HOLD = nil

---@alias smubtriggerendpulseactionpulseAction
---|`smub.SOURCE_IDLE1`
---|`smub.SOURCE_HOLD`



--- **This attribute enables or disables pulse mode sweeps.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- When set to smuX.SOURCE_HOLD, this attribute disables pulse mode sweeps, holding the source level for the remainder of the step. When set to smuX.SOURCE_IDLE, this attribute enables pulse mode sweeps, setting the source level to the programmed (idle) level at the end of the pulse.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15162.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Configure the end pulse action to achieve a pulse and configure trigger timer 1 to control the end of pulse.
--- ```
---@type smubtriggerendpulseactionpulseAction
smub.trigger.endpulse.action = 0



--- **This function sets the end pulse event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the end pulse event detector to the detected state.The SMU automatically clears all the event detectors when the smuX.trigger.initiate() function is executed. Therefore, call smuX.trigger.endpulse.set() after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.endpulse.set() is issued after the SMU has entered the trigger layer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15163.htm"])
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
--- 
--- --Generate a 10-point pulse train where each pulse has a width of 600 µs and a pulse period of 5 ms.
--- --Alias the trigger timers to use for pulse width and period.
--- --Create a fixed level voltage sweep.
--- --Set the pulse width and trigger the pulse width timer with a period timer.
--- --Set the pulse period to output one pulse per period and the count to generate 10 pulses.
--- --Trigger the pulse period timer when a sweep is initiated.
--- --Configure the timer to output a trigger event when it starts the first delay.
--- --Trigger the SMU source action using pulse period timer.
--- --Trigger the SMU end pulse action using pulse width timer.
--- --Set the trigger model counts.
--- --Configure the SMU to execute a 10-point pulse train.
--- --Start the trigger model.
--- --Wait for the sweep to complete.
--- ```
function smub.trigger.endpulse.set() end


--- **This attribute defines which event causes the end pulse event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. To bypass waiting for an event, set this value of this attribute to 0. Set eventID to one of the existing trigger event IDs, which are shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endpulse.action = smua.SOURCE_IDLE
--- smua.trigger.endpulse.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Configure the end pulse action to achieve a pulse and select the event, trigger.timer[1].EVENT_ID, that causes the arm event detector to enter the detected state.
--- ```
---@type triggerEvents|0
smub.trigger.endpulse.stimulus= 0

---@class smua.trigger.endsweep
smua.trigger.endsweep = {}

smua.SOURCE_IDLE = nil
smua.SOURCE_HOLD = nil

---@alias smuatriggerendsweepactionaction
---|`smua.SOURCE_IDLE`
---|`smua.SOURCE_HOLD`



--- **This attribute sets the action of the source at the end of a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to configure the source action at the end of the sweep. The SMU can be programmed to return to the idle source level or hold the last value of the sweep.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15166.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endsweep.action = smua.SOURCE_IDLE
--- 
--- --Sets SMU channel A to return the source back to the idle source level at the end of a sweep.
--- ```
---@type smuatriggerendsweepactionaction
smua.trigger.endsweep.action = 0

---@class smub.trigger.endsweep
smub.trigger.endsweep = {}

smub.SOURCE_IDLE = nil
smub.SOURCE_HOLD = nil

---@alias smubtriggerendsweepactionaction
---|`smub.SOURCE_IDLE`
---|`smub.SOURCE_HOLD`



--- **This attribute sets the action of the source at the end of a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to configure the source action at the end of the sweep. The SMU can be programmed to return to the idle source level or hold the last value of the sweep.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15166.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.endsweep.action = smua.SOURCE_IDLE
--- 
--- --Sets SMU channel A to return the source back to the idle source level at the end of a sweep.
--- ```
---@type smubtriggerendsweepactionaction
smub.trigger.endsweep.action = 0

---@class smua.trigger.measure
smua.trigger.measure = {}

smua.DISABLE = nil
smua.ASYNC = nil
smua.ENABLE = nil

---@alias smuatriggermeasureactionaction
---|`smua.DISABLE`
---|`smua.ASYNC`
---|`smua.ENABLE`



--- **This attribute controls measurement actions during a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- With this attribute enabled (setting action to smuX.ENABLE or smuX.ASYNC), configure the measurement with one of the smuX.trigger.measure.Y() functions.If this attribute is set to smuX.ASYNC:If any of the above items is incorrectly configured, the smuX.trigger.initiate() function generates an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(smua.nvbuffer1)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Configure sweep voltage measurements.
--- --Enable voltage measurements during the sweep.
--- ```
---@type smuatriggermeasureactionaction
smua.trigger.measure.action = 0



--- **This function sets the measurement event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful whenever you want the SMU to continue operation without waiting for a programmed trigger event. When called, this function immediately satisfies the event detector, allowing the SMU to continue through the trigger model.For example, you might use this function to have the SMU immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur.If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.measure.set() is issued after the SMU has entered the trigger layer. This function can also be used to start actions on the SMU in case of a missed trigger event.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.set()
--- 
--- --Sets the measure event detector of SMU channel A.
--- ```
function smua.trigger.measure.set() end


--- **This attribute selects the event that causes the measure event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the measurement event detector portion of the trigger model.Set this attribute to zero to bypass waiting for an event (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15171.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Sets delay before measurement begins on SMU channel A.
--- ```
---@type triggerEvents|0
smua.trigger.measure.stimulus= 0



--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smua.trigger.measure.v(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smua.trigger.measure.i(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smua.trigger.measure.r(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smua.trigger.measure.p(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param ibuffer bufferMethods A reading buffer object where current readings are stored
---@param vbuffer bufferMethods A reading buffer object where voltage readings are stored
---@overload fun(rbuffer:bufferMethods)
function smua.trigger.measure.iv(ibuffer, vbuffer) end
---@class smub.trigger.measure
smub.trigger.measure = {}

smub.DISABLE = nil
smub.ASYNC = nil
smub.ENABLE = nil

---@alias smubtriggermeasureactionaction
---|`smub.DISABLE`
---|`smub.ASYNC`
---|`smub.ENABLE`



--- **This attribute controls measurement actions during a sweep.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- With this attribute enabled (setting action to smuX.ENABLE or smuX.ASYNC), configure the measurement with one of the smuX.trigger.measure.Y() functions.If this attribute is set to smuX.ASYNC:If any of the above items is incorrectly configured, the smuX.trigger.initiate() function generates an error.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(smua.nvbuffer1)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Configure sweep voltage measurements.
--- --Enable voltage measurements during the sweep.
--- ```
---@type smubtriggermeasureactionaction
smub.trigger.measure.action = 0



--- **This function sets the measurement event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function is useful whenever you want the SMU to continue operation without waiting for a programmed trigger event. When called, this function immediately satisfies the event detector, allowing the SMU to continue through the trigger model.For example, you might use this function to have the SMU immediately perform an action the first time through the trigger model, even if a programmed trigger event does not occur.If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.measure.set() is issued after the SMU has entered the trigger layer. This function can also be used to start actions on the SMU in case of a missed trigger event.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.set()
--- 
--- --Sets the measure event detector of SMU channel A.
--- ```
function smub.trigger.measure.set() end


--- **This attribute selects the event that causes the measure event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the measurement event detector portion of the trigger model.Set this attribute to zero to bypass waiting for an event (the SMU continues uninterrupted through the remote trigger model). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15171.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.stimulus = trigger.timer[1].EVENT_ID
--- 
--- --Sets delay before measurement begins on SMU channel A.
--- ```
---@type triggerEvents|0
smub.trigger.measure.stimulus= 0



--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smub.trigger.measure.v(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smub.trigger.measure.i(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smub.trigger.measure.r(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param rbuffer bufferMethods A reading buffer object where the readings are stored
function smub.trigger.measure.p(rbuffer) end


--- **This function configures the measurements that are to be made in a subsequent sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- As measurements are made, they are stored in a reading buffer. If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The smuX.trigger.measure.iv() function stores current readings in ibuffer and voltage readings in vbuffer.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.The SMU only retains the last call to any one of these functions and only that measurement action is performed.After configuring the measurements to make with this function, enable the measurement action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15172.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.measure.v(vbuffername)
--- smua.trigger.measure.action = smua.ENABLE
--- 
--- --Stores voltage readings during the sweep for SMU channel A in buffer vbuffername.
--- ```
---@param ibuffer bufferMethods A reading buffer object where current readings are stored
---@param vbuffer bufferMethods A reading buffer object where voltage readings are stored
---@overload fun(rbuffer:bufferMethods)
function smub.trigger.measure.iv(ibuffer, vbuffer) end
---@class smua.trigger.source
smua.trigger.source = {}

smua.DISABLE = nil
smua.ENABLE = nil

---@alias smuatriggersourceactionaction
---|`smua.DISABLE`
---|`smua.ENABLE`



--- **This attribute enables or disables sweeping the source (on or off).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to enable or disable source level changes during a sweep. In addition to enabling the action before initiating the sweep, make sure to configure it using smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15178.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- smua.trigger.source.action = smua.ENABLE
--- 
--- --Configure list sweep for SMU channel A (sweep through 3 V, 1 V, 4 V, 5 V, and 2 V).
--- --Enable the source action.
--- ```
---@type smuatriggersourceactionaction
smua.trigger.source.action = 0


smua.LIMIT_AUTO = nil

---@alias smuatriggersourcelimitvsweepSourceLimit
---|`smua.LIMIT_AUTO`



--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15179.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
--- 
--- --Sets the voltage sweep limit to 10 V.
--- ```
---@type smuatriggersourcelimitvsweepSourceLimit
smua.trigger.source.limitv = 0


smua.LIMIT_AUTO = nil

---@alias smuatriggersourcelimitisweepSourceLimit
---|`smua.LIMIT_AUTO`



--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15179.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
--- 
--- --Sets the voltage sweep limit to 10 V.
--- ```
---@type smuatriggersourcelimitisweepSourceLimit
smua.trigger.source.limiti = 0



--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15180.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
--- 
--- --Sweeps from 0 V to 10 V in 1 V steps.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
function smua.trigger.source.linearv(startValue, endPointValue, points) end


--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15180.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
--- 
--- --Sweeps from 0 V to 10 V in 1 V steps.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
function smua.trigger.source.lineari(startValue, endPointValue, points) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15181.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- 
--- --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V.
--- ```
---@param sweepList table An array of source values
function smua.trigger.source.listv(sweepList) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15181.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- 
--- --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V.
--- ```
---@param sweepList table An array of source values
function smua.trigger.source.listi(sweepList) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15182.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
--- 
--- --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
---@param asymptote number The asymptotic offset value
function smua.trigger.source.logv(startValue, endPointValue, points, asymptote) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15182.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
--- 
--- --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
---@param asymptote number The asymptotic offset value
function smua.trigger.source.logi(startValue, endPointValue, points, asymptote) end


--- **This function sets the source event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the source event detector to the detected state.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.source.set() is issued after the SMU has entered the trigger layer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15183.htm"])
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
--- 
--- --Sets the source event detector.
--- ```
function smua.trigger.source.set() end


--- **This attribute defines which event causes the source event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the source event detector portion of the trigger model. To bypass waiting for an event, set the value of this attribute to zero (0). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15184.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
--- 
--- --Configure SMU channel A to start its source action when a trigger event occurs on digital I/O line 2.
--- ```
---@type triggerEvents|0
smua.trigger.source.stimulus= 0

---@class smub.trigger.source
smub.trigger.source = {}

smub.DISABLE = nil
smub.ENABLE = nil

---@alias smubtriggersourceactionaction
---|`smub.DISABLE`
---|`smub.ENABLE`



--- **This attribute enables or disables sweeping the source (on or off).**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- This attribute is used to enable or disable source level changes during a sweep. In addition to enabling the action before initiating the sweep, make sure to configure it using smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY().
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15178.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- smua.trigger.source.action = smua.ENABLE
--- 
--- --Configure list sweep for SMU channel A (sweep through 3 V, 1 V, 4 V, 5 V, and 2 V).
--- --Enable the source action.
--- ```
---@type smubtriggersourceactionaction
smub.trigger.source.action = 0


smub.LIMIT_AUTO = nil

---@alias smubtriggersourcelimitvsweepSourceLimit
---|`smub.LIMIT_AUTO`



--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15179.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
--- 
--- --Sets the voltage sweep limit to 10 V.
--- ```
---@type smubtriggersourcelimitvsweepSourceLimit
smub.trigger.source.limitv = 0


smub.LIMIT_AUTO = nil

---@alias smubtriggersourcelimitisweepSourceLimit
---|`smub.LIMIT_AUTO`



--- **This attribute sets the sweep source limit.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Use this attribute to perform extended operating area pulse mode sweeps.If this attribute is set to smuX.LIMIT_AUTO (or 0), the SMU uses the normal limit setting during sweeping. If this attribute is set to any other numeric value, the SMU switches in this limit at the start of the source action and returns to the normal limit setting at the end of the end pulse action.Normally, the limit range is automatically adjusted in accordance with the limit value. During sweeping, however, the limit range is fixed to avoid the delays associated with changing range. This fixed limit range is determined by the maximum limit value needed during the sweep; that is, the greater of either the normal limit value (as specified by smuX.source.limitY) or the sweep limit value (as specified by smuX.trigger.source.limitY). The minimum limit value that can be enforced during the sweep is equal to 10% of the full‑scale value of the fixed limit range. If the smaller limit value (normal or sweep) falls below this 10% threshold, the 10% value is enforced instead. Likewise, if the limit value falls below the 10% threshold as a result of power compliance, the 10% value is enforced instead.When using the extended operating area, the SMU automatically starts the end pulse action if the SMU is not triggered before its maximum pulse width. It also delays the source action if necessary to limit the pulse duty cycle to stay within the capabilities of the SMU.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15179.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.limitv = 10
--- 
--- --Sets the voltage sweep limit to 10 V.
--- ```
---@type smubtriggersourcelimitisweepSourceLimit
smub.trigger.source.limiti = 0



--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15180.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
--- 
--- --Sweeps from 0 V to 10 V in 1 V steps.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
function smub.trigger.source.linearv(startValue, endPointValue, points) end


--- **This function configures a linear source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a linear source sweep in a subsequent sweep. During the sweep, the source generates a uniform series of ascending or descending voltage or current changes called steps. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep. Instead, it is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With linear sweeps, it is acceptable to maintain a fixed source resolution over the entire sweep. To prevent source range changes during the sweep (especially when sweeping through 0.0), set the source range to a fixed range appropriate for the larger of either startValue or endValue. The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15180.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.linearv(0, 10, 11)
--- 
--- --Sweeps from 0 V to 10 V in 1 V steps.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
function smub.trigger.source.lineari(startValue, endPointValue, points) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15181.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- 
--- --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V.
--- ```
---@param sweepList table An array of source values
function smub.trigger.source.listv(sweepList) end


--- **This function configures an array-based source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a list sweep in a subsequent sweep. During the sweep, the source outputs the sequence of source values given in the sweepList array.If the subsequent sweep has more points than specified in sweepList, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in sweepList, the extra values are ignored. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is a nonzero value, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.The SMU only stores the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15181.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.listv({3, 1, 4, 5, 2})
--- 
--- --Sweeps SMU channel A through 3 V, 1 V, 4 V, 5 V, and 2 V.
--- ```
---@param sweepList table An array of source values
function smub.trigger.source.listi(sweepList) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15182.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
--- 
--- --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
---@param asymptote number The asymptotic offset value
function smub.trigger.source.logv(startValue, endPointValue, points, asymptote) end


--- **This function configures an exponential (geometric) source sweep.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function configures the source action to be a geometric source sweep in a subsequent sweep. During the sweep, the source generates a geometric series of ascending or descending voltage or current changes called steps. Each step is larger or smaller than the previous step by a fixed proportion. The constant of proportionality is determined by the starting value, the ending value, the asymptote, and the number of steps in the sweep. The number of source steps is one less than the number of sourced points.The points parameter does not set the number of steps in a sweep, but rather is used to calculate source values within a subsequent sweep. If the subsequent sweep has more points than specified in points, the source restarts at the beginning. This means that if the trigger count is greater than the number of points in a sweep as configured, the SMU satisfies the trigger count by restarting the sweep values from the beginning. If the subsequent sweep has fewer points than specified in points, endValue is not reached during the sweep. This means that if the trigger count is less than the number of source values configured, the SMU satisfies the trigger count and ignores the remaining source values.In cases where the first sweep point is nonzero, it may be necessary to pre-charge the circuit so that the sweep returns a stable value for the first measured point without penalizing remaining points in the sweep.With logarithmic sweeps, it is usually necessary to allow the source to autorange to maintain good source accuracy when sweeping over more than one decade or across range boundaries.The asymptote parameter customizes the inflection and offset of the source value curve. This allows log sweeps to cross zero. Setting this parameter to zero provides a conventional logarithmic sweep. The asymptote value is the value that the curve has at either positive or negative infinity, depending on the direction of the sweep.The asymptote value must not be equal to or between the starting and ending values. It must be outside the range defined by the starting and ending values.The SMU stores only the most recent configured source action. The last call to smuX.trigger.source.linearY(), smuX.trigger.source.listY(), or smuX.trigger.source.logY() is used for the source action.Source functions cannot be changed within a sweep.After configuring the sweep source values, enable the source action by setting smuX.trigger.source.action.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15182.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.logv(1, 10, 11, 0)
--- 
--- --Sweeps SMU channel A from 1 V to 10 V in 10 steps with an asymptote of 0 V.
--- ```
---@param startValue number Source value of the first point
---@param endPointValue number Source value of the last point
---@param points number The number of points used to calculate the step size
---@param asymptote number The asymptotic offset value
function smub.trigger.source.logi(startValue, endPointValue, points, asymptote) end


--- **This function sets the source event detector to the detected state.**
---
--- *Type:*  Function
---
--- *Details:*<br>
--- This function sets the source event detector to the detected state.The SMU automatically clears all event detectors when the smuX.trigger.initiate() function is executed. Call this function after the sweep is initiated. If the event detectors are configured to clear automatically because the smuX.trigger.autoclear attribute is set to smuX.ENABLE, make sure that smuX.trigger.source.set() is issued after the SMU has entered the trigger layer.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15183.htm"])
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
--- 
--- --Sets the source event detector.
--- ```
function smub.trigger.source.set() end


--- **This attribute defines which event causes the source event detector to enter the detected state.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Set this attribute to the event ID of any trigger event generator to wait for that event. When set, the SMU waits for the event at the source event detector portion of the trigger model. To bypass waiting for an event, set the value of this attribute to zero (0). Set eventID to one of the existing trigger event IDs shown in the following table.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15184.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- smua.trigger.source.stimulus = digio.trigger[2].EVENT_ID
--- 
--- --Configure SMU channel A to start its source action when a trigger event occurs on digital I/O line 2.
--- ```
---@type triggerEvents|0
smub.trigger.source.stimulus= 0

---@class status.operation.instrument
status.operation.instrument = {}


--- **This attribute contains the operation status instrument summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27207.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants.
--- -- 1026 = binary 0000 0100 0000 0010
--- operationRegister = 1026
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using a decimal value.
--- ```
status.operation.instrument.condition = 0



--- **This attribute contains the operation status instrument summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27207.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants.
--- -- 1026 = binary 0000 0100 0000 0010
--- operationRegister = 1026
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using a decimal value.
--- ```
status.operation.instrument.enable = 0



--- **This attribute contains the operation status instrument summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27207.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants.
--- -- 1026 = binary 0000 0100 0000 0010
--- operationRegister = 1026
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using a decimal value.
--- ```
status.operation.instrument.event = 0



--- **This attribute contains the operation status instrument summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27207.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants.
--- -- 1026 = binary 0000 0100 0000 0010
--- operationRegister = 1026
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using a decimal value.
--- ```
status.operation.instrument.ntr = 0



--- **This attribute contains the operation status instrument summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status instrument summary enable register, set status.operation.instrument.enable = status.operation.instrument.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). Condition register sets of:
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27207.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.SMUA +
---    status.operation.instrument.TRGBLND
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using constants.
--- -- 1026 = binary 0000 0100 0000 0010
--- operationRegister = 1026
--- status.operation.instrument.enable = operationRegister
--- 
--- --Sets bit B1 and bit B10 of the operation status instrument summary enable register using a decimal value.
--- ```
status.operation.instrument.ptr = 0

---@class status.operation.remote
status.operation.remote = {}


--- **This attribute contains the operation status remote summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15849.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.enable = status.operation.remote.CAV
--- 
--- --Uses a constant to set the CAV bit, B1, of the operation status remote summary enable register.
--- status.operation.remote.enable = 2050
--- 
--- --Uses the decimal value to set bits B1 and B11 of the operation status remote summary enable register.
--- ```
status.operation.remote.condition = 0



--- **This attribute contains the operation status remote summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15849.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.enable = status.operation.remote.CAV
--- 
--- --Uses a constant to set the CAV bit, B1, of the operation status remote summary enable register.
--- status.operation.remote.enable = 2050
--- 
--- --Uses the decimal value to set bits B1 and B11 of the operation status remote summary enable register.
--- ```
status.operation.remote.enable = 0



--- **This attribute contains the operation status remote summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15849.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.enable = status.operation.remote.CAV
--- 
--- --Uses a constant to set the CAV bit, B1, of the operation status remote summary enable register.
--- status.operation.remote.enable = 2050
--- 
--- --Uses the decimal value to set bits B1 and B11 of the operation status remote summary enable register.
--- ```
status.operation.remote.event = 0



--- **This attribute contains the operation status remote summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15849.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.enable = status.operation.remote.CAV
--- 
--- --Uses a constant to set the CAV bit, B1, of the operation status remote summary enable register.
--- status.operation.remote.enable = 2050
--- 
--- --Uses the decimal value to set bits B1 and B11 of the operation status remote summary enable register.
--- ```
status.operation.remote.ntr = 0



--- **This attribute contains the operation status remote summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status remote summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status remote summary enable register, set status.operation.remote.enable = status.operation.remote.CAV.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B11, set operationRegister to 2,050 (which is the sum of 2 + 2,048). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15849.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.remote.enable = status.operation.remote.CAV
--- 
--- --Uses a constant to set the CAV bit, B1, of the operation status remote summary enable register.
--- status.operation.remote.enable = 2050
--- 
--- --Uses the decimal value to set bits B1 and B11 of the operation status remote summary enable register.
--- ```
status.operation.remote.ptr = 0

---@class status.operation.user
status.operation.user = {}


--- **These attributes manage the operation status user register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15852.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.user.BIT11 + status.operation.user.BIT14
--- status.operation.user.enable = operationRegister
--- 
--- --Uses constants to set bits B11 and B14 of the operation status user enable register.
--- -- 18432 = binary 0100 1000 0000 0000
--- operationRegister = 18432
--- status.operation.enable = operationRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the operation status user enable register.
--- ```
status.operation.user.condition = 0



--- **These attributes manage the operation status user register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15852.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.user.BIT11 + status.operation.user.BIT14
--- status.operation.user.enable = operationRegister
--- 
--- --Uses constants to set bits B11 and B14 of the operation status user enable register.
--- -- 18432 = binary 0100 1000 0000 0000
--- operationRegister = 18432
--- status.operation.enable = operationRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the operation status user enable register.
--- ```
status.operation.user.enable = 0



--- **These attributes manage the operation status user register set of the status model.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15852.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.user.BIT11 + status.operation.user.BIT14
--- status.operation.user.enable = operationRegister
--- 
--- --Uses constants to set bits B11 and B14 of the operation status user enable register.
--- -- 18432 = binary 0100 1000 0000 0000
--- operationRegister = 18432
--- status.operation.enable = operationRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the operation status user enable register.
--- ```
status.operation.user.event = 0



--- **These attributes manage the operation status user register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15852.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.user.BIT11 + status.operation.user.BIT14
--- status.operation.user.enable = operationRegister
--- 
--- --Uses constants to set bits B11 and B14 of the operation status user enable register.
--- -- 18432 = binary 0100 1000 0000 0000
--- operationRegister = 18432
--- status.operation.enable = operationRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the operation status user enable register.
--- ```
status.operation.user.ntr = 0



--- **These attributes manage the operation status user register set of the status model.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status user registers. Reading a status register returns a value. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.29000e+02 (which is 129) is read as the value of the condition register, the binary equivalent is 0000 0000 1000 0001. This value indicates that bits B0 and B7 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status user enable register, set status.operation.user.enable = status.operation.user.BIT0.In addition to the above constants, operationRegister can be set to the decimal value of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B11 and B14, set operationRegister to 18,432 (which is the sum of 2,048 + 16,384). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15852.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.user.BIT11 + status.operation.user.BIT14
--- status.operation.user.enable = operationRegister
--- 
--- --Uses constants to set bits B11 and B14 of the operation status user enable register.
--- -- 18432 = binary 0100 1000 0000 0000
--- operationRegister = 18432
--- status.operation.enable = operationRegister
--- 
--- --Uses the decimal value to set bits B11 and B14 of the operation status user enable register.
--- ```
status.operation.user.ptr = 0

---@class status.questionable.instrument
status.questionable.instrument = {}


--- **This attribute contains the questionable status instrument summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.enable = status.questionable.instrument.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status instrument summary enable register.
--- ```
status.questionable.instrument.condition = 0



--- **This attribute contains the questionable status instrument summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.enable = status.questionable.instrument.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status instrument summary enable register.
--- ```
status.questionable.instrument.enable = 0



--- **This attribute contains the questionable status instrument summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.enable = status.questionable.instrument.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status instrument summary enable register.
--- ```
status.questionable.instrument.event = 0



--- **This attribute contains the questionable status instrument summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.enable = status.questionable.instrument.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status instrument summary enable register.
--- ```
status.questionable.instrument.ntr = 0



--- **This attribute contains the questionable status instrument summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status instrument summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27212.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.instrument.enable = status.questionable.instrument.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status instrument summary enable register.
--- ```
status.questionable.instrument.ptr = 0

---@class status.questionable.unstable_output
status.questionable.unstable_output = {}


--- **This attribute contains the questionable status unstable output summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15858.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit.
--- ```
status.questionable.unstable_output.condition = 0



--- **This attribute contains the questionable status unstable output summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15858.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit.
--- ```
status.questionable.unstable_output.enable = 0



--- **This attribute contains the questionable status unstable output summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15858.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit.
--- ```
status.questionable.unstable_output.event = 0



--- **This attribute contains the questionable status unstable output summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15858.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit.
--- ```
status.questionable.unstable_output.ntr = 0



--- **This attribute contains the questionable status unstable output summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status unstable output summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status unstable output summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15858.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.unstable_output.enable = status.questionable.unstable_output.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status unstable output summary enable register bit.
--- ```
status.questionable.unstable_output.ptr = 0

---@class display.smua.limit
display.smua.limit = {}

display.LIMIT_P = nil
display.LIMIT_IV = nil

---@alias displaysmualimitfuncfunc
---|`display.LIMIT_P`
---|`display.LIMIT_IV`



--- **If you are using a display mode that shows a single channel, this attribute specifies the type of limit value setting displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the displayed limit function: primary (IV) or power (P).SMU A and SMU B can be set for different display functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/20584.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.limit.func = display.LIMIT_P
--- 
--- --Specifies the power limit value is displayed for SMU Channel A.
--- ```
---@type displaysmualimitfuncfunc
display.smua.limit.func = 0

---@class display.smub.limit
display.smub.limit = {}

display.LIMIT_P = nil
display.LIMIT_IV = nil

---@alias displaysmublimitfuncfunc
---|`display.LIMIT_P`
---|`display.LIMIT_IV`



--- **If you are using a display mode that shows a single channel, this attribute specifies the type of limit value setting displayed.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- Selects the displayed limit function: primary (IV) or power (P).SMU A and SMU B can be set for different display functions.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/20584.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- display.smua.limit.func = display.LIMIT_P
--- 
--- --Specifies the power limit value is displayed for SMU Channel A.
--- ```
---@type displaysmublimitfuncfunc
display.smub.limit.func = 0

---@class status.measurement.buffer_available
status.measurement.buffer_available = {}


--- **This attribute contains the measurement event buffer available summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
--- 
--- --Sets the SMUA bit of the measurement event buffer available summary enable register.
--- ```
status.measurement.buffer_available.condition = 0



--- **This attribute contains the measurement event buffer available summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
--- 
--- --Sets the SMUA bit of the measurement event buffer available summary enable register.
--- ```
status.measurement.buffer_available.enable = 0



--- **This attribute contains the measurement event buffer available summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
--- 
--- --Sets the SMUA bit of the measurement event buffer available summary enable register.
--- ```
status.measurement.buffer_available.event = 0



--- **This attribute contains the measurement event buffer available summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
--- 
--- --Sets the SMUA bit of the measurement event buffer available summary enable register.
--- ```
status.measurement.buffer_available.ntr = 0



--- **This attribute contains the measurement event buffer available summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event buffer available summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event buffer available summary enable register, set status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27146.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.buffer_available.enable = status.measurement.buffer_available.SMUA
--- 
--- --Sets the SMUA bit of the measurement event buffer available summary enable register.
--- ```
status.measurement.buffer_available.ptr = 0

---@class status.measurement.current_limit
status.measurement.current_limit = {}


--- **This attribute contains the measurement event current limit summary registers.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
--- 
--- --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register.
--- ```
status.measurement.current_limit.condition = 0



--- **This attribute contains the measurement event current limit summary registers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
--- 
--- --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register.
--- ```
status.measurement.current_limit.enable = 0



--- **This attribute contains the measurement event current limit summary registers.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
--- 
--- --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register.
--- ```
status.measurement.current_limit.event = 0



--- **This attribute contains the measurement event current limit summary registers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
--- 
--- --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register.
--- ```
status.measurement.current_limit.ntr = 0



--- **This attribute contains the measurement event current limit summary registers.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event current limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For example, assume value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event current limit summary enable register, set status.measurement.current_limit.enable = status.measurement.current_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27165.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.current_limit.enable = status.measurement.current_limit.SMUA
--- 
--- --Sets the SMUA bit of the Measurement Event Current Limit Summary Enable Register.
--- ```
status.measurement.current_limit.ptr = 0

---@class status.measurement.instrument
status.measurement.instrument = {}


--- **This attribute contains the registers of the measurement event instrument summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
--- 
--- --Sets the SMU A bit of the measurement event instrument summary enable register using a constant.
--- ```
status.measurement.instrument.condition = 0



--- **This attribute contains the registers of the measurement event instrument summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
--- 
--- --Sets the SMU A bit of the measurement event instrument summary enable register using a constant.
--- ```
status.measurement.instrument.enable = 0



--- **This attribute contains the registers of the measurement event instrument summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
--- 
--- --Sets the SMU A bit of the measurement event instrument summary enable register using a constant.
--- ```
status.measurement.instrument.event = 0



--- **This attribute contains the registers of the measurement event instrument summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
--- 
--- --Sets the SMU A bit of the measurement event instrument summary enable register using a constant.
--- ```
status.measurement.instrument.ntr = 0



--- **This attribute contains the registers of the measurement event instrument summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event instrument summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 6 is returned for the enable register. The binary equivalent is 0000 0000 0000 0110. This value indicates that bit B1 (SMUA) and bit B2 (SMUB) are set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the measurement event instrument summary enable register, set status.measurement.instrument.enable = status.measurement.instrument.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27167.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.enable = status.measurement.instrument.SMUA
--- 
--- --Sets the SMU A bit of the measurement event instrument summary enable register using a constant.
--- ```
status.measurement.instrument.ptr = 0

---@class status.measurement.reading_overflow
status.measurement.reading_overflow = {}


--- **This attribute contains the measurement event reading overflow summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
--- 
--- --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant.
--- ```
status.measurement.reading_overflow.condition = 0



--- **This attribute contains the measurement event reading overflow summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
--- 
--- --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant.
--- ```
status.measurement.reading_overflow.enable = 0



--- **This attribute contains the measurement event reading overflow summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
--- 
--- --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant.
--- ```
status.measurement.reading_overflow.event = 0



--- **This attribute contains the measurement event reading overflow summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
--- 
--- --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant.
--- ```
status.measurement.reading_overflow.ntr = 0



--- **This attribute contains the measurement event reading overflow summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event reading overflow summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 2 is returned for the enable register. The binary equivalent is 0000 0000 0000 0010. This value indicates that bit B1 (SMUA) is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event reading overflow summary enable register, set status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA.In addition to the above constants, measurementRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27169.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.reading_overflow.enable = status.measurement.reading_overflow.SMUA
--- 
--- --Sets the SMU A bit of the measurement reading overflow summary enable register using a constant.
--- ```
status.measurement.reading_overflow.ptr = 0

---@class status.operation.calibrating
status.operation.calibrating = {}


--- **This attribute contains the operation status calibration summary register set.  **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
--- 
--- --Sets the SMUA bit of the operation status calibration summary enable register using a constant.
--- ```
status.operation.calibrating.condition = 0



--- **This attribute contains the operation status calibration summary register set.  **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
--- 
--- --Sets the SMUA bit of the operation status calibration summary enable register using a constant.
--- ```
status.operation.calibrating.enable = 0



--- **This attribute contains the operation status calibration summary register set.  **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
--- 
--- --Sets the SMUA bit of the operation status calibration summary enable register using a constant.
--- ```
status.operation.calibrating.event = 0



--- **This attribute contains the operation status calibration summary register set.  **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
--- 
--- --Sets the SMUA bit of the operation status calibration summary enable register using a constant.
--- ```
status.operation.calibrating.ntr = 0



--- **This attribute contains the operation status calibration summary register set.  **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27170.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.calibrating.enable = status.operation.calibrating.SMUA
--- 
--- --Sets the SMUA bit of the operation status calibration summary enable register using a constant.
--- ```
status.operation.calibrating.ptr = 0

---@class status.operation.measuring
status.operation.measuring = {}


--- **This attribute contains the operation status measuring summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27208.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.enable = status.operation.measuring.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status measuring summary enable register.
--- ```
status.operation.measuring.condition = 0



--- **This attribute contains the operation status measuring summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27208.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.enable = status.operation.measuring.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status measuring summary enable register.
--- ```
status.operation.measuring.enable = 0



--- **This attribute contains the operation status measuring summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27208.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.enable = status.operation.measuring.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status measuring summary enable register.
--- ```
status.operation.measuring.event = 0



--- **This attribute contains the operation status measuring summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27208.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.enable = status.operation.measuring.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status measuring summary enable register.
--- ```
status.operation.measuring.ntr = 0



--- **This attribute contains the operation status measuring summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status measuring summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the operation status measuring summary enable register, set status.operation.measuring.enable = status.operation.measuring.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27208.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.measuring.enable = status.operation.measuring.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status measuring summary enable register.
--- ```
status.operation.measuring.ptr = 0

---@class status.operation.sweeping
status.operation.sweeping = {}


--- **This attribute contains the operation status sweeping summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27209.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.enable = status.operation.sweeping.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status sweeping summary enable register.
--- ```
status.operation.sweeping.condition = 0



--- **This attribute contains the operation status sweeping summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27209.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.enable = status.operation.sweeping.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status sweeping summary enable register.
--- ```
status.operation.sweeping.enable = 0



--- **This attribute contains the operation status sweeping summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27209.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.enable = status.operation.sweeping.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status sweeping summary enable register.
--- ```
status.operation.sweeping.event = 0



--- **This attribute contains the operation status sweeping summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27209.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.enable = status.operation.sweeping.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status sweeping summary enable register.
--- ```
status.operation.sweeping.ntr = 0



--- **This attribute contains the operation status sweeping summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status sweeping summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status sweeping summary enable register, set status.operation.sweeping.enable = status.operation.sweeping.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set operationRegister to 6 (the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27209.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.sweeping.enable = status.operation.sweeping.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the operation status sweeping summary enable register.
--- ```
status.operation.sweeping.ptr = 0

---@class status.operation.trigger_overrun
status.operation.trigger_overrun = {}


--- **This attribute contains the operation status trigger overrun summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.trigger_overrun.SMUA + status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status trigger overrun summary enable register.
--- ```
status.operation.trigger_overrun.condition = 0



--- **This attribute contains the operation status trigger overrun summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.trigger_overrun.SMUA + status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status trigger overrun summary enable register.
--- ```
status.operation.trigger_overrun.enable = 0



--- **This attribute contains the operation status trigger overrun summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.trigger_overrun.SMUA + status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status trigger overrun summary enable register.
--- ```
status.operation.trigger_overrun.event = 0



--- **This attribute contains the operation status trigger overrun summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.trigger_overrun.SMUA + status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status trigger overrun summary enable register.
--- ```
status.operation.trigger_overrun.ntr = 0



--- **This attribute contains the operation status trigger overrun summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger overrun summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1,026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitThe bits in this register summarize events in other registers. A set bit in this summary register indicates that an enabled event in one of the summarized registers is set.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger overrun summary enable register, set status.operation.trigger_overrun.enable = status.operation.trigger_overrun.SMUA.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27210.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.trigger_overrun.SMUA + status.operation.trigger_overrun.TRGBLND
--- status.operation.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status trigger overrun summary enable register.
--- ```
status.operation.trigger_overrun.ptr = 0

---@class status.questionable.calibration
status.questionable.calibration = {}


--- **This attribute contains the questionable status calibration summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27211.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.enable = status.questionable.calibration.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status calibration summary enable register.
--- ```
status.questionable.calibration.condition = 0



--- **This attribute contains the questionable status calibration summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27211.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.enable = status.questionable.calibration.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status calibration summary enable register.
--- ```
status.questionable.calibration.enable = 0



--- **This attribute contains the questionable status calibration summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27211.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.enable = status.questionable.calibration.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status calibration summary enable register.
--- ```
status.questionable.calibration.event = 0



--- **This attribute contains the questionable status calibration summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27211.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.enable = status.questionable.calibration.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status calibration summary enable register.
--- ```
status.questionable.calibration.ntr = 0



--- **This attribute contains the questionable status calibration summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status calibration summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table. As an example, to set bit B1 of the questionable status calibration summary enable register, set status.questionable.calibration.enable = status.questionable.calibration.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27211.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.calibration.enable = status.questionable.calibration.SMUA
--- 
--- --Uses a constant to set the SMUA bit of the questionable status calibration summary enable register.
--- ```
status.questionable.calibration.ptr = 0

---@class status.questionable.over_temperature
status.questionable.over_temperature = {}


--- **This attribute contains the questionable status over temperature summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.enable = status.questionable.over_temperature.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status over temperature summary enable register.
--- ```
status.questionable.over_temperature.condition = 0



--- **This attribute contains the questionable status over temperature summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.enable = status.questionable.over_temperature.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status over temperature summary enable register.
--- ```
status.questionable.over_temperature.enable = 0



--- **This attribute contains the questionable status over temperature summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.enable = status.questionable.over_temperature.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status over temperature summary enable register.
--- ```
status.questionable.over_temperature.event = 0



--- **This attribute contains the questionable status over temperature summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.enable = status.questionable.over_temperature.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status over temperature summary enable register.
--- ```
status.questionable.over_temperature.ntr = 0



--- **This attribute contains the questionable status over temperature summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status over temperature summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the questionable status over temperature summary enable register, set status.questionable.instrument.enable = status.questionable.instrument.SMUA.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set questionableRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27213.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.questionable.over_temperature.enable = status.questionable.over_temperature.SMUA
--- 
--- --Uses a constant to set the SMU A bit in the questionable status over temperature summary enable register.
--- ```
status.questionable.over_temperature.ptr = 0

---@class status.measurement.voltage_limit
status.measurement.voltage_limit = {}


--- **This attribute contains the measurement event voltage limit summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27887.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
--- 
--- --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant.
--- ```
status.measurement.voltage_limit.condition = 0



--- **This attribute contains the measurement event voltage limit summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27887.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
--- 
--- --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant.
--- ```
status.measurement.voltage_limit.enable = 0



--- **This attribute contains the measurement event voltage limit summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27887.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
--- 
--- --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant.
--- ```
status.measurement.voltage_limit.event = 0



--- **This attribute contains the measurement event voltage limit summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27887.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
--- 
--- --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant.
--- ```
status.measurement.voltage_limit.ntr = 0



--- **This attribute contains the measurement event voltage limit summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes read or write to the measurement event voltage limit summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the measurement event voltage limit summary enable register, set status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B2, set measurementRegister to 6 (which is the sum of 2 + 4).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/27887.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.voltage_limit.enable = status.measurement.voltage_limit.SMUA
--- 
--- --Sets the SMUA bit of the measurement event voltage limit summary enable register using a constant.
--- ```
status.measurement.voltage_limit.ptr = 0

---@class status.operation.instrument.digio
status.operation.instrument.digio = {}


--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15836.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.enable = status.operation.instrument.digio.TRGOVR
--- 
--- --Uses a constant to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- status.operation.instrument.digio.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- ```
status.operation.instrument.digio.condition = 0



--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15836.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.enable = status.operation.instrument.digio.TRGOVR
--- 
--- --Uses a constant to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- status.operation.instrument.digio.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- ```
status.operation.instrument.digio.enable = 0



--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15836.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.enable = status.operation.instrument.digio.TRGOVR
--- 
--- --Uses a constant to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- status.operation.instrument.digio.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- ```
status.operation.instrument.digio.event = 0



--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15836.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.enable = status.operation.instrument.digio.TRGOVR
--- 
--- --Uses a constant to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- status.operation.instrument.digio.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- ```
status.operation.instrument.digio.ntr = 0



--- **This attribute contains the operation status digital I/O summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constant, operationRegister can be set to the decimal value of the bit to set.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15836.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.digio.enable = status.operation.instrument.digio.TRGOVR
--- 
--- --Uses a constant to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- status.operation.instrument.digio.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status digital I/O summary enable register.
--- ```
status.operation.instrument.digio.ptr = 0

---@class status.operation.instrument.lan
status.operation.instrument.lan = {}


--- **This attribute contains the operation status LAN summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15838.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.CONF +
---    status.operation.instrument.lan.TRGOVR
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- operationRegister = 1026
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- ```
status.operation.instrument.lan.condition = 0



--- **This attribute contains the operation status LAN summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15838.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.CONF +
---    status.operation.instrument.lan.TRGOVR
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- operationRegister = 1026
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- ```
status.operation.instrument.lan.enable = 0



--- **This attribute contains the operation status LAN summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15838.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.CONF +
---    status.operation.instrument.lan.TRGOVR
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- operationRegister = 1026
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- ```
status.operation.instrument.lan.event = 0



--- **This attribute contains the operation status LAN summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15838.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.CONF +
---    status.operation.instrument.lan.TRGOVR
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- operationRegister = 1026
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- ```
status.operation.instrument.lan.ntr = 0



--- **This attribute contains the operation status LAN summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN summary registers. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status LAN summary enable register, set status.operation.instrument.lan.enable = status.operation.instrument.lan.CON.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15838.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.CONF +
---    status.operation.instrument.lan.TRGOVR
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- operationRegister = 1026
--- status.operation.instrument.lan.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B10 of the operation status LAN summary enable register.
--- ```
status.operation.instrument.lan.ptr = 0

---@class status.operation.instrument.smua
status.operation.instrument.smua = {}


--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smua.condition = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smua.enable = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smua.event = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smua.ntr = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smua.ptr = 0

---@class status.operation.instrument.smub
status.operation.instrument.smub = {}


--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smub.condition = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smub.enable = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smub.event = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smub.ntr = 0



--- **This attribute contains the operation status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. The binary equivalent of the value indicates which register bits are set. In the binary equivalent, the least significant bit is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02500e+02 (which is 1,025) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B0 and bit B10 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the operation status SMU A summary enable register, set status.operation.instrument.smua.enable = status.operation.instrument.smua.CAL.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B0 and B10, set operationRegister to 1,025 (which is the sum of 1 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15840.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.enable = status.operation.instrument.smua.MEAS
--- 
--- --Use a constant to set bit B4 of the operation status SMU A summary enable register.
--- status.operation.instrument.smua.enable = 1025
--- 
--- --Use the decimal value to set bits B0 and B10 of the operation status SMU A summary enable register.
--- ```
status.operation.instrument.smub.ptr = 0

---@class status.operation.instrument.trigger_blender
status.operation.instrument.trigger_blender = {}


--- **This attribute contains the operation status trigger blender summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15842.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.enable = 1024
--- 
--- --Uses a decimal value to set the TRGOVR bit of the operation status trigger blender summary enable.
--- ```
status.operation.instrument.trigger_blender.condition = 0



--- **This attribute contains the operation status trigger blender summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15842.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.enable = 1024
--- 
--- --Uses a decimal value to set the TRGOVR bit of the operation status trigger blender summary enable.
--- ```
status.operation.instrument.trigger_blender.enable = 0



--- **This attribute contains the operation status trigger blender summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15842.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.enable = 1024
--- 
--- --Uses a decimal value to set the TRGOVR bit of the operation status trigger blender summary enable.
--- ```
status.operation.instrument.trigger_blender.event = 0



--- **This attribute contains the operation status trigger blender summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15842.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.enable = 1024
--- 
--- --Uses a decimal value to set the TRGOVR bit of the operation status trigger blender summary enable.
--- ```
status.operation.instrument.trigger_blender.ntr = 0



--- **This attribute contains the operation status trigger blender summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15842.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.enable = 1024
--- 
--- --Uses a decimal value to set the TRGOVR bit of the operation status trigger blender summary enable.
--- ```
status.operation.instrument.trigger_blender.ptr = 0

---@class status.operation.instrument.trigger_timer
status.operation.instrument.trigger_timer = {}


--- **This attribute contains the operation status trigger timer summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15844.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status trigger timer summary enable register.
--- ```
status.operation.instrument.trigger_timer.condition = 0



--- **This attribute contains the operation status trigger timer summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15844.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status trigger timer summary enable register.
--- ```
status.operation.instrument.trigger_timer.enable = 0



--- **This attribute contains the operation status trigger timer summary register set. **
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15844.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status trigger timer summary enable register.
--- ```
status.operation.instrument.trigger_timer.event = 0



--- **This attribute contains the operation status trigger timer summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15844.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status trigger timer summary enable register.
--- ```
status.operation.instrument.trigger_timer.ntr = 0



--- **This attribute contains the operation status trigger timer summary register set. **
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15844.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.enable = 1024
--- 
--- --Uses the decimal value to set the TRGOVR bit of the operation status trigger timer summary enable register.
--- ```
status.operation.instrument.trigger_timer.ptr = 0

---@class status.operation.instrument.tsplink
status.operation.instrument.tsplink = {}


--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15846.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.enable = 1024
--- 
--- --Uses the decimal value to set the trigger overrun bit of the operation status TSP-Link summary enable register.
--- ```
status.operation.instrument.tsplink.condition = 0



--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15846.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.enable = 1024
--- 
--- --Uses the decimal value to set the trigger overrun bit of the operation status TSP-Link summary enable register.
--- ```
status.operation.instrument.tsplink.enable = 0



--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15846.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.enable = 1024
--- 
--- --Uses the decimal value to set the trigger overrun bit of the operation status TSP-Link summary enable register.
--- ```
status.operation.instrument.tsplink.event = 0



--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15846.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.enable = 1024
--- 
--- --Uses the decimal value to set the trigger overrun bit of the operation status TSP-Link summary enable register.
--- ```
status.operation.instrument.tsplink.ntr = 0



--- **This attribute contains the operation status TSP-Link summary register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-Link summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. For example, to set bit B10, set operationRegister to 1024.
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15846.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.enable = 1024
--- 
--- --Uses the decimal value to set the trigger overrun bit of the operation status TSP-Link summary enable register.
--- ```
status.operation.instrument.tsplink.ptr = 0

---@class status.questionable.instrument.smua
status.questionable.instrument.smua = {}


--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smua.condition = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smua.enable = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smua.event = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smua.ntr = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smua.ptr = 0

---@class status.questionable.instrument.smub
status.questionable.instrument.smub = {}


--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smub.condition = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smub.enable = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smub.event = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smub.ntr = 0



--- **This attribute contains the questionable status SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the questionable status instrument SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 7.68000e+02 (which is 768) is read as the value of the condition register, the binary equivalent is 0000 0011 0000 0000. This value indicates that bit B8 and bit B9 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B8 of the questionable status SMU A summary enable register, set status.questionable.instrument.smua.enable = status.questionable.instrument.smua.CAL.In addition to the above constants, questionableRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set questionableRegister to the sum of their decimal weights. For example, to set bits B8 and B9, set questionableRegister to 768 (which is the sum of 256 + 512).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15856.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- questionableRegister = status.questionable.instrument.smua.CAL +
---    status.questionable.instrument.smua.UO
--- status.questionable.instrument.smua.enable = questionableRegister
--- 
--- --Uses constants to set bit B8 and bit B9 of the questionable status SMU A summary enable register.
--- ```
status.questionable.instrument.smub.ptr = 0

---@class status.measurement.instrument.smua
status.measurement.instrument.smua = {}


--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smua.condition = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smua.enable = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smua.event = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smua.ntr = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smua.ptr = 0

---@class status.measurement.instrument.smub
status.measurement.instrument.smub = {}


--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smub.condition = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smub.enable = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smub.event = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smub.ntr = 0



--- **This attribute contains the registers of the measurement event SMU X summary register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the measurement event SMU X summary registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, assume the value 257 is returned for the enable register. The binary equivalent is 0000 0001 0000 0001. This value indicates that bit B0 (VLMT) and bit B8 (BAV) are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B0 of the measurement event SMU X summary enable register, set status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT.In addition to the above constants, measurementRegister can be set to the decimal equivalent of the bit to set. To set more than one bit of the register, set measurementRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set measurementRegister to 258 (which is the sum of 2 + 256). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/28238.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.measurement.instrument.smua.enable = status.measurement.instrument.smua.VLMT
--- 
--- --Sets the VLMT bit of the measurement event SMU A summary enable register using a constant.
--- ```
status.measurement.instrument.smub.ptr = 0

---@class status.operation.instrument.digio.trigger_overrun
status.operation.instrument.digio.trigger_overrun = {}


--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15837.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.digio.trigger_overrun.LINE1 +
---    status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- operationRegister = 1026
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses the decimal value to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- ```
status.operation.instrument.digio.trigger_overrun.condition = 0



--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15837.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.digio.trigger_overrun.LINE1 +
---    status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- operationRegister = 1026
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses the decimal value to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- ```
status.operation.instrument.digio.trigger_overrun.enable = 0



--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15837.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.digio.trigger_overrun.LINE1 +
---    status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- operationRegister = 1026
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses the decimal value to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- ```
status.operation.instrument.digio.trigger_overrun.event = 0



--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15837.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.digio.trigger_overrun.LINE1 +
---    status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- operationRegister = 1026
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses the decimal value to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- ```
status.operation.instrument.digio.trigger_overrun.ntr = 0



--- **This attribute contains the operation status digital I/O overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status digital I/O overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 1.02600e+03 (which is 1026) is read as the value of the condition register, the binary equivalent is 0000 0100 0000 0010. This value indicates that bit B1 and bit B10 are set.* Least significant bit** Most significant bitA set bit indicates that the specified digital I/O line generated an action overrun when it was triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status digital I/O overrun enable register, set status.operation.instrument.digio.trigger_overrun.enable = status.operation.instrument.digio.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal values. For example, to set bits B1 and B10, set operationRegister to 1,026 (which is the sum of 2 + 1,024). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15837.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.digio.trigger_overrun.LINE1 +
---    status.operation.instrument.digio.trigger_overrun.LINE10
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses constants to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- operationRegister = 1026
--- status.operation.instrument.digio.trigger_overrun.enable = operationRegister
--- 
--- --Uses the decimal value to set bit B1 and bit B10 of the operation status digital I/O overrun enable register.
--- ```
status.operation.instrument.digio.trigger_overrun.ptr = 0

---@class status.operation.instrument.lan.trigger_overrun
status.operation.instrument.lan.trigger_overrun = {}


--- **This attribute contains the operation status LAN trigger overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15839.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.trigger_overrun.LAN1 +
---    status.operation.instrument.lan.trigger_overrun.LAN8
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- operationRegister = 258
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- ```
status.operation.instrument.lan.trigger_overrun.condition = 0



--- **This attribute contains the operation status LAN trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15839.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.trigger_overrun.LAN1 +
---    status.operation.instrument.lan.trigger_overrun.LAN8
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- operationRegister = 258
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- ```
status.operation.instrument.lan.trigger_overrun.enable = 0



--- **This attribute contains the operation status LAN trigger overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15839.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.trigger_overrun.LAN1 +
---    status.operation.instrument.lan.trigger_overrun.LAN8
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- operationRegister = 258
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- ```
status.operation.instrument.lan.trigger_overrun.event = 0



--- **This attribute contains the operation status LAN trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15839.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.trigger_overrun.LAN1 +
---    status.operation.instrument.lan.trigger_overrun.LAN8
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- operationRegister = 258
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- ```
status.operation.instrument.lan.trigger_overrun.ntr = 0



--- **This attribute contains the operation status LAN trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status LAN trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 2.58000e+02 (which is 258) is read as the value of the condition register, the binary equivalent is 0000 0001 0000 0010. This value indicates that bit B1 and bit B8 are set.* Least significant bit** Most significant bitA set bit indicates that the specified LAN trigger generated an action overrun when triggered to generate a trigger packet.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status LAN trigger overrun enable register, set status.operation.instrument.lan.trigger_overrun.enable = status.operation.instrument.lan.trigger_overrun.LAN1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B8, set operationRegister to 258 (which is the sum of 2 + 256).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15839.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- operationRegister = status.operation.instrument.lan.trigger_overrun.LAN1 +
---    status.operation.instrument.lan.trigger_overrun.LAN8
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use constants to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- operationRegister = 258
--- status.operation.instrument.lan.trigger_overrun.enable = operationRegister
--- 
--- --Use the decimal value to set bit B1 and bit B8 of the operation status LAN trigger overrun enable register.
--- ```
status.operation.instrument.lan.trigger_overrun.ptr = 0

---@class status.operation.instrument.smua.trigger_overrrun
status.operation.instrument.smua.trigger_overrrun = {}


--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smua.trigger_overrrun.condition = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smua.trigger_overrrun.enable = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smua.trigger_overrrun.event = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smua.trigger_overrrun.ntr = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smua.trigger_overrrun.ptr = 0

---@class status.operation.instrument.smub.trigger_overrrun
status.operation.instrument.smub.trigger_overrrun = {}


--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smub.trigger_overrrun.condition = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smub.trigger_overrrun.enable = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smub.trigger_overrrun.event = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smub.trigger_overrrun.ntr = 0



--- **This attribute contains the operation status SMU X trigger overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status SMU X trigger overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitFor information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status SMU A trigger overrun enable register, set status.operation.instrument.smua.trigger_overrun.enable =     status.operation.instrument.smua.trigger_overrun.ARM.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15841.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.smua.trigger_overrun.enable =
---    status.operation.instrument.smua.trigger_overrun.ARM
--- 
--- --Uses a constant to sets the ARM bit of the operation status SMU A trigger overrun enable register.
--- status.operation.instrument.smua.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set bits B1 and B4 of the operation status SMU A trigger overrun enable register.
--- ```
status.operation.instrument.smub.trigger_overrrun.ptr = 0

---@class status.operation.instrument.trigger_timer.trigger_overrun
status.operation.instrument.trigger_timer.trigger_overrun = {}


--- **This attribute contains the operation status trigger timer overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15845.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.enable =
---    status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- 
--- --Uses a constant to set the timer 3 bit of the operation status trigger timer overrun enable register.
--- status.operation.instrument.trigger_timer.trigger_overrun.enable = 18
--- 
--- --Uses a constant to set timer bits B1 and B4 of the operation status trigger timer overrun enable register.
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.condition = 0



--- **This attribute contains the operation status trigger timer overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15845.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.enable =
---    status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- 
--- --Uses a constant to set the timer 3 bit of the operation status trigger timer overrun enable register.
--- status.operation.instrument.trigger_timer.trigger_overrun.enable = 18
--- 
--- --Uses a constant to set timer bits B1 and B4 of the operation status trigger timer overrun enable register.
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.enable = 0



--- **This attribute contains the operation status trigger timer overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15845.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.enable =
---    status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- 
--- --Uses a constant to set the timer 3 bit of the operation status trigger timer overrun enable register.
--- status.operation.instrument.trigger_timer.trigger_overrun.enable = 18
--- 
--- --Uses a constant to set timer bits B1 and B4 of the operation status trigger timer overrun enable register.
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.event = 0



--- **This attribute contains the operation status trigger timer overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15845.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.enable =
---    status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- 
--- --Uses a constant to set the timer 3 bit of the operation status trigger timer overrun enable register.
--- status.operation.instrument.trigger_timer.trigger_overrun.enable = 18
--- 
--- --Uses a constant to set timer bits B1 and B4 of the operation status trigger timer overrun enable register.
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.ntr = 0



--- **This attribute contains the operation status trigger timer overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger timer overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit indicates the specified timer generated an action overrun because it was still processing a delay from a previous trigger when a new trigger was received.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger timer trigger overrun enable register, set status.operation.instrument.trigger_timer.trigger_overrun.enable = status.operation.instrument.trigger_timer.trigger_overrun.TMR1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15845.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_timer.trigger_overrun.enable =
---    status.operation.instrument.trigger_timer.trigger_overrun.TMR3
--- 
--- --Uses a constant to set the timer 3 bit of the operation status trigger timer overrun enable register.
--- status.operation.instrument.trigger_timer.trigger_overrun.enable = 18
--- 
--- --Uses a constant to set timer bits B1 and B4 of the operation status trigger timer overrun enable register.
--- ```
status.operation.instrument.trigger_timer.trigger_overrun.ptr = 0

---@class status.operation.instrument.tsplink.trigger_overrun
status.operation.instrument.tsplink.trigger_overrun = {}


--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15847.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.enable =
---    status.operation.instrument.tsplink.trigger_overrun.LINE1
--- 
--- --Uses a constant to set the line 1 bit of the operation status TSP-Link overrun enable register.
--- status.operation.instrument.tsplink.trigger_overrun.enable = 10
--- 
--- --Uses the decimal value to set bits for lines 1 and 3 of the operation status TSP-Link overrun enable register.
--- ```
status.operation.instrument.tsplink.trigger_overrun.condition = 0



--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15847.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.enable =
---    status.operation.instrument.tsplink.trigger_overrun.LINE1
--- 
--- --Uses a constant to set the line 1 bit of the operation status TSP-Link overrun enable register.
--- status.operation.instrument.tsplink.trigger_overrun.enable = 10
--- 
--- --Uses the decimal value to set bits for lines 1 and 3 of the operation status TSP-Link overrun enable register.
--- ```
status.operation.instrument.tsplink.trigger_overrun.enable = 0



--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15847.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.enable =
---    status.operation.instrument.tsplink.trigger_overrun.LINE1
--- 
--- --Uses a constant to set the line 1 bit of the operation status TSP-Link overrun enable register.
--- status.operation.instrument.tsplink.trigger_overrun.enable = 10
--- 
--- --Uses the decimal value to set bits for lines 1 and 3 of the operation status TSP-Link overrun enable register.
--- ```
status.operation.instrument.tsplink.trigger_overrun.event = 0



--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15847.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.enable =
---    status.operation.instrument.tsplink.trigger_overrun.LINE1
--- 
--- --Uses a constant to set the line 1 bit of the operation status TSP-Link overrun enable register.
--- status.operation.instrument.tsplink.trigger_overrun.enable = 10
--- 
--- --Uses the decimal value to set bits for lines 1 and 3 of the operation status TSP-Link overrun enable register.
--- ```
status.operation.instrument.tsplink.trigger_overrun.ntr = 0



--- **This attribute contains the operation status TSP-Link overrun register set. This command is not available on the 2604B, 2614B, or 2634B.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status TSP-link overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 10 is read as the value of the condition register, the binary equivalent is 0000 0000 0000 1010. This value indicates that bit B1 and bit B3 are set.* Least significant bit** Most significant bitA set bit indicates that the specified line generated an action overrun when triggered to generate an output trigger.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status TSP-Link overrun enable register, set status.operation.instrument.tsplink.trigger_overrun.enable = status.operation.instrument.tsplink.trigger_overrun.LINE1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B3, set operationRegister to 10 (which is the sum of 2 + 8). 
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/15847.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.tsplink.trigger_overrun.enable =
---    status.operation.instrument.tsplink.trigger_overrun.LINE1
--- 
--- --Uses a constant to set the line 1 bit of the operation status TSP-Link overrun enable register.
--- status.operation.instrument.tsplink.trigger_overrun.enable = 10
--- 
--- --Uses the decimal value to set bits for lines 1 and 3 of the operation status TSP-Link overrun enable register.
--- ```
status.operation.instrument.tsplink.trigger_overrun.ptr = 0

---@class status.operation.instrument.trigger_blender.trigger_overrun
status.operation.instrument.trigger_blender.trigger_overrun = {}


--- **This attribute contains the operation status trigger blender overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29234.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.enable
---    = status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- 
--- --Uses the constant to set the bit for blender 1 of the operation status trigger blender overrun enable register.
--- status.operation.instrument.trigger_blender.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set the bits for blenders 1 and 4 of the operation status trigger blender overrun enable register.
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.condition = 0



--- **This attribute contains the operation status trigger blender overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29234.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.enable
---    = status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- 
--- --Uses the constant to set the bit for blender 1 of the operation status trigger blender overrun enable register.
--- status.operation.instrument.trigger_blender.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set the bits for blenders 1 and 4 of the operation status trigger blender overrun enable register.
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.enable = 0



--- **This attribute contains the operation status trigger blender overrun register set.**
---
--- *Type:*  Attribute_RO
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29234.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.enable
---    = status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- 
--- --Uses the constant to set the bit for blender 1 of the operation status trigger blender overrun enable register.
--- status.operation.instrument.trigger_blender.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set the bits for blenders 1 and 4 of the operation status trigger blender overrun enable register.
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.event = 0



--- **This attribute contains the operation status trigger blender overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29234.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.enable
---    = status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- 
--- --Uses the constant to set the bit for blender 1 of the operation status trigger blender overrun enable register.
--- status.operation.instrument.trigger_blender.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set the bits for blenders 1 and 4 of the operation status trigger blender overrun enable register.
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.ntr = 0



--- **This attribute contains the operation status trigger blender overrun register set.**
---
--- *Type:*  Attribute_RW
---
--- *Details:*<br>
--- These attributes are used to read or write to the operation status trigger blender overrun registers. Reading a status register returns a value. The binary equivalent of the returned value indicates which register bits are set. The least significant bit of the binary number is bit B0, and the most significant bit is bit B15. For example, if a value of 18 is read as the value of the condition register, the binary equivalent is 0000 0000 0001 0010. This value indicates that bit B1 and bit B4 are set.* Least significant bit** Most significant bitA set bit value indicates that the specified trigger blender generated an action overrun.For information about .condition, .enable, .event, .ntr, and .ptr registers, refer to Status register set contents and Enable and transition registers. The individual bits of this register are defined in the following table.As an example, to set bit B1 of the operation status trigger blender overrun enable register, set status.operation.instrument.trigger_blender.trigger_overrun.enable = status.operation.instrument.trigger_blender.trigger_overrun.BLND1.In addition to the above constants, operationRegister can be set to the numeric equivalent of the bit to set. To set more than one bit of the register, set operationRegister to the sum of their decimal weights. For example, to set bits B1 and B4, set operationRegister to 18 (which is the sum of 2 + 16).
---
---[command help](command:kic.viewHelpDocument?["Commands_26XX/29234.htm"])
---
---<br>*Examples:*<br>
--- ```lua
--- status.operation.instrument.trigger_blender.trigger_overrun.enable
---    = status.operation.instrument.trigger_blender.trigger_overrun.BLND1
--- 
--- --Uses the constant to set the bit for blender 1 of the operation status trigger blender overrun enable register.
--- status.operation.instrument.trigger_blender.trigger_overrun.enable = 18
--- 
--- --Uses the decimal value to set the bits for blenders 1 and 4 of the operation status trigger blender overrun enable register.
--- ```
status.operation.instrument.trigger_blender.trigger_overrun.ptr = 0



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
