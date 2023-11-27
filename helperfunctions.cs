using System.IO;
namespace jsonToLuaParser
{
    public class HelperFunctions
    {
        public static string DigioTriggerModeEnum()
        {
            return
            "digio.TRIG_FALLING = 1\n"
            + "digio.TRIG_RISING = 2\n"
            + "digio.TRIG_EITHER = 3\n"
            + "digio.TRIG_SYNCHRONOUSA = 4\n"
            + "digio.TRIG_SYNCHRONOUS = 5\n"
            + "digio.TRIG_SYNCHRONOUSM = 6\n"
            + "digio.TRIG_RISINGA = 7\n"
            + "digio.TRIG_RISINGM = 8\n"
            + "\n"
            + "---@alias DigioTriggerMode\n"
            + "---|`digio.TRIG_BYPASS` #Allows direct control of the line.\n"
            + "---|`digio.TRIG_FALLING` #Detects falling edge triggers as input; asserts a TTL-low pulse for output.\n"
            + "---|`digio.TRIG_RISING` #If the programmed state of the line is high, the digio.TRIG_RISING mode behavior is similar to digio.TRIG_RISINGA. If the programmed state of the line is low, the *digio.TRIG_RISING* mode behavior is similar to *digio.TRIG_RISINGM*.\n"
            + "---|`digio.TRIG_EITHER` #Detects rising- or falling edge triggers as input. Asserts a TTLlow pulse for output.\n"
            + "---|`digio.TRIG_SYNCHRONOUSA` #Detects the falling edge input triggers and automatically latches and drives the trigger line low. Asserting the output trigger releases the latched line.\n"
            + "---|`digio.TRIG_SYNCHRONOUS` #Detects the falling edge input triggers and automatically latches and drives the trigger line low. Asserts a TTL low pulse as an output trigger.\n"
            + "---|`digio.TRIG_SYNCHRONOUSM` #Detects rising edge triggers as input. Asserts a TTL low pulse for output.\n"
            + "---|`digio.TRIG_RISINGA` #Detects rising edge triggers as input. Asserts a TTL low pulse for output.\n"
            + "---|`digio.TRIG_RISINGM` #Asserts a TTL-high pulse for output. Input edge detection is not possible in this mode.\n"
            + "\n";
        }
        public static string TspLinkTriggerModeEnum()
        {
            return "tsplink.TRIG_BYPASS = 0\n"
            + "tsplink.TRIG_FALLING = 1\n"
            + "tsplink.TRIG_RISING = 2\n"
            + "tsplink.TRIG_EITHER = 3\n"
            + "tsplink.TRIG_SYNCHRONOUSA = 4\n"
            + "tsplink.TRIG_SYNCHRONOUS = 5\n"
            + "tsplink.TRIG_SYNCHRONOUSM = 6\n"
            + "tsplink.TRIG_RISINGA = 7\n"
            + "tsplink.TRIG_RISINGM = 8\n"
            + "\n"
            + "---@alias TspLinkTriggerMode\n"
            + "---|`tsplink.TRIG_BYPASS` #Allows direct control of the line as a digital I/O line.\n"
            + "---|`tsplink.TRIG_FALLING` #Detects falling edge triggers as input. Asserts a TTL-low pulse for output.\n"
            + "---|`tsplink.TRIG_RISING` #If the programmed state of the line is high, the *tsplink.TRIG_RISING* mode behaves similarly to *tsplink.TRIG_RISINGA.*<br>If the programmed state of the line is low, the tsplink.TRIG_RISING mode behaves similarly to *tsplink.TRIG_RISINGM* <br>Use *tsplink.TRIG_RISINGA* if the line is in the high output state.<br>Use *tsplink.TRIG_RISINGM* if the line is in the low output state.\n"
            + "---|`tsplink.TRIG_EITHER` #Detects rising or falling edge triggers as input. Asserts a TTL low pulse for output.\n"
            + "---|`tsplink.TRIG_SYNCHRONOUSA` #Detects the falling edge input triggers and automatically latches and drives the trigger line low.\n"
            + "---|`tsplink.TRIG_SYNCHRONOUS` #Detects the falling edge input triggers and automatically latches and drives the trigger line low. Asserts a TTL-low pulse as an output trigger.\n"
            + "---|`tsplink.TRIG_SYNCHRONOUSM` #Detects rising edge triggers as an input. Asserts a TTL low pulse for output.\n"
            + "---|`tsplink.TRIG_RISINGA` #Detects rising edge triggers as input. Asserts a TTL low pulse for output.\n"
            + "---|`tsplink.TRIG_RISINGM` #Edge detection as an input is not available. Generates a TTL high pulse as an output trigger.\n\n";
        }

        public static string LanTriggerModeEnum()
        {
            return "lan.TRIG_EITHER = 0\n"
            + "lan.TRIG_FALLING = 1\n"
            + "lan.TRIG_RISING = 2\n"
            + "lan.TRIG_RISINGA = 3\n"
            + "lan.TRIG_RISINGM = 4\n"
            + "lan.TRIG_SYNCHRONOUS = 5\n"
            + "lan.TRIG_SYNCHRONOUSA = 4\n"
            + "lan.TRIG_SYNCHRONOUSM = 6\n\n"
            + "---@alias LanTriggerMode\n"
            + "---|`lan.TRIG_EITHER` #Rising or falling edge (positive or negative state)\n"
            + "---|`lan.TRIG_FALLING` #Falling edge (negative state)\n"
            + "---|`lan.TRIG_RISING` #Rising edge (positive state)\n"
            + "---|`lan.TRIG_RISINGA` #Rising edge (positive state)\n"
            + "---|`lan.TRIG_RISINGM` #Rising edge (positive state)\n"
            + "---|`lan.TRIG_SYNCHRONOUS` #Falling edge (negative state)\n"
            + "---|`lan.TRIG_SYNCHRONOUSA` #Falling edge (negative state)\n"
            + "---|`lan.TRIG_SYNCHRONOUSM` #Rising edge (positive state)\n\n";
        }

        public static string DisplaySMUDigitsEnum()
        {
            return "display.DIGITS_4_5 = 4\n"
            + "display.DIGITS_5_5 = 5\n"
            + "display.DIGITS_6_5 = 6\n"
            + "---@alias displaysmubdigits\n"
            + "---|`display.DIGITS_4_5` #Select 4½ digit resolution\n"
            + "---|`display.DIGITS_5_5` #Select 5½ digit resolution\n"
            + "---|`display.DIGITS_6_5` #Select 6½ digit resolution\n\n"
            + "---@alias displaysmuadigits\n"
            + "---|`display.DIGITS_4_5` #Select 4½ digit resolution\n"
            + "---|`display.DIGITS_5_5` #Select 5½ digit resolution\n"
            + "---|`display.DIGITS_6_5` #Select 6½ digit resolution\n\n";
        }

