# This is totally fine to clean sinc e it only contains copies
all:
	
cleanres:
		rm -rf results/output

# Cleans all results.
cleanall: 
		rm -rf results

# Creates the docs
docs:	docs/source/*
		cd docs && ./render_docs.sh && make html

# Generates markdown for the json schema. 
# Install by:
# $ npm install -g @adobe/jsonschema2md
docsjson:	workflow/schemas
		jsonschema2md -d workflow/schemas/ -o docs/source/json_schema -x docs/source/json_schema -v 06  
# Use grip 
# $ grip docs/source/json_schema/config.md -b 
# to view it.
# install it by 
# $ pip install grip
