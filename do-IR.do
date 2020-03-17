


clear
/*Constructing descriptive stat dataset for our 5 countries
set maxvar 12000

cd "/Users/jeffmajerus/Downloads/Data/IR"
use IAIR74FL.DTA
append using MMIR71FL.DTA
append using BDIR72FL.DTA
append using KHIR73FL.DTA
append using NPIR7HFL.DTA

keep caseid v012 v201 v715 v133 v613 v201 v218 v130 v212 s309 v104


*/
//motherhood rate
generate mother = 1 if v201 > 0
egen births= sum(mother)
egen obs=count(caseid)
generate motherhood_rate = births/obs

//Moved from place of residdence after 14
save descr_stat_rep.dta, replace


//religion 
egen religion=group(v130)   
generate Hindu =1 if religion==1
generate Islamic=1 if religion==2
generate Christian=1 if religion==3
generate Buddhist=1 if religion==5
egen Islamic_perc=sum(Islamic)
egen Christian_perc=sum(Christian)
egen Hindu_perc=sum(Hindu)
egen Buddhist_perc=sum(Buddhist)
generate Islam_rate = Islamic_perc/obs
generate Christian_rate=Christian_perc/obs
generate Hindu_rate=Hindu_perc/obs
generate Buddhist_rate=Buddhist_perc/obs


//Descr stata
rename v012 age
rename v104 home
rename v133 educ
rename v201 nbrbirths
rename v212 age_fistbirth
rename v218 children_alive
rename v613 ideal_nbrchildren
rename v715 educ_partner
rename s309	age_firstmarried
//marriage rate missing + ethnicities + residence
summarize age educ educ_partner ideal_nbrchildren nbrbirths children_alive motherhood_rate Islam_rate Christian_rate Hindu_rate Buddhist_rate age_fistbirth age_firstmarried