        public static string SerialParityEnum()
        {
            return "serial.PARITY_NONE = \"none\""
            + "serial.PARITY_EVEN = \"even\""
            + "serial.PARITY_ODD = \"odd\""
            + "---@alias serialparity\n"
            + "---|`serial.PARITY_NONE` #Select no parity\n"
            + "---|`serial.PARITY_EVEN` #Select even parity\n"
            + "---|`serial.PARITY_ODD` #Select odd parity\n";
        }

        public static string SerialFlowControlEnum()
        {
            return "serial.FLOW_NONE = \"none\""
            + "serial.FLOW_HARDWARE = \"even\""            
            + "---@alias serialflowcontrol\n"
            + "---|`serial.FLOW_NONE` #selects no flow control\n"
            + "---|`serial.FLOW_HARDWARE` #selects hardware flow control\n";
        }
        public static string DisplayLoadMenuCatalog()
        {
           return "---**This function creates an iterator for the user menu items accessed using the LOAD key on the front panel**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Each time through the loop, displayName and code take on the values in the USER menu.The instrument goes through the list in random order.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14705.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- for displayName, code in display.loadmenu.catalog() do\n"
            + "---    print(displayName, code) "
            + "--- --Asserts a trigger on digital I/O line 2.\n"
            + "--- end"
            + "--- ```\n"
            + "---@return nil\n"
            + "function display.loadmenu.catalog() end\n\n";
        }

        public static string SerialFlowControl()
        {
            return "";
        }

        public static string LanTriggerProtocolEnum()
        {
            return "lan.TCP = 0\n"
            + "lan.UDP = 1\n"
            + "lan.MULTICAST = 2\n\n"
            + "---@alias LanTriggerProtocol\n"
            + "---|`lan.TCP` \n"
            + "---|`lan.UDP` \n"
            + "---|`lan.MULTICAST` \n\n";
        }

        public static string DigioTriggerClass()
        {
            return "---@class DigioTrigger\n" +
            //"---@field pulsewidth number\n" +
            "local DigioTrigger = {}\n\n"

            //assert()
            + "---**This function asserts a trigger pulse on one of the digital I/O lines**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The pulse width that is set determines how long the instrument asserts the trigger.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14670.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[2].assert()\n"
            + "--- --Asserts a trigger on digital I/O line 2.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "DigioTrigger.assert =  function () end\n\n"

            //clear()
            + "---**This function clears the trigger event on a digital I/O line**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The event detector of a trigger enters the detected state when an event is detected. It is cleared when ```lua digio.trigger[N].wait()``` or ```lua digio.trigger[N].clear()``` is called. ```lua digio.trigger[N].clear()``` clears the event detector of the specified trigger line, discards the history of the trigger line, and clears the ```lua digio.trigger[N].overrun``` attribute.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14671.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[2].clear()\n"
            + "--- --Clears the trigger event detector on I/O line 2.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "DigioTrigger.clear = function () end\n\n"

            //EVENT_ID
            + "--- **This constant identifies the trigger event generated by the digital I/O line **\n---\n--- *Type:*  Constant\n---\n--- *Details:*<br>\n--- To have another trigger object respond to trigger events generated by the trigger line, set the stimulus attribute of the other object to the value of this constant.\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- digio.trigger[5].stimulus = digio.trigger[3].EVENT_ID\n---  --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for digital I/O trigger line 5.\n--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14672.htm" + "\"])" + "\n---\n"
            + "---@type eventID\n"
            + "DigioTrigger.EVENT_ID = nil\n\n";            
        }

         public static string DigioTriggerClassModelException()
         {
            //mode
            return "--- **This attribute sets the mode in which the trigger event detector and the output trigger generator operate on the given trigger line. This command is not available on the 2604B, 2614B, or 2634B.**\n---\n--- *Type:*  Attribute_RW\n---\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- digio.trigger[4].mode = 2\n--- ```\n --- --Sets the trigger mode for I/O line 4 to```lua digio.TRIG_RISING ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14674.htm" + "\"])" + "\n---\n"
            + "---@type DigioTriggerMode\n"
            + "DigioTrigger.mode = 'digio.TRIG_BYPASS'\n\n"

            //overrun
            + "--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**\n---\n--- *Type:*  Attribute_RO\n---\n--- *Details:*<br>\n--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- overrun = digio.trigger[1].overrun\n--- print(overrun)\n---  --If there is no trigger overrun, the following text is output: false\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14675.htm" + "\"])" + "\n---\n"
            + "---@type boolean Trigger overrun state (true or false)\n"
            + "DigioTrigger.overrun = false\n\n"

            //pulsewidth
            + " ---**This attribute describes the length of time that the trigger line is asserted for output triggers. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely. To release the trigger line, use digio.trigger[N].release().\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17691.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[4].pulsewidth = 20e-6\n"
            + "--- --Sets the pulse width for trigger line 4 to 20 μs.\n"
            + "--- ```\n"
            + "---@type number\n"
            + "DigioTrigger.pulsewidth = 0.0\n\n"

            //release()
            + "--- **This function releases an indefinite length or latched trigger. This command is not available on the 2604B, 2614B, or 2634B.**"
            + "\n---\n--- *Type:*  Function"
            + "\n---\n--- *Details:*<br>"
            + "Releases a trigger that was asserted with an indefinite pulsewidth time. It also releases a trigger that was latched in response to receiving a synchronous mode trigger. Only the specified trigger line is affected.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14677.htm" + "\"])" + "\n---\n"
            + "\n---\n---<br>*Examples:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[4].release()\n"
            + "---  --Releases digital I/O trigger line 4.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "DigioTrigger.release = function () end\n\n"

            //reset()
            + " ---**This function resets trigger values to their factory defaults. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17719.htm" + "\"])" + "\n---\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[3].mode = 2\n"
            + "--- digio.trigger[3].pulsewidth = 50e-6\n"
            + "--- digio.trigger[3].stimulus = digio.trigger[5].EVENT_ID\n"
            + "--- print(digio.trigger[3].mode, digio.trigger[3].pulsewidth, digio.trigger[3].stimulus)\n"
            + "--- digio.trigger[3].reset()\n"
            + "--- print(digio.trigger[3].mode, digio.trigger[3].pulsewidth, digio.trigger[3].stimulus)\n"
            + "--- --Set the digital I/O trigger line 3 for a falling edge with a pulsewidth of 50 µs. Use digital I/O line 5 to trigger the event on line 3. Reset the line back to factory default values. Output before reset: Output after reset:\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "DigioTrigger.reset = function() end\n\n"

            //stimulus
            + "---**This attribute selects the event that causes a trigger to be asserted on the digital output line. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Set this attribute to zero (0) to disable the automatic trigger output. <br> Do not use this attribute to generate output triggers under script control. Use ``` lua digio.trigger[N].assert()``` instead.<br>The trigger stimulus for a digital I/O line may be set to one of the existing trigger event IDs described in the following table.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "26898.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[3].stimulus = 0\n"
            + "--- --Clear the trigger stimulus of digital I/O line 3. \n"
            + "--- digio.trigger[3].stimulus = smua.trigger.SOURCE_COMPLETE_EVENT_ID\n"
            + "--- --Set the trigger stimulus of digital I/O line 3 to be the source complete event. \n"
            + "--- ```\n"
            + " ---@type eventID | 0\n"
            + "DigioTrigger.stimulus = 0\n\n"

            //wait()
            + "---**This function waits for a trigger. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function pauses trigger operation up to the seconds set by timeout for an input trigger. If one or more trigger events are detected since the last time ``` lua digio.trigger[N].wait()``` or ``` luadigio.trigger[N].clear() ``` was called, this function returns a value immediately. After waiting for a trigger with this function, the event detector is automatically reset and ready to detect the next trigger. This is true regardless of the number of events detected.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14679.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- triggered = digio.trigger[4].wait(3)\n"
            + "--- --Waits up to three seconds for a trigger to be detected on trigger line 4, then outputs the results. \n"
            + "--- --Output if no trigger is detected: false \n"
            + "--- --Output if a trigger is detected: true \n"
            + "--- ```\n"
            + "---@param timeout number timeout in seconds \n"
            + "---@return boolean triggered `true` if a trigger is detected, `false` if no triggers are detected during the timeout period \n"
            + "DigioTrigger.wait = function (timeout) end\n\n\n";

        }

