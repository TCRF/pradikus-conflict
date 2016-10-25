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
; ca65 version by Devin Acker (Revenant)
; 7 November 2013
;
;"RAMVARS.ASM" --- zero page vars., etc.
;




;Sprite table offsets--------------------------------

.define	SPR_YPOS	 1	;screen Y pos.
.define	SPR_CHAR	 2	;character
.define	SPR_FLIP	 3	;flip (hi. nyb.) and pal (lo. nyb.)
.define	SPR_XPOS	 4	;screen X pos.



.define	RT_BTN	  $01	     	;joystick masks
.define	LT_BTN	  $02
.define	DN_BTN	  $04
.define	UP_BTN	  $08
.define	START	  $10
.define	SELECT	  $20
.define	B_BTN	  $40
.define	A_BTN	  $80


.define	SUN 		 $36	;type/pal = 3; size = 6


.define	GAS 		 $80	;masks for 'data bits' field
.define	INHAB 		 $40	;of a solar system entry...
.define	UNINHAB 	 $00
.define	FRNDLY 		 $20
.define	UNFRNDLY 	 $00
.define	V_HIGH 		 $18
.define	HIGH 		 $10
.define	AVG 		 $08
.define	LOW 		 $00


.define	CANNON 		1	;weapon nos.
.define	ATOMIC 		2
.define	L_LASER 	3
.define	H_LASER 	4
.define	MISSLE 		5
.define	MINE 		6
.define	T_BOLT 		7

.define	ENGINE 		 $01	;active sound codes
.define	SHOT 		 $20
.define	COLLISION 	 $F0
.define	SHIP 		 $FF

.define	PLYR_POS 	 $74
.define  	PLYR_TOP 	 $78	;upper left and lower right coords of
.define  	PLYR_BOT         $88	;square "surrounding" player...used
                                ;to check for collisions and hits...

.define	GREEN 		 $00	;status indicator equates...
.define	YELLOW 		 $01
.define	RED 		 $02
.define	CRITIC 		 $FF


.define	SPC   $FA
.define  S1   $02
.define	 S2   $03
.define	 S3   $04
.define	 S4   $05
.define	 S5   $06
.define	 S6   $07


;*******************************************
;	ZER0 PAGE VARIABLES
;*******************************************


.define	PTR0L 		 $00
.define	PTR0H 		 $01
.define	PTR1L 		 $02
.define	PTR1H 		 $03
.define	PTR2L 		 $04
.define	PTR2H 		 $05
.define	PTR3L 		 $06
.define	PTR3H 		 $07	;general pointer vars.
.define	BPAL_BASE 	 $08
;---            BPAL_BASE+1
.define	CX 		 $0A
.define	CY 		 $0B	;character pos. on screen
.define	COUNT0 		 $0C
.define	COUNT1 		 $0D
.define	COUNT2 		 $0E
.define	COUNT3 		 $0F	;general purpose counters


.define	OBJ1_TOP 	 $10	;enemy objects
.define	OBJ1_BOT 	 $11
.define	OBJ1_LT 	 $12
.define	OBJ1_RT 	 $13
.define	OBJ2_TOP 	 $14	;player objects
.define	OBJ2_BOT 	 $15
.define	OBJ2_LT 	 $16
.define	OBJ2_RT 	 $17
.define	DENSCOUNT 	 $18
.define	ENMYWAIT 	 $19	;non-zero if need to add object
.define	DRN_WAIT 	 $1A
.define	LASTFIRE 	 $1B
.define	NEXT_ENEMY 	 $1D
.define	NEXT_SHOT 	 $1E
.define	NEXT_PSHT 	 $1F


