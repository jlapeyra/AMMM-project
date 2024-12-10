
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 26 rows and 1 columns.
MIQCP Presolve modified 187 coefficients.
Reduced MIQCP has 210 rows, 269 columns, and 1412 nonzeros.
Reduced MIQCP has 40 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 27 quadratic constraints.
Presolve time = 0,02 sec. (2,71 ticks)
Probing fixed 0 vars, tightened 205 bounds.
Probing time = 0,00 sec. (1,54 ticks)
Clique table members: 38.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (0,34 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0       61,4419     0                    440,2806        0         
      0     0       61,1086     0                     Cone: 1        1         
      0     0       60,6306     2                     Cone: 2        3         
      0     0       60,5579     4                     Cone: 3        6         
      0     0       60,4967     6                     Cone: 4        9         
      0     0       60,4725     7                     Cone: 5       11         
      0     0       60,4111    10                     Cone: 7       13         
      0     0       55,4975    10                    Cone: 91      150         
      0     0       55,4975    26                   Cone: 131      185         
      0     0       55,4975    40                   Cone: 171      238         
      0     0       55,4975    38                   Cone: 211      273         
      0     0       55,4975    40                   Cone: 250      417         
      0     0       55,4975    38                   Cone: 285      496         
      0     0       55,4975    40                   Cone: 320      531         
      0     0       55,4975    40                   Cone: 346      559         
      0     0       55,4975    40                   Cone: 366      580         
      0     0       55,4975    40                   Cone: 383      782         
      0     0       55,4975    40                   Cone: 396      810         
      0     0       55,4975    40                   Cone: 408      847         
      0     0       55,4975    40                   Cone: 418      856         
      0     0       55,4975    40                   Cone: 425      885         
      0     0       55,4975    40                   Cone: 433      895         
      0     0       55,4975    40                   Cone: 437      899         
      0     0       55,4975    40                   Cone: 438      900         
      0     0       55,4975    40                   Cone: 439      901         
      0     0       55,4975    40                     55,4975      901         
*     0+    0                            7,3800       55,4975           652,00%
      0     0       47,8629    40        7,3800      Cuts: 86     1081  548,55%
      0     0       46,7953    38        7,3800      Cuts: 14     1099  534,08%
      0     0       45,2543    37        7,3800      Cuts: 38     1137  513,20%
*     0+    0                            7,6500       45,2543           491,56%
      0     0       45,0662    40        7,6500      Cuts: 18     1146  489,10%
      0     0       44,7107    40        7,6500      Cuts: 22     1169  484,45%
      0     0       44,5363    39        7,6500      Cuts: 35     1188  482,17%
      0     0       44,3207    40        7,6500      Cuts: 16     1198  479,36%
      0     0       42,7067    38        7,6500      Cuts: 31     1217  458,26%
*     0+    0                            8,2700       42,7067           416,40%
      0     0       42,1478    40        8,2700      Cuts: 29     1232  409,65%
      0     0       41,3837    37        8,2700      Cuts: 25     1260  400,41%
      0     0       41,2292    40        8,2700       Cuts: 9     1272  398,54%
      0     0       41,1865    40        8,2700      Cuts: 17     1277  398,02%
      0     0       40,5932    40        8,2700      Cuts: 24     1297  390,85%
      0     0       40,5443    40        8,2700      Cuts: 12     1305  390,26%
      0     0       38,8956    36        8,2700      Cuts: 40     1341  370,32%
      0     0       38,2034    40        8,2700      Cuts: 22     1355  361,95%
      0     0       34,6010    34        8,2700      Cuts: 42     1418  318,39%
      0     0       34,2570    37        8,2700      Cuts: 33     1451  314,23%
      0     0       34,0928    37        8,2700      Cuts: 15     1459  312,25%
      0     0       33,9036    35        8,2700      Cuts: 15     1476  309,96%
      0     0       33,7976    35        8,2700      Cuts: 17     1489  308,68%
      0     0       33,2804    36        8,2700      Cuts: 34     1521  302,42%
      0     0       33,0631    37        8,2700      Cuts: 18     1541  299,80%
      0     0       32,8932    34        8,2700      Cuts: 22     1558  297,74%
      0     0       32,8849    37        8,2700      Cuts: 13     1565  297,64%
      0     0       32,8544    36        8,2700   LiftProj: 5     1569  297,27%
      0     0       32,8346    38        8,2700      Cuts: 11     1573  297,03%
      0     0       32,8174    38        8,2700      Cuts: 10     1577  296,82%
      0     2       32,8160    39        8,2700       32,8174     1577  296,82%
Elapsed time = 3,49 sec. (2986,91 ticks, tree = 0,02 MB, solutions = 3)
*   230+   66                            8,4700       31,8550           276,09%
*   286    99      integral     0        8,9000       31,6653     5587  255,79%
*  1047+  467                            8,9300       29,0644           225,47%
   2151  1070       13,5301     6        8,9300       23,4442    42948  162,53%
*  2187  1105      integral     0        9,2400       23,3355    44656  152,55%
   6296  2107       13,5438     7        9,2400       15,8055   116003   71,06%

Flow cuts applied:  5
Mixed integer rounding cuts applied:  11
Lift and project cuts applied:  92
Cone linearizations applied:  927

Root node processing (before b&c):
  Real time             =    3,44 sec. (2986,23 ticks)
Parallel b&c, 12 threads:
  Real time             =    1,91 sec. (649,07 ticks)
  Sync time (average)   =    0,59 sec.
  Wait time (average)   =    0,00 sec.
                          ------------
Total (root+branch&cut) =    5,34 sec. (3635,29 ticks)

<<< solve


OBJECTIVE: 9.24

<<< post process


<<< done