        public static string TriggerBlenderClass()
        {
            return "---@class TriggerBlender\n"
            + "local TriggerBlender = {}\n\n"

            //clear()
            + "---**This function clears the blender event detector and resets blender N.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function sets the blender event detector to the undetected state and resets the event detector's overrun indicator.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15785.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- trigger.blender[2].clear()\n"
            + "--- --Clears the event detector for blender 2.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TriggerBlender.clear =  function () end\n\n"

            //reset()
            + "---**This function resets some of the trigger blender settings to their factory defaults.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The trigger.blender[N].reset() function resets the following attributes to their factory defaults:.\n"
            + "---* trigger.blender[N].orenable\n"
            + "---* trigger.blender[N].stimulus[M]\n"
            + "---* It also clears trigger.blender[N].overrun.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17666.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- trigger.blender[2].reset()\n"
            + "--- --Resets the trigger blender 1 settings back to factory defaults.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TriggerBlender.reset =  function () end\n\n"

            //wait()
            + "---**This function waits for a blender trigger event to occur.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function waits for an event blender trigger event\n"
            + "--- If one or more trigger events were detected since the last time trigger.blender[N].wait() or trigger.blender[N].clear() was called, this function returns immediately.\n"
            + "--- After detecting a trigger with this function, the event detector automatically resets and rearms. This is true regardless of the number of events detected.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15790.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[3].mode = digio.TRIG_FALLING\n"
            + "--- digio.trigger[5].mode = digio.TRIG_FALLING\n"
            + "--- trigger.blender[1].orenable = true\n"
            + "--- trigger.blender[1].stimulus[1] = digio.trigger[3].EVENT_ID\n"
            + "--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID\n"
            + "---\n"
            + "--- print(trigger.blender[1].wait(3))\n"
            + "--- --Resets the trigger blender 1 settings back to factory defaults.\n"
            + "--- ```\n"
            + "---@return boolean \n"
            + "TriggerBlender.wait =  function () end\n\n"

            //EVENT_ID
            + "--- **This constant identifies the trigger event generated by the digital I/O line **\n---\n--- *Type:*  Constant\n---\n--- *Details:*<br>\n--- To have another trigger object respond to trigger events generated by the trigger line, set the stimulus attribute of the other object to the value of this constant.\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- digio.trigger[5].stimulus = digio.trigger[3].EVENT_ID\n---  --Uses a trigger event on digital I/O trigger line 3 to be the stimulus for digital I/O trigger line 5.\n--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15786.htm" + "\"])" + "\n---\n"
            + "---@type eventID\n"
            + "TriggerBlender.EVENT_ID = nil\n\n";

        }

