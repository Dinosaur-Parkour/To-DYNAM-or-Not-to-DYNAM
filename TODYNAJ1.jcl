//DYNAMIC JOB   NOTIFY=&SYSUID.
//*
//*
//*-------------------------------------------------------------------
//*  WHEN THE COMPILER OPTION IS DYNAM
//*  HOW MUCH CPU IS USED TO DO:
//*      CALL WS-A31BR14
//*  VS  CALL 'A31BR14'
//*-------------------------------------------------------------------
//DYNAM    EXEC PGM=TODYNAM1,REGION=0M
//STEPLIB  DD DISP=SHR,DSN=Z08115.DINO.LOADLIB
//SYSPUNCH DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
