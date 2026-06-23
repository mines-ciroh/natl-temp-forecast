# find files
CSV=`ls full_forecasts | grep csv | tail -n 1`
JSON=`ls full_forecasts | grep rawmap | tail -n 1`
# upload files to HydroShare
authstr="--user $HSUSER:$HSPASS"
postfile() {
	curl -X 'POST' \
	$authstr \
  	'https://www.hydroshare.org/hsapi/resource/b8852529788a437a8d697e9b0435b99a/files/full_forecasts/' \
	-H 'accept: application/json' \
	  -H 'Content-Type: multipart/form-data' \
	  -H 'X-CSRFTOKEN: ha8ABzzqeqCtHHc3R4XH3UjC39rMW6X5PUnfRyTgx2L6vVghw306qw5EobMU1yVz' \
	  -F "file=@$1;type=application/json"
}
cd full_forecasts
postfile $CSV
postfile $JSON
