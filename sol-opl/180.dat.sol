
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 358 rows and 1 columns.
MIQCP Presolve modified 1240 coefficients.
Reduced MIQCP has 3227 rows, 3129 columns, and 30352 nonzeros.
Reduced MIQCP has 180 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 490 quadratic constraints.
Presolve time = 0,16 sec. (91,61 ticks)
Probing fixed 0 vars, tightened 1988 bounds.
Probing time = 0,08 sec. (40,80 ticks)
Clique table members: 596.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (9,63 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0     2023,7839     0                   9219,0787       81         
      0     0     2019,1355    25                     Cone: 2      142         
      0     0     2017,7913    12                     Cone: 4      185         
      0     0     2013,3294    66                     Cone: 5      254         
      0     0     2009,0306    70                     Cone: 6      350         
      0     0     2006,1060    86                     Cone: 7      438         
      0     0     2004,4563    69                     Cone: 8      534         
      0     0     1880,7926    88                   Cone: 817     2276         
      0     0     1880,7922   160                   Cone: 996     2460         
      0     0     1880,7919   167                  Cone: 1175     2637         
      0     0     1880,7918   173                  Cone: 1354     2828         
      0     0     1880,7917   175                  Cone: 1532     3004         
      0     0     1880,7917   176                  Cone: 1709     3179         
      0     0     1880,7917   176                  Cone: 1869     3340         
      0     0     1880,7917   176                  Cone: 1984     3456         
      0     0     1880,7917   176                  Cone: 2012     3485         
      0     0     1880,7917   176                  Cone: 2035     3508         
      0     0     1880,7917   176                  Cone: 2061     3536         
      0     0     1880,7917   176                  Cone: 2081     3556         
      0     0     1880,7917   176                  Cone: 2094     3569         
      0     0     1880,7917   176                  Cone: 2108     3583         
      0     0     1880,7917   176                  Cone: 2122     3597         
      0     0     1880,7917   176                  Cone: 2135     3610         
      0     0     1880,7917   176                   1880,7917     3610         
      0     0     1878,3633   169                   Cuts: 669     4774         
      0     0     1874,8517   165                   Cuts: 120     5000         
      0     0     1871,3376   166                   Cuts: 115     5211         
      0     0     1867,8917   165                    Cuts: 71     5360         
      0     0     1866,8020   163                    Cuts: 60     5458         
      0     0     1864,9613   165                    Cuts: 64     5547         
      0     0     1863,6494   165                    Cuts: 58     5613         
      0     0     1862,3686   163                    Cuts: 62     5710         
      0     0     1861,2146   164                    Cuts: 64     5806         
      0     0     1860,3087   163                    Cuts: 72     5919         
      0     0     1859,7089   161                    Cuts: 45     5986         
      0     0     1858,8739   162                    Cuts: 44     6093         
      0     0     1858,2236   161                    Cuts: 59     6196         
      0     0     1857,6897   162                    Cuts: 60     6258         
      0     0     1857,2359   161                    Cuts: 44     6351         
      0     0     1856,7950   163                    Cuts: 56     6431         
      0     0     1856,4709   164                    Cuts: 48     6559         
      0     0     1856,0469   165                    Cuts: 73     6672         
      0     0     1855,8786   164                    Cuts: 26     6732         
      0     0     1855,7446   164                    Cuts: 23     6774         
*     0+    0                          431,5100     1855,7446           330,06%
      0     2     1855,6648   170      431,5100     1855,7446     6774  330,06%
Elapsed time = 49,55 sec. (31150,56 ticks, tree = 0,02 MB, solutions = 1)
      3     5     1848,8629   172      431,5100     1851,9713     7242  329,18%
      4     6     1845,1244   171      431,5100     1851,9713     7381  329,18%
*     5+    2                          433,6300     1851,9713           327,09%
      6     7     1843,4621   170      433,6300     1851,9713     7436  327,09%
*     7+    1                          444,3000     1851,9713           316,83%
     11     9     1834,3084   169      444,3000     1851,9713     8175  316,83%
     14     7     1807,2975   165      444,3000     1848,7897     7962  316,11%
     21    10     1775,9729   161      444,3000     1848,7897     8514  316,11%
     31    19     1804,4584   161      444,3000     1843,4538    10320  314,91%
     39    27     1753,3920   148      444,3000     1843,4538    12282  314,91%
     60    32     1739,6128   141      444,3000     1843,4538    13245  314,91%
    162   123     1668,1654   125      444,3000     1833,8679    35834  312,75%
Elapsed time = 73,56 sec. (34872,72 ticks, tree = 0,91 MB, solutions = 6)
    304   259     1617,9485   132      444,3000     1833,8679    62600  312,75%
    500   395     1674,0654   128      444,3000     1833,8679    80585  312,75%
    657   530     1441,6660    83      444,3000     1833,8679   100211  312,75%
*   803+  564                          446,8300     1833,8679           310,42%
    814   677     1576,7322    93      446,8300     1833,8679   123138  310,42%
   1005   754     1261,4091    74      446,8300     1833,8679   133502  310,42%
   1171  1045     1799,8248   159      446,8300     1833,8679   185627  310,42%
   1319  1082     1739,6424   145      446,8300     1817,8623   193314  306,84%
   1472  1203     1623,8568   108      446,8300     1807,0521   210428  304,42%
   1655  1419     1677,5856   119      446,8300     1800,3844   247368  302,92%
   1858  1546     1584,2517    89      446,8300     1800,3844   265479  302,92%
Elapsed time = 130,95 sec. (44449,52 ticks, tree = 80,67 MB, solutions = 7)
   2081  1656     1292,5864    70      446,8300     1800,3844   283470  302,92%
   2295  1941        cutoff            446,8300     1800,3844   324091  302,92%
   2496  2066     1715,8919   121      446,8300     1795,0435   343182  301,73%
   2704  2339     1735,7476   137      446,8300     1795,0435   379279  301,73%
   2917  2441     1593,4682   102      446,8300     1793,0821   390827  301,29%
   3085  2704     1735,7695   139      446,8300     1791,6606   426020  300,97%
   3284  2874     1572,8150   102      446,8300     1790,2573   449332  300,66%
   3444  2955     1524,5911    88      446,8300     1790,2573   459990  300,66%
   3607  3196     1674,7607   117      446,8300     1784,9837   501676  299,48%
   3772  3317     1741,9505   127      446,8300     1784,9837   519260  299,48%
Elapsed time = 197,00 sec. (54026,79 ticks, tree = 186,94 MB, solutions = 7)
   3947  3422     1477,4767    96      446,8300     1784,9837   531572  299,48%
   4149  3660      526,2144     7      446,8300     1784,9837   569749  299,48%
   4311  3747     1603,8606   117      446,8300     1783,8107   585515  299,21%
   4445  3891     1472,8531    91      446,8300     1783,8107   608576  299,21%
   4628  3963     1392,1955    81      446,8300     1783,8107   630726  299,21%
   4793  4225     1204,1956    66      446,8300     1780,2286   680409  298,41%
   4987  4403     1204,7973    64      446,8300     1780,2286   701579  298,41%
   5179  4520     1547,5164    95      446,8300     1780,2286   718827  298,41%
   5451  4609     1727,4803   126      446,8300     1778,1944   736137  297,96%
   5713  4747     1547,8984    92      446,8300     1775,4146   752506  297,34%
Elapsed time = 261,70 sec. (63616,53 ticks, tree = 301,29 MB, solutions = 7)
   5890  5024     1714,4118   137      446,8300     1775,4146   781940  297,34%
*  5904+ 5109                          447,1000     1775,4146           297,10%
   6098  5305     1679,5077   125      447,1000     1773,0346   819869  296,56%
   6328  5334      786,6594    42      447,1000     1773,0346   823035  296,56%
   6566  5596     1710,1595   138      447,1000     1772,9283   852931  296,54%
   6775  5908     1698,2615   112      447,1000     1770,9669   892496  296,10%
   6957  6157     1515,7173    99      447,1000     1770,0842   926423  295,90%
   7136  6283     1659,4116   119      447,1000     1770,0842   943656  295,90%
   7297  6419     1714,2818   128      447,1000     1770,0842   966008  295,90%