        public static string TriggerBlenderClassModelException()
        {
            //overrun
            return "--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**\n---\n--- *Type:*  Attribute_RO\n---\n--- *Details:*<br>\n--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- overrun = digio.trigger[1].overrun\n--- print(overrun)\n---  --If there is no trigger overrun, the following text is output: false\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15788.htm" + "\"])" + "\n---\n"
                + "---@type boolean Trigger overrun state (true or false)\n"
            + "TriggerBlender.overrun = false\n\n"

            //orenable
            + "--- **This attribute returns the event detector overrun status. This command is not available on the 2604B, 2614B, or 2634B.**\n---\n--- *Type:*  Attribute_RO\n---\n--- *Details:*<br>\n--- If this is true, an event was ignored because the event detector was already in the detected state when the event occurred.This is an indication of the state of the event detector built into the line itself. It does not indicate if an overrun occurred in any other part of the trigger model or in any other detector that is monitoring the event.\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- overrun = digio.trigger[1].overrun\n--- print(overrun)\n---  --If there is no trigger overrun, the following text is output: false\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15787.htm" + "\"])" + "\n---\n"
            + "---@type boolean Trigger overrun state (true or false)\n"
            + "TriggerBlender.orenable = false\n\n"

            //stimulus
            + "---**This attribute selects the event that causes a trigger to be asserted on the digital output line. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Set this attribute to zero (0) to disable the automatic trigger output. <br> Do not use this attribute to generate output triggers under script control. Use ``` lua digio.trigger[N].assert()``` instead.<br>The trigger stimulus for a digital I/O line may be set to one of the existing trigger event IDs described in the following table.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17684.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- trigger.blender[1].stimulus[2] = digio.trigger[5].EVENT_ID\n"
            + "--- ```\n"
            + " ---@type eventID[]|0\n"
            + "TriggerBlender.stimulus = {}\n";

        }
        public static string TriggerTimerClass()
        {
            return "---@class TriggerTimer\n"
            + "local TriggerTimer = {}\n\n"

            //clear()
            + "---**This function clears the timer event detector and overrun indicator for the specified trigger timer number.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function sets the timer event detector to the undetected state and resets the overrun indicator.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15793.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- trigger.timer[1].clear()\n"
            + "--- --Clears trigger timer 1.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TriggerTimer.clear =  function () end\n\n"

            //reset()
            + "---**This function resets some of the trigger timer settings to their factory defaults.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The trigger.timer[N].reset() function resets the following attributes to their factory defaults:.\n"
            + "---* trigger.timer[N].count\n"
            + "---* trigger.timer[N].delay\n"
            + "---* trigger.timer[N].delaylist\n"
            + "---* trigger.timer[N].passthrough\n"
            + "---* trigger.timer[N].stimulus\n"
            + "---* It also clears trigger.timer[N].overrun.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17668.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- trigger.timer[1].reset()\n"
            + "--- --Resets the attributes associated with timer 1 back to factory default values.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TriggerTimer.reset =  function () end\n\n"

            //wait()
            + "---**This function waits for a trigger.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- If one or more trigger events were detected since the last time trigger\n"
            + "--- timer[N].wait() or trigger.timer[N].clear() was called, this function returns immediately.\n"
            + "--- After waiting for a trigger with this function, the event detector is automatically reset and rearmed.\n"
            + "--- This is true regardless of the number of events detected.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15800.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- triggered = trigger.timer[3].wait(10)\n"
            + "--- print(triggered)\n"
            + "--- --Waits up to 10 seconds for a trigger on timer 3.If false is returned, no trigger was detected during the 10-second timeout.If true is returned, a trigger was detected.\n"
            + "--- ```\n"
            + "---@return boolean \n"
            + "TriggerTimer.wait =  function () end\n\n"

            //count
            + "--- **This attribute sets the number of events to generate each time the timer is triggered.--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15820.htm" + "\"])" + "\n---\n"
            + "TriggerTimer.count = 1\n\n"

            //delay
            + "--- **This attribute sets and reads the timer delay..--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15794.htm" + "\"])" + "\n---\n"
            + "TriggerTimer.delay = 10e-6\n\n"

            //delaylist
            + "--- **This attribute sets an array of timer intervals.\n--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15795.htm" + "\"])" + "\n---\n"
            + "TriggerTimer.delaylist = 10e-6\n\n"

            //EVENT_ID
            + "--- **This constant specifies the trigger timer event number.\n--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15796.htm" + "\"])" + "\n---\n"
            + "---@type eventID\n"
            + "TriggerTimer.EVENT_ID = nil\n\n"

            //overrun
            + "--- **This attribute indicates if an event was ignored because of the event detector state.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15797.htm" + "\"])" + "\n---\n"
            + "---@type boolean Trigger overrun state (true or false)\n"
            + "TriggerTimer.overrun = false\n\n"

            //passthrough
            + "--- **This attribute enables or disables the timer trigger pass‑through mode.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15798.htm" + "\"])" + "\n---\n"
            + "---@type boolean Trigger overrun state (true or false)\n"
            + "TriggerTimer.passthrough = false\n\n"

            //stimulus
            + "--- **This attribute specifies which event starts the timer.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17688.htm" + "\"])" + "\n---\n"
            + "---@type eventID|0\n"
            + "TriggerTimer.stimulus = 0\n\n";
        }