.define	VEL_X 		 $20
.define	VEL_Y 		 $21
.define	COMPTIME 	 $22
.define	SAVE_X 		 $23
.define	SAVE_Y 		 $24
.define	EXPL_A 		 $25
.define	EXPL_Y 		 $26
.define	EXPL_X 		 $27
.define	EXPL_TEMP 	 $28	; TEMPS FOR EXPLOSIONS
.define	NEW_DIR 	 $29
.define	DX 		 $2A
.define	DY 		 $2B
.define	SIGN_DX 	 $2C
.define	SIGN_DY 	 $2D
.define	DIRINDEX 	 $2E
.define	TBLINDEX 	 $2F


.define	LOGIC_Y 	 $30
.define	LOGIC_X 	 $31
.define	LOGIC_TEMP 	 $32
.define	LOGIC_AX 	 $33
.define	LOGIC_AY 	 $34
.define	LOGIC_BX 	 $35
.define	LOGIC_BY 	 $36
.define	SEEKING 	 $37
.define	NEXT_STN 	 $38
.define	INVISO 		 $39
.define	P_THNDR 	 $3A
.define	CHEAT 		 $3B
.define	CODE_INDX 	 $3C
.define	E_MISLS 	 $3D
.define	COMPITEM 	 $3E
;.define	TARGET 		 $3F	;del 04-21-90


.define	H1M 		 $40	;High Score
.define	H100K 		 $41
.define	H10K 		 $42
.define	H1K 		 $43
.define	H100 		 $44
.define	H10 		 $45
.define	H1 		 $46
.define	SPRXH 		 $47
.define	SPRXL 		 $48
.define	SPRYH 		 $49
.define	SPRYL 		 $4A
.define	BASES1 		 $4B
.define	BASES10  	 $4C
.define	BASES100 	 $4D
.define	BASES1K  	 $4E
.define	BASES10K 	 $4F


.define	SAVEBIT0 	 $50
.define	SAVEBIT1 	 $51
.define	SAVEBIT2 	 $52
.define	SYSBIT0 	 $53
.define	SYSBIT1 	 $54
.define	SYSBIT2 	 $55
.define	SHIPS1 		 $56
.define	SHIPS10  	 $57
.define	SHIPS100 	 $58
.define	SHIPS1K  	 $59
.define	SHIPS10K 	 $5A
;;.define	REFUELCNT 	 $5B
.define	THR_CNT 	 $5C
.define	PALINDEX 	 $5D
.define	PALOFFSET 	 $5E
.define	PALSHIFT 	 $5F


.define	XSTAT 		 $60
.define	MAX_ESHOT	 $61	;maximum # of enemy shots (7, 10, 11  12)
.define	SAVEPWR 	 $62
.define	BEEPREG  	 $63
.define	SUBSVAR1 	 $64
.define	SUBSVAR2 	 $65
.define	SUBSVAR3 	 $66
.define	SUBSVAR4 	 $67	;SOUND VARS
.define	TMP_NMI1 	 $68
.define	TMP_NMI2 	 $69
.define	REG4015 	 $6A
.define	GUN_WPN 	 $6B
.define	TURRET_1 	 $6C
.define	TURRET_2 	 $6D
.define	TURRET_3 	 $6E
.define	TURRET_4 	 $6F


.define	ARDAT0 		 $70
.define	ARDAT1 		 $71
.define	ARDAT2 		 $72
.define	ARDAT3 		 $73
.define	ARDAT4 		 $74
.define	ARDAT5 		 $75
.define	ARDAT6 		 $76
.define	SPR0PTR 	 $77
.define	SPR1PTR 	 $78
.define	GAL_PTRL 	 $79
.define	GAL_PTRH 	 $7A
.define	SEC_PTRL 	 $7B
.define	SEC_PTRH 	 $7C
.define	ORBIT 		 $7D
.define	TOWERS 		 $7E
.define	TURRETS 	 $7F


