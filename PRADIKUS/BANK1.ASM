;the P'Radikus Conflict
;
;6502 source code for use with Nintendo (TM)
;Entertainment System.
;
;
;	SAT 17 MAY 90
;	   Ver 2.0
;
;Graphics and Code by:
;  Jim Treadway & Mike Hunley
;
; ca65 version by Devin Acker (Revenant)
; 7 November 2013
;
;"BANK1.ASM" --- back ground test routines
;
;

;*******************************************
;	MEMORY BANK 1
;*******************************************

.scope bank1
.segment "BANK1"

;****************************
; BOOT CODE
;****************************


.ORG	 $8000


BOOT:	
		SEI
		CLD
		LDX	#$FF
		TXS
	
		LDA	#$06
		STA	VID_MODE
	
		JSR	VR_WAIT
		JSR	VR_WAIT
		
		LDA	ROM0
		STA	ROM0



		JMP	BOOT2	;never called!


;***********************************

COMPOFF:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		JSR	TESTCOMP
		JMP	COMPOFF






;***********************************

ROWXFER:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		JSR	RXFER
		JMP	ROWXFER

		



;***********************************

COLXFER:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		JSR	CXFER
		JMP	COLXFER





;***********************************

FINDOBJECT:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		NOP
		NOP
		NOP
		NOP
		NOP
		RTS

;***********************************

GOBJPTR:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		JSR	GETOBJPTR
		JMP	GOBJPTR





;***********************************

ONIL:		STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		JSR	OBJ_NIL
		JMP	ONIL





;***********************************

GBLOCK:		STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		JSR	GETBLOCK
		JMP	GBLOCK





;***********************************

SCAN:		STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		NOP
		NOP
		NOP
		NOP
		NOP
		RTS

;***********************************

ITEMCOST:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		NOP
		NOP
		NOP
		NOP
		NOP
		RTS

;***********************************

BUYITEM:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		NOP
		NOP
		NOP
		NOP
		NOP
		RTS

;***********************************

ITEMAVAIL:	STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		NOP
		NOP
		NOP
		NOP
		NOP
		RTS

;***********************************

MAP:		STY	T4

		LDA	ROMX
		STA	PROGROM
		CLC
		ADC	VIDROM
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y



		LDY	T4
		NOP
		NOP
		NOP
		NOP
		NOP
		RTS

;***********************************

ROM0:	.byte	 $00
ROM1:	.byte	 $01
ROMX:	.byte	 $00


XVIDEO:		

;Acc. = video page #

		ASL	A
		STA	VIDROM
		CLC
		ADC	ROM1
		TAY
		LDA	ROMTAB, Y
		STA	ROMTAB, Y




		RTS

ROMTAB:		.byte	 $00,  $01,  $10,  $11	;sets 0, 1
		.byte	 $20,  $21,  $30,  $31  ;sets 2, 3
		.byte	 $40,  $41,  $50,  $51	;sets 4, 5
		.byte	 $60,  $61,  $70,  $71	;sets 6, 7

;***********************************


BOOT2:	JMP	BOOT2



;***********************************


;*******************************************
;   TRANSLATE TABLE	(07-25-89)
;*******************************************


XLAT0:	.byte	 $FA, $FB, $FC, $FD, $02, $03, $04, $05	;PAL2--------
	.byte	 $06, $07, $BF, $DE, $BD, $DC, $DF, $DB	;    00 to 5F
	.byte	 $3C, $3D, $3E, $3F, $5A, $1E, $F9, $7C
	.byte	 $B9, $3B, $B8, $BE, $BC, $BA, $BB, $D9	;normal
	.byte	 $DA, $32, $33, $34, $35, $36, $37, $38
	.byte	 $39, $3A, $1F, $1F, $8C, $8D, $AC, $AD
	.byte	 $4C, $4D, $6C, $6D, $4E, $4F, $6E, $6F 
	.byte	 $50, $51, $70, $71, $52, $53, $72, $73
	.byte	 $8A, $8B, $AA, $AB, $8E, $8F, $AE, $AF
	.byte	 $90, $91, $B0, $B1, $92, $93, $B2, $B3
	.byte	 $57, $58, $77, $78, $97, $98, $B7, $D7
	.byte	 $D8, $F7, $F8, $9C, $1F, $1F, $1F, $1F


	.byte	 $DE, $3C, $3D, $3E, $3F, $1E, $F9, $7C	;PAL3--------
	.byte	 $FA, $FB, $FC, $FD, $4E, $4F, $6E, $6F	;    60 to 7F
	.byte	 $50, $51, $70, $71, $52, $53, $72, $73
	.byte	 $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F	;blinking 


	.byte	 $FA, $FB, $FC, $FD, $40, $41, $42, $60	;PAL1--------
	.byte	 $61, $62, $80, $81, $82, $A0, $A1, $A2	;    80 to FF
	.byte	 $C0, $C1, $C2, $E0, $E1, $E2, $43, $44
	.byte	 $45, $63, $64, $65, $83, $84, $85, $A3	;dirt/bushes
	.byte	 $A4, $A5, $C3, $C4, $C5, $E3, $E4, $E5
	.byte	 $46, $66, $86, $A6, $1F, $1F, $1F, $1F

;upside-down

XLAT1:	.byte	 $FA, $FB, $FC, $FD, $02, $03, $04, $05	;PAL2--------
	.byte	 $06, $07, $BF, $DE, $BD, $DC, $DB, $DF	;    00 to 5F
	.byte	 $3F, $3E, $3D, $3C, $5A, $1E, $F9, $7C
	.byte	 $B9, $3B, $B8, $BE, $BC, $D9, $DA, $BA	;normal
	.byte	 $BB, $38, $39, $3A, $35, $36, $37, $32
	.byte	 $33, $34, $1F, $1F, $AC, $AD, $8C, $8D
	.byte	 $6C, $6D, $4C, $4D, $6F, $4F, $6E, $4E 
	.byte	 $70, $71, $50, $51, $72, $73, $52, $53
	.byte	 $AA, $AB, $8A, $8B, $AF, $8F, $AE, $8E
	.byte	 $B0, $B1, $90, $91, $B2, $B3, $92, $93
	.byte	 $F7, $58, $97, $98, $77, $78, $B7, $D7
	.byte	 $D8, $57, $F8, $9C, $1F, $1F, $1F, $1F


	.byte	 $DE, $3F, $3E, $3D, $3C, $1E, $F9, $7C	;PAL3--------
	.byte	 $FA, $FB, $FC, $FD, $6E, $6F, $4E, $4F	;    60 to 7F
	.byte	 $70, $71, $50, $51, $72, $73, $52, $53
	.byte	 $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F	;blinking 


	.byte	 $FA, $FB, $FC, $FD, $80, $81, $82, $60	;PAL1--------
	.byte	 $61, $62, $40, $41, $42, $E0, $E1, $E2	;    80 to FF
	.byte	 $C0, $C1, $C2, $A0, $A1, $A2, $83, $84
	.byte	 $85, $63, $64, $65, $43, $44, $45, $E3	;dirt/bushes
	.byte	 $E4, $E5, $C3, $C4, $C5, $A3, $A4, $A5
	.byte	 $46, $66, $86, $A6, $1F, $1F, $1F, $1F

;left-right

XLAT2:	.byte	 $FA, $FB, $FC, $FD, $02, $03, $04, $05	;PAL2--------
	.byte	 $06, $07, $BF, $DE, $DC, $BD, $DF, $DB	;    00 to 5F
	.byte	 $3D, $3C, $3F, $3E, $5A, $1E, $F9, $7C
	.byte	 $B9, $3B, $B8, $BE, $BC, $BB, $BA, $DA	;normal
	.byte	 $D9, $34, $33, $32, $37, $36, $35, $3A
	.byte	 $39, $38, $1F, $1F, $8D, $8C, $AD, $AC
	.byte	 $4D, $4C, $6D, $6C, $4E, $6E, $4F, $6F 
	.byte	 $51, $50, $71, $70, $53, $52, $73, $72
	.byte	 $8B, $8A, $AB, $AA, $8E, $AE, $8F, $AF
	.byte	 $91, $90, $B1, $B0, $93, $92, $B3, $B2
	.byte	 $57, $F8, $78, $77, $98, $97, $B7, $D8
	.byte	 $D7, $F7, $58, $9C, $1F, $1F, $1F, $1F


	.byte	 $DE, $3D, $3C, $3F, $3E, $1E, $F9, $7C	;PAL3--------
	.byte	 $FA, $FB, $FC, $FD, $4F, $4E, $6F, $6E	;    60 to 7F
	.byte	 $51, $50, $71, $70, $53, $52, $73, $72
	.byte	 $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F	;blinking 


	.byte	 $FA, $FB, $FC, $FD, $42, $41, $40, $62	;PAL1--------
	.byte	 $61, $60, $82, $81, $80, $A2, $A1, $A0	;    80 to FF
	.byte	 $C2, $C1, $C0, $E2, $E1, $E0, $45, $44
	.byte	 $43, $65, $64, $63, $85, $84, $83, $A5	;dirt/bushes
	.byte	 $A4, $A3, $C5, $C4, $C3, $E5, $E4, $E3
	.byte	 $46, $66, $86, $A6, $1F, $1F, $1F, $1F

;both

XLAT3:	.byte	 $FA, $FB, $FC, $FD, $02, $03, $04, $05	;PAL2--------
	.byte	 $06, $07, $BF, $DE, $DC, $BD, $DB, $DF	;    00 to 5F
	.byte	 $3E, $3F, $3C, $3D, $5A, $1E, $F9, $7C
	.byte	 $B9, $3B, $B8, $BE, $BC, $DA, $D9, $BB	;normal
	.byte	 $BA, $3A, $39, $38, $37, $36, $35, $34
	.byte	 $33, $32, $1F, $1F, $AD, $AC, $8D, $8C
	.byte	 $6D, $6C, $4D, $4C, $6F, $6E, $4F, $4E 
	.byte	 $71, $70, $51, $50, $73, $72, $53, $52
	.byte	 $AB, $AA, $8B, $8A, $AF, $AE, $8F, $8E
	.byte	 $B1, $B0, $91, $90, $B3, $B2, $93, $92
	.byte	 $F7, $F8, $98, $97, $97, $98, $B7, $D8
	.byte	 $D7, $57, $58, $9C, $1F, $1F, $1F, $1F


	.byte	 $DE, $3E, $3F, $3C, $3D, $1E, $F9, $7C	;PAL3--------
	.byte	 $FA, $FB, $FC, $FD, $6F, $6E, $4F, $4E	;    60 to 7F
	.byte	 $71, $70, $51, $50, $73, $72, $53, $52
	.byte	 $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F	;blinking 


	.byte	 $FA, $FB, $FC, $FD, $82, $81, $80, $62	;PAL1--------
	.byte	 $61, $60, $42, $41, $40, $E2, $E1, $E0	;    80 to FF
	.byte	 $C2, $C1, $C0, $A2, $A1, $A0, $85, $84
	.byte	 $83, $65, $64, $63, $45, $44, $43, $E5	;dirt/bushes
	.byte	 $E4, $E3, $C5, $C4, $C3, $A5, $A4, $A3
	.byte	 $46, $66, $86, $A6, $1F, $1F, $1F, $1F
 

;****************************

HPALINIT:	
	
		LDA	#$02
		STA	PALINDEX
		LDA	#$00
		STA	PALOFFSET
		STA	PALSHIFT
		TYA
		ROR	A
		ROR	A
		ROL	PALSHIFT

		TXA
		PHA

		LDA	#$23
		JSR	HPCHK
		STA	HPALBUFFER+0
		JSR	HPCHK
		STA	HPALBUFFER+3
		JSR	HPCHK
		STA	HPALBUFFER+6
		JSR	HPCHK
		STA	HPALBUFFER+9
		JSR	HPCHK
		STA	HPALBUFFER+12
		JSR	HPCHK
		STA	HPALBUFFER+15
		JSR	HPCHK
		STA	HPALBUFFER+18
		JSR	HPCHK
		STA	HPALBUFFER+21
		JSR	HPCHK
		STA	HPALBUFFER+24
		JSR	HPCHK
		STA	HPALBUFFER+27
		
		PLA
		TAX

		TXA
		AND	#$1F
		LSR	A
		LSR	A		;div. by 4
		STA	COUNT0
		TYA
		LSR	A
		LSR	A
		ASL	A
		ASL	A
		ASL	A		;(div. by 4) * 8
		CLC
		ADC	#$C0
		ADC	COUNT0

		STA	HPALBUFFER+1
		JSR	H2CHK
		STA	HPALBUFFER+4
		JSR	H2CHK
		STA	HPALBUFFER+7
		JSR	H2CHK
		STA	HPALBUFFER+10
		JSR	H2CHK
		STA	HPALBUFFER+13
		JSR	H2CHK
		STA	HPALBUFFER+16
		JSR	H2CHK
		STA	HPALBUFFER+19
		JSR	H2CHK
		STA	HPALBUFFER+22
		JSR	H2CHK
		STA	HPALBUFFER+25
		JSR	H2CHK
		STA	HPALBUFFER+28
		
		LDA	#0
		STA	HPALBUFFER+2
		STA	HPALBUFFER+5
		STA	HPALBUFFER+8
		STA	HPALBUFFER+11
		STA	HPALBUFFER+14
		STA	HPALBUFFER+17
		STA	HPALBUFFER+20
		STA	HPALBUFFER+23
		STA	HPALBUFFER+26
		STA	HPALBUFFER+29


		RTS


HPCHK:		LDA	#$23
		CPX	#32
		BCC	HPCHK2
		LDA	#$27
HPCHK2:		PHA
		TXA
		CLC
		ADC	#4
		CMP	#64
		BCC	HPCHK3
		SBC	#64
HPCHK3:		TAX
		PLA
		RTS


		
H2CHK:		CLC
		ADC	#$01
		PHA
		AND	#$07
		BNE	H2OK
		PLA
		SEC
		SBC	#$08
		RTS
H2OK:		PLA
		RTS



RXPAL:		
		STA	ARDAT4	;temp.
		TYA
		PHA
		TXA
		PHA

		LDA	ARDAT4
		JSR	GETPAL
		STA	ARDAT1

		LDY	PALSHIFT
		LDA	ROFFMASK, Y
		STA	ARDAT0
		LDA	PALOFFSET
		LSR	A
		TAY
		LDA	ARDAT0
		AND	COFFMASK, Y
		STA	ARDAT0		;mask
		
		LDA	ARDAT1
		TAY
		LDA	PALTBL, Y
		AND	ARDAT0
		STA	ARDAT1		;color

		LDA	ARDAT0
		EOR	#$FF
		STA	ARDAT0


		LDA	HORZBUFFER+2	;y. pos.
		ASL	A
		ASL	A
		AND	#$F0
		STA	ARDAT2		;(y div 4) * 16

		TXA			;offset in buffer
		SEC
		SBC	#3		;kill header space
		CLC
		ADC	HORZBUFFER+1	;x. pos. (base)
		CMP	#64
		BCC	RXP0
		SBC	#64
RXP0:		LSR	A
		LSR	A
		CLC

		ADC	ARDAT2
		STA	ARDAT2		;index into PALGRID
			      
		TAY
		LDA	PALGRID, Y
		AND	ARDAT0
		ORA	ARDAT1	
		STA	PALGRID, Y
		
		LDY	PALINDEX
		STA	HPALBUFFER, Y


		INC	PALOFFSET
		LDA	PALOFFSET
		CMP	#4
		BNE	RXPALX

		LDA	#0
		STA	PALOFFSET

		TYA
		CLC
		ADC	#3
		STA	PALINDEX

RXPALX:
		PLA
		TAX
		PLA
		TAY

		LDA	ARDAT4

		RTS



VPALINIT:
	  	LDA	COUNT0
	  	PHA

		LDA	#$02
		STA	PALINDEX

		LDA	#$00
		STA	PALSHIFT

		LDA	YBLOCK
		AND	#$03
		STA	PALOFFSET

		TXA
		ROR	A
		ROR	A
		ROL	PALSHIFT

		LDA	#$23
		CPX	#32
		BCC	VPAL2
		LDA	#$27
VPAL2:		STA	VPALBUFFER+0

		TXA
		AND	#$1F
		LSR	A
		LSR	A		;div. by 4
		STA	COUNT0
		TYA
		LSR	A
		LSR	A
		ASL	A
		ASL	A
		ASL	A		;(div. by 4) * 8
		CLC
		ADC	#$C0
		ADC	COUNT0

		STA	VPALBUFFER+1
		JSR	V2CHK
		STA	VPALBUFFER+3
		JSR	V2CHK
		STA	VPALBUFFER+5
		JSR	V2CHK
		STA	VPALBUFFER+7
		JSR	V2CHK
		STA	VPALBUFFER+9
		JSR	V2CHK
		STA	VPALBUFFER+11
		JSR	V2CHK
		STA	VPALBUFFER+13
		JSR	V2CHK
		STA	VPALBUFFER+15

		LDA	#0
		STA	VPALBUFFER+2
		STA	VPALBUFFER+4
		STA	VPALBUFFER+6
		STA	VPALBUFFER+8
		STA	VPALBUFFER+10
		STA	VPALBUFFER+12
		STA	VPALBUFFER+14
		STA	VPALBUFFER+16

	    	PLA
	    	STA	COUNT0

		RTS

V2CHK:		CLC
		ADC	#$08
		BCC	V2OK
		CLC
		ADC	#$C0
V2OK:		RTS




CXPAL:		
		STA	ARDAT4	;temp.
		TYA
		PHA
		TXA
		PHA


		LDA	ARDAT4
		JSR	GETPAL
		STA	ARDAT1

		LDY	PALSHIFT
		LDA	COFFMASK, Y
		STA	ARDAT0
		LDA	PALOFFSET
		LSR	A
		TAY
		LDA	ARDAT0
		AND	ROFFMASK, Y
		STA	ARDAT0		;mask
		
		LDA	ARDAT1
		TAY
		LDA	PALTBL, Y
		AND	ARDAT0
		STA	ARDAT1		;color

		LDA	ARDAT0
		EOR	#$FF
		STA	ARDAT0


		LDA	VERTBUFFER+1	;x pos.
		LSR	A
		LSR	A
		STA	ARDAT2

		TXA
		SEC
		SBC	#3
		CLC
		ADC	VERTBUFFER+2	;y pos.
		CMP	#30
		BCC	CXP0
		SBC	#30
CXP0:		ASL	A
		ASL	A
		AND	#$F0 		;(y div 4) * 16
		CLC
		ADC	ARDAT2
		STA	ARDAT2		;index to PALGRID

		TAY
		LDA	PALGRID, Y
		AND	ARDAT0
		ORA	ARDAT1	
		STA	PALGRID, Y
		
		LDY	PALINDEX
		STA	VPALBUFFER, Y


		PLA
		TAX

		SEC
		SBC	#3
		CLC
		ADC	VERTBUFFER+2
		CMP	#29
		BEQ	CXPALX0

		INC	PALOFFSET
		LDA	PALOFFSET
		CMP	#4
		BNE	CXPALX1


CXPALX0:	LDA	#0
		STA	PALOFFSET

		TYA			;PALINDEX
		CLC
		ADC	#2
		STA	PALINDEX


CXPALX1: 	PLA
		TAY

		LDA	ARDAT4

		RTS



ROFFMASK:	.byte	 $0F,  $F0
COFFMASK:	.byte	 $33,  $CC

PALTBL:		.byte	 $00,  $55,  $AA,  $FF


GETPAL:



;acc = char./index #
;returns pal. # in accumulator

		PHA		

		LDA	BKGRND
		BEQ	GETPAL3
		BPL	GETPAL2


;******************************
;  planet
;******************************

		PLA
		BPL	GETPAL1
;bushes/dirt
		LDA	#$00
		RTS

;space station/turret

GETPAL1:	LDA	#$01
		RTS


;******************************
;  space station
;******************************

GETPAL2:	PLA

		CMP	#$60
		BCC	GETPAL2A
		CMP	#$6C
		BCS	GETPAL2A

	 	LDA	#$03		;blinking...
		RTS
		
GETPAL2A:	LDA	#$00
		RTS

;******************************
;  space
;******************************

GETPAL3:	PLA

		LDA	OBJINDEX
		BEQ	GETPAL3E	;stars

		TAY
		LDA	SYSTEM+2, Y	;type/pal.

		AND	#$70
		LSR	A
		LSR	A
		LSR	A
		LSR	A		;shift pal. to low nybble
		RTS
		
GETPAL3E:	LDA	#0
		RTS


;****************************

RXFER:

;TX, TY	= starting pos. in solar system
;YREL	= offset/line (0..7)
;X, Y   = starting pos. on screen

		LDA	#40		;no. of bytes
		STA	HORZBUFFER
		STX	HORZBUFFER+1
		STY	HORZBUFFER+2

	JSR	HPALINIT

		LDA	#5		;no. of blocks
		STA	COUNT0

		LDX	#3

ROWX0:	        TXA
	        PHA
        JSR	FINDOBJECT

		LDA	FLIP
		CMP	#$01
		BNE	ROWX0A
		JMP	RXF01
ROWX0A:		CMP	#$02
		BNE	ROWX0B
		JMP	RXF02
ROWX0B:		CMP	#$03
		BNE	RXF00
		JMP	RXF03

;****** NORMAL ***************************************

RXF00:	        PLA
	        TAX
	        LDY 	YREL
		LDA	XROFFTBL, Y
		TAY

		LDA	#8
		STA	COUNT1		;no. of bytes per block

RXF00A:		LDA	(OBJPTRL), Y
		JSR	BKROWTURRET
	 	JSR	RXPAL
			

RXF00B:		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	RXF00C
		LDA	FLIP
		BMI	RXF00C
		PLA
		TAY
		LDA	XLAT0, Y
		PHA
	
RXF00C:		PLA
		STA	HORZBUFFER, X
		INX

		LDY	PHASE0
		INY
		DEC	COUNT1
		BNE	RXF00A
		INC	TX
		DEC	COUNT0
		BNE	ROWX0
		RTS


;****** UPSIDE-DOWN **********************************

RXF01:	        PLA
	        TAX
		LDA	#$07
		SEC
		SBC	YREL
		TAY
		LDA	XROFFTBL, Y
		TAY
		LDA	#8
		STA	COUNT1		;no. of bytes per block
RXF01A:		LDA	(OBJPTRL), Y
		JSR	BKROWTURRET
		JSR	RXPAL


RXF01B:		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	RXF01C
		LDA	FLIP
		BMI	RXF01C
		PLA
		TAY
		LDA	XLAT1, Y
		PHA

RXF01C:		PLA
		STA	HORZBUFFER, X
		INX

		LDY	PHASE0
		INY
		DEC	COUNT1
		BNE	RXF01A
		INC	TX
		DEC	COUNT0
		BEQ	RXF01D
		JMP	ROWX0
RXF01D:		RTS

;****** LEFT-RIGHT ***********************************

RXF02:	        PLA
	        TAX
	        LDY 	YREL
		LDA	XROFFTBL, Y
		CLC
		ADC	#$07
		TAY
		LDA	#8
		STA	COUNT1		;no. of bytes per block

RXF02A:		LDA	(OBJPTRL), Y
		JSR	BKROWTURRET
		JSR	RXPAL


RXF02B:		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	RXF02C
		LDA	FLIP
		BMI	RXF02C
		PLA
		TAY
		LDA	XLAT2, Y
		PHA

RXF02C:		PLA
		STA	HORZBUFFER, X
		INX

		LDY	PHASE0
		DEY
		DEC	COUNT1
		BNE	RXF02A
		INC	TX
		DEC	COUNT0
		BEQ	RXF02D
		JMP	ROWX0
RXF02D:		RTS

;****** BOTH *****************************************

RXF03:	        PLA
	        TAX
		LDA	#$07
		SEC
		SBC	YREL
		TAY
		LDA	XROFFTBL, Y
		CLC
		ADC	#$07
		TAY
		LDA	#8
		STA	COUNT1		;no. of bytes per block
RXF03A:		LDA	(OBJPTRL), Y
		JSR	BKROWTURRET
		JSR	RXPAL


RXF03B:		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	RXF03C
		LDA	FLIP
		BMI	RXF03C
		PLA
		TAY
		LDA	XLAT3, Y
		PHA
RXF03C:		PLA
		STA	HORZBUFFER, X
		INX

		LDY	PHASE0
		DEY
		DEC	COUNT1
		BNE	RXF03A
		INC	TX
		DEC	COUNT0
		BEQ	RXF03D
		JMP	ROWX0
RXF03D:		RTS

;***************		

CXFER:

;TX, TY	= starting pos. in system
;XREL	= col. # offset (0..7)
;YREL   = (INITIAL) row offset     (destroyed!!)
;X, Y	= pos. on screen


		LDA	#30
		STA	COUNT0		;byte count
		STA	VERTBUFFER
		STX	VERTBUFFER+1
		STY	VERTBUFFER+2
	
	JSR	VPALINIT

		LDX	#3


CXF:		TXA
		PHA
		TYA
		PHA
	JSR	FINDOBJECT

		PLA
		TAY
		PLA
		TAX

		LDA	FLIP
		CMP	#$01
		BNE	CXFA
		JMP	CXF01A
CXFA:		CMP	#$02
		BNE	CXFB
		JMP	CXF02A
CXFB:		CMP	#$03
		BNE	CXF00A
		JMP	CXF03A

;********* NORMAL ********************************

CXF00A:		
		LDY	YREL
		LDA	XREL
		CLC
		ADC	XROFFTBL, Y
		TAY

CXF00B:		LDA	(OBJPTRL), Y
		JSR	BKCOLTURRET
		JSR	CXPAL


CXF00C:
		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	CXF00D
		LDA	FLIP
		BMI	CXF00D
		PLA
		TAY
		LDA	XLAT0, Y
		PHA

CXF00D:	   	PLA
		
		STA	VERTBUFFER, X
		INX

		LDY	PHASE0
		DEC	COUNT0
		BEQ	CXF00E
		TYA
		CLC
		ADC	#8
		TAY
		INC	YREL
		LDA	YREL
		CMP	#8
		BCC	CXF00B

		INC	TY
		LDA	#0
		STA	YREL
		JMP	CXF		;always!

CXF00E:		RTS

;********* UPSIDE-DOWN ***************************

CXF01A:		LDA	#7
		SEC
		SBC	YREL
		TAY    
		LDA	XREL
		CLC
		ADC	XROFFTBL, Y
		TAY

CXF01B:		LDA	(OBJPTRL), Y
		JSR	BKCOLTURRET
		JSR	CXPAL


CXF01C:
		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	CXF01D
		LDA	FLIP
		BMI	CXF01D
		PLA
		TAY
		LDA	XLAT1, Y
		PHA

CXF01D:		PLA
		
		STA	VERTBUFFER, X
		INX

		LDY	PHASE0
		DEC	COUNT0
		BEQ	CXF01E
		TYA
		SEC
		SBC	#8
		TAY
		INC	YREL
		LDA	YREL
		CMP	#8
		BCC	CXF01B

		INC	TY
		LDA	#0
		STA	YREL
		JMP	CXF		;always!

CXF01E:		RTS

;********* LEFT-RIGHT ****************************

CXF02A:		
		LDY	YREL
		LDA	#$07
		SEC
		SBC	XREL
		CLC
		ADC	XROFFTBL, Y
		TAY

CXF02B:		LDA	(OBJPTRL), Y
		JSR	BKCOLTURRET
		JSR	CXPAL


CXF02C:
		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	CXF02D
		LDA	FLIP
		BMI	CXF02D
		PLA
		TAY
		LDA	XLAT2, Y
		PHA
	
CXF02D:		PLA
		
		STA	VERTBUFFER, X
		INX

		LDY	PHASE0
		DEC	COUNT0
		BEQ	CXF02E
		TYA
		CLC
		ADC	#8
		TAY
		INC	YREL
		LDA	YREL
		CMP	#8
		BCC	CXF02B

		INC	TY
		LDA	#0
		STA	YREL
		JMP	CXF		;always!

CXF02E:		RTS

;********* BOTH **********************************

CXF03A:		LDA	#$07
		SEC
		SBC	YREL
		TAY
		LDA	#$07
		SEC
		SBC	XREL
		CLC
		ADC	XROFFTBL, Y
		TAY

CXF03B:		LDA	(OBJPTRL), Y
		JSR	BKCOLTURRET
		JSR	CXPAL


CXF03C:
		STY	PHASE0
		PHA
		LDA	BKGRND
		BEQ	CXF03D
		LDA	FLIP
		BMI	CXF03D
		PLA
		TAY
		LDA	XLAT3, Y
		PHA

CXF03D:		PLA
		
		STA	VERTBUFFER, X
		INX

		LDY	PHASE0
		DEC	COUNT0
		BEQ	CXF03E
		TYA
		SEC
		SBC	#8
		TAY
		INC	YREL
		LDA	YREL
		CMP	#8
		BCC	CXF03B

		INC	TY
		LDA	#0
		STA	YREL
		JMP	CXF		;always!

CXF03E:		RTS
	   



XROFFTBL:	.byte	0, 8, 16, 24, 32, 40, 48, 56, 64