        public static string TriggerGenerator(){
            return "---@class TriggerGenerator\n"
            + "local TriggerGenerator = {}\n\n"
             //assert()
            + "---**This function asserts a trigger pulse on one of the digital I/O lines**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The pulse width that is set determines how long the instrument asserts the trigger.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "29218.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[2].assert()\n"
            + "--- --Asserts a trigger on digital I/O line 2.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TriggerGenerator.assert =  function () end\n\n"
             //EVENT_ID
            + "--- **This function generates a trigger event.\n--- ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "29219.htm" + "\"])" + "\n---\n"
            + "TriggerGenerator.EVENT_ID = nil\n\n";
        }
        public static string TspLinkTriggerClass()
        {
            return "---@class TspLinkTrigger\n"
            + "local TspLinkTrigger = {}\n\n"

            //assert
            + "---**This function simulates the occurrence of the trigger and generates the corresponding event ID. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The set pulse width determines how long the trigger is asserted.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15292.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- tsplink.trigger[2].assert()\n"
            + "--- --Asserts trigger on trigger line 2.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TspLinkTrigger.assert =  function () end\n\n"

            //clear()
            + "---**This function clears the event detector for a LAN trigger. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The trigger event detector enters the detected state when an event is detected. ``` lua tsplink.trigger[N].clear() ``` clears a trigger event detector, discards the history of the trigger line, and clears the ``` lua tsplink.trigger[N].overrun ``` attribute.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15293.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- tsplink.trigger[2].clear()\n"
            + "--- --Clears trigger event on synchronization line 2.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TspLinkTrigger.clear = function () end\n\n"

            //event_id
            + "---**This constant identifies the number that is used for the trigger events. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Constant\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This number is used by the TSP-Link trigger line when it detects an input trigger. Set the stimulus of any trigger object to the value of this constant to have the trigger object respond to trigger events from this line.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15294.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- trigger.timer[1].stimulus = tsplink.trigger[2].EVENT_ID\n"
            + "--- --Sets the trigger stimulus of trigger timer 1 to the TSP-Link trigger 2 event.\n"
            + "--- ```\n"
            + "---@type eventID\n"
            + "TspLinkTrigger.EVENT_ID = nil\n\n"

            // trigger mode            
            + "--- **This attribute defines the trigger operation and detection mode. This command is not available on the 2604B, 2614B, or 2634B.**\n---\n--- *Type:*  Attribute_RW\n---\n---\n---<br>*Examples:*<br>\n--- ```lua\n--- tsplink.trigger[3].mode = tsplink.TRIG_RISINGM\n--- --Sets the trigger mode for synchronization line 3 to ``` lua tsplink.TRIG_RISINGM ``` \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15295.htm" + "\"])" + "\n---\n"
            + "---@type TspLinkTriggerMode\n"
            + "TspLinkTrigger.mode = 'tsplink.TRIG_BYPASS'\n\n"

            //overrun
            + "--- **This attribute indicates if the event detector ignored an event while in the detected state. This command is not available on the 2604B, 2614B, or 2634B.**"
            + "\n---\n--- *Type:*  Attribute_RO\n---\n"
            + "--- *Details:*<br>"
            + "\n--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred. This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15296.htm" + "\"])" + "\n---\n"
            + "\n---\n---<br>*Examples:*<br>"
            + "\n--- ```lua \n--- print(tsplink.trigger[1].overrun)\n"
            + "---  --If an event was ignored, displays true; if an event was not ignored, displays false.\n"
            + "---@type boolean\n"
            + "TspLinkTrigger.overrun = false\n\n"

            //pulse_width
            + " ---**This attribute describes the length of time that the trigger line is asserted for output triggers. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Setting the pulse width to zero (0) seconds asserts the trigger indefinitely.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15297.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- tsplink.trigger[3].pulsewidth = 20e-6\n"
            + "--- --Sets pulse width for trigger line 3 to 20 μs.\n"
            + "--- ```\n"
            + "---@type number\n"
            + "TspLinkTrigger.pulsewidth = 0.0\n\n"

            //release()
            + "--- **This function releases a latched trigger on the given TSP‑Link trigger line. This command is not available on the 2604B, 2614B, or 2634B.**"
            + "\n---\n--- *Type:*  Function"
            + "\n---\n--- *Details:*<br>"
            + "Releases a trigger that was asserted with an indefinite pulse width. It also releases a trigger that was latched in response to receiving a synchronous mode trigger.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15298.htm" + "\"])" + "\n---\n"
            + "\n---\n---<br>*Examples:*<br>\n"
            + "--- ```lua\n"
            + "--- tsplink.trigger[3].release()\n"
            + "---  --Releases trigger line 3.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TspLinkTrigger.release = function () end\n\n"

            //reset()
            + " ---**This function resets some of the TSP-Link trigger attributes to their factory defaults. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The tsplink.trigger[N].reset() function resets the following attributes to their factory defaults: <br> ``` lua tsplink.trigger[N].mode ``` <br> ``` lua tsplink.trigger[N].stimulus ``` <br> ``` lua tsplink.trigger[N].pulsewidth ``` <br>  This also clears ``` lua tsplink.trigger[N].overrun. ```\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17669.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- tsplink.trigger[3].reset()\n"
            + "--- --Resets TSP-Link trigger line 3 attributes back to factory default values.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "TspLinkTrigger.reset = function() end\n\n"

            //stimulus
            + "---**This attribute specifies the event that causes the synchronization line to assert a trigger. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- To disable automatic trigger assertion on the synchronization line, set this attribute to zero (0). <br> Do not use this attribute when triggering under script control. Use ``` lua tsplink.trigger[N].assert() ``` instead. <br> The eventID parameter may be one of the existing trigger event IDs shown in the following table.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17682.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- print(tsplink.trigger[3].stimulus)\n"
            + "--- --Prints the event that starts TSP-Link trigger line 3 action. \n"
            + "--- ```\n"
            + " ---@type eventID|0\n"
            + "TspLinkTrigger.stimulus = 0\n\n"

            //wait
            + "---**This function waits for a trigger. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function waits up to the timeout value for an input trigger. If one or more trigger events were detected since the last time ``` lua tsplink.trigger[N].wait() ``` or ``` lua tsplink.trigger[N].clear() ``` was called, this function returns immediately. <br> After waiting for a trigger with this function, the event detector is automatically reset and rearmed. This is true regardless of the number of events detected.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15300.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- triggered = tsplink.trigger[3].wait(10)\n"
            + "--- print(triggered)\n"
            + "--- --Waits up to 10 seconds for a trigger on TSP-Link® line 3. \n"
            + "--- --If false is returned, no trigger was detected during the 10-second timeout. \n"
            + "--- --If true is returned, a trigger was detected. \n"
            + "--- ```\n"
            + "---@param timeout number timeout in seconds \n"
            + "---@return boolean triggered `true` if a trigger is detected, `false` if no triggers are detected during the timeout period \n"
            + "TspLinkTrigger.wait = function (timeout) end\n\n\n";
        }