.define	CR100K 		 $80
.define	CR10K 		 $81
.define	CR1K 		 $82
.define	CR100 		 $83
.define	CR10 		 $84
.define	CRDT_Y 		 $85
.define	SC1 		 $86
.define	SC10 		 $87
.define	SC100 		 $88
.define	SC1000 		 $89
.define	SC10000 	 $8A
.define	SC100000 	 $8B
.define	SC1M 		 $8C
.define	DIR 		 $8D	;player variables
.define	THRUST 		 $8E
.define	FUEL 		 $8F


.define	SHIELD 		 $90
.define	SAVEARMR 	 $91
.define	STATUS 		 $92
.define	WARP 		 $93
.define	DAMAGE 		 $94
.define	FUELUSED 	 $95
.define	DEATH 		 $96	; WHEN PLAYER DIES COUNT DOWN
.define	DEST_GX 	 $97
.define	DEST_GY 	 $98
.define	DEST_SX 	 $99
.define	DEST_SY 	 $9A
.define	TVELX 		 $9B
.define	TVELY 		 $9C
.define	TMAX 		 $9D
.define	PXOFF 		 $9E
.define	PYOFF 		 $9F


.define	FLASH 		 $A0
.define	FLIP 		 $A1
.define	ABS 		 $A2
.define	PHASE0 		 $A3
.define	PHASE1 		 $A4
.define	REFUEL 		 $A5
.define	REGEN 		 $A6
.define	PSHPXVEL 	 $A7
.define	PSHPYVEL 	 $A8
.define	TPOSL 		 $A9
.define	TPOSH 		 $AA
.define	DBARFLAG 	 $AB
.define	SCRNPTRL 	 $AC
.define	SCRNPTRH 	 $AD
.define	OBJPTRL 	 $AE
.define	OBJPTRH 	 $AF


.define	BKGRWIDTH 	 $B0	;width of background table
.define	BKGRPTRL 	 $B1
.define	BKGRPTRH 	 $B2
.define	BKGRND 		 $B3
.define	PAGE 		 $B4	;copy of page select register
.define	XSCROLL 	 $B5	;copy of scroll registers...
.define	YSCROLL 	 $B6
.define	OBJINDEX 	 $B7	;set by FINDOBJECT...
.define	T4 		 $B8
.define	CRSR_I 		 $B9
.define	CURSORX 	 $BA
.define	CURSORY 	 $BB
.define	TX 		 $BC
.define	TY 		 $BD
.define	T0 		 $BE
.define	T1 		 $BF


.define	T2 		 $C0
.define	T3 		 $C1
.define	C100000 	 $C2	;the following six vars. must
.define	C10000 		 $C3	;  be in descending order
.define	C1000 		 $C4
.define	C100 		 $C5
.define	C10 		 $C6
.define	C1 		 $C7
.define	TIMER3 		 $C8
.define	TIMER2 		 $C9
.define	TIMER1 		 $CA
.define	TIMER0 		 $CB	;incremented every NMI proc. call
.define	V_SEL 		 $CC	;copies of VidSelect & VidMode
.define	V_MODE 		 $CD
.define	EFFECT 		 $CE
.define	DENS 		 $CF


.define	PR_PTRL 	 $D0
.define	PR_PTRH 	 $D1
.define	SPAL_BASE 	 $D2
;---            BPAL_BASE+1
.define	RAND 		 $D4	;set equal to timer every time a change
.define	XBLOCK 		 $D5
.define	YBLOCK 		 $D6
.define	XBOFF 		 $D7
.define	YBOFF 		 $D8
.define	XMOVE 		 $D9	;0 = no scroll  -7 to +7
.define	YMOVE 		 $DA
.define	VIDROM 		 $DB
.define	PROGROM 	 $DC
.define	J1VAL 		 $DD	;current joystick value
.define	J1CHG 		 $DE	;newly pressed joystick buttons
.define	ITEM1CNT 	 $DF


