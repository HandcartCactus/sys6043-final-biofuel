# Declare Parameters
## general
set TIME_STAGES; # T
set DEMAND_CITIES; # M
set demand{m in DEMAND_CITIES, t in TIME_STAGES} >= 0; # D_m^t Demand at city m at time phase t

## Feedstock
set FEEDSTOCK_TYPES; # L Set of feedstock types, indexed by l
set FEEDSTOCK_FIELDS{l in FEEDSTOCK_TYPES}; # I Set of feedstock fields of feedstock type l, indexed by i
param procurement_cost{l in FEEDSTOCK_TYPES} >= 0; # p_l, ($/dry ton)
param max_feedstock{il in FEEDSTOCK_FIELDS, t in TIME_STAGES} >= 0; # yield_{i_l}^t Maximum available feedstock of type l at field il at time phase t (dry ton)
param moisture_content{l in FEEDSTOCK_TYPES} >= 0, <= 1; # MC_{l} Moisture content of feedstock type l (the ratio of water contained in the feedstock)


## Refinery
set POTENTIAL_REFINERY_LOCATION; # J Set of potential locations for ethanol refineries, indexed by j
param ethanol_production_cost >= 0; # c ($/gallon)
param setup_cost{j in POTENTIAL_REFINERY_LOCATION} >= 0; # f_j^F The annualized fixed set-up capital cost of the refinery at location j (F – fixed)
param unit_cost{j in POTENTIAL_REFINERY_LOCATION} >= 0; # f_j^V, The annualized unit capital cost *per refinery size* at location j (V – variable)
param ethanol_per_dry_ton{l in FEEDSTOCK_TYPES} >= 0; # \eta_l Refinery conversion rate (gallon/dry ton), measuring how much ethanol can be produced by one dry ton of feedstock of type l
param max_refinery_capacity{j in POTENTIAL_REFINERY_LOCATION} > 0; # capr_j The maximum allowable refinery capacity (gallon)
param ethanol_shortage_cost >= 0;# \alpha The penalty cost of ethanol demand shortage ($/gallon)

## Transport
param average_travel_speed > 0; # v Truck average travel speed (mile/h)
param distance{
  i in POTENTIAL_REFINERY_LOCATION union DEMAND_CITIES union FEEDSTOCK_FIELDS, 
  j in POTENTIAL_REFINERY_LOCATION union DEMAND_CITIES union FEEDSTOCK_FIELDS
} >= 0; # d_{ij} Distance between node i and j in miles

param cost_mile_solids >= 0; # t_b^d Distance-dependent transportation cost ($/mile/truckload) of bulk solids, i.e., the cost of traveling one mile per truckload, including expenses of truck fuel, insurance, maintenance, and permittings
param cost_hour_solids >= 0; # t_b^t Travel time dependent transportation cost ($/h/truckload) of bulk solids, i.e., the cost of traveling 1 h per truckload, including labor and capital costs
param cost_mile_liquids >= 0; # t_{lq}^d Distance-dependent transportation cost ($/mile/truckload) of liquids (i.e., ethanol)
param cost_hour_liquids >= 0; # t_{lq}^t Travel time dependent transportation cost ($/h/truckload) of liquids (i.e., ethanol)

param cost_load_unload_solids >= 0; # lu_b Truck loading and unloading cost of bulk solids ($/wet ton)
param cost_load_unload_liquids >= 0; # lu_{lq} Truck loading and unloading cost of liquids ($/gallon)
param truck_solids_capacity >= 0; # cap_b Truck bulk solids capacity (dry ton)
param truck_liquids_capacity >= 0; # cap_{lq} Truck liquids capacity (gallon)

# Variables


# Objective Function


# Constraints
