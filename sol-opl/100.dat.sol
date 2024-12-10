
<<< setup


<<< generate

Version identifier: 22.1.1.0 | 2022-11-27 | 9160aff4d
Tried aggregator 1 time.
MIQCP Presolve eliminated 63 rows and 1 columns.
MIQCP Presolve modified 599 coefficients.
Reduced MIQCP has 1132 rows, 1170 columns, and 9002 nonzeros.
Reduced MIQCP has 100 binaries, 0 generals, 0 SOSs, and 0 indicators.
Reduced MIQCP has 161 quadratic constraints.
Presolve time = 0,06 sec. (21,62 ticks)
Probing fixed 0 vars, tightened 810 bounds.
Probing time = 0,03 sec. (21,46 ticks)
Clique table members: 226.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 12 threads.
Root relaxation solution time = 0,00 sec. (1,03 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

      0     0      611,8073     0                   2834,6950        6         
      0     0      609,3021     0                     Cone: 2       28         
      0     0      606,3421     4                     Cone: 3       50         
      0     0      604,5803    14                     Cone: 4       68         
      0     0      604,2967    24                     Cone: 5       78         
      0     0      604,0989    29                     Cone: 6       89         
      0     0      603,8285    30                     Cone: 7      100         
      0     0      558,0930    29                   Cone: 336      834         
      0     0      558,0929    79                   Cone: 436      936         
      0     0      558,0928    98                   Cone: 536     1036         
      0     0      558,0927    98                   Cone: 634     1130         
      0     0      558,0927    98                   Cone: 729     1225         
      0     0      558,0927    99                   Cone: 812     1311         
      0     0      558,0927    99                   Cone: 882     1381         
      0     0      558,0927    99                   Cone: 936     1435         
      0     0      558,0927    99                   Cone: 969     1469         
      0     0      558,0927    99                   Cone: 992     1492         
      0     0      558,0927    99                  Cone: 1006     1508         
      0     0      558,0927    99                  Cone: 1017     1520         
      0     0      558,0927    99                  Cone: 1029     1532         
      0     0      558,0927    99                  Cone: 1039     1543         
      0     0      558,0927    99                  Cone: 1046     1549         
      0     0      558,0927    99                  Cone: 1049     1553         
      0     0      558,0927    99                    558,0927     1553         
*     0+    0                          126,2200      558,0927           342,16%
      0     0      557,0920    98      126,2200     Cuts: 214     2036  341,37%
      0     0      556,0464    98      126,2200      Cuts: 65     2140  340,54%
      0     0      555,2075    97      126,2200      Cuts: 60     2212  339,87%
      0     0      554,3537    97      126,2200      Cuts: 51     2280  339,20%
      0     0      552,7394    96      126,2200      Cuts: 41     2345  337,92%
      0     0      552,2018    94      126,2200      Cuts: 38     2412  337,49%
      0     0      551,9459    97      126,2200      Cuts: 59     2484  337,29%
      0     0      551,8929    97      126,2200      Cuts: 46     2534  337,25%
      0     0      551,8423    98      126,2200      Cuts: 31     2569  337,21%
      0     0      551,7837    98      126,2200      Cuts: 22     2656  337,16%
      0     0      551,7324    98      126,2200      Cuts: 52     2721  337,12%
      0     0      551,6850    98      126,2200      Cuts: 12     2749  337,08%
      0     2      551,6766    99      126,2200      551,6850     2749  337,08%
Elapsed time = 6,30 sec. (7060,88 ticks, tree = 0,02 MB, solutions = 1)
      3     5      547,1349    95      126,2200      547,1283     3203  333,47%
*     4+    3                          127,4700      547,1283           329,22%
      7     8      543,4274    94      127,4700      545,7031     3944  328,10%
*    12+    3                          129,2500      545,7031           322,21%
     15    11      522,1996    90      129,2500      545,7031     4129  322,21%
     35    28      515,3071    85      129,2500      543,4105     6477  320,43%
    107    56      528,5521    83      129,2500      540,5945    11186  318,25%
    172   120      444,9185    68      129,2500      540,5945    19597  318,25%
    236   205      439,5978    64      129,2500      540,5945    29748  318,25%
    308   244      424,1611    62      129,2500      540,5945    35614  318,25%
    379   310      446,8731    57      129,2500      540,5945    44169  318,25%
   1196  1017      368,2783    41      129,2500      540,5945   128280  318,25%
Elapsed time = 14,67 sec. (10297,16 ticks, tree = 1,67 MB, solutions = 4)
   2023  1740      393,9546    65      129,2500      520,8694   214806  302,99%
   2807  2428      490,6974    69      129,2500      515,5085   295321  298,85%
   3559  3090      443,9589    62      129,2500      513,3811   376964  297,20%
   4368  3824      213,3626    15      129,2500      510,8926   459270  295,27%
   5266  4599      486,3352    72      129,2500      509,4268   542002  294,14%
*  5288+ 4479                          130,1200      508,8587           291,07%
   6001  5093      170,5524    11      130,1200      507,2275   596948  289,82%
   6696  5850      478,7631    79      130,1200      506,5880   688051  289,32%
   7471  6453      251,7342    20      130,1200      504,5813   760844  287,78%
   8331  7101      416,4436    55      130,1200      503,2609   827966  286,77%
   9188  7970      392,8285    60      130,1200      502,3939   919620  286,10%
Elapsed time = 42,49 sec. (19843,17 ticks, tree = 8,79 MB, solutions = 5)
   9953  8723      458,8811    58      130,1200      501,4850  1007731  285,40%
  10815  9386      329,4415    38      130,1200      501,1484  1083683  285,14%
  11649 10080      256,1495    25      130,1200      500,7150  1160401  284,81%
  12563 10857      458,3854    68      130,1200      499,7505  1246803  284,07%
  13527 11664      390,8795    56      130,1200      498,7846  1329873  283,33%
  14323 12751      304,5519    29      130,1200      498,4479  1448672  283,07%
