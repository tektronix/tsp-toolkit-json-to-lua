using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using static jsonToLuaParser.HelperFunctions;
using static jsonToLuaParser.Utility;
namespace jsonToLuaParser
{
    class Program
    {
        static string[] supportedInstrumentsList = {
            "2601",
            "2602",
            "2611",
            "2612",
            "2635",
            "2636",
            "2601A",
            "2602A",
            "2611A",
            "2612A",
            "2635A",
            "2636A",
            "2651A",
            "2657A",
            "2601B",
            "2601B-PULSE",
            "2602B",
            "2606B",
            "2611B",
            "2612B",
            "2635B",
            "2636B",
            "2604B",
            "2614B",
            "2634B",
            "2601B-L",
            "2602B-L",
            "2611B-L",
            "2612B-L",
            "2635B-L",
            "2636B-L",
            "2604B-L",
            "2614B-L",
            "2634B-L"
        };

        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                Console.WriteLine("Enter filename");
                return 0;
            }

            var str = File.ReadAllText(args[0]);
            JObject cmds = JObject.Parse(str);

            //IList<string> keys = cmds.Properties().Select(p=>p.Name).ToList();

            foreach (var item in supportedInstrumentsList)
            {
                IList<CommandInfo> cmdList = PopulateCommands(ref cmds);
                IList<TriggerEventIdInfo> trigger_eventId = PopulateTriggerEventID(ref cmds);

                Console.WriteLine(cmdList.First());
                var outStr = "---@meta\n\n";
                int MAX_DEPT = 10;//assume dept of 10

                Dictionary<string, Dictionary<string, CommandInfo>>[] instrTable = new Dictionary<string, Dictionary<string, CommandInfo>>[MAX_DEPT];
                for (int i = 0; i < MAX_DEPT; i++)
                {
                    instrTable[i] = new Dictionary<string, Dictionary<string, CommandInfo>>();
                }
                foreach (var cmd in cmdList)
                {
                    string s = cmd.name;
                    var tSplit = s.Contains(".") ? s.Trim().Split('.') : s.Trim().Split(':');

                    for (int i = 0; i < tSplit.Length - 1; i++)
                    {//ignore functions
                        string attr = null;
                        if (cmd.command_type != CommandType.Function)
                        {//attributes
                         //TODO get attribute type and/or defaults
                            attr = tSplit[tSplit.Length - 1];
                        }
                        string tableStr = string.Join(".", tSplit, 0, i + 1);

                        if (!instrTable[i].ContainsKey(tableStr))
                        {
                            instrTable[i][tableStr] = new Dictionary<string, CommandInfo>();
                        }
                        if (attr != null && i == tSplit.Length - 2)
                            instrTable[i][tableStr][attr] = cmd;
                    }
                }

                //printing trigger tables
                outStr += "---@class io_object\nio_object={}\n---@class script_object\nscript_object={}\n---@class eventID\n\n"; //PRIV
                //outStr += "---@class buffer_return \n---class @smua_buffers \n\n";  //RAJEEV
                outStr += "---@class bufferMethods\nbufferMethods ={}\n\n";
                outStr += "---@class digio\n digio = {}\n\n---@class tsplink\n tsplink = {}\n\n---@class lan\n  lan = {}\n\n";
                outStr += DigioTriggerModeEnum() + TspLinkTriggerModeEnum() + LanTriggerModeEnum() + LanTriggerProtocolEnum() + DisplaySMUDigitsEnum() + SerialParityEnum() + SerialFlowControlEnum();
                outStr += DigioTriggerClass() + TspLinkTriggerClass() + LanTriggerClass();
                outStr += TriggerBlenderClass() + TriggerTimerClass() + TriggerGenerator();                

                PrintFields(MAX_DEPT, ref instrTable, ref outStr, item);                
                PrintFunctions(ref cmdList, ref outStr, item);                
                outStr += smuBuffer() + DisplayLoadMenuCatalog() + NodeClass();

                /* outStr += "---@class eventID \nlocal eventID = {}\n";
                foreach (var cmd in trigger_eventId)
                {
                    outStr += trigger_eventID(cmd.event_id, cmd.event_desc);
                } */
                outStr += trigger_eventID();
                File.WriteAllText("data/" + item + "commands" + ".lua", outStr);
            }
            //File.WriteAllText(args[0] + ".lua", outStr);
            return 0;
        }
    }
}
