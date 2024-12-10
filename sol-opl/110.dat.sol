
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 82 rows and 1 columns.
MIQCP Presolve modified 380 coefficients.
Reduced MIQCP has 1323 rows, 1346 columns, and 10854 nonzeros.
Reduced MIQCP has 110 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 188 quadratic constraints.
Presolve time = 0,09 sec. (26,79 ticks)
Probing fixed 0 vars, tightened 630 bounds.
Probing time = 0,02 sec. (8,31 ticks)
Cover probing fixed 0 vars, tightened 140 bounds.
Clique table members: 271.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (1,84 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0      734,5396     0                   3452,0054       25         
      0     0      731,2109    17                     Cone: 3       42         
      0     0      730,5462     4                     Cone: 5       64         
      0     0      730,0816    16                     Cone: 6       81         
      0     0      729,5323    27                     Cone: 7      104         
      0     0      728,6062    27                     Cone: 8      130         
      0     0      728,3872    25                     Cone: 9      150         
      0     0      685,2356    34                   Cone: 386     1048         
      0     0      685,2356    85                   Cone: 496     1267         
      0     0      685,2356   107                   Cone: 606     1377         
      0     0      685,2356   110                   Cone: 716     1623         
      0     0      685,2356   109                   Cone: 822     1944         
      0     0      685,2356   110                   Cone: 924     2141         
      0     0      685,2356   110                  Cone: 1017     2233         
      0     0      685,2356   110                  Cone: 1086     2302         
      0     0      685,2356   110                  Cone: 1146     2365         
      0     0      685,2356   110                  Cone: 1199     2581         
      0     0      685,2356   110                  Cone: 1231     2618         
      0     0      685,2356   110                  Cone: 1252     2643         
      0     0      685,2356   110                  Cone: 1273     2665         
      0     0      685,2356   110                  Cone: 1285     2678         
      0     0      685,2356   110                  Cone: 1294     2689         
      0     0      685,2356   110                  Cone: 1300     2695         
      0     0      685,2356   110                  Cone: 1309     2705         
      0     0      685,2356   110                  Cone: 1315     2713         
      0     0      685,2356   110                  Cone: 1320     2718         
      0     0      685,2356   110                  Cone: 1323     2722         
      0     0      685,2356   110                  Cone: 1325     2725         
      0     0      685,2356   110                  Cone: 1326     2726         
      0     0      685,2356   110                    685,2356     2726         
      0     0      684,0926   107                   Cuts: 279     3521         
*     0+    0                          148,2000      684,0926           361,60%
      0     0      683,1925   108      148,2000      Cuts: 78     3609  360,99%
      0     0      682,3865   109      148,2000      Cuts: 70     3675  360,45%
      0     0      682,0146   109      148,2000      Cuts: 48     3734  360,20%
      0     0      681,6728   107      148,2000      Cuts: 66     3778  359,97%
      0     0      681,0567   106      148,2000      Cuts: 54     3842  359,55%
      0     0      680,8035   109      148,2000      Cuts: 58     3895  359,38%
      0     0      680,6443   107      148,2000      Cuts: 56     3972  359,27%
      0     0      680,3343   109      148,2000      Cuts: 53     4027  359,06%
      0     0      680,2103   109      148,2000      Cuts: 46     4069  358,98%
      0     0      680,0005   109      148,2000      Cuts: 21     4102  358,84%
      0     0      679,8204   109      148,2000      Cuts: 14     4134  358,72%
      0     0      679,7504   109      148,2000      Cuts: 10     4154  358,67%
      0     0      679,7163   110      148,2000       Cuts: 6     4172  358,65%
      0     2      679,7110   110      148,2000      679,7163     4172  358,65%
Elapsed time = 10,49 sec. (12122,26 ticks, tree = 0,02 MB, solutions = 1)
*     4+    1                          151,6700      676,9093           346,30%
      4     6      675,2579   106      151,6700      676,5492     4457  346,07%
*     5+    4                          154,9300      676,5492           336,68%
      7     4      649,3043    97      154,9300      676,5492     4611  336,68%
     13    12      652,2408   100      154,9300      676,2082     5574  336,46%
     23    23      652,0583    98      154,9300      672,0743     6899  333,79%
*    75+    8                          159,3600      672,0743           321,73%
     79    36      611,7687    92      159,3600      672,0743     8661  321,73%
    118    42      600,1230    85      159,3600      666,9998     9937  318,55%
    170    95      590,1340    77      159,3600      666,9998    15527  318,55%
    214   145      534,4786    64      159,3600      666,9998    22499  318,55%
    315   216      606,4176    74      159,3600      666,9998    29490  318,55%
   1148   918      234,5721    12      159,3600      666,9998   104510  318,55%
Elapsed time = 19,14 sec. (15393,23 ticks, tree = 2,09 MB, solutions = 11)
   1779  1515        cutoff            159,3600      652,5094   173969  309,46%
   2850  2391      555,7029    56      159,3600      644,9358   259264  304,70%
   3923  3241      470,6344    55      159,3600      641,0405   335437  302,26%
   4590  4084      333,1473    30      159,3600      639,4992   429054  301,29%
   5475  4693      579,5056    63      159,3600      637,2603   490756  299,89%
   6210  5491      358,8150    32      159,3600      634,7554   572084  298,32%
   7080  6049        cutoff            159,3600      633,0090   630586  297,22%
   7735  6822      519,6418    56      159,3600      632,2717   713476  296,76%
   8671  7525      594,2989    63      159,3600      630,8748   793383  295,88%
   9595  8156      356,6533    22      159,3600      629,7895   855567  295,20%
Elapsed time = 47,36 sec. (24938,55 ticks, tree = 10,58 MB, solutions = 11)
  10380  9059      433,9631    34      159,3600      628,4057   944215  294,33%
  11283  9754      218,8740    12      159,3600      627,8126  1016435  293,96%
  12114 10704      569,4595    72      159,3600      627,4777  1115388  293,75%
  12889 11228      603,9624    88      159,3600      626,4829  1170984  293,12%
