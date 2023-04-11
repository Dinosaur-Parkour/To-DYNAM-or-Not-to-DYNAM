       CBL OPT(2),NODYNAM
       CBL ARCH(12) TUNE(12)
       CBL DISPSIGN(SEP)
       IDENTIFICATION DIVISION.
    5  PROGRAM-ID.    TODYNAM6.
    6  DATA DIVISION.
    7  WORKING-STORAGE SECTION.
    8  01  STUFF-FOR-THIS-PGM.
    9      05 WS-A31BR14I        PIC  X(08) Value 'A31BR14I'.

      *===============================================================
   12  PROCEDURE DIVISION.
   13  PROGRAM-MAIN.
   14      CALL WS-A31BR14I   *> Call Identifier
   15      CALL 'A31BR14L'    *> Call Literal
   16      GOBACK.

