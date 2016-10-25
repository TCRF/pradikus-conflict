;;DEFINE( RAM,1)		;;comment out for ROM version...







;the P'Radikus Conflict
;
;6502 source code for use with Nintendo (TM) Entertainment system
;
;	SAT 17 MAR 90
;	   Ver 2.0
;
;Graphics and Code by:
;  Jim Treadway & Mike Hunley
;
;"RAMVARS.ASM" --- zero page vars., etc.
;




;Sprite table offsets--------------------------------

.EQU	SPR_YPOS	,1	;screen Y pos.
.EQU	SPR_CHAR	,2	;character
.EQU	SPR_FLIP	,3	;flip (hi. nyb.) and pal (lo. nyb.)
.EQU	SPR_XPOS	,4	;screen X pos.



.EQU	RT_BTN	,H'01	     	;joystick masks
.EQU	LT_BTN	,H'02
.EQU	DN_BTN	,H'04
.EQU	UP_BTN	,H'08
.EQU	START	,H'10
.EQU	SELECT	,H'20
.EQU	B_BTN	,H'40
.EQU	A_BTN	,H'80


.EQU	SUN,		H'36	;type/pal = 3; size = 6


.EQU	GAS,		H'80	;masks for 'data bits' field
.EQU	INHAB,		H'40	;of a solar system entry...
.EQU	UNINHAB,	H'00
.EQU	FRNDLY,		H'20
.EQU	UNFRNDLY,	H'00
.EQU	V_HIGH,		H'18
.EQU	HIGH,		H'10
.EQU	AVG,		H'08
.EQU	LOW,		H'00


.EQU	CANNON,		1	;weapon nos.
.EQU	ATOMIC,		2
.EQU	L_LASER,	3
.EQU	H_LASER,	4
.EQU	MISSLE,		5
.EQU	MINE,		6
.EQU	T_BOLT,		7

.EQU	ENGINE,		H'01	;active sound codes
.EQU	SHOT,		H'20
.EQU	COLLISION,	H'F0
.EQU	SHIP,		H'FF

.EQU	PLYR_POS,	H'74
.EQU  	PLYR_TOP,	H'78	;upper left and lower right coords of
.EQU  	PLYR_BOT,       H'88	;square "surrounding" player...used
				;to check for collisions and hits...

.EQU	GREEN,		H'00	;status indicator equates...
.EQU	YELLOW,		H'01
.EQU	RED,		H'02
.EQU	CRITIC,		H'FF


.EQU	SPC, h'FA
.EQU 	 s1, h'02
.EQU	 s2, h'03
.EQU	 s3, h'04
.EQU	 s4, h'05
.EQU	 s5, h'06
.EQU	 s6, h'07


;*******************************************
;	ZER0 PAGE VARIABLES
;*******************************************


.EQU	PTR0L,		H'00
.EQU	PTR0H,		H'01
.EQU	PTR1L,		H'02
.EQU	PTR1H,		H'03
.EQU	PTR2L,		H'04
.EQU	PTR2H,		H'05
.EQU	PTR3L,		H'06
.EQU	PTR3H,		H'07	;general pointer vars.
.EQU	BPAL_BASE,	H'08
;---            BPAL_BASE+1
.EQU	CX,		H'0A
.EQU	CY,		H'0B	;character pos. on screen
.EQU	COUNT0,		H'0C
.EQU	COUNT1,		H'0D
.EQU	COUNT2,		H'0E
.EQU	COUNT3,		H'0F	;general purpose counters


.EQU	OBJ1_TOP,	H'10	;enemy objects
.EQU	OBJ1_BOT,	H'11
.EQU	OBJ1_LT,	H'12
.EQU	OBJ1_RT,	H'13
.EQU	OBJ2_TOP,	H'14	;player objects
.EQU	OBJ2_BOT,	H'15
.EQU	OBJ2_LT,	H'16
.EQU	OBJ2_RT,	H'17
.EQU	DENSCOUNT,	H'18
.EQU	ENMYWAIT,	H'19	;non-zero if need to add object
.EQU	DRN_WAIT,	H'1A
.EQU	LASTFIRE,	H'1B
.EQU	NEXT_ENEMY,	H'1D
.EQU	NEXT_SHOT,	H'1E
.EQU	NEXT_PSHT,	H'1F