;*** NEW ***

SET_GUN:

;PHASE1 = turret #

		TXA
		PHA
		TYA
		PHA

		LDA	PHASE1
		CMP	TWR_MAX
		BCS	SG_NO
		STA	LOGIC_TEMP
		TAY
		LDA	GUN_STAT,Y
		AND	#$80
		BEQ	SG_NO
		LDX	#3
		JSR	GUN_CHK
		BEQ	SG_NO
		LDX	#3
		JSR	GUN_SPC
		BEQ	SG_NO
		LDY	LOGIC_TEMP
		STY	TURRET_1,X

		LDA	SPRXH
		STA	GUN_XH,Y
		LDA	SPRXL
		STA	GUN_XL,Y
		LDA	SPRYH
		STA	GUN_YH,Y
		LDA	SPRYL
		STA	GUN_YL,Y
	
		LDA	GUN_STAT,Y
		ORA	#$40
		STA	GUN_STAT,Y
		LDA	#0
		STA	GUN_PHASE,Y
SG_NO:
		PLA
		TAY
		PLA
		TAX

		RTS


GUN_SPC:
		LDA	TURRET_1,X
		BMI	GS_DONE
		DEX
		BPL	GUN_SPC
		LDA	#0
		RTS
GS_DONE:
		LDA	#1
		RTS

GUN_CHK:
		LDA	TURRET_1,X
		CMP	LOGIC_TEMP
		BEQ	GC_NO
		DEX
		BPL	GUN_CHK
		LDA	#1
		RTS
GC_NO:
		LDA	#0
		RTS

;**********************************

SETSTN:		PHA
		TYA
		PHA
		TXA
		PHA

		LDY	#1
		LDX	#-1

SETSTN1:	LDA	SYSTEM+2, Y	;type/pal.
		AND	#$70
		BEQ	SETSTN1A	;space stn?
		JMP	SETSTNX

SETSTN1A:	INX
		LDA	SYSTEM+0, Y	;x-pos.
		CMP	TX
		BNE	SETSTN2
SETSTN0:
		LDA	SYSTEM+1, Y	;y-pos.
		CMP	TY
		BNE	SETSTN2

SETSTN1B:

;found
		LDA	STN_STAT, X
		BNE	SETSTN1C
		JMP	SETSTNX
SETSTN1C:
		STX	LOGIC_TEMP
		LDX	#1
		JSR	GUN_CHK
		BNE	SETSTN1D
		JMP	SETSTNX
SETSTN1D:
		LDX	#1
		JSR	GUN_SPC
		BNE	SETSTN1E
		JMP	SETSTNX
SETSTN1E:
		LDA	LOGIC_TEMP
		STA	TURRET_1,X
		TAX
	
		LDA	STN_STAT, X
		ORA	#$40		;ON SCREEN
		STA	STN_STAT, X

		LDA	SPRXH
		STA	STN_XH, X
		LDA	SPRXL
		STA	STN_XL, X
		LDA	SPRYH
		STA	STN_YH, X
		LDA	SPRYL
		STA	STN_YL, X

		JMP	SETSTNX

SETSTN2:	TYA
		CLC
		ADC	#4
		TAY
		CPX	#8
		BCS	SETSTNX
		JMP	SETSTN1

SETSTNX:	PLA
		TAX
		PLA
		TAY	      
		PLA
		
		RTS	;Error!

;**********************************


SETROWPOS:
		TXA
		CMP	XREL
		BCS	SETROW0

		LDA	#$00	;0 = NO GUN/STATION!
		RTS	

SETROW0:
		SEC
		SBC	XREL
		CLC
		ASL	A
		CLC
		ADC	#$5A
		STA	SPRXH
		LDA	#0
		STA	SPRXL

		LDA	YMOVE
		BEQ	SETRP2
		BMI	SETRP

		LDA	#$99	;9B
		STA	SPRYH
		LDA	#$00
		STA	SPRYL
		JMP	SETCP_B

SETRP:		
		LDA	#$5F
		STA	SPRYH
		LDA	#$00
		STA	SPRYL
		JMP	SETCP_B


SETRP2:		LDA	HORZBUFFER+2
		CLC
		ASL	A
		ASL	A
		ASL	A
		PHA
		LDA	#0
		STA	SPRYL
		PLA
		ROR	A
		ROR	SPRYL
		ROR	A
		ROR	SPRYL
		CLC
		ADC	#$5F
		STA	SPRYH
		LDA	VEL_X
		BEQ	SETRP2A
		DEC	SPRYH
		DEC	SPRYH
		
SETRP2A:
		LDA	#$01		;1 = OK!
		JMP	COLROWADJ
		
			
;**********************************

SETCOLPOS:	TXA
		CLC
		ASL	A
		CLC
		ADC	#$59
		STA	SPRYH
		LDA	#0
		STA	SPRYL

		LDA	XMOVE
		BMI	SETCP1

		LDA	#$A0	;9E
		STA	SPRXH
		LDA	#$00
		STA	SPRXL
		LDA	XMOVE
		JMP	SETCP_A

SETCP1:		LDA	#$5F	;5F
		STA	SPRXH
		LDA	#$00
		STA	SPRXL
		LDA	XMOVE
		JSR	ABSVAL
		LDA	#4
		SEC	
		SBC	ABS
SETCP_A:
		CLC
		ROR	A
		ROR	SPRXL
		ROR	A
		ROR	SPRXL
		CLC
		ADC	SPRXH
		STA	SPRXH

SETCP_B:	
		LDA	YMOVE
		BPL	SETCP2
		JSR	ABSVAL
		DEC	SPRYH
		LDA	#4
		SEC
		SBC	ABS
SETCP2:
		CLC
		ROR	A
		ROR	SPRYL
		ROR	A
		ROR	SPRYL
		CLC
		ADC	SPRYH
		STA	SPRYH

		LDA	#$01	;1 = OK!


COLROWADJ:	PHA		;save return code!
		LDA	COUNT0
		PHA
		LDA	COUNT1
		PHA

	
		LDA	#0
		STA	COUNT0
		LDA	XBOFF
		CLC
		ROR	A
		ROR	COUNT0
		ROR	A
		ROR	COUNT0
		STA	COUNT1
		LDA	SPRXL
		SEC
		SBC	COUNT0
		STA	SPRXL
		BCS	CRA_0
		INC	COUNT1
CRA_0:
		LDA	SPRXH
		SEC
		SBC	COUNT1
		STA	SPRXH

		LDA	#0
		STA	COUNT0
		LDA	YBOFF
		CLC
		ROR	A
		ROR	COUNT0
		ROR	A
		ROR	COUNT0
		STA	COUNT1
		LDA	SPRYL
		SEC
		SBC	COUNT0
		STA	SPRYL
		BCS	CRA_1
		INC	COUNT1
CRA_1:
		LDA	SPRYH
		SEC
		SBC	COUNT1
		CLC
		ADC	#1
		STA	SPRYH

		PLA
		STA	COUNT1
		PLA
		STA	COUNT0

		PLA			;return code!
		RTS

;****************************************

BKROWTURRET:

		PHA	
		LDA	BKGRND
		BNE	BKROW2

		PLA
		CMP	#$00
		BEQ	BKROW1
		RTS

BKROW1:		PHA
		JSR	SETROWPOS
		CMP	#$00		;station "center"
		BEQ	BKROW1A
		JSR	SETSTN		;enable space station
BKROW1A:	PLA
		RTS

BKROW2:		PLA
		CMP	#$25		;turret "center"
		BEQ	BKROW3
		RTS

BKROW3:		PHA
		JSR	SETROWPOS
		CMP	#$00
		BEQ	BKROW3A
		JSR	GETGUNINDEX
		JSR	SET_GUN
BKROW3A:	PLA
		RTS



BKCOLTURRET:

		PHA
		LDA	BKGRND
		BNE	BKCOL2
		
		PLA
		CMP	#$00		;space station "center"
		BEQ	BKCOL1
		RTS

BKCOL1:		PHA
		JSR	SETCOLPOS
		JSR	SETSTN		;enable space station
		PLA
		RTS

BKCOL2:		PLA
		CMP	#$25		;turret "center"
		BEQ	BKCOL3
		RTS

BKCOL3:		PHA
		JSR	SETCOLPOS
		JSR	GETGUNINDEX
		LDA	PHASE1
		JSR	SET_GUN
		PLA
		RTS


;***************************************

ABSVAL:		STA	ABS
		BPL	ABSVAL1
		LDA	#0
		SEC
		SBC	ABS
		STA	ABS
ABSVAL1:	RTS

;***************************************

GETGUNINDEX:

;
;(TX, TY) = current block
;returns with index in PHASE1
;

		PHA
		TYA
		PHA


		LDA	BKGRND
		BMI	GGISET1
;space station
		LDA	#<(STN_GUNS)
		STA	PTR3L
		LDA	#>(STN_GUNS)
		STA	PTR3H
		JMP	GGISET3

GGISET1:	CMP	#$80
		BEQ	GGISET2
;planet surface
		LDA	#<(P1_GUNS)
		STA	PTR3L
		LDA	#>(P1_GUNS)
		STA	PTR3H
		JMP	GGISET3

GGISET2:	;P'radikus

		LDA	#<(PRAD_GUN)
		STA	PTR3L
		LDA	#>(PRAD_GUN)
		STA	PTR3H

GGISET3:	LDY	#0

GGI0:		LDA	(PTR3L), Y
		CMP	TX
		BNE	GGI1

		INY
		LDA	(PTR3L), Y
		CMP	TY
		BNE	GGI2
	
		TYA
		CLC
		LSR	A	;divide by 2
		STA	PHASE1


		PLA
		TAY
		PLA

		RTS

GGI1:		INY
GGI2:		INY
		TYA
		CLC
		LSR	A
		CMP	TWR_MAX
		BCC	GGI0
	
		LDA	#$FF
		STA	PHASE1

GGI3:		PLA
		TAY
		PLA

		RTS
	
;*******************************


GETBLOCK: 	;block num in X-reg.
 		

		LDA	BKGRND
		BMI	GETBLK0
		
		LDA	SSOBJL, X
		STA	OBJPTRL
		LDA	SSOBJH, X
		STA	OBJPTRH
		RTS

GETBLK0:	;planet surface

		LDA	PPOBJL, X
		STA	OBJPTRL
		LDA	PPOBJH, X
		STA	OBJPTRH
		RTS


OBJ_NIL:

;set up OBJPTR for a "random" star field

		LDA	TIMER0
		AND	#$03
		CLC
		ADC	#>(STARS)
		STA	OBJPTRH

		JSR	RANDOM
		AND	#$BF		;10111111 (so obj. doesn't cross page)
		CLC
		ADC	#<(STARS)
		STA	OBJPTRL

		LDA	OBJPTRH
		ADC	#0
		STA	OBJPTRH

		RTS




GETOBJPTR:

;based on solar system data item pointed to by
;'x pos.' byte set up OBJPTR to draw obj.

		LDA 	SYSTEM+2, Y	;type/pal.
		AND	#$70
		BEQ	GET_SPSTAT	;space stn?
GET_SUN:
GET_PLANET:
		LDA	SYSTEM+2, Y	;get size (2-6) in lo. nyb.
		AND	#$0F
		TAY
		LDA	OBJ_PL, Y
		STA	OBJPTRL
		LDA	OBJ_PH, Y
		STA 	OBJPTRH
		RTS

GET_SPSTAT:	LDA	SYSTEM+3, Y	;get data
		AND	#INHAB
		BEQ	GET_SP0

GET_SP2:
		LDA	#<(ST_BLK)
		STA	OBJPTRL
		LDA	#>(ST_BLK)
		STA	OBJPTRH
		RTS

GET_SP0:	JMP	OBJ_NIL		;no station


;************************************





VR_WAIT:			;wait for vertical retrace
	LDA	Vid_Reset
	BPL	VR_WAIT
	RTS

KILL_VID:	
	LDA	#6
	STA	VID_MODE
	RTS

SET_VID:
	LDA	V_SEL
	STA	VID_SEL
	LDA	V_MODE
	STA	VID_MODE
		   
	LDA	Vid_Reset
	LDA	XSCROLL
	STA	SCR_REG
	LDA	YSCROLL
	STA	SCR_REG
	RTS


;************************************************
;
; MISC. SOUND
;
;************************************************

BEEP1:	LDA	#$1F
	JMP	BEEPA

BEEP2:	LDA	#$0F
	;-------------fall through to BEEPA

;THIS ROUTINE WILL PRODUCE A DIFFERENT BEEP FOR EACH VALUE IN A.  IT SAVES
;ALL REGISTERS.

BEEPA:
	STA	BEEPREG
	PHA
	TXA
	PHA
	TYA
	PHA

	LDA	#1
	STA	 $4015
	LDA	BEEPREG
	LDY	#0
	ASL	A
	TAX
	TYA
	ROL	A
	TAY
	TXA
	ASL	A
	TAX
	TYA
	ROL	A
	STX	 $4002
	STA	 $4003	
	PLA
	TAY
	PLA
	TAX
	PLA
	RTS

;************************************************



;read joystick 1 -- returns w/ X=new joystick val.,
;		    A=undefined, Y is unchanged...
;04/26/89

JSTICK1:	LDA	#1
		STA	Jport1
		LDA	#0
		STA	Jport1		;latch joystick

		LDX	#8
JS1A:		PHA			;save current status byte
		LDA	Jport1
		ROR	A		;rotate bit into carry
		PLA
		ROL	A		;rotate carry into status byte
		DEX
		BNE	JS1A		;read all 8 "buttons"
	
		TAX			;save new val.
		EOR	J1VAL
		STA	J1CHG
		TXA
		STA	J1VAL
		AND	J1CHG		;find what buttons were just pressed
		STA	J1CHG

		BEQ	JS1B		;no buttons were just pressed
		LDA	TIMER0
		ADC	J1VAL
		STA	RAND		;player just selected new seed

JS1B:		
		LDA	J1CHG
		AND	#SELECT
		BNE	JS1C
		LDA	J1CHG
		AND	#B_BTN
		BNE	JS1C
		LDA	J1CHG
		AND	#A_BTN
		BNE	JS1D
		RTS

JS1C:		JMP	BEEP2
JS1D:		JMP	BEEP1






RANDOM:	LDA	RAND
	ADC	TIMER0
	ADC	#$EA
	STA	RAND
	RTS



BIGDELAY:
		TYA
		PHA
		LDY	#0

BDELAY:		LDX	#0
BDELAY0: 	DEX
		BNE	BDELAY0
		DEY
		BNE	BDELAY

		PLA
		TAY
		DEY
		BNE	BIGDELAY
		RTS


ZAP_SPRITES:

;
;Y-reg = starting index

	LDA	#$F8
ZAP_S0:	STA	SPRTBL0, Y
	STA	SPRTBL1, Y
	INY
	BNE	ZAP_S0
	RTS



DMAXFER:	
	LDA	Vid_Reset
	LDA	#0
	STA	SPR_PTR
	STA	SPR_PTR
	INC	COMPTIME
	BNE	DMAXF0
	INC	OBJINDEX

DMAXF0:
	LDA	COMPTIME

	ROR	A
	BCC	DMAXF1

	LDA	#>(SPRTBL1)
	STA	DMA
	JMP	DMAXF2

DMAXF1:	LDA	#>(SPRTBL0)
	STA	DMA

DMAXF2:	LDA	COMPTIME
	AND	#$1E		;was  $0F w/no LSR
	LSR	A
	TAY
	LDA	FLSHCOL2, Y	;player ship pos. indicator
	STA	SPALREGS+9
	STA	SPALREGS+11
	LDA	FLASHCOL, Y	;cursor, gun pos. indicator
	STA	SPALREGS+14
	JSR	SPALXFER

	
	LDA	XSCROLL
	STA	SCR_REG
	LDA	YSCROLL
	STA	SCR_REG

	RTS

FLASHCOL:	.byte	 $0E, $06, $06, $06, $16, $16, $16
	.byte	 $26, $26, $26, $26, $26, $26, $26

FLSHCOL2:	.byte	 $14, $14, $24, $24, $24, $24, $24
	.byte	 $0E, $04, $04, $04, $04, $14, $14





SPALXFER:	LDA	Vid_Reset
		LDA	#$3F
		STA	VID_PTR
		LDA	#$11
		STA	VID_PTR
	
		LDY	#1
SPALX0:		LDA	SPALREGS, Y
		STA	VID_DATA
		INY
		CPY	#$10
		BNE	SPALX0
		RTS


;**********************************************************

GETORBIT:	

;returns index (into "SYSTEM") of object that
;player is currently "orbiting"...
; 	(00 if none)

		LDA	BKGRND
		BEQ	GETORBX
		RTS			;keep old val. if not in space

GETORBX:	LDY	#1
		LDA	SYSTEM
		STA	T0

GETORB0:	LDA	SYSTEM+0, Y	;xpos
		CMP	XPOS
		BNE	GETORB1
		LDA	SYSTEM+1, Y	;ypos
		CMP	YPOS
		BNE	GETORB1

		TYA
		STA	ORBIT
		RTS

GETORB1:	TYA
		CLC
		ADC	#$04
		TAY
		DEC	T0
		BNE	GETORB0

		LDA	#$00
		STA	ORBIT
		RTS
		
;*************************************


;************************************************
;	COMPUTER DISPLAY MODE
;************************************************

TESTCOMP:	LDA	#$1E
		STA	V_MODE
	
		JSR	VR_WAIT
		JSR	SET_VID
		JSR	DMAXFER
	
		JSR	DISPCOMP

TESTC0:		LDA	BKGRND
		BNE	TESTC1
;in space
		LDA	WARP
		BEQ	TESTC0B
		BPL	TESTC0A		;enemy base destroyed!

		LDA	GALAXY_X
		STA	CX
		LDA	GALAXY_Y
		STA	CY
		JSR	GETSECTOR

		LDA	SECTOR_X
		STA	CX
		LDA	SECTOR_Y
		STA	CY
		LDA	#0
		STA	WARP
		JSR	NEWSYSTEM	;BECAUSE TURRETS OCCUPY SYSTEM SPACE
		JMP	TESTC0B

TESTC0A:	LDA	#0
		STA	WARP
		JSR	LOADSYSTEM	;BECAUSE TURRETS OCCUPY SYSTEM SPACE
		LDY	ORBIT
		LDA	SYSTEM+0,Y	;xpos
		STA	DEST_X
		LDA	SYSTEM+1,Y	;ypos
		STA	DEST_Y

		LDA	SAVE_X
		STA	XPOS
		LDA	SAVE_Y
		STA	YPOS

	JSR	CW_1
	JSR	CW_2
	JSR	CW_3
	JSR	STAR_W2
	JSR	SCAN	
		LDA	#0
		JMP	TESTCX

TESTC0B:	JSR	GETORBIT
		LDA	ORBIT
		BEQ	TESTC2
;orbiting
TESTC1A:
		JSR	COMP_05
		JMP	TESTCX

; planet/space station

TESTC1:		JSR	C05_D
		JMP	TESTCX

;normal space

TESTC2:		JSR	CW_2
		JSR	CW_3
		JSR	STAR_W2
		JSR	DRSYSMAP
		JSR	SYS_POS
		LDA	#1

TESTCX:		PHA
		LDA	COMPITEM	;Non-zero if base is destroyed...

		BEQ	TESTCX0
		JSR	PROCITEM

	LDY	#1
	STY	CRSR_I		;START IT AT THE FIRST ENTRY IN THE SYSTEM
	JSR	SKIPDEAD
	LDA	SYSTEM+0,Y	;Y points to x pos. byte
	STA	CURSORX
	LDA	SYSTEM+1,Y	;y pos.
	STA	CURSORY
  ;;	LDA	#0
  ;;	STA	ORBIT

		JSR	LV_ORB
TESTCX0:
		PLA
		BMI	TESTCX1
		JSR	COMP_00

TESTCX1:	JSR	VR_WAIT
		JSR	KILL_VID

		LDA	#$00
		STA	J1CHG

		RTS
		
	



        
;*******************************************
;	COMPUTER DISPLAY ROUTINES
;*******************************************

NUMTAB:		.byte	 $F0,  $F1,  $F2,  $F3,  $F4
		.byte	 $F5,  $F6,  $F7,  $F8,  $F9


WPNCHR:		.byte	 $BC	;cloaking device
		.byte	 $D0	;mines
		.byte	 $EA	;missiles
		.byte	 $BB	;emp wave
		.byte	 $5E	;thunderbolt
		.byte	 $B0


W1AB0:		.byte	0, 0, " CANNON ", -1
W1AB1:		.byte	0, 0, "A-CANNON", -1
W1AB2:		.byte	0, 0, "L. LASER", -1
W1AB3:		.byte	0, 0, "H. LASER", -1

W2AB0:		.byte	0, 0, " NO WPN ", -1
W2AB1:		.byte	0, 0, "CLOAK DV", -1
W2AB2:		.byte	0, 0, "  MINE  ", -1
W2AB3:		.byte	0, 0, "MISSILES", -1
W2AB4:		.byte	0, 0, "EMP WAVE", -1
W2AB5:		.byte	0, 0, " T-BOLT ", -1



W1SNL:		.byte	W2AB0 & $FF, W1AB0 & $FF 
		.byte	W1AB1 & $FF, W1AB2 & $FF, W1AB3 & $FF 
W1SNH:		.byte	W2AB0 >>8,   W1AB0 >>8
		.byte	W1AB1 >>8,   W1AB2 >>8,   W1AB3 >>8

W2SNL:		.byte	W2AB0 & $FF, W2AB1 & $FF, W2AB2 & $FF
		.byte	W2AB3 & $FF, W2AB4 & $FF, W2AB5 & $FF
W2SNH:		.byte	W2AB0 >>8,   W2AB1 >>8,   W2AB2 >>8
		.byte	W2AB3 >>8,   W2AB4 >>8,   W2AB5 >>8


SPRNUM:		

; ACC = number/value
;
; returns with Y = 10's, X = 1's digits
;

		LDY	#0
SPRNUM0:	CMP	#10
		BCC	SPRNUM1
		SEC
		SBC	#10
		INY
		JMP	SPRNUM0
SPRNUM1:	TAX
		LDA	NUMTAB, Y
		PHA
		TXA
		TAY
		LDA	NUMTAB, Y
		TAX
		PLA
		TAY
		RTS	


DISPCOMP:	LDA	#$19 	;STATUS INDICATOR
		STA	SPRTBL0+ $08
		STA	SPRTBL0+ $0C
		STA	SPRTBL0+ $10
		STA	SPRTBL0+ $14
		LDA	#$D9
		STA	SPRTBL0+ $09
		STA	SPRTBL0+ $15
		LDA	#$FB
		STA	SPRTBL0+ $0D
		STA	SPRTBL0+ $11

		LDA	STATUS
		BMI	DC_CRIT
		LDA	#$02
		JMP	DC_STATUS

DC_CRIT:	LDA	#$03

DC_STATUS:	STA	SPRTBL0+ $0A	;palette
		STA	SPRTBL0+ $0E
		STA	SPRTBL0+ $12
		STA	SPRTBL0+ $16
		LDA	#$3E
		STA	SPRTBL0+ $0B
		LDA	#$44
		STA	SPRTBL0+ $0F
		LDA	#$4A
		STA	SPRTBL0+ $13
		LDA	#$50
		STA	SPRTBL0+ $17


		LDA	#$29	;SCORE
		STA	SPRTBL0+ $04
		STA	SPRTBL0+ $18
		STA	SPRTBL0+ $1C
		STA	SPRTBL0+ $20
		STA	SPRTBL0+ $24
		STA	SPRTBL0+ $28
		STA	SPRTBL0+ $2C
		LDY	SC1M
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $05
		LDY	SC100000
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $19
		LDY	SC10000
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $1D
		LDY	SC1000
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $21
		LDY	SC100
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $25
		LDY	SC10
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $29
		LDY	SC1
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $2D
		LDA	#$00
		STA	SPRTBL0+ $06
		STA	SPRTBL0+ $1A
		STA	SPRTBL0+ $1E
		STA	SPRTBL0+ $22
		STA	SPRTBL0+ $26
		STA	SPRTBL0+ $2A
		STA	SPRTBL0+ $2E
		LDA	#$1C
		STA	SPRTBL0+ $07
		LDA	#$24
		STA	SPRTBL0+ $1B
		LDA	#$2C
		STA	SPRTBL0+ $1F
		LDA	#$34
		STA	SPRTBL0+ $23
		LDA	#$3C
		STA	SPRTBL0+ $27
		LDA	#$44
		STA	SPRTBL0+ $2B
		LDA	#$4C
		STA	SPRTBL0+ $2F


		LDA	#$39	;FUEL/ARMOR/SHIELDS
		STA	SPRTBL0+ $30
		STA	SPRTBL0+ $34
		LDA	#$41
		STA	SPRTBL0+ $38
		STA	SPRTBL0+ $3C
		LDA	#$49
		STA	SPRTBL0+ $40
		STA	SPRTBL0+ $44
		LDA	FUEL
		JSR	SPRNUM
		STY	SPRTBL0+ $31
		STX	SPRTBL0+ $35
		LDA	ARMOR
		JSR	SPRNUM
		STY	SPRTBL0+ $39
		STX	SPRTBL0+ $3D
		LDA	SHIELD
		JSR	SPRNUM
		STY	SPRTBL0+ $41
		STX	SPRTBL0+ $45
		LDA	#$00
		STA	SPRTBL0+ $32
		STA	SPRTBL0+ $36
		STA	SPRTBL0+ $3A
		STA	SPRTBL0+ $3E
		STA	SPRTBL0+ $42
		STA	SPRTBL0+ $46
		LDA	#$48
		STA	SPRTBL0+ $33
		STA	SPRTBL0+ $3B
		STA	SPRTBL0+ $43
		LDA	#$50
		STA	SPRTBL0+ $37
		STA	SPRTBL0+ $3F
		STA	SPRTBL0+ $47

		
		LDA	#$59	;DRIVE/PWR-PL/SHIELD
		STA	SPRTBL0+ $48
		LDA	#$61
		STA	SPRTBL0+ $4C
		LDA	#$69
		STA	SPRTBL0+ $50
		LDY	DRIVE
		LDA 	NUMTAB, Y
		STA	SPRTBL0+ $49
		LDY	PWRPLANT
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $4D
		LDY	SHLDTYPE
		LDA	NUMTAB, Y
		STA	SPRTBL0+ $51
		LDA	#$00
		STA	SPRTBL0+ $4A
		STA	SPRTBL0+ $4E
		STA	SPRTBL0+ $52
		LDA	#$4F
		STA	SPRTBL0+ $4B
		STA	SPRTBL0+ $4F
		STA	SPRTBL0+ $53


		LDY	WPN1
		LDX	W1SNL, Y
		LDA	W1SNH, Y
		TAY
		LDA	#2
		STA	TX
		LDA	#15
		STA	TY
		JSR	XYPRINT

		LDA	WPN2
		BEQ	DISPC1
		SEC
		SBC	#CLOAK - 1	;CLOAK IS OFFSET 1 IN THE WPN2 NAME TABLE


DISPC1:
		TAY
		LDX	W2SNL, Y
		LDA	W2SNH, Y
		TAY
		LDA	#2
		STA	TX
		LDA	#17
		STA	TY
		JSR	XYPRINT

		LDA	WPN2
		BEQ	DISPC0
		LDA	#$99
		STA	SPRTBL0+ $54
		LDA	WPN2
		SEC
		SBC	#CLOAK
		TAY
		LDA	WPNCHR, Y
		STA	SPRTBL0+ $55
		LDA	#$03
		STA	SPRTBL0+ $56
		LDA	#$28
		STA	SPRTBL0+ $57

		LDA	#$99
		STA	SPRTBL0+ $58
		STA	SPRTBL0+ $5C
		LDA	#00
		STA	PTR0H
		LDA	WPN2
		STA	PTR0L
		LDY	#0
		LDA	(PTR0L), Y
		JSR	SPRNUM
		STY	SPRTBL0+ $59
		STX	SPRTBL0+ $5D
		LDA	#$00
		STA	SPRTBL0+ $5A
		STA	SPRTBL0+ $5E
		LDA	#$38
		STA	SPRTBL0+ $5B
		LDA	#$40
		STA	SPRTBL0+ $5F
		

DISPC0:		LDY	#$5F
DISPC0A:	LDA	SPRTBL0, Y
		STA	SPRTBL1, Y
		DEY
		BPL	DISPC0A

;******************

		JSR	VR_WAIT
		JSR	KILL_VID

DB_FUEL:	LDX	#$03
		LDY	#$06
		LDA	FUEL
		JSR	DB_BAR

DB_ARMOR:	LDX	#$03
		LDY	#$07
		LDA	ARMOR
		JSR	DB_BAR

DB_SHIELD:	LDX	#$03
		LDY	#$08
		LDA	SHIELD
		JSR	DB_BAR

		JSR	DMAXFER
		JSR	SET_VID
		
		RTS

;******************

DB_BAR:		PHA

		LDA	Vid_Reset
		STX	TX
		LDA	LNADDRH, Y
		STA	VID_PTR
		LDA	LNADDRL, Y
		CLC
		ADC	TX
		STA	VID_PTR

		LDY	#4
		PLA

