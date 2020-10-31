#include "TextPrint.cpp"

extern "C" void _start() {
	SetCursorPosition(PositionFromCoords(0, 0));
	PrintString("64 bit mode with C and C++ support lets goooo\n\rNewline ;OOOO\n\r");
	PrintString(HexToString(0x1234abcd));
	return;
}