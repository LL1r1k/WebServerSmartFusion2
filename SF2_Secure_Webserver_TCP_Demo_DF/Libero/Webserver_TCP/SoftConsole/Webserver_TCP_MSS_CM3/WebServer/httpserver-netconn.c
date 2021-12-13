/*******************************************************************************
 * (c) Copyright 2013 Microsemi SoC Producst Group.  All rights reserved.
 *
 *
 * SVN $Revision: 4956 $
 * SVN $Date: 2013-01-08 15:25:36 +0000 (Tue, 08 Jan 2013) $
 */

#include "lwip/opt.h"
#include "lwip/arch.h"
#include "lwip/api.h"

#include "httpserver-netconn.h"
#include "mss_sys_services.h"
#include "mss_gpio.h"
/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "queue.h"
#include "webpages.h"
#include "mss_rtc.h"
#include "m2sxxx.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>
///////////

#include "polarssl/x509.h"
//#include "polarssl/entropy.h"
//#include "polarssl/ctr_drbg.h"
#include "polarssl/ssl.h"
#include "polarssl/certs.h"
x509_cert srvcert;
rsa_context rsa;
extern const char test_srv_crt[];
extern const char test_ca_crt[];
extern const char test_srv_key[];
extern void led_test();
uint32_t rngs;

const char *dhm_G = "4";
const char *dhm_P =
"E4004C1F94182000103D883A448B3F802CE4B44A83301270002C20D0321CFD00" \
"11CCEF784C26A400F43DFB901BCA7538F2C6B176001CF5A0FD16D2C48B1D0C1C" \
"F6AC8E1DA6BCC3B4E1F96B0564965300FFA1D0B601EB2800F489AA512C4B248C" \
"01F76949A60BB7F00A40B1EAB64BDD48E8A700D60B7F1200FA8E77B0A979DABF";


////////////
#if LWIP_NETCONN

#ifndef HTTPD_DEBUG
#define HTTPD_DEBUG         LWIP_DBG_OFF
#endif

#define RTC_PRESCALER    (1000000u - 1u)        /* 1MhZ clock is RTC clock source. */

/*------------------------------------------------------------------------------
 * External functions.
 */
uint32_t get_ip_address(void);
void get_mac_address(uint8_t * mac_addr);

/*------------------------------------------------------------------------------
 *
 */
void handle_trigger_request(char * buf, u16_t len);
unsigned char hex_digits_to_byte(unsigned char u, unsigned char l);
/*------------------------------------------------------------------------------
 *
 */
//extern const char mscc_jpg_logo[8871];
char uip_appdata[1200];
uint8_t g_drbg_handle;
#define HTTP_RESPONSE \
    "HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n" \



/*------------------------------------------------------------------------------
 *
 */
const static unsigned char http_html_hdr[] = "HTTP/1.1 200 OK\r\nContent-type: text/html\r\n\r\n";
const static unsigned char http_json_hdr[] = "HTTP/1.1 200 OK\r\nContent-type: application/jsonrequest\r\n\r\n";

const static unsigned char http_post_resp_hdr[] = "HTTP/1.1 204 No Content\r\n\r\n";
const static unsigned char http_html_ok_hdr[] = "HTTP/1.1 200 OK\r\n\r\n";

/*------------------------------------------------------------------------------
 *
 */

int RandVal(void* arg,uint8_t* p,size_t length)
{

  uint8_t status;

  volatile uint32_t ret = 0;
#if HW_NRBG

    status = MSS_SYS_nrbg_generate(p,    /* p_requested_data */
	                                        0,               /* p_additional_input */
	                                        length,     /* requested_length */
	                                        0,               /* additional_input_length */
	                                        0,               /* pr_req */
	                                        g_drbg_handle);

  if(MSS_SYS_SUCCESS == status)
  {
	  //printf("%d,",length);
	  ret = 0;
  }
  else
  {
    //printf("nrbg failed %d \t",length);
    ret = 1;
  }


#else
  /* SW Return the random number */
  ret = rand();

#endif
  return(ret);
}

/*------------------------------------------------------------------------------
 *
 */
int json_resp_size;
static char status_json[400];

/*------------------------------------------------------------------------------
 *
 */