.EQU	VEL_X,		H'20
.EQU	VEL_Y,		H'21
.EQU	COMPTIME,	H'22
.EQU	SAVE_X,		H'23
.EQU	SAVE_Y,		H'24
.EQU	EXPL_A,		H'25
.EQU	EXPL_Y,		H'26
.EQU	EXPL_X,		H'27
.EQU	EXPL_TEMP,	H'28	; TEMPS FOR EXPLOSIONS
.EQU	NEW_DIR,	H'29
.EQU	DX,		H'2A
.EQU	DY,		H'2B
.EQU	SIGN_DX,	H'2C
.EQU	SIGN_DY,	H'2D
.EQU	DIRINDEX,	H'2E
.EQU	TBLINDEX,	H'2F


.EQU	LOGIC_Y,	H'30
.EQU	LOGIC_X,	H'31
.EQU	LOGIC_TEMP,	H'32
.EQU	LOGIC_AX,	H'33
.EQU	LOGIC_AY,	H'34
.EQU	LOGIC_BX,	H'35
.EQU	LOGIC_BY,	H'36
.EQU	SEEKING,	H'37
.EQU	NEXT_STN,	H'38
.EQU	INVISO,		H'39
.EQU	P_THNDR,	H'3A
.EQU	CHEAT,		H'3B
.EQU	CODE_INDX,	H'3C
.EQU	E_MISLS,	H'3D
.EQU	COMPITEM,	H'3E
;.EQU	TARGET,		H'3F	;del 04-21-90


.EQU	H1M,		H'40	;High Score
.EQU	H100K,		H'41
.EQU	H10K,		H'42
.EQU	H1K,		H'43
.EQU	H100,		H'44
.EQU	H10,		H'45
.EQU	H1,		H'46
.EQU	SPRXH,		H'47
.EQU	SPRXL,		H'48
.EQU	SPRYH,		H'49
.EQU	SPRYL,		H'4A
.EQU	BASES1,		H'4B
.EQU	BASES10, 	H'4C
.EQU	BASES100,	H'4D
.EQU	BASES1K, 	H'4E
.EQU	BASES10K,	H'4F


.EQU	SAVEBIT0,	H'50
.EQU	SAVEBIT1,	H'51
.EQU	SAVEBIT2,	H'52
.EQU	SYSBIT0,	H'53
.EQU	SYSBIT1,	H'54
.EQU	SYSBIT2,	H'55
.EQU	SHIPS1,		H'56
.EQU	SHIPS10, 	H'57
.EQU	SHIPS100,	H'58
.EQU	SHIPS1K, 	H'59
.EQU	SHIPS10K,	H'5A
;;.EQU	REFUELCNT,	H'5B
.EQU	THR_CNT,	H'5C
.EQU	PALINDEX,	H'5D
.EQU	PALOFFSET,	H'5E
.EQU	PALSHIFT,	H'5F


.EQU	XSTAT,		H'60
.EQU	MAX_ESHOT,	H'61	;maximum # of enemy shots (7, 10, 11, 12)
.EQU	SAVEPWR,	H'62
.EQU	BEEPREG, 	H'63
.EQU	SUBSVAR1,	H'64
.EQU	SUBSVAR2,	H'65
.EQU	SUBSVAR3,	H'66
.EQU	SUBSVAR4,	H'67	;SOUND VARS
.EQU	TMP_NMI1,	H'68
.EQU	TMP_NMI2,	H'69
.EQU	REG4015,	H'6A
.EQU	GUN_WPN,	H'6B
.EQU	TURRET_1,	H'6C
.EQU	TURRET_2,	H'6D
.EQU	TURRET_3,	H'6E
.EQU	TURRET_4,	H'6F


.EQU	ARDAT0,		H'70
.EQU	ARDAT1,		H'71
.EQU	ARDAT2,		H'72
.EQU	ARDAT3,		H'73
.EQU	ARDAT4,		H'74
.EQU	ARDAT5,		H'75
.EQU	ARDAT6,		H'76
.EQU	SPR0PTR,	H'77
.EQU	SPR1PTR,	H'78
.EQU	GAL_PTRL,	H'79
.EQU	GAL_PTRH,	H'7A
.EQU	SEC_PTRL,	H'7B
.EQU	SEC_PTRH,	H'7C
.EQU	ORBIT,		H'7D
.EQU	TOWERS,		H'7E
.EQU	TURRETS,	H'7F