.define	ITEM2CNT 	 $E0
.define	ITEM3CNT 	 $E1
.define	ITEM4CNT 	 $E2
.define	CLOAK 		 $E3	;player item list
.define	MINES 		 $E4	;--set hi-bit if damaged
.define	MISSILES 	 $E5	;--00 = none/destroyed
.define	S_WAVE 		 $E6
.define	THUNDER 	 $E7
.define	FREEM 		 $E8
.define	HASBOLT 	 $E9
.define	HASFREEM 	 $EA
.define	DRIVE 		 $EB
.define	PWRPLANT 	 $EC
.define	ARMOR 		 $ED
.define	SHLDTYPE 	 $EE
.define	WPN1 		 $EF


.define	WPN2 		 $F0
.define	GALAXY_X 	 $F1	;0..7
.define	GALAXY_Y 	 $F2
.define	SECTOR_X 	 $F3	;1..16
.define	SECTOR_Y 	 $F4
.define	XPOS 		 $F5	;coord. block in galaxy	(0..BKGRWIDTH)
.define	YPOS 		 $F6
.define	XREL 		 $F7	;ch. offset (0-7  0-7) in block
.define	YREL 		 $F8
.define	DEST_I 		 $F9
.define	DEST_X 		 $FA
.define	DEST_Y 		 $FB
.define	TIME_DIFF 	 $FC
.define	PRADIKUS 	 $FD
.define	DIFF 		 $FE	;difficulty (00-6F)
.define	MAX_ENEMY 	 $FF





;*******************************************
;	REG. DEFINITIONS
;*******************************************

.define	VID_SEL    	 $2000
.define	VID_MODE   	 $2001
.define	Vid_Reset  	 $2002
.define	SPR_PTR    	 $2003
.define	SPR_DATA   	 $2004
.define	SCR_REG    	 $2005
.define	VID_PTR    	 $2006
.define	VID_DATA   	 $2007



.define	DMA        	 $4014
.define	SOUND      	 $4015
.define	Jport1     	 $4016
.define	JPORT2     	 $4017


.define	ROMSELECT 	 $FFFF




;*****************************
; CONSTANTS & OFFSETS
;*****************************


.define	STACK 	   	 $0100


.define	PALGRID 	 $0100


.define	SPRTBL0 	 $0200
        .define	FLMSPR0 	 $0200
        .define	TGTSPR0 	 $0204
        .define	CMPSPR0 	 $0208
        .define	PLYRSPR0 	 $020C
        .define 	PSHTSPR0 	 $0230

        .define  	SHOTSPR0 	 $0250
        .define  	ENSPR0 		 $0280
        .define	GUN_SPR0 	 $02C0
        .define	COSTSPR0 	 $0268


.define	SCBUF 		 $0700
.define	SPRTBL1 	 $0700
        .define	FLMSPR1 	 $07FC
        .define	TGTSPR1 	 $07F8
        .define	CMPSPR1 	 $07F4
        .define	PLYRSPR1 	 $07D0
        .define	PSHTSPR1 	 $07B0

        .define	SHOTSPR1 	 $0740
        .define	ENSPR1 		 $0770
        .define	GUN_SPR1 	 $0700
        .define	COSTSPR1 	 $0768

.define	VERTBUFFER 	 $0300
.define	VPALBUFFER 	VERTBUFFER + 33
.define	HORZBUFFER 	VPALBUFFER + 20	;17 + 3 padding
.define	HPALBUFFER 	HORZBUFFER + 43

.define	BPALREGS 	HPALBUFFER + 30
.define	SPALREGS 	BPALREGS   + 16


.define	PS_STAT 	SPALREGS +  $10	;player shot tables (wpn1)
.define	PS_TYPE 	PS_STAT  +  $08
.define	PS_XH    	PS_TYPE  +  $08
.define	PS_XL   	PS_XH    +  $08
.define	PS_YH   	PS_XL    +  $08
.define	PS_YL   	PS_YH    +  $08
.define	PS_XVEL 	PS_YL    +  $08
.define	PS_YVEL 	PS_XVEL  +  $08
.define	PS_DIR 		PS_YVEL  +  $08

