
#include <windows.h>
#include <stdarg.h>
#define BUF_SIZE 256
#pragma warning(disable : 4996)
#include <stdio.h>
#include <errno.h>
#define BUF_SIZE 256
#define _CRT_SECURE_NO_WARNINGS
BOOL PrintStrings(HANDLE hOut, ...) {
	DWORD MsgLen, Count;
	LPCTSTR pMsg;
	va_list pMsgList; 
	va_start(pMsgList, hOut); 
	while ((pMsg = va_arg(pMsgList, LPCTSTR)) != NULL) {
		MsgLen = _tcslen(pMsg);
		if (!WriteConsole(hOut, pMsg, MsgLen, &Count, NULL)
			&& !WriteFile(hOut, pMsg, MsgLen * sizeof(TCHAR),
				&Count, NULL))
			return FALSE;
	}
	va_end(pMsgList);
	return TRUE;
}

BOOL PrintMsg(HANDLE hOut, LPCTSTR pMsg) {
	return PrintStrings(hOut, pMsg, NULL);
}

BOOL ConsolePrompt(LPCTSTR pPromptMsg, LPTSTR pResponse,
	DWORD MaxTchar, BOOL Echo) {
	HANDLE hStdIn, hStdOut;
	DWORD TcharIn, EchoFlag;
	BOOL Success;
	hStdIn = CreateFile(_T("CONIN$"),
		GENERIC_READ | GENERIC_WRITE, 0,
		NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
	hStdOut = CreateFile(_T("CONOUT$"), GENERIC_WRITE, 0,
		NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
	EchoFlag = Echo ? ENABLE_ECHO_INPUT : 0;
	Success =
		SetConsoleMode(hStdIn, ENABLE_LINE_INPUT |
			EchoFlag | ENABLE_PROCESSED_INPUT)
		&& SetConsoleMode(hStdOut,
			ENABLE_WRAP_AT_EOL_OUTPUT | ENABLE_PROCESSED_OUTPUT)
		&& PrintStrings(hStdOut, pPromptMsg, NULL)
		&& ReadConsole(hStdIn, pResponse,
			MaxTchar, &TcharIn, NULL);
	if (Success) pResponse[TcharIn - 2] = '\0';
	CloseHandle(hStdIn);
	CloseHandle(hStdOut);
	return Success;
}