        public static string LanTriggerClass()
        {
            return "---@class LanTrigger\n"
            + "local LanTrigger = {}\n"

            //assert()
            + "---**This function simulates the occurrence of the trigger and generates the corresponding event ID.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Generates and sends a LAN trigger packet for the LAN event number specified.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14921.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- lan.trigger[5].assert()\n"
            + "--- --Creates a trigger with LAN packet 5.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "LanTrigger.assert =  function () end\n\n"

            //clear()
            + " ---**This function clears the event detector for a LAN trigger.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The trigger event detector enters the detected state when an event is detected. This function clears a trigger event detector and discards the history of the trigger packet. <br> This function clears all overruns associated with this LAN trigger.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14922.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- lan.trigger[5].clear()\n"
            + "--- --Clears the event detector with LAN packet 5.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "LanTrigger.clear = function () end\n\n"

            //connect()
            + " ---**This function prepares the event generator for outgoing trigger events.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This command prepares the event generator to send event messages. For TCP connections, this opens the TCP connection. <br> The event generator automatically disconnects when either the protocol or IP address for this event is changed.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14923.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- lan.trigger[1].protocol = lan.MULTICAST\n"
            + "--- lan.trigger[1].connect()\n"
            + "--- lan.trigger[1].assert()\n"
            + "--- --Set the protocol for LAN trigger 1 to be multicast when sending LAN triggers. Then, after connecting the LAN trigger, send a message on LAN trigger 1 by asserting it.\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "LanTrigger.connect = function () end\n\n"

            //connected()
            + " ---**This attribute stores the LAN event connection state.**\n"
            + "---\n--- *Type:* Attribute_RO\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This read-only attribute is set to true when the LAN trigger is connected and ready to send trigger events following a successful ``` lua lan.trigger[N].connect()``` command; if the LAN trigger is not ready to send trigger events, this value is false. <br> This attribute is also false when either ``` lua lan.trigger[N].protocol ``` or ``` lua lan.trigger[N].ipaddress ``` attributes are changed or the remote connection closes the connection.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14924.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- lan.trigger[1].protocol = lan.MULTICAST\n"
            + "--- print(lan.trigger[1].connected)\n"
            + "--- --Outputs true if connected, or false if not connected. Example output: false\n"
            + "--- ```\n"
            + "---@type boolean\n"
            + "LanTrigger.connected = true\n\n"

            //disconnect()
            + " ---**This function disconnects the LAN trigger.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- For TCP connections, this closes the TCP connection. <br> The LAN trigger automatically disconnects when either the ``` lua lan.trigger[N].protocol ``` or  ``` lua lan.trigger[N].ipaddress `` attributes for this event are changed.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14925.htm" + "\"])" + "\n---\n"
            + "--- ```\n"
            + "---@return nil\n"
            + "LanTrigger.disconnect = function () end\n\n"

            //event_id
            + " ---**This constant is the event identifier used to route the LAN trigger to other subsystems (using stimulus properties).**\n"
            + "---\n--- *Type:* Constant\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Set the stimulus of any trigger event detector to the value of this constant to have it respond to incoming LAN trigger packets.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14926.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- digio.trigger[14].stimulus = lan.trigger[1].EVENT_ID\n"
            + "--- print(lan.trigger[1].connected)\n"
            + "--- --Route occurrences of triggers on LAN trigger 1 to digital I/O trigger 14.\n"
            + "--- ```\n"
            + "---@type eventID\n"
            + "LanTrigger.EVENT_ID = nil\n\n"

            //ipaddress
            + " ---**This attribute specifies the address (in dotted‑decimal format) of UDP or TCP listeners.**\n"
            + "---\n--- *Type:*  Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Sets the IP address for outgoing trigger events. <br> Set to 0.0.0.0 for multicast. <br> After changing this setting, the ``` lua lan.trigger[N].connect() ``` command must be called before outgoing messages can be sent.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14927.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- lan.trigger[3].protocol = lan.TCP\n"
            + "--- lan.trigger[3].ipaddress = 192.168.1.100\n"
            + "--- lan.trigger[3].connect()\n"
            + "--- --Set the protocol for LAN trigger 3 to be lan.TCP when sending LAN triggers. <br> Use IP address 192.168.1.100 to connect the LAN trigger.\n"
            + "--- ```\n"
            + "---@type string\n"
            + "LanTrigger.ipaddress = '0.0.0.0'\n"

            //mode
            + "---**This attribute sets the trigger operation and detection mode of the specified LAN event.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This command controls how the trigger event detector and the output trigger generator operate on the given trigger. These settings are intended to provide behavior similar to the digital I/O triggers.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14928.htm" + "\"])" + "\n---\n"
            + "---@type LanTriggerMode\n"
            + "LanTrigger.mode = 'lan.TRIG_EITHER'\n\n"

            //overrun
            + " ---**This attribute contains the overrun status of the LAN event detector.**\n"
            + "---\n--- *Type:* Attribute_RO\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This command indicates whether an event has been ignored because the event detector was already in the detected state when the event occurred. <br> This is an indication of the state of the event detector built into the synchronization line itself. It does not indicate if an overrun occurred in any other part of the trigger model, or in any other construct that is monitoring the event. <br> It also is not an indication of an output trigger overrun. Output trigger overrun indications are provided in the status model.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14929.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- overrun = lan.trigger[5].overrun\n"
            + "--- print(overrun)\n"
            + "--- --Checks the overrun status of a trigger on LAN5 and outputs the value, such as: false\n"
            + "--- ```\n"
            + "---@type boolean\n"
            + "LanTrigger.overrun = false\n\n"

            //protocol
            + " ---**This attribute sets the LAN protocol to use for sending trigger messages.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- The LAN trigger listens for trigger messages on all supported protocols, but uses the designated protocol for sending outgoing messages. After changing this setting, ``` lua lan.trigger[N].connect() ``` must be called before outgoing event messages can be sent. <br> When the lan.MULTICAST protocol is selected, the ``` lua lan.trigger[N].ipaddress ``` attribute is ignored and event messages are sent to the multicast address 224.0.23.159. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14930.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- print(lan.trigger[1].protocol)\n"
            + "--- --Get LAN protocol to use for sending trigger messages for LAN event 1.\n"
            + "--- ```\n"
            + "---@type LanTriggerProtocol\n"
            + "LanTrigger.protocol = lan.TCP\n\n"

            //pseudostate
            + " ---**This attribute sets the simulated line state for the LAN trigger.**\n"
            + "---\n--- *Type:* Attribute_RW"
            + "--- This attribute can be set to initialize the pseudo line state to a known value. <br> Setting this attribute does not cause the LAN trigger to generate any events or output packets. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14931.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- print(lan.trigger[1].pseudostate)\n"
            + "--- --Get the present simulated line state for the LAN event 1.\n"
            + "--- ```\n"
            + "--- @type boolean\n"
            + "LanTrigger.pseudostate = false \n\n"

            //stimulus
            + " ---**This attribute specifies events that cause this trigger to assert.**\n"
            + "---\n--- *Type:* Attribute_RW\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This attribute specifies which event causes a LAN trigger packet to be sent for this trigger. Set triggerStimulus to one of the trigger event IDs, which are shown in the following table. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "17679.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- lan.trigger[5].stimulus = trigger.timer[1].EVENT_ID\n"
            + "--- --Use timer 1 trigger event as the source for LAN packet 5 trigger stimulus.\n"
            + "--- ```\n"
            + " ---@type eventID|0\n"
            + "LanTrigger.stimulus = 0\n\n"

            //wait()
            + "--- **This function waits for an input trigger.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- If one or more trigger events have been detected since the last time ``` lua lan.trigger[N].wait() ``` or ``` lua lan.trigger[N].clear() ``` was called, this function returns immediately. <br> After waiting for a LAN trigger event with this function, the event detector is automatically reset and rearmed regardless of the number of events detected.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "14933.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- triggered = lan.trigger[5].wait(3)\n"
            + "--- --Wait for a trigger with LAN packet 5 with a timeout of 3 seconds.\n"
            + "--- ```\n"
            + "---@param timeout number timeout in seconds \n"
            + "---@return boolean triggered `true` if a trigger is detected, `false` if no triggers are detected during the timeout period \n"
            + "LanTrigger.wait = function (timeout) end \n\n";
        }


