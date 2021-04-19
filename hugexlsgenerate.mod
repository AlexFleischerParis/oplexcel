

 //parameters
{string} plz = ...;
{string} SU = ...;


float travelTime[p in plz][su in SU]= rand(100);

float travelTime1[p in plz][su in 1..1999]=travelTime[p][item(SU,su-1)] ;
float travelTime2[p in plz][su in 2000..3999]=travelTime[p][item(SU,su-1)] ;

float travelTime3[p in plz][su in 4000..5999]=travelTime[p][item(SU,su-1)]  ;

float travelTime4[p in plz][su in 6000..7999]=travelTime[p][item(SU,su-1)]  ;

float travelTime5[p in plz][su in 8000..8176]=travelTime[p][item(SU,su-1)]  ;







execute
{
  travelTime
}
