; The P'Radikus Conflict (NES) source code
; ca65 version by Devin Acker (Revenant)
; 7 November 2013
; original program (c) 1990 Color Dreams

; Assemble this file using ca65, and link with ld65 using colordreams.ini as a config.
; Be sure to edit colordreams.ini if changing the PRG or CHR sizes to enable additional
; code / CHR segments.

;
; INES header
;

.segment "INES"
.byte "NES", $1a
.byte 4 ; 16kb * 4 = 64kb PRG-ROM
.byte 8 ;  8kb * 8 = 64kb CHR-ROM

; mapper 11 (Color Dreams), vertical mirroring, no SRAM/trainer
.byte $b1

;
; PRG-ROM source
;

.include "RAMVARS.ASM"

; segments BANK0 and VECTOR0
.include "PRAD.ASM"
; segments BANK1 and VECTOR1
.include "BANK1.ASM"

;
; CHR-ROM binary
; (NEWPRAD.VID contains the graphics in the original source, but it's
;  larger than the actual CHR ROM and stored in an unusual way.
;  Let's just be cheap and use the actual ROM for this part for now)
;

.segment "CHR00"
.incbin  "PRADVID.ROM", $0000, $2000
.segment "CHR01"
.incbin  "PRADVID.ROM", $2000, $2000
.segment "CHR02"
.incbin  "PRADVID.ROM", $4000, $2000
.segment "CHR03"
.incbin  "PRADVID.ROM", $6000, $2000
.segment "CHR04"
.incbin  "PRADVID.ROM", $8000, $2000
.segment "CHR05"
.incbin  "PRADVID.ROM", $a000, $2000
.segment "CHR06"
.incbin  "PRADVID.ROM", $c000, $2000
.segment "CHR07"
.incbin  "PRADVID.ROM", $e000, $2000