.define	W2_STAT 	PS_STAT  +  $04	;player wpn2 tables
.define	W2_TYPE 	PS_TYPE  +  $04	;---embedded in wpn1 tables
.define	W2_XH   	PS_XH    +  $04
.define	W2_XL   	PS_XL    +  $04
.define	W2_YH   	PS_YH    +  $04
.define	W2_YL   	PS_YL    +  $04
.define	W2_XVEL 	PS_XVEL  +  $04
.define	W2_YVEL 	PS_YVEL  +  $04
.define	W2_DIR  	PS_DIR   +  $04
.define	W2_TARG 	W2_DIR   +  $04

.define	ESHPSTAT 	W2_TARG  +  $04	;enemy ship data tables
;		80=alive,40=on screen
.define	ESHPTYPE 	ESHPSTAT +  $04
.define	ESHPDIR  	ESHPTYPE +  $04
.define	ESHP_XL 	ESHPDIR	 +  $04
.define	ESHP_XH 	ESHP_XL  +  $04
.define	ESHP_YL 	ESHP_XH  +  $04
.define	ESHP_YH 	ESHP_YL  +  $04
.define	ESHPXVEL 	ESHP_YH  +  $04
.define	ESHPYVEL 	ESHPXVEL +  $04
.define	ESHPDAM 	ESHPYVEL +  $04
.define	ESHPXDST 	ESHPDAM  +  $04
.define	ESHPYDST 	ESHPXDST +  $04
.define	ESHPSEEK 	ESHPYDST +  $04
.define	ESHPTIME 	ESHPSEEK +  $04
.define	ESHPDRV 	ESHPTIME +  $04
.define	ESHPWPN 	ESHPDRV  +  $04
.define	ESHPPTS 	ESHPWPN	 +  $04
.define	ESHPPAL 	ESHPPTS  +  $04

.define	PLYREXPL 	ESHPPAL  +  $04	;player shot explosions
.define	SHOTEXPL 	PLYREXPL +  $08	;enemy shot explosions
.define	DRN_EXPL 	SHOTEXPL +  $0C	;drone explosions
.define	SHIPEXPL 	DRN_EXPL +  $04	;enemy ship explosions

.define	ES_STAT 	SHIPEXPL +  $04	;enemy shot data tables
.define	ES_TYPE 	ES_STAT  +  $0C	;   (12 max.)
.define	ES_XH   	ES_TYPE  +  $0C
.define	ES_XL   	ES_XH    +  $0C
.define	ES_YH   	ES_XL    +  $0C
.define	ES_YL   	ES_YH    +  $0C
.define	ES_XVEL 	ES_YL    +  $0C
.define	ES_YVEL 	ES_XVEL  +  $0C
.define	ES_DIR  	ES_YVEL  +  $0C

.define	STN_STAT 	ES_DIR   +  $0C	;space stations
.define	STN_WPN 	STN_STAT +  $08	;   (8 max.)
.define	STN_XH  	STN_WPN  +  $08
.define	STN_XL  	STN_XH   +  $08
.define	STN_YH  	STN_XL   +  $08
.define	STN_YL  	STN_YH   +  $08
.define	STN_DAM 	STN_YL   +  $08


.define	GUN_STAT 	STN_DAM  +  $08	;turrets/guns
.define	GUN_XH 		GUN_STAT +  $44	;   (68 max.)
.define	GUN_XL 		GUN_XH   +  $44
.define	GUN_YH 		GUN_XL   +  $44
.define	GUN_YL 		GUN_YH   +  $44
.define	GUN_PHASE 	GUN_YL   +  $44
.define	SYSTEM 	   	GUN_STAT


.define	SNDSLOTS 4		;max allowed active sound structures

