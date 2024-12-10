
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 5 rows and 1 columns.
MIQCP Presolve modified 101 coefficients.
Reduced MIQCP has 108 rows, 145 columns, and 737 nonzeros.
Reduced MIQCP has 30 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 10 quadratic constraints.
Presolve time = 0,00 sec. (1,43 ticks)
Probing fixed 0 vars, tightened 77 bounds.
Probing time = 0,00 sec. (0,51 ticks)
Cover probing fixed 0 vars, tightened 19 bounds.
Clique table members: 28.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (0,19 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0       74,2373     0                    249,6403        0         
      0     0       72,7468     0                     Cone: 1        5         
      0     0       72,5791     2                     Cone: 2       10         
      0     0       72,1832     7                     Cone: 3       15         
      0     0       72,1055     7                     Cone: 4       21         
      0     0       72,0445    10                     Cone: 5       26         
      0     0       71,9570     9                     Cone: 7       30         
      0     0       66,0005    12                    Cone: 55      168         
      0     0       66,0004    26                    Cone: 83      192         
      0     0       66,0003    30                   Cone: 110      214         
      0     0       66,0003    30                   Cone: 137      236         
      0     0       66,0003    30                   Cone: 161      256         
      0     0       66,0003    30                   Cone: 184      276         
      0     0       66,0003    30                   Cone: 199      291         
      0     0       66,0003    30                   Cone: 208      302         
      0     0       66,0003    30                   Cone: 215      310         
      0     0       66,0003    30                   Cone: 220      314         
      0     0       66,0003    30                   Cone: 225      319         
      0     0       66,0003    30                   Cone: 228      323         
      0     0       66,0003    30                   Cone: 229      324         
      0     0       66,0003    30                     66,0003      324         
*     0+    0                           18,2100       66,0003           262,44%
      0     0       59,9740    30       18,2100      Cuts: 57      453  229,35%
      0     0       59,0973    28       18,2100      Cuts: 26      483  224,53%
*     0+    0                           19,1500       59,0973           208,60%
      0     0       58,9059    30       19,1500      Cuts: 16      497  207,60%
*     0+    0                           19,7600       58,9059           198,11%
      0     0       58,6503    29       19,7600      Cuts: 25      518  196,81%
      0     0       58,3053    29       19,7600      Cuts: 20      539  195,07%
      0     0       58,1917    30       19,7600      Cuts: 15      552  194,49%
      0     0       57,5503    30       19,7600      Cuts: 25      580  191,25%
      0     0       57,1099    30       19,7600      Cuts: 36      595  189,02%
      0     0       55,5565    27       19,7600      Cuts: 32      631  181,16%
      0     0       53,8892    28       19,7600      Cuts: 38      660  172,72%
*     0+    0                           19,8300       53,8892           171,76%
      0     0       53,1453    29       19,8300      Cuts: 30      679  168,00%
      0     0       53,0244    29       19,8300      Cuts: 15      691  167,39%
      0     0       52,8414    30       19,8300      Cuts: 38      703  166,47%
      0     0       51,7803    29       19,8300      Cuts: 37      730  161,12%
      0     0       51,3319    30       19,8300      Cuts: 45      755  158,86%
      0     0       51,0975    28       19,8300      Cuts: 29      773  157,68%
      0     0       50,7189    29       19,8300      Cuts: 26      791  155,77%
      0     0       50,6007    30       19,8300      Cuts: 20      806  155,17%
      0     0       50,5589    30       19,8300      Cuts: 39      821  154,96%
      0     0       50,5407    30       19,8300      Cuts: 19      830  154,87%
      0     0       49,4921    29       19,8300      Cuts: 37      866  149,58%
      0     0       49,1619    30       19,8300      Cuts: 52      888  147,92%
      0     0       49,0124    29       19,8300      Cuts: 23      906  147,16%
      0     0       48,8569    30       19,8300      Cuts: 25      921  146,38%
      0     0       48,8034    29       19,8300   LiftProj: 5      928  146,11%
      0     0       48,7993    30       19,8300      Cuts: 15      932  146,09%
      0     0       46,8889    28       19,8300  LiftProj: 30      974  136,45%
      0     0       46,3696    30       19,8300      Cuts: 34      999  133,84%
      0     0       46,2241    29       19,8300      Cuts: 20     1010  133,10%
      0     0       46,0871    29       19,8300      Cuts: 21     1024  132,41%
      0     0       46,0677    30       19,8300       Cuts: 8     1029  132,31%
      0     0       46,0675    30       19,8300       Cuts: 3     1032  132,31%
*     0+    0                           20,1500       46,0675           128,62%
      0     2       46,0675    30       20,1500       46,0675     1032  128,62%
Elapsed time = 2,22 sec. (2337,43 ticks, tree = 0,02 MB, solutions = 5)
*   288    29      integral     0       20,9100       44,2639     3460  111,69%
*   447+   76                           21,7400       44,2639           103,61%
*  3007  1205      integral     0       22,1400       33,6122    53680   51,82%
   3299  1253       23,7837     6       22,1400       33,2310    55389   50,10%
   8615  1872       23,9276     4       22,1400       27,1144   140466   22,47%

Flow cuts applied:  1
Mixed integer rounding cuts applied:  10
Lift and project cuts applied:  69
Cone linearizations applied:  616

Root node processing (before b&c):
  Real time             =    2,06 sec. (2336,98 ticks)
Parallel b&c, 12 threads:
  Real time             =    1,31 sec. (586,52 ticks)
  Sync time (average)   =    0,55 sec.
  Wait time (average)   =    0,00 sec.
                          ------------
Total (root+branch&cut) =    3,38 sec. (2923,50 ticks)

<<< solve


OBJECTIVE: 22.14

<<< post process


<<< done

