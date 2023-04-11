//DYNAMIC4 JOB   NOTIFY=&SYSUID.
//*
//*
//*-------------(  COBOL 4.2 ) ---------------------------------------
//*  WHEN THE COMPILER OPTION IS DYNAM
//*  HOW MUCH CPU IS USED TO DO:
//*      CALL WS-A31BR14
//*  VS  CALL 'A31BR14'
//*-------------(  COBOL 4.2 ) ---------------------------------------
//DYNAM42  EXEC PGM=TODYNAM3,REGION=0M
//STEPLIB  DD DISP=SHR,DSN=Z08115.DINO.LOADLIB
//SYSPUNCH DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