.EQU	CR100K,		H'80
.EQU	CR10K,		H'81
.EQU	CR1K,		H'82
.EQU	CR100,		H'83
.EQU	CR10,		H'84
.EQU	CRDT_Y,		H'85
.EQU	SC1,		H'86
.EQU	SC10,		H'87
.EQU	SC100,		H'88
.EQU	SC1000,		H'89
.EQU	SC10000,	H'8A
.EQU	SC100000,	H'8B
.EQU	SC1M,		H'8C
.EQU	DIR,		H'8D	;player variables
.EQU	THRUST,		H'8E
.EQU	FUEL,		H'8F


.EQU	SHIELD,		H'90
.EQU	SAVEARMR,	H'91
.EQU	STATUS,		H'92
.EQU	WARP,		H'93
.EQU	DAMAGE,		H'94
.EQU	FUELUSED,	H'95
.EQU	DEATH,		H'96	; WHEN PLAYER DIES COUNT DOWN
.EQU	DEST_GX,	H'97
.EQU	DEST_GY,	H'98
.EQU	DEST_SX,	H'99
.EQU	DEST_SY,	H'9A
.EQU	TVELX,		H'9B
.EQU	TVELY,		H'9C
.EQU	TMAX,		H'9D
.EQU	PXOFF,		H'9E
.EQU	PYOFF,		H'9F


.EQU	FLASH,		H'A0
.EQU	FLIP,		H'A1
.EQU	ABS,		H'A2
.EQU	PHASE0,		H'A3
.EQU	PHASE1,		H'A4
.EQU	REFUEL,		H'A5
.EQU	REGEN,		H'A6
.EQU	PSHPXVEL,	H'A7
.EQU	PSHPYVEL,	H'A8
.EQU	TPOSL,		H'A9
.EQU	TPOSH,		H'AA
.EQU	DBARFLAG,	H'AB
.EQU	SCRNPTRL,	H'AC
.EQU	SCRNPTRH,	H'AD
.EQU	OBJPTRL,	H'AE
.EQU	OBJPTRH,	H'AF


.EQU	BKGRWIDTH,	H'B0	;width of background table
.EQU	BKGRPTRL,	H'B1
.EQU	BKGRPTRH,	H'B2
.EQU	BKGRND,		H'B3
.EQU	PAGE,		H'B4	;copy of page select register
.EQU	XSCROLL,	H'B5	;copy of scroll registers...
.EQU	YSCROLL,	H'B6
.EQU	OBJINDEX,	H'B7	;set by FINDOBJECT...
.EQU	T4,		H'B8
.EQU	CRSR_I,		H'B9
.EQU	CURSORX,	H'BA
.EQU	CURSORY,	H'BB
.EQU	TX,		H'BC
.EQU	TY,		H'BD
.EQU	T0,		H'BE
.EQU	T1,		H'BF


.EQU	T2,		H'C0
.EQU	T3,		H'C1
.EQU	C100000,	H'C2	;the following six vars. must
.EQU	C10000,		H'C3	;  be in descending order
.EQU	C1000,		H'C4
.EQU	C100,		H'C5
.EQU	C10,		H'C6
.EQU	C1,		H'C7
.EQU	TIMER3,		H'C8
.EQU	TIMER2,		H'C9
.EQU	TIMER1,		H'CA
.EQU	TIMER0,		H'CB	;incremented every NMI proc. call
.EQU	V_SEL,		H'CC	;copies of VidSelect & VidMode
.EQU	V_MODE,		H'CD
.EQU	EFFECT,		H'CE
.EQU	DENS,		H'CF


.EQU	PR_PTRL,	H'D0
.EQU	PR_PTRH,	H'D1
.EQU	SPAL_BASE,	H'D2
;---            BPAL_BASE+1
.EQU	RAND,		H'D4	;set equal to timer every time a change
.EQU	XBLOCK,		H'D5
.EQU	YBLOCK,		H'D6
.EQU	XBOFF,		H'D7
.EQU	YBOFF,		H'D8
.EQU	XMOVE,		H'D9	;0 = no scroll, -7 to +7
.EQU	YMOVE,		H'DA
.EQU	VIDROM,		H'DB
.EQU	PROGROM,	H'DC
.EQU	J1VAL,		H'DD	;current joystick value
.EQU	J1CHG,		H'DE	;newly pressed joystick buttons
.EQU	ITEM1CNT,	H'DF


