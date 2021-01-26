
cleanres:
		rm -f results/*.csv
		rm -f results/*.eps

clean: 
		rm -r results

docs:	docs/source
		cd docs && make html

docsjson:	workflow/schemas
		jsonschema2md -d workflow/schemas/ -o workflow/schemas/docs/
