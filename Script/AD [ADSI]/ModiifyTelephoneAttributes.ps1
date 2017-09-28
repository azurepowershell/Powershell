$objUser = [ADSI]"LDAP://CN=MyTestUser,OU=MyTestOU,DC=Montel,DC=local"
$objUser.Put("homePhone", "555-555-0199")
$objUser.Put("pager", "555-555-0198")
$objUser.Put("mobile", "555-555-0197")
$objUser.Put("facsimileTelephoneNumber", "555-555-0196")
$objUser.Put("ipPhone", "192.168.6.112")
$objUser.Put("otherfacsimileTelephoneNumber", "555-555-0195")
$objUser.Put("otherhomePhone", "555-555-0194")
$objUser.Put("otherpager", "555-555-0193")
$objUser.Put("othermobile",@("555-555-0192","555-555-0191")) 
$objUser.Put("otherIpPhone",@("192.168.6.113","192.168.6.114")) 
$objUser.Put("info", "All contact information is confidential")
$objUser.SetInfo()




