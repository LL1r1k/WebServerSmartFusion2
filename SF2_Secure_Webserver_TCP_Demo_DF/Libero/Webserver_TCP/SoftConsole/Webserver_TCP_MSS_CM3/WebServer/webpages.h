#ifndef WEBPAGES_H_
#define WEBPAGES_H_
#endif
/*
*/
const static char data_Gadgets_html[]="<HTML>\
					 <head><title>SmartFusion2 Gadgets</title></head>\
					 <body><table width=\"100%\" cellspacing=\"1\">\
					 <tr><td height=\"15\"></td></tr>\
					 <tr><td colspan=\"5\" align=\"center\" ><b><font color=\"#333333\"><font size=\"5\">SmartFusion2 Gadgets</font></font><b>\
					 </td></tr>\
					 <tr><td><script src=\"https://www.gmodules.com/ig/ifr?url=https://www.throttled.org/googlegadgets/youtubesearch.xml\"></script></td>\
					 <tr><td><script src=\"https://www.gmodules.com/ig/ifr?url=https://adwebmaster.net/datetimemulti/datetimemulti.xml&amp;up_color=medgreen&amp;up_txtcolor=softnavy&amp;up_lang=en&amp;up_formattime=24%3A00%3A00&amp;up_formatdisplaytime=12&amp;up_timezoneadd=0&amp;up_startcalendar=0&amp;up_elementscached=1&amp;up_affactualtime=1&amp;up_afftimesec=1&amp;up_affcalendar=1&amp;up_affcalendarlongday=0&amp;up_affbigpub022009=1&amp;up_formattempshorloge=analogue&amp;synd=open&amp;w=368&amp;h=215&amp;title=Clock+%2B+Calander&amp;lang=en&amp;country=ALL&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js\"></script></td>\
					 <td align=\"center\"><script src=\"https://www.gmodules.com/ig/ifr?url=https://aruljohn.com/gadget/zip.xml&amp;synd=open&amp;w=320&amp;h=120&amp;title=US+Zip+Code+Lookup&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js\"></script></td>\
					 <tr><td></td></tr>\
					 <tr><td></td><td class=\"tmp\" colspan=\"2\" align=\"center\">\
					 <form><input type = \"Button\" value = \"Home\" onclick = \"window.location.href='index.html'\"></form>\
					 </td><td></td></tr>\
					 </table></form>\
					 </body></HTML>";

static const unsigned char data_google_html[]="<HTML>\
 <head><title>SmartFusion2 Google Search</title></head><body><tr><td colspan=\"5\" align=\"center\" ><b><font color=\"#333333\"><font size=\"4\">SmartFusion2 Google Search</font></font><b>\
							 </td></tr>\\
<script>\
  (function() {\
    var cx = '000926988212774978601:owozj69dwpi';\
    var gcse = document.createElement('script');\
    gcse.type = 'text/javascript';\
    gcse.async = true;\
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;\
    var s = document.getElementsByTagName('script')[0];\
    s.parentNode.insertBefore(gcse, s);\
  })();\
</script>\
<gcse:search></gcse:search>";