        public static string smuYReplace()
        {
            return "---@class smuYReplace\n"
            + "smuYReplace = {}\n"
            + "smuYReplace.v = 0"
            + "smuYReplace.i = 0";
        }
        public static string smuRP()
        {
            return
            "--- **This function starts an asynchronous (background) measurement.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- smua.measure.overlappedr(smua.nvbuffer1)\n"
            + "--- --Starts background resistance measurements for SMU channel A.\n"
            + "--- ```\n"
            + "---@param rbuffer any A reading buffer object where the readings are stored "
            + "smua.measure.overlappedr(rbuffer) \n\n"

            + "--- **This function starts an asynchronous (background) measurement.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- smua.measure.overlappedr(ibuffer, vbuffer)\n"
            + "--- --Starts background resistance measurements for SMU channel A.\n"
            + "--- ```\n"
            + "---@param ibuffer any A reading buffer object where current readings are stored "
            + "---@param vbuffer any A reading buffer object where voltage readings are stored "
            + "smua.measure.overlappedr(ibuffer, vbuffer) \n\n"

            + "--- **This function starts an asynchronous (background) measurement.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- smua.measure.overlappedp(smua.nvbuffer1)\n"
            + "--- --Starts background power measurements for SMU channel A.\n"
            + "--- ```\n"
            + "---@param rbuffer any A reading buffer object where the readings are stored "
            + "smua.measure.overlappedp(rbuffer) \n\n"

            + "--- **This function starts an asynchronous (background) measurement.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function starts a measurement and returns immediately. The measurements, as they are performed, are stored in a reading buffer (along with any other information that is being acquired). If the instrument is configured to return multiple readings where one is requested, the readings are available as they are made. Measurements are in the following units of measure: v = volts, i = amperes, r = ohms, p = watts.The second form of this function, smuX.measure.overlappediv(), stores current readings in ibuffer and voltage readings in vbuffer.This function is an overlapped command. Script execution continues while the measurements are made in the background. Attempts to access result values that have not yet been generated cause the script to block and wait for the data to become available. The waitcomplete() function can also be used to wait for the measurements to complete before continuing.If a given reading buffer contains any data, it is cleared before making any measurements, unless the reading buffer has been configured to append data.\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- smua.measure.overlappedp(ibuffer, vbuffer)\n"
            + "--- --Starts background power measurements for SMU channel A.\n"
            + "--- ```\n"
            + "---@param ibuffer any A reading buffer object where current readings are stored "
            + "---@param vbuffer any A reading buffer object where voltage readings are stored "
            + "smua.measure.overlappedp(ibuffer, vbuffer) \n\n";
        }

