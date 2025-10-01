<snippet>
  <content>


<p align="left">
<a href="https://benchpressdocs.readthedocs.io/" target="_blank" rel="noopener noreferrer">
<img width="248"  src="docs/source/_static/benchpress-logo-white-bg.png" alt="Benchpress logo">
</a>
</p>


[![Snakemake](https://img.shields.io/badge/snakemake-≥7.30.1-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Documentation Status](https://readthedocs.org/projects/benchpressdocs/badge/?version=latest)](https://benchpressdocs.readthedocs.io/en/latest/?badge=latest)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

---

Benchpress [[1]](#1) is a [Snakemake](https://snakemake.readthedocs.io/en/stable/) workflow where structure learning (sometimes called causal discovery) algorithms, implemented in possibly different languages, can be executed and compared.
The computations scale seamlessly on multiple cores or *"... to server, cluster, grid and cloud environments, without the need to modify the workflow definition" - Snakemake*.
The documentation is found at https://benchpressdocs.readthedocs.io. 
<!-- [This](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#evaluation) section shows an overview of the supported evaluation methods. -->

The following main functionalities are provided by Benchpress 

* Benchmarks - Benchmark structure learning algorithms.
* Algorithm development - Benchmark your own algorithm along with the existing ones while developing.
* Data analysis - Estimate the underlying graph structure for your own dataset(s).

You may also have a look at [this Medium story](https://medium.com/@felixleopoldorios/structure-learning-using-benchpress-826847db0aa8) for an introduction.


## Citing

```
@Article{Benchpress,
    author = {Felix L. Rios and Giusi Moffa and Jack Kuipers},
    title = {{Benchpress}: A Versatile Platform for Structure Learning in Causal and Probabilistic Graphical Models},
    journal = {Journal of Statistical Software},
    year = {2025},
    volume = {114},
    number = {12},
    pages = {1--43},
    doi = {10.18637/jss.v114.i12}
}

```

## Contact

For problems, bug reporting, or questions please raise an issue or open a discussion thread.

## Contributing
Contributions are very welcomed. See [CONTRIBUTING.md](CONTRIBUTING.md) for instructions. 

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Open a pull request

## License

This project is licensed under the GPL-2.0 License - see the [LICENSE](LICENSE) file for details

</content>
  <tabTrigger></tabTrigger>
</snippet>


## References
* <a id="1">[1]</a> [Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: A Versatile Platform for Structure Learning in Causal and Probabilistic Graphical Models. *Journal of Statistical Software.*, 10.18637/jss.v114.i12, 2025.](https://doi.org/10.18637/jss.v114.i12)