/*index.html*/


		const static char http_index_html[]="<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"><HTML><HEAD><TITLE> SmartFusion2 Webserver</TITLE>\
		<meta content=\"text/html; charset=UTF-8\" http-equiv=\"content-type\">\
		<STYLE>.tbl_text {\
			FONT-SIZE: 13px; FONT-FAMILY: Verdana\
		}\
		.tmp A {\
			FONT-WEIGHT: bold; FONT-SIZE: 13px; BORDER-LEFT: #d3d3d3 1px solid; WIDTH: 108px; COLOR: #ffffff; LINE-HEIGHT: 26px; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #004080; TEXT-ALIGN: center; TEXT-DECORATION: none\
		}\
		.tmp A:link {\
			BORDER-RIGHT: silver outset; PADDING-RIGHT: 0.2em; BORDER-TOP: silver outset; DISPLAY: block; PADDING-LEFT: 0.2em; PADDING-BOTTOM: 0.2em; BORDER-LEFT: silver outset; WIDTH: auto; LINE-HEIGHT: 1.4; PADDING-TOP: 0.2em; BORDER-BOTTOM: silver outset; TEXT-DECORATION: none\
		}\
		A:visited {\
			BORDER-RIGHT: silver outset; PADDING-RIGHT: 0.2em; BORDER-TOP: silver outset; DISPLAY: block; PADDING-LEFT: 0.2em; PADDING-BOTTOM: 0.2em; BORDER-LEFT: silver outset; WIDTH: auto; LINE-HEIGHT: 1.4; PADDING-TOP: 0.2em; BORDER-BOTTOM: silver outset; TEXT-DECORATION: none\
		}\
		tmp A:hover {\
			BACKGROUND-COLOR: #2b8c03\
		}\
		.none A {\
			COLOR: blue\
		}\
		.none A:visited {\
			BORDER-RIGHT: medium none; PADDING-RIGHT: 0px; BORDER-TOP: medium none; DISPLAY: inline; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; BORDER-LEFT: medium none; LINE-HEIGHT: 1; PADDING-TOP: 0px; BORDER-BOTTOM: medium none; TEXT-DECORATION: none\
		}\
		</STYLE>\
		<META content=\"MSHTML 6.00.2900.5726\" name=GENERATOR></HEAD>\
		<BODY>\
		<FORM action=index.html method=get>\
		<TABLE class=tbl_text height=\"50%\" cellSpacing=1 cellPadding=1 width=\"30%\"\
		align=center>\
		  <TBODY>\
		   <TR>\
		   <TD align=middle colSpan=2><B><h2>SmartFusion2 Secure Webserver Demonstration</h2><B></B></B></TD></TR>\
		   <TR>\
		    <TD></TD></TR>\
		  <TR>\
		    </TR>\
		  <TR>\
		      <TD class=tmp><A href=\"LED\">Blinking LEDs\
		    </A></TD></TR>\
		  <TR>\
		    <TD class=tmp align=right><A href=\"HyperTerminal\">HyperTerminal Display\
		   </A></TD></TR>\
		  <TR>\
		<TD class=tmp align=right><A href=\"google_search.htm\">SmartFusion2 Google Search</A></TD></TR>\
		    </TR>\
		<TR>\
		    <TD>&nbsp;</TD></TR>\
		  <TR>\
		    <TD>&nbsp;</TD></TR></TBODY></TABLE>\
		<TABLE class=tbl_text width=\"60%\" align=center>\
		  <TBODY>\
		 <TR>\
		    <TD class=none align=middle>\
		      <P>For More information about SmartFusion2 products, refer to the Microsemi SoC Products website:<br>\
					<A href=\"http://www.microsemi.com/products/fpga-soc/soc-fpga/smartfusion2\")>http://www.microsemi.com/products/fpga-soc/soc-fpga/smartfusion2</A></P>\
		 </TD></TR></TBODY></TABLE></FORM></BODY></HTML>";
		/*RTC and Ethernet Interface data display */

		const static char http_index_html2[] = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\
		<html dir=\"ltr\"><head>\
		    <meta content=\"text/html; charset=UTF-8\" http-equiv=\"content-type\">\
		    <title><H1>Microsemi SmartFusion2 Demo<H1></title>\
		\
		    <meta content=\"cyriljean\" name=\"author\"><meta content=\"BlueGriffon\
		      wysiwyg editor\" name=\"generator\">\
		    <style type=\"text/css\">\
		        .bodyText {\
		            font-family: Arial, Helvetica, sans-serif;\
		            font-size: 12px;\
		            color: #333333;\
		        }\
		        .headline2 {\
		            font-family: Arial, Helvetica, sans-serif;\
		            font-size: 12px;\
		            font-weight: bold;\
		            color: #333333;\
		        }\
		        .headline1 {\
		            font-family: \"Trebuchet MS\";\
		            font-size: 18px;\
		            font-weight: bold;\
		            color: #003399;\
		        }\
		        .smallText {\
		            font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;\
		            font-size: 9px;\
		            color: #666666;\
		        }\
		        .top_headline {\
		            font-family: Arial, Helvetica, sans-serif;\
		            font-size: 22px;\
		            color: #333333;\
		            padding-top: 5px;\
				  font-weight: bold;\
		        }\
		        </style>\
		  </head>\
		<body>\
		<table border=\"0\" width=\"800\" align=\"center\">\r\
		  <tbody>\r\
		    <tr>\r\
		  <td width=\"50%\"><p class=\"top_headline\" style=\"text-align: center;\">RTC and Ethernet Interface data display </p></td>\r\
		    </tr>\r\
		  </tbody>\r\
		</table>\r\
		<hr width=\"800\" />\r\
		<table border=\"0\" width=\"800\" align=\"center\">\r\
		      <tbody>\r\
		        <tr>\r\
		          <td width=\"50%\" colspan=\"1\" rowspan=\"2\"><div class=\"headline1\" style=\"text-align: center;\"><span style=\"font-weight: bold;\">Ethernet Interface</span><br></div>\r\
		            <table border=\"0\" width=\"60%\" align=\"center\" cellspacing=\"10\">\r\
		              <tbody class=\"bodyText\">\r\
		                <tr>\r\
		                  <td class=\"headline2\" width=\"50%\" style=\"text-align: right;\">MAC Address:<br></td>\r\
		                  <td id=\"MAC_Addr\" width=\"50%\" style=\"text-align: center;\">-<br></td>\r\
		                </tr>\r\
		                <tr>\r\
		                  <td class=\"headline2\" style=\"text-align: right;\">TCP/IP Address:<br></td>\r\
		                  <td id=\"TCPIP_Addr\" style=\"text-align: center;\">-<br></td>\r\
		                </tr>\r\
		                <tr>\r\
		                  <td class=\"headline2\" style=\"text-align: right;\">Speed:<br></td>\r\
		                  <td id=\"LinkSpeed\" style=\"text-align: center;\">-<br></td>\r\
		                </tr>\r\
		                <tr>\r\
		                  <td><br></td>\r\
		                  <td id=\"DebugStatus\"><br></td>\r\
		                </tr>\r\
		              </tbody>\r\
		            </table>\r\
		          </td>\r\
		          <td>\r\
		            <div class=\"headline1\" style=\"text-align: center;\"><span style=\"font-weight: bold;\">Real Time Counter</span><br>\r\
		            </div>\r\
		            <table border=\"0\" width=\"30%\" align=\"center\" cellspacing=\"10\">\r\
		              <tbody class=\"bodyText\">\r\
		                <tr>\r\
		                  <td width=\"40%\"><div class=\"headline2\" style=\"text-align: center;\">Time:<br></div></td>\r\
		                  <td width=\"20%\"><div id=\"CurrentRTCTime\" style=\"text-align: center;\">-<br></div></td>\r\
		                </tr>\r\
		                <tr>\r\
		                  <td width=\"40%\"><div class=\"headline2\" style=\"text-align: center;\">Date:<br></div></td>\r\
		                  <td width=\"20%\"><div id=\"Current_RTC_Date\" style=\"text-align: center;\">-<br></div></td>\r\
		                </tr>\r\
		              </tbody>\r\
		            </table>\r\
		          </td>\r\
		        </tr>\r\
		        <tr>\r\
		          <td>\r\
		            <hr />\r\
		            <div class=\"headline1\" width=\"50%\" style=\"text-align: center; font-weight: bold;\">Change RTC value<br></div>\r\
		            <table border=\"0\" width=\"65%\" align=\"center\" cellspacing=\"10\">\r\
		              <tbody class=\"bodyText\">\r\
		                <tr>\r\
		                  <td>\r\
		                    <table border=\"0\" width=\"100%\" align=\"center\">\r\
		                      <tbody class=\"bodyText\">\r\
		                        <tr>\r\
		                            <td  class=\"headline2\">Time (hh:mm:ss):</td>\r\
		                            <td><input id=\"SetTime\" type=\"text\" name=\"time\" maxlength=\"8\" size=\"8\" value=\"00:00:00\"  style=\"text-align: center;\" /></td>\r\
		                            <td><button onclick=\"post_new_time_request();\">Set</button></td>\r\
		                        </tr>\r\
		                      </tbody>\r\
		                    </table>\r\
		                    </td>\r\
		                </tr>\r\
		                <tr>\r\
		                  <td>\r\
		                    <table border=\"0\" width=\"100%\" align=\"center\">\r\
		                      <tbody class=\"bodyText\">\r\
		                        <tr>\r\
		                            <td  class=\"headline2\">Date (dd/mm/yy):</td>\r\
		                            <td><input id=\"SetDate\" type=\"text\" name=\"time\" maxlength=\"8\" size=\"8\" value=\"00:00:00\"  style=\"text-align: center;\" /></td>\r\
		                            <td><button onclick=\"post_new_date_request();\">Set</button></td>\r\
		                        </tr>\r\
		                      </tbody>\r\
		                    </table>\r\
		                    </td>\r\
		                </tr>\r\
		                <tr>\r\
		                  <td>\r\
		                    </td>\r\
		                </tr>\r\
		              </tbody>\r\
		            </table>\r\
		          </td>\r\
		        </tr>\r\
		      </tbody>\r\
		    \r\
		</table>\r\
		<hr width=\"800\" />\r\
		<div class=\"smallText\" width=\"50%\" style=\"text-align: center; font-weight: bold;\">\r\
		<input type = \"Button\"   value = \"Home\" onclick = \"window.location.href='index.html'\"></div>\
		<p><br>\
		    </p>\r\
		<script type=\"text/javascript\">\r\
		function update_page() {\r\
		    var request = new XMLHttpsRequest();\r\
		    request.open(\"GET\",\"status\");\r\
		    request.onreadystatechange = function() {\r\
		        if(request.readyState === 4 && request.status === 200) {\r\
		            var parsed_status = JSON.parse(request.responseText);\r\
		            var mac_addr = document.getElementById(\"MAC_Addr\");\r\
		            mac_addr.innerHTML = parsed_status.MAC_Addr;\r\
		            var tcpip_addr = document.getElementById(\"TCPIP_Addr\");\r\
		            tcpip_addr.innerHTML = parsed_status.TCPIP_Addr;\r\
		            var link_speed = document.getElementById(\"LinkSpeed\");\r\
		            link_speed.innerHTML = parsed_status.LinkSpeed;\r\
		            var current_time = document.getElementById(\"CurrentRTCTime\");\r\
		            current_time.innerHTML = parsed_status.CurrentRTCTime;\r\
		            var current_date = document.getElementById(\"Current_RTC_Date\");\r\
		            current_date.innerHTML = parsed_status.Current_RTC_Date;\r\
		        };\r\
		    };\r\
		    request.send(null);\r\
		};\r\
		\r\
		function encodeFormData(data) {\r\
		    if (!data) return \"\";\r\
		    var pairs = [];\r\
		    for(var name in data) {\r\
		        if (!data.hasOwnProperty(name)) continue;\r\
		        if (typeof data[name] === \"function\") continue;\r\
		        var value = data[name].toString();\r\
		        name = encodeURIComponent(name.replace(\" \", \"+\"));\r\
		        value = encodeURIComponent(value.replace(\" \", \"+\"));\r\
		        pairs.push(name + \"=\" + value);\r\
		    }\r\
		    return pairs.join('&');\r\
		}\r\
		\r\
		function post_new_time_request() {\r\
		    var req_data = { secs:0, ns:0};\r\
		    req_data.secs = document.getElementById(\"SetTime\").value;\r\
		    var request = new XMLHttpRequest();\r\
		    request.open(\"GET\",\"trigger0?\" + encodeFormData(req_data));\r\
		    request.send(null);\r\
		};\r\
		\r\
		function post_new_date_request() {\r\
		    var req_data = { secs:0, ns:0};\r\
		    req_data.secs = document.getElementById(\"SetDate\").value;\r\
		    var request = new XMLHttpRequest();\r\
		    request.open(\"GET\",\"trigger1?\" + encodeFormData(req_data));\r\
		    request.send(null);\r\
		};\r\
		\r\
		window.onload = function() {\r\
		    document.getElementById(\"SetTime\").value = \"09:15:35\";\r\
		    document.getElementById(\"SetDate\").value = \"15/07/13\";\r\
		    setInterval(update_page, 500);\r\
		};\r\
		</script>\r\
		</body></html>";