.EQU	ITEM2CNT,	H'E0
.EQU	ITEM3CNT,	H'E1
.EQU	ITEM4CNT,	H'E2
.EQU	CLOAK,		H'E3	;player item list
.EQU	MINES,		H'E4	;--set hi-bit if damaged
.EQU	MISSILES,	H'E5	;--00 = none/destroyed
.EQU	S_WAVE,		H'E6
.EQU	THUNDER,	H'E7
.EQU	FREEM,		H'E8
.EQU	HASBOLT,	H'E9
.EQU	HASFREEM,	H'EA
.EQU	DRIVE,		H'EB
.EQU	PWRPLANT,	H'EC
.EQU	ARMOR,		H'ED
.EQU	SHLDTYPE,	H'EE
.EQU	WPN1,		H'EF


.EQU	WPN2,		H'F0
.EQU	GALAXY_X,	H'F1	;0..7
.EQU	GALAXY_Y,	H'F2
.EQU	SECTOR_X,	H'F3	;1..16
.EQU	SECTOR_Y,	H'F4
.EQU	XPOS,		H'F5	;coord. block in galaxy	(0..BKGRWIDTH)
.EQU	YPOS,		H'F6
.EQU	XREL,		H'F7	;ch. offset (0-7, 0-7) in block
.EQU	YREL,		H'F8
.EQU	DEST_I,		H'F9
.EQU	DEST_X,		H'FA
.EQU	DEST_Y,		H'FB
.EQU	TIME_DIFF,	H'FC
.EQU	PRADIKUS,	H'FD
.EQU	DIFF,		H'FE	;difficulty (00-6F)
.EQU	MAX_ENEMY,	H'FF





;*******************************************
;	REG. DEFINITIONS
;*******************************************

.EQU	Vid_Sel,   	h'2000
.EQU	Vid_Mode,  	h'2001
.EQU	Vid_Reset, 	h'2002
.EQU	Spr_Ptr,   	h'2003
.EQU	Spr_Data,  	h'2004
.EQU	Scr_Reg,   	h'2005
.EQU	Vid_Ptr,   	h'2006
.EQU	Vid_Data,  	h'2007



.EQU	DMA,       	h'4014
.EQU	Sound,     	h'4015
.EQU	Jport1,    	h'4016
.EQU	Jport2,    	h'4017


.EQU	ROMSELECT,	H'FFFF




;*****************************
; CONSTANTS & OFFSETS
;*****************************


.EQU	STACK,	   	h'0100


.EQU	PALGRID,	h'0100


.EQU	SPRTBL0,	h'0200
	.EQU	FLMSPR0,	h'0200
	.EQU	TGTSPR0,	h'0204
	.EQU	CMPSPR0,	h'0208
	.EQU	PLYRSPR0,	h'020C
	.EQU 	PSHTSPR0,	h'0230

	.EQU  	SHOTSPR0,	h'0250
	.EQU  	ENSPR0,		h'0280
	.EQU	GUN_SPR0,	h'02C0
	.EQU	COSTSPR0,	h'0268


.EQU	SCBUF,		H'0700
.EQU	SPRTBL1,	H'0700
	.EQU	FLMSPR1,	h'07FC
	.EQU	TGTSPR1,	h'07F8
	.EQU	CMPSPR1,	h'07F4
	.EQU	PLYRSPR1,	h'07D0
	.EQU	PSHTSPR1,	h'07B0

	.EQU	SHOTSPR1,	h'0740
	.EQU	ENSPR1,		h'0770
	.EQU	GUN_SPR1,	h'0700
	.EQU	COSTSPR1,	h'0768

.EQU	VERTBUFFER,	H'0300
.EQU	VPALBUFFER,	VERTBUFFER + 33
.EQU	HORZBUFFER,	VPALBUFFER + 20	;17 + 3 padding
.EQU	HPALBUFFER,	HORZBUFFER + 43

.EQU	BPALREGS,	HPALBUFFER + 30
.EQU	SPALREGS,	BPALREGS   + 16


