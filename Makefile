cleanres:
		rm -rf results/output

cleanall: 
		rm -rf results

docs:	docs/source
		cd docs && make html

docsjson:	workflow/schemas
		jsonschema2md -d workflow/schemas/ -o docs/source/json_schema -v 04