/* The queue used by PTPd task to transmit status information to webserver task. */
extern xQueueHandle xPTPdOutQueue;

/*------------------------------------------------------------------------------
 *
 */
/** Serve one HTTP connection accepted in the http thread */
/** Serve one HTTP connection accepted in the http thread */
static uint8_t
http_server_netconn_serve
(
		unsigned char * buf,
    mss_rtc_calendar_t * calendar_count,
    u16_t buflen
)
{

    //char *buf;
    //u16_t buflen;

    unsigned char c,i,leddata;
    char *tempStrPtr;
    char *tempStrPtr2;
    unsigned char Hyper_string[20];
    unsigned char Led_string[4];
    const char * mac_speed_lut[] =
    {
        "10Mbps",
        "100Mbps",
        "1000Mbps",
        "invalid"
    };

    /* Read the data from the port, blocking if nothing yet there. 
    We assume the request (the part we care about) is in one netbuf */


    
        /* Is this an HTTPs GET command? (only check the first 5 chars, since
        there are other formats for GET, and we're keeping it very simple )*/
        if(buflen >= 5 &&
           buf[0] == 'G' &&
           buf[1] == 'E' &&
           buf[2] == 'T' &&
           buf[3] == ' ' &&
           buf[4] == '/' )
        {
        	if( !strncmp( buf, "GET /RTCdata", 12 ) || !strncmp( buf, "GET /status", 11 )||!strncmp( buf, "GET /trigger0?", 14)||!strncmp( buf, "GET /trigger1?", 14))

           {
            	 if( buf[5]=='s')
            	  {

            		  uint32_t ip_addr;
            		  uint8_t mac_addr[6];
            		  uint32_t mac_speed_idx;

            		  ip_addr = get_ip_address();
            		  get_mac_address(mac_addr);
            		  mac_speed_idx = SYSREG->MAC_CR & 0x00000003u;

            		  json_resp_size = snprintf(status_json, sizeof(status_json),
                                          "{\r\n\"MAC_Addr\": \"%02x:%02x:%02x:%02x:%02x:%02x\",\"TCPIP_Addr\": \"%d.%d.%d.%d\",\r\n\"LinkSpeed\": \"%s\"\r,\
                                          \r\n",
                                          mac_addr[0], mac_addr[1], mac_addr[2], mac_addr[3], mac_addr[4], mac_addr[5],
                                          (int)(ip_addr & 0x000000FFu),
                                          (int)((ip_addr >> 8u) & 0x000000FFu),
                                          (int)((ip_addr >> 16u) & 0x000000FFu),
                                          (int)((ip_addr >> 24u) & 0x000000FFu),
                                          mac_speed_lut[mac_speed_idx]);

            		  json_resp_size += snprintf(&status_json[json_resp_size], sizeof(status_json),
                                           "\"CurrentRTCTime\": \"%02d:%02d:%02d\", ",
                                           calendar_count->hour,
                                           calendar_count->minute,
                                           calendar_count->second);

            		  json_resp_size += snprintf(&status_json[json_resp_size], sizeof(status_json),
                                           "\"Current_RTC_Date\": \"%02d/%02d/20%02d\" }\r\n",
                                           calendar_count->day,
                                           calendar_count->month,
                                           calendar_count->year);

            		  assert(json_resp_size < sizeof(status_json));
            		  if(json_resp_size > sizeof(status_json))
            		  {
            			  json_resp_size = sizeof(status_json);
            		  }

            		  //    Send the HTML header
            		  //  * subtract 1 from the size, since we dont send the \0 in the string
            		  //  * NETCONN_NOCOPY: our data is const static, so no need to copy it
                      return 1;
            		  //y netconn_write(conn, http_json_hdr, sizeof(http_json_hdr)-1, NETCONN_NOCOPY);

            		  //  Send our HTML page
                      //y netconn_write(conn, status_json, json_resp_size-1, NETCONN_NOCOPY);
					  }

					 else if(buf[5]=='i')
					  {
						 // netconn_write(conn, mscc_jpg_logo, sizeof(mscc_jpg_logo)-1, NETCONN_NOCOPY);
					  }
					  else if(buf[5]=='t')
					  {
						  handle_trigger_request(&buf[5], buflen - 5);
						  return 2;
						  //y netconn_write(conn, http_html_ok_hdr, sizeof(http_html_ok_hdr)-1, NETCONN_NOCOPY);
					  }
					 else

					 { /* Send the HTML header
        	                       * subtract 1 from the size, since we dont send the \0 in the string
        	                       * NETCONN_NOCOPY: our data is const static, so no need to copy it
        	                  */
						 return 3;
						 //y netconn_write(conn, http_html_hdr, sizeof(http_html_hdr)-1, NETCONN_NOCOPY);

        	            //      /* Send our HTML page */
						 //y netconn_write(conn, http_index_html2, sizeof(http_index_html2)-1, NETCONN_NOCOPY);

					 }
			 }
        	 else if( !strncmp( buf, "GET /LED", 8 ) )
			 {

						 snprintf((char *)uip_appdata, 1200,

																	"<META content=\"MSHTML 6.00.2900.5726\" name=GENERATOR></HEAD>"
						             	        		 			"<BODY>"
						             	        		 			"<FORM action=LED method=get>"
						             	        		 			"<TABLE class=tbl_text height=\"32%\" cellSpacing=1 cellPadding=1 width=\"40%\""
						             	        		 			"align=center>"
						             	        		 			  "<TBODY>"
						             	        		 			"<form name=\"input\" method=\"get\">"
																	 "<p style=\"text-align: center; font-size:22px; color:#333333;font-weight: bold; \">Blinking LEDs </p>"
																	 "<p style=\"text-align: center;font-size: 18px; color:  #003399;\">LEDs on the board should blink once from 1 to 255 <br>"
																	 "To blink LEDs manually enter any value between 1 to 255 :"
						             	        		 			"<input type=\"text\" maxlength=3 name=\" INPUTSTRING \" />"
						             	        		 			"<input type=\"submit\" value=\"Submit\" /></p><br>"
						             	        		 			"</form>"
						             	        		 			"<form>"
								                                    "<p style=\"text-align: center;\">"
                                                                     "<input type = \"Button\" value = \"Home\" onclick = \"window.location.href='index.html'\"></p>"
						             	        		 			"</form>"
						             	        		 			"</TBODY></TABLE></FORM></BODY></HTML> \n"
						             	        		 			);

        		        if( !strncmp(buf, "GET /LED?+INPUTSTRING+=", 23))
        		        		{
        		        	     leddata=0;
        		        	     Led_string[0]=0;
        		        	     Led_string[1]=0;
								tempStrPtr2 = buf + 23;
								for (i = 0; i < 3; i++)
								      {
								          c = *tempStrPtr2++;
								          if (c == ' ')
								           break;
								          if (c == '+')
								           {
								           c = ' ';
								           }
								          else if (c == '%') {
								         unsigned char temp1,temp2;
								        temp1=(*tempStrPtr2++);
								        temp2=(*tempStrPtr2++);
								         c = hex_digits_to_byte(temp1,temp2);
								         }
								          Led_string[i] = c;
								        }
										Led_string[i] = '\0';
										if(Led_string[1]==0)
										{
											leddata=Led_string[0];
											leddata=leddata-48;
										}
										else if(Led_string[2]==0)
										{
										leddata=10*(Led_string[0]-48)+(Led_string[1]-48);
										}
										else
										{
										leddata=100*(Led_string[0]-48)+10*(Led_string[1]-48)+(Led_string[2]-48);
										}
										MSS_GPIO_set_outputs(leddata);
										uint32_t gpio_pattern;
										gpio_pattern=leddata;
										gpio_pattern = MSS_GPIO_get_outputs();
										gpio_pattern = MSS_GPIO_get_outputs();
        		        		}
        		        else
        		        {
        		         //printf("LEDs Blinking\t");
        		       	 led_test();
        		        }
        		        return 4;
        		        //y netconn_write(conn, http_html_hdr, sizeof(http_html_hdr)-1, NETCONN_NOCOPY);
        		        //y netconn_write( conn, uip_appdata, sizeof(uip_appdata), NETCONN_COPY );
				 }
				 else if( !strncmp( buf, "GET /google_search.htm", 22 ) )
				 {
					 return 5;
					 //y netconn_write(conn, http_html_hdr, sizeof(http_html_hdr)-1, NETCONN_NOCOPY);
					 //y netconn_write( conn, data_google_htm, sizeof( data_google_htm), NETCONN_COPY );
				 }

				 else if( !strncmp( buf, "GET /Gadgets.htm", 16) )
				 {

					 return 6;
					 //y netconn_write(conn, http_html_hdr, sizeof(http_html_hdr)-1, NETCONN_NOCOPY);
					 //y netconn_write( conn, data_Gadgets_html, sizeof( data_Gadgets_html), NETCONN_COPY );
					}
				 else if( !strncmp( buf, "GET /HyperTerminal", 18) )
				  {

									 snprintf((char *)uip_appdata, 1200,

									"<META content=\"MSHTML 6.00.2900.5726\" name=GENERATOR></HEAD>"
									"<BODY>"
									"<FORM action=HyperTerminal method=get>"
									"<TABLE class=tbl_text height=\"32%\" cellSpacing=1 cellPadding=1 width=\"40%\""
									"align=center>"
									  "<TBODY>"
									"<form name=\"input\" method=\"get\">"
											 //text-decoration: underline;
										"<p style=\"text-align: center; font-size:22px; color:#333333;font-weight: bold; \">HyperTerminal Display</p>"
										"<p style=\"text-align: center;font-size: 18px; color:  #003399;\">Enter string to display on HyperTerminal:"
									"<input type=\"text\" maxlength=19 name=\" INPUTSTRING \" />"
									"<input type=\"submit\" value=\"Submit\" /></p>"
									"</form>"
									"<form>"
									 "<p style=\"text-align: center;\">"
									"<input type = \"Button\" value = \"Home\" onclick = \"window.location.href='index.html'\"></p>"
									"</form>"
									"</TBODY></TABLE></FORM></BODY></HTML>");


            	        	     if( !strncmp(buf, "GET /HyperTerminal?+INPUTSTRING+=", 33 ))
								{
									tempStrPtr = buf + 33;
										for (i = 0; i < 20; i++)
										{
										c = *tempStrPtr++;
										if (c == ' ')
										break;
										if (c == '+')
										{
											c = ' ';
										}
										else if (c == '%') {
											unsigned char temp1,temp2;
											temp1=(*tempStrPtr++);
											temp2=(*tempStrPtr++);
											c = hex_digits_to_byte(temp1,temp2);
										}
										Hyper_string[i] = c;
										}
										Hyper_string[i] = '\0';
										 iprintf("Submitted string is %s\n\r",Hyper_string);
								}
            	        	     return 7;
            	        	     //y netconn_write(conn, http_html_hdr, sizeof(http_html_hdr)-1, NETCONN_NOCOPY);
            	        	     //y netconn_write( conn, uip_appdata, sizeof( uip_appdata), NETCONN_COPY );
					 }
					else
					{
						return 8;
						//y netconn_write(conn, http_html_hdr, sizeof(http_html_hdr)-1, NETCONN_NOCOPY);

						/* Send our HTML page */
						//y netconn_write(conn, http_index_html, sizeof(http_index_html)-1, NETCONN_NOCOPY);

					}
        }
        else if (buflen>=6 &&
                 buf[0]=='P' &&
                 buf[1]=='O' &&
                 buf[2]=='S' &&
                 buf[3]=='T' &&
                 buf[4]==' ' &&
                 buf[5]=='/' )
        {
        

        
       /*  Send the HTML header
             * subtract 1 from the size, since we dont send the \0 in the string
             * NETCONN_NOCOPY: our data is const static, so no need to copy it*/
        	return 9;
        	//y netconn_write(conn, http_post_resp_hdr, sizeof(http_post_resp_hdr)-1, NETCONN_NOCOPY);
        }

return 10;


}
#define DEBUG_LEVEL 0
void my_debug( void *ctx, int level, const char *str )
{
    if( level < DEBUG_LEVEL )
    {
        fprintf( (FILE *) ctx, "%s", str );
        fflush(  (FILE *) ctx  );
    }
}
unsigned char hex_digits_to_byte(unsigned char u, unsigned char l)
{
    if (u > '9')
	u = u - 'A' + 10;
    else
	u = u - '0';
    if (l > '9')
	l = l - 'A' + 10;
    else
	l = l - '0';
    return (u << 4) + l;
}
/** The main function, never returns! */
void
http_server_netconn_thread(void *arg)
{

    uint32_t rtc_count_updated;
    mss_rtc_calendar_t calendar_count;
    uint8_t status;
    //////
    int ret, len;
        int listen_fd;
        int client_fd = -1;
        unsigned char buf[1024];


        //entropy_context entropy;
        //ctr_drbg_context ctr_drbg;
        ssl_context ssl;
        x509_cert srvcert;
        rsa_context rsa;
         ///////
    MSS_RTC_init(MSS_RTC_CALENDAR_MODE, RTC_PRESCALER);
    MSS_RTC_start();
    SYSREG->CC_CR = 0x1;
	SYSREG->CC_REGION_CR = 0x1;

#if 1
    ////////////////////////
       memset(&srvcert, 0, sizeof( x509_cert));
       /* 1. Load the certificates and private RSA key */
       // printf("\n\r Loading the server certificates and key...");

        /*
         * This demonstration program uses embedded test certificates.
         * Instead, you may want to use x509parse_crtfile() to read the
         * server and CA certificates, as well as x509parse_keyfile().
        */
       ret = x509parse_crt(&srvcert, (unsigned char *) test_srv_crt, strlen(test_srv_crt));
         if(ret != 0)
        {
          printf(" failed\n  !  x509parse_crt returned %d\n\r", ret);
          goto exit;
        }

        ret = x509parse_crt(&srvcert, (unsigned char *) test_ca_crt, strlen(test_ca_crt));
        if(ret != 0)
        {
          printf(" failed\n  !  x509parse_crt returned %d\n\r", ret);
          goto exit;
        }

        rsa_init( &rsa, RSA_PKCS_V15, 0 );

        ret =  x509parse_key(&rsa, (unsigned char *) test_srv_key, strlen(test_srv_key), NULL, 0);
        if( ret != 0 )
        {
          printf(" failed\n  !  x509parse_key returned %d\n\r", ret);
          goto exit;
        }
       // printf(" ok\n\r");

        /* 2. Setup the listening TCP socket */
       // printf("\n\r Bind to https port ...");

        /* Bind the connection to https port : 443 */
        ret = net_bind(&listen_fd, NULL, 443);
        if(ret != 0)
        {
          printf(" failed\n  ! net_bind returned %d\n\r", ret);
          goto exit;
        }
#if 0
        entropy_init( &entropy );
        if( ( ret = ctr_drbg_init( &ctr_drbg, entropy_func, &entropy,
                                       (const unsigned char *) pers,
                                       strlen( pers ) ) ) != 0 )
		{
			printf( " failed\n  ! ctr_drbg_init returned %d\n", ret );
			goto exit;
		}
#endif
        status = MSS_SYS_nrbg_instantiate(0, 0, &g_drbg_handle);
          if(MSS_SYS_SUCCESS == status)
          {
        	  status = MSS_SYS_nrbg_self_test();
          }
          if(MSS_SYS_SUCCESS == status)
          {
        	  //printf( "  NRBG service instantiated...." );
          }
        //printf( "  . Setting up the SSL data...." );
        if( ( ret = ssl_init( &ssl ) ) != 0 )
		{
			printf( " failed\n  ! ssl_init returned %d\n\n", ret );
			goto exit;
		}
        ssl_set_endpoint( &ssl, SSL_IS_SERVER );
		ssl_set_authmode( &ssl, SSL_VERIFY_NONE );

		ssl_set_rng( &ssl, RandVal, &rngs);
		ssl_set_dbg( &ssl, my_debug, stdout );

		ssl_set_ca_chain( &ssl, srvcert.next, NULL, NULL );
		ssl_set_own_cert( &ssl, &srvcert, &rsa );
		/////
		//ssl_set_dh_param( &ssl, dhm_P, dhm_G );
		/////
		reset:
		if( client_fd != -1 )
		        net_close( client_fd );

		    ssl_session_reset( &ssl );
		    client_fd = -1;

		       //printf( "  . Waiting for a remote connection ..." );


		       if( ( ret = net_accept( listen_fd, &client_fd, NULL ) ) != 0 )
		       {
		           printf( " failed\n  ! net_accept returned %d\n\n", ret );
		           goto exit;
		       }

		       ssl_set_bio( &ssl, net_recv, &client_fd,
		                          net_send, &client_fd );
		       //ssl_set_ciphersuites( &ssl, ssl_default_ciphersuites );

		       //printf( " ok\n" );

		       /*
		        * 5. Handshake
		        */
		       //printf( "  . Performing the SSL/TLS handshake..." );

#if 1
		       while( ( ret = ssl_handshake( &ssl ) ) != 0 )
		       {
		           if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
		           {
		               printf( " failed  ! ssl_handshake returned %d\n\n", ret );
		               goto reset;
		           }
		       }
#endif
		      // printf( "ssl_handshake returned %d OKAY\n",ret );
#if 1
		       /*
		        * 6. Read the HTTP Request
		        */
		       //printf( "  < Read from client:" );
		       fflush( stdout );

		       do
		       {
		           len = sizeof( buf ) - 1;
		           memset( buf, 0, sizeof( buf ) );
		           ret = ssl_read( &ssl, (unsigned char*)buf, len );

		           if( ret == POLARSSL_ERR_NET_WANT_READ || ret == POLARSSL_ERR_NET_WANT_WRITE )
		               continue;
		           if(ret == 1) // only 'G' received and scope for more data availability
		           {
		        	   ret = ssl_read( &ssl, (unsigned char*)(buf+1), len-1 );
		        	   //printf("more data to be read,total bytes read= %d\t",ret+1);
		        	   //printf("read data =  %s\t",buf);
		           }
		           if( ret <= 0 )
		           {
		               switch( ret )
		               {
		                   case POLARSSL_ERR_SSL_PEER_CLOSE_NOTIFY:
		                       //printf( " connection was closed gracefully\n" );
		                       goto reset;
		                       break;

		                   case POLARSSL_ERR_NET_CONN_RESET:
		                       //printf( " connection was reset by peer\n" );
		                       goto reset;
		                       break;

		                   default:
		                       //printf( " ssl_read returned -0x%x\n", -ret );
		                       break;
		               }

		               break;
		           }

		           len = ret+1;
		           //printf( " %d bytes read\n%s\t", len, (char *) buf );

		           if( ret > 0 )
		               break;
		       }
		       while( 1 );

		      // printf( "Write page to the client:\t" );
		       fflush( stdout );
#if 1
		       rtc_count_updated = MSS_RTC_get_update_flag();
			   if(rtc_count_updated)
			   {
				   MSS_RTC_get_calendar_count(&calendar_count);
				   MSS_RTC_clear_update_flag();
			   }
			  // printf( "using $%s$ cipersuite with version $%s$  \t",ssl_get_ciphersuite( &ssl ) ,ssl_get_version(&ssl));
			   uint8_t opt;
			   opt = http_server_netconn_serve(buf,&calendar_count,len);
#if 1  //switch
			   switch(opt)
			   {
			   case 1:
				   while( ( ret = ssl_write( &ssl, http_json_hdr, sizeof(http_json_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				  // printf( "case 1: %d bytes written\n\\n", len);
				   while( ( ret = ssl_write( &ssl, status_json, json_resp_size-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;

				   break;
			   case 2:
				   while( ( ret = ssl_write( &ssl, http_html_ok_hdr, sizeof(http_html_ok_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				   //printf( "case 2 %d bytes written\n\\n", len);
				   //y netconn_write(conn, http_html_ok_hdr, sizeof(http_html_ok_hdr)-1, NETCONN_NOCOPY);
				   break;
			   case 3:
				   while( ( ret = ssl_write( &ssl, http_html_hdr, sizeof(http_html_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				   //printf( "case 3 %d bytes written\n\\n", len);
				   while( ( ret = ssl_write( &ssl, http_index_html2, sizeof(http_index_html2)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;


				   break;
			   case 4:
			   case 7:
				   while( ( ret = ssl_write( &ssl, http_html_hdr, sizeof(http_html_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				   //printf( "case 4 %d bytes written\n\\n", len);
				   while( ( ret = ssl_write( &ssl, uip_appdata, sizeof(uip_appdata)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;

				   break;
			   case 5:
				   while( ( ret = ssl_write( &ssl, http_html_hdr, sizeof(http_html_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				   //printf( "case 5 %d bytes written\n\\n", len);
				   while( ( ret = ssl_write( &ssl, data_google_html, sizeof(data_google_html)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				   break;
			   case 6:
				   while( ( ret = ssl_write( &ssl, http_html_hdr, sizeof(http_html_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				  // printf( "case 6 %d bytes written\n\\n", len);
				   while( ( ret = ssl_write( &ssl, data_Gadgets_html, sizeof(data_Gadgets_html)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;

				   break;
			   case 8:
				   while( ( ret = ssl_write( &ssl, http_html_hdr, sizeof(http_html_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;
				   //printf( "case 3 %d bytes written\n\\n", len);
				   while( ( ret = ssl_write( &ssl, http_index_html, sizeof(http_index_html)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;

				   break;
			   case 9:
				   while( ( ret = ssl_write( &ssl, http_post_resp_hdr, sizeof(http_post_resp_hdr)-1 ) ) <= 0 )
				   {
					   if( ret == POLARSSL_ERR_NET_CONN_RESET )
					   {
						   printf( " failed\n  ! peer closed the connection\n\n" );
						   goto reset;
					   }

					   if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
					   {
						   printf( " failed\n  ! ssl_write returned %d\n\n", ret );
						   goto exit;
					   }
				   }
				   len = ret;

				   break;


			   }
#endif //switch end
		       //len = sprintf( (char *) buf, HTTP_RESPONSE,ssl_get_ciphersuite( &ssl ) );

#endif

		       //printf( " %d bytes written\n\n%s\n", len, (char *) buf );
		      // printf( " %d bytes written\n\\n", len  );





		       len = ret;

		       ret = 0;
		       goto reset;
#endif
       ////////////////////////

#endif
    exit:
    net_close( client_fd );
	x509_free( &srvcert );
	rsa_free( &rsa );
	ssl_free( &ssl );
    return;
}

/** Initialize the HTTP server (start its thread) */
void
http_server_netconn_init(void)
{
  sys_thread_new("http_server_netconn", http_server_netconn_thread, NULL, DEFAULT_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
}

/** */
void handle_trigger_request(char * buf, u16_t len)
{
    unsigned int trigger_id;
    unsigned int seconds = 1;
    int idx;
    int time[3] = {0, 0, 0};
    int time_inc = 0;
    
    trigger_id = buf[7] - '0';
    if(trigger_id < 3)
    {
        /* Parse request for the trigger's seconds value. */
        idx = 14;
        while((buf[idx] != '&') && (idx < len) && (time_inc < 3))
        {
            if('%' == buf[idx])
            {
                idx += 3;   /* skip %3A. */
                ++time_inc;
            }
            else
            {
                if((buf[idx] >= '0') && (buf[idx] <= '9'))
                {
                    time[time_inc] = (time[time_inc] * 10) + buf[idx] - '0';
                    ++idx;
                }
                else
                {   /* Invalid character found in request. */
                    seconds = 0;
                    idx = len;
                }
            }
        }
        
        if(seconds != 0)
        {
            mss_rtc_calendar_t new_calendar_time;
            
            MSS_RTC_get_calendar_count(&new_calendar_time);
            if(0 == trigger_id)
            {
                new_calendar_time.hour = (uint8_t)time[0];
                new_calendar_time.minute = (uint8_t)time[1];
                new_calendar_time.second = (uint8_t)time[2];
            }
            else if(1 == trigger_id)
            {
                if((time[0] > 0) && (time[0] <= 31))
                {
                    new_calendar_time.day = (uint8_t)time[0];
                }
                if((time[1] > 0) && (time[1] <= 12))
                {
                    new_calendar_time.month = (uint8_t)time[1];
                }
                if((time[2] > 0) && (time[2] <= 255))
                {
                    new_calendar_time.year = (uint8_t)time[2];
                }
            }
            MSS_RTC_set_calendar_count(&new_calendar_time);
        }
    }
}

#endif /* LWIP_NETCONN*/
