
clean: 
		rm -r results

docs:	docs/source
		cd docs && make html

docsjson:	workflow/schemas
		jsonschema2md -d workflow/schemas/ -o workflow/schemas/docs/
