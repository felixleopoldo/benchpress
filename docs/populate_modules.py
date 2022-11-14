
from pathlib import Path
import json


modpath = Path("../workflow/rules/graph")
#modpath = Path("../workflow/rules/parameters")
#modpath = Path("../workflow/rules/evaluation")

for p in modpath.iterdir():
    print(p.name)
    if p.name == "docs.rst":
        continue
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"

    if not d.is_file():
        with open(d, 'w') as fp:
            pass

    if not j.is_file():
        info = {
            "title": "Some title",
            "docker_image": "username/image:version",
            "version": "v0.0.1",
            "package": {"title": "", "url": "http"},
            "docs_url": "",
            "papers": [
                {
                    "title": "the paper title",
                    "url": "the_url"
                }
            ],
            "graph_types": [
                ""
            ],
            "language": ""
        }

        with open(j, "w") as outfile:
            outfile.write(json.dumps(info, indent=4))


modpath = Path("../workflow/rules/parameters")

for p in modpath.iterdir():
    print(p.name)
    if p.name == "docs.rst":
        continue
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"

    if not d.is_file():
        with open(d, 'w') as fp:
            pass

    if not j.is_file():
        info = {
            "title": "Some title",
            "docker_image": "username/image:version",
            "version": "v0.0.1",
            "package": {"title": "", "url": "http"},
            "docs_url": "",
            "papers": [
                {
                    "title": "the paper title",
                    "url": "the_url"
                }
            ],
            "graph_types": [
                ""
            ],
            "language": ""
        }

        with open(j, "w") as outfile:
            outfile.write(json.dumps(info, indent=4))


modpath = Path("../workflow/rules/data")

for p in modpath.iterdir():
    print(p.name)
    if p.name == "docs.rst":
        continue
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"

    if not d.is_file():
        with open(d, 'w') as fp:
            pass

    if not j.is_file():
        info = {
            "title": "Some title",
            "docker_image": "username/image:version",
            "version": "v0.0.1",
            "package": {"title": "", "url": "http"},
            "docs_url": "",
            "papers": [
                {
                    "title": "the paper title",
                    "url": "the_url"
                }
            ],
            "graph_types": [
                ""
            ],
            "language": ""
        }

        with open(j, "w") as outfile:
            outfile.write(json.dumps(info, indent=4))


modpath = Path("../workflow/rules/data")

for p in modpath.iterdir():
    print(p.name)
    if p.name == "docs.rst":
        continue
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"

    if not j.is_file():
        with open(d, 'w') as fp:
            pass

    if not j.is_file():
        info = {
            "title": "Some title",
            "docker_image": "username/image:version",
            "version": "v0.0.1",
            "package": {"title": "", "url": "http"},
            "docs_url": "",
            "papers": [
                {
                    "title": "the paper title",
                    "url": "the_url"
                }
            ],
            "graph_types": [
                ""
            ],
            "language": ""
        }

        with open(j, "w") as outfile:
            outfile.write(json.dumps(info, indent=4))



algspath = Path("../workflow/rules/structure_learning_algorithms")


for p in algspath.iterdir():
    print(p.name)
    if p.name == "docs.rst":
        continue
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"

    if not j.is_file():

        info = {
            "title": "Some title",
            "docker_image": "username/image:version",
            "version": "v0.0.1",
            "package": {"title": "", "url": "http"},
            "docs_url": "",
            "papers": [
                {
                    "title": "the paper title",
                    "url": "the_url"
                }
            ],
            "outputs": ["adjmat"],
            "graph_types": [
                ""
            ],
            "language": ""
        }

        with open(j, "w") as outfile:
            outfile.write(json.dumps(info, indent=4))

    with open(s) as json_file:
        schema = json.load(json_file)

    if "$ref" in schema["items"]:
        schema["items"] = schema["definitions"][p.name]

    if "definitions" in schema:
        schema.pop("definitions")

    # with open(s, "w") as outfile:
    #     outfile.write(json.dumps(schema, indent=4))

    # print(schema)
