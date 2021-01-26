
clean: 
		rm -r results

docs:	docs/source
		cd docs && make html