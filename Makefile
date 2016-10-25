NAME     = pradikus
SRCDIR   = PRADIKUS

INCLUDES =\
	$(SRCDIR)/BANK1.ASM \
	$(SRCDIR)/PLANETS.DAT \
	$(SRCDIR)/PLNTMAPS.ASM \
	$(SRCDIR)/PRAD.ASM \
	$(SRCDIR)/PRADSYS.DAT \
	$(SRCDIR)/RAMVARS.ASM \
	$(SRCDIR)/PRADVID.ROM
	
pradikus.nes: main.asm $(INCLUDES)
	ca65 -t nes -I $(SRCDIR)/ -o $(NAME).o main.asm
	ld65 -C colordreams.ini -o $(NAME).nes $(NAME).o
	