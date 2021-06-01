cleanres:
		rm -f results/*.csv
		rm -f results/*.eps
		rm -f results/*.ps
		rm -f results/*.done

clean: 
		rm -rf results

docs:	docs/source
		cd docs && make html

docsjson:	workflow/schemas
		jsonschema2md -d workflow/schemas/ -o workflow/schemas/docs/ -v 04
