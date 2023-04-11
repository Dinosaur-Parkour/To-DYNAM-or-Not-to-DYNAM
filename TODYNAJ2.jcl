//STATIC  JOB   NOTIFY=&SYSUID.
//*
//*
//*-------------------------------------------------------------------
//*  WHEN THE COMPILER OPTION IS NODYNAM
//*  HOW MUCH CPU IS USED TO DO:
//*      CALL WS-A31BR14
//*  VS  CALL 'A31BR14'
//*-------------------------------------------------------------------
//STATIC   EXEC PGM=TODYNAM2,REGION=0M
//STEPLIB  DD DISP=SHR,DSN=Z08115.DINO.LOADLIB
//SYSPUNCH DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
