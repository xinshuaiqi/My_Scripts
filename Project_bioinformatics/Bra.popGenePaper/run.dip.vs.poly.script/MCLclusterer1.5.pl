#MCLclusterer.pl
#
#
#this just performs the mcl algorithm on a range of inflation values so you don't have to manually do this
#and can see how granularity effects your clusters, adjust as desired

mkdir "mclOutputRuns";

system("mcl mclInput --abc -I 1.5 -o mclOutputRuns/mclOutput_1.5");




