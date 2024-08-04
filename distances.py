from random import random

labels = """corn_stover_fld1
corn_stover_fld2
wheat_straw_fld1
wheat_straw_fld2
rice_straw_fld1
rice_straw_fld2
cotton_residues_fld1
cotton_residues_fld2
msw_paper_fld1
msw_paper_fld2
msw_yard_fld1
msw_yard_fld2
forest_fld1
forest_fld2
LA
SD
SF
SJ
SAC
LB
OAK
BAKO
ANHM
FRESNO
MOD
STOCK
REDD
SLO
SM
RIV""".split()

locs = {lbl: (random()*720, random()*100) for lbl in labels}

table = [[((lx[0] - ly[0])**2 + (lx[1] - ly[1])**2)**0.5 for lx in locs.values()] for ly in locs.values()]

# formatted = '\t'+('\t'.join(labels)) + '\n'
# for distances, xlbl in zip(table, labels):
#     formatted += xlbl+'\t'+'\t'.join(str(d) for d in distances) + '\n'

# formatted += ';'
# print(formatted)

for a,ac in locs.items():
    for b,bc in locs.items():
        print(a,b,round(((bc[0] - ac[0])**2 + (bc[1] - ac[1])**2)**0.5,5))


