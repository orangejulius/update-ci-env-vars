set -ex


circle_token="changeme"
new_value="changeme"
env_var_name="changeme"

org="changeme"
projects=(
"geonames"
"openstreetmap"
"whosonfirst"
"openaddresses"
"polylines"

"api"
"document-service"
"pip-service"
"placeholder"
"interpolation"
query
pbf2json
logger
dbclient
config
schema
sorting
microservice-wrapper
mock-logger
labels
categories
wof-admin-lookup
fuzzy-tester
model
polygon-lookup
analysis
)

for project in $projects; do
	echo $project
	curl -XDELETE https://circleci.com/api/v1.1/project/github/$org/$project/envvar/$env_var_name?circle-token=$new_value

	curl -X POST --header "Content-Type: application/json" -d "{\"name\":\"$env_var_name\", \"value\":\"${new_value}\"}" \
		https://circleci.com/api/v1.1/project/github/$org/$project/envvar?circle-token=$new_value

	curl https://circleci.com/api/v1.1/project/github/$org/$project/envvar/$env_var_name?circle-token=$circle_token

	echo
	echo

done
