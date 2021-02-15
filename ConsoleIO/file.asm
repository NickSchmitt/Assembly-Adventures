; file.asm
section .data

; expressions for conditional assembly

; syscall symbols

; creation and status flags

; access mode

; create mode (permissions)

section .bss
    buffer      resb        bufferlen
section .text
    global main
main:
    push        rbp
    mov         rbp, rsp
    
%IF CREATE
%ENDIF

%IF OVERWRITE
%ENDIF

%IF APPEND
%ENDIF

%IF O_WRITE
%ENDIF

%IF READ
%ENDIF

%IF O_READ
%ENDIF

%IF DELETE
%ENDIF

; |-----------------------------|
; | File Manipulation Functions |
; |-----------------------------|

global readFile
readFile:
readerror:

global deleteFile
deleteFile:
deleteerror:

global appendFile
appendFile:
appenderror:

global openFile
openFile:
openerror:

global writeFile
writeFile:
writeerror:

global positionFile
positionFile:
positionerror:

global closeFile
closeFile:
closeerror:

global createFile
createFile:
createerror:

; Print Feedback

global printString
printString: