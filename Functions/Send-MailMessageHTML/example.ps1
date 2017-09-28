$images = @{ 
    image1 = 'C:\Temp\image.jpg' 
    image2 = 'C:\Temp\image2.jpg' 
}  
  
$body = @' 
<html>  
  <body>  
    <h3>Tvillinger?</h3>
    <br>
    Julie ble vel 2 år og ble vel ikke til 2 personer..? :o<br>
    <br>
    <img src="cid:image1"><br> 
  </body>  
</html>  
'@  
  
$params = @{ 
    InlineAttachments = $images 
    Attachments = 'C:\Temp\test.txt' 
    Body = $body 
    BodyAsHtml = $true 
    Subject = 'Test email' 
    From = 'Stian er KUL <noreply@montel.no>' 
    To = 'stians@montel.no' 
    Cc = 'stian.saeten@gmail.com' 
    SmtpServer = 'blast.montel.no' 
    Port = 25 
    #Credential = (Get-Credential) 
    UseSsl = $false 
} 
 
Send-MailMessageHTML @params