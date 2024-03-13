using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
//using static jsonToLuaParser.Utility;
using static jsonToLuaParser.Utility;
namespace jsonToLuaParser
{
    class Program
    {
        static string[] supportedInstrumentsList26XX = {
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

        static string[] supportedInstrumentsList37XX = {
            "3706",
            "3706-NFP",
            "3706-S",
            "3706-SNFP",
            "3706A",
            "3706A-NFP",
            "3706A-S",
            "3706A-SNFP",            
        };

        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                Console.WriteLine("Enter filename");
                return 0;
            }

            
            Dictionary<string,string> arrayfound = new Dictionary<string, string>();            
            var str = File.ReadAllText(args[0]);
           
            var file_name = Path.GetFileNameWithoutExtension(args[0]);

            var model = Path.GetFileNameWithoutExtension(args[1]);
            //var file_name = "NewDMM7510commands";
            JObject cmds = JObject.Parse(str);

            IList<CommandInfo> cmdList = PopulateCommands(ref cmds,"commands");            
            Console.WriteLine(cmdList.First());
            var outStr = "---@meta\n\n";            
            int MAX_DEPT = 10;
            var nodeTable = new HashSet<string>();    
            Dictionary<string, Dictionary<string, CommandInfo>>[] instrTable = new Dictionary<string, Dictionary<string, CommandInfo>>[MAX_DEPT];
            for (int i = 0; i < MAX_DEPT; i++)
            {
                instrTable[i] = new Dictionary<string, Dictionary<string, CommandInfo>>();
            }

            var factoryScriptCommands = cmdList.Where(cmd => cmd.description.Contains("factory script")).ToList(); // get factoryScriptCommands and remove it, its there for 26xx models

            cmdList = cmdList.Except(factoryScriptCommands).ToList(); // remove all factoryScriptCommands commands

            var directFunctioncommands = cmdList.Where(cmd => !cmd.name.Contains('.')).ToList();

            var triggerModelLoadCommands = cmdList.Where(cmd => cmd.name.Contains("trigger.model.load()")).ToList(); // get trigger.model.load() commands

            var bufferMathCommand = cmdList.Where(cmd => cmd.name.Contains("buffer.math()")).ToList();

           

            cmdList = cmdList.Except(directFunctioncommands).ToList(); // remove all directFunctioncommands commands and handle it speratley

            cmdList = cmdList.Except(triggerModelLoadCommands).ToList(); // remove all trigger.model.load() commands and handle it speratley

            cmdList = cmdList.Except(bufferMathCommand).ToList(); // remove "buffer.math()" commands and handle it speratley

            foreach (var cmd in cmdList)
            {
                string s = cmd.name;
                var tSplit = s.Contains(".") ? s.Trim().Split('.') : s.Trim().Split(':');                     
                if(cmd.tsplink_supported.Contains("Yes"))      
                {
                    //if (tSplit[0] == "bufferVar")
                        //continue;
                    if (tSplit.Length > 1)
                    {
                        nodeTable.Add(tSplit[0] +" = "+ tSplit[0]);
                    }
                    else
                    {
                        nodeTable.Add(s.Contains('(') ? s.Split('(')[0] +" = "+ s.Split('(')[0] : s +" = " + s);
                    }                
                }
                                     
                
                for (int i = 0; i < tSplit.Length - 1; i++)
                {//ignore functions
                    string attr = null;
                    //if (cmd.command_type != CommandType.Function)
                    //{//attributes
                    //TODO get attribute type and/or defaults
                        attr = tSplit[tSplit.Length - 1];
                    //}
                    string tableStr = string.Join(".", tSplit, 0, i + 1);

                    if (!instrTable[i].ContainsKey(tableStr))
                    {
                        instrTable[i][tableStr] = new Dictionary<string, CommandInfo>();
                    }
                    if (attr != null && i == tSplit.Length - 2)
                        instrTable[i][tableStr][attr] = cmd;
                }
            }

            outStr += "---@class io_object\nlocal io_object={}\n---@class scriptVar\nlocal scriptVar={}\n---@class eventID\n\n---@class file_object\nlocal file_object ={}\n\n"; //PRIV
            outStr += "---@class bufferVar\nlocal bufferVar={}\n";
            outStr += "---@class digio\n digio = {}\n\n---@class tsplink\n tsplink = {}\n\n---@class lan\n  lan = {}\n\n---@class tspnetConnectionID\nlocal tspnetConnectionID = {}\n\n ---@class promptID\nlocal promptID = {}\n\n";