.EQU	PS_STAT,	SPALREGS + H'10	;player shot tables (wpn1)
.EQU	PS_TYPE,	PS_STAT  + H'08
.EQU	PS_XH,   	PS_TYPE  + H'08
.EQU	PS_XL,  	PS_XH    + H'08
.EQU	PS_YH,  	PS_XL    + H'08
.EQU	PS_YL,  	PS_YH    + H'08
.EQU	PS_XVEL,	PS_YL    + H'08
.EQU	PS_YVEL,	PS_XVEL  + H'08
.EQU	PS_DIR,		PS_YVEL  + H'08

.EQU	W2_STAT,	PS_STAT  + H'04	;player wpn2 tables
.EQU	W2_TYPE,	PS_TYPE  + H'04	;---embedded in wpn1 tables
.EQU	W2_XH,  	PS_XH    + H'04
.EQU	W2_XL,  	PS_XL    + H'04
.EQU	W2_YH,  	PS_YH    + H'04
.EQU	W2_YL,  	PS_YL    + H'04
.EQU	W2_XVEL,	PS_XVEL  + H'04
.EQU	W2_YVEL,	PS_YVEL  + H'04
.EQU	W2_DIR, 	PS_DIR   + H'04
.EQU	W2_TARG,	W2_DIR   + H'04

.EQU	ESHPSTAT,	W2_TARG  + H'04	;enemy ship data tables
;		80=alive,40=on screen
.EQU	ESHPTYPE,	ESHPSTAT + H'04
.EQU	ESHPDIR, 	ESHPTYPE + H'04
.EQU	ESHP_XL,	ESHPDIR	 + H'04
.EQU	ESHP_XH,	ESHP_XL  + H'04
.EQU	ESHP_YL,	ESHP_XH  + H'04
.EQU	ESHP_YH,	ESHP_YL  + H'04
.EQU	ESHPXVEL,	ESHP_YH  + H'04
.EQU	ESHPYVEL,	ESHPXVEL + H'04
.EQU	ESHPDAM,	ESHPYVEL + H'04
.EQU	ESHPXDST,	ESHPDAM  + H'04
.EQU	ESHPYDST,	ESHPXDST + H'04
.EQU	ESHPSEEK,	ESHPYDST + H'04
.EQU	ESHPTIME,	ESHPSEEK + H'04
.EQU	ESHPDRV,	ESHPTIME + H'04
.EQU	ESHPWPN,	ESHPDRV  + H'04
.EQU	ESHPPTS,	ESHPWPN	 + H'04
.EQU	ESHPPAL,	ESHPPTS  + H'04

.EQU	PLYREXPL,	ESHPPAL  + H'04	;player shot explosions
.EQU	SHOTEXPL,	PLYREXPL + H'08	;enemy shot explosions
.EQU	DRN_EXPL,	SHOTEXPL + H'0C	;drone explosions
.EQU	SHIPEXPL,	DRN_EXPL + H'04	;enemy ship explosions

.EQU	ES_STAT,	SHIPEXPL + H'04	;enemy shot data tables
.EQU	ES_TYPE,	ES_STAT  + H'0C	;   (12 max.)
.EQU	ES_XH,  	ES_TYPE  + H'0C
.EQU	ES_XL,  	ES_XH    + H'0C
.EQU	ES_YH,  	ES_XL    + H'0C
.EQU	ES_YL,  	ES_YH    + H'0C
.EQU	ES_XVEL,	ES_YL    + H'0C
.EQU	ES_YVEL,	ES_XVEL  + H'0C
.EQU	ES_DIR, 	ES_YVEL  + H'0C

.EQU	STN_STAT,	ES_DIR   + H'0C	;space stations
.EQU	STN_WPN,	STN_STAT + H'08	;   (8 max.)
.EQU	STN_XH, 	STN_WPN  + H'08
.EQU	STN_XL, 	STN_XH   + H'08
.EQU	STN_YH, 	STN_XL   + H'08
.EQU	STN_YL, 	STN_YH   + H'08
.EQU	STN_DAM,	STN_YL   + H'08


.EQU	GUN_STAT,	STN_DAM  + H'08	;turrets/guns
.EQU	GUN_XH,		GUN_STAT + H'44	;   (68 max.)
.EQU	GUN_XL,		GUN_XH   + H'44
.EQU	GUN_YH,		GUN_XL   + H'44
.EQU	GUN_YL,		GUN_YH   + H'44
.EQU	GUN_PHASE,	GUN_YL   + H'44
.EQU	SYSTEM,	   	GUN_STAT


