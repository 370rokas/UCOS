
PROGRAM_SPACE equ 0x7e00

ReadDisk:
	mov bx PROGRAM_SPACE
	mov, al,4 ; if program doesnt work, possible solution is to increase the sector count
	mov dl, [BOOT_DISK]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13

	jc DiskReadFailed

	ret

BOOT_DISK:
	db 0

DiskReadErrorString:
	db 'Fail: Read Disk',0

DiskReadFailed:
	mov bx, DiskReadErrorString
	call PrintString
	
	jmp $