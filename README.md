# sys6043-final-biofuel

## Edit on the web
https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files

## Edit locally: Clone Repo
```
git clone https://github.com/HandcartCactus/sys6043-final-biofuel.git .
```
## Edit locally: Get recent changes
See what's changed on the server
```bash
git fetch
```
Pull changes from server
```bash
git pull
```

## Edit locally: Save and share your work
See what's up
```bash
git status
```
Track your changes
```bash
git add filename
```
Save your changes
```bash
git commit -m "Describe your changes"
```
Share your changes
```bash
git push
```

## Run the model
```ampl
include biofuel.run;
```
```
ampl: include "biofuel.run";
CPLEX 22.1.1.0: optimal integer solution within mipgap or absmipgap; objective 7105354576
208 MIP simplex iterations
0 branch-and-bound nodes
absmipgap = 4676.06, relmipgap = 6.58104e-07
refinery_open [*,*]
:        1   2   3    :=
BAKO     1   1   1
FRESNO   0   1   1
LB       0   1   1
MOD      0   0   0
REDD     0   1   1
RIV      0   1   1
SAC      0   1   1
SLO      0   1   1
SM       0   1   1
STOCK    0   1   1
;

feedstock_acquired [*,*]
:                         1          2           3        :=
corn_stover_fld1           0      457588      457588
corn_stover_fld2           0      105079      105079
cotton_residues_fld1       0       76999.2     76999.2
cotton_residues_fld2       0       31571.8     40576.9
forest_fld1                0       55432.4     55432.4
forest_fld2                0           0           0
msw_paper_fld1             0     1162790     1162790
msw_paper_fld2             0       64121.6     64121.6
msw_yard_fld1              0      172146      172146
msw_yard_fld2              0           0           0
rice_straw_fld1            0           0        6619.3
rice_straw_fld2            0           0           0
wheat_straw_fld1       35287.7    244500      244500
wheat_straw_fld2           0       65104.2     65104.2
;

feedstock_transported [*,*,1]
:                       BAKO   FRESNO  LB MOD REDD RIV SAC SLO  SM STOCK    :=
corn_stover_fld1           0      0     0   0   0    0   0   0   0    0
corn_stover_fld2           0      0     0   0   0    0   0   0   0    0
cotton_residues_fld1       0      0     0   0   0    0   0   0   0    0
cotton_residues_fld2       0      0     0   0   0    0   0   0   0    0
forest_fld1                0      0     0   0   0    0   0   0   0    0
forest_fld2                0      0     0   0   0    0   0   0   0    0
msw_paper_fld1             0      0     0   0   0    0   0   0   0    0
msw_paper_fld2             0      0     0   0   0    0   0   0   0    0
msw_yard_fld1              0      0     0   0   0    0   0   0   0    0
msw_yard_fld2              0      0     0   0   0    0   0   0   0    0
rice_straw_fld1            0      0     0   0   0    0   0   0   0    0
rice_straw_fld2            0      0     0   0   0    0   0   0   0    0
wheat_straw_fld1       35287.7    0     0   0   0    0   0   0   0    0
wheat_straw_fld2           0      0     0   0   0    0   0   0   0    0

 [*,*,2]
:                       BAKO    FRESNO     LB   MOD    REDD       RIV      :=
corn_stover_fld1            0        0        0   0       0         0
corn_stover_fld2            0        0        0   0       0         0
cotton_residues_fld1        0        0        0   0       0         0
cotton_residues_fld2        0        0        0   0       0         0
forest_fld1                 0        0        0   0   55432.4       0
forest_fld2                 0        0        0   0       0         0
msw_paper_fld1              0        0   581395   0       0         0
msw_paper_fld2              0        0        0   0       0         0
msw_yard_fld1               0   172146        0   0       0         0
msw_yard_fld2               0        0        0   0       0         0
rice_straw_fld1             0        0        0   0       0         0
rice_straw_fld2             0        0        0   0       0         0
wheat_straw_fld1       244500        0        0   0       0         0
wheat_straw_fld2            0        0        0   0       0     65104.2

:                       SAC       SLO        SM      STOCK     :=
corn_stover_fld1            0       0     457588          0
corn_stover_fld2       105079       0          0          0
cotton_residues_fld1        0       0      76999.2        0
cotton_residues_fld2        0   31571.8        0          0
forest_fld1                 0       0          0          0
forest_fld2                 0       0          0          0
msw_paper_fld1              0       0          0     581395
msw_paper_fld2              0   64121.6        0          0
msw_yard_fld1               0       0          0          0
msw_yard_fld2               0       0          0          0
rice_straw_fld1             0       0          0          0
rice_straw_fld2             0       0          0          0
wheat_straw_fld1            0       0          0          0
wheat_straw_fld2            0       0          0          0

 [*,*,3]
:                       BAKO     FRESNO      LB   MOD    REDD       RIV      :=
corn_stover_fld1            0        0          0   0       0         0
corn_stover_fld2            0        0          0   0       0         0
cotton_residues_fld1        0        0          0   0       0         0
cotton_residues_fld2        0        0          0   0       0         0
forest_fld1                 0        0          0   0   55432.4       0
forest_fld2                 0        0          0   0       0         0
msw_paper_fld1              0        0     581395   0       0         0
msw_paper_fld2              0        0          0   0       0         0
msw_yard_fld1               0   172146          0   0       0         0
msw_yard_fld2               0        0          0   0       0         0
rice_straw_fld1             0     6619.3        0   0       0         0
rice_straw_fld2             0        0          0   0       0         0
wheat_straw_fld1       244500        0          0   0       0         0
wheat_straw_fld2            0        0          0   0       0     65104.2

:                       SAC       SLO        SM      STOCK     :=
corn_stover_fld1            0       0     457588          0
corn_stover_fld2       105079       0          0          0
cotton_residues_fld1        0       0      76999.2        0
cotton_residues_fld2        0   40576.9        0          0
forest_fld1                 0       0          0          0
forest_fld2                 0       0          0          0
msw_paper_fld1              0       0          0     581395
msw_paper_fld2              0   64121.6        0          0
msw_yard_fld1               0       0          0          0
msw_yard_fld2               0       0          0          0
rice_straw_fld1             0       0          0          0
rice_straw_fld2             0       0          0          0
wheat_straw_fld1            0       0          0          0
wheat_straw_fld2            0       0          0          0
;

ethanol_transported [*,*,1]
:      ANHM    BAKO     LA     LB      OAK   SAC    SD      SF       SJ      :=
BAKO     50   999999   9999   50000   99999   50   50000   5e+05   999999
FRESNO    0        0      0       0       0    0       0       0        0
LB        0        0      0       0       0    0       0       0        0
MOD       0        0      0       0       0    0       0       0        0
REDD      0        0      0       0       0    0       0       0        0
RIV       0        0      0       0       0    0       0       0        0
SAC       0        0      0       0       0    0       0       0        0
SLO       0        0      0       0       0    0       0       0        0
SM        0        0      0       0       0    0       0       0        0
STOCK     0        0      0       0       0    0       0       0        0

 [*,*,2]
:        ANHM  BAKO  LA    LB     OAK      SAC      SD      SF      SJ    :=
BAKO         0   70   0      0       0   18777600    0          0    0
FRESNO       0    0   0      0       0          0    0   12050200    0
LB           0    0   0   7000       0          0    0   49993000    0
MOD          0    0   0      0       0          0    0          0    0
REDD         0    0   0      0       0          0    0      5e+06    0
RIV      70000    0   0      0       0          0   70    4929930    0
SAC          0    0   0      0       0    8469350    0          0    0
SLO          0    0   0      0       0          0    0    7978640    0
SM           0    0   0      0       0   42891400    0          0    0
STOCK        0    0   0      0   90000   29861700    0   20048200   70

 [*,*,3]
:          ANHM       BAKO      LA      LB     OAK   SAC     SD      SF      :=
BAKO            0   18777600       0      0       0    0        0       0
FRESNO   12559200          0       0      0       0    0        0       0
LB       48991000          0       0   9000       0    0   999999       0
MOD             0          0       0      0       0    0        0       0
REDD        5e+06          0       0      0       0    0        0       0
RIV         5e+06          0       0      0       0    0        0       0
SAC             0    8379260   90000      0       0   90        0       0
SLO       8681480          0       0      0       0    0        0       0
SM              0   42891400       0      0       0    0        0       0
STOCK    19768300   29951700       0      0   90000    0        0   99990

:         SJ      :=
BAKO         0
FRESNO       0
LB           0
MOD          0
REDD         0
RIV          0
SAC          0
SLO          0
SM           0
STOCK    90000
;

designed_refinery_capacity [*,*]
:           1         2          3        :=
BAKO     2710100   18777600   18777600
FRESNO         0   12050200   12559200
LB             0      5e+07      5e+07
MOD            0          0          0
REDD           0      5e+06      5e+06
RIV            0      5e+06      5e+06
SAC            0    8469350    8469350
SLO            0    7978640    8681480
SM             0   42891400   42891400
STOCK          0      5e+07      5e+07
;

shortage_ethanol [*,*]
:      1   2   3    :=
ANHM   0   0   0
BAKO   0   0   0
LA     0   0   0
LB     0   0   0
OAK    0   0   0
SAC    0   0   0
SD     0   0   0
SF     0   0   0
SJ     0   0   0
;

ethanol_production [*,*]
:           1         2          3        :=
BAKO     2710100   18777600   18777600
FRESNO         0   12050200   12559200
LB             0      5e+07      5e+07
MOD            0          0          0
REDD           0      5e+06      5e+06
RIV            0      5e+06      5e+06
SAC            0    8469350    8469350
SLO            0    7978640    8681480
SM             0   42891400   42891400
STOCK          0      5e+07      5e+07
;

sum{city in DEMAND_CITIES} demand[city,1] = 2710100

sum{city in DEMAND_CITIES} demand[city,2] = 200167000

sum{city in DEMAND_CITIES} demand[city,3] = 201379000

ampl: include "biofuel.run";
CPLEX 22.1.1.0: optimal integer solution within mipgap or absmipgap; objective 5491505798
197 MIP simplex iterations
0 branch-and-bound nodes
absmipgap = 4760.92, relmipgap = 8.6696e-07
refinery_open [*,*]
:        1   2   3    :=
BAKO     1   1   1
FRESNO   0   1   1
LB       0   1   1
MOD      0   0   0
REDD     0   0   1
RIV      0   1   1
SAC      0   0   1
SLO      0   0   1
SM       0   1   1
STOCK    0   1   1
;

feedstock_acquired [*,*]
:                         1         2           3        :=
corn_stover_fld1           0          0      457588
corn_stover_fld2           0          0      105079
cotton_residues_fld1       0      76999.2     76999.2
cotton_residues_fld2       0          0       40576.9
forest_fld1                0          0       55432.4
forest_fld2                0          0           0
msw_paper_fld1             0     794530     1162790
msw_paper_fld2             0          0       64121.6
msw_yard_fld1              0     172146      172146
msw_yard_fld2              0          0           0
rice_straw_fld1            0          0        6619.3
rice_straw_fld2            0          0           0
wheat_straw_fld1       35287.7   244500      244500
wheat_straw_fld2           0      65104.2     65104.2
;

feedstock_transported [*,*,1]
:                       BAKO   FRESNO  LB MOD REDD RIV SAC SLO  SM STOCK    :=
corn_stover_fld1           0      0     0   0   0    0   0   0   0    0
corn_stover_fld2           0      0     0   0   0    0   0   0   0    0
cotton_residues_fld1       0      0     0   0   0    0   0   0   0    0
cotton_residues_fld2       0      0     0   0   0    0   0   0   0    0
forest_fld1                0      0     0   0   0    0   0   0   0    0
forest_fld2                0      0     0   0   0    0   0   0   0    0
msw_paper_fld1             0      0     0   0   0    0   0   0   0    0
msw_paper_fld2             0      0     0   0   0    0   0   0   0    0
msw_yard_fld1              0      0     0   0   0    0   0   0   0    0
msw_yard_fld2              0      0     0   0   0    0   0   0   0    0
rice_straw_fld1            0      0     0   0   0    0   0   0   0    0
rice_straw_fld2            0      0     0   0   0    0   0   0   0    0
wheat_straw_fld1       35287.7    0     0   0   0    0   0   0   0    0
wheat_straw_fld2           0      0     0   0   0    0   0   0   0    0

 [*,*,2]
:                       BAKO    FRESNO     LB   MOD REDD     RIV   SAC SLO   :=
corn_stover_fld1            0        0        0   0   0        0     0   0
corn_stover_fld2            0        0        0   0   0        0     0   0
cotton_residues_fld1        0        0        0   0   0        0     0   0
cotton_residues_fld2        0        0        0   0   0        0     0   0
forest_fld1                 0        0        0   0   0        0     0   0
forest_fld2                 0        0        0   0   0        0     0   0
msw_paper_fld1              0        0   213135   0   0        0     0   0
msw_paper_fld2              0        0        0   0   0        0     0   0
msw_yard_fld1               0   172146        0   0   0        0     0   0
msw_yard_fld2               0        0        0   0   0        0     0   0
rice_straw_fld1             0        0        0   0   0        0     0   0
rice_straw_fld2             0        0        0   0   0        0     0   0
wheat_straw_fld1       244500        0        0   0   0        0     0   0
wheat_straw_fld2            0        0        0   0   0    65104.2   0   0

:                        SM      STOCK     :=
corn_stover_fld1           0          0
corn_stover_fld2           0          0
cotton_residues_fld1   76999.2        0
cotton_residues_fld2       0          0
forest_fld1                0          0
forest_fld2                0          0
msw_paper_fld1             0     581395
msw_paper_fld2             0          0
msw_yard_fld1              0          0
msw_yard_fld2              0          0
rice_straw_fld1            0          0
rice_straw_fld2            0          0
wheat_straw_fld1           0          0
wheat_straw_fld2           0          0

 [*,*,3]
:                       BAKO     FRESNO      LB   MOD    REDD       RIV      :=
corn_stover_fld1            0        0          0   0       0         0
corn_stover_fld2            0        0          0   0       0         0
cotton_residues_fld1        0        0          0   0       0         0
cotton_residues_fld2        0        0          0   0       0         0
forest_fld1                 0        0          0   0   55432.4       0
forest_fld2                 0        0          0   0       0         0
msw_paper_fld1              0        0     581395   0       0         0
msw_paper_fld2              0        0          0   0       0         0
msw_yard_fld1               0   172146          0   0       0         0
msw_yard_fld2               0        0          0   0       0         0
rice_straw_fld1             0     6619.3        0   0       0         0
rice_straw_fld2             0        0          0   0       0         0
wheat_straw_fld1       244500        0          0   0       0         0
wheat_straw_fld2            0        0          0   0       0     65104.2

:                       SAC       SLO        SM      STOCK     :=
corn_stover_fld1            0       0     457588          0
corn_stover_fld2       105079       0          0          0
cotton_residues_fld1        0       0      76999.2        0
cotton_residues_fld2        0   40576.9        0          0
forest_fld1                 0       0          0          0
forest_fld2                 0       0          0          0
msw_paper_fld1              0       0          0     581395
msw_paper_fld2              0   64121.6        0          0
msw_yard_fld1               0       0          0          0
msw_yard_fld2               0       0          0          0
rice_straw_fld1             0       0          0          0
rice_straw_fld2             0       0          0          0
wheat_straw_fld1            0       0          0          0
wheat_straw_fld2            0       0          0          0
;

ethanol_transported [*,*,1]
:      ANHM    BAKO     LA     LB      OAK   SAC    SD      SF       SJ      :=
BAKO     50   999999   9999   50000   99999   50   50000   5e+05   999999
FRESNO    0        0      0       0       0    0       0       0        0
LB        0        0      0       0       0    0       0       0        0
MOD       0        0      0       0       0    0       0       0        0
REDD      0        0      0       0       0    0       0       0        0
RIV       0        0      0       0       0    0       0       0        0
SAC       0        0      0       0       0    0       0       0        0
SLO       0        0      0       0       0    0       0       0        0
SM        0        0      0       0       0    0       0       0        0
STOCK     0        0      0       0       0    0       0       0        0

 [*,*,2]
:        ANHM  BAKO  LA    LB     OAK      SAC      SD    SF     SJ    :=
BAKO         0   70   0      0       0   18777600    0       0    0
FRESNO       0    0   0      0       0    2050140    0   1e+07   70
LB           0    0   0   7000   90000   18232600    0       0    0
MOD          0    0   0      0       0          0    0       0    0
REDD         0    0   0      0       0          0    0       0    0
RIV      70000    0   0      0       0    4929930   70       0    0
SAC          0    0   0      0       0          0    0       0    0
SLO          0    0   0      0       0          0    0       0    0
SM           0    0   0      0       0    6009790    0       0    0
STOCK        0    0   0      0       0      5e+07    0       0    0

 [*,*,3]
:          ANHM       BAKO      LA      LB     OAK   SAC     SD      SF      :=
BAKO            0   18777600       0      0       0    0        0       0
FRESNO   12559200          0       0      0       0    0        0       0
LB       48991000          0       0   9000       0    0   999999       0
MOD             0          0       0      0       0    0        0       0
REDD        5e+06          0       0      0       0    0        0       0
RIV         5e+06          0       0      0       0    0        0       0
SAC             0    8379260   90000      0       0   90        0       0
SLO       8681480          0       0      0       0    0        0       0
SM              0   42891400       0      0       0    0        0       0
STOCK    19768300   29951700       0      0   90000    0        0   99990

:         SJ      :=
BAKO         0
FRESNO       0
LB           0
MOD          0
REDD         0
RIV          0
SAC          0
SLO          0
SM           0
STOCK    90000
;

designed_refinery_capacity [*,*]
:           1         2          3        :=
BAKO     2710100   18777600   18777600
FRESNO         0   12050200   12559200
LB             0   18329600      5e+07
MOD            0          0          0
REDD           0          0      5e+06
RIV            0      5e+06      5e+06
SAC            0          0    8469350
SLO            0          0    8681480
SM             0    6009790   42891400
STOCK          0      5e+07      5e+07
;

shortage_ethanol [*,*]
:      1   2   3    :=
ANHM   0   0   0
BAKO   0   0   0
LA     0   0   0
LB     0   0   0
OAK    0   0   0
SAC    0   0   0
SD     0   0   0
SF     0   0   0
SJ     0   0   0
;

ethanol_production [*,*]
:           1         2          3        :=
BAKO     2710100   18777600   18777600
FRESNO         0   12050200   12559200
LB             0   18329600      5e+07
MOD            0          0          0
REDD           0          0      5e+06
RIV            0      5e+06      5e+06
SAC            0          0    8469350
SLO            0          0    8681480
SM             0    6009790   42891400
STOCK          0      5e+07      5e+07
;

sum{city in DEMAND_CITIES} demand[city,1] = 2710100

sum{city in DEMAND_CITIES} demand[city,2] = 110167000

sum{city in DEMAND_CITIES} demand[city,3] = 201379000
```
