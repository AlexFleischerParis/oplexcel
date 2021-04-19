

 //parameters
{string} plz = ...;
{string} SU = ...;




float travelTime1[plz][1..1999]=... ;
float travelTime2[plz][2000..3999]=... ;

float travelTime3[plz][4000..5999]=... ;

float travelTime4[plz][6000..7999]=... ;

float travelTime5[plz][8000..8176]=... ;


int einwohner [plz] ; //= ...;

//float travelTime[plz][SU]=... ; // this does not work

float travelTimeA[p in plz][s in 1..8176]=(s in 1..1999)?travelTime1[p][s]:
((s in 2000..3999)?travelTime2[p][s]:
((s in 4000..5999)?travelTime3[p][s]:
((s in 6000..7999)?travelTime4[p][s]:
((s in 8000..10000)?travelTime5[p][s]:0
))));

float travelTime[p in plz][su in SU]= travelTimeA[p][ord(SU,su)+1];

execute
{
  travelTime
}



