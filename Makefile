# This is totally fine to clean sinc e it only contains copies
cleanres:
		rm -rf results/output

# Cleans all results.
cleanall: 
		rm -rf results

# Creates the docs
docs:	docs/source/*
		cd docs && make html

# Generates markdown for the json schema. 
# Install by:
# $ npm install -g @adobe/jsonschema2md
docsjson:	workflow/schemas
		jsonschema2md -d workflow/schemas/ -o docs/source/json_schema -v 04

