﻿using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using static jsonToLuaParser.HelperFunctions;
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
            var directFunctioncommands = cmdList.Where(cmd => !cmd.name.Contains('.')).ToList();
            foreach (var cmd in cmdList)
            {
                string s = cmd.name;
                var tSplit = s.Contains(".") ? s.Trim().Split('.') : s.Trim().Split(':');                     
                if(cmd.tsplink_supported.Contains("Yes"))      
                {
                    if (tSplit[0] == "bufferVar")
                        continue;
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
            outStr += "---@class io_object\nio_object={}\n---@class script_object\nscript_object={}\n---@class eventID\n\n---@class file_object\nfile_object ={}\n\n"; //PRIV
            outStr += "---@class bufferMethods\nbufferMethods={}\n";
            outStr += "---@class digio\n digio = {}\n\n---@class tsplink\n tsplink = {}\n\n---@class lan\n  lan = {}\n\n---@class tspnetConnectionID\n tspnetConnectionID = {}\n\n";
                        
            if(file_name.Contains("26"))
            {
                foreach (string item in supportedInstrumentsList26XX)
                {
                    var tsplinkStr = "";
                    string[] arrlist = {};
                    tsplinkStr = outStr;
                    string data = "";
                    data += outStr;
                    Utility.PrintFields(MAX_DEPT, file_name, ref instrTable, ref data,ref tsplinkStr, ref arrlist,item);
                    foreach (var cmd in directFunctioncommands)
                    {                
                        Utility.HelpContent(cmd, file_name, ref data, ref tsplinkStr,"", true, "", "",true);
                    }
                    nodeTable.Remove("node[N] = node[N]"); // for now removing this command from nodeTable because its creating problem in lua definitions
                    nodeTable.Remove("slot[slot] = slot[slot]"); // for now removing this command from nodeTable because its creating problem in lua definition
                    var nodeTable_str = @"{" + string.Join(",\n ", nodeTable) + "\n}";
                    var nodeTableDetails = $"---@meta\n\n---@class Commands_{item.Replace("-","")}\nCommands_{item.Replace("-","")} = {nodeTable_str}" +
                        $"\n--#region node details\n--#endregion";
                    File.WriteAllText("keithley_instrument_libraries/" + item +"/tspLinkSupportedCommands/nodeTable.lua", nodeTableDetails);                    
                    File.WriteAllText("keithley_instrument_libraries/"+ item +"/AllTspCommands/Commands_" + item + ".lua", data);
                    File.WriteAllText("keithley_instrument_libraries/"+ item +"/tspLinkSupportedCommands/Commands_" + item + "_TSPLink.lua", tsplinkStr);
                }   
            }    
            else if(file_name.Contains("37"))
            {
                var tsplinkStr = "";
                string[] arrlist = {};
                tsplinkStr = outStr;
                Utility.PrintFields(MAX_DEPT, file_name, ref instrTable, ref outStr, ref tsplinkStr, ref arrlist,"null");
                foreach (var cmd in directFunctioncommands)
                {                
                    Utility.HelpContent(cmd, file_name, ref outStr,ref tsplinkStr,"",true, "", "",true);
                }
                nodeTable.Remove("node[N] = node[N]"); // for now removing this command from nodeTable because its creating problem in lua definitions
                nodeTable.Remove("slot[slot] = slot[slot]"); // for now removing this command from nodeTable because its creating problem in lua definition
                var nodeTable_str = @"{" + string.Join(",\n ", nodeTable) + "\n}";
                
                foreach (var item in supportedInstrumentsList37XX)
                {
                    var nodeTableDetails = $"---@meta\n\n---@class Commands_{item.Replace("-","")}\nCommands_{item.Replace("-","")} = {nodeTable_str}" +
                    $"\n--#region node details\n--#endregion";
                    //File.WriteAllText("data/" + "nodeTable"+ item+".lua", nodeTableDetails);
                    //File.WriteAllText("data/Commands_" + item + ".lua", outStr);
                    //File.WriteAllText("data/Commands_" + item + "_TSPLink.lua", tsplinkStr);
                    File.WriteAllText("keithley_instrument_libraries/" + item +"/tspLinkSupportedCommands/nodeTable.lua", nodeTableDetails);
                    File.WriteAllText("keithley_instrument_libraries/"+ item +"/AllTspCommands/Commands_" + item + ".lua", outStr);
                    File.WriteAllText("keithley_instrument_libraries/"+ item +"/tspLinkSupportedCommands/Commands_" + item + "_TSPLink.lua", tsplinkStr);
                }
            }        
            else
            {
                var tsplinkStr = "";
                string[] arrlist = {};
                tsplinkStr = outStr;
                Utility.PrintFields(MAX_DEPT, file_name, ref instrTable, ref outStr, ref tsplinkStr, ref arrlist,"null");
                foreach (var cmd in directFunctioncommands)
                {                
                    Utility.HelpContent(cmd, file_name, ref outStr,ref tsplinkStr,"",true, "", "",true);
                }
                nodeTable.Remove("node[N] = node[N]"); // for now removing this command from nodeTable because its creating problem in lua definitions
                nodeTable.Remove("slot[slot] = slot[slot]"); // for now removing this command from nodeTable because its creating problem in lua definition
                var nodeTable_str = @"{" + string.Join(",\n ", nodeTable) + "\n}";
                var nodeTableDetails = $"---@meta\n\n---@class {file_name}\n{file_name} = {nodeTable_str}" +
                    $"\n--#region node details\n--#endregion";
                //File.WriteAllText("data/" + "nodeTable"+ file_name+".lua", nodeTableDetails);
                //File.WriteAllText("data/" + file_name + ".lua", outStr);                
                //File.WriteAllText("data/" + file_name + "_TSPLink.lua", tsplinkStr);
                File.WriteAllText("keithley_instrument_libraries/2470/tspLinkSupportedCommands/nodeTable.lua", nodeTableDetails);
                File.WriteAllText("keithley_instrument_libraries/2470/AllTspCommands/" + file_name + ".lua", outStr);
                File.WriteAllText("keithley_instrument_libraries/2470/tspLinkSupportedCommands/" + file_name + "_TSPLink.lua", tsplinkStr);
            }
            return 0;
        }
    }
}