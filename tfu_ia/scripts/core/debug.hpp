/*
	KK's debug_console v3.0 macros
	http://killzonekid.com
*/

//!!! you MUST comment ONLY those 2 lines to disable debug
//#define DEBUG_CONSOLE()
#define DEBUG_ARMA()


#ifdef DEBUG_CONSOLE
#undef DEBUG_ARMA
#define DEBUG
#define conBeep() "debug_console" callExtension ("A")
#define conClear() "debug_console" callExtension ("C")
#define conClose() "debug_console" callExtension ("X")
#define conWhite(_msg) "debug_console" callExtension (_msg + "#1110")
#define conWhiteTime(_msg) "debug_console" callExtension (_msg + "#1111")
#define conRed(_msg) "debug_console" callExtension (_msg + "#1000")
#define conRedTime(_msg) "debug_console" callExtension (_msg + "#1001")
#define conGreen(_msg) "debug_console" callExtension (_msg + "#0100")
#define conGreenTime(_msg) "debug_console" callExtension (_msg + "#0101")
#define conBlue(_msg) "debug_console" callExtension (_msg + "#0010")
#define conBlueTime(_msg) "debug_console" callExtension (_msg + "#0011")
#define conYellow(_msg) "debug_console" callExtension (_msg + "#1100")
#define conYellowTime(_msg) "debug_console" callExtension (_msg + "#1101")
#define conPurple(_msg) "debug_console" callExtension (_msg + "#1010")
#define conPurpleTime(_msg) "debug_console" callExtension (_msg + "#1011")
#define conCyan(_msg) "debug_console" callExtension (_msg + "#0110")
#define conCyanTime(_msg) "debug_console" callExtension (_msg + "#0111")
#define conFile(_msg) "debug_console" callExtension (_msg + "~0000")
#define conFileTime(_msg) "debug_console" callExtension (_msg + "~0001")
#endif


#ifdef DEBUG_ARMA
#define DEBUG
#define conBeep()
#define conClear()
#define conClose()
#define conWhite(_msg) diag_log(_msg)
#define conWhiteTime(_msg) diag_log(_msg)
#define conRed(_msg) diag_log(_msg)
#define conRedTime(_msg) diag_log(_msg)
#define conGreen(_msg) diag_log(_msg)
#define conGreenTime(_msg) diag_log(_msg)
#define conBlue(_msg) diag_log(_msg)
#define conBlueTime(_msg) diag_log(_msg)
#define conYellow(_msg) diag_log(_msg)
#define conYellowTime(_msg) diag_log(_msg)
#define conPurple(_msg) diag_log(_msg)
#define conPurpleTime(_msg) diag_log(_msg)
#define conCyan(_msg) diag_log(_msg)
#define conCyanTime(_msg) diag_log(_msg)
#define conFile(_msg)
#define conFileTime(_msg)
#endif