            var tsplinkStr = "";
            string[] arrlist = { };
            tsplinkStr = outStr;
            Utility.PrintFields(MAX_DEPT, file_name, ref instrTable, ref outStr, ref tsplinkStr, ref arrlist, "null");
            foreach (var cmd in directFunctioncommands)
            {
                Utility.HelpContent(cmd, file_name, ref outStr, ref tsplinkStr, "", true, "", "", true);
            }

            if (triggerModelLoadCommands.Count > 0)
            {
                var defStr = "---This is generic function, This function loads a trigger-model template configuration\n---";
                outStr += defStr;
                tsplinkStr += defStr;

                // IList<string> aliasTypes = new List<string>();

                foreach (var cmd in triggerModelLoadCommands)
                {
                    // aliasTypes.Add(cmd.name.Split('-')[1].Trim());
                    var header = Utility.get_command_header(cmd, file_name);
                    outStr += header;
                    tsplinkStr += header;
                }

                //outStr+= Utility.create_alias_type("loadFunConstParam", aliasTypes);
                //tsplinkStr += Utility.create_alias_type("loadFunConstParam", aliasTypes);
                var sig = "\n"+@"---@param loadFunConst loadFunConstParam
function trigger.model.load(loadFunConst,...) end";
                outStr += sig;
                tsplinkStr += sig;

                
            }

            if (bufferMathCommand.Count > 0)
            {
                var alias = Utility.create_enum_alias_type(bufferMathCommand[0].param_info[1]);
                var header = Utility.get_command_header(bufferMathCommand[0], file_name);

                outStr += alias + header;
                tsplinkStr += alias + header;

                Utility.append_buffermath_signature(ref outStr);
                Utility.append_buffermath_signature(ref tsplinkStr);

            }

            nodeTable.Remove("node[N] = node[N]"); // for now removing this command from nodeTable because its creating problem in lua definitions
            nodeTable.Remove("slot[slot] = slot[slot]"); // for now removing this command from nodeTable because its creating problem in lua definition
            var nodeTable_str = @"{" + string.Join(",\n ", nodeTable) + "\n}";
            var nodeTableDetails = $"---@meta\n\n---@class model{file_name}\nmodel{file_name} = {nodeTable_str}" +
                $"\n--#region node details\n--#endregion";


            if (file_name.Contains("26"))
            {

                Utility.append_nvbuffer_type(ref outStr, "smua.nvbuffer1 = 0");
                Utility.append_nvbuffer_type(ref outStr, "smua.nvbuffer2 = 0");
                Utility.append_nvbuffer_type(ref outStr, "smub.nvbuffer1 = 0");
                Utility.append_nvbuffer_type(ref outStr, "smub.nvbuffer2 = 0");

                Utility.append_nvbuffer_type(ref tsplinkStr, "smua.nvbuffer1 = 0");
                Utility.append_nvbuffer_type(ref tsplinkStr, "smua.nvbuffer2 = 0");
                Utility.append_nvbuffer_type(ref tsplinkStr, "smub.nvbuffer1 = 0");
                Utility.append_nvbuffer_type(ref tsplinkStr, "smub.nvbuffer2 = 0");

            }

            else if (file_name.Contains("37"))
            {

            }        
            else // for tti models
            {
                Utility.append_defbuffer1_defbuffer2_defination(ref outStr);
                Utility.append_defbuffer1_defbuffer2_defination(ref tsplinkStr);

                Utility.append_setblock_signature(ref outStr);
                Utility.append_setblock_signature(ref tsplinkStr);
            }

            var nodeTableFile = $"keithley_instrument_libraries/{model}/tspLinkSupportedCommands/nodeTable.lua";
            var AllTspCommandsFile = $"keithley_instrument_libraries/{model}/AllTspCommands/" + file_name + ".lua";
            var tspLinkSupportedCommandsFile = $"keithley_instrument_libraries/{model}/tspLinkSupportedCommands/" + file_name + "_TSPLink.lua";

            Utility.write_to_file(nodeTableFile, nodeTableDetails);
            Utility.write_to_file(AllTspCommandsFile, outStr);
            Utility.write_to_file(tspLinkSupportedCommandsFile, tsplinkStr);

            Utility.SetFileReadOnly(nodeTableFile);
            Utility.SetFileReadOnly(AllTspCommandsFile);
            Utility.SetFileReadOnly(tspLinkSupportedCommandsFile);
            return 0;
        }
    }
}