        public static string NodeClass()
        {
            return "---@class nodeclass\n"
            + "local nodeclass = {}\n"

            //execute()
            + "--- **This function starts test scripts from a remote node. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Only the remote master node can use the execute command to run a script on this node. This function does not run test scripts on the master node; only on this node when initiated by the master node.<br>This function may only be called when the group number of the node is different than the node of the master.<br>This function does not wait for the script to finish execution.<br>This command should only be used from a remote master when controlling this instrument over a TSP-Link®.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "29213.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- node[2].execute(sourcecode)\n"
            + "--- --Runs script code on node 2. The code is in a string variable called **sourcecode**\n"
            + "--- node[3].execute(\"x = 5\")"
            + "--- --Runs script code in string constant (\"x = 5\") to set x equal to 5 on node 3.\n"
            + "--- node[32].execute(TestDut.source)"
            + "--- --Runs the test script stored in the variable **TestDut** (previously stored on the master node) on node 32.\n"
            + "--- ```\n"
            + "nodeclass.execute = function () end \n\n"
            // getglobal
            + "--- **This function returns the value of a global variable. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- This function retrieves the value of a global variable from the runtime environment of this node.<br>Do not use this command to retrieve the value of a global variable from the local node. Instead, access the global variable directly. This command should only be used from a remote master when controlling this instrument over a TSP-Link network.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15010.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- print(node[5].getglobal(\"test_val\"))\n"
            + "--- --Retrieves and outputs the value of the global variable named test_val from node 5.\n"            
            + "--- ```\n"
            + "nodeclass.getglobal = function () end \n\n"
            //setglobal()
            + "--- **This function sets the value of a global variable. This command is not available on the 2604B, 2614B, or 2634B.**\n"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- From a remote node, use this function to assign the given value to a global variable.<br>Do not use this command to create or set the value of a global variable from the local node (set the global variable directly instead). This command should only be used from a remote master when controlling this instrument over a TSP-Link network.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15020.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- node[3].setglobal(\"x\", 5)\n"
            + "--- --Sets the global variable x on node 3 to the value of 5.\n"            
            + "--- ```\n"
            + "nodeclass.setglobal = function () end \n\n"

            +"---@class node\n"
            +"---@type nodeclass[]\n"
            + "node = {}\n";
        }

        public static string smuBuffer()
        {
            return
            //"---@class smua\n"
            //+ "local smua ={}\n\n"

            "---**buffer 1 for channel A**\n"
            + "---\n--- *Type:* Attribute_RO\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15126.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "---  smua.measure.overlappedv(smua.nvbuffer1)\n"
            + "--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 1.\n"
            + "--- ```\n"
            + "---@type bufferMethods\n"
            + "smua.nvbuffer1 = {}\n\n"

            + "---**buffer 2 for channel A**\n"
            + "---\n--- *Type:* Attribute_RO\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15126.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "---  smua.measure.overlappedv(smua.nvbuffer2)\n"
            + "--- --Store voltage readings from SMU channel A into SMU channel A dedicated reading buffer 2.\n"
            + "--- ```\n"
            + "---@type bufferMethods\n"
            + "smua.nvbuffer2 = {}\n\n"


            + "---**buffer 1 for channel B**\n"
            + "---\n--- *Type:* Attribute_RO\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15126.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "---  smua.measure.overlappedv(smub.nvbuffer1)\n"
            + "--- --Store voltage readings from SMU channel B into SMU channel B dedicated reading buffer 1.\n"
            + "--- ```\n"
            + "---@type bufferMethods\n"
            + "smub.nvbuffer1 = {}\n\n"

            + "---**buffer 2 for channel B**\n"
            + "---\n--- *Type:* Attribute_RO\n"
            + "---\n--- *Details:*<br>\n"
            + "--- Each SMU channel contains two dedicated reading buffers: smuX.nvbuffer1 and smuX.nvbuffer2.All routines that return measurements can also store them in either reading buffer. Overlapped measurements are always stored in a reading buffer. Synchronous measurements return either a single-point measurement or can be stored in a reading buffer if passed to the measurement command.The dedicated reading buffers can be saved to internal nonvolatile memory (to retain data between power cycles) using the smuX.savebuffer() function. \n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15126.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "---  smua.measure.overlappedv(smub.nvbuffer2)\n"
            + "--- --Store voltage readings from SMU channel B into SMU channel B dedicated reading buffer 2.\n"
            + "--- ```\n"
            + "---@type bufferMethods\n"
            + "smub.nvbuffer2 = {}\n\n"

            + "---**This function creates a reading buffer.**"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- You can use this function to create and dynamically allocate reading buffers. Use bufferSize to designate the number of readings the buffer can store.You can use dynamically allocated reading buffers interchangeably with the smuX.nvbufferY buffers.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15105.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- mybuffer2 = smua.makebuffer(200)\n"
            + "--- --Creates a 200 element reading buffer (mybuffer2) for SMU channel A.\n"
            + "--- ```\n"
            + "---@return bufferMethods\n"
            + "---@param bufferSize integer any Maximum number of readings that can be stored.\n"
            + "function  smua.makebuffer(bufferSize) end\n\n"

            + "---**This function creates a reading buffer.**"
            + "---\n--- *Type:* Function\n"
            + "---\n--- *Details:*<br>\n"
            + "--- You can use this function to create and dynamically allocate reading buffers. Use bufferSize to designate the number of readings the buffer can store.You can use dynamically allocated reading buffers interchangeably with the smuX.nvbufferY buffers.\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + "15105.htm" + "\"])" + "\n---\n"
            + "---\n--- *Example:*<br>\n"
            + "--- ```lua\n"
            + "--- mybuffer2 = smub.makebuffer(200)\n"
            + "--- --Creates a 200 element reading buffer (mybuffer2) for SMU channel B.\n"
            + "--- ```\n"
            + "---@return bufferMethods\n"
            + "---@param bufferSize integer any Maximum number of readings that can be stored.\n"
            + "function  smub.makebuffer(bufferSize) end\n\n";
        }

        public static string trigger_eventID()
        {
            /* return "---**" + eventID_desc.Remove(eventID_desc.Length - 1, 1) + "**\n"
            + "---\n--- *Type:* Constant\n"
            + "eventID." + event_id.Remove(event_id.Length - 1, 1) + " = 0\n"; */
            return "---**Occurs when the source‑measure unit (SMU) transitions from the idle state to the arm layer of the trigger model**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.SWEEPING_EVENT_ID = 0"
            + "---**Occurs when the source‑measure unit (SMU) transitions from the idle state to the arm layer of the trigger model**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.SWEEPING_EVENT_ID = 0" 
            + "---**Occurs when the SMU moves from the arm layer to the trigger layer of the trigger model**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.ARMED_EVENT_ID = 0" 
            + "---**Occurs when the SMU moves from the arm layer to the trigger layer of the trigger model**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.ARMED_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a source action**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.SOURCE_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a source action**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.SOURCE_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a measurement action**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.MEASURE_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a measurement action**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.MEASURE_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a pulse**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.PULSE_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a pulse**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.PULSE_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a sweep**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.SWEEP_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU completes a sweep**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.SWEEP_COMPLETE_EVENT_ID = 0" 
            + "---**Occurs when the SMU returns to the idle state**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.IDLE_EVENT_ID = 0" 
            + "---**Occurs when the SMU returns to the idle state**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.IDLE_EVENT_ID = 0" 
            + "---**Occurs when the TRIG key on the front panel is pressed**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.display.trigger.EVENT_ID = 0" 
            + "---**Occurs when the TRIG key on the front panel is pressed**"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.display.trigger.EVENT_ID = 0" 
            + "---**Occurs when a *TRG command is received on the remote interface**<br>---GPIB only: Occurs when a GET bus command is received<br>---USB only: Occurs when a USBTMC TRIGGER message is received<br>---VXI-11 only: Occurs with the VXI-11 command device_trigger; reference the VXI-11 standard for additional details on the device trigger operation"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smua.trigger.EVENT_ID = 0" 
            + "---**Occurs when a *TRG command is received on the remote interface**<br>---GPIB only: Occurs when a GET bus command is received<br>---USB only: Occurs when a USBTMC TRIGGER message is received<br>---VXI-11 only: Occurs with the VXI-11 command device_trigger; reference the VXI-11 standard for additional details on the device trigger operation"
            + "--- *Type:* Constant"
            + "---@type eventID\n"
            + "smub.trigger.EVENT_ID = 0" ;
        }

        public static string statisticsType()
        {
            return @"
---@class min
---@field measurefunction string String indicating the function measured for the reading (current, voltage, ohms or watts)
---@field measurerange number The full-scale range value for the measure range used when the measurement was made
---@field reading number The reading value
---@field sourcefunction string String indicating the source function at the time of the measurement (current or voltage)
---@field sourceoutputstate string String indicating the state of the source (off or on)
---@field sourcerange number Full-scale range value for the source range used when the measurement was made
---@field sourcevalue number If bufferVar.collectsourcevalues is enabled, the sourced value in effect at the time of the reading
---@field status number Status value for the reading; the status value is a floating-point number that encodes the status value into a floating-point value
---@field timestamp number If bufferVar.collecttimestamps is enabled, the timestamp, in seconds, between when the reading was acquired and when the first reading in the buffer was acquired; adding this value to the base timestamp will give the actual time the measurement was acquired

---@class max
---@field measurefunction string String indicating the function measured for the reading (current, voltage, ohms or watts)
---@field measurerange number The full-scale range value for the measure range used when the measurement was made
---@field reading number The reading value
---@field sourcefunction string String indicating the source function at the time of the measurement (current or voltage)
---@field sourceoutputstate string String indicating the state of the source (off or on)
---@field sourcerange number Full-scale range value for the source range used when the measurement was made
---@field sourcevalue number If bufferVar.collectsourcevalues is enabled, the sourced value in effect at the time of the reading
---@field status number Status value for the reading; the status value is a floating-point number that encodes the status value into a floating-point value
---@field timestamp number If bufferVar.collecttimestamps is enabled, the timestamp, in seconds, between when the reading was acquired and when the first reading in the buffer was acquired; adding this value to the base timestamp will give the actual time the measurement was acquired


---@class statistics
---@field n number The number of data points on which the statistics are based
---@field mean number returned when(n>0) , The average of all readings added to the buffer
---@field stddev number The standard deviation of all readings (samples) added to the buffer
---@field min min A table containing data about the minimum reading value added to the buffer
---@field max max A table containing data about the maximum reading value added to the buffer

";
        }

    }
}