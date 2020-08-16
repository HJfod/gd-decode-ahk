#SingleInstance force

^!h::
MsgBox, Prefix: Control + alt; b to decode base64; n to decode base64 and gzip; a to decode xor base64 and gzip
return

^!b::
decodeString("base64")
return

^!n::
decodeString("base64-zlib")
return

^!a::
decodeString("all")
return

decodeString(type) {
Send, ^x
FileAppend, %type%`n%Clipboard%, %A_WorkingDir%\decode-base64\THROWAWAY-FILE-DECODE-BASE64-STRING.txt
FileMove, %A_WorkingDir%\decode-base64\THROWAWAY-FILE-DECODE-BASE64-STRING.txt, %A_WorkingDir%\decode-base64\decode-base64.string, %True%
decode=% ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c node ./decode-base64/decode-base64.js").StdOut.ReadAll()
decode=% SubStr(decode, 1, StrLen(decode)-1)
SetKeyDelay, 0
Send, %decode%
return
}