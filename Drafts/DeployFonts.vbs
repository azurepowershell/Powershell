Dim objShell, objFSO, wshShell
Dim strFontSourcePath, objFolder, objFont, objNameSpace, objFile

Set objShell = CreateObject("Shell.Application")
Set wshShell = CreateObject("WScript.Shell")
Set objFSO = createobject("Scripting.Filesystemobject")

Wscript.Echo "--------------------------------------"
Wscript.Echo " Script to install Fonts "
Wscript.Echo "--------------------------------------"
Wscript.Echo " "

strFontSourcePath = "\\localhost\Share"

If objFSO.FolderExists(strFontSourcePath) Then
 Set objNameSpace = objShell.Namespace(strFontSourcePath)
 Set objFolder = objFSO.getFolder(strFontSourcePath)

 For Each objFile In objFolder.files

  If LCase(right(objFile,4)) = ".ttf" OR LCase(right(objFile,4)) = ".otf" Then

    If objFSO.FileExists("C:\Windows\Fonts\" & objFile.Name) Then
      Wscript.Echo "This Font is already installed: " & objFile.Name

    Else

      Set objFont = objNameSpace.ParseName(objFile.Name)
      objFont.InvokeVerb("Install")
      Wscript.Echo "Installed Font: " & objFile.Name
      Set objFont = Nothing

    End If
  End If
 Next
 
Else
 Wscript.Echo "Check the Source Path or Make sure font is located inside source folder"

End If

