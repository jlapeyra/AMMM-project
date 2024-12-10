
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 12 rows and 1 columns.
MIQCP Presolve modified 155 coefficients.
Reduced MIQCP has 115 rows, 161 columns, and 755 nonzeros.
Reduced MIQCP has 30 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 13 quadratic constraints.
Presolve time = 0,02 sec. (1,50 ticks)
Probing fixed 0 vars, tightened 118 bounds.
Probing time = 0,00 sec. (0,63 ticks)
Clique table members: 23.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (0,20 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0       47,3329     0                    253,0320        0         
      0     0       46,5164     0                     Cone: 1        2         
      0     0       46,2966     2                     Cone: 2        5         
      0     0       46,0628     5                     Cone: 3       11         
      0     0       46,0002     9                     Cone: 4       14         
      0     0       45,8991     8                     Cone: 5       17         
      0     0       45,8628    10                     Cone: 7       21         
      0     0       41,3783    12                    Cone: 59      153         
      0     0       41,3783    24                    Cone: 89      179         
      0     0       41,3783    30                   Cone: 119      204         
      0     0       41,3783    30                   Cone: 149      229         
      0     0       41,3783    30                   Cone: 178      254         
      0     0       41,3783    30                   Cone: 206      315         
      0     0       41,3783    30                   Cone: 233      383         
      0     0       41,3783    30                   Cone: 251      399         
      0     0       41,3783    30                   Cone: 263      520         
      0     0       41,3783    30                   Cone: 270      529         
      0     0       41,3783    30                   Cone: 278      537         
      0     0       41,3783    30                   Cone: 284      542         
      0     0       41,3783    30                   Cone: 290      550         
      0     0       41,3783    30                   Cone: 295      556         
      0     0       41,3783    30                   Cone: 297      558         
      0     0       41,3783    30                     41,3783      558         
*     0+    0                            6,6800       41,3783           519,44%
      0     0       36,1751    30        6,6800      Cuts: 62      698  441,54%
*     0+    0                            7,0100       36,1751           416,05%
      0     0       33,2490    29        7,0100      Cuts: 29      733  374,31%
*     0+    0                            7,7500       33,2490           329,02%
      0     0       33,1087    29        7,7500      Cuts: 16      747  327,21%
      0     0       33,0216    29        7,7500       Cuts: 9      761  326,08%
      0     0       32,6502    29        7,7500      Cuts: 23      782  321,29%
      0     0       32,4745    30        7,7500      Cuts: 12      794  319,03%
      0     0       30,9068    27        7,7500      Cuts: 31      831  298,80%
      0     0       30,5298    27        7,7500      Cuts: 23      844  293,93%
      0     0       30,1058    29        7,7500      Cuts: 30      873  288,46%
      0     0       28,9062    28        7,7500      Cuts: 41      907  272,98%
      0     0       28,5694    28        7,7500      Cuts: 36      928  268,64%
      0     0       28,4896    29        7,7500      Cuts: 21      941  267,61%
      0     0       28,2678    28        7,7500      Cuts: 23      952  264,75%
      0     0       28,1311    30        7,7500      Cuts: 11      958  262,98%
      0     0       28,1296    30        7,7500       Cuts: 9      960  262,96%
      0     0       27,5372    27        7,7500      Cuts: 35      977  255,32%
      0     0       27,0200    29        7,7500      Cuts: 41     1009  248,65%
      0     0       26,3994    30        7,7500      Cuts: 32     1035  240,64%
      0     0       26,3539    30        7,7500       Cuts: 9     1045  240,05%
      0     0       26,3355    29        7,7500      Cuts: 15     1050  239,81%
      0     0       26,1178    28        7,7500      Cuts: 33     1066  237,00%
      0     0       25,6809    29        7,7500      Cuts: 32     1083  231,37%
      0     0       25,6429    30        7,7500      Cuts: 13     1090  230,88%
      0     0       24,2617    25        7,7500  LiftProj: 26     1129  213,05%
*     0+    0                            8,0100       24,2617           202,89%
      0     0       24,0747    29        8,0100      Cuts: 31     1142  200,56%
      0     0       23,9650    29        8,0100      Cuts: 18     1151  199,19%
      0     0       23,8705    30        8,0100      Cuts: 24     1159  198,01%
      0     0       23,5551    28        8,0100      Cuts: 41     1178  194,07%
      0     0       23,2761    29        8,0100      Cuts: 34     1196  190,59%
      0     0       23,2456    30        8,0100      Cuts: 24     1202  190,21%
      0     0       23,0252    27        8,0100      Cuts: 30     1214  187,46%
      0     0       22,9668    29        8,0100      Cuts: 27     1228  186,73%
      0     0       22,9257    29        8,0100      Cuts: 19     1238  186,21%
      0     0       22,9037    30        8,0100      Cuts: 16     1242  185,94%
      0     0       22,1016    27        8,0100  LiftProj: 27     1273  175,92%
      0     0       21,9425    27        8,0100      Cuts: 45     1293  173,94%
      0     0       21,8849    28        8,0100      Cuts: 34     1306  173,22%
      0     0       21,7986    27        8,0100      Cuts: 25     1318  172,14%
      0     0       21,7653    28        8,0100      Cuts: 27     1324  171,73%
      0     0       21,7141    26        8,0100      Cuts: 23     1335  171,09%
      0     0       21,6582    30        8,0100      Cuts: 16     1345  170,39%
      0     0       21,5910    28        8,0100      Cuts: 27     1361  169,55%
      0     0       21,5581    30        8,0100  LiftProj: 21     1370  169,14%
      0     0       21,2774    29        8,0100      Cuts: 26     1386  165,64%
      0     0       21,2582    29        8,0100      Cuts: 28     1393  165,40%
      0     0       21,2180    29        8,0100   LiftProj: 2     1397  164,89%
      0     0       21,1939    30        8,0100      Cuts: 10     1404  164,59%
      0     0       21,1713    29        8,0100   LiftProj: 2     1407  164,31%
*     0+    0                            8,2700       21,1713           156,00%
      0     2       21,1713    29        8,2700       21,1713     1407  156,00%
Elapsed time = 3,50 sec. (2497,84 ticks, tree = 0,02 MB, solutions = 5)
*   454+   11                            8,4200       19,7433           134,48%
*  1056   175      integral     0        8,5600       16,2099    13439   89,37%
*  1787   301      integral     0        8,5800       14,0567    22205   63,83%

Flow cuts applied:  1
Mixed integer rounding cuts applied:  6
Lift and project cuts applied:  80
Cone linearizations applied:  574

Root node processing (before b&c):
  Real time             =    3,47 sec. (2497,50 ticks)
Parallel b&c, 12 threads:
  Real time             =    0,36 sec. (105,43 ticks)
  Sync time (average)   =    0,18 sec.
  Wait time (average)   =    0,00 sec.
                          ------------
Total (root+branch&cut) =    3,83 sec. (2602,93 ticks)

<<< solve


OBJECTIVE: 8.58

<<< post process


<<< done