.EQU	SNDSLOTS,4		;max allowed active sound structures

.EQU	SND_WIDE,7		;width of each entry.  not user changable.
.EQU	SND_RAM, 	GUN_PHASE + H'44
				;FORMAT:
.EQU	SF,0			;Sound Flag-  Bit 80h set if slot in use.
				;	      Bit 40h set if sound has not
				;             been assigned to a register set.
				;	      Bit 20h set if sound suspended
				;	        by another voice.
				;             Low bits specify low byte of 
				;	      register set base (0,4,8,etc).
.EQU	ST,1			;Sound Timer- Loaded with note or pause 
				;             duration in 1/60 second ticks.
.EQU	SBL,2			;Base Pointer (word) to the original sound
.EQU	SBH,3			;	      structure passed in call.
.EQU	SOL,4			;Sound offset of current play location.			
.EQU	SOH,5
.EQU	SI,6			;Instrument currently active.  Used to 
				;	      restore sound if suspended.


.EQU	CHECKMEM,	SND_RAM + (SNDSLOTS * SND_WIDE)
;---6A6----04-27-90

.EQU	MS_FLAG,	H'6BE
.EQU	NEXT_GUN,	H'6BF
.EQU	GAMEMODE,	H'6C0

.EQU	PR_X,  		H'6C1
.EQU	PR_Y,   	H'6C2
.EQU	PR_INDEX, 	H'6C3
.EQU	PR_LEFT,	H'6C4
.EQU	PR_PAGE,	H'6C5
.EQU	PR_TOP, 	H'6C6

.EQU	EMODE,		H'6C7	;0..3 -- determines MAX_ENEMY & MAX_ESHOT

.EQU	TWR_MAX,	H'6CC
.EQU	ENEMIES,	H'6CD

.EQU	CHEATDIE,	H'6CE
.EQU	MISSION,	H'6CF

.EQU	GOAL0,		H'6D0
.EQU	GOAL1,		H'6D1
.EQU	GOAL2,		H'6D2
.EQU	GOAL3,		H'6D3
.EQU	GOAL4,		H'6D4
.EQU	GOAL5,		H'6D5
.EQU	GOAL6,		H'6D6
.EQU	GOAL7,		H'6D7
.EQU	GOAL8,		H'6D8

.EQU	GOALSECX,	H'6D9
.EQU	GOALSECY,	H'6DA
.EQU	GOALSYSX,	H'6DB
.EQU	GOALSYSY,	H'6DC
.EQU	GOALOBJX,	H'6DD
.EQU	GOALOBJY,	H'6DE

.EQU	T_SIX,		H'6DF

.EQU	SCCNT,		H'6E0	;size of data currently in buffer

.EQU	BPAL_BLINK,	H'6E1
.EQU	BPAL_DEPTH,	H'6E2
.EQU	BPAL_FREQ,	H'6E3
.EQU	BPAL_INDX,	H'6E4
.EQU	BPAL_CNT,	H'6E5

.EQU	SPAL_BLINK,	H'6E6
.EQU	SPAL_DEPTH,	H'6E7
.EQU	SPAL_FREQ,	H'6E8
.EQU	SPAL_INDX,	H'6E9
.EQU	SPAL_CNT,	H'6EA

.EQU	NEW_PAL,	H'6EB
.EQU	HASPLAYED,	H'6EC

.EQU	TOOMANY,	H'6ED
.EQU	BASESPRITE,	H'6EE

.EQU	FLASHCT,	H'6EF

.EQU	PALX,		H'6F0
.EQU	DATX,		H'6F1
.EQU	DATCOUNT,	H'6F2

.EQU	STN_ROTATE,	H'6F3

.EQU	T_SEC,		H'6F4
.EQU	T_MIN,		H'6F5
.EQU	T_HOUR,		H'6F6

.EQU	SYS_PAL,	H'6F7
.EQU	SAV_PAGE,	H'6F8
.EQU	LST_THR,	H'6F9
.EQU	TDIR,		H'6FA
.EQU	TSPD,		H'6FB
.EQU	SAV_XSCR,	H'6FC
.EQU	SAV_YSCR,	H'6FD
.EQU	SAV_XOFF,	H'6FE
.EQU	SAV_YOFF,	H'6FF
































































;-----LINE 700-----------------------------------------------
