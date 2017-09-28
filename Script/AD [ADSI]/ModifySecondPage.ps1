$objUser = [ADSI]"LDAP://CN=MyTestUser,OU=MyTestOU,DC=Montel,DC=local"
$objUser.Put("streetAddress", "123 main st")
$objUser.Put("postOfficeBox", "P.O. Box 12")
$objUser.Put("l", "Charlotte") #City
$objUser.Put("st", "SC")
$objUser.Put("postalCode", "12345")
$objUser.Put("c", "US")
$objUser.Put("co", "United States")
$objUser.Put("countryCode", "840")
$objUser.SetInfo()