DB_BAR1:	CMP	#25
		BCC	DB_BAR2
		DEY
		PHA
		LDA	#$95
		STA	VID_DATA
		PLA
		SEC
		SBC	#25
		JMP	DB_BAR1

DB_BAR2:	CPY	#0
		BEQ	DB_BAR5
		
		CLC
		LSR	A
		LSR	A
		STA	T0
		LSR	A
		LSR	A
		CLC
		ADC	T0	;1/4 + 1/16 = 1/3 (approx.)
		TAX
		LDA	BARTAB, X
		STA	VID_DATA
		DEY

DB_BAR3:	CPY	#0
		BEQ	DB_BAR5

		LDA	#$5C
DB_BAR4:	STA	VID_DATA
		DEY
		BNE	DB_BAR4

DB_BAR5:	RTS
		
BARTAB:		.byte	 $5C, $54, $55, $56, $74
		.byte	 $75, $76, $94, $95
	
;******************





CW_1:
	JSR	REMARROW
	LDA	#$13
	STA	CY
	LDA	#$01	
	STA	CX
	LDY	#6
	LDX	#8
	JMP	DRAWWIND

CW_2:
		LDA	#$01
		STA	CY
		LDA	#$0B
		STA	CX
		LDY	#16
		LDX	#16
		JSR	DRAWWIND

;clear palettes

		JSR	VR_WAIT
		JSR	KILL_VID
		LDA	Vid_Reset
		LDA	#$23
		STA	VID_PTR
		LDA	#$C3
		STA	VID_PTR
		LDA	#$00
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA

		LDA	#$23
		STA	VID_PTR
		LDA	#$CB
		STA	VID_PTR
		LDA	#$00
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA

		LDA	#$23
		STA	VID_PTR
		LDA	#$D3
		STA	VID_PTR
		LDA	#$00
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA

		LDA	#$23
		STA	VID_PTR
		LDA	#$DB
		STA	VID_PTR
		LDA	#$00
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA

		LDA	#$23
		STA	VID_PTR
		LDA	#$E3
		STA	VID_PTR
		LDA	#$00
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA
		STA	VID_DATA

		JSR	DMAXFER
		JMP	SET_VID


CW_3:
	LDA	#$13
	STA	CY
	LDA	#$0B
	STA	CX
	LDY	#6
	LDX	#16
	JMP	DRAWWIND

STAR_W2:
	LDA	#>(STARS)
	STA	PTR3H
	LDA	#<(STARS)
	STA	PTR3L
	JSR	RANDOM
	TAY

	LDX	#1
	LDA	#16
	STA	CX
SW2_A:
	INX
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH,X
	STA	VID_PTR
	LDA	#$0C
	CLC
	ADC	LNADDRL,X
	STA	VID_PTR
	LDA	#$0F
	STA	CY
SW2_B:
	LDA	(PTR3L),Y
	STA	VID_DATA
	INY
	DEC	CY
	BPL	SW2_B

	JSR	SET_VID
	TYA
	PHA
	JSR	DMAXFER
	PLA
	TAY
	DEC	CX
	BNE	SW2_A
	RTS

;DRAWS A BORDER AND FILLS WITH BLACK
;CX - STARTING COLLUMN, CY - STARTING ROW, X - WIDTH, Y - HEIGHT

DRAWWIND:
	STX	LOGIC_X
	STY	LOGIC_Y
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	JSR	DRAW_TOP
	JSR	DMAXFER
	JSR	SET_VID
	INC	CY
DW_0:
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	JSR	DRAWSIDE
	JSR	DMAXFER
	JSR	SET_VID
	INC	CY
	DEC	LOGIC_Y
	BNE	DW_0
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	JSR	DRAW_BOT
	JSR	DMAXFER
	JMP	SET_VID

DRAW_TOP:
	LDY	CY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	CX
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$77
	STA	VID_DATA
	LDX	LOGIC_X
	LDA	#$57
	JSR	DRAW_BAR
	LDA	#$78
	STA	VID_DATA
	RTS

DRAWSIDE:
	LDY	CY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	CX
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$58
	STA	VID_DATA
	LDX	LOGIC_X
	LDA	#$FA
	JSR	DRAW_BAR
	LDA	#$F8
	STA	VID_DATA
	RTS


DRAW_BOT:
	LDY	CY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	CX
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$97
	STA	VID_DATA
	LDX	LOGIC_X
	LDA	#$F7
	JSR	DRAW_BAR
	LDA	#$98
	STA	VID_DATA
	RTS

DRAW_BAR:
	STA	VID_DATA
	DEX
	BNE	DRAW_BAR
	RTS


;************ MAP STUFF ****************************


GETSECTOR:

;sets up (GAL_PTRL) to point to sector data table
;for sector @ (CY, CX)...

		LDA	CY	;0..7
		CLC
		ASL	A
		ASL	A
		ASL	A
		ASL	A		;mult. by 16
		CLC
		ADC	CX
		ADC	CX
		TAY
		LDA	GALAXY, Y
		STA	GAL_PTRL
		LDA	GALAXY+1, Y
		STA	GAL_PTRH
		RTS

NEWSYSTEM:
		LDA	#$FF
		STA	SAVEBIT0
		STA	SYSBIT0
		STA	SAVEBIT1
		STA	SYSBIT1
		STA	SAVEBIT2
		STA	SYSBIT2		;NECESSARY FOR LOADSYSTEM

		JSR	GETSYSTEM
		JMP	LOADSYSTEM


GETSYSTEM:

;set up (SEC_PTRL) to point to system data table for
;system @ (CX, CY)...assumes that
;"GETSECTOR" has been called to set (GAL_PTRL)...

		LDY	#0
		LDA	(GAL_PTRL), Y	;# of objs.
		STA	T0
		INY			;now points to 1st X-coord.

GETSYS0:	LDA	(GAL_PTRL), Y
		CMP	CX
		BNE	GETSYS1
		INY			;now Y-coord.
		LDA	(GAL_PTRL), Y
		CMP	CY
		BNE	GETSYS2
;match!
		INY			;low ptr
		LDA	(GAL_PTRL), Y
		STA	SEC_PTRL
		INY			;high ptr
		LDA	(GAL_PTRL), Y
		STA	SEC_PTRH
		RTS

GETSYS1:	INY			;now Y-coord.
GETSYS2:	INY			;low ptr
		INY			;high ptr
		INY			;X-coord. of next entry
		DEC	T0
		BNE	GETSYS0

		RTS			;ERROR!!


LOADSYSTEM:

;copies solar system data table @ (SEC_PTRL)
;over to "SYSTEM"...


		LDY	#120
LOADSYS0:	LDA	(SEC_PTRL), Y
		STA	SYSTEM, Y
		DEY
		BPL	LOADSYS0

	LDA	SYSTEM
	AND	#$C0
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	ORA	#4		;force 4..7
	STA	SYS_PAL

	LDA	SYSTEM
	AND	#$3F		;# of objs.
	STA	SYSTEM

	ASL	A
	ASL	A		;mult. by 4
	STA	COUNT0
	LDY	#0
NUKEDEAD:
	LDA	SYSTEM+4,Y	;INHAB BITS
	CLC
	ROL	SYSBIT2
	ROL	SYSBIT1
	ROL	SYSBIT0
	BCS	ND_A
	AND	#$27	;NO TECH, GAS, UNHINHABITED
ND_A:
	STA	SYSTEM+4,Y
	TYA
	CLC
	ADC	#4
	TAY
	CPY	COUNT0
	BCC	NUKEDEAD
	LDA	SAVEBIT0
	STA	SYSBIT0
	LDA	SAVEBIT1
	STA	SYSBIT1
	LDA	SAVEBIT2
	STA	SYSBIT2

		RTS



DRAW_GAL:	

;draw the Galaxy Map...

		LDY	#0
		JMP	MAP





DRSECTMAP:	LDY	#0
		LDA	(GAL_PTRL), Y	;# of objs.
		STA	COUNT0
		INY			;now X-pos

DRSECT0:	LDA	(GAL_PTRL), Y
		STA	TX
		INY
		STY	TY
		LDA	(GAL_PTRL), Y
		CLC
		ADC	#$01
		TAY
		JSR	VR_WAIT
		JSR	KILL_VID
		LDA	Vid_Reset
		LDA	LNADDRH, Y
		STA	VID_PTR
		LDA	LNADDRL, Y
		CLC
		ADC	TX
		ADC	#$0B
		STA	VID_PTR
		LDA	#$96
		STA	VID_DATA

		JSR	SET_VID
		JSR	DMAXFER
		LDY	TY
		INY
		INY
		INY
		DEC	COUNT0
		BNE	DRSECT0
		
		RTS




DRSYSMAP:

;top 25 sprites of SPRTBL0 & SPRTBL1 are used
;uses $1B for sizes 2-4 & $1C for sizes 5-6
;uses correct pal.# from SYSTEM data table

	 	LDA	#0
	 	JSR	XVIDEO
	
		LDY	#$A0
		JSR	ZAP_SPRITES
	
		LDA	SYSTEM
		STA	COUNT0
		LDX	#$A0
		LDY	#1		;pointer to x-pos of 1st item

DRSYSM3:	LDA	SYSTEM+2, Y	;type
		AND	#$70
		CMP	#$30		;sun?
		BEQ	DRSYS_A
		CMP	#$00
		BEQ	DRSYS_C
		BNE	DRSYS_B

;err!

DRSYSM4:	TYA
		CLC
		ADC	#4
		TAY
		DEC	COUNT0
		BNE	DRSYSM3
		RTS


DRSYS_A:	;sun
	
		LDA	#$B9
		STA	SPRTBL0+1, X	;char.
		LDA	#$00
		STA	SPRTBL0+2, X	;palette
		JMP	DRSYSM5

DRSYS_B:	;planet

		STY	T4
		LDA	SYSTEM+3,Y	;data bits
		AND	#FRNDLY
		BNE	DRSYS_B0
		LDA	SYSTEM+3,Y	;data bits
	  ;;	AND	#GAS
	  ;;	BEQ	DRSYS_B0

		LDA	#7
		JMP	DRSYS_B1

;(friendly) or (non-friendly & no gas)

DRSYS_B0:
		LDA	#0


DRSYS_B1:
		CLC
		ADC	SYSTEM+2, Y	;size (lo. nyb.)
		AND	#$0F
		TAY
		LDA	SYSTAB, Y
		STA	SPRTBL0+1, X	;char.
		LDY	T4
		LDA	SYSTEM+3,Y	;data bits
		AND	#INHAB
		BNE	DRSYS_B2
		LDA	#$01
		JMP	DRSYS_B3
DRSYS_B2:
		LDA	#$03
DRSYS_B3:
		STA	SPRTBL0+2, X	;palette
		JMP	DRSYSM5

DRSYS_C:	;space station

		LDA	#$DB
		STA	SPRTBL0+1, X	;char.
		LDA	#$03
		STA	SPRTBL0+2, X	;palette
		LDA	SYSTEM+3, Y	;data bits
		AND	#INHAB
		BNE	DRSYSM5
		LDA	#$F8
		STA	SPRTBL0 ,X
		JMP	DRSYSM5A
		
DRSYSM5:	LDA	SYSTEM+0, Y	;x pos.
		CLC
		ADC	#$64		
		STA	SPRTBL0+3, X	;X-pos

		LDA	SYSTEM+1, Y	;y pos.
		CLC
		ADC	#$15
		STA	SPRTBL0, X	;Y-pos

DRSYSM5A:
		TYA
		PHA
		STX	COUNT1
		LDA	#$9C
		SEC
		SBC	COUNT1
		TAY
		LDA	SPRTBL0, X
		STA	SPRTBL1, Y
		LDA	SPRTBL0+1, X
		STA	SPRTBL1+1, Y
		LDA	SPRTBL0+2, X
		STA	SPRTBL1+2, Y
		LDA	SPRTBL0+3, X
		STA	SPRTBL1+3, Y
		PLA
		TAY
		TXA
		CLC
		ADC	#$04
		TAX
		JMP	DRSYSM4

SYSTAB:		
	.byte	 $D4, $D4, $B5, $B6, $B7, $B8, $B9
	.byte	 $D4, $D4, $D5, $D6, $D7, $D8, $D9

;****************************



SYS_POS:
	LDA	XPOS
	CLC
	ADC	#$64
	STA	SPRTBL0+3
	STA	SPRTBL1+3
	LDA	YPOS
	CLC
	ADC	#$15
	STA	SPRTBL0
	STA	SPRTBL1
	LDA	#$20
	STA	SPRTBL0+2
	STA	SPRTBL1+2
	
POS_CHAR:
	LDA	#2		;palette & flip
	STA	SPRTBL0+2
	STA	SPRTBL1+2
POSCHAR0:
	LDA	#$BC		;sm. ship char.
	STA	SPRTBL0+1
	STA	SPRTBL1+1
	RTS


