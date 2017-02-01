#!/bin/bash

# lat/lon ranges to be queried. All of it!
lonmin=0.0
lonmax=360.0
latmin=-90.0
latmax=90.0

# min/mag magnitudes
minmag=0.1
maxmag=10.0

# start and end dates for quarters
qtr=('1' '2' '3' '4')
startDate=('01-01' '04-01' '07-01' '10-01')
endDate=('03-31' '06-30' '09-30' '12-31')

# loop over the years to be queried
for yr in $(seq 1900 1975)
do
    echo $yr
    # loop over each quarter
    for ((i=0; i < 4; i++))
    do
	# get start and end dates - by quarters
	startTime=$yr-${startDate[i]}
	endTime=$yr-${endDate[i]}

	# output filename
	fout=$yr-${qtr[i]}.csv

	# structure the query
	query="getcsv.py -o -b $lonmin $lonmax $latmin $latmax -s $startTime -e $endTime -m $minmag $maxmag"

	# print headers to output file: query + time written + writing script
	#echo $query
	echo '### '$query > $fout
	echo "### Written on: $(date)" "by $(basename $0)" >> $fout
	echo ' ' >> $fout
	
	# run the query
	$query >> $fout
    done    
done
#




