#include "TextPrint.cpp"
#include "IDT.cpp"

// extern const char Test[];

extern "C" void _start() {
	SetCursorPosition(PositionFromCoords(0, 0));
	PrintString("output\n");
	InitialiseIDT();
	return;
}