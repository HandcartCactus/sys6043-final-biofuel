# Declare Parameters
## general
set TIME_STAGES; # T
set DEMAND_CITIES; # M
param demand{DEMAND_CITIES, TIME_STAGES} >= 0; # D_m^t Demand at city m at time phase t

## Feedstock
set FEEDSTOCK_TYPES; # L Set of feedstock types, indexed by l
set FEEDSTOCK_FIELDS; # I Set of feedstock fields 
param feedstock_field_types{FEEDSTOCK_TYPES, FEEDSTOCK_FIELDS} binary; # I Set of feedstock fields of feedstock type l, indexed by i
param procurement_cost{FEEDSTOCK_TYPES} >= 0; # p_l, ($/dry ton)
param max_feedstock{FEEDSTOCK_FIELDS, TIME_STAGES} >= 0; # yield_{i_l}^t Maximum available feedstock of type l at field il at time phase t (dry ton)
param moisture_content{FEEDSTOCK_TYPES} >= 0, <= 1; # MC_{l} Moisture content of feedstock type l (the ratio of water contained in the feedstock)

## Refinery
set POTENTIAL_REFINERY_LOCATION; # J Set of potential locations for ethanol refineries, indexed by j
param ethanol_production_cost >= 0; # c ($/gallon)
param setup_cost{POTENTIAL_REFINERY_LOCATION} >= 0; # f_j^F The annualized fixed set-up capital cost of the refinery at location j (F – fixed)
param unit_cost{POTENTIAL_REFINERY_LOCATION} >= 0; # f_j^V, The annualized unit capital cost *per refinery size* at location j (V – variable)
param ethanol_per_dry_ton{FEEDSTOCK_TYPES} >= 0; # \eta_l Refinery conversion rate (gallon/dry ton), measuring how much ethanol can be produced by one dry ton of feedstock of type l
param max_refinery_capacity{POTENTIAL_REFINERY_LOCATION} > 0; # capr_j The maximum allowable refinery capacity (gallon)
param ethanol_shortage_cost >= 0;# \alpha The penalty cost of ethanol demand shortage ($/gallon)

## Transport
param average_travel_speed > 0; # v Truck average travel speed (mile/h)
param distance{
  POTENTIAL_REFINERY_LOCATION union DEMAND_CITIES union FEEDSTOCK_FIELDS, 
  POTENTIAL_REFINERY_LOCATION union DEMAND_CITIES union FEEDSTOCK_FIELDS
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
var refinery_open{POTENTIAL_REFINERY_LOCATION, TIME_STAGES} binary; # z_j^t; =1 if refinery j is opened at time phase t; =0 otherwise
var feedstock_acquired{FEEDSTOCK_FIELDS, TIME_STAGES} >= 0;#Y_{I_l}^t The amount (dry ton) of feedstock of type l procured at field I_l at time phase t
var feedstock_transported{FEEDSTOCK_FIELDS, POTENTIAL_REFINERY_LOCATION, TIME_STAGES} >= 0;#x_{I_l, j}^t The amount (dry ton) of feedstock of type l transported from field il to refinery j at time t
var ethanol_transported{POTENTIAL_REFINERY_LOCATION, DEMAND_CITIES, TIME_STAGES} >= 0; #y_{j,m}^t The amount (gallon) of ethanol transported from refinery j to city m at time t
var designed_refinery_capacity{POTENTIAL_REFINERY_LOCATION, TIME_STAGES} integer >= 0;# cap_j^t The designed refinery capacity (gallon) of refinery j at time t
var shortage_ethanol{DEMAND_CITIES, TIME_STAGES} >= 0;# q_m^t The shortage of ethanol demand (gallon) from city m
var ethanol_production{POTENTIAL_REFINERY_LOCATION, TIME_STAGES} >= 0; # pr_j^t Ethanol production (gallon) at refinery j at time t

# Objective Function


# Constraints
# 2
subject to EthanolProductionIsFeedstockTimesConversionRate {t in TIME_STAGES, refinery in POTENTIAL_REFINERY_LOCATION}:
    sum {
      feedstock_type in FEEDSTOCK_TYPES, 
      feedstock_field in FEEDSTOCK_FIELDS: 
        feedstock_field_types[feedstock_type, feedstock_field]=1
      }
      feedstock_transported[feedstock_field, refinery, t] * ethanol_per_dry_ton[feedstock_type] = 
      ethanol_production[refinery, t];

# 3
subject to MustProduceWhatGetsSentToCity {
  t in TIME_STAGES,
  refinery in POTENTIAL_REFINERY_LOCATION
}:
  sum {city in DEMAND_CITIES} ethanol_transported[refinery, city, t] = ethanol_production[refinery, t];

# 4
subject to RefineryCapacityMaximums{
  t in TIME_STAGES,
  refinery in POTENTIAL_REFINERY_LOCATION
}:
  designed_refinery_capacity[refinery, t] <= max_refinery_capacity[refinery] * refinery_open[refinery, t];

# 5
subject to CannotCloseRefinery{
  t1 in TIME_STAGES,
  t2 in TIME_STAGES,
  refinery in POTENTIAL_REFINERY_LOCATION:
  t1 < t2
}:
  refinery_open[refinery, t1] <= refinery_open[refinery, t2];

# 6
subject to ProductionLimitedToRefineryCapacity{
  t in TIME_STAGES,
  refinery in POTENTIAL_REFINERY_LOCATION
}:
  ethanol_production[refinery, t] <= designed_refinery_capacity[refinery, t];

# 7
subject to CannotScaleBackRefinery{
  t1 in TIME_STAGES,
  t2 in TIME_STAGES,
  refinery in POTENTIAL_REFINERY_LOCATION:
  t1 < t2
}:
  designed_refinery_capacity[refinery, t1] <= designed_refinery_capacity[refinery, t2];

# 8
subject to AcquiredFeedstockMustBeDeliveredToRefinery {
  t in TIME_STAGES,
  feedstock_type in FEEDSTOCK_TYPES, 
  feedstock_field in FEEDSTOCK_FIELDS: 
    feedstock_field_types[feedstock_type, feedstock_field]=1
}:
  sum {refinery in POTENTIAL_REFINERY_LOCATION} feedstock_transported[feedstock_field, refinery, t] = feedstock_acquired[feedstock_field, t];