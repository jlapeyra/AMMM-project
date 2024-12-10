
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 35 rows and 1 columns.
MIQCP Presolve modified 263 coefficients.
Reduced MIQCP has 211 rows, 281 columns, and 1893 nonzeros.
Reduced MIQCP has 50 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 23 quadratic constraints.
Presolve time = 0,00 sec. (4,01 ticks)
Probing fixed 0 vars, tightened 253 bounds.
Probing time = 0,00 sec. (2,40 ticks)
Clique table members: 48.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (0,42 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0       95,0287     0                    728,0160        0         
      0     0       94,7345     0                     Cone: 1        2         
      0     0       94,5417     2                     Cone: 2        5         
      0     0       94,3832     4                     Cone: 3        7         
      0     0       94,3123     8                     Cone: 4        8         
      0     0       94,2584    10                     Cone: 5       12         
      0     0       94,2111     8                     Cone: 6       14         
      0     0       86,4486    11                    Cone: 97      228         
      0     0       86,4486    34                   Cone: 147      298         
      0     0       86,4486    46                   Cone: 197      343         
      0     0       86,4486    48                   Cone: 246      404         
      0     0       86,4486    48                   Cone: 295      446         
      0     0       86,4486    48                   Cone: 339      505         
      0     0       86,4486    48                   Cone: 377      564         
      0     0       86,4486    48                   Cone: 401      588         
      0     0       86,4486    48                   Cone: 413      597         
      0     0       86,4486    48                   Cone: 423      610         
      0     0       86,4486    48                   Cone: 429      616         
      0     0       86,4486    48                   Cone: 431      618         
      0     0       86,4486    48                     86,4486      618         
*     0+    0                           11,2000       86,4486           671,86%
      0     0       78,0378    48       11,2000     Cuts: 105      859  596,77%
      0     0       76,8553    49       11,2000      Cuts: 25      889  586,21%
      0     0       76,5643    50       11,2000      Cuts: 16      909  583,61%
      0     0       74,3624    48       11,2000      Cuts: 48      957  563,95%
      0     0       73,9271    49       11,2000      Cuts: 23      975  560,06%
*     0+    0                           12,8300       73,9271           476,21%
      0     0       73,6640    50       12,8300      Cuts: 12      984  474,15%
      0     0       73,4546    49       12,8300      Cuts: 12     1002  472,52%
      0     0       72,7459    48       12,8300      Cuts: 28     1019  467,00%
      0     0       72,4932    49       12,8300      Cuts: 17     1034  465,03%
      0     0       68,4831    49       12,8300      Cuts: 36     1086  433,77%
      0     0       67,9428    49       12,8300      Cuts: 27     1106  429,56%
      0     0       67,0897    47       12,8300      Cuts: 50     1136  422,91%
      0     0       66,8001    49       12,8300      Cuts: 20     1149  420,66%
      0     0       66,6867    49       12,8300       Cuts: 8     1161  419,77%
      0     0       66,6029    49       12,8300      Cuts: 11     1174  419,12%
      0     0       66,5883    49       12,8300      Cuts: 20     1184  419,00%
      0     0       66,5738    50       12,8300       Cuts: 9     1197  418,89%
      0     0       66,5455    50       12,8300      Cuts: 11     1208  418,67%
      0     0       66,5439    49       12,8300    MIRcuts: 1     1210  418,66%
      0     2       66,5390    49       12,8300       66,5439     1210  418,66%
Elapsed time = 2,20 sec. (2887,94 ticks, tree = 0,02 MB, solutions = 2)
    388   281       20,5197     5       12,8300       59,7255    12919  365,51%
   1610  1136       28,2061    12       12,8300       53,1284    49507  314,09%
   3079  2114       27,6876    13       12,8300       50,0334    90151  289,97%
   4848  3507       18,7390     5       12,8300       46,9461   146449  265,91%
   6747  4796       30,4088    11       12,8300       45,1144   199647  251,63%
   8677  6337       25,8971     8       12,8300       43,8496   261763  241,77%
  10665  7451       16,4249     3       12,8300       42,6580   306925  232,49%
* 10694+ 7681                           12,8700       42,6261           231,20%
  12680  8977    infeasible             12,8700       41,6426   370296  223,56%
  14698 10330       32,8118    12       12,8700       40,8200   426521  217,17%
  23548 15690       30,8365    10       12,8700       38,0478   656771  195,63%
Elapsed time = 8,39 sec. (5989,46 ticks, tree = 7,10 MB, solutions = 3)
  33246 21471       27,6521    11       12,8700       35,8336   900816  178,43%
  43769 27555       20,6277     7       12,8700       34,0278  1155997  164,40%
  54815 33460       26,4935    10       12,8700       32,1831  1421415  150,06%
* 62989 37379      integral     0       12,9300       30,9867  1606536  139,65%
  66396 38394       17,0219     4       12,9300       30,4974  1659453  135,87%
* 75570 41901      integral     0       12,9400       29,3048  1845169  126,47%
  78092 43167       20,9955     8       12,9400       29,0302  1914930  124,34%
* 83616 45637      integral     0       13,0500       28,4847  2070771  118,27%
  90050 47395       26,3323    10       13,0500       27,9011  2197131  113,80%
* 98004 49991      integral     0       13,3300       27,2021  2410545  104,07%
 102054 50830       20,0081     4       13,3300       26,9154  2496568  101,92%
 114376 52882       19,2256     3       13,3300       25,9634  2736906   94,77%
 127564 54215       19,5807     5       13,3300       24,7295  3046370   85,52%
 142599 52914       15,9396     2       13,3300       22,8031  3341653   71,07%
Elapsed time = 29,16 sec. (15526,90 ticks, tree = 25,29 MB, solutions = 8)
*166818 38579      integral     0       13,5700       19,3437  3608351   42,55%
*169777 36025      integral     0       13,5700       18,9524  3617379   39,66%
 172868 32938       16,9164     3       13,5700       18,6296  3629550   37,29%

Flow cuts applied:  19
Mixed integer rounding cuts applied:  28
Lift and project cuts applied:  81
Cone linearizations applied:  1694

Root node processing (before b&c):
  Real time             =    2,09 sec. (2886,77 ticks)
Parallel b&c, 12 threads:
  Real time             =   32,69 sec. (14017,47 ticks)
  Sync time (average)   =    5,77 sec.
  Wait time (average)   =    0,00 sec.
                          ------------
Total (root+branch&cut) =   34,78 sec. (16904,24 ticks)

<<< solve


OBJECTIVE: 13.57

<<< post process


<<< done