DRAWPLNT:
; Draw map when on planet surface:
;  Y-reg. has "planet index" (0 = space stn., 1 = reg., 2 = P'radikus)
;  (which is really just BKGRND - $7F).

		STY	LOGIC_X		;save index
		LDY	BKGRND
		JSR	MAP		;draw the actual chars. of the map
		JSR	PSPRXFER
		JMP	SETTWRSPR

PSPRXFER:	LDY	LOGIC_X	    	;map index
		LDA	MAPSPR0H,Y	;get pointers to 2 sprite tables.
		STA	PTR3H
		LDA	MAPSPR0L,Y
		STA	PTR3L
		LDA	MAPSPR1H,Y
		STA	PTR2H
		LDA	MAPSPR1L,Y
		STA	PTR2L

		LDY	#59		;size of table ?
		LDX	#119		;transfer dest.
SXF_1:		LDA	(PTR3L),Y
		STA	SPRTBL0+ $80,X
		LDA	(PTR2L),Y
		STA	SPRTBL1+ $80,X
		DEY
		CPY	#52
		BCC	SXF_1A
		LDA	#$D4
		JMP	SXF_1B
SXF_1A:		LDA	#$D5
SXF_1B:		STA	SPRTBL0+ $7E,X
		STA	SPRTBL1+ $7E,X
		LDA	#3
		STA	SPRTBL0+ $7F,X
		STA	SPRTBL1+ $7F,X
		LDA	(PTR3L),Y
		STA	SPRTBL0+ $7D,X
		LDA	(PTR2L),Y
		STA	SPRTBL1+ $7D,X
		DEY
		TXA
		SEC
		SBC	#4
		TAX
		BPL	SXF_1
	
		LDA	#>(GUN_STAT)
		STA	PTR3H
		LDA	#<(GUN_STAT)
		STA	PTR3L

		CLC
		ADC	#26
		STA	PTR2L
		LDA	PTR3H
		ADC	#0		;pickup previous carry...
		STA	PTR2H

		LDY	#25
SXF_3:		LDA	(PTR3L),Y
		AND	#$80		;Alive?
		BNE	SXF_3A		;Yes if non-zero...
		TYA
		ASL	A
		ASL	A
		TAX	
		LDA	#$F8
		STA	SPRTBL0+ $80,X
SXF_3A:		LDA	(PTR2L),Y
		AND	#$80		;Alive?
		BNE	SXF_3B		;Yes if non-zero...
		TYA
		ASL	A
		ASL	A
		TAX	
		LDA	#$F8
		STA	SPRTBL1+ $80,X
SXF_3B:		DEY
		BPL	SXF_3
		JSR	SXF_5
		JSR	VR_WAIT
		JSR	DMAXFER
		RTS

SXF_5:		LDA	LOGIC_X
		BNE	SXF_5A
		LDA	XPOS
		ASL	A
		ASL	A
		STA	COUNT0
		LDA	YPOS
		ASL	A
		ASL	A
		STA	COUNT1
		JMP	SXF_5B
SXF_5A:		LDY	XPOS
		LDA	P_POS,Y
		STA	COUNT0
		LDY	YPOS
		LDA	P_POS,Y
		STA	COUNT1
SXF_5B:		LDA	COUNT0
		CLC
		ADC	#$68
		STA	SPRTBL0+3
		STA	SPRTBL1+3
		LDA	COUNT1
		CLC
		ADC	#$1A
		STA	SPRTBL0
		STA	SPRTBL1
		JSR	POS_CHAR
		RTS

SETTWRSPR:
	LDA	BKGRND
	CMP	#$80
	BNE	STS_END
	LDY	#$0F
	LDX	#$F4
	JSR	CHK_TWR	
	TXA
	SEC
	SBC	#4
	TAX
	JSR	CHK_TWR	
	TXA
	SEC
	SBC	#4
	TAX
	JSR	CHK_TWR	
	TXA
	SEC
	SBC	#4
	TAX
	JSR	CHK_TWR	
STS_END:
	RTS

CHK_TWR:
	LDA	GUN_STAT+ $34,Y
	AND	#$80
	BNE	CT_END
	TYA
	AND	#$03
	BEQ	CT_REM
	DEY
	JMP	CHK_TWR
CT_REM:
	LDA	#$F8
	STA	SPRTBL0,X
	STA	SPRTBL1,X
CT_END:
	TYA
	AND	#$0C
	TAY
	DEY
	RTS

CLRARDAT:
	LDA	#$00
	STA	ARDAT0
	LDA	#$00
	STA	ARDAT1
	LDA	#$00
	STA	ARDAT2
	LDA	#$00
	STA	ARDAT3
	LDA	#$00
	STA	ARDAT4
	LDA	#$00
	STA	ARDAT5
	LDA	#$FF
	STA	ARDAT6
	LDA	#$66
	STA	CX
	LDA	#$FF
	STA	ARDAT0,Y
	RTS

ARROW:
	STA	LOGIC_TEMP
	LDA	#$F8
	STA	 $0264
	STA	 $0764
	STA	 $0268
	STA	 $0768
	STA	 $026C
	STA	 $076C
	LDA	CX	
	STA	 $0263
	STA	 $0763
	LDA	#$DC
	STA	 $0261
	STA	 $0761
	LDA	#3
	STA	 $0262
	STA	 $0762
AW_0:
	STY	CY
	INY
	TYA
	CLC	
	ADC	LOGIC_TEMP
	JSR	GETCOST
	BEQ	AW_00
	JSR	DISPCOST
AW_00:
	LDY	CY
	LDA	ARDAT0,Y
	BEQ	AW_2A
	STA	 $0260
	STA	 $0760
	JSR	VR_WAIT
	JSR	KILL_VID
	JSR	DMAXFER
	JSR	SET_VID
	JSR	JSTICK1
	LDY	CY
	LDA	J1CHG
	AND	#SELECT
	BEQ	AW_0A
	LDA	#$FF
	RTS
AW_0A:
	LDA	J1CHG
	AND	#B_BTN
	BEQ	AW_1
	LDA	#$80
	RTS
AW_1:
	LDA	J1CHG
	AND	#A_BTN
	BEQ	AW_2
	TYA
	RTS
AW_2:
	LDA	J1CHG
	AND	#DN_BTN
	BEQ	AW_3
AW_2A:
	INY
	LDA	ARDAT0,Y
	BEQ	AW_2A
	CMP	#$FF
	BNE	AW_0
	JMP	AW_4
AW_3:
	LDA	J1CHG
	AND	#UP_BTN
	BEQ	AW_0
AW_4:
	DEY
	BMI	AW_2A
	LDA	ARDAT0,Y
	BEQ	AW_4
	JMP	AW_0

;MOVES THE 1x1 CURSOR RETURNS 1 TARGET SELECTED OTHERWISE 0 IN A
;IF A=1 THEN CX AND CY HAVE THE POSTION OF THE CURSOR
MOVE_1:
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	LNADDRH+22
	STA	VID_PTR
	LDA	#$15
	CLC
	ADC	LNADDRL+22
	STA	VID_PTR
	LDA	#$08
	STA	VID_DATA
	LDA	CURSORX
	CLC
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	#1
	JSR	DRAW_NUM
	LDA	#$0C
	STA	VID_DATA
	LDA	CURSORY
	CLC
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	#1
	JSR	DRAW_NUM
	LDA	#$09
	STA	VID_DATA
	JSR	SET_VID
	JSR	DMAXFER
	JSR	JSTICK1
	LDA	J1CHG
	AND	#SELECT
	BEQ	M1_0
	LDA	#$FF
	RTS
M1_0:
	LDA	J1CHG
	AND	#A_BTN
	BNE	M1_CHS
	LDA	J1CHG
	AND	#B_BTN
	BNE	M1_END
	LDA	J1CHG
	AND	#UP_BTN
	BEQ	M1_RT
M1_UP:
	LDA	#-4
	JSR	M1_MOVE
M1_RT:
	LDA	J1CHG
	AND	#RT_BTN
	BEQ	M1_DN
M1_RT0:
	LDA	#4
	JSR	M1_MOVE
M1_DN:
	LDA	J1CHG
	AND	#DN_BTN
	BEQ	M1_LT
M1_DN0:
	LDA	#4
	JSR	M1_MOVE
M1_LT:
	LDA	J1CHG
	AND	#LT_BTN
	BEQ	M1_DONE
M1_LT0:
	LDA	#-4
	JSR	M1_MOVE
M1_DONE:
	JSR	M1_CURSR
	JMP	MOVE_1
M1_END:
	LDA	#0
	RTS
M1_MOVE:
	BMI	M1M_SUB
	CLC
	ADC	CRSR_I
	STA	CRSR_I
	LDY	#0
	LDA	(GAL_PTRL),Y	;num. objects
	ASL	A
	ASL	A
	SEC
	SBC	#3
	CMP	CRSR_I
	BCS	M1M_END
	STA	CRSR_I
	JMP	M1M_END
M1M_SUB:
	CLC
	ADC	CRSR_I
	STA	CRSR_I
	BPL	M1M_END
	LDA	#1
	STA	CRSR_I
M1M_END:
	LDY	CRSR_I
	LDA	(GAL_PTRL),Y
	SEC
	SBC	#1
	CLC
	ASL	A
	ASL	A
	ASL	A
	STA	CURSORX
	INY
	LDA	(GAL_PTRL),Y
	SEC
	SBC	#1
	CLC
	ASL	A
	ASL	A
	ASL	A
	STA	CURSORY
	RTS
M1_CHS:
	LDA	CURSORY
	CLC
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	#1
	STA	CY
	LDA	CURSORX
	CLC
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	#1
	STA	CX
	LDA	#1
	RTS
M1_CURSR:
	LDA	CURSORX
	CLC
	ADC	#$68
	STA	 $0263	;CURSOR SPRITE X
	STA	 $0763
	LDA	CURSORY
	CLC
	ADC	#$19
	STA	 $0260	;CURSOR SPRITE Y
	STA	 $0760
	LDA	#$BA
	STA	 $0261	;CURSOR SPRITE CHAR	
	STA	 $0761
	LDA	#3
	STA	 $0262	;CURSOR SPRITE PAL
	STA	 $0762
	LDA	#$F8
	STA	 $0264
	STA	 $0764
	STA	 $0268
	STA	 $0768
	STA	 $026C
	STA	 $076C

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH + 24
	STA	VID_PTR
	LDA	#$0C
	CLC
	ADC	LNADDRL + 24
	STA	VID_PTR
	LDA	#$FA
	STA	VID_DATA
	STA	VID_DATA
	LDY	CRSR_I
	INY
	INY
	LDA	(GAL_PTRL),Y
	STA	PTR3L
	INY
	LDA	(GAL_PTRL),Y
	STA	PTR3H
	LDY	#0
	LDA	(PTR3L),Y
	AND	#$3F		;num. of objects.
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER

	LDX	#<(PLNTSTR)
	LDY	#>(PLNTSTR)
	JSR	DOPRINT

	RTS
	
					      
;MOVES THE 1x1 CURSOR IN SYSTEM MAP RETURNS 1 TARGET SELECTED OTHERWISE 0 IN A
;IF A=1 THEN CX AND CY HAVE THE POSTION OF THE CURSOR
MOVE_1SS:
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	LNADDRH+24
	STA	VID_PTR
	LDA	#$0F
	CLC
	ADC	LNADDRL+24
	STA	VID_PTR
	LDA	#$08
	STA	VID_DATA
	LDA	CURSORX
	CLC
	ADC	#1
	JSR	DRAWNUM3
	LDA	#$0C
	STA	VID_DATA
	LDA	CURSORY
	CLC
	ADC	#1
	JSR	DRAWNUM3
	LDA	#$09
	STA	VID_DATA
	JSR	SET_VID
	JSR	DMAXFER
	JSR	JSTICK1
	LDA	J1CHG
	AND	#SELECT
	BEQ	M1SS_0
	LDA	#$FF
	RTS
M1SS_0:
	LDA	J1CHG
	AND	#A_BTN
	BNE	M1S_CHS
	LDA	J1CHG
	AND	#B_BTN
	BNE	M1S_END
	LDA	J1CHG
	AND	#UP_BTN
	BEQ	M1S_RT
M1S_UP:
	LDA	#-4
	JSR	M1S_MOVE
M1S_RT:
	LDA	J1CHG
	AND	#RT_BTN
	BEQ	M1S_DN
M1S_RT0:
	LDA	#4
	JSR	M1S_MOVE
M1S_DN:
	LDA	J1CHG
	AND	#DN_BTN
	BEQ	M1S_LT
M1S_DN0:
	LDA	#4
	JSR	M1S_MOVE
M1S_LT:
	LDA	J1CHG
	AND	#LT_BTN
	BEQ	M1S_DONE
M1S_LT0:
	LDA	#-4
	JSR	M1S_MOVE
M1S_DONE:
	JSR	M1S_CRSR
	JMP	MOVE_1SS
M1S_SUB:
	CLC
	ADC	CRSR_I
	STA	CRSR_I
	BPL	M1SM_END
	LDA	#1
	STA	CRSR_I
M1SM_END:
	LDY	CRSR_I
	JSR	IS_DEAD
	BNE	M1SM_SKIP
	LDA	SYSTEM+0,Y	;x pos
	STA	CURSORX
	LDA	SYSTEM+1,Y	;y pos
	STA	CURSORY
	RTS
M1SM_SKIP:
	LDA	EXPL_A
	BPL	M1S_MOVE
	LDA	CRSR_I
	CMP	#1
	BEQ	M1SM_SUP
	LDA	EXPL_A
	JMP	M1S_SUB
M1SM_SUP:
	LDA	#4
	JMP	M1S_MOVE
M1S_CHS:
	LDA	CURSORY
	STA	CY
	LDA	CURSORX
	STA	CX
	LDA	#1
	RTS
M1S_END:
	LDA	#0
	RTS
M1S_MOVE:
	STA	EXPL_A
	BMI	M1S_SUB
	CLC
	ADC	CRSR_I
	STA	CRSR_I
	LDA	SYSTEM
	ASL	A
	ASL	A
	SEC
	SBC	#3
	CMP	CRSR_I
	BCS	M1SM_END
	STA	CRSR_I
	JMP	M1SM_END

M1S_CRSR:
	LDA	CURSORX
	CLC
	ADC	#$64
	STA	 $0263	;CURSOR SPRITE X
	STA	 $0763
	LDA	CURSORY
	CLC
	ADC	#$15
	STA	 $0260	;CURSOR SPRITE Y
	STA	 $0760
	LDA	#$BA
	STA	 $0261	;CURSOR SPRITE CHAR	
	STA	 $0761
	LDA	#3
	STA	 $0262	;CURSOR SPRITE PAL
	STA	 $0762
	LDA	#$F8
	STA	 $0264
	STA	 $0764
	STA	 $0268
	STA	 $0768
	STA	 $026C
	STA	 $076C
	RTS


;MOVES THE 2x2 CURSOR RETURNS 1 TARGET SELECTED OTHERWISE 0 IN A
;IF A=1 THEN CX AND CY HAVE THE POSTION OF THE CURSOR
MOVE_2:
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	LNADDRH+22
	STA	VID_PTR
	LDA	#$0C
	CLC
	ADC	LNADDRL+22
	STA	VID_PTR
	LDA	#$08
	STA	VID_DATA
	LDA	CURSORX
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	#1
	JSR	DRAW_NUM
	LDA	#$0C
	STA	VID_DATA
	LDA	CURSORY
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	#1
	JSR	DRAW_NUM
	LDA	#$09
	STA	VID_DATA
	JSR	SET_VID
	JSR	DMAXFER
	JSR	JSTICK1
	LDA	J1CHG
	AND	#SELECT
	BEQ	M2_0
	LDA	#$FF
	RTS
M2_0:
	LDA	J1CHG
	AND	#A_BTN
	BNE	M2_CHS
	LDA	J1CHG
	AND	#B_BTN
	BNE	M2_END
	LDA	J1CHG
	AND	#UP_BTN
	BEQ	M2_RT
M2_UP:
	LDA	#-16
	LDX	#1
	JSR	M2_MOVE
M2_RT:
	LDA	J1CHG
	AND	#RT_BTN
	BEQ	M2_DN
M2_RT0:
	LDA	#16
	LDX	#0
	JSR	M2_MOVE
M2_DN:
	LDA	J1CHG
	AND	#DN_BTN
	BEQ	M2_LT
M2_DN0:
	LDA	#16
	LDX	#1
	JSR	M2_MOVE
M2_LT:
	LDA	J1CHG
	AND	#LT_BTN
	BEQ	M2_DONE
M2_LT0:
	LDA	#-16
	LDX	#0
	JSR	M2_MOVE
M2_DONE:
	JSR	M2_CURSR
	JMP	MOVE_2
M2_CHS:
	LDA	FUELUSED
	CMP	FUEL
	BCS	M2_DONE
M2_CHS0:
	LDA	CURSORY
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	STA	CY
	LDA	CURSORX
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	STA	CX
	LDA	#1
	RTS
M2_END:
	LDA	#0
	RTS
M2_MOVE:
	CLC
	ADC	CURSORX,X
	AND	#$7F
	STA	CURSORX,X
	RTS
M2_CURSR:
	LDA	CURSORX
	CLC
	ADC	#$69
	STA	 $0263	;CURSOR SPRITE X
	STA	 $0763
	STA	 $026F
	STA	 $076F
	CLC
	ADC	#6
	STA	 $0267
	STA	 $0767
	STA	 $026B
	STA	 $076B
	LDA	CURSORY
	CLC
	ADC	#$19
	STA	 $0260	;CURSOR SPRITE Y
	STA	 $0760
	STA	 $0264
	STA	 $0764
	CLC
	ADC	#8
	STA	 $0268
	STA	 $0768
	STA	 $026C
	STA	 $076C
	LDA	#$DA
	STA	 $0261	;CURSOR SPRITE CHAR	
	STA	 $0761
	STA	 $0265
	STA	 $0765
	STA	 $0269
	STA	 $0769
	STA	 $026D
	STA	 $076D
	LDA	#$03
	STA	 $0262	;CURSOR SPRITE PAL
	STA	 $0762
	LDA	#$43
	STA	 $0266
	STA	 $0766
	LDA	#$C3
	STA	 $026A
	STA	 $076A
	LDA	#$83
	STA	 $026E
	STA	 $076E

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH + 24
	STA	VID_PTR
	LDA	#$0C
	CLC
	ADC	LNADDRL + 24
	STA	VID_PTR
	LDA	CURSORY
	LSR	A
	STA	CY
	LDA	CURSORX
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	CLC
	ADC	CY
	ASL	A
	TAX
	LDA	GALAXY,X
	STA	PTR3L
	LDA	GALAXY+1,X
	STA	PTR3H
	LDY	#0
	LDA	(PTR3L),Y
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER

	LDX	#<(SOL_SYS)
	LDY	#>(SOL_SYS)
	JSR	DOPRINT

	JSR	FUEL_USE
	CMP	FUEL
	BCC	M2_FUEL

	LDX	#<(NO_FUEL2)
	LDY	#>(NO_FUEL2)
	JMP	DOPRINT

M2_FUEL:
	LDX	#<(FUELSTR4)
	LDY	#>(FUELSTR4)
	JSR	DOPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH + 25
	STA	VID_PTR
	LDA	#$17
	CLC
	ADC	LNADDRL + 25
	STA	VID_PTR
	LDA	FUELUSED
	JSR	DRAW_NUM
	LDA	#$FA
	STA	VID_DATA
	STA	VID_DATA
	STA	VID_DATA
	JSR	SET_VID
	JMP	DMAXFER

FUEL_USE:
	JSR	M2_CHS0
	JSR	FU_DISP
	LDA	CY
	ASL	A
	ASL	A
	ASL	A
	CLC
	ADC	CX
	TAY
	LDA	FUEL_TBL,Y
	STA	SUBSVAR1
	LDY	DRIVE
	LDA	SECTFUEL,Y
	STA	SUBSVAR2
	JSR	MULSUBS
	BCS	FU_FALSE
	LDY	DRIVE
	CLC	
	ADC	SYSFUEL,Y
	BCS	FU_FALSE
	STA	FUELUSED
	RTS
FU_FALSE:
	LDA	#100
	STA	FUELUSED
	RTS

FU_DISP:
	LDA	CY
	CMP	GALAXY_Y
	BCS	FUD_Y
	LDA	GALAXY_Y
	SEC
	SBC	CY
	STA	CY
	JMP	FUD_X0
FUD_Y:
	SEC
	SBC	GALAXY_Y
	STA	CY
FUD_X0:
	LDA	CX
	CMP	GALAXY_X
	BCS	FUD_X
	LDA	GALAXY_X
	SEC
	SBC	CX
	STA	CX
	JMP	FUD_END
FUD_X:
	SEC
	SBC	GALAXY_X
	STA	CX
FUD_END:
	RTS

MULSUBS:
	LDA	#0
	LDY	SUBSVAR1
MSUB_0:
	BEQ	MSUB_END
	CLC
	ADC	SUBSVAR2
	BCS	MSUB_NO
	DEY
	JMP	MSUB_0
MSUB_NO:
	SEC
MSUB_END:
	RTS

;			0 1 2 3 4 5 6 7 8 9 A B C D E F

P1:		.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
P10:		.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
P100:		.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
P1000:		.byte	0,5,0,5,0,5,0,5,0,5,0,0,0,0,0,0
P10000:		.byte	1,1,2,2,3,3,4,4,5,5,6,7,8,9,0,5
P100000:	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1


CHKGAL:		DEX
		CPX	GALAXY_X
		BNE	CHKGALN
		DEY
		CPY	GALAXY_Y
		BNE	CHKGALN
		LDA	#1
		RTS
CHKGALN:	LDA	#0
		RTS


CHKSYS:		CPX	SECTOR_X
		BNE	CHKSYSN
		CPY	SECTOR_Y
		BNE	CHKSYSN
		LDA	#1
		RTS
CHKSYSN:	LDA	#0
		RTS

CHKPOS:		DEX
		CPX	XPOS
		BNE	CHKPOSN
		DEY
		CPY	YPOS
		BNE	CHKPOSN
		LDA	#1
		RTS
CHKPOSN:	LDA	#0
		RTS


PROCITEM:
;
;display messages upon destruction of an enemy base
;

		LDA	COMPITEM
		CMP	#$FF
		BNE	PCHK2
		LDA	#$00
		STA	COMPITEM

;check missions...

PCHK2:		LDA	MISSION
		CMP	#2
		BNE	PCHK3
		LDX	M2LOC+ 0
		LDY	M2LOC+ 1
		JSR	CHKGAL
		BEQ	PCHK2A
		LDX	M2LOC+ 2
		LDY	M2LOC+ 3
		JSR	CHKSYS
		BEQ	PCHK2A
		LDX	M2LOC+ 4
		LDY	M2LOC+ 5
		JSR	CHKPOS
		BEQ	PCHK2A
		LDA	#$FF
		STA	GOAL2
		STA	GOAL0
PCHK2A:		JMP	PCHKDONE

PCHK3:		CMP	#3
		BNE	PCHK4
		LDX	M3LOC+ 0
		LDY	M3LOC+ 1
		JSR	CHKGAL
		BEQ	PCHK3A
		LDX	M3LOC+ 2
		LDY	M3LOC+ 3
		JSR	CHKSYS
		BEQ	PCHK3A
		LDA	GOAL3
		ASL	A
		ORA	#1
		STA	GOAL3
		CMP	#$FF
		BNE	PCHK3A
		STA	GOAL0
PCHK3A:		JMP	PCHKDONE

PCHK4:		CMP	#4
		BNE	PCHK5
		LDX	M4LOC+ 0
		LDY	M4LOC+ 1
		JSR	CHKGAL
		BEQ	PCHK4A
		LDX	M4LOC+ 2
		LDY	M4LOC+ 3
		JSR	CHKSYS
		BEQ	PCHK4A
		LDX	M4LOC+ 4
		LDY	M4LOC+ 5
		JSR	CHKPOS
		BEQ	PCHK4A
		LDA	#$FF
		STA	GOAL4
		STA	GOAL0
		LDA	#$FD		;message capsule
		STA	COMPITEM
PCHK4A:		JMP	PCHKDONE

PCHK5:		CMP	#5
		BNE	PCHK6
		LDX	M5LOC+ 0
		LDY	M5LOC+ 1
		JSR	CHKGAL
		BEQ	PCHK5A
		LDX	M5LOC+ 2
		LDY	M5LOC+ 3
		JSR	CHKSYS
		BEQ	PCHK5A
		LDX	M5LOC+ 4
		LDY	M5LOC+ 5
		JSR	CHKPOS
		BEQ	PCHK5A
		LDA	#$FF
		STA	GOAL5
		STA	GOAL0
		LDA	#$FE
		STA	COMPITEM	;thunder bolt
PCHK5A:		JMP	PCHKDONE

PCHK6:		CMP	#6
		BNE	PCHK7
		LDX	M6LOC+ 0
		LDY	M6LOC+ 1
		JSR	CHKGAL
		BEQ	PCHK6A
		LDX	M6LOC+ 2
		LDY	M6LOC+ 3
		JSR	CHKSYS
		BEQ	PCHK6A
		LDX	M6LOC+ 4
		LDY	M6LOC+ 5
		BEQ	PCHK6A
		LDA	#$FF
		STA	GOAL6
		STA	GOAL0
		LDA	#$FD		;message capsule
		STA	COMPITEM
PCHK6A:		JMP	PCHKDONE

PCHK7:		LDX	M7LOC+ 0
		LDY	M7LOC+ 1
		JSR	CHKGAL
		BEQ	PCHK7A
		LDX	#6
		LDY	#13
		JSR	CHKSYS
		BEQ	PCHK7A
		LDX	#87
		LDY	#82
		BEQ	PCHK7A
		LDA	#$FF
		STA	COMPITEM	;freem drive
		STA	GOAL7
		STA	GOAL0
PCHK7A:
PCHKDONE:	


	LDY	#3
	JSR	BIGDELAY	;delay to show "SCAN" window

	JSR	CW_3		;clear window
	
	LDX	#<(TWR0_STR)
	LDY	#>(TWR0_STR)
	JSR	DOPRINT

	LDY	#9
	JSR	BIGDELAY
	JSR	CW_3

	LDX	#<(REFUEL_0)
	LDY	#>(REFUEL_0)
	JSR	DOPRINT

	JSR	C0C_B

	LDX	#<(FIND_STR)
	LDY	#>(FIND_STR)
	JSR	DOPRINT
	
		LDA	COMPITEM
		CMP	#$FF
		BEQ	PI_A
		CMP	#$FE
		BEQ	PI_B
		CMP	#$FD
		BEQ	PI_CAP
		JMP	PI_B2		;give money or random item

PI_A:		LDA	HASFREEM
		BNE	PI_A1
		JMP	PI_NOT

;give freem drive...

PI_A1:		LDA	#6
		STA	DRIVE
		LDA	#0
		STA	HASFREEM
		LDX	#<(FREEMSTR)
		LDY	#>(FREEMSTR)
		JMP	PI_STR

;give thunderbolt...

PI_B:		CMP	#$FE
		BNE	PI_CAP
		LDA	HASBOLT
		BNE	PI_B1
		JMP	PI_NOT

PI_B1:		LDA	#99
		STA	THUNDER
		LDA	#0
		STA	HASBOLT

		LDX	#<(BOLT_STR)
		LDY	#>(BOLT_STR)
		JMP	PI_STR

;give "message capsule"...

PI_CAP:		LDX	#<(CAP_STR)
		LDY	#>(CAP_STR)
		JMP	PI_STR


;give money or random item...

PI_B2:		CMP	#$00
		BEQ	PI_B2A
		JMP	PI_CASH
PI_B2A:
		JSR	RANDOM
		ROR	A
		BCC	PI_C
;give MINES
		LDA	#25
		CLC
		ADC	MINES
		CMP	#99
		BCC	PI_B3
		LDA	#99
PI_B3:		STA	MINES
		LDX	#<(MINE_STR)
		LDY	#>(MINE_STR)
		JSR	PI_STR
		LDA	MINES
		JMP	PI_NUM

PI_C:		ROR	A
		BCC 	PI_D
;give INVISO...
		LDA	#25
		CLC
		ADC	CLOAK
		CMP	#99
		BCC	PI_C1
		LDA	#99
PI_C1:		STA	CLOAK
		LDX	#<(CLOAK_PI)
		LDY	#>(CLOAK_PI)
		JSR	PI_STR
		LDA	CLOAK
		JMP	PI_NUM

PI_D:		ROR	A
		BCC	PI_E
;give EMP WAVE
		LDA	#25
		CLC
		ADC	S_WAVE
		CMP	#99
		BCC	PI_D1
		LDA	#99
PI_D1:		STA	S_WAVE
		LDX	#<(WAVE_STR)
		LDY	#>(WAVE_STR)
		JSR	PI_STR
		LDA	S_WAVE
		JMP	PI_NUM

PI_E:		ROR	A
		BCC	PI_F
;give MISSILES
		LDA	#25
		CLC
		ADC	MISSILES
		CMP	#99
		BCC	PI_E1
		LDA	#99
PI_E1:		STA	MISSILES
		LDX	#<(MISL_STR)
		LDY	#>(MISL_STR)
		JSR	PI_STR
		LDA	MISSILES
		JMP	PI_NUM

PI_F:		LDA	WPN1
		CMP	#L_LASER
		BCS	PI_G		;give heavy laser
;give light laser
		LDA	#L_LASER
		STA	WPN1
		LDX	#<(LLASER09)
		LDY	#>(LLASER09)
		JMP	PI_STR

PI_G:		LDA	#H_LASER
		STA	WPN1
		LDX	#<(HLASER09)
		LDY	#>(HLASER09)
		JMP	PI_STR

PI_NOT:		LDX	#<(NOTHING)
		LDY	#>(NOTHING)
		JSR	XYPRINT
		JMP	DISPCOMP

PI_STR:		JSR	DOPRINT
		JMP	DISPCOMP


PI_NUM:		PHA
		LDX	#<(HAVE_STR)	;'YOU NOW HAVE'
		LDY	#>(HAVE_STR)
		JSR	DOPRINT

		JSR	VR_WAIT
		JSR	KILL_VID
		LDA	Vid_Reset
		LDA	LNADDRH+24
		STA	VID_PTR
		LDA	#25
		CLC
		ADC	LNADDRL+24
		STA	VID_PTR
		PLA
		JSR	DRAW_NUM
		JSR	SET_VID
		JMP	DMAXFER
	
	
PI_CASH:	AND	#$0F
		STA	LOGIC_Y
		JSR	GETSCORE

		JSR	RANDOM
		AND	#$0F
		CMP	#11
		BCC	PIC_A
		CLC
		ROR	A
		BCS	PIC_A
		LDA	#0

PIC_A:		TAY
		STA	COUNT3

		LDX	CARGO_L, Y
		LDA	CARGO_H, Y
		TAY
		JSR	PI_STR

		LDA	COUNT3
		BEQ	PI_END		;"nothing"

		LDX	#<(VAL_STR)
		LDY	#>(VAL_STR)
		JSR	DOPRINT
	
		LDY	#>(CRDT_STR)
		LDX	#<(CRDT_STR)
		JSR	DOPRINT
		JSR	DISPCASH
		LDA	LOGIC_Y
		JSR	ADDSCORE

PI_END:		JMP	DISPCOMP

;************************************************

ADDSCORE:	AND	#$0F
		TAY
		LDA	P1, Y
		STA	COUNT0
		LDA	SC1
		JSR	ADDIT
		STA	SC1

		LDA	COUNT0
		CLC
		ADC	P10, Y
		STA	COUNT0
		LDA	SC10
		JSR	ADDIT
		STA	SC10

		LDA	COUNT0
		CLC
		ADC	P100, Y
		STA	COUNT0
		LDA	SC100
		JSR	ADDIT
		STA	SC100

		LDA	COUNT0
		CLC
		ADC	P1000, Y
		STA	COUNT0
		LDA	SC1000
		JSR	ADDIT
		STA	SC1000

		LDA	COUNT0
		CLC
		ADC	P10000, Y
		STA	COUNT0
		LDA	SC10000
		JSR	ADDIT
		STA	SC10000

		LDA	COUNT0
		CLC
		ADC	P100000, Y
		STA	COUNT0
		LDA	SC100000
		JSR	ADDIT
		STA	SC100000

		LDA	SC1M
		JSR	ADDIT
		STA	SC1M		
		
		LDA	COUNT0
		BEQ	ADDSRTS

		LDA	#9
		STA	SC1M
		STA	SC100000
		STA	SC10000
		STA	SC1000
		STA	SC100
		STA	SC10
		STA	SC1

ADDSRTS:	RTS

ADDIT:		CLC
		ADC	COUNT0
		PHA
		LDA	#0
		STA	COUNT0
		PLA

ADDIT1:		CMP	#10
		BCC	ADDIT2
		SBC	#10
		INC	COUNT0
		BNE	ADDIT1		;Always!

ADDIT2:		RTS

;************************************************

XYPRINT:
; X = low, Y = high addr. ptrs.
; ---ignore pos. bytes in string and
;    use TX, TY instead

		LDA	#0
		STA	PR_PAGE
		STX	PR_PTRL
		STY	PR_PTRH
		LDA	TX
		STA	PR_X
		STA	PR_LEFT
		LDA	TY
		STA	PR_Y
		STA	PR_TOP
		LDY	#2
		JMP	DOPR2


DOPRINT:
; X = low, Y = high addr. ptrs.
; PR_X, PR_Y set to screen pos
; PR_MODE, PR_PAGE also set

	    	LDA	#0
	    	STA	PR_PAGE
		STX	PR_PTRL
		STY	PR_PTRH
		LDY	#0
		LDA	(PR_PTRL), Y
		STA	PR_X
		STA	PR_LEFT
		INY
		LDA	(PR_PTRL), Y
		STA	PR_Y
		STA	PR_TOP
		INY

DOPR2:		STY	PR_INDEX
		JSR	VR_WAIT
		JSR	KILL_VID
		JSR	DMAXFER

		LDA	Vid_Reset
		JSR	PR_ADDR
		LDY	PR_INDEX
PRINT_LOOP:	LDA	(PR_PTRL), Y
		CMP	#-1
		BEQ	PRINT_END
		CMP	#0
		BEQ	PRINT_CR
		SEC
		SBC	#32
		STA	VID_DATA		
		INC	PR_X
		INY
		BNE	PRINT_LOOP

PRINT_END:	JSR	SET_VID
		LDA	#0
		RTS

PRINT_CR:	STY	PR_INDEX
		LDA	PR_LEFT
		STA	PR_X
		INC	PR_Y
		
		JSR	SET_VID
		JSR	VR_WAIT
		JSR	KILL_VID
		JSR	DMAXFER
		LDA	Vid_Reset

		JSR	PR_ADDR
		LDY	PR_INDEX
		INY
		BNE	PRINT_LOOP
		JMP	PRINT_END

		
PR_ADDR:	LDY	PR_Y
		LDA	LNADDRH, Y		
	    	LDX	PR_PAGE
	    	BEQ	PR_ADDR2
	    	ORA	#4
PR_ADDR2:	STA	VID_PTR
		LDA	LNADDRL, Y
		CLC
		ADC	PR_X
		STA	VID_PTR
		RTS

;****************************

GETSCORE:
	TAY
	LDA	P1,Y
	STA	C1
	LDA	P10,Y
	STA	C10
	LDA	P100,Y
	STA	C100
	LDA	P1000,Y
	STA	C1000
	LDA	P10000,Y
	STA	C10000
	LDA	P100000,Y
	STA	C100000
	RTS

DISPCASH:	JSR	VR_WAIT
		JSR	KILL_VID
		LDA	Vid_Reset
		LDA	LNADDRH+24
		STA	VID_PTR
		LDA	#$0D
		CLC
		ADC	LNADDRL+24
		STA	VID_PTR

		LDY	#0
DISPCSH2:	LDA	C100000, Y
		BNE	DISPCSH3
		CPY	#5
		BEQ	DISPCSH3
		LDA	#$FA
		STA	VID_DATA
		INY
		JMP	DISPCSH2

DISPCSH3:	LDA	C100000,Y
		CLC
		ADC	#$10
		STA	VID_DATA
		INY
		CPY	#6
		BNE	DISPCSH3

	JSR	SET_VID
	JMP	DMAXFER	


CARGO_L: 
	.byte	NOTHING & $FF, PARTS & $FF, ROBOTS & $FF, TOOLS & $FF
	.byte	CRYSTAL & $FF, GOLD & $FF, GEMS & $FF
	.byte	PLATINUM & $FF, WEAPONS & $FF
	.byte	RELICS & $FF, URANIUM & $FF
CARGO_H:
	.byte	NOTHING >>8, PARTS >>8, ROBOTS >>8, TOOLS >>8
	.byte	CRYSTAL >>8, GOLD >>8, GEMS >>8
	.byte	PLATINUM >>8, WEAPONS >>8
	.byte	RELICS >>8, URANIUM >>8

NOTHING:	.byte	13, 22, "NOTHING", $FF
GOLD:		.byte	13, 22, "GOLD", $FF
GEMS:		.byte	13, 22, "GEMS", $FF
PARTS:		.byte	13, 22, "SHIP PARTS", $FF
ROBOTS:		.byte	13, 22, "ROBOTS", $FF
CRYSTAL:	.byte	13, 22, "CRYSTALS", $FF
TOOLS:		.byte	13, 22, "TOOLS", $FF
PLATINUM:	.byte	13, 22, "PLATINUM", $FF
WEAPONS:	.byte	13, 22, "WEAPONS", $FF
RELICS:		.byte	13, 22, "ART RELICS", $FF
URANIUM:	.byte	13, 22, "URANIUM", $FF


MSG_0:		.byte	14, 22, "A MESSAGE", 0
		.byte	        "IT SAYS:", -1


PMSG:		.byte	12, 20, "YOU FOUND THE   ", 0
		.byte	        "P*RADIKUS SYSTEM", 0
		.byte	        "THE TOSON DRIVE ", 0
		.byte	        "BLEW A CIRCUIT. ", 0
		.byte	        "YOU ARE TRAPPED ", 0
		.byte	        "IN THIS SYSTEM. ", -1


REFUEL_0:	.byte	12, 21, "DRAINING FUEL", 0
		.byte	        " FROM TOWER!", -1

TWR0_STR:	.byte	12, 21, "CONTROL TOWER", 0
		.byte		"  DESTROYED!", 0
		.byte	0
		.byte		"SEARCHING RUINS", -1

FIND_STR:	.byte	12, 21, "YOU FIND: ", -1
HAVE_STR:	.byte	12, 24, "YOU NOW HAVE ", -1
VAL_STR:	.byte	12, 23, "VALUED AT:", -1
CRDT_STR:	.byte	20, 24, "CREDITS", -1

ARMRSTR0:	.byte	12, 20, "ARMOR COSTS ", -1
FUELSTR0:	.byte	12, 20, "FUEL COSTS ", -1
FUELSTR1:	.byte	12, 21, "PER UNIT...", -1

FUELSTR2:	.byte	12, 20, " SKIMMING FUEL", 0
		.byte		" FROM PLANET!!", -1

FUELSTR4:	.byte	12, 25, "  FUEL USE:", -1

NO_FUEL2:	.byte	12, 25, "NOT ENOUGH FUEL!", -1

NOMONEY0:	.byte	12, 21, "COME BACK WHEN", 0
		.byte		"YOU HAVE MORE", 0
		.byte		"MONEY!", -1

THANKS0:	.byte	12, 21, "THANK YOU,", 0
		.byte		"COME AGAIN!", -1

PRICESTR:	.byte	13, 25, "PRICE =      CR", -1

DEST_STR:	.byte	14, 20, "DESTINATION:", -1

GAL_STR:	.byte	12, 20, "WARP TO:", 0
		.byte		" CURRENT GALAXY", 0
PRAD_STR:	.byte	        " P*RADIKUS", -1

SECT_STR:	.byte	12, 21, "SECTOR", -1
SYS_STR:	.byte	21, 21, "SYSTEM", -1

SOL_SYS:	.byte	15, 24, "SOLAR SYSTEMS", -1
PLNTSTR:	.byte	16, 24, " PLANETS    ", -1

SCAN1STR:	.byte	16, 23, "SCANNING", -1
WARP2STR:	.byte	14, 21, " COMPLETED! ", -1
WARP1STR:	.byte	14, 21, "INITIATED...", -1
WARP0STR:	.byte	18, 20, "WARP", -1

SHLD_UP0:	.byte	12, 20, "SHIELD IS UP", 0
		.byte		"CANNOT LAND!", -1

NO_WARP0:	.byte	12, 21, "DRIVE BROKEN", 0
		.byte		"CANNOT WARP!", -1

BUY_STR:	.byte	2, 20, "PURCHASE", 0
		.byte	       " FUEL   ", 0
		.byte	       " ARMOR  ", -1
BUY_STR2:	.byte	2, 23, " WEAPON ", 0
		.byte	       " SPECIAL", 0
		.byte	       " SHIP   ", -1

DRV_0B:		.byte	3, 20, "DRIVES", 0
		.byte	       "POWER ", 0
		.byte	       "SHIELD", -1

TYPE_1:		.byte	13, 22, "TYPE 1 ", -1
TYPE_2:		.byte	13, 23, "TYPE 2 ", -1
TYPE_3:		.byte	13, 24, "TYPE 3 ", -1
TYPE_4:		.byte	13, 25, "TYPE 4 ", -1
TYPE_5:		.byte	13, 26, "TYPE 5 ", -1

DRV_0:		.byte	3, 20, "DRIVE", -1
PWR_0:		.byte	3, 20, "PWR PLNT", -1
SHLD_0:		.byte	3, 20, "SHIELD", -1

WARP_STR:	.byte	3, 20, "WARP   ", 0
		.byte	       "MAP    ", 0
		.byte	       "SCAN   ", 0
EQUIPSTR:	.byte	       "EQUIP  ", 0
		.byte	       "MISSION", 0	
		.byte	       "EXIT   ", -1

SKIM_STR:	.byte	3, 20, "REFUEL ", -1
MAIN_STR:	.byte	3, 21, "MAIN   ", -1
LAND_STR:	.byte	3, 20, "LAND   ", -1
LEAVESTR:	.byte	3, 20, "LEAVE  ", -1

DRV_STR:	.byte	12, 12, "DRIVE/ENGINE -", 0
		.byte		"POWER PLANT  -", 0
		.byte		"SHIELD GEN.  -", -1

FUEL_STR:	.byte	12, 16, "FUEL UNITS   -", 0
		.byte	        "ARMOR POINTS -", -1

CLOAKSTR:	.byte	 0,  0, "CLOAKING DEV", -1
MINE_STR:	.byte	13, 22, "MINES       ", -1
MISL_STR:	.byte	13, 22, "MISSILES    ", -1
WAVE_STR:	.byte 	13, 22, "EMP WAVE    ", -1
BOLT_STR:	.byte	13, 22, "THUNDERBOLT ", -1
FREEMSTR:	.byte	13, 22, "THE TOSON DRIVE", -1
CLOAK_PI:	.byte	13, 22, "CLOAKING DEVICE", -1
CAP_STR:	.byte	13, 22, "MESSAGE CAPSULE", -1
NW_STR:		.byte	0, 0, "   NO WEAPON! ", -1
CAN_STR:	.byte	0, 0, "     CANNON   ", -1
AC_STR:		.byte	0, 0, " ATOMIC CANNON", -1
LLSR_STR:	.byte	0, 0, "  LIGHT LASER ", -1
HLSR_STR:	.byte	0, 0, "  HEAVY LASER ", -1

CANNON_09:	.byte	13, 22, "CANNON       ", -1
ACAN_09:	.byte	13, 22, "ATOMIC CANNON", -1
LLASER09:	.byte	13, 22, "LIGHT LASER  ", -1
HLASER09:	.byte	13, 22, "HEAVY LASER  ", -1



WPNNAMEH:
	.byte	NW_STR >>8, CAN_STR >>8, AC_STR >>8, LLSR_STR >>8, HLSR_STR >>8
WPNNAMEL:
	.byte	NW_STR & $FF, CAN_STR & $FF, AC_STR & $FF, LLSR_STR & $FF, HLSR_STR & $FF

;;W2_NAMEH:
;;	.byte	NW_STR >>8, CLOAKSTR >>8, MINE_STR >>8, MISL_STR >>8
;;	.byte	WAVE_STR >>8, BOLT_STR >>8
;;W2_NAMEL:
;;	.byte	NW_STR & $FF, CLOAKSTR & $FF, MINE_STR & $FF, MISL_STR & $FF
;;	.byte	WAVE_STR & $FF, BOLT_STR & $FF
;;

COMP_00:
	LDA	#0
	STA	EXPL_X
C00_0:
	LDX	#<(WARP_STR)
	LDY	#>(WARP_STR)
	JSR	DOPRINT


	LDA	#$AA		;WARP
	STA	ARDAT0
	LDA	#$B2		;MAP
	STA	ARDAT1
	LDA	#$BA		;SCAN
	STA	ARDAT2
	LDA	#$C2		;EQUIP
	STA	ARDAT3
	LDA	#$CA		;MISSION
	STA	ARDAT4
	LDA	#$D2		;EXIT
	STA	ARDAT5
	LDA	#$FF 		;--end
	STA	ARDAT6

	LDA	#$16
	STA	CX
	LDA	#0
	LDY	EXPL_X
	JSR	ARROW
	BMI	C00_END

	STA	EXPL_X

	LDY	#$80
	JSR	ZAP_SPRITES
	JSR	REM_POS
	LDA	EXPL_X

	BNE	C00_A
	JSR	COMP_01		;0 = warp
	JMP	C00_E
C00_A:
	CMP	#1
	BNE	C00_B
	JSR	COMP_04	       	;1 = map
	JMP	C00_E
C00_B:
	CMP	#2
	BNE	C00_C
				;2 = scan
	LDA	ORBIT
	BEQ	C00_E
	JSR	COMP_05
	JMP	C00_E
C00_C:
	CMP	#3
	BNE	C00_D
	JSR	COMP_10	  	;3 = equip
	JMP	C00_E

C00_D:		CMP	#4
		BNE	C00_END
		JSR	COMP_MISSION	;4 = mission
		
C00_E:		BMI	C00_END
		JSR	DISPCOMP
		JMP	C00_0

C00_END:	RTS




MSSN_HDR:	.byte	14,  1, "HEADQUARTERS:", -1
MORE_LBL:	.byte	16, 17,  $1F, " = MORE", -1
ERASE_LBL:	.byte	16, 17,      "        ", -1

CW_MSSN:    	LDY	#2
		
CW_M2:		TYA
		PHA

		JSR	VR_WAIT
		JSR	KILL_VID
		JSR	DMAXFER

		PLA
		TAY
		LDA	Vid_Reset
		LDA	LNADDRH, Y
		STA	VID_PTR
		LDA	LNADDRL, Y
		CLC
		ADC	#12
		STA	VID_PTR

		LDA	#$FA
		LDX	#16
		JSR	DRAW_BAR

		JSR	SET_VID
		INY
		CPY	#18
		BNE	CW_M2

		RTS


COMP_MISSION:	JSR	REMARROW
		JSR	CW_2
		JSR	CW_3
		LDX	#<(MSSN_HDR)
		LDY	#>(MSSN_HDR)
		JSR	DOPRINT

;;;;;
		LDA	GOAL0
		CMP	#-1
		BNE	CHK1
		JMP	CHK1NO

CHK1:		LDA	MISSION
		CMP	#1
		BNE	CHK1NO

;complete if DRIVE > 1 and SHLDTYPE > 1

		LDA	DRIVE
		CMP	#2
		BCC	CHK1NO
		LDA	SHLDTYPE
		CMP	#2
		BCC	CHK1NO

		LDA	#$FF
		STA	GOAL0
		STA	GOAL1
CHK1NO:		

;;;;;
		
		LDA	GOAL0
		CMP	#$FF
		BNE	WHICHMISSION		;display mission

;current mission is complete...
;check to see if player is at homeworld

		LDY	ORBIT
		BEQ	SHOWHOME

		LDA	GALAXY_X
		CLC
		ADC	#1
		CMP	HOMELOC+ 0
		BNE	SHOWHOME
		LDA	GALAXY_Y
		CLC
		ADC	#1
		CMP	HOMELOC+ 1
		BNE	SHOWHOME
		LDA	SECTOR_X
		CMP	HOMELOC+ 2
		BNE	SHOWHOME
		LDA	SECTOR_Y
		CMP	HOMELOC+ 3
		BNE	SHOWHOME
		LDA	XPOS
		CLC
		ADC	#1
		CMP	HOMELOC+ 4
		BNE	SHOWHOME
		LDA	YPOS
		CLC
		ADC	#1
		CMP	HOMELOC+ 5
		BNE	SHOWHOME

		LDA	#$00
		STA	GOAL0
		STA	MS_FLAG
		INC	MISSION
		JMP	WHICHMISSION		;display the new mission

SHOWHOME:	JSR	DOMSSN0
		LDY	#0
		JMP	SHOWLOC

WHICHMISSION:	LDA	MISSION
		CMP	#1
		BNE	WHC2
		JMP	DOMSSN1
WHC2:		CMP	#2
		BNE	WHC3
		JMP	DOMSSN2
WHC3:		CMP	#3
		BNE	WHC4
		JMP	DOMSSN3
WHC4:		CMP	#4
		BNE	WHC5
		JMP	DOMSSN4
WHC5:		CMP	#5
		BNE	WHC6
		JMP	DOMSSN5
WHC6:		CMP	#6
		BNE	WHC7
		JMP	DOMSSN6
WHC7:		CMP	#7
		BNE	WHC8
		JMP	DOMSSN7
WHC8:		JMP	DOMSSN8


MTXTLOC:	.byte	15, 20, "-- GOAL --", -1    	
MTXTSECT:	.byte	12, 21, "SECTOR", -1
MTXTSYST:	.byte	21, 21, "SYSTEM", -1
MTXTDEST:	.byte	14, 24, "DESTINATION:", -1

SHOWLOC:	LDA	HOMELOC+ 0, Y	;galaxy-x
		CMP	#-1
		BNE	SHOWOK
		JMP	SHOWEND

SHOWOK:		TYA
		PHA
		LDX	#<(MTXTSECT)
		LDY	#>(MTXTSECT)
		JSR	DOPRINT
		JSR	VR_WAIT
		JSR	KILL_VID
		JSR	DMAXFER
		PLA	
		TAY
		LDA	Vid_Reset
		LDA	LNADDRH+22
		STA	VID_PTR
		LDA	LNADDRL+22
		CLC
		ADC	#12
		STA	VID_PTR
		LDA	#$08
		STA	VID_DATA
		LDA	HOMELOC+0, Y		
		JSR	DRAW_NUM
		LDA	#$0C		;","
		STA	VID_DATA
		LDA	HOMELOC+1, Y		
		JSR	DRAW_NUM
		LDA	#$09
		STA	VID_DATA
		JSR	SET_VID

		LDA	HOMELOC+ 2, Y	;sector-x
		CMP	#-1
		BNE	SHOWOK2
		JMP	SHOWEND

SHOWOK2:	TYA
		PHA
		LDX	#<(MTXTSYST)
		LDY	#>(MTXTSYST)
		JSR	DOPRINT
		JSR	VR_WAIT
		JSR	KILL_VID
		JSR	DMAXFER
		PLA	
		TAY
		LDA	LNADDRH+22
		STA	VID_PTR
		LDA	LNADDRL+22
		CLC
		ADC	#21
		STA	VID_PTR
		LDA	#$08
		STA	VID_DATA
		LDA	HOMELOC+2, Y		
		JSR	DRAW_NUM
		LDA	#$0C
		STA	VID_DATA
		LDA	HOMELOC+3, Y		
		JSR	DRAW_NUM
		LDA	#$09
		STA	VID_DATA
		JSR	SET_VID

		LDA	HOMELOC+ 4, Y	;pos-x
		CMP	#-1
		BEQ	SHOWEND

		TYA
		PHA
		LDX	#<(MTXTDEST)
		LDY	#>(MTXTDEST)
		JSR	DOPRINT
		JSR	VR_WAIT
		JSR	KILL_VID
		JSR	DMAXFER
		PLA	
		TAY
		LDA	LNADDRH+25
		STA	VID_PTR
		LDA	LNADDRL+25
		CLC
		ADC	#15
		STA	VID_PTR
		LDA	#$08
		STA	VID_DATA
		LDA	HOMELOC+4, Y		
		JSR	DRAWNUM3
		LDA	#$0C
		STA	VID_DATA
		LDA	HOMELOC+5, Y		
		JSR	DRAWNUM3
		LDA	#$09
		STA	VID_DATA
		JSR	SET_VID

SHOWEND:	LDA	#$00
		RTS



DO_MMORE:	LDX	#<(MORE_LBL)
		LDY	#>(MORE_LBL)
		JSR	DOPRINT
		JSR	J_DELAY
		PHA
		LDX	#<(ERASE_LBL)
		LDY	#>(ERASE_LBL)
		JSR	DOPRINT
		PLA
		RTS

DOMSSN0:	LDX	#<(MTXT0)
		LDY	#>(MTXT0)
		JSR	DOPRINT
		RTS

DOMSSN1:	LDA	#$FF
		STA	MS_FLAG

		LDX	#<(MTXT1)
		LDY	#>(MTXT1)
		JSR	DOPRINT
		JSR	DO_MMORE
		BMI	DOMSSN1X
		JSR	CW_MSSN
		LDX	#<(MTXT1A)
		LDY	#>(MTXT1A)
		JSR	DOPRINT
		LDY	#6
		JSR	SHOWLOC	
DOMSSN1X:	RTS

DOMSSN2:	LDA	MS_FLAG
		BNE	DM2SKIP
;give money
		LDA	#$01		;15,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG
	
DM2SKIP:	LDX	#<(MTXT2)
		LDY	#>(MTXT2)
		JSR	DOPRINT
		LDY	#12
		JSR	SHOWLOC	
		RTS

DOMSSN3:	LDA	MS_FLAG
		BNE	DM3SKIP
;give money
		LDA	#$03		;25,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG

DM3SKIP:	LDX	#<(MTXT3)
		LDY	#>(MTXT3)
		JSR	DOPRINT
		LDY	#18
		JSR	SHOWLOC	
		JSR	DO_MMORE
		BMI	DOMSSN3X
		JSR	CW_MSSN
		LDX	#<(MTXT3A)
		LDY	#>(MTXT3A)
		JSR	DOPRINT
DOMSSN3X:	RTS

DOMSSN4:	LDA	MS_FLAG
		BNE	DM4SKIP
;give money
		LDA	#$05		;35,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG

DM4SKIP:	LDX	#<(MTXT4)
		LDY	#>(MTXT4)
		JSR	DOPRINT
		LDY	#24
		JSR	SHOWLOC	
		RTS

DOMSSN5:	LDA	MS_FLAG
		BNE	DM5SKIP
;give money
		LDA	#$08		;50,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG

DM5SKIP:	LDX	#<(MTXT5)
		LDY	#>(MTXT5)
		JSR	DOPRINT
		LDY	#30
		JSR	SHOWLOC	
		JSR	DO_MMORE
		BMI	DOMSSN5X
		JSR	CW_MSSN
		LDX	#<(MTXT5A)
		LDY	#>(MTXT5A)
		JSR	DOPRINT
DOMSSN5X:      ;;	JSR	DISPCOMP
		RTS

DOMSSN6:	LDA	MS_FLAG
		BNE	DM6SKIP
;give money
		LDA	#$08		;50,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG

DM6SKIP:	LDX	#<(MTXT6)
		LDY	#>(MTXT6)
		JSR	DOPRINT
		JSR	DO_MMORE
		BMI	DOMSSN6X
		JSR	CW_MSSN
		LDX	#<(MTXT6A)
		LDY	#>(MTXT6A)
		JSR	DOPRINT
		LDY	#36
		JSR	SHOWLOC	
DOMSSN6X:     ;;	JSR	DISPCOMP
		RTS

DOMSSN7:	LDA	MS_FLAG
		BNE	DM7SKIP
;give money
		LDA	#$08		;50,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG

DM7SKIP:	LDX	#<(MTXT7)
		LDY	#>(MTXT7)
		JSR	DOPRINT
		LDY	#42
		JSR	SHOWLOC	
	      ;;	JSR	DISPCOMP
		RTS

DOMSSN8:	LDA	#99
		STA	THUNDER
		LDA	MS_FLAG
		BNE	DM8SKIP
;give money
		LDA	#$0E		;100,000
		JSR	ADDSCORE
		LDA	#$FF
		STA	MS_FLAG

DM8SKIP:	LDX	#<(MTXT8)
		LDY	#>(MTXT8)
		JSR	DOPRINT
		JSR	DO_MMORE
		BMI	DOMSSN8X
		JSR	CW_MSSN
		LDX	#<(MTXT8A)
		LDY	#>(MTXT8A)
		JSR	DOPRINT
		JSR	DO_MMORE
		BMI	DOMSSN8X
		JSR	CW_MSSN
		LDX	#<(MTXT8B)
		LDY	#>(MTXT8B)
		JSR	DOPRINT
		JSR	DO_MMORE
		BMI	DOMSSN8X
		JSR	CW_MSSN
		LDX	#<(MTXT8C)
		LDY	#>(MTXT8C)
		JSR	DOPRINT
DOMSSN8X:     ;;	JSR	DISPCOMP
		RTS
		
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!

J_DELAY:	JSR	JSTICK1		
		LDA	J1CHG
		AND	#(A_BTN + SELECT)
		BEQ	J_DELAY

		LDX	#0
		AND	#SELECT
		BEQ	J_DONE
	       	LDX	#-1		;select was pressed...

;return if joystick activity

J_DONE:		TXA
		RTS

;
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!

COMP_01:
	LDA	BKGRND
	BEQ	C01_A
	JMP	C01_OK
C01_A:
	LDA	DRIVE
	CMP	#6
	BNE	C01_C
	LDA	PRADIKUS
	BEQ	C01_A0
	JSR	CW_3

	LDX	#<(NO_WARP0)
	LDY	#>(NO_WARP0)
	JSR	DOPRINT

	JMP	C01_OK
C01_A0:
	JSR	CW_1
	JSR	CW_2
	JSR	CW_3
	JSR	DRAW_GAL

	LDX	#<(GAL_STR)
	LDY	#>(GAL_STR)
	JSR	DOPRINT

	LDA	#$66
	STA	TX
	LDA	#$B2
	STA	TY
	JSR	C05_COM
	PHA
	JSR	CW_3
	PLA
	BEQ	C01_C
	CMP	#1
	BEQ	C01_B
	LDA	#$FF
	RTS
C01_B:
	JMP	PRADWARP

C01_C:
	JSR	CW_2
	JSR	DRAW_GAL
	JSR	CW_3
	LDX	#<(DEST_STR)
	LDY	#>(DEST_STR)
	JSR	DOPRINT

	LDX	#<(SECT_STR)
	LDY	#>(SECT_STR)
	JSR	DOPRINT

	LDX	#<(SYS_STR)
	LDY	#>(SYS_STR)
	JSR	DOPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+22
	STA	VID_PTR
	LDA	#$15
	CLC
	ADC	LNADDRL+22
	STA	VID_PTR
	LDA	#$08		;[
	STA	VID_DATA
	LDA	SECTOR_X
	JSR	DRAW_NUM
	LDA	#$0C		;=
	STA	VID_DATA
	LDA	SECTOR_Y
	JSR	DRAW_NUM
	LDA	#$09		;]
	STA	VID_DATA
	JSR	DMAXFER
	JSR	SET_VID
	LDA	GALAXY_X
	JSR	GAL_OFF
	STA	CURSORX
	LDA	GALAXY_Y
	JSR	GAL_OFF
	STA	CURSORY
	JSR	M2_CURSR
	LDA	CURSORX
	CLC
	ADC	#$6D
	STA	SPRTBL0+3
	STA	SPRTBL1+3
	LDA	CURSORY
	CLC
	ADC	#$1D
	STA	SPRTBL0
	STA	SPRTBL1
	LDA	#$BC		;sm. ship char.
	STA	SPRTBL0+1
	STA	SPRTBL1+1
	LDA	#2		;palette
	STA	SPRTBL0+2
	STA	SPRTBL1+2
	JSR	MOVE_2
	BMI	C01_END
	BEQ	C01_OK
	LDA	CX
	STA	DEST_GX
	LDA	CY
	STA	DEST_GY

	JSR	GETSECTOR
	JMP	COMP_02
C01_OK:
	LDA	#1
	RTS
C01_END:
	LDA	#$FF
	RTS

GAL_OFF:
	CLC
	ASL	A
	ASL	A
	ASL	A
	ASL	A
	RTS

SECT_OFF:
	SEC		 
	SBC	#1
	CLC
	ASL	A
	ASL	A
	ASL	A
	RTS

COMP_02:
	JSR	CW_2
	JSR	STAR_W2
	JSR	DRSECTMAP

	LDY	#1
	STY	CRSR_I
	LDA	(GAL_PTRL),Y
	JSR	SECT_OFF
	STA	CURSORX
	INY
	LDA	(GAL_PTRL),Y
	JSR	SECT_OFF
	STA	CURSORY
	JSR	M1_CURSR	;COMP_02 IMBEDDED IN COMP_01
	JSR	REM_POS
	LDA	GALAXY_X
	CMP	DEST_GX
	BNE	C02_A0
	LDA	GALAXY_Y
	CMP	DEST_GY
	BNE	C02_A0
	LDA	SECTOR_X
	JSR	SECT_OFF
	CLC
	ADC	#$68
	STA	SPRTBL0+3
	STA	SPRTBL1+3
	LDA	SECTOR_Y
	JSR	SECT_OFF
	CLC
	ADC	#$19
	STA	SPRTBL0
	STA	SPRTBL1
	JSR	POS_CHAR
C02_A0:
	JSR	MOVE_1
	BMI	C01_END
	BNE	C02_A
	JMP	COMP_01
C02_A:
	LDA	CX
	STA	DEST_SX
	LDA	CY
	STA	DEST_SY

COMP_03:	;do the warp...

	JSR	CW_3

	LDX	#<(WARP0STR)
	LDY	#>(WARP0STR)
	JSR	DOPRINT		;"WARP"

	LDY	#>(WARP1STR)
	LDX	#<(WARP1STR)
	JSR	DOPRINT		;"INITIATED..."

	LDA	DEST_GX
	STA	GALAXY_X
	LDA	DEST_GY
	STA	GALAXY_Y
	LDA	DEST_SX
	STA	SECTOR_X
		STA	CX
	LDA	DEST_SY
	STA	SECTOR_Y
		STA	CY

	JSR	NEWSYSTEM

;set new position in solar system...somewhere near the middle

		JSR	RANDOM
		AND	#$3F
		CLC
		ADC	#$20	;make $20..5F (or 32..95)
		STA	XPOS
		
		JSR	RANDOM
		AND	#$3F
		CLC
		ADC	#$20	;make $20..5F (or 32..95)
		STA	YPOS

		LDA	FUEL	
		SEC
		SBC	FUELUSED
		STA	FUEL
	
		JSR	DISPCOMP
	
		LDY	#8
		JSR	BIGDELAY
	
		LDX	#<(WARP2STR)	
		LDY	#>(WARP2STR)
		JSR	DOPRINT		;"COMPLETED..."

		LDX	#<(SCAN1STR)
		LDY	#>(SCAN1STR)
		JSR	DOPRINT

		LDY	#>(SYS_STR)
		LDX	#<(SYS_STR)
		LDA	#17
		STA	TX
		LDA	#24
		STA	TY
		JSR	XYPRINT
	
		LDA	#$FF
		STA	WARP
	
		LDY	#8
		JSR	BIGDELAY
	
		LDA	SYSTEM+1	;x pos of 1st item in system
		STA	DEST_X
		LDA	SYSTEM+2	;y pos of 1st item...
		STA	DEST_Y
	
		JSR	STOPSHIP
		JSR	GETORBIT
	
COMP_04:
	JSR	CW_2
	LDA	BKGRND
	BEQ	C04_A
	SEC
	SBC	#$7F
	TAY
	JSR	DRAWPLNT
	JMP	C04_END
C04_A:
	JSR	CW_3
	JSR	STAR_W2
	JSR	DRSYSMAP
	JSR	SYS_POS

	LDY	#>(SECT_STR)
	LDX	#<(SECT_STR)
	LDA	#12
	STA	TX
	LDA	#20
	STA	TY
	JSR	XYPRINT

	LDX	#<(SYS_STR)
	LDY	#>(SYS_STR)
	LDA	#21
	STA	TX
	LDA	#20
	STA	TY
	JSR	XYPRINT

	LDA	#23
	STA	TY
	LDA	#14
	STA	TX
	LDX	#<(DEST_STR)
	LDY	#>(DEST_STR)
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+21
	STA	VID_PTR
	LDA	#$0C
	CLC
	ADC	LNADDRL+21
	STA	VID_PTR
	LDA	#$08
	STA	VID_DATA
	LDA	GALAXY_X
	CLC
	ADC	#1
	JSR	DRAW_NUM
	LDA	#$0C
	STA	VID_DATA
	LDA	GALAXY_Y
	CLC
	ADC	#1
	JSR	DRAW_NUM
	LDA	#$09
	STA	VID_DATA
	LDA	LNADDRH+21
	STA	VID_PTR
	LDA	#$15
	CLC
	ADC	LNADDRL+21
	STA	VID_PTR
	LDA	#$08
	STA	VID_DATA
	LDA	SECTOR_X
	JSR	DRAW_NUM
	LDA	#$0C
	STA	VID_DATA
	LDA	SECTOR_Y
	JSR	DRAW_NUM
	LDA	#$09
	STA	VID_DATA
	JSR	DMAXFER
	JSR	SET_VID
	LDY	#1
	STY	CRSR_I		;START IT AT THE FIRST ENTRY IN THE SYSTEM
	JSR	SKIPDEAD
	LDA	SYSTEM+0,Y	;Y points to x pos. byte
	STA	CURSORX
	LDA	SYSTEM+1,Y	;y pos.
	STA	CURSORY
	JSR	M1S_CRSR
	JSR	MOVE_1SS
	BMI	C04_FLS
	BEQ	C04_END
	LDA	CX
	STA	DEST_X
	LDA	CY
	STA	DEST_Y
C04_END:
	LDA	#1
	RTS
C04_FLS:
	LDA	#$FF
	RTS




COMP_05:
	LDA	ORBIT
	BEQ	C05_000
	LDA	BKGRND
	BEQ	C05_00
	JMP	C05_D		;on a planet/station...

C05_000:
	LDA	#1		;not "orbiting" anything...
	RTS

;in orbit

C05_00:
	JSR	CW_1
	JSR	CW_2
	JSR	CW_3
	JSR	STAR_W2
	JSR	SCAN
	LDY	ORBIT 		;points to x pos. byte
	LDA	SYSTEM+2,Y
	AND	#$70		;get type/pal...
	CMP	#$30		;sun?
	BEQ	C05_END		;(yes)

;non-sun

C05_0:
	LDA	SYSTEM+3,Y	;data bits
	AND	#INHAB
	BNE	C05_A
	LDA	SYSTEM+2, Y	;type/pal byte
	AND	#$70
	BEQ	C05_END		;space station!
	JMP	C05_C
C05_A:
	LDX	#<(LAND_STR)
	LDY	#>(LAND_STR)	
	JSR	DOPRINT

	LDX	#<(MAIN_STR)
	LDY	#>(MAIN_STR)	
	JSR	DOPRINT

	LDA	#$16
	STA	TX
	LDA	#$AA
	STA	TY
	JSR	C05_COM
	CMP	#$FF
	BEQ	C05_EXIT
	CMP	#0
	BNE	C05_END
	LDY	ORBIT
	LDA	SYSTEM+3,Y	;data bits
	AND	#FRNDLY

	BEQ	C05_B
	JSR	STOPSHIP
	JSR	COMP_06
	BMI	C05_EXIT
	JSR	CW_1
	JSR	CW_2
	JSR	CW_3
	JSR	SCAN
	JMP	C05_A


;enemy planet

C05_B:
	JSR	CHK_LAND
	BEQ	C05_END
	JSR	LANDPLNT
	JMP	C05_EXIT


C05_END:
	LDA	#1
	RTS


C05_EXIT:		;select was hit/or just landed on enemy
	LDA	#$FF
	RTS


;uninhabited

C05_C:
	LDY	ORBIT
	LDA	SYSTEM+3,Y	;data bits
	AND	#GAS
	BEQ	C05_END
	JSR	STOPSHIP

	LDX	#<(SKIM_STR)
	LDY	#>(SKIM_STR)
	JSR	DOPRINT

	LDX	#<(MAIN_STR)
	LDY	#>(MAIN_STR)	
	JSR	DOPRINT

	LDA	#$16
	STA	TX
	LDA	#$AA
	STA	TY
	JSR	C05_COM
	CMP	#$FF
	BEQ	C05_EXIT
	CMP	#0
	BNE	C05_END
	JSR	COMP_0C
	JMP	C05_END

;already landed!

C05_D:
	JSR	CW_1
	JSR	COMP_04

	LDX	#<(LEAVESTR)
	LDY	#>(LEAVESTR)
	JSR	DOPRINT

	LDX	#<(MAIN_STR)
	LDY	#>(MAIN_STR)
	JSR	DOPRINT

	LDA	#$16
	STA	TX
	LDA	#$AA
	STA	TY
	JSR	C05_COM
	BEQ	C05_E
	CMP	#$FF
	BEQ	C05_EX0
	JMP	C05_END
C05_E:
	JMP	LV_ORB
C05_EX0:
	JMP	C05_EXIT
C05_COM:
	LDA	#$BD
	STA	SPRTBL0+ $F9
	STA	SPRTBL1+ $F9
	LDA	#$DD
	STA	SPRTBL0+ $FD
	STA	SPRTBL1+ $FD
	LDA	TY
	STA	SPRTBL0+ $F8
	STA	SPRTBL1+ $F8
	CLC
	ADC	#8
	STA	SPRTBL0+ $FC
	STA	SPRTBL1+ $FC
	LDA	TX
	STA	SPRTBL0+ $FB
	STA	SPRTBL1+ $FB
	STA	SPRTBL0+ $FF
	STA	SPRTBL1+ $FF
	LDA	#1
	STA	SPRTBL0+ $FA
	STA	SPRTBL1+ $FA
	STA	SPRTBL0+ $FE
	STA	SPRTBL1+ $FE
C05_COM0:
	JSR	VR_WAIT
	JSR	DMAXFER
	JSR	JSTICK1
	LDA	J1CHG
	AND	#SELECT
	BNE	C05_EX0
	LDA	J1CHG
	AND	#B_BTN
	BEQ	C05_COM1
	JSR	C05_COM2
	JSR	CW_1
	LDA	#1
	RTS
C05_COM1:
	LDA	J1CHG
	AND	#A_BTN
	BEQ	C05_COM0	
	JSR	C05_COM2
	JSR	CW_1
	LDA	#0
	RTS

C05_COM2:
	LDA	#$F8
	STA	SPRTBL0+ $F8
	STA	SPRTBL1+ $F8
	STA	SPRTBL0+ $FC
	STA	SPRTBL1+ $FC
	RTS

COMP_06:
	LDA	#0
	STA	EXPL_Y
	LDY	#$80
	JSR	ZAP_SPRITES
	JSR	INVEN
	JSR	CW_1
	JSR	CW_3
C06_A:
	LDX	#<(BUY_STR)
	LDY	#>(BUY_STR)
	JSR	DOPRINT

	LDX	#<(BUY_STR2)
	LDY	#>(BUY_STR2)
	JSR	DOPRINT

	LDA	#$B2
	STA	ARDAT0
	LDA	#$BA
	STA	ARDAT1
	LDA	#$C2
	STA	ARDAT2
	LDA	#$CA
	STA	ARDAT3
	LDA	#$D2
	STA	ARDAT4
	LDA	#$FF
	STA	ARDAT5
	LDA	#$16
	STA	CX
	LDA	#0
	LDY	EXPL_Y
	JSR	ARROW
	CMP	#$FF
	BEQ	C06_EXIT
	CMP	#$80
	BEQ	C06_END
	STA	EXPL_Y
	CMP	#0
	BNE	C06_B
	LDA	#$FF
	STA	CRDT_Y
	JSR	COMP_07
	PHA
	JSR	INV_3
	PLA
	JMP	C06_F
C06_B:
	CMP	#1
	BNE	C06_C
	LDA	#$FF
	STA	CRDT_Y
	JSR	COMP_08
	PHA
	JSR	INV_3
	PLA
	JMP	C06_F
C06_C:
	CMP	#2
	BNE	C06_D
	LDA	WPN1
	CLC
	ADC	#16	;BASE OFFSET FOR A WEAPON INTO CREDIT TABLE
	STA	CRDT_Y
	JSR	COMP_09
	PHA
	JSR	INV_1
	JSR	DISPCOMP
	PLA
	JMP	C06_F
C06_D:
	CMP	#3
	BNE	C06_E
	LDA	#$FF
	STA	CRDT_Y
	JSR	COMP_0A
	PHA
	JSR	INV_2
	JSR	DISPCOMP
	PLA
	JMP	C06_F
C06_E:
	CMP	#4
	BNE	C06_F
	JSR	COMP_0B
	PHA
	JSR	INV_3
	JSR	DISPCOMP
	PLA
C06_F:
	BMI	C06_EXIT
	JMP	C06_A
C06_END:
	LDA	#1
	RTS
C06_EXIT:
	LDA	#$FF
	RTS

COMP_07:
	JSR	REMARROW
	JSR	CW_3
	LDA	FUEL
	CMP	#99
	BCS	C06_END				;;;extra
C07_A:
	LDA	#$20
	JSR	GETCOST
	JSR	C07_COST

	LDX	#<(FUELSTR0)
	LDY	#>(FUELSTR0)
	JSR	DOPRINT

	LDX	#<(FUELSTR1)
	LDY	#>(FUELSTR1)
	JSR	DOPRINT

C07_B:
	JSR	DISPCOMP
	JSR	INV_3
	JSR	JSTICK1
	LDA	J1CHG
	AND	#SELECT
	BNE	C07_EXIT
	LDA	J1CHG
	AND	#B_BTN
	BEQ	C07_C
C07_B1:
	JSR	CW_3
	JSR	REMPRICE
		LDA	#$00
		STA	 $4015	;KILL SOUND
	LDA	#1
	RTS
C07_EXIT:
		LDA	#$00
		STA	 $4015 	;KILL SOUND
	LDA	#$FF
	RTS
C07_C:
	LDA	FUEL
	CMP	#99
	BCS	C07_B1
	LDA	J1VAL
	AND	#A_BTN
	BEQ	C07_B
	TAY
	JSR	BUYITEM
	TYA
	BEQ	C07_D
	INC 	FUEL
		LDA	#$C1
		STA	 $4000
		LDA	#$C9
		STA	 $4001
		LDA	#$69
		STA	 $4002
		LDA	#$98
		STA	 $4003
		LDA	#$01
		STA	 $4015
	JMP	C07_B

C07_D:	JSR	REMPRICE
	JSR	CW_3

	LDX	#<(NOMONEY0)
	LDY	#>(NOMONEY0)
	JSR	DOPRINT

		LDA	#$00
		STA	 $4015	;KILL SOUND
	LDA	#1
	RTS

C07_E:	JSR	REMPRICE
	JSR	CW_3

	LDX	#<(THANKS0)
	LDY	#>(THANKS0)
	JSR	DOPRINT

		LDA	#$00
		STA	 $4015	;KILL SOUND
	LDA	#1
	RTS

C07_COST:
	LDA	#$AA
	STA	COSTSPR0+12
	STA	COSTSPR0+16
	STA	COSTSPR0+20
	STA	COSTSPR1+12
	STA	COSTSPR1+16
	STA	COSTSPR1+20
	LDA	#$C6
	STA	COSTSPR0+15
	STA	COSTSPR1+15
	LDA	#$CE
	STA	COSTSPR0+19
	STA	COSTSPR1+19
	LDA	#$D6
	STA	COSTSPR0+23
	STA	COSTSPR1+23
	RTS

COMP_08:
	JSR	REMARROW
	JSR	CW_3
	LDA	ARMOR
	CMP	#99
	BCS	C08_END
	LDA	#$1F
	JSR	GETCOST
	JSR	C07_COST

	LDX	#<(ARMRSTR0)
	LDY	#>(ARMRSTR0)
	JSR	DOPRINT

	LDX	#<(FUELSTR1)
	LDY	#>(FUELSTR1)
	JSR	DOPRINT
C08_A:
	JSR	DISPCOMP
	JSR	INV_3
	JSR	JSTICK1
	LDA	J1CHG
	AND	#SELECT
	BEQ	C08_A0
	LDA	#$FF
		LDA	#$00
		STA	 $4015	;KILL SOUND
	RTS
C08_A0:
	LDA	J1CHG
	AND	#B_BTN
	BEQ	C08_C
C08_B:
	JSR	CW_3
	JSR	REMPRICE
C08_END:
	LDA	#0
		LDA	#$00
		STA	 $4015	;KILL SOUND
	RTS
C08_C:
	LDA	ARMOR
	CMP	#99
	BCS	C08_B
	LDA	J1VAL
	AND	#A_BTN
	BEQ	C08_A
	TAY
	JSR	BUYITEM
	TYA
	BNE	C08_D
	JMP	C07_D
C08_D:
	INC 	ARMOR
		LDA	#$C1
		STA	 $4000
		LDA	#$C9
		STA	 $4001
		LDA	#$69
		STA	 $4002
		LDA	#$98
		STA	 $4003
		LDA	#$01
		STA	 $4015
	JMP	C08_A

COMP_09:
	JSR	CW_3
	LDY	#4
	JSR	CLRARDAT
	JSR	C09_MENU
	BEQ	C09_END
	LDA	#$20
	LDY	#0
	JSR	ARROW
	BMI	C09_END
	STA	LOGIC_TEMP
	TAY
	JSR	BUYITEM
	TYA
	BNE	C09_A
	JMP	C07_D
C09_A:
	LDA	LOGIC_TEMP
	CLC
	ADC	#CANNON
	STA	WPN1
	JMP	C07_E
C09_END:
	CMP	#$FF
	BEQ	C09_EXIT
	JSR	CW_3
	JSR	REMPRICE
	LDA	#1
C09_EXIT:
	RTS

C09_MENU:
		LDA	#1
		STA	EXPL_A
	LDY	#20
	LDA	#$AA
	STA	LOGIC_TEMP
	LDA	#$21
	JSR	HASITEM
	BEQ	C09M_0
	TYA
	PHA
	STA	TY
	LDX	#<(CANNON_09)
	LDY	#>(CANNON_09)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT0
	CLC
	ADC	#8
	STA	LOGIC_TEMP
C09M_0:
	LDA	#$22
	JSR	HASITEM
	BEQ	C09M_1
	TYA
	PHA
	STA	TY
	LDX	#<(ACAN_09)
	LDY	#>(ACAN_09)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT1
	CLC
	ADC	#8
	STA	LOGIC_TEMP
C09M_1:
	LDA	#$23
	JSR	HASITEM
	BEQ	C09M_2

	TYA
	PHA
	STA	TY
	LDY	#>(LLASER09)
	LDX	#<(LLASER09)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT2
	CLC
	ADC	#8
	STA	LOGIC_TEMP
C09M_2:
	LDA	#$24
	JSR	HASITEM
	BEQ	C09M_3
	STY	TY
	LDX	#<(HLASER09)
	LDY	#>(HLASER09)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	LDA	LOGIC_TEMP
	STA	ARDAT3
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	
C09M_3:
	LDX	#<(PRICESTR)
	LDY	#>(PRICESTR)
		JSR	DOPRINT
		LDA	EXPL_A
	RTS
	
COMP_0A:
	LDA	#0
	STA	LOGIC_Y
C0A_A:
	JSR	CW_3
	LDY	#5
	JSR	CLRARDAT
	JSR	C0A_MENU
	BEQ	C0A_END
C0A_A0:
	LDY	LOGIC_Y
	LDA	#$24
	JSR	ARROW
	BMI	C0A_END
	STA	LOGIC_Y
	TAY
	LDA	CLOAK,Y
	CMP	#99
	BCS	C0A_A0
	TAY
	JSR	BUYITEM
	TYA
	BNE	C0A_B
	JMP	C07_D
C0A_END:
	CMP	#$FF
	BEQ	C0A_EXIT
	JSR	CW_3
	JSR	REMPRICE
	LDA	#1
C0A_EXIT:
	RTS
C0A_B:
	LDY	LOGIC_Y
	CPY	#4
	BEQ	C0A_C
	LDX	ITEM1CNT,Y
	DEX
	STX	ITEM1CNT,Y
	LDX	CLOAK,Y
	INX
	STX	CLOAK,Y
	JSR	DISPCOMP
	JSR	INV_2
	LDY	LOGIC_Y
	LDA	ITEM1CNT,Y
	BNE	C0A_D
	JMP	C0A_A
C0A_C:
	LDA	#99
	STA	CLOAK,Y
	JSR	DISPCOMP
	JSR	INV_2
	JMP	C0A_A
C0A_D:
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDY	LOGIC_Y
	LDA	ARDAT0,Y
	SEC
	SBC	#$AA
	LSR	A
	LSR	A
	LSR	A
	TAX
	LDA	LNADDRH+20,X
	STA	VID_PTR
	LDA	#$1A
	CLC
	ADC	LNADDRL+20,X
	STA	VID_PTR
	LDA	ITEM1CNT,Y
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	JMP	C0A_A0

C0A_MENU:
	LDY	#20
	LDA	#$AA
	STA	LOGIC_TEMP
	LDA	#0
	STA	EXPL_A
	LDA	#$25
	JSR	HASITEM
	BEQ	C0AM_A
	LDA	ITEM1CNT
	BEQ	C0AM_A
	TYA
	PHA
	STA	TY
	LDX	#<(CLOAKSTR)
	LDY	#>(CLOAKSTR)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	PHA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$19
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$0D
	STA	VID_DATA
	LDA	ITEM1CNT
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT0
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDA	#1
	STA	EXPL_A
C0AM_A:
	LDA	#$26
	JSR	HASITEM
	BEQ	C0AM_B
	LDA	ITEM2CNT
	BEQ	C0AM_B
	TYA
	PHA
	STA	TY
	LDY	#>(MINE_STR)
	LDX	#<(MINE_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	PHA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$19
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$0D
	STA	VID_DATA
	LDA	ITEM2CNT
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT1
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDA	#1
	STA	EXPL_A
C0AM_B:
	LDA	#$27
	JSR	HASITEM
	BEQ	C0AM_C
	LDA	ITEM3CNT
	BEQ	C0AM_C
	TYA
	PHA
	STA	TY
	LDX	#<(MISL_STR)
	LDY	#>(MISL_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	PHA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$19
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$0D
	STA	VID_DATA
	LDA	ITEM3CNT
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT2
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDA	#1
	STA	EXPL_A
C0AM_C:
	LDA	#$28
	JSR	HASITEM
	BEQ	C0AM_D
	LDA	ITEM4CNT
	BEQ	C0AM_D
	TYA
	PHA
	STA	TY
	LDX	#<(WAVE_STR)
	LDY	#>(WAVE_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	PHA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$19
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$0D
	STA	VID_DATA
	LDA	ITEM4CNT
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT3
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDA	#1
	STA	EXPL_A
C0AM_D:
	LDA	#$29
	JSR	HASITEM
	BEQ	C0AM_E
	TYA
	PHA
	STA	TY
	LDX	#<(BOLT_STR)
	LDY	#>(BOLT_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	PHA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$19
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$0D
	STA	VID_DATA
	LDA	#99
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	LDA	LOGIC_TEMP
	STA	ARDAT4
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDA	#1
	STA	EXPL_A
C0AM_E:
	JSR	C09M_3
	LDA	EXPL_A
	RTS
	
	
COMP_0B:
	JSR	CW_1
	LDA	#0
	STA	LOGIC_AY
	JSR	CW_3
C0B_A:
	LDY	#>(DRV_0B)
	LDX	#<(DRV_0B)
	JSR	DOPRINT

	LDA	#$AA
	STA	ARDAT0
	LDA	#$B2
	STA	ARDAT1
	LDA	#$BA
	STA	ARDAT2
	LDA	#$FF
	STA	ARDAT3
	LDA	#$16
	STA	CX
	LDA	#0
	LDY	LOGIC_AY
	JSR	ARROW
	BMI	C0B_END
	STA	LOGIC_AY
	BNE	C0B_B
	LDA	DRIVE
	CMP	#6
	BCC	C0B_A1
	LDA	#$FF
	JMP	C0B_A2
C0B_A1:
	SEC
	SBC	#1
C0B_A2:
	STA	CRDT_Y
	JSR	COMP_0D
	CMP	#$FF
	BEQ	C0B_EXIT
	JMP	C0B_D
C0B_B:
	CMP	#1
	BNE	C0B_C
	LDA	PWRPLANT
	CLC
	ADC	#4
	STA	CRDT_Y
	JSR	COMP_0E
	CMP	#$FF
	BEQ	C0B_EXIT
	JMP	C0B_D
C0B_C:
	CMP	#2
	BNE	C0B_D
	LDA	SHLDTYPE
	BNE	C0B_C1
	LDA	#$FF
	JMP	C0B_C2
C0B_C1:
	CLC
	ADC	#9
C0B_C2:
	STA	CRDT_Y
	JSR	COMP_0F
	CMP	#$FF
	BEQ	C0B_EXIT
C0B_D:
	JSR	INV_3
	JSR	DISPCOMP
	JMP	C0B_A
C0B_END:
	CMP	#$FF
	BEQ	C0B_EXIT
	JSR	REMARROW
	LDA	#1
C0B_EXIT:
	RTS

COMP_0C:
	JSR	CW_1
	JSR	CW_3
	LDA	FUEL
	CMP	#99
	BCC	C0C_0A
	LDA	#1
	RTS
C0C_0A:
	LDX	#<(FUELSTR2)
	LDY	#>(FUELSTR2)
	JSR	DOPRINT
C0C_B:
	JSR	DISPCOMP
C0C_C:
	LDA	FUEL
	CMP	#99
	BCS	C0C_D
	INC 	FUEL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; REFUEL SOUND (05/14/90)
	LDA	#$4F
	STA	 $4000
	LDA	#$87
	STA	 $4001
	LDA	#$FF
	SEC
	SBC	FUEL
	STA	 $4002
	LDA	#$78
	STA	 $4003
	LDA	#$01
	STA	 $4015


	JMP	C0C_B
C0C_D:
			LDA	#$00
			STA	 $4015
	LDY	#4
	JSR	BIGDELAY
	JSR	CW_3
	LDA	#1
	RTS

COMP_0D:
	JSR	CW_3
	LDY	#5
	JSR	CLRARDAT
	LDA	#>(DRV_0)
	STA	PTR2H
	LDA	#<(DRV_0)
	STA	PTR2L
	LDA	#$10
	STA	LOGIC_BY
	JSR	C0D_MENU
	BEQ	C0D_END
	LDA	#$0F
	LDY	#0
	JSR	ARROW
	BMI	C0D_END
	STA	LOGIC_TEMP
	TAY
	JSR	BUYITEM
	TYA
	BNE	C0D_A
	JMP	C07_D
C0D_A:
	JSR	C07_E
	LDA	LOGIC_TEMP
	CLC
	ADC	#1
	STA	DRIVE
	LDA	#1
	RTS
C0D_END:
	CMP	#$FF
	BEQ	C0D_EXIT
	JSR	CW_3
	JSR	REMPRICE
	LDA	#1
C0D_EXIT:
	RTS

C0D_MENU:
	LDY	#20
	LDA	#$AA
	STA	LOGIC_TEMP
	LDX	#0
	STX	EXPL_A
	LDA	LOGIC_BY
	JSR	HASITEM
	BEQ	C0DM_0
	STY	CY
	TYA
	PHA
	STA	TY
	LDY	#>(TYPE_1)
	LDX	#<(TYPE_1)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	WRITEOBJ
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT0
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
C0DM_0:
	LDA	#$01
	CLC
	ADC	LOGIC_BY
	JSR	HASITEM
	BEQ	C0DM_1
	STY	CY
	TYA
	PHA
	STA	TY
	LDX	#<(TYPE_2)
	LDY	#>(TYPE_2)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	WRITEOBJ
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT1
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
C0DM_1:
	LDA	#$02
	CLC
	ADC	LOGIC_BY
	JSR	HASITEM
	BEQ	C0DM_2
	STY	CY
	TYA
	PHA
	STA	TY
	LDX	#<(TYPE_3)
	LDY	#>(TYPE_3)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	WRITEOBJ
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT2
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
C0DM_2:
	LDA	#$03
	CLC
	ADC	LOGIC_BY
	JSR	HASITEM
	BEQ	C0DM_3
	STY	CY
	TYA
	PHA
	STA	TY
	LDX	#<(TYPE_4)
	LDY	#>(TYPE_4)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	WRITEOBJ
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT3
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
C0DM_3:
	LDA	#$04
	CLC
	ADC	LOGIC_BY
	JSR	HASITEM
	BEQ	C0DM_4
	STY	CY
	STY	TY
	LDY	#>(TYPE_5)
	LDX	#<(TYPE_5)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	JSR	WRITEOBJ
	LDA	LOGIC_TEMP
	STA	ARDAT4
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
C0DM_4:
	JSR	C09M_3
	LDA	EXPL_A
	RTS

WRITEOBJ:
	LDX	PTR2L
	LDY	PTR2H
	LDA	CY
	STA	TY
	LDA	#20
	STA	TX
	JMP	XYPRINT
	
COMP_0E:
	JSR	CW_3
	LDY	#5
	JSR	CLRARDAT
	LDA	#>(PWR_0)
	STA	PTR2H
	LDA	#<(PWR_0)
	STA	PTR2L
	LDA	#$15
	STA	LOGIC_BY
	JSR	C0D_MENU
	BEQ	C0E_END
	LDA	#$14
	LDY	#0
	JSR	ARROW
	BMI	C0E_END
	STA	LOGIC_TEMP
	TAY
	JSR	BUYITEM
	TYA
	BNE	C0E_A
	JMP	C07_D
C0E_A:
	JSR	C07_E
	LDA	LOGIC_TEMP
	CLC
	ADC	#1
	STA	PWRPLANT
	LDA	#1
	RTS
C0E_END:
	CMP	#$FF
	BEQ	C0E_EXIT
	JSR	CW_3
	JSR	REMPRICE
	LDA	#1
C0E_EXIT:
	RTS

COMP_0F:
	JSR	CW_3
	LDY	#5
	JSR	CLRARDAT
	LDA	#>(SHLD_0)
	STA	PTR2H
	LDA	#<(SHLD_0)
	STA	PTR2L
	LDA	#$1A
	STA	LOGIC_BY
	JSR	C0D_MENU
	BEQ	C0F_END
	LDA	#$19
	LDY	#0
	JSR	ARROW
	BMI	C0F_END
	STA	LOGIC_TEMP
	TAY
	JSR	BUYITEM
	TYA
	BNE	C0F_A
	JMP	C07_D
C0F_A:
	JSR	C07_E
	LDA	LOGIC_TEMP
	CLC
	ADC	#1
	STA	SHLDTYPE
	TAY
	LDA	SHMAX,Y
	STA	SHIELD
	LDA	#1
	RTS
C0F_END:
	CMP	#$FF
	BEQ	C0F_EXIT
	JSR	CW_3
	JSR	REMPRICE
	LDA	#1	
C0F_EXIT:
	RTS

SHMAX:		.byte	0,  20,  40,  60,  80,  99


COMP_10:
	JSR	CW_3
	JSR	INVEN
	LDY	#5
	JSR	CLRARDAT
	JSR	USE_MENU
	BEQ	C10_END
	LDA	#0
	LDY	#0
	JSR	ARROW
	BMI	C10_END
	CLC
	ADC	#<(CLOAK)
	STA	WPN2
C10_END:
	CMP	#$FF
	BEQ	C10_EXIT
	LDA	#1
	RTS
C10_EXIT:
	LDA	#$FF
	RTS

PRADWARP:
	LDA	#1
	STA	PRADIKUS
	LDA	#$FF
	STA	WARP
	LDA	#>(PRAD_SYS)
	STA	SEC_PTRH
	LDA	#<(PRAD_SYS)
	STA	SEC_PTRL

	JSR	CW_3

	LDX	#<(PMSG)
	LDY	#>(PMSG)
	JSR	DOPRINT

	LDY	#20
	JSR	BIGDELAY
	
	LDA	#$FF
	STA	SAVEBIT0
	STA	SYSBIT0
	STA	SAVEBIT1
	STA	SYSBIT1
	STA	SAVEBIT2
	STA	SYSBIT2		;NECESSARY FOR LOADSYSTEM
	JSR	LOADSYSTEM
	JMP	COMP_04

LV_ORB:
	JSR	STOPSHIP
	LDA	#0
	STA	BKGRND
	JSR	LOADSYSTEM
	LDY	ORBIT
	LDA	SYSTEM+0,Y	;x pos.
	STA	XPOS
    ;	STA	DEST_X
	LDA	SYSTEM+1,Y	;y pos.
	STA	YPOS
    ;	STA	DEST_Y
	LDA	#2
	STA	WARP
	LDA	#$FF
	RTS

CHK_LAND:
	LDY	ORBIT
	LDA	SYSTEM+2,Y	;type/pal.
	AND	#$70
	BNE	CL_PRAD		;space stn?
	TYA
	LDY	#-1
CL_0:
	INY
	SEC
	SBC	#4
	BPL	CL_0
CL_1:
	LDA	STN_STAT,Y
	BEQ	CL_3		;completely destroyed...
	AND	#$88
	CMP	#$08
	BNE	CL_2
	LDA	#1
	RTS
CL_2:
	JSR	CW_3

	LDY	#>(SHLD_UP0)
	LDX	#<(SHLD_UP0)
	JSR	DOPRINT

CL_3:
	LDA	#0
	RTS
CL_PRAD:
	LDA	PRADIKUS
	BEQ	CLP_1
	LDY	#1
	LDX	#0
CLP_0:
	LDA	SYSTEM+2,Y	;type/pal.
	AND	#$70
	BNE	CLP_1		;space stn?
	LDA	STN_STAT,X
	BEQ	CLP_0A
	AND	#$88
	CMP	#$08
	BNE	CL_2
CLP_0A:	TYA
	CLC
	ADC	#4
	TAY
	INX
	JMP	CLP_0
CLP_1:
	LDA	#1
	RTS

SKIPDEAD:
	JSR	IS_DEAD
	BEQ	SD_END
	TYA
	CLC
	ADC	#4
	TAY
	JMP	SKIPDEAD
SD_END:
	STY	CRSR_I
	RTS

IS_DEAD:
	LDA	SYSTEM+2,Y	;type/pal.
	AND	#$70
	BNE	ID_FALSE	;space stn?
	LDA	SYSTEM+3,Y	;data bits
	AND	#INHAB
	BNE	ID_FALSE
	LDA	#1		;dead...
	RTS
ID_FALSE:
	LDA	#0		;not dead...
	RTS

REM_POS:
	LDA	#$F8
	STA	SPRTBL0
	STA	SPRTBL1
	RTS

REMPRICE:
	JSR	GETC_END
REMARROW:
	LDA	#$F8
	STA	 $0260
	STA	 $0760
	RTS

STOPSHIP:
	LDA	#0
	STA	THRUST
	STA	TSPD
	STA	XMOVE
	STA	YMOVE
  ;	STA	SAV_XVEL
  ;	STA	SAV_YVEL
	STA	PSHPXVEL
	STA	PSHPYVEL
	STA	PXOFF
	STA	PYOFF
;	STA	THR_CNT
	RTS

LANDPLNT:
	JSR	STOPSHIP
	LDA	#4
	STA	DIR
	LDA	#1
	STA	WARP
	LDY	ORBIT
	LDA	SYSTEM+2, Y	;type/pal.
	AND	#$70
	BNE	LAND_A		;space stn?
	
	LDA	#$7F
	STA	BKGRND
	JMP	LAND_C
LAND_A:	
	LDA	PRADIKUS
	BEQ	LAND_B
	LDA	#$80
	STA	BKGRND
	JMP	LAND_C
LAND_B:
	LDA	#$81
	STA	BKGRND
LAND_C:
	LDA	#$FF
	RTS


GETCOST:
	CMP	#$10
	BCC	GETC_END

	TAY
	JSR	ITEMCOST

	LDY	C100000
	LDA	NUMTAB, Y
	STA	COSTSPR0+1
	STA	COSTSPR1+1
	LDY	C10000
	LDA	NUMTAB, Y
	STA	COSTSPR0+5
	STA	COSTSPR1+5
	LDY	C1000
	LDA	NUMTAB, Y
	STA	COSTSPR0+9
	STA	COSTSPR1+9
	LDY	C100
	LDA	NUMTAB, Y
	STA	COSTSPR0+13
	STA	COSTSPR1+13
	LDY	C10
	LDA	NUMTAB, Y
	STA	COSTSPR0+17
	STA	COSTSPR1+17
	LDY	C1
	LDA	NUMTAB, Y
	STA	COSTSPR0+21
	STA	COSTSPR1+21

	LDA	#$00
	STA	COSTSPR0+2
	STA	COSTSPR0+6
	STA	COSTSPR0+10
	STA	COSTSPR0+14
	STA	COSTSPR0+18
	STA	COSTSPR0+22
	STA	COSTSPR1+2
	STA	COSTSPR1+6
	STA	COSTSPR1+10
	STA	COSTSPR1+14
	STA	COSTSPR1+18
	STA	COSTSPR1+22
	LDA	#1
	RTS
GETC_END:
	LDA	#$F8
	STA	COSTSPR0
	STA	COSTSPR0+4
	STA	COSTSPR0+8
	STA	COSTSPR0+12
	STA	COSTSPR0+16
	STA	COSTSPR0+20
	STA	COSTSPR1
	STA	COSTSPR1+4
	STA	COSTSPR1+8
	STA	COSTSPR1+12
	STA	COSTSPR1+16
	STA	COSTSPR1+20
	LDA	#0
	RTS

HASITEM:	
	STA	T3
	TYA
	PHA
	LDY	T3
	JSR	ITEMAVAIL
	STY	T3
	PLA
	TAY
	LDA	T3
	
	RTS

DISPCOST:
	LDA	#$D1
	STA	COSTSPR0
	STA	COSTSPR0+4
	STA	COSTSPR0+8
	STA	COSTSPR0+12
	STA	COSTSPR0+16
	STA	COSTSPR0+20
	STA	COSTSPR1
	STA	COSTSPR1+4
	STA	COSTSPR1+8
	STA	COSTSPR1+12
	STA	COSTSPR1+16
	STA	COSTSPR1+20

	LDA	#$A8
	STA	COSTSPR0+3
	STA	COSTSPR1+3
	LDA	#$B0
	STA	COSTSPR0+7
	STA	COSTSPR1+7
	LDA	#$B8
	STA	COSTSPR0+11
	STA	COSTSPR1+11
	LDA	#$C0
	STA	COSTSPR0+15
	STA	COSTSPR1+15
	LDA	#$C8
	STA	COSTSPR0+19
	STA	COSTSPR1+19
	LDA	#$D0
	STA	COSTSPR0+23
	STA	COSTSPR1+23
	RTS

INVEN:
	JSR	CW_2
	JSR	INV_1
	JSR	INV_2
	JMP	INV_3

USE_MENU:
	LDY	#20
	LDA	#$AA
	STA	LOGIC_TEMP
	LDX	#0
	STX	EXPL_A
	LDA	CLOAK
	BEQ	UM_0

	TYA
	PHA
	STA	TY
	LDY	#>(CLOAKSTR)
	LDX	#<(CLOAKSTR)
	LDA	#13
	STA	TX
	JSR	XYPRINT

	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT0
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
UM_0:
	LDA	MINES
	BEQ	UM_1
	TYA
	PHA
	STA	TY
	LDX	#<(MINE_STR)
	LDY	#>(MINE_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT1
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
UM_1:
	LDA	MISSILES
	BEQ	UM_2
	TYA
	PHA
	STA	TY
	LDX	#<(MISL_STR)
	LDY	#>(MISL_STR)
	LDA	#13	
	STA	TX
	JSR	XYPRINT
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT2
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
UM_2:
	LDA	S_WAVE
	BEQ	UM_3
	TYA
	PHA
	STA	TY
	LDY	#>(WAVE_STR)
	LDX	#<(WAVE_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	PLA
	TAY
	INY
	LDA	LOGIC_TEMP
	STA	ARDAT3
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
UM_3:
	LDA	THUNDER
	BEQ	UM_4
	STY	TY
	LDX	#<(BOLT_STR)
	LDY	#>(BOLT_STR)
	LDA	#13
	STA	TX
	JSR	XYPRINT
	LDA	LOGIC_TEMP
	STA	ARDAT4
	CLC
	ADC	#8
	STA	LOGIC_TEMP
	LDX	#1
	STX	EXPL_A
UM_4:
	LDA	EXPL_A
	RTS

INV1_STR:
	.byte	14, 1, "MAIN", $77,"WEAPON", $3A, $FF

INV_1:
	LDY	#>(INV1_STR)
	LDX	#<(INV1_STR)
	JSR	DOPRINT

	LDY	WPN1
	LDX	WPNNAMEL, Y
	LDA	WPNNAMEH, Y
	TAY
	LDA	#2
	STA	TY
	LDA	#12
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+3
	STA	VID_PTR
	LDA	#$0B
	CLC
	ADC	LNADDRL+3
	STA	VID_PTR
	LDA	#$97
	STA	VID_DATA
	LDX	#$10
	LDA	#$F7
	JSR	DRAW_BAR
	LDA	#$98
	STA	VID_DATA
	JSR	SET_VID
	JMP	DMAXFER

INV2_STR:
	.byte	11, 4,  $97, $77,"SPECIAL", $77,"ITEMS", $3A, $77, $98, $FF

INV_2:
	LDY	#>(INV2_STR)
	LDX	#<(INV2_STR)
	JSR	DOPRINT

	LDY	#5
	LDA	CLOAK
	BEQ	I2_0

	TYA
	PHA
	STA	TY
	LDX	#<(CLOAKSTR)
	LDY	#>(CLOAKSTR)
	LDA	#12
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$18
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	TYA
	PHA
	LDA	#$0E
	STA	VID_DATA
	LDA	#$0D
	STA	VID_DATA
	LDA	CLOAK
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
I2_0:
	LDA	MINES
	BEQ	I2_1
	TYA
	PHA
	STA	TY
	LDY	#>(MINE_STR)
	LDX	#<(MINE_STR)
	LDA	#12
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$18
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	TYA
	PHA
	LDA	#$FA
	STA	VID_DATA
	LDA	#$0D
	STA	VID_DATA
	LDA	MINES
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
I2_1:
	LDA	MISSILES
	BEQ	I2_2
	TYA
	PHA
	STA	TY
	LDX	#<(MISL_STR)
	LDY	#>(MISL_STR)
	LDA	#12
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$18
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	TYA
	PHA
	LDA	#$FA
	STA	VID_DATA
	LDA	#$0D
	STA	VID_DATA
	LDA	MISSILES
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA
	TAY
	INY
I2_2:
	LDA	S_WAVE
	BEQ	I2_3
	TYA
	PHA
	STA	TY
	LDX	#<(WAVE_STR)
	LDY	#>(WAVE_STR)
	LDA	#12
	STA	TX
	JSR	XYPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA	      
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$18
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	TYA
	PHA
	LDA	#$FA
	STA	VID_DATA
	LDA	#$0D
	STA	VID_DATA
	LDA	S_WAVE
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
	PLA	      
	TAY
	INY
I2_3:
	LDA	THUNDER
	BEQ	I2_4
	TYA
	PHA
	STA	TY
	LDY	#>(BOLT_STR)
	LDX	#<(BOLT_STR)
	LDA	#12
	STA	TX
	JSR	XYPRINT
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	PLA	      
	TAY
	LDA	LNADDRH,Y
	STA	VID_PTR
	LDA	#$18
	CLC
	ADC	LNADDRL,Y
	STA	VID_PTR
	LDA	#$FA
	STA	VID_DATA
	LDA	#$0D
	STA	VID_DATA
	LDA	THUNDER
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER
I2_4:
	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+10
	STA	VID_PTR
	LDA	#$0B	
	CLC
	ADC	LNADDRL+10
	STA	VID_PTR
	LDA	#$97
	STA	VID_DATA
	LDA	#$F7
	LDX	#$10
	JSR	DRAW_BAR
	LDA	#$98
	STA	VID_DATA
	JSR	SET_VID
	JMP	DMAXFER

INV3_STR:
	.byte	11, 11,  $97, $77, $77, $77,"SHIP"
	.byte	 $77,"INFO", $3A, $77, $77, $77, $98, $FF

INV_3:
	LDX	#<(INV3_STR)
	LDY	#>(INV3_STR)
	JSR	DOPRINT

	LDX	#<(DRV_STR)
	LDY	#>(DRV_STR)
	JSR	DOPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+12
	STA	VID_PTR
	LDA	#$1A
	CLC
	ADC	LNADDRL+12
	STA	VID_PTR
	LDA	DRIVE
	JSR	DRAW_NUM

	LDA	LNADDRH+13
	STA	VID_PTR
	LDA	#$1A
	CLC
	ADC	LNADDRL+13
	STA	VID_PTR
	LDA	PWRPLANT
	JSR	DRAW_NUM

	LDA	Vid_Reset
	LDA	LNADDRH+14
	STA	VID_PTR
	LDA	#$1A
	CLC
	ADC	LNADDRL+14
	STA	VID_PTR
	LDA	SHLDTYPE
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER

	LDX	#<(FUEL_STR)
	LDY	#>(FUEL_STR)
	JSR	DOPRINT

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+16
	STA	VID_PTR
	LDA	#$1A
	CLC
	ADC	LNADDRL+16
	STA	VID_PTR
	LDA	FUEL
	JSR	DRAW_NUM

	LDA	LNADDRH+17
	STA	VID_PTR
	LDA	#$1A
	CLC
	ADC	LNADDRL+17
	STA	VID_PTR
	LDA	ARMOR
	JSR	DRAW_NUM
	JSR	SET_VID
	JSR	DMAXFER

	JSR	VR_WAIT
	JSR	KILL_VID
	LDA	Vid_Reset
	LDA	LNADDRH+18
	STA	VID_PTR
	LDA	#$0B	
	CLC
	ADC	LNADDRL+18
	STA	VID_PTR
	LDA	#$97
	STA	VID_DATA
	LDA	#$F7
	LDX	#$10
	JSR	DRAW_BAR
	LDA	#$98
	STA	VID_DATA
	JSR	SET_VID
	JMP	DMAXFER

DRAWNUM3:
	PHA
	LDA	#$10
	STA	COUNT1
	PLA
DN3_100:
	CMP	#100
	BCC	DN3_10
	SEC
	SBC	#100
	INC	COUNT1
	JMP	DN3_100
DN3_10:
	PHA	                         
	LDA	COUNT1
	STA	VID_DATA
	LDA	#$10
	STA	COUNT1
	PLA
DN3_10A:
	CMP	#10
	BCC	DN3_1
	SEC
	SBC	#10
	INC	COUNT1
	JMP	DN3_10A
DN3_1:
	PHA	                         
	LDA	COUNT1
	STA	VID_DATA
	PLA
	CLC
	ADC	#$10
	STA	VID_DATA
	RTS

DRAW_NUM:
	PHA
	LDA	#$10
	STA	COUNT1
	PLA
	CMP	#99
	BCC	DN_10
	LDA	#$19
	STA	VID_DATA
	STA	VID_DATA
	RTS
DN_10:
	CMP	#10
	BCC	DN_1
	SEC
	SBC	#10
	INC	COUNT1
	JMP	DN_10
DN_1:
	PHA	                         
	LDA	COUNT1
	STA	VID_DATA
	PLA
	CLC
	ADC	#$10
	STA	VID_DATA
	RTS



;*****************************************************



;**********************************************************

;--------PLANETS.DAT---------------------------------------

.include "PLANETS.DAT"


;**********************************************************

;--------PRADSYS.DAT---------------------------------------

.include "PRADSYS.DAT"


;***********************************************************



PPOBJL:	.byte	BLK_00 & $FF, BLK_01 & $FF, BLK_02 & $FF, BLK_03 & $FF
	.byte	BLK_04 & $FF, BLK_05 & $FF, BLK_06 & $FF, BLK_07 & $FF
	.byte	BLK_08 & $FF, BLK_09 & $FF, BLK_0A & $FF, BLK_0B & $FF
	.byte	BLK_0C & $FF, BLK_0D & $FF, BLK_0E & $FF, BLK_0F & $FF
	.byte	BLK_10 & $FF, BLK_11 & $FF, BLK_12 & $FF, BLK_13 & $FF
	.byte	BLK_14 & $FF, BLK_15 & $FF, BLK_16 & $FF, BLK_17 & $FF
	.byte	BLK_18 & $FF, BLK_19 & $FF, BLK_1A & $FF, BLK_1B & $FF
	.byte	BLK_1C & $FF, BLK_1D & $FF, BLK_1E & $FF, BLK_1F & $FF
	.byte	BLK_20 & $FF, BLK_21 & $FF, BLK_22 & $FF, BLK_23 & $FF
	.byte	BLK_24 & $FF, BLK_25 & $FF, BLK_26 & $FF, BLK_27 & $FF
	.byte	BLK_28 & $FF, BLK_29 & $FF, BLK_2A & $FF, BLK_2B & $FF
	.byte	BLK_2C & $FF, BLK_2D & $FF, BLK_2E & $FF, BLK_2F & $FF
	.byte	BLK_30 & $FF, BLK_31 & $FF, BLK_32 & $FF, BLK_33 & $FF
	.byte	BLK_34 & $FF, BLK_35 & $FF, BLK_36 & $FF, BLK_37 & $FF
	.byte	BLK_38 & $FF, BLK_39 & $FF, BLK_3A & $FF, BLK_3B & $FF
	.byte	BLK_3C & $FF, BLK_3D & $FF, BLK_3E & $FF, BLK_3F & $FF


PPOBJH:	.byte	BLK_00 >>8, BLK_01 >>8, BLK_02 >>8, BLK_03 >>8  
	.byte	BLK_04 >>8, BLK_05 >>8, BLK_06 >>8, BLK_07 >>8  
	.byte	BLK_08 >>8, BLK_09 >>8, BLK_0A >>8, BLK_0B >>8  
	.byte	BLK_0C >>8, BLK_0D >>8, BLK_0E >>8, BLK_0F >>8  
	.byte	BLK_10 >>8, BLK_11 >>8, BLK_12 >>8, BLK_13 >>8  
	.byte	BLK_14 >>8, BLK_15 >>8, BLK_16 >>8, BLK_17 >>8  
	.byte	BLK_18 >>8, BLK_19 >>8, BLK_1A >>8, BLK_1B >>8  
	.byte	BLK_1C >>8, BLK_1D >>8, BLK_1E >>8, BLK_1F >>8  
	.byte	BLK_20 >>8, BLK_21 >>8, BLK_22 >>8, BLK_23 >>8  
	.byte	BLK_24 >>8, BLK_25 >>8, BLK_26 >>8, BLK_27 >>8
	.byte	BLK_28 >>8, BLK_29 >>8, BLK_2A >>8, BLK_2B >>8
	.byte	BLK_2C >>8, BLK_2D >>8, BLK_2E >>8, BLK_2F >>8
	.byte	BLK_30 >>8, BLK_31 >>8, BLK_32 >>8, BLK_33 >>8
	.byte	BLK_34 >>8, BLK_35 >>8, BLK_36 >>8, BLK_37 >>8
	.byte	BLK_38 >>8, BLK_39 >>8, BLK_3A >>8, BLK_3B >>8
	.byte	BLK_3C >>8, BLK_3D >>8, BLK_3E >>8, BLK_3F >>8






SSOBJL:	.byte	SSB00 & $FF, SSB01 & $FF, SSB02 & $FF, SSB03 & $FF
	.byte	SSB04 & $FF, SSB05 & $FF, SSB06 & $FF, SSB07 & $FF
	.byte	SSB08 & $FF, SSB09 & $FF, SSB0A & $FF, SSB0B & $FF
	.byte	SSB0C & $FF, SSB0D & $FF, SSB0E & $FF, SSB0F & $FF
	.byte	SSB10 & $FF, SSB11 & $FF, SSB12 & $FF, SSB13 & $FF
	.byte	SSB14 & $FF, SSB15 & $FF, SSB16 & $FF, SSB17 & $FF
	.byte	SSB18 & $FF, SSB19 & $FF, SSB1A & $FF, SSB1B & $FF
	.byte	SSB1C & $FF, SSB1D & $FF, SSB1E & $FF, SSB1F & $FF
	.byte	SSB20 & $FF, SSB21 & $FF, SSB22 & $FF, SSB23 & $FF
	.byte	SSB24 & $FF, SSB25 & $FF, SSB26 & $FF, SSB27 & $FF
	.byte	SSB28 & $FF, SSB29 & $FF, SSB2A & $FF, SSB2B & $FF  
	.byte	SSB2C & $FF, SSB2D & $FF, SSB2E & $FF, SSB2F & $FF  
	.byte	SSB30 & $FF, SSB31 & $FF, SSB32 & $FF, SSB33 & $FF
	.byte	SSB34 & $FF, SSB35 & $FF, SSB36 & $FF, SSB37 & $FF
	.byte	SSB38 & $FF, SSB39 & $FF, SSB3A & $FF, SSB3B & $FF  
	.byte	SSB3C & $FF, SSB3D & $FF, SSB3E & $FF, SSB3F & $FF  
 
 

SSOBJH:	.byte	SSB00 >>8, SSB01 >>8, SSB02 >>8, SSB03 >>8  
	.byte	SSB04 >>8, SSB05 >>8, SSB06 >>8, SSB07 >>8  
	.byte	SSB08 >>8, SSB09 >>8, SSB0A >>8, SSB0B >>8  
	.byte	SSB0C >>8, SSB0D >>8, SSB0E >>8, SSB0F >>8  
	.byte	SSB10 >>8, SSB11 >>8, SSB12 >>8, SSB13 >>8  
	.byte	SSB14 >>8, SSB15 >>8, SSB16 >>8, SSB17 >>8  
	.byte	SSB18 >>8, SSB19 >>8, SSB1A >>8, SSB1B >>8  
	.byte	SSB1C >>8, SSB1D >>8, SSB1E >>8, SSB1F >>8  
	.byte	SSB20 >>8, SSB21 >>8, SSB22 >>8, SSB23 >>8
	.byte	SSB24 >>8, SSB25 >>8, SSB26 >>8, SSB27 >>8
	.byte	SSB28 >>8, SSB29 >>8, SSB2A >>8, SSB2B >>8  
	.byte	SSB2C >>8, SSB2D >>8, SSB2E >>8, SSB2F >>8  
	.byte	SSB30 >>8, SSB31 >>8, SSB32 >>8, SSB33 >>8  
	.byte	SSB34 >>8, SSB35 >>8, SSB36 >>8, SSB37 >>8  
	.byte	SSB38 >>8, SSB39 >>8, SSB3A >>8, SSB3B >>8  
	.byte	SSB3C >>8, SSB3D >>8, SSB3E >>8, SSB3F >>8  


SSB2C:
SSB2D:
SSB2E:
SSB2F:

SSB32:
SSB33:
SSB34:
SSB35:
SSB36:
SSB37:
SSB38:
SSB39:
SSB3A:
SSB3B:
SSB3C:
SSB3D:
SSB3E:
SSB3F:


SSB00:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
SSB01:
	.byte	 $02, $02, $02, $17, $02, $11, $68, $68
	.byte	 $02, $1F, $1C, $1A, $1C, $1C, $60, $6A
	.byte	 $02, $1B, $02, $17, $02, $02, $1D, $1C
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $1C, $18, $1C, $1A, $1C, $1C, $1C, $1C
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB02:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $02, $17, $02, $02, $11, $00
	.byte	 $1C, $20, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $02
	.byte	 $24, $25, $26, $1A, $1C, $1C, $1C, $1C
	.byte	 $27, $28, $29, $17, $02, $02, $02, $02
SSB03:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $02, $11, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $17, $0A, $02, $02, $11
	.byte	 $16, $16, $16, $15, $16, $16, $16, $16
	.byte	 $02, $02, $0A, $17, $0A, $02, $02, $02
	.byte	 $1C, $20, $02, $17, $02, $02, $02, $02
	.byte	 $02, $0C, $1C, $1A, $1C, $1C, $1C, $1C
SSB04:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $16, $16, $11, $00, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $17, $0A, $11, $00, $00
	.byte	 $02, $02, $02, $17, $02, $02, $11, $00
	.byte	 $1C, $20, $02, $17, $02, $02, $02, $11
SSB05:
	.byte	 $02, $02, $02, $17, $62, $68, $00, $00
	.byte	 $02, $1F, $1C, $1A, $60, $6A, $11, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $02
	.byte	 $24, $25, $26, $1A, $1C, $1C, $1C, $1C
	.byte	 $27, $28, $29, $17, $02, $02, $02, $02
SSB06:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $11, $00, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $11, $00, $00, $00, $00, $00
	.byte	 $16, $16, $16, $15, $11, $00, $00, $00
	.byte	 $02, $02, $0A, $17, $0A, $02, $11, $00
	.byte	 $1C, $20, $02, $17, $02, $02, $02, $11
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB07:
	.byte	 $02, $02, $11, $00, $00, $00, $00, $00
	.byte	 $02, $02, $02, $11, $00, $00, $00, $00
	.byte	 $02, $02, $02, $17, $02, $11, $00, $00
	.byte	 $02, $02, $0A, $17, $0A, $02, $11, $00
	.byte	 $16, $16, $16, $15, $16, $16, $16, $11
	.byte	 $02, $02, $0A, $17, $0A, $1F, $1C, $20
	.byte	 $1C, $0E, $1C, $1A, $1C, $1E, $6A, $60
	.byte	 $02, $1B, $02, $17, $02, $02, $6A, $6A
SSB08:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $11, $00, $00, $00, $00, $00, $00, $00
	.byte	 $1C, $20, $11, $00, $00, $00, $00, $00
	.byte	 $02, $1B, $02, $11, $00, $00, $00, $00
SSB09:
	.byte	 $02, $1B, $02, $17, $11, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $11, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $11, $00
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $11
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $02
	.byte	 $24, $25, $26, $17, $02, $02, $02, $02
	.byte	 $27, $28, $29, $17, $02, $02, $02, $02
SSB0A:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $11, $00, $00, $00, $00, $00, $00, $00
	.byte	 $02, $11, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $11, $00, $00, $00, $00, $00
SSB0B:
	.byte	 $6A, $60, $20, $11, $00, $00, $00, $00
	.byte	 $6A, $6A, $1B, $17, $11, $00, $00, $00
	.byte	 $02, $1F, $1E, $17, $02, $11, $00, $00
	.byte	 $02, $1B, $0A, $17, $0A, $02, $00, $00
	.byte	 $16, $19, $16, $15, $16, $16, $11, $00
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $11
	.byte	 $1C, $0D, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB0C:
	.byte	 $02, $11, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $11, $00, $00, $00, $00, $00
	.byte	 $02, $02, $02, $00, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $11, $00, $00, $00, $00
 	.byte	 $16, $16, $16, $15, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $17, $11, $00, $00, $00
	.byte	 $1C, $20, $02, $17, $02, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $11, $00, $00
SSB0D:
	.byte	 $02, $1B, $02, $17, $02, $02, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $11, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $6A, $68
	.byte	 $02, $1B, $0A, $17, $0A, $02, $60, $62
	.byte	 $16, $19, $16, $15, $16, $16, $19, $16
	.byte	 $21, $22, $23, $17, $0A, $02, $1B, $02
	.byte	 $24, $25, $26, $1A, $1C, $1C, $1E, $02
	.byte	 $27, $28, $29, $17, $02, $02, $02, $02
SSB0E:
	.byte	 $11, $00, $00, $00, $00, $00, $00, $00
	.byte	 $02, $11, $00, $00, $00, $00, $00, $00
	.byte	 $02, $02, $11, $00, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $00, $00, $00, $00, $00
	.byte	 $16, $16, $16, $00, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $11, $00, $00, $00, $00
	.byte	 $1C, $20, $02, $17, $00, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $00, $00, $00, $00
SSB0F:
	.byte	 $02, $1B, $02, $17, $11, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $00, $00, $00
	.byte	 $02, $1B, $0A, $17, $0A, $00, $00, $00
	.byte	 $16, $19, $16, $15, $16, $11, $00, $00
	.byte	 $02, $1B, $0A, $17, $0A, $02, $00, $00
	.byte	 $1C, $0D, $02, $17, $02, $02, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $00, $00
SSB10:
	.byte	 $02, $1B, $02, $17, $02, $02, $00, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $11, $00
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $00
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $00
	.byte	 $16, $19, $16, $15, $16, $16, $16, $00
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $00
	.byte	 $24, $25, $26, $1A, $1C, $20, $02, $00
	.byte	 $27, $28, $29, $17, $02, $1B, $02, $00
SSB11:
	.byte	 $02, $1B, $02, $17, $02, $1B, $6A, $68
	.byte	 $02, $1B, $02, $17, $02, $1D, $60, $68
	.byte	 $02, $1B, $02, $17, $02, $02, $1B, $11
	.byte	 $02, $1B, $0A, $17, $0A, $02, $1B, $02
	.byte	 $16, $19, $16, $15, $16, $16, $19, $16
	.byte	 $02, $1B, $0A, $17, $0A, $02, $1B, $02
	.byte	 $1C, $18, $1C, $1A, $1C, $1C, $0F, $1C
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB12:
	.byte	 $1B, $1B, $02, $17, $02, $00, $00, $00
	.byte	 $1D, $0D, $02, $17, $02, $11, $00, $00
	.byte	 $02, $0C, $1C, $1A, $1C, $20, $62, $68
	.byte	 $02, $1B, $0A, $17, $0A, $1D, $60, $68
	.byte	 $16, $19, $16, $15, $16, $16, $19, $16
	.byte	 $02, $1B, $0A, $17, $0A, $02, $1B, $02
	.byte	 $1C, $18, $1C, $1A, $1C, $1C, $0F, $1C
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB13:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $11, $00, $00, $00, $00, $00, $00, $00
	.byte	 $16, $11, $68, $68, $00, $00, $00, $00
	.byte	 $02, $02, $60, $68, $00, $00, $00, $00
	.byte	 $1C, $20, $02, $11, $00, $00, $00, $00
	.byte	 $20, $1B, $02, $17, $11, $00, $00, $00
SSB14:
	.byte	 $02, $1B, $02, $17, $68, $68, $00, $00
	.byte	 $02, $0C, $1C, $1A, $60, $62, $00, $00
	.byte	 $02, $1B, $02, $17, $1D, $20, $11, $00
	.byte	 $02, $1B, $0A, $17, $0A, $1B, $02, $02
	.byte	 $16, $19, $16, $15, $16, $19, $16, $16
	.byte	 $02, $1B, $0A, $17, $0A, $1B, $02, $02
	.byte	 $0E, $18, $1C, $1A, $1C, $18, $1C, $1C
	.byte	 $1D, $0D, $02, $17, $02, $1D, $1C, $1C
SSB15:
	.byte	 $6A, $60, $02, $17, $00, $00, $00, $00
	.byte	 $6A, $6A, $02, $17, $00, $00, $00, $00
	.byte	 $02, $02, $02, $17, $00, $00, $00, $00
	.byte	 $02, $02, $0A, $17, $00, $00, $00, $00
	.byte	 $16, $16, $16, $15, $00, $00, $00, $00
	.byte	 $21, $22, $23, $17, $00, $00, $00, $00
	.byte	 $24, $25, $26, $1A, $00, $00, $00, $00
	.byte	 $27, $28, $29, $17, $00, $00, $00, $00
SSB16:
	.byte	 $02, $0C, $1C, $1A, $60, $6A, $02, $02
	.byte	 $02, $1B, $02, $17, $68, $68, $00, $13
	.byte	 $02, $1B, $02, $17, $00, $00, $00, $00
	.byte	 $02, $1B, $0A, $17, $00, $00, $00, $00
	.byte	 $16, $19, $16, $15, $00, $00, $00, $00
	.byte	 $21, $22, $23, $17, $00, $00, $00, $00
	.byte	 $24, $25, $26, $1A, $00, $00, $00, $00
	.byte	 $27, $28, $29, $17, $00, $00, $00, $00
SSB17:
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $00, $00, $13, $17, $02, $02, $02, $02
	.byte	 $00, $00, $00, $00, $00, $13, $02, $02
	.byte	 $00, $00, $00, $00, $00, $00, $00, $13
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
SSB18:
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1D, $1C, $1A, $1C, $20, $02, $02
	.byte	 $02, $02, $0A, $17, $0A, $1B, $02, $02
	.byte	 $16, $16, $16, $15, $16, $19, $16, $16
	.byte	 $00, $13, $0A, $17, $0A, $1D, $1C, $20
	.byte	 $00, $00, $00, $13, $02, $02, $6A, $60
	.byte	 $00, $00, $00, $00, $00, $13, $6A, $6A
SSB19:
	.byte	 $02, $1D, $1C, $1A, $1C, $0E, $1C, $20
	.byte	 $13, $02, $02, $17, $02, $1B, $0B, $1B
	.byte	 $00, $13, $02, $17, $02, $1D, $1C, $0D
	.byte	 $00, $00, $00, $13, $0A, $02, $02, $1B
	.byte	 $00, $00, $00, $00, $13, $16, $16, $19
	.byte	 $00, $00, $00, $00, $00, $13, $02, $1B
	.byte	 $00, $00, $00, $00, $00, $00, $13, $1D
	.byte	 $00, $00, $00, $00, $00, $00, $00, $13
SSB1A:
	.byte	 $13, $1D, $1C, $1A, $0E, $0E, $0E, $20
	.byte	 $00, $13, $02, $17, $1D, $18, $18, $0D
	.byte	 $00, $00, $13, $17, $02, $1D, $18, $0D
	.byte	 $00, $00, $00, $13, $0A, $02, $1D, $0D
	.byte	 $00, $00, $00, $00, $13, $16, $16, $19
	.byte	 $00, $00, $00, $00, $00, $02, $02, $1B
	.byte	 $00, $00, $00, $00, $00, $13, $02, $1D
	.byte	 $00, $00, $00, $00, $00, $00, $13, $02
SSB1B:
	.byte	 $6A, $60, $20, $17, $02, $02, $02, $02
	.byte	 $6A, $6A, $1B, $17, $02, $02, $02, $02
	.byte	 $13, $02, $1D, $1A, $1C, $1C, $1C, $20
	.byte	 $00, $02, $0A, $17, $0A, $02, $02, $1B
	.byte	 $00, $13, $16, $15, $16, $16, $16, $19
	.byte	 $00, $00, $0A, $17, $0A, $02, $02, $1B
	.byte	 $00, $00, $13, $17, $02, $02, $02, $1D
	.byte	 $00, $00, $00, $17, $02, $02, $02, $02
SSB1C:
	.byte	 $00, $00, $00, $13, $02, $02, $02, $02
	.byte	 $00, $00, $00, $00, $02, $02, $02, $02
	.byte	 $00, $00, $00, $00, $13, $02, $02, $02
	.byte	 $00, $00, $00, $00, $00, $02, $02, $02
	.byte	 $00, $00, $00, $00, $00, $16, $16, $16
	.byte	 $00, $00, $00, $00, $00, $13, $02, $02
	.byte	 $00, $00, $00, $00, $00, $00, $1C, $1C
	.byte	 $00, $00, $00, $00, $00, $00, $02, $02
SSB1D:
	.byte	 $00, $00, $00, $00, $00, $00, $13, $02
	.byte	 $00, $00, $00, $00, $00, $00, $00, $02
	.byte	 $00, $00, $00, $00, $00, $00, $68, $6A
	.byte	 $00, $00, $00, $00, $00, $00, $68, $60
	.byte	 $16, $19, $16, $15, $16, $16, $16, $19
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $1B
	.byte	 $24, $25, $26, $1A, $1C, $1C, $1C, $0F
	.byte	 $27, $28, $29, $17, $02, $02, $02, $02
SSB1E:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $02
	.byte	 $24, $25, $26, $17, $02, $02, $6A, $60
	.byte	 $27, $28, $29, $17, $02, $02, $6A, $6A
SSB1F:
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $00, $00, $00, $00, $00, $00, $00, $00
	.byte	 $16, $16, $16, $15, $16, $16, $16, $16
	.byte	 $02, $02, $0A, $17, $0A, $02, $02, $02
	.byte	 $1C, $0E, $1C, $1A, $1C, $1C, $1C, $1C
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB20:
	.byte	 $02, $1B, $02, $17, $00, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $00, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $00, $00, $00, $00
	.byte	 $02, $1B, $0A, $17, $00, $00, $00, $00
	.byte	 $16, $19, $16, $15, $00, $00, $00, $00
	.byte	 $02, $1B, $0A, $17, $00, $00, $00, $00
	.byte	 $1C, $0D, $02, $17, $00, $00, $00, $00
	.byte	 $02, $1B, $02, $17, $00, $00, $00, $00

SSB21:
	.byte	 $0A, $02, $02, $02, $17, $02, $1D, $1C
	.byte	 $02, $02, $02, $02, $17, $02, $02, $02
	.byte	 $02, $02, $0A, $02, $17, $02, $02, $02
	.byte	 $02, $02, $02, $02, $17, $02, $2C, $44
	.byte	 $16, $16, $16, $16, $15, $2C, $01, $01
	.byte	 $02, $02, $02, $02, $2C, $01, $01, $01
	.byte	 $20, $02, $02, $2C, $01, $01, $01, $01
	.byte	 $1B, $02, $02, $46, $01, $01, $01, $01
SSB22:
	.byte	 $1C, $1C, $1C, $1C, $1A, $1C, $18, $1C
	.byte	 $02, $02, $02, $02, $17, $2C, $38, $34
	.byte	 $2C, $44, $44, $44, $44, $01, $36, $02
	.byte	 $01, $01, $01, $01, $01, $01, $36, $02
	.byte	 $01, $01, $01, $01, $01, $01, $36, $02
	.byte	 $01, $01, $01, $01, $01, $01, $36, $02
	.byte	 $01, $01, $01, $01, $01, $01, $36, $02
	.byte	 $01, $01, $01, $01, $01, $01, $36, $02
SSB23:
	.byte	 $1B, $02, $2C, $01, $01, $01, $01, $01
	.byte	 $1B, $02, $46, $01, $01, $01, $01, $01
	.byte	 $1B, $02, $46, $01, $01, $21, $22, $23
	.byte	 $1B, $02, $46, $01, $01, $24, $25, $26							     
	.byte	 $19, $16, $46, $01, $01, $27, $28, $29
	.byte	 $1B, $2C, $01, $01, $01, $01, $01, $01
	.byte	 $18, $46, $01, $01, $01, $01, $01, $01
	.byte	 $1B, $46, $01, $01, $01, $01, $01, $01
SSB24:
	.byte	 $01, $01, $01, $01, $01, $01, $6E, $02
	.byte	 $01, $01, $01, $01, $01, $01, $6E, $02
	.byte	 $01, $01, $01, $01, $01, $01, $6E, $02
	.byte	 $01, $01, $01, $01, $01, $45, $2C, $44
	.byte	 $01, $01, $01, $01, $01, $40, $01, $01
	.byte	 $01, $01, $01, $01, $40, $01, $01, $01
	.byte	 $01, $01, $01, $4C, $01, $01, $21, $22
	.byte	 $01, $01, $01, $46, $01, $01, $24, $25
SSB25:
	.byte	 $02, $35, $01, $01, $01, $01, $01, $01 
	.byte	 $02, $35, $01, $01, $01, $01, $01, $01 
	.byte	 $02, $35, $01, $01, $01, $01, $01, $01 
	.byte	 $44, $2D, $46, $01, $01, $01, $01, $01 
	.byte	 $01, $01, $41, $01, $01, $01, $01, $01 
	.byte	 $01, $01, $01, $41, $01, $01, $01, $01 
	.byte	 $23, $14, $01, $01, $4D, $01, $01, $01 
	.byte	 $26, $14, $01, $01, $45, $01, $01, $01  
SSB26:
	.byte	 $1B, $46, $01, $01, $01, $01, $01, $01
	.byte	 $18, $46, $01, $01, $01, $01, $01, $01
	.byte	 $1B, $2E, $01, $01, $01, $01, $01, $01
	.byte	 $19, $16, $46, $01, $01, $01, $01, $01
	.byte	 $1B, $02, $46, $01, $01, $01, $01, $2F							     
	.byte	 $1B, $02, $46, $01, $01, $01, $2F, $02
	.byte	 $1B, $02, $46, $01, $01, $2F, $02, $02
	.byte	 $1B, $02, $2E, $01, $2F, $02, $02, $02
SSB27:
	.byte	 $01, $01, $01, $46, $01, $01, $27, $28
	.byte	 $01, $01, $2F, $2E, $01, $01, $14, $14
	.byte	 $01, $2F, $02, $02, $32, $01, $01, $01
	.byte	 $2F, $02, $02, $02, $02, $32, $01, $01
	.byte	 $02, $02, $02, $02, $02, $02, $2E, $47
	.byte	 $02, $02, $02, $02, $02, $02, $2C, $01
	.byte	 $02, $02, $02, $02, $02, $2C, $01, $01
	.byte	 $02, $02, $02, $02, $2C, $01, $01, $01
SSB28:
	.byte	 $29, $14, $01, $01, $45, $01, $01, $01
	.byte	 $14, $14, $01, $01, $2F, $2E, $01, $01
	.byte	 $01, $01, $01, $33, $02, $02, $2E, $01
	.byte	 $01, $01, $33, $02, $02, $02, $02, $2E
	.byte	 $47, $2F, $02, $02, $02, $02, $02, $02
	.byte	 $01, $2D, $02, $02, $02, $02, $02, $02
	.byte	 $01, $01, $2D, $02, $02, $02, $02, $02
	.byte	 $01, $01, $01, $2D, $02, $02, $02, $02
SSB29:
	.byte	 $1B, $02, $35, $2F, $02, $02, $02, $02
	.byte	 $1E, $02, $02, $3E, $02, $02, $02, $02
	.byte	 $02, $02, $02, $02, $3E, $02, $02, $02
	.byte	 $16, $16, $16, $16, $15, $3E, $02, $02
	.byte	 $02, $02, $02, $02, $17, $02, $3E, $2C
	.byte	 $02, $02, $02, $02, $17, $02, $02, $34
	.byte	 $02, $02, $02, $02, $17, $02, $02, $02
	.byte	 $0A, $02, $02, $02, $17, $02, $1F, $1C
SSB2A:
	.byte	 $02, $02, $02, $2C, $01, $01, $01, $01
	.byte	 $02, $02, $2C, $01, $01, $01, $21, $22
	.byte	 $02, $2C, $01, $01, $01, $01, $24, $25
	.byte	 $2C, $01, $01, $01, $01, $01, $27, $28
	.byte	 $01, $01, $01, $01, $01, $01, $14, $14
	.byte	 $2E, $47, $47, $47, $47, $01, $01, $01
	.byte	 $02, $02, $02, $02, $17, $2E, $47, $47
	.byte	 $1C, $1C, $1C, $1C, $1A, $1C, $18, $1C
SSB2B:
	.byte	 $01, $01, $01, $01, $2D, $02, $02, $02
	.byte	 $23, $14, $01, $01, $01, $2D, $02, $02
	.byte	 $26, $14, $01, $01, $01, $01, $2D, $02
	.byte	 $29, $14, $01, $01, $01, $01, $01, $2D
	.byte	 $14, $14, $01, $01, $01, $01, $01, $01
	.byte	 $01, $01, $01, $47, $47, $47, $47, $2F
	.byte	 $47, $47, $2F, $17, $02, $02, $02, $02
	.byte	 $1C, $18, $1C, $1A, $1C, $1C, $1C, $1C

SSB30:
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $1C, $18, $1C, $1A, $1C, $1C, $1C, $1C
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
SSB31:
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $02, $17, $02, $02, $02, $02
	.byte	 $02, $1B, $0A, $17, $0A, $02, $02, $02
	.byte	 $16, $19, $16, $15, $16, $16, $16, $16
	.byte	 $21, $22, $23, $17, $0A, $02, $02, $02
	.byte	 $24, $25, $26, $1A, $1C, $1C, $1C, $1C
	.byte	 $27, $28, $29, $17, $02, $02, $02, $02


;***********************************************************


OBJ_PL: .byte	SSB31 & $FF
	.byte	SSB31 & $FF
	.byte	P2_BLK & $FF, P3_BLK & $FF,  P4_BLK & $FF
	.byte	P5_BLK & $FF, P6_BLK & $FF
	.byte	SSB31 & $FF

OBJ_PH: .byte	SSB31 >>8
	.byte	SSB31 >>8
	.byte	P2_BLK >>8, P3_BLK >>8,  P4_BLK >>8
	.byte	P5_BLK >>8, P6_BLK >>8
	.byte	SSB31 >>8


ST_BLK:	
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, $00, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
 
P2_BLK: 
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, $40, $41, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, $60, $61, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC

P3_BLK: 
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, $42, $43, $44, SPC, SPC
	.byte	 SPC, SPC, SPC, $62, $63, $64, SPC, SPC
	.byte	 SPC, SPC, SPC, $82, $83, $84, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC

P4_BLK:
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, $45, $46, $47, $48, SPC, SPC
	.byte	 SPC, SPC, $65, $66, $67, $68, SPC, SPC
	.byte	 SPC, SPC, $85, $86, $87, $88, SPC, SPC
	.byte	 SPC, SPC, $A5, $A6, $A7, $A8, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC

P5_BLK: 
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC
	.byte	 SPC, SPC, $49, $4A, $4B, $4C, $4D, SPC
	.byte	 SPC, SPC, $69, $6A, $6B, $6C, $6D, SPC
	.byte	 SPC, SPC, $89, $8A, $8B, $8C, $8D, SPC
	.byte	 SPC, SPC, $A9, $AA, $AB, $AC, $AD, SPC
	.byte	 SPC, SPC, $C9, $CA, $CB, $CC, $CD, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC

P6_BLK: 
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC 
	.byte	 SPC, SPC, $4F, $50, $51, $52, SPC, SPC
	.byte	 SPC, $6E, $6F, $70, $71, $72, $73, SPC
	.byte	 SPC, $8E, $8F, $90, $91, $92, $93, SPC
	.byte	 SPC, $AE, $AF, $B0, $B1, $B2, $B3, SPC
	.byte 	 SPC, $CE, $CF, $D0, $D1, $D2, $D3, SPC
	.byte	 SPC, SPC, $EF, $F0, $F1, $F2, SPC, SPC
	.byte	 SPC, SPC, SPC, SPC, SPC, SPC, SPC, SPC


;***********************************************************



STARS:	
	.byte 	SPC,SPC, S4,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S6,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC, S1,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC, S3,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC, S2,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S1,SPC, S5,SPC,SPC, S6,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC, S2,SPC,SPC
	.byte	SPC,SPC, S3, S1, S4,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S1,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC, S5,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S6,SPC,SPC,SPC

	.byte	SPC,SPC, S1,SPC,SPC, S3,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S2,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC, S1, S4,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC, S6

	.byte	SPC,SPC,SPC,SPC,SPC,SPC, S1,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC, S3
	.byte	SPC,SPC,SPC, S2,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC


	.byte	SPC, S5,SPC,SPC,SPC, S1,SPC,SPC
	.byte	SPC,SPC, S4,SPC,SPC,SPC, S6,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC, S3

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S1,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC, S2,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S1,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC, S5,SPC,SPC,SPC,SPC,SPC

	.byte	 S3, S1,SPC,SPC, S4,SPC,SPC,SPC
	.byte	SPC,SPC,SPC, S2,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC


	.byte	 S1,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S6,SPC,SPC,SPC
	.byte	SPC,SPC,SPC, S5,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC, S2,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S1,SPC, S3,SPC,SPC,SPC,SPC
	.byte	 S6,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	 S4,SPC, S5,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S1,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S2,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S5,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

;****
	.byte 	 S4, S1,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S6,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S3,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	 S5,SPC,SPC,SPC,SPC, S2,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S1,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S5,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC, S1,SPC
	.byte	 S3,SPC,SPC,SPC,SPC,SPC, S4,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC, S1
	.byte	 S2,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S6,SPC, S5,SPC,SPC,SPC,SPC

	
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S4,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S1,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S3,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S1,SPC,SPC, S5,SPC,SPC,SPC,SPC
	.byte	SPC, S2,SPC,SPC,SPC, S1,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S3,SPC,SPC, S6,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC, S1,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC, S4,SPC,SPC,SPC,SPC,SPC
	.byte	 S2,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S1,SPC,SPC,SPC,SPC,SPC, S5
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC


	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S2,SPC,SPC
	.byte	 S1,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	 S3,SPC, S5,SPC,SPC,SPC, S4,SPC
	.byte	SPC, S1,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S5,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S2,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC, S1,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC, S2

	.byte	 S3,SPC,SPC,SPC,SPC,SPC,SPC, S5
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC, S6,SPC,SPC, S4,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC


	.byte	 S1, S2,SPC,SPC,SPC,SPC,SPC,SPC	;***
	.byte	SPC, S3,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S6,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S5,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC, S1,SPC,SPC,SPC,SPC, S3
	.byte	 S4,SPC,SPC,SPC,SPC,SPC,SPC,SPC

	.byte	SPC,SPC,SPC, S1,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	SPC,SPC,SPC,SPC,SPC, S1, S5,SPC

	.byte	SPC,SPC,SPC,SPC,SPC,SPC,SPC,SPC
	.byte	 S6,SPC,SPC,SPC,SPC,SPC, S4,SPC
	.byte	SPC, S5,SPC,SPC,SPC,SPC, S3,SPC
	.byte	SPC,SPC,SPC,SPC, S2,SPC,SPC,SPC

;*************************************************


FUEL_TBL:
	.byte	 $00,  $01,  $02,  $03,  $04,  $05,  $06,  $07
	.byte	 $01,  $02,  $03,  $04,  $05,  $06,  $07,  $08
	.byte	 $02,  $03,  $04,  $05,  $06,  $07,  $08,  $09
	.byte	 $03,  $04,  $05,  $06,  $07,  $08,  $09,  $0A
	.byte	 $04,  $05,  $06,  $07,  $08,  $09,  $0A,  $0B
	.byte	 $05,  $06,  $07,  $08,  $09,  $0A,  $0B,  $0C
	.byte	 $06,  $07,  $08,  $09,  $0A,  $0B,  $0C,  $0D
	.byte	 $07,  $08,  $09,  $0A,  $0B,  $0C,  $0D,  $0E

SECTFUEL:
	.byte	0, 100, 60, 35, 15, 10,  5
  ;;	.byte	0, 100, 50, 25, 10,  5,  2
  ;;	.byte	 $00,  $64,  $32,  $19,  $0A,  $05,  $02

SYSFUEL:
	.byte	0, 25, 15, 10, 5, 2, 1
  ;;	.byte	0, 25, 10, 5, 2, 1, 0
  ;;	.byte	 $00,  $19,  $0A,  $05,  $02,  $01,  $00

LNADDRL:
	.byte	 $00,  $20,  $40,  $60,  $80,  $A0,  $C0,  $E0
	.byte	 $00,  $20,  $40,  $60,  $80,  $A0,  $C0,  $E0
	.byte	 $00,  $20,  $40,  $60,  $80,  $A0,  $C0,  $E0
	.byte	 $00,  $20,  $40,  $60,  $80,  $A0,  $C0,  $E0

LNADDRH:
	.byte	 $20,  $20,  $20,  $20,  $20,  $20,  $20,  $20
	.byte	 $21,  $21,  $21,  $21,  $21,  $21,  $21,  $21
	.byte	 $22,  $22,  $22,  $22,  $22,  $22,  $22,  $22
	.byte	 $23,  $23,  $23,  $23,  $23,  $23,  $23,  $23





;THE SPRITE MAP FOR A SPACE STATION TURRETS IN COMPUTER MODE
STN_SPR0:
	.byte	 $32,  $92
	.byte	 $32,  $B6	;TURRETS
	.byte	 $3A,  $92
	.byte	 $3E,  $AA
	.byte	 $42,  $82
	.byte	 $46,  $9E
	.byte	 $42,  $C6
	.byte	 $4E,  $8E
	.byte	 $4E,  $B2
	.byte	 $5A,  $96
	.byte	 $5A,  $BA
	.byte	 $66,  $82
	.byte	 $62,  $AA
	.byte	 $66,  $C6
	.byte	 $6A,  $9E
	.byte	 $6E,  $B6
	.byte	 $76,  $92
	.byte	 $76,  $B6
	.byte	 $2E,  $9E
	.byte	 $00,  $00
	.byte	 $3A,  $B6
	.byte	 $42,  $8A
	.byte	 $00,  $00
	.byte	 $4E,  $CA
	.byte	 $5A,  $7E
	.byte	 $00,  $00
	.byte	 $55,  $A4	;THE FOUR TOWERS
	.byte	 $00,  $00
	.byte	 $00,  $00
	.byte	 $00,  $00

;THE SPRITE MAP FOR A SPACE STATION TURRETS IN COMPUTER MODE
STN_SPR1:
	.byte	 $66,  $8A	;TURRETS
	.byte	 $6E,  $92
	.byte	 $7A,  $AA
	.byte	 $2E,  $AA
	.byte	 $00,  $00
	.byte	 $38,  $88
	.byte	 $38,  $C0
	.byte	 $42,  $BE
	.byte	 $4E,  $7E
	.byte	 $00,  $00
	.byte	 $00,  $00
	.byte	 $5A,  $CA
	.byte	 $66,  $BE
	.byte	 $70,  $88
	.byte	 $70,  $C0
	.byte	 $7A,  $9E
	.byte	 $3E,  $9E
	.byte	 $46,  $AA
	.byte	 $00,  $00
	.byte	 $4E,  $96
	.byte	 $4E,  $BA
	.byte	 $5A,  $8E
	.byte	 $5A,  $B2
	.byte	 $62,  $9E
	.byte	 $6A,  $AA
	.byte	 $00,  $00
	.byte	 $55,  $A4	;THE FOUR TOWERS
	.byte	 $00,  $00
	.byte	 $00,  $00
	.byte	 $00,  $00

;THE SPRITE MAP FOR PRADIKUS TURRETS IN COMPUTER MODE
PRADSPR0:
	.byte	 $3C,  $9F	;TURRETS
	.byte	 $3C,  $AA
	.byte	 $00,  $00
	.byte	 $46,  $A4
	.byte	 $3C,  $A4
	.byte	 $00,  $00
	.byte	 $46,  $BE
	.byte	 $50,  $8C
	.byte	 $50,  $BE
	.byte	 $55,  $94
	.byte	 $53,  $A4
	.byte	 $55,  $A6
	.byte	 $55,  $B4
	.byte	 $55,  $8C
	.byte	 $55,  $A2
	.byte	 $57,  $A4
	.byte	 $55,  $BE
	.byte	 $5C,  $8C
	.byte	 $5C,  $BE
	.byte	 $64,  $8C
	.byte	 $00,  $00
	.byte	 $64,  $A4
	.byte	 $6F,  $A4
	.byte	 $00,  $00
	.byte	 $6F,  $9F
	.byte	 $6F,  $AA
	.byte	 $4D,  $9C	;THE FOUR TOWERS
	.byte	 $4D,  $AC
	.byte	 $5D,  $9C
	.byte	 $5D,  $AC

;THE TWO SPRITE TABLES FOR THE PLANET 1 MAP
P1_SPR0:
	.byte	 $40,  $9C	;TURRETS
	.byte	 $40,  $AC
	.byte	 $48,  $94
	.byte	 $48,  $B4
	.byte	 $50,  $8C
	.byte	 $50,  $BC
	.byte	 $5C,  $8C
	.byte	 $5C,  $BC
	.byte	 $64,  $94
	.byte	 $64,  $B4
	.byte	 $6C,  $9C
	.byte	 $6C,  $AC
	.byte	 $2C,  $84
	.byte	 $2C,  $C8
	.byte	 $7C,  $84
	.byte	 $7C,  $C8
	.byte	 $24,  $94
	.byte	 $24,  $B4
	.byte	 $40,  $7C
	.byte	 $40,  $D0
	.byte	 $68,  $7C
	.byte	 $68,  $D0
	.byte	 $84,  $94
	.byte	 $84,  $B4
	.byte	 $1C,  $A2
	.byte	 $8C,  $A6
	.byte	 $55,  $A4	;THE FOUR TOWERS
	.byte	 $00,  $00
	.byte	 $00,  $00
	.byte	 $00,  $00

;THE SPRITE MAP FOR PRADIKUS TURRETS IN COMPUTER MODE
PRADSPR1:
	.byte	 $2C,  $7C	;TURRETS
	.byte	 $2C,  $86
	.byte	 $2C,  $C4
	.byte	 $2C,  $CE
	.byte	 $30,  $A3
	.byte	 $37,  $7C
	.byte	 $37,  $86
	.byte	 $37,  $C4
	.byte	 $37,  $CE
	.byte	 $3C,  $95
	.byte	 $3C,  $B4
	.byte	 $48,  $8C
	.byte	 $54,  $C7
	.byte	 $58,  $84
	.byte	 $64,  $BE
	.byte	 $6F,  $95
	.byte	 $6F,  $B4
	.byte	 $74,  $7C
	.byte	 $74,  $86
	.byte	 $74,  $C4
	.byte	 $74,  $CE
	.byte	 $78,  $A3
	.byte	 $7F,  $7C
	.byte	 $7F,  $86
	.byte	 $7F,  $C4
	.byte	 $7F,  $CE
	.byte	 $4D,  $9C	;THE FOUR TOWERS
	.byte	 $4D,  $AC
	.byte	 $5D,  $9C
	.byte	 $5D,  $AC


P1_SPR1:
	.byte	 $1C,  $A6	;TURRETS
	.byte	 $20,  $90
	.byte	 $20,  $B8
	.byte	 $24,  $7C
	.byte	 $24,  $D0
	.byte	 $2C,  $90
	.byte	 $2C,  $BC
	.byte	 $38,  $84
	.byte	 $38,  $C8
	.byte	 $3C,  $78
	.byte	 $3C,  $D4
	.byte	 $52,  $74
	.byte	 $52,  $D8
	.byte	 $56,  $74
	.byte	 $56,  $D8
	.byte	 $6C,  $78
	.byte	 $6C,  $D4
	.byte	 $70,  $84
	.byte	 $70,  $C8
	.byte	 $7C,  $90
	.byte	 $7C,  $BC
	.byte	 $84,  $7C
	.byte	 $84,  $D0
	.byte	 $88,  $90
	.byte	 $88,  $B8
	.byte	 $8C,  $A2
	.byte	 $55,  $A4	;THE FOUR TOWERS
	.byte	 $00,  $00
	.byte	 $00,  $00
	.byte	 $00,  $00


MAPSPR0H:
	.byte	STN_SPR0 >>8, PRADSPR0 >>8, P1_SPR0 >>8
MAPSPR0L:
	.byte	STN_SPR0 & $FF, PRADSPR0 & $FF, P1_SPR0 & $FF

MAPSPR1H:
	.byte	STN_SPR1 >>8, PRADSPR1 >>8, P1_SPR1 >>8
MAPSPR1L:
	.byte	STN_SPR1 & $FF, PRADSPR1 & $FF, P1_SPR1 & $FF

;GIVES THE PLANET MAP POSITION BASED ON XPOS AND YPOS
P_POS:
	.byte	  0,   0,   0,   0,   2,   4,   6,   8,  12,  16,  18,  22
	.byte	 26,  30,  32,  36,  40,  44,  48,  52,  56,  60,  62,  65
	.byte	 68,  71,  74,  76,  80,  83,  86,  89,  93,  97, 101, 106
	.byte	110, 113, 116, 120, 122, 124, 124, 124


;************************************************
; MISSION DATA TABLES (04-25-90)
;************************************************

MTXT0:		.byte	12, 4, "    YOU HAVE", 0
		.byte	       " COMPLETED YOUR", 0
		.byte	       "PRESENT MISSION!", 0
		.byte	0, 0
		.byte	       " RETURN TO BASE", 0
		.byte	       "    FOR YOUR", 0
		.byte	       "      NEXT", 0
		.byte	       "   ASSIGNMENT", -1

MTXT1:		.byte	12, 3, "GREETINGS, NEW", 0
		.byte	"RECRUIT!", 0
		.byte	0
		.byte	"ENEMY ACTIVITY", 0
		.byte	"IN THIS SECTOR", 0
		.byte	"IS INCREASING.", 0
		.byte	"GO OUT AND", 0
		.byte	"DESTROY ENEMY", 0
		.byte	"SHIPS.", -1

MTXT1A:		.byte	12, 3, "USE MONEY EARNED", 0
		.byte	"TO IMPROVE YOUR", 0
		.byte	"SHIP.", 0
		.byte	0
		.byte	"WHEN YOUR SHIP", 0
		.byte	"IS EQUIPPED WITH", 0
		.byte	"A SHIELD-2", 0
		.byte	"AND A DRIVE-2", 0
		.byte	"REPORT BACK TO", 0
		.byte	"BASE FOR YOUR", 0
		.byte	"NEXT ASSIGNMENT.", -1

MTXT2:		.byte	12, 3, "CONGRATULATIONS!", 0
		.byte	0
		.byte	"YOU ARE NOW", 0
		.byte	"READY TO ATTACK", 0
		.byte	"ENEMY BASES.", 0
		.byte	0
		.byte	"DESTROY THE", 0
		.byte	"SPACE STATION AT", 0
		.byte	"THE COORDINATES", 0
		.byte	"SHOWN BELOW.", -1

MTXT3:		.byte	12, 3, "YOUR VALIANT", 0
		.byte	"DEEDS HAVE", 0
		.byte	"EARNED YOU OUR", 0
		.byte	"THANKS, BUT THE", 0
		.byte	"ENEMY THREAT IS", 0
		.byte	"STILL GROWING...", 0
		.byte	0
		.byte	"OUR SOURCES SHOW", 0
		.byte	"A MAJOR CONCEN-", 0
		.byte	"TRATION OF THE", 0
		.byte	"ENEMY FLEET AT", 0
		.byte	"THE LOCATION", 0
		.byte	"BELOW.", -1

MTXT3A:		.byte	12, 3, "DESTROY ALL", 0
		.byte	"ENEMY BASES IN", 0
		.byte	"THIS SYSTEM", 0
		.byte	"BEFORE THE ENEMY", 0
		.byte	"CAN MOBILIZE TO", 0
		.byte	"ATTACK US.", 0
		.byte	0
		.byte	"GOOD LUCK!", -1

MTXT4:		.byte	12, 3, "A CAPTURED ENEMY", 0
		.byte	"SPY HAS REVEALED", 0
		.byte	"THE EXISTENCE OF", 0
		.byte	"A POWERFUL NEW", 0
		.byte	"WEAPON BEING", 0
		.byte	"DEVELOPED IN A", 0
		.byte	"LABORATORY AT", 0
		.byte	"THE COORDINATES", 0
		.byte	"LISTED BELOW.", 0
		.byte	0
		.byte	"INVESTIGATE AND", 0
		.byte	"REPORT BACK.", -1

MTXT5:		.byte	12, 3, "THE MESSAGE CAP-", 0
		.byte	"SULE THAT YOU", 0
		.byte	"OBTAINED FROM", 0
		.byte	"THE ENEMY SPACE", 0
		.byte	"STATION REVEALS", 0
		.byte	"THAT THE NEW", 0
		.byte	"WEAPON, CALLED", 0
		.byte	"THE THUNDERBOLT,", 0
		.byte	"HAS BEEN MOVED", 0
		.byte	"TO THE SPACE", 0
		.byte	"STATION AT THE", 0
		.byte	"COORDINATES", 0
		.byte	"BELOW.", -1

MTXT5A:		.byte	12, 3, "FIND THE WEAPON", 0
		.byte	"BUT USE IT ONLY", 0
		.byte	"SPARINGLY AS IT", 0
		.byte	"MAY BE THE ONLY", 0
		.byte	"ONE OF ITS KIND.", -1

MTXT6:		.byte	12, 3, "GREAT JOB!", 0
		.byte	0
		.byte	"THE THUNDERBOLT", 0
		.byte	"SHOULD MAKE YOUR", 0
		.byte	"SHIP POWERFUL", 0
		.byte	"ENOUGH TO DEFEAT", 0
		.byte	"THE P*RADIKUS", 0
		.byte	"FLEET...", -1

MTXT6A:		.byte	12, 3, "OUR SCOUTS TELL", 0
		.byte	"US OF INCREASING", 0
		.byte	"ENEMY ACTIVITY", 0
		.byte	"AT THE LOCATION", 0
		.byte	"BELOW.", 0
		.byte	0
		.byte	"INVESTIGATE AND", 0
		.byte	"REPORT BACK.", -1

MTXT7:		.byte	12, 3, "THIS MESSAGE", 0
		.byte	"CAPSULE SHOWS", 0
		.byte	"THE LOCATION OF", 0
		.byte	"AN ENEMY STRONG-", 0
		.byte	"HOLD IN THE", 0
		.byte	"LOCATION BELOW.", 0
		.byte	0
		.byte	"WE BELIEVE THAT", 0
		.byte	"THE HOME PLANET", 0
		.byte	"OF THE P*RADIKUS", 0
		.byte	"FLEET IS SOME-", 0
		.byte	"WHERE IN THIS", 0
		.byte	"SECTOR.", -1

MTXT8:		.byte	12, 3, "ANALYSIS OF THE", 0
		.byte	"DRIVE THAT YOU", 0
		.byte	"OBTAINED SHOWS", 0
		.byte	"IT TO BE OF A", 0
		.byte	"HIGHLY ADVANCED", 0
		.byte	"NATURE---IT IS", 0
		.byte	"FAR BETTER THAN", 0
		.byte	"ANYTHING OUR", 0
		.byte	"ENGINEERS CAN", 0
		.byte	"PRODUCE!", -1

MTXT8A:		.byte	12, 3, "ALSO, THE DRIVE", 0
		.byte	"APPEARS TO HAVE", 0
		.byte	"AN AUTO-HOMING", 0
		.byte	"ATTACHMENT THAT", 0
		.byte	"WE BELIEVE WILL", 0
		.byte	"LEAD YOU DIRECT-", 0
		.byte	"LY TO THE HOME", 0
		.byte	"PLANET OF THE", 0
		.byte	"P*RADIKUS FLEET.", -1

MTXT8B:		.byte	12, 3, "OUR SCIENTISTS", 0
		.byte	"HAVE SUCCEEDED", 0
		.byte	"IN COPYING THE", 0
		.byte	"THUNDERBOLT, BUT", 0
		.byte	"ONLY IN LIMITED", 0
		.byte	"AMOUNTS---WE", 0
		.byte	"HAVE GIVEN YOU", 0
		.byte	"WHAT WE CAN", 0
		.byte	"SPARE.", -1

MTXT8C:		.byte	12, 3, "YOUR FINAL", 0
		.byte	"MISSION IS TO", 0
		.byte	"DESTROY THE", 0
		.byte	"P*RADIKUS HOME", 0
		.byte	"PLANET, IF YOU", 0
		.byte	"CAN FIND IT...", 0
		.byte	0
		.byte	"GOOD LUCK AND", 0
		.byte	"DON*T FORGET TO", 0
		.byte	"STOCK UP ON", 0
		.byte	"WEAPONS BEFORE", 0
		.byte	"YOU LEAVE.", -1

		;	SECTOR, SYSTEM, POSITION
HOMELOC:	.byte	 4,  4, 15, 16,  63,  80
M1LOC:		.byte	 4,  4, -1, -1,  -1,  -1
M2LOC:		.byte	 5,  3, 12,  5,  82,  73
M3LOC:		.byte	 3,  5, 14,  3,  -1,  -1
M4LOC:		.byte	 1,  4, 14, 11,   7, 116
M5LOC:		.byte	 1,  5, 13, 14, 113,  84
M6LOC:		.byte	 6,  7,  9, 10,  67,  77
M7LOC:		.byte	 8,  8, -1, -1,  -1,  -1
M8LOC:		.byte	-1, -1, -1, -1,  -1,  -1




;
;****************************
; INT. VECTORS
;****************************

IRQ:	JMP	BOOT		;power up or reset
	RTI

NMI:	RTI

.segment "VECTOR1"

.word	NMI
.word	BOOT
.word	IRQ

;****************************
; END
;****************************

.endscope
