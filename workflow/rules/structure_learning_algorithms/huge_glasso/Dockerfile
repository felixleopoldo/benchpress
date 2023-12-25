FROM r-base:4.2.1

RUN R -e "install.packages('R.utils', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('huge', repos='http://cran.us.r-project.org')"


# Cleanup
RUN rm -rf /tmp/*



