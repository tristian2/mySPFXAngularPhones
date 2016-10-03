using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Newtonsoft.Json;
using System.Net.Http;
using System.Xml.Linq;
using ServiceStack;
using System.Globalization;

/// <summary>
/// so this is a console app to get the github json for the phones into an xml structure that can be manually copied into the list schema xml, so that we can populate the sharepoint list with data
/// </summary>
namespace GetPhoneJSONASXML
{
    class Program
    {

        static TextInfo info = CultureInfo.CurrentCulture.TextInfo;        
        static void Main(string[] args)
        {


            var url = "https://raw.githubusercontent.com/angular/angular-phonecat/master/app/phones/phones.json";
            var jsonOutput = string.Empty;
            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());
                jsonOutput = reader.ReadToEnd();
                //Console.WriteLine("THIS IS JSON OUTPUT: " + jsonOutput);
            }


            var doc = JsonConvert.DeserializeXmlNode("{\"Row\":" + jsonOutput + "}", "Rows");

            Convert(doc.DocumentElement);
            Console.WriteLine(XDocument.Parse(doc.InnerXml));
            
            Console.ReadLine();
        }

        private static void Convert(XmlElement element)
        {
            foreach (var child in element.ChildNodes.OfType<XmlElement>().ToList())
            {
                if (child.ChildNodes.OfType<XmlElement>().Any())
                {
                    Convert(child);
                }
                else
                {
                    var node = element.OwnerDocument.CreateElement("Field");
                    switch (child.LocalName) {
                        case "name":
                            node.SetAttribute("Name", "Title");
                            break;
                        case "id":
                            node.SetAttribute("Name", "PhoneId");
                            break;
                        case "imageUrl":
                            node.SetAttribute("Name", "ImageURL");
                            break;
                        default:
                            node.SetAttribute("Name", info.ToTitleCase(child.LocalName));
                            break;
                    }
                    
                    element.RemoveChild(child);
                    element.AppendChild(node);//.Attributes.Append()
                    element.AppendChild(node).InnerText = child.InnerText;
                }
            }
        }

    }
}
