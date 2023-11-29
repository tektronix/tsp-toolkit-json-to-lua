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
            public string enums { get; set; }
            public string Type { get; set; }
        }
        public class CommandEnum
        {
            public string enum_number { get; set; }
            public string enum_member { get; set; }
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
            public string webhelpfile { get; set; }
            public string signature { get; set; }
            public string command_return { get; set; }
            public string description { get; set; }
            public CommandType command_type { get; set; }
            public string[] usage { get; set; }
            public string default_value { get; set; }
            public string details { get; set; }
            public Example_Info[] example_info { get; set; }
            public string related_commands { get; set; }
            public ParamInfo[] param_info { get; set; }
            public string[] overloads { get; set; }
            public string supportedModels { get; set; }
            public string tsplink_supported { get; set; }
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

        public static IList<CommandInfo> PopulateCommands(ref JObject obj, string feild)
        {
            IList<CommandInfo> cmdList = obj[feild].ToArray().Select(p => new CommandInfo
            {
                name = (string)p["name"],
                webhelpfile = (string)p["webhelpfile"],
                signature = (string)p["signature"],
                tsplink_supported = (string)p["tsp_link"],
                description = (string)p["description"],
                command_type = ((string)p["type"] == "Function\n" ? CommandType.Function : ((string)p["type"] == "Attribute (RW)\n" ? CommandType.Attribute_RW : ((string)p["type"] == "Attribute (Ro)\n") ? CommandType.Attribute_RO : CommandType.Attribute_WO)),
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
                    enums = pi["enum"].ToString(),
                    Type = pi["type"].ToString(),
                }).ToArray(),
                related_commands = "TODO",
                supportedModels = (string)p["supported_models"]

            }).ToList();

            return cmdList;
        }

        public static bool arrayCheck(string[] arr, string str, string type_name, out string table)
        {
            table = "";
            foreach (var item in arr)
            {
                if (str.Contains(item))
                {
                    table = str.Replace(item, type_name);
                    return true;
                }
                else
                    return false;
            }
            return false;
        }
        public static void PrintFields(int depth, string help_file_path, ref Dictionary<string, Dictionary<string, CommandInfo>>[] instrTable, ref string outStr, ref string tsplinkStr, ref string[] arrList, string item)
        {
            string table_name = "";
            string type_name = "";
            for (int i = 0; i < depth; i++)
            {
                foreach (var keyValuePair in instrTable[i])
                {
                    string class_data = "";
                    if (item != "null")
                    {
                        foreach (var keyvalue in keyValuePair.Value)
                        {
                            bool a = keyvalue.Value.supportedModels.Contains(item);
                            if (a == true && !item.Contains("-L") && (item.Contains("2604B") || item.Contains("2614B") || item.Contains("2634B")))
                            {
                                return;
                            }
                            continue;
                        }
                    }

                    if (keyValuePair.Key.Contains("localnode.settimme()"))
                        continue;
                    //Handling Arrays in commands
                    if (keyValuePair.Key.Contains("[N]") || keyValuePair.Key.Contains("[Y]") || keyValuePair.Key.Contains("[slot]") || keyValuePair.Key.Contains("[1]") || keyValuePair.Key.Contains("[X]"))
                    {
                        if (keyValuePair.Key.Contains("[N]"))
                        {
                            table_name = keyValuePair.Key.Replace("[N]", "");
                            type_name = keyValuePair.Key.Replace("[N]", "|").Split('|')[0].Replace(".", "") + "Arr";
                        }
                        else if (keyValuePair.Key.Contains("[Y]"))
                        {
                            table_name = keyValuePair.Key.Replace("[Y]", "");
                            type_name = keyValuePair.Key.Replace("[Y]", "|").Split('|')[0].Replace(".", "") + "Arr";
                        }
                        else if (keyValuePair.Key.Contains("[1]"))
                        {
                            table_name = keyValuePair.Key.Replace("[1]", "");
                            type_name = keyValuePair.Key.Replace("[1]", "|").Split('|')[0].Replace(".", "") + "Arr";
                        }
                        else if (keyValuePair.Key.Contains("[slot]"))
                        {
                            table_name = keyValuePair.Key.Replace("[slot]", "");
                            type_name = keyValuePair.Key.Replace("[slot]", "|").Split('|')[0].Replace(".", "") + "Arr";
                        }
                        else
                        {
                            table_name = keyValuePair.Key.Replace("[X]", "");
                            type_name = keyValuePair.Key.Replace("[X]", "|").Split('|')[0].Replace(".", "") + "Arr";
                        }

                        if (!arrList.Contains(type_name))
                        {
                            arrList = arrList.Append(type_name).ToArray();
                            class_data += "---@class " + type_name + "\n";
                            class_data += type_name + " = {}\n\n";

                            class_data += "---@type " + type_name + "[]\n";
                            class_data += table_name + " = {}\n";
                        }
                        else
                        {
                            class_data += "---@type " + type_name + "[]\n";
                            string rem = "";
                            if (keyValuePair.Key.Contains("[N]"))
                                rem = keyValuePair.Key.Replace("[N]", "|").Split('|')[1];
                            else if (keyValuePair.Key.Contains("[Y]"))
                                rem = keyValuePair.Key.Replace("[Y]", "|").Split('|')[1];
                            else if (keyValuePair.Key.Contains("[1]"))
                                rem = keyValuePair.Key.Replace("[1]", "|").Split('|')[1];
                            else if (keyValuePair.Key.Contains("[X]"))
                                rem = keyValuePair.Key.Replace("[X]", "|").Split('|')[1];
                            else
                                rem = keyValuePair.Key.Replace("[slot]", "|").Split('|')[1];
                            class_data += type_name + rem + " = {}\n";
                        }

                    }
                    else
                    {
                        //table_name = keyValuePair.Key.Replace("[1]",""); //DMM6500 slot[1]
                        table_name = keyValuePair.Key;
                        if (!table_name.Contains("bufferVar") && !table_name.Contains(".setblock()"))
                        {
                            class_data += "---@class " + table_name + "\n";
                            if (i == 0)
                                class_data += table_name + " = {}\n";
                            else
                                class_data += table_name + " = {}\n";
                        }
                    }
                    outStr += class_data;
                    outStr += "\n\n";

                    bool class_data_populated = false;
                    foreach (var keyvalue in keyValuePair.Value)
                    {
                        HelpContent(keyvalue.Value, help_file_path, ref outStr, ref tsplinkStr, class_data, class_data_populated, keyValuePair.Key, keyvalue.Key, false);
                        class_data_populated = true;
                    }
                }
            }
        }

        public static void HelpContent(CommandInfo cmd, string help_file_path, ref string outStr, ref string tsplinkStr, string class_data, bool class_data_populated, string table, string attr, bool directCall)
        {
            string command_help = "";
            if (cmd.name.Contains("node[N].execute()"))
                System.Console.WriteLine(cmd.name);

            string[] example = new string[] { };
            string[] enum_class = new string[] { };

            #region Enum_Population
            foreach (var param in cmd.param_info)
            {
                if (cmd.usage.Length == 0)
                    continue;
                else if ((cmd.command_type == CommandType.Attribute_RW) && (cmd.usage.Length == 1) && (!cmd.usage[0].Contains(param.Name)))
                    continue;
                else if ((cmd.command_type == CommandType.Attribute_RW) && (cmd.usage.Length > 1) && (!cmd.usage[0].Contains(param.Name) || !cmd.usage[1].Contains(param.Name)))
                    continue;
                else if ((cmd.command_type == CommandType.Attribute_RO) && (!cmd.usage[0].Contains(param.Name)))
                    continue;
                else if ((cmd.command_type == CommandType.Function) && ((!cmd.signature.Contains(param.Name) && !cmd.command_return.Contains(param.Name))) && cmd.name != "eventlog.suppress()")
                    continue;
                else if (param.enums != "")
                {
                    string[] enum_data = param.enums.Split('|');
                    command_help += "\n";
                    foreach (var data in enum_data)
                    {
                        command_help += data.Split(' ')[0] + " = " + data.Split(' ')[1] + "\n";
                    }
                    command_help += "\n---@alias " + param.Type + "\n";
                    foreach (var data in enum_data)
                    {
                        command_help += "---|`" + data.Split(' ')[0] + "`\n";
                    }
                    command_help += "\n";
                }
            }
            //}
            command_help += "\n";
            #endregion            

            var helpFilePath = $@"{help_file_path}/{cmd.webhelpfile}";
            command_help += "\n--- **" + cmd.description + "**\n---\n"
            + "--- *Type:*  " + cmd.command_type + "\n---\n"
            + "--- *Details:*<br>\n--- " + cmd.details + "\n---\n"
            + "---[command help](command:kic.viewHelpDocument?[\"" + helpFilePath + "\"])" + "\n---\n"
            + "---<br>*Examples:*<br>\n"
            + "--- ```lua\n";

            foreach (var x in cmd.example_info)
            {
                var exmp = x.example.Split(";");
                foreach (var item in exmp)
                {
                    command_help += "--- " + item + "\n";
                }
                //outStr += "--- " + x.example + "\n"
                command_help += "--- --" + x.description;
            }
            command_help += "--- ```\n";

            if (cmd.name.Contains("trigger.BLOCK_"))
            {
                command_help += "--- Additional paramteres are:\n";
                foreach (var param in cmd.param_info)
                {                    
                    if (param.Name != "blockNumber" && param.Name != cmd.name)
                    {
                        command_help +="--- - *"+ param.Name +"*: " + param.Description +"<br>\n";
                        if (param.enums != "")
                        {
                            string[] enum_data = param.enums.Split('|');
                            //command_help += "---\n--- This has a paraamter **" + param.Name + "** , that accepets following enum inputs:\n";
                            foreach (var data in enum_data)
                            {
                                command_help += "---    ```" + data.Split(' ')[0] + "```<br>\n";
                            }
                        }
                    }
                }
            }

            /* if (table.Contains("bufferVar"))
            {
                if (cmd.signature.Contains("[N]"))
                {
                    outStr += "---@type integer[]\n";
                    outStr += "bufferMethods." + attr + "= {}\n";
                }
                else
                {
                    if (cmd.command_type == CommandType.Function)
                        outStr += "function bufferMethods." + attr + "end \n";
                    else
                        outStr += "bufferMethods." + attr + "= 0\n";
                }
                return;
            } */

            if (cmd.command_type == CommandType.Function)
            {
                foreach (var param in cmd.param_info)
                {
                    int start = cmd.signature.IndexOf("(") + 1;
                    int end = cmd.signature.IndexOf(")", start);
                    string[] s;
                    try
                    {
                        s = cmd.signature.Substring(start, end - start).Replace(" ", "").Split(',');
                    }
                    catch (System.Exception)
                    {
                        s = new string[] { };
                    }
                    if (s.Contains(param.Name))
                    {
                        string temp = "\"" + param.Name + "\"";
                        command_help += "---@param " + param.Name;

                        if (s.Contains(temp))
                            command_help += " " + param.Type + " ";
                        //else
                        command_help += " " + param.Type + " ";
                        command_help += param.Description + "\n";
                    }
                    else if (cmd.command_return.Contains(param.Name))
                    {
                        command_help += "---@return ";

                        if (param.Name.Contains("fileNumber"))
                            command_help += "file_object ";
                        else if (param.Name.Contains("scriptVar"))
                            command_help += "script_object ";
                        else if (param.Name.Contains("bufferName") || param.Name.Contains("bufferVar"))
                            command_help += "bufferMethods ";
                        else if (param.Name.Contains("connectionID"))
                            command_help += "tsplinkConnectionID ";
                        else
                            command_help += param.Type + " ";

                        command_help += param.Name + " " + param.Description + "\n";
                    }
                    else if (cmd.name == "display.input.option()")
                    {
                        command_help += "---@return displayInputOption displayOption";
                    }
                    /* else if(cmd.name == "eventlog.suppress()")
                    {
                        outStr += "---@param eventType eventlogsuppresseventType\n";
                    } */
                }
                cmd.signature = cmd.signature.Replace("\"", "");
            }

            if (cmd.command_type != CommandType.Function && (cmd.command_type != CommandType.Attribute_WO && !cmd.name.Contains(" trigger.BLOCK_")))
            {
                foreach (var parm in cmd.param_info)
                {
                    if (parm.enums != "")
                    {
                        if (cmd.usage[0].Contains(parm.Name))// || cmd.usage[1].Contains(parm.Name))
                            command_help += "---@type " + parm.Type + "\n";
                    }
                }

                if (table.Contains("[N]") || table.Contains("[Y]") || table.Contains("[slot]") || table.Contains("[1]") || table.Contains("[X]"))
                {
                    string[] a = table.Split('[');
                    string type_name = a[0].Replace(".", "") + "Arr";
                    if (table.Contains("[N]"))
                    {
                        a[1] = a[1].Replace("N]", "");
                    }
                    if (table.Contains("[Y]"))
                    {
                        a[1] = a[1].Replace("Y]", "");
                    }
                    if (table.Contains("[slot]"))
                    {
                        a[1] = a[1].Replace("slot]", "");
                    }
                    if (table.Contains("[1]"))
                    {
                        a[1] = a[1].Replace("1]", "");
                    }
                    if (table.Contains("[X]"))
                    {
                        a[1] = a[1].Replace("X]", "");
                    }

                    if (a[1] != "")
                    {
                        if (attr.Contains("stimulus") && !attr.Contains("["))
                        {
                            command_help += "---@type eventID|0\n";
                        }
                        command_help += type_name + a[1] + "." + attr + "= 0\n\n";
                    }
                    else
                    {
                        if (attr.Contains("stimulus["))
                        {
                            command_help += "---@type eventID[]|0\n";
                            attr = attr.Remove(attr.Length - 3, 3);
                            command_help += type_name + a[1] + "." + attr + "= 0\n\n";
                        }
                        else if (attr.Contains("stimulus") && !attr.Contains("["))
                        {
                            command_help += "---@type eventID|0\n";
                            command_help += type_name + a[1] + "." + attr + "= 0\n\n";
                        }
                        else
                            command_help += type_name + "." + attr + "= 0\n\n";
                    }

                }
                else if (table.Contains("bufferVar") || table.Contains("bufferName"))
                {
                    if (cmd.signature.Contains("[N]"))
                    {
                        command_help += "---@type integer[]\n";
                        command_help += "bufferMethods." + attr + "= {}\n";
                    }
                    else
                    {
                        outStr += "bufferMethods." + attr + "= 0\n";
                    }
                    //outStr += "bufferMethods" + "." + attr + " = 0\n\n";
                }
                else if (table.Contains("scriptVar"))
                {
                    command_help += "script_object" + "." + attr + " = 0\n\n";
                }
                else if (attr.Contains("address[N]"))
                {
                    command_help += "---@type integer[]\n";
                    attr = attr.Replace("[N]", "");
                    command_help += table + "." + attr + " = 0\n\n";
                }
                else if (attr.Contains("stimulus"))
                {
                    command_help += "---@type triggerEvents|0\n";
                    command_help += table + "." + attr + "= 0\n\n";
                }
                else if (attr.Contains("[N]"))
                {
                    command_help += "---@type integer[]\n";
                    attr = attr.Remove(attr.Length - 3, 3);
                    command_help += table + "." + attr + "= 0\n\n";
                }
                else if (attr.Contains("level") && table.Contains("smu.source.protect")) //2461
                {
                    command_help += "---@type smuSourceProtectionLevel\n";
                    command_help += table + "." + attr + " = 0\n\n";
                }
                else if (attr.Contains("EVENT_ID"))
                {
                    command_help += "---@type eventID\n";
                    command_help += table + "." + attr + "= nil\n";
                }
                else
                {
                    if (directCall)
                    {
                        cmd.name = cmd.name.Replace("*", "star_");
                        command_help += cmd.name + "= 0\n\n";
                    }
                    else
                        command_help += table + "." + attr + " = 0\n\n";
                }
            }
            else if (cmd.command_type == CommandType.Function || (cmd.command_type == CommandType.Attribute_WO && cmd.name.Contains(" trigger.BLOCK_")))
            {
                if (cmd.overloads.Length > 0 && !cmd.name.Contains("trigger.BLOCK_"))
                {
                    // System.Console.WriteLine(cmd.signature);
                    foreach (var sig in cmd.overloads)
                    {
                        System.Console.WriteLine(sig);
                        int startIndex = sig.IndexOf("(") + 1;
                        int endIndex = sig.IndexOf(")", startIndex);
                        var overlad_params = sig.Substring(startIndex, endIndex - startIndex).Split(',').Select(str => str.Trim()).ToList();
                        IList<string> overload_sig_and_type = new List<string>();
                        var returnType = "";
                        foreach (var param in cmd.param_info)
                        {
                            if (cmd.command_return.Contains(param.Name))
                                returnType = $":{param.Type}";
                            if (overlad_params.Contains(param.Name))
                            {
                                overload_sig_and_type.Add($"{param.Name}:{param.Type}");
                            }
                        }

                        System.Console.WriteLine(overload_sig_and_type);
                        command_help += getOverloadDoc($"({string.Join(",", overload_sig_and_type)}){returnType}") + "\n";
                    }
                }
                else
                {
                    if (cmd.name.Contains("trigger.BLOCK_") && cmd.overloads.Length > 0)
                        command_help += "--\n--- Overloads are:\n";
                    foreach (var sig in cmd.overloads)
                    {
                        command_help += "--- - " + sig + "\n";
                    }
                }

                if (table.Contains("[N]") || table.Contains("[Y]") || table.Contains("[slot]") || table.Contains("[X]"))
                {
                    string[] a = cmd.signature.Split('[');
                    //string[] a = table.Split('[');
                    string type_name = a[0].Replace(".", "") + "Arr";
                    if (table.Contains("[N]"))
                    {
                        a[1] = a[1].Replace("N]", "");
                    }
                    if (table.Contains("[Y]"))
                    {
                        a[1] = a[1].Replace("Y]", "");
                    }
                    if (table.Contains("[slot]"))
                    {
                        a[1] = a[1].Replace("slot]", "");
                    }
                    if (table.Contains("[X]"))
                    {
                        a[1] = a[1].Replace("X]", "");
                    }

                    command_help += "function " + type_name + a[1] + " end\n\n";
                }
                else if (cmd.signature.Contains("scriptVar"))
                {
                    string sig = cmd.signature.Replace("scriptVar", "script_object");
                    command_help += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains("fileVar"))
                {
                    string sig = cmd.signature.Replace("fileVar", "file_object");
                    command_help += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains(".catalog()"))
                {
                    try
                    {
                        if (cmd.signature.Contains("display.loadmenu"))
                            cmd.signature = cmd.signature.Split(' ')[4];
                        else
                            cmd.signature = cmd.signature.Split(' ')[3];
                        command_help += "function " + cmd.signature + " end\n";
                    }
                    catch
                    {
                        command_help += "function " + cmd.signature + " end\n";
                    }
                }
                else if (cmd.signature.Contains("bufferName."))
                {
                    string sig = cmd.signature.Replace("bufferName.", "bufferMethods.");
                    command_help += "function " + sig + " end\n";
                }
                else if (cmd.signature.Contains("bufferVar."))
                {
                    string sig = cmd.signature.Replace("bufferVar.", "bufferMethods.");
                    command_help += "function " + sig + " end\n";
                }
                else
                {
                    if (cmd.command_type == CommandType.Function)
                        command_help += "function " + cmd.signature + " end\n";
                    else
                        command_help += table + "." + attr + " = 0\n\n";
                }
            }

            if (cmd.tsplink_supported.Contains("Yes"))
            {
                if (class_data_populated == false)
                    tsplinkStr += class_data;
                outStr += command_help;
                tsplinkStr += command_help;
            }
            if (cmd.tsplink_supported.Contains("No"))
            {
                outStr += command_help;
            }
        }

        public static string getOverloadDoc(string signature)
        {
            var outPut = $@"---@overload fun{signature}";
            return outPut;
        }
    }
}