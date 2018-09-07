require 'travis'

env_var_name="changeme"
new_value="changeme"

Travis.access_token = "changeme"
puts "Hello #{Travis::User.current.name}!"

# change this to suit your org and repo-list
org = "pelias"

repos = [
"whosonfirst",
"openaddresses",
"geonames",
"polylines",
"openstreetmap",
"transit",
"api",
"document-service",
"pip-service",
"placeholder",
"interpolation",
"query",
"pbf2json",
"logger",
"dbclient",
"config",
"schema",
"sorting",
"microservice-wrapper",
"mock-logger",
"labels",
"categories",
"wof-admin-lookup",
"fuzzy-tester",
"model",
"polygon-lookup",
"analysis",
"dashboard",
"compare",
]

repos.each do |name|
  r = Travis::Repository.find("#{org}/#{name}")
  puts r.slug
  var = r.env_vars[env_var_name]
  if var
    r.env_vars.upsert(env_var_name, new_value, public: false)
  end
end
