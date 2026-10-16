source venv/bin/activate
python forecast.py

# find files
CSV=`ls full_forecasts | grep csv | tail -n 1`
JSON=`ls full_forecasts | grep rawmap | tail -n 1`
IMAGE=`ls figures | grep ForecastPlot_ | tail -n 1`
DASH=/home/daniel/code/nextdash
# upload files to HydroShare
# Set HSUSER and HSPASS as environment variables
authstr="--user $HSUSER:$HSPASS"
postfile() {
	curl -X 'POST' \
	$authstr \
  	'https://www.hydroshare.org/hsapi/resource/b8852529788a437a8d697e9b0435b99a/files/full_forecasts/' \
	-H 'accept: application/json' \
	  -H 'Content-Type: multipart/form-data' \
	  -F "file=@$1;type=application/json"
}
cp table.html $DASH/table.html
cp arrays.js $DASH/array.js
cd full_forecasts
postfile $CSV
postfile $JSON
cp $JSON $DASH/forecast.json
cd ../figures
cp $IMAGE $DASH/forecast.png
cd $DASH
DATESTR=`date +"%a %b %d %Y"`
echo "var today = \"$DATESTR\";" > today.js
git commit -am "Upload new forecast"
git push
