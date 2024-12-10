
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 155 rows and 1 columns.
MIQCP Presolve modified 1182 coefficients.
Reduced MIQCP has 1891 rows, 1872 columns, and 17155 nonzeros.
Reduced MIQCP has 140 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 270 quadratic constraints.
Presolve time = 0,05 sec. (48,01 ticks)
Probing fixed 0 vars, tightened 1056 bounds.
Probing time = 0,03 sec. (17,53 ticks)
Clique table members: 400.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,02 sec. (12,15 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0     1842,5977     0                   5576,4964      155         
      0     0     1837,1285    86                     Cone: 1      229         
      0     0     1831,3530    84                     Cone: 2      352         
      0     0     1826,8160   104                     Cone: 3      469         
      0     0     1824,6227    95                     Cone: 4      552         
      0     0     1823,8827   101                     Cone: 5      609         
      0     0     1823,1346   105                     Cone: 6      660         
      0     0     1702,4705    92                   Cone: 519     2181         
      0     0     1702,4700   123                   Cone: 658     2316         
      0     0     1702,4697   134                   Cone: 798     2454         
      0     0     1702,4695   136                   Cone: 935     2573         
      0     0     1702,4695   137                  Cone: 1065     2685         
      0     0     1702,4694   137                  Cone: 1182     2792         
      0     0     1702,4694   137                  Cone: 1281     2880         
      0     0     1702,4694   137                  Cone: 1359     2953         
      0     0     1702,4694   137                  Cone: 1397     2991         
      0     0     1702,4694   137                  Cone: 1422     3014         
      0     0     1702,4694   137                  Cone: 1437     3029         
      0     0     1702,4694   137                  Cone: 1446     3040         
      0     0     1702,4694   137                  Cone: 1453     3047         
      0     0     1702,4694   137                  Cone: 1458     3054         
      0     0     1702,4694   137                  Cone: 1465     3062         
      0     0     1702,4694   137                  Cone: 1470     3069         
      0     0     1702,4694   137                   1702,4694     3069         
      0     0     1697,0426   127                   Cuts: 404     3932         
      0     0     1692,0582   124                   Cuts: 138     4141         
      0     0     1687,5323   127                   Cuts: 144     4340         
      0     0     1684,6956   125                    Cuts: 89     4462         
      0     0     1682,0413   127                    Cuts: 75     4559         
      0     0     1680,2965   124                    Cuts: 68     4670         
      0     0     1678,5827   125                    Cuts: 97     4780         
      0     0     1677,5797   124                    Cuts: 55     4867         
      0     0     1676,5690   124                    Cuts: 91     4954         
      0     0     1675,6016   126                    Cuts: 87     5041         
      0     0     1674,7360   125                    Cuts: 61     5134         
      0     0     1674,2112   127                    Cuts: 89     5204         
      0     0     1673,9398   126                    Cuts: 41     5261         
      0     0     1673,4476   126                    Cuts: 48     5329         
      0     0     1673,0301   126                    Cuts: 52     5393         
      0     0     1672,7476   126                    Cuts: 49     5450         
      0     0     1672,1704   125                    Cuts: 33     5519         
      0     0     1671,3729   128                    Cuts: 64     5695         
      0     0     1668,9967   127                   Cuts: 200     5996         
      0     0     1667,9234   127                    Cuts: 48     6085         
      0     0     1667,3589   126                    Cuts: 59     6173         
      0     0     1666,9307   127                    Cuts: 31     6287         
      0     0     1666,1901   127                    Cuts: 94     6413         
      0     0     1665,9157   126                    Cuts: 45     6487         
      0     0     1665,7859   127                    Cuts: 32     6529         
      0     2     1665,7859   127                   1665,7859     6529         
Elapsed time = 8,73 sec. (11153,19 ticks, tree = 0,02 MB, solutions = 0)
      4     6     1649,6617   119                   1659,7260     7109         
     13     9     1647,4249   121                   1659,7260     7703         
     27    20     1635,1725   117                   1650,8422     9609         
     45    35     1604,8570   112                   1647,9166    13140         
     62    47     1605,3608    99                   1647,3836    15717         
    128    70    infeasible                         1647,3836    24740         
    234   107     1430,5608    94                   1647,3836    39887         
*   313+  114                          612,2200     1642,8261           168,34%
    325   118     1476,4881   103      612,2200     1642,5060    47485  168,29%
    420   172     1443,4002   105      612,2200     1637,9324    69459  167,54%
*   720+  248                          614,1600     1606,1031           161,51%
    753   264     1472,1574   108      614,1600     1606,1031   121514  161,51%
Elapsed time = 16,16 sec. (14310,31 ticks, tree = 1,75 MB, solutions = 2)
*   798+  264                          618,1000     1602,5232           159,27%
   1075   292     1413,2569   100      618,1000     1553,6271   172676  151,36%
*  1224   291      integral     0      621,0016     1553,6271   154745  150,18%
   1347   308    infeasible            621,0016     1526,1647   217036  145,76%
*  1614+  254                          625,7300     1513,4880           141,88%
   1649   254     1272,3359    79      625,7300     1513,4880   266174  141,88%
*  1807   260      integral     0      625,7301     1494,8054   268676  138,89%
*  1808+  266                          626,6600     1494,8054           138,54%
   1966   273      700,1026     8      626,6600     1494,8054   312236  138,54%
*  2407   181      integral     0      627,8400     1446,0981   349690  130,33%
   2451   115    infeasible            627,8400     1446,0981   373037  130,33%
*  2667+   82                          627,9300     1446,0981           130,30%
*  2911    38      integral     0      628,5100     1446,0981   389392  130,08%
   3109    11      691,2930     6      628,5100      751,0440   412880   19,50%

Flow cuts applied:  174
Mixed integer rounding cuts applied:  341
Zero-half cuts applied:  67
Lift and project cuts applied:  16
Cone linearizations applied:  2914

Root node processing (before b&c):
  Real time             =    8,67 sec. (11125,48 ticks)
Parallel b&c, 12 threads:
  Real time             =   20,00 sec. (8987,13 ticks)
  Sync time (average)   =    4,95 sec.
  Wait time (average)   =    0,00 sec.
                          ------------
Total (root+branch&cut) =   28,67 sec. (20112,61 ticks)

<<< solve


OBJECTIVE: 628.51

<<< post process


<<< done