.define	SND_WIDE 7		;width of each entry.  not user changable.
.define	SND_RAM  	GUN_PHASE +  $44
                                ;FORMAT:
.define	SF 0			;Sound Flag-  Bit 80h set if slot in use.
                                ;	      Bit 40h set if sound has not
                                ;             been assigned to a register set.
                                ;	      Bit 20h set if sound suspended
                                ;	        by another voice.
                                ;             Low bits specify low byte of 
                                ;	      register set base (0,4,8,etc).
.define	ST 1			;Sound Timer- Loaded with note or pause 
                                ;             duration in 1/60 second ticks.
.define	SBL 2			;Base Pointer (word) to the original sound
.define	SBH 3			;	      structure passed in call.
.define	SOL 4			;Sound offset of current play location.			
.define	SOH 5
.define	SI 6			;Instrument currently active.  Used to 
                                ;	      restore sound if suspended.


.define	CHECKMEM 	SND_RAM + (SNDSLOTS * SND_WIDE)
;---6A6----04-27-90

.define	MS_FLAG 	 $6BE
.define	NEXT_GUN 	 $6BF
.define	GAMEMODE 	 $6C0

.define	PR_X   		 $6C1
.define	PR_Y    	 $6C2
.define	PR_INDEX  	 $6C3
.define	PR_LEFT 	 $6C4
.define	PR_PAGE 	 $6C5
.define	PR_TOP  	 $6C6

.define	EMODE 		 $6C7	;0..3 -- determines MAX_ENEMY & MAX_ESHOT

.define	TWR_MAX 	 $6CC
.define	ENEMIES 	 $6CD

.define	CHEATDIE 	 $6CE
.define	MISSION 	 $6CF

.define	GOAL0 		 $6D0
.define	GOAL1 		 $6D1
.define	GOAL2 		 $6D2
.define	GOAL3 		 $6D3
.define	GOAL4 		 $6D4
.define	GOAL5 		 $6D5
.define	GOAL6 		 $6D6
.define	GOAL7 		 $6D7
.define	GOAL8 		 $6D8

.define	GOALSECX 	 $6D9
.define	GOALSECY 	 $6DA
.define	GOALSYSX 	 $6DB
.define	GOALSYSY 	 $6DC
.define	GOALOBJX 	 $6DD
.define	GOALOBJY 	 $6DE

.define	T_SIX 		 $6DF

.define	SCCNT 		 $6E0	;size of data currently in buffer

.define	BPAL_BLINK 	 $6E1
.define	BPAL_DEPTH 	 $6E2
.define	BPAL_FREQ 	 $6E3
.define	BPAL_INDX 	 $6E4
.define	BPAL_CNT 	 $6E5

.define	SPAL_BLINK 	 $6E6
.define	SPAL_DEPTH 	 $6E7
.define	SPAL_FREQ 	 $6E8
.define	SPAL_INDX 	 $6E9
.define	SPAL_CNT 	 $6EA

.define	NEW_PAL 	 $6EB
.define	HASPLAYED 	 $6EC

.define	TOOMANY 	 $6ED
.define	BASESPRITE 	 $6EE

.define	FLASHCT 	 $6EF

.define	PALX 		 $6F0
.define	DATX 		 $6F1
.define	DATCOUNT 	 $6F2

.define	STN_ROTATE 	 $6F3

.define	T_SEC 		 $6F4
.define	T_MIN 		 $6F5
.define	T_HOUR 		 $6F6

.define	SYS_PAL 	 $6F7
.define	SAV_PAGE 	 $6F8
.define	LST_THR 	 $6F9
.define	TDIR 		 $6FA
.define	TSPD 		 $6FB
.define	SAV_XSCR 	 $6FC
.define	SAV_YSCR 	 $6FD
.define	SAV_XOFF 	 $6FE
.define	SAV_YOFF 	 $6FF
































































;-----LINE 700-----------------------------------------------
