       CBL OPT(2),DYNAM
       CBL ARCH(12) TUNE(12)
       CBL DISPSIGN(SEP)
       IDENTIFICATION DIVISION.
    5  PROGRAM-ID.    TODYNAM1.
      *===============================================================
      *     Call WS-A31BR14 Using CPUTIME-DATA-ITEMS
      *     Call 'A31BR14'  Using CPUTIME-DATA-ITEMS
      *===============================================================
   10  DATA DIVISION.
   11  WORKING-STORAGE SECTION.

   13  01  STUFF-FOR-THIS-PGM.
   14      05 WS-A31BR14         PIC  X(08) Value 'A31BR14'.


   17  01  CPUTIME-DATA-ITEMS.
   18      05 CPUTIME-Start      PIC  9(12)V9(6) COMP-5.
   19      05 CPUTIME-End        PIC  9(12)V9(6) COMP-5.
   20      05 CPUTIME-Diff       PIC  9(12)V9(6) COMP-5.
   21      05 CPUTIME-Show-CPU   PIC  ZZ9.9(6).
   22      05 COBOL-DIFF         PIC  9(03)V9(6) COMP-5.
   23      05 W-CPUTIME9         PIC  X(08) Value 'CPUTIME9'.


      *===============================================================
   27  PROCEDURE DIVISION.
      *---------------------------------------------------------------
      *
      *---------------------------------------------------------------
   31  PROGRAM-MAIN.
   32      Perform Get-Start-CPU  *> Get Setup stuff out Of way
   33      Call  ws-a31br14

   35      Display 'Compiler option is DYNAM'
   36      Display ' '

   38      Display 'Measure Call WS-A31BR14   Dynamic Call Identifier'
   39      Perform Measure-Call-Var  5 Times

   41      Display ' '
   42      Display "Measure Call 'A31BR14'    Dynamic Call Literal"
   43      Perform Measure-Call-Literal  5 Times

   45      GOBACK.


      *--------------------------------------------------------------
      *  Measure Call VARIABLE
      *--------------------------------------------------------------
   51  Measure-Call-Var.
   52      Perform Get-Start-CPU
   53      Perform 1000000 Times
   54          Call WS-A31BR14  Using CPUTIME-DATA-ITEMS
   55      End-Perform
   56      Perform Get-End-CPU
   57      Perform Show-CPU-Used
   58      EXIT.



      *--------------------------------------------------------------
      *  Measure Call Literal
      *--------------------------------------------------------------
   65  Measure-Call-Literal.
   66      Perform Get-Start-CPU
   67      Perform 1000000 Times
   68          Call 'A31BR14' Using CPUTIME-DATA-ITEMS
   69      End-Perform
   70      Perform Get-End-CPU
   71      Perform Show-CPU-Used
   72      EXIT.



      *--------------------------------------------------------------
      *    get the CPU Usage Before the code to be measured.
      *--------------------------------------------------------------
   79  GET-Start-CPU.
   80      Call W-CPUTIME9 Using CPUTIME-Start
   81      EXIT.


      *--------------------------------------------------------------
      *    get the CPU Usage Before the code to be measured.
      *--------------------------------------------------------------
   87  GET-End-CPU.
   88      Call W-CPUTIME9 Using CPUTIME-End
   89      EXIT.


      *--------------------------------------------------------------
      *    Calculate the amount Of CPU Used and SHOW results
      *--------------------------------------------------------------
   95  Show-CPU-Used.
   96      Compute CPUTIME-DIFF = CPUTIME-End - CPUTIME-Start
   97      Move CPUTIME-DIFF to CPUTIME-Show-CPU
   98      Display ' E: '  CPUTIME-End '  -  S: '  CPUTIME-Start
   99              ' =  '  CPUTIME-Show-CPU

  101      EXIT.

