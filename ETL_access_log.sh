

# dowloading the file
echo "downloading"
curl "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz" --output web-server-access-log.txt.gz


# unzipping the file
gunzip -f web-server-access-log.txt.gz

# Extracting data
echo "Extracting Data"
cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt


# Transforming data
echo "Transformation of Data"
tr "#" "," < extracted-data.txt > transformed-data.csv

# Loading Phase
echo "Loading Data"

echo "\c test_db; \COPY access_log FROM 'transformed-data.csv' DELIMITER ',' CSV HEADER;" | psql --username=____ --password=___
