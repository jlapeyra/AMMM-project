
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 4 rows and 1 columns.
MIQCP Presolve modified 59 coefficients.
Reduced MIQCP has 65 rows, 97 columns, and 365 nonzeros.
Reduced MIQCP has 20 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 7 quadratic constraints.
Presolve time = 0,00 sec. (0,63 ticks)
Probing fixed 0 vars, tightened 56 bounds.
Probing time = 0,00 sec. (0,19 ticks)
Clique table members: 13.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (0,11 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0       29,8862     0                    107,6023        0         
      0     0       29,4676     0                     Cone: 1        1         
      0     0       29,4360     2                     Cone: 3        3         
      0     0       29,3318     4                     Cone: 4        7         
      0     0       29,2686     8                     Cone: 6       12         
      0     0       29,0155     7                     Cone: 7       16         
      0     0       28,9941     7                     Cone: 8       18         
      0     0       26,8931     9                    Cone: 40      103         
      0     0       26,8931    16                    Cone: 60      118         
      0     0       26,8931    20                    Cone: 80      134         
      0     0       26,8931    20                   Cone: 100      149         
      0     0       26,8931    20                   Cone: 118      162         
      0     0       26,8931    20                   Cone: 134      175         
      0     0       26,8931    20                   Cone: 145      184         
      0     0       26,8931    20                   Cone: 153      194         
      0     0       26,8931    20                   Cone: 158      201         
      0     0       26,8931    20                   Cone: 160      203         
      0     0       26,8931    20                   Cone: 162      205         
      0     0       26,8931    20                     26,8931      205         
*     0+    0                            6,9100       26,8931           289,19%
      0     0       24,9561    19        6,9100      Cuts: 41      277  261,16%
*     0+    0                            7,1100       24,9561           251,00%
      0     0       23,9539    19        7,1100      Cuts: 23      297  236,90%
      0     0       23,8665    20        7,1100      Cuts: 24      306  235,68%
      0     0       23,2584    18        7,1100      Cuts: 19      318  227,12%
      0     0       22,5420    18        7,1100      Cuts: 18      339  217,05%
      0     0       22,3986    20        7,1100      Cuts: 13      347  215,03%
      0     0       22,0631    18        7,1100      Cuts: 16      357  210,31%
      0     0       21,9952    20        7,1100      Cuts: 12      362  209,36%
      0     0       21,1680    20        7,1100  LiftProj: 20      379  197,72%
      0     0       20,9750    20        7,1100      Cuts: 26      388  195,01%
      0     0       20,7925    20        7,1100      Cuts: 13      398  192,44%
      0     0       20,7131    19        7,1100      Cuts: 21      406  191,32%
      0     0       20,6743    19        7,1100       Cuts: 8      411  190,78%
*     0+    0                            7,1600       20,6743           188,75%
      0     0       19,3236    19        7,1600  LiftProj: 20      435  169,88%
      0     0       18,9154    19        7,1600      Cuts: 28      447  164,18%
      0     0       18,7956    20        7,1600      Cuts: 15      456  162,51%
      0     0       18,7819    20        7,1600  LiftProj: 15      464  162,32%
      0     0       18,7810    20        7,1600       Cuts: 4      466  162,30%
      0     0       18,1223    20        7,1600  LiftProj: 19      489  153,10%
*     0+    0                            7,3500       18,1223           146,56%
      0     0       17,9134    20        7,3500  LiftProj: 16      501  143,72%
      0     0       17,6305    20        7,3500  LiftProj: 19      517  139,87%
      0     0       17,5969    19        7,3500      Cuts: 27      523  139,41%
      0     0       17,5448    20        7,3500      Cuts: 23      531  138,70%
      0     0       17,5448    20        7,3500   LiftProj: 1      532  138,70%
      0     2       17,5448    20        7,3500       17,5448      532  138,70%
Elapsed time = 0,84 sec. (556,78 ticks, tree = 0,02 MB, solutions = 4)
*     5+    2                            8,1600       16,4011           100,99%
*   159    19      integral     0        8,2500       15,1186     1875   83,26%
*   255    16      integral     0        8,6600       15,1186     2331   74,58%

Flow cuts applied:  1
Mixed integer rounding cuts applied:  4
Lift and project cuts applied:  39
Gomory fractional cuts applied:  1
Cone linearizations applied:  259

Root node processing (before b&c):
  Real time             =    0,69 sec. (556,61 ticks)
Parallel b&c, 12 threads:
  Real time             =    0,56 sec. (19,63 ticks)
  Sync time (average)   =    0,38 sec.
  Wait time (average)   =    0,00 sec.
                          ------------
Total (root+branch&cut) =    1,25 sec. (576,23 ticks)

<<< solve


OBJECTIVE: 8.66

<<< post process


<<< done

