#Persistent
#SingleInstance force
SetTitleMatchMode, 2

counterFile := "C:\GTA5TicketCounter\counter.txt"

; Read existing count if file exists
if FileExist(counterFile)
{
    FileRead, count, %counterFile%
    if count =  ; handle empty file
        count := 0
}
else
{
    count := 0
    FileCreateDir, C:\GTA5TicketCounter
    FileAppend, %count%, %counterFile%
}

; F3 to increment
F3::
count++
FileDelete, %counterFile%
FileAppend, %count%, %counterFile%
return

; F4 to reset
F4::
count := 0
FileDelete, %counterFile%
FileAppend, %count%, %counterFile%
return

; ESC to exit
Esc::ExitApp
