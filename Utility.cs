using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace jsonToLuaParser
{
    class Utility
    {
        public class Example_Info
        {
            public string example { get; set; }
            public string description { get; set; }
        }
        public class ParamInfo
        {
            public string Name { get; set; }
            public string Description { get; set; }
            public string Type { get; set; }
        }
        public class CommandEnum
        {
            public string enum_number { get; set; }
            public string enum_member { get; set; }
            public string enum_desc { get; set; }
        }
        public enum CommandType
        {
            Function,
            Attribute_RO,
            Attribute_WO,
            Attribute_RW,
        }

        public class CommandInfo
        {
            public string name { get; set; }
            public string signature { get; set; }
            public string command_return { get; set; }
            public string description { get; set; }
            public CommandType command_type { get; set; }
            public string[] usage { get; set; }
            public CommandEnum[] command_enum { get; set; }
            public string default_value { get; set; }
            public string details { get; set; }
            public Example_Info[] example_info { get; set; }
            public string related_commands { get; set; }
            public ParamInfo[] param_info { get; set; }
            public string[] overloads { get; set; }
            public string supportedModels { get; set; } 
        }

        public class TriggerEventIdInfo
        {
            public string event_id { get; set; }
            public string event_desc { get; set; }
        }

        public static JObject ParseJSON(string file)
        {
            var str = File.ReadAllText(file);
            JObject cmds = JObject.Parse(str);

            return cmds;
        }

        public static IList<CommandInfo> PopulateCommands(ref JObject obj)
        {
            /* IList<string> keys = obj.Properties().Select(p => p.Name).ToList();
            IEnumerable<JToken> prop =  obj.Properties().Select(p =>p.First());
            foreach (var key in keys){} */

            IList<CommandInfo> cmdList = obj["commands"].ToArray().Select(p => new CommandInfo
            {
                name = (string)p["name"],
                signature = (string)p["signature"],
                description = (string)p["description"],
                command_type = ((string)p["type"] == "Function\n" ? CommandType.Function : ((string)p["type"] == "Attribute (RW)\n" ? CommandType.Attribute_RW : CommandType.Attribute_RO)),
                default_value = (string)p["default_value"],
                usage = p["usage"].ToObject<string[]>(),
                overloads = p["overloads"].ToObject<string[]>(),
                details = (string)p["details"],
                command_return = (string)p["command_return"],
                example_info = p["examples"].ToArray().Select(pi => new Example_Info
                {
                    example = pi["example"].ToString(),
                    description = pi["description"].ToString(),

                }).ToArray(),
                param_info = p["param_info"].ToArray().Select(pi => new ParamInfo
                {
                    Name = pi["name"].ToString(),
                    Description = pi["description"].ToString(),
                    Type = pi["type"].ToString()
                }).ToArray(),
                command_enum = p["enum_data"].ToArray().Select(pi => new CommandEnum
                {
                    enum_number = (string)pi["enum number"],
                    enum_member = (string)pi["enum"],
                    enum_desc = (string)pi["enum_desc"],
                }).ToArray(),
                related_commands = "TODO",
                supportedModels = (string)p["supported_models"]
            }).ToList();


            return cmdList;
        }

        public static IList<TriggerEventIdInfo> PopulateTriggerEventID(ref JObject obj)
        {
            IList<TriggerEventIdInfo> trigger_eventId = obj["trigger_eventId"].ToArray().Select(p => new TriggerEventIdInfo
            {
                event_id = (string)p["event_id"],
                event_desc = (string)p["desc"],
            }).ToList();

            return trigger_eventId;
        }

        public static void PrintFields(int depth, ref Dictionary<string, Dictionary<string, CommandInfo>>[] instrTable, ref string outStr, string item)
        {
            for (int i = 0; i < depth; i++)
            {
                foreach (var keyValuePair in instrTable[i])
                {
                    foreach (var keyvalue in keyValuePair.Value)
                    {
                        if (!keyvalue.Value.supportedModels.Contains(item))
                        {
                            return;
                        }
                    }
                    string table_name = "";

                    if (keyValuePair.Key.Contains("N"))
                        table_name = keyValuePair.Key.Remove(keyValuePair.Key.Length - 3, 3);
                    else
                        table_name = keyValuePair.Key;

                    outStr += "---\n";

                    if (table_name == "digio.trigger")
                    {
                        outStr += "---@type DigioTrigger[]" + "\n";
                        outStr += table_name + " = {}\n";
                        continue;
                    }
                    else if (table_name == "trigger.blender")
                    {
                        outStr += "---@type TriggerBlender[]" + "\n";
                        outStr += table_name + " = {}\n";
                        continue;
                    }
                    else if (table_name == "trigger.timer")
                    {
                        outStr += "---@type TriggerTimer[]" + "\n";
                        outStr += table_name + " = {}\n";
                        continue;
                    }
                    else if (table_name == "trigger.generator")
                    {
                        outStr += "---@type TriggerGenerator[]" + "\n";
                        outStr += table_name + " = {}\n";
                        continue;
                    }
                    else if (table_name == "lan.trigger")
                    {
                        outStr += "---@type LanTrigger[]" + "\n";
                        outStr += table_name + " = {}\n";
                        continue;
                    }
                    else if (table_name == "tsplink.trigger")
                    {
                        outStr += "---@type TspLinkTrigger[]" + "\n";
                        outStr += table_name + " = {}\n";
                        continue;
                    }

                    outStr += "---\n";
                    if (table_name == "digio" || table_name == "tsplink" || table_name == "lan")
                    {
                        continue;
                    }

                    if (!table_name.Contains("bufferVar"))
                    {
                        outStr += "---@class " + table_name + "\n";
                        if (i == 0)
                            outStr += table_name + " = {}\n";
                        else
                            outStr += table_name + " = {}\n";
                    }

                    foreach (var keyvalue in keyValuePair.Value)
                    {
                        HelpContent(keyvalue.Value, ref outStr, keyValuePair.Key, keyvalue.Key);
                        /* if(cmdinfo.command_type != CommandType.Function)                        
                            outStr += table + "." + attr + " = 0\n";                         
                        else{
                            foreach (var param in cmdinfo.param_info)                            
                                outStr += "---@param " + param.Name + " any " + param.Description + "\n";                            
                            outStr += "function " +  cmdinfo.signature + " end\n";
                        } */
                    }

                }
            }
        }

        public static void PrintFunctions(ref IList<CommandInfo> cmdList, ref string outStr, string item)
        {
            foreach (var cmd in cmdList)
            {
                if (!cmd.supportedModels.Contains(item))
                {
                    return;
                }
                // if (cmd.name.Contains("digio.trigger[N]") || cmd.name.Contains("tsplink.trigger[N]") || cmd.name.Contains("lan.trigger[N]")) //priv
                if (cmd.name.Contains("[N]"))
                    continue;
                if(cmd.name.Contains("display.loadmenu.catalog()"))
                    continue;
                /* if(cmd.name.Contains("script.factory.catalog()"))
                    continue;
                if(cmd.name.Contains("script.user.catalog()"))
                    continue;
                if(cmd.name.Contains("userstring.catalog()"))
                    continue;    */ 

                //HelpContent(cmd,ref outStr, "","");
                if (cmd.command_type == CommandType.Function)
                {
                    HelpContent(cmd, ref outStr, "", "");
                }
            }
        }

        public static void HelpContent(CommandInfo cmd, ref string outStr, string table, string attr)
        {
            string[] example = new string[] { };
            string example_description = "";
            string enum_class ="";
            if (cmd.command_type != CommandType.Function)
            {
                enum_class = cmd.name.Replace(".", "");
                if (cmd.command_enum.Length > 0 && (table !="format" && table !="localnode" && table !="serial" && table !="display.smua" && table !="display.smub"))
                {                    
                    outStr += "\n";
                    foreach (var ele in cmd.command_enum)
                    {                        
                        ele.enum_member = ele.enum_member.Remove(0,1);
                        if(ele.enum_desc != "")
                            ele.enum_desc = ele.enum_desc.Remove(0,1);
                        ele.enum_number = ele.enum_number.Remove(ele.enum_number.Length-1,1);
                        outStr += ele.enum_member + " = " + ele.enum_number + "\n";
                    }                    
                    outStr += "---@alias " + enum_class +"\n";
                    foreach (var ele in cmd.command_enum)
                    {
                        outStr += "---|`" + ele.enum_member + "` #" + ele.enum_desc + "\n";
                    }
                }
            }
            outStr += "\n";

            foreach (var x in cmd.example_info)
            {
                string example1 = x.example;
                example = example1.Split(';');
                example_description = x.description;
            }

            outStr += "\n--- **" + cmd.description + "**\n---\n"
                        + "--- *Type:*  " + cmd.command_type + "\n---\n"
                        + "--- *Details:*<br>\n--- " + cmd.details + "\n---\n"
                        + "---<br>*Examples:*<br>\n"
                        + "--- ```lua";

            foreach (var x in example)
                outStr += "\n--- " + x;
            outStr += " --" + example_description;
            outStr += "\n--- ```\n";

            string[] string_param_list = new string[] { };

            /* if(cmd.signature.Contains("\""))
            {
                int start = cmd.signature.IndexOf("(") +1;
                int end = cmd.signature.IndexOf(")",start);
                string_param_list = cmd.signature.Split('\"','\"');

                cmd.signature =  cmd.signature.Replace("\"","");
            } */

            if (table.Contains("bufferVar"))
            {
                if (cmd.signature.Contains("[N]"))
                {
                    outStr += "---@type integer[]\n";
                    outStr += "bufferMethods." + attr + "= {}\n";
                }
                else
                {
                    outStr += "bufferMethods." + attr + "= 0\n";
                }
                return;
            }
            /* if(cmd.name.Contains("bufferVar"))
            {
                outStr += "---@type smua_buffers | buffer_return\n";
                outStr += "local "+ attr + " = {}\n";
                return;
            } */

            if (cmd.command_type == CommandType.Function)
            {                
                foreach (var param in cmd.param_info)
                {
                    int start = cmd.signature.IndexOf("(") + 1;
                    int end = cmd.signature.IndexOf(")", start);
                    string[] s = cmd.signature.Substring(start, end - start).Replace(" ","").Split(',');
                    if (s.Contains(param.Name) || (param.Name == "X" && s.Contains("smuX")))
                    {
                        string temp = "\"" + param.Name + "\"";
                        if (s.Contains(temp))
                        {
                            outStr += "---@param " + param.Name +" " +param.Type+" " + param.Description + "\n";
                            continue;
                        }
                        if (param.Name.Contains("bufferVar"))
                        {
                            outStr += "---@param " + param.Name + " bufferMethods " + param.Description + "\n";
                            continue;
                        }   
                        if(param.Name.Contains("X"))
                        {
                            outStr += "---@param smu" + param.Name + " "+param.Type+" " + param.Description + "\n";
                            continue;
                        }                     
                        //outStr += "---@param " + param.Name + " string " + param.Description + "\n";
                        outStr += "---@param " + param.Name + " "+param.Type+" " + param.Description + "\n";
                        //cmd.signature =  cmd.signature.Replace("\"","");
                        //continue;
                    }
                    else if (cmd.command_return.Contains(param.Name))
                    {
                        if (param.Name.Contains("fileVar"))
                        {
                            outStr += "---@return " + "io_object " + param.Name + " " + param.Description + "\n";
                            continue;
                        }
                        else if (param.Name.Contains("scriptVar"))
                        {
                            outStr += "---@return " + "script_object " + param.Name + " " + param.Description + "\n";
                            continue;
                        }
                        outStr += "---@return " + param.Type +" " + param.Name + " " + param.Description + "\n";
                    }
                }
                cmd.signature = cmd.signature.Replace("\"", "");
                /* // process command signuture which is not format as signature in help file
                // example :for name in script.factory.catalog() do body end
                if (cmd.signature.Contains(".catalog()"))
                {
                    System.Console.WriteLine(cmd.signature);
                    cmd.signature = cmd.signature.Split(' ')[3];
                }
                outStr += "function " + cmd.signature + " end\n"; */
            }

            
            if (cmd.command_type != CommandType.Function)
            {               
                if (cmd.command_enum.Length > 0 && (table !="format" && table !="localnode"))
                {
                    outStr += "---@type " + enum_class + "\n";
                }
                if (table.Contains("scriptVar"))
                {
                    outStr += "script_object" + "." + attr + " = 0\n";
                }
                else if (attr.Contains("address[N]"))
                {
                    outStr += "---@type integer[]\n";
                    attr = attr.Replace("[N]","");
                    outStr += table + "." + attr + " = 0\n";
                }       
                else if(attr.Contains("stimulus"))
                {
                    outStr += "---@type eventID|0\n";
                    outStr += table + "." + attr + "= 0\n";
                }  
                else if(attr.Contains("EVENT_ID"))   
                {
                    outStr += "---@type eventID\n";
                    outStr += table + "." + attr + "= nil\n";
                }    
                else
                {
                    outStr += table + "." + attr + " = 0\n";
                }
            }
            else
            {
                if (cmd.overloads.Length > 0)
                {
                    // System.Console.WriteLine(cmd.signature);
                    foreach (var sig in cmd.overloads)
                    {
                        System.Console.WriteLine(sig);
                        var overlad_sig = sig.Split('(')[1];
                        outStr += "---@overload fun(" + overlad_sig + "\n";
                    }

                }

                if (cmd.signature.Contains("scriptVar"))
                {
                    string sig = cmd.signature.Replace("scriptVar", "script_object");
                    outStr += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains("fileVar"))
                {
                    string sig = cmd.signature.Replace("fileVar", "io_object");
                    outStr += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains(".catalog()"))
                {
                    cmd.signature = cmd.signature.Split(' ')[3];
                    outStr += "function " + cmd.signature + " end\n";
                }
                else if (cmd.signature.Contains("bufferVar."))
                {
                    string sig = cmd.signature.Replace("bufferVar.", "bufferMethods.");
                    outStr += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains("smub.nvbufferY"))
                {
                    string sig = cmd.signature.Replace("smub.nvbufferY", "buffer");
                    outStr +="---@param buffer bufferMethods\n";
                    outStr += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains("smua.nvbufferY"))
                {
                    string sig = cmd.signature.Replace("smua.nvbufferY", "buffer");
                    outStr +="---@param buffer bufferMethods\n";
                    outStr += "function " + sig + " end\n";
                }
                /* else if(cmd.signature.Contains("bufferVar"))
                {
                    string sig = cmd.signature.Replace("bufferVar","bufferMethods");
                    outStr += "function " + sig + " end\n";
                } */
                else
                {
                    outStr += "function " + cmd.signature + " end\n";
                }
            }
        }

        /* public static string cleanParam(CommandInfo cmd, ref string outStr)
        {

        } */
    }
}