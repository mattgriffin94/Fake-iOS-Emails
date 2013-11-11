#!/usr/bin/python

from smtplib import SMTP
import cgi
from email.mime.text import MIMEText


print("Content-type:text/html\r\n\r\n")
print("Success!")

form = cgi.FieldStorage()

fromName = form.getvalue("fromName")
fromEmail = form.getvalue("fromEmail")
toEmail = form.getvalue("toEmail")
subject = form.getvalue("subject")
body = form.getvalue("body")
cgi.escape(fromName,True)
cgi.escape(fromEmail,True)
cgi.escape(toEmail,True)
cgi.escape(subject,True)
cgi.escape(body,True)


msg = MIMEText(body,"html")

msg['Subject'] = subject
msg['From'] = "\""+fromName+"\""+"<"+fromEmail+">"
msg['To'] = toEmail

s= SMTP()
s.connect(**Server**)
s.login(**Credentials**)
s.sendmail(**Email**,toEmail,msg.as_string())
s.quit()

#Monitor what my server sends
file=open("archive.txt","a+")
file.write(fromName + " " + fromEmail + " " + toEmail + " " + subject + " " + body + "\n\n")
file.close()
