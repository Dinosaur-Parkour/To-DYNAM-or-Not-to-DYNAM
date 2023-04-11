       CBL OPT,DYNAM
       IDENTIFICATION DIVISION.
    3  PROGRAM-ID.    TODYNAM3.
      *===============================================================
      *     Call WS-A31BR14 Using CPUTIME-DATA-ITEMS
      *     Call 'A31BR14'  Using CPUTIME-DATA-ITEMS
      *===============================================================
    8  DATA DIVISION.
    9  WORKING-STORAGE SECTION.

   11  01  STUFF-FOR-THIS-PGM.
   12      05 WS-A31BR14         PIC  X(08) Value 'A31BR14'.


   15  01  CPUTIME-DATA-ITEMS.
   16      05 CPUTIME-Start      PIC  9(12)V9(6) COMP-5.
   17      05 CPUTIME-End        PIC  9(12)V9(6) COMP-5.
   18      05 CPUTIME-Diff       PIC  9(12)V9(6) COMP-5.
   19      05 CPUTIME-Show-CPU   PIC  ZZ9.9(6).
   20      05 COBOL-DIFF         PIC  9(03)V9(6) COMP-5.
   21      05 W-CPUTIME9         PIC  X(08) Value 'CPUTIME9'.


      *===============================================================
   25  PROCEDURE DIVISION.
      *---------------------------------------------------------------
      *
      *---------------------------------------------------------------
   29  PROGRAM-MAIN.
   30      Perform Get-Start-CPU
   31      CALL WS-A31BR14

   33      Display 'Compiler option is DYNAM.... COBOL 4.2'
   34      Display ' '

   36      Display 'Measure Call WS-A31BR14   Dynamic Call Identifier'
   37      Perform Measure-Call-Var  5 Times

   39      Display ' '
   40      Display "Measure Call 'A31BR14'    Dynamic Call Literal"
   41      Perform Measure-Call-Literal  5 Times

   43      GOBACK.


      *--------------------------------------------------------------
      *  Measure Call VARIABLE
      *--------------------------------------------------------------
   49  Measure-Call-Var.
   50      Perform Get-Start-CPU
   51      Perform 1000000 Times
   52          Call WS-A31BR14  Using CPUTIME-DATA-ITEMS
   53      End-Perform
   54      Perform Get-End-CPU
   55      Perform Show-CPU-Used
   56      EXIT.



      *--------------------------------------------------------------
      *  Measure Call Literal
      *--------------------------------------------------------------
   63  Measure-Call-Literal.
   64      Perform Get-Start-CPU
   65      Perform 1000000 Times
   66          Call 'A31BR14' Using CPUTIME-DATA-ITEMS
   67      End-Perform
   68      Perform Get-End-CPU
   69      Perform Show-CPU-Used
   70      EXIT.



      *--------------------------------------------------------------
      *    get the CPU Usage Before the code to be measured.
      *--------------------------------------------------------------
   77  GET-Start-CPU.
   78      Call W-CPUTIME9 Using CPUTIME-Start
   79      EXIT.


      *--------------------------------------------------------------
      *    get the CPU Usage Before the code to be measured.
      *--------------------------------------------------------------
   85  GET-End-CPU.
   86      Call W-CPUTIME9 Using CPUTIME-End
   87      EXIT.


      *--------------------------------------------------------------
      *    Calculate the amount Of CPU Used and SHOW results
      *--------------------------------------------------------------
   93  Show-CPU-Used.
   94      Compute CPUTIME-DIFF = CPUTIME-End - CPUTIME-Start
   95      Move CPUTIME-DIFF to CPUTIME-Show-CPU
   96      Display ' E: '  CPUTIME-End '  -  S: '  CPUTIME-Start
   97              ' =  '  CPUTIME-Show-CPU

   99      EXIT.

