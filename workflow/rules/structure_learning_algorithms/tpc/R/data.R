#' Simulated Cohort Data
#'
#' Simulated data based on 'true_sim' of a European child-and-youth cohort study with three waves
#' \code{(t0, t1 and t2)}. See Andrews et al. (2021) <https://arxiv.org/abs/2108.13395>
#' for more information on how the data were generated.
#'
#' @format A data frame with 5000 observations and 34 variables (10 variables were
#' measured at three time points each, denoted as "_t0", "_t1" and "_t2").
#' \describe{
#'   \item{sex}{Sex. Factor variable with levels "male" and "female".}
#'   \item{country}{Country of residence. Factor variable with levels "ITA", "EST", "CYP",
#'   "BEL", "SWE", "GER", "HUN" and "ESP".}
#'   \item{fto}{Genotype of one SNP located in the FTO gene. Factor variable with levels
#'   "TT", "AT", "AA".}
#'   \item{birth_weight}{Birth weight in grams (numeric).}
#'   \item{age_t0}{Age in years at survey 't0' (numeric).}
#'   \item{age_t1}{Age in years at survey 't1' (numeric).}
#'   \item{age_t2}{Age in years at survey 't2' (numeric).}
#'   \item{bmi_t0}{Body mass index z-score adjusted for sex and age at survey 't0' (numeric).}
#'   \item{bmi_t1}{Body mass index z-score adjusted for sex and age at survey 't1' (numeric).}
#'   \item{bmi_t2}{Body mass index z-score adjusted for sex and age at survey 't2' (numeric).}
#'   \item{bodyfat_t0}{Per cent body fat measured at survey 't0' (numeric).}
#'   \item{bodyfat_t1}{Per cent body fat measured at survey 't1' (numeric).}
#'   \item{bodyfat_t2}{Per cent body fat measured at survey 't2' (numeric).}
#'   \item{education_t0}{Educational level at survey 't0'. Factor variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{education_t1}{Educational level at survey 't1'. Factor variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{education_t2}{Educational level at survey 't2'. Factor variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{fiber_t0}{Fiber intake in log(mg/kcal) at survey 't0' (numeric).}
#'   \item{fiber_t1}{Fiber intake in log(mg/kcal) at survey 't1' (numeric).}
#'   \item{fiber_t2}{Fiber intake in log(mg/kcal) at survey 't2' (numeric).}
#'   \item{media_devices_t0}{Number of audiovisual media in the child's bedroom at survey 't0' (numeric).}
#'   \item{media_devices_t1}{Number of audiovisual media in the child's bedroom at survey 't1' (numeric).}
#'   \item{media_devices_t2}{Number of audiovisual media in the child's bedroom at survey 't2' (numeric).}
#'   \item{media_time_t0}{Use of audiovisual media in log(h/week+1) at survey 't0' (numeric)}
#'   \item{media_time_t1}{Use of audiovisual media in log(h/week+1) at survey 't1' (numeric)}
#'   \item{media_time_t2}{Use of audiovisual media in log(h/week+1) at survey 't2' (numeric)}
#'   \item{mvpa_t0}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't0' (numeric).}
#'   \item{mvpa_t1}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't1' (numeric).}
#'   \item{mvpa_t2}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't2' (numeric).}
#'   \item{sugar_t0}{Square root of sugar intake score at survey 't0' (numeric).}
#'   \item{sugar_t1}{Square root of sugar intake score at survey 't1' (numeric).}
#'   \item{sugar_t2}{Square root of sugar intake score at survey 't2' (numeric).}
#'   \item{wellbeing_t0}{Box-Cox-transformed well-being score at survey 't0' (numeric).}
#'   \item{wellbeing_t1}{Box-Cox-transformed well-being score at survey 't1' (numeric).}
#'   \item{wellbeing_t2}{Box-Cox-transformed well-being score at survey 't2' (numeric).}
#' }
#' @references Andrews RM, Foraita R, Witte J (2021). A practical guide to causal discovery
#' with cohort data. <https://doi.org/10.48550/arXiv.2108.13395>
#'
#' @seealso [tpc::dat_cohort_dis()], [tpc::dat_cohort_mis()]
#'
"dat_cohort"



#' Simulated Cohort Data - discretized
#'
#' Data from \code{\link{dat_cohort}} for which all continuous variables have been
#' categorized into three categories.
#'
#' @format A data frame with 5000 observations and 34 variables (10 variables were
#' measured at three time points each, denoted as "_t0", "_t1" and "_t2").
#' \describe{
#'   \item{sex}{Sex. Factor variable with levels "male" and "female".}
#'   \item{country}{Country of residence. Factor variable with levels "ITA", "EST", "CYP",
#'   "BEL", "SWE", "GER", "HUN" and "ESP".}
#'   \item{fto}{Genotype of one SNP located in the FTO gene. Factor variable with levels
#'   "TT", "AT", "AA".}
#'   \item{birth_weight}{Birth weight in grams (numeric).}
#'   \item{age_t0}{Age in years at survey 't0' (numeric).}
#'   \item{age_t1}{Age in years at survey 't1' (numeric).}
#'   \item{age_t2}{Age in years at survey 't2' (numeric).}
#'   \item{bmi_t0}{Body mass index z-score adjusted for sex and age at survey 't0' (numeric).}
#'   \item{bmi_t1}{Body mass index z-score adjusted for sex and age at survey 't1' (numeric).}
#'   \item{bmi_t2}{Body mass index z-score adjusted for sex and age at survey 't2' (numeric).}
#'   \item{bodyfat_t0}{Per cent body fat measured at survey 't0' (numeric).}
#'   \item{bodyfat_t1}{Per cent body fat measured at survey 't1' (numeric).}
#'   \item{bodyfat_t2}{Per cent body fat measured at survey 't2' (numeric).}
#'   \item{education_t0}{Educational level at survey 't0'. Factor variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{education_t1}{Educational level at survey 't1'. Factor variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{education_t2}{Educational level at survey 't2'. Factor variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{fiber_t0}{Fiber intake in log(mg/kcal) at survey 't0' (numeric).}
#'   \item{fiber_t1}{Fiber intake in log(mg/kcal) at survey 't1' (numeric).}
#'   \item{fiber_t2}{Fiber intake in log(mg/kcal) at survey 't2' (numeric).}
#'   \item{media_devices_t0}{Number of audiovisual media in the child's bedroom at survey 't0' (numeric).}
#'   \item{media_devices_t1}{Number of audiovisual media in the child's bedroom at survey 't1' (numeric).}
#'   \item{media_devices_t2}{Number of audiovisual media in the child's bedroom at survey 't2' (numeric).}
#'   \item{media_time_t0}{Use of audiovisual media in log(h/week+1) at survey 't0' (numeric)}
#'   \item{media_time_t1}{Use of audiovisual media in log(h/week+1) at survey 't1' (numeric)}
#'   \item{media_time_t2}{Use of audiovisual media in log(h/week+1) at survey 't2' (numeric)}
#'   \item{mvpa_t0}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't0' (numeric).}
#'   \item{mvpa_t1}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't1' (numeric).}
#'   \item{mvpa_t2}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't2' (numeric).}
#'   \item{sugar_t0}{Square root of sugar intake score at survey 't0' (numeric).}
#'   \item{sugar_t1}{Square root of sugar intake score at survey 't1' (numeric).}
#'   \item{sugar_t2}{Square root of sugar intake score at survey 't2' (numeric).}
#'   \item{wellbeing_t0}{Box-Cox-transformed well-being score at survey 't0' (numeric).}
#'   \item{wellbeing_t1}{Box-Cox-transformed well-being score at survey 't1' (numeric).}
#'   \item{wellbeing_t2}{Box-Cox-transformed well-being score at survey 't2' (numeric).}
#' }
#' @references Andrews RM, Foraita R, Witte J (2021). A practical guide to causal discovery
#' with cohort data. <https://doi.org/10.48550/arXiv.2108.13395>
#'
#' @seealso [tpc::dat_cohort()], [tpc::dat_cohort_mis()]
#'
"dat_cohort_dis"




#' Simulated Cohort Data - with missing values
#'
#' Data from \code{\link{dat_cohort}} with missing values.
#'
#' @format A data frame with 5000 observations and 34 variables (10 variables were
#' measured at three time points each, denoted as "_t0", "_t1" and "_t2").
#' \describe{
#'   \item{sex}{Sex. Factor variable with levels "male" and "female".}
#'   \item{country}{Country of residence. Factor variable with levels "ITA", "EST", "CYP",
#'   "BEL", "SWE", "GER", "HUN" and "ESP".}
#'   \item{fto}{Genotype of one SNP located in the FTO gene. Ordinal variable with levels
#'   "TT", "AT", "AA".}
#'   \item{birth_weight}{Birth weight in grams (numeric).}
#'   \item{age_t0}{Age in years at survey 't0' (numeric).}
#'   \item{age_t1}{Age in years at survey 't1' (numeric).}
#'   \item{age_t2}{Age in years at survey 't2' (numeric).}
#'   \item{bmi_t0}{Body mass index z-score adjusted for sex and age at survey 't0' (numeric).}
#'   \item{bmi_t1}{Body mass index z-score adjusted for sex and age at survey 't1' (numeric).}
#'   \item{bmi_t2}{Body mass index z-score adjusted for sex and age at survey 't2' (numeric).}
#'   \item{bodyfat_t0}{Per cent body fat measured at survey 't0' (numeric).}
#'   \item{bodyfat_t1}{Per cent body fat measured at survey 't1' (numeric).}
#'   \item{bodyfat_t2}{Per cent body fat measured at survey 't2' (numeric).}
#'   \item{education_t0}{Educational level at survey 't0'. Ordinal variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{education_t1}{Educational level at survey 't1'. Ordinal variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{education_t2}{Educational level at survey 't2'. Ordinal variable with levels "low education",
#'   "medium education" and "high education".}
#'   \item{fiber_t0}{Fiber intake in log(mg/kcal) at survey 't0' (numeric).}
#'   \item{fiber_t1}{Fiber intake in log(mg/kcal) at survey 't1' (numeric).}
#'   \item{fiber_t2}{Fiber intake in log(mg/kcal) at survey 't2' (numeric).}
#'   \item{media_devices_t0}{Number of audiovisual media in the child's bedroom at survey 't0' (numeric).}
#'   \item{media_devices_t1}{Number of audiovisual media in the child's bedroom at survey 't1' (numeric).}
#'   \item{media_devices_t2}{Number of audiovisual media in the child's bedroom at survey 't2' (numeric).}
#'   \item{media_time_t0}{Use of audiovisual media in log(h/week+1) at survey 't0' (numeric)}
#'   \item{media_time_t1}{Use of audiovisual media in log(h/week+1) at survey 't1' (numeric)}
#'   \item{media_time_t2}{Use of audiovisual media in log(h/week+1) at survey 't2' (numeric)}
#'   \item{mvpa_t0}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't0' (numeric).}
#'   \item{mvpa_t1}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't1' (numeric).}
#'   \item{mvpa_t2}{Moderate to vigorous physical activity in sqrt(min/day) at survey 't2' (numeric).}
#'   \item{sugar_t0}{Square root of sugar intake score at survey 't0' (numeric).}
#'   \item{sugar_t1}{Square root of sugar intake score at survey 't1' (numeric).}
#'   \item{sugar_t2}{Square root of sugar intake score at survey 't2' (numeric).}
#'   \item{wellbeing_t0}{Box-Cox-transformed well-being score at survey 't0' (numeric).}
#'   \item{wellbeing_t1}{Box-Cox-transformed well-being score at survey 't1' (numeric).}
#'   \item{wellbeing_t2}{Box-Cox-transformed well-being score at survey 't2' (numeric).}
#' }
#' @references Andrews RM, Foraita R, Witte J (2021). A practical guide to causal discovery
#' with cohort data. <https://doi.org/10.48550/arXiv.2108.13395>
#'
#' @seealso [tpc::dat_cohort()], [tpc::dat_cohort_dis()]
#'
"dat_cohort_mis"







#' Cohort Data Structure
#'
#' A DAG from which the data 'data_cohort' was simulated from.
#' See Andrews et al. (2021) <https://arxiv.org/abs/2108.13395> for more information on
#' how the data were generated.
#'
#' @format A DAG (graphNEL object) with 34 nodes and 128 edges.
#' @references Andrews RM, Foraita R, Witte J (2021). A practical guide to causal discovery
#' with cohort data. <https://doi.org/10.48550/arXiv.2108.13395>
#'
#' @seealso See [graph::graphNEL()] for the class 'graphNEL'.
#'
"true_cohort"


#' Simulated Data with a Partial Ordering
#'
#' A simple graph and corresponding dataset used in the examples illustrating \code{\link{tpc}}.
#'
#' @format A data frame with 1000 observations and 9 numerical variables simulated by
#' drawing from a multivariate distribution according to the DAG \code{true_sim}.
#' \describe{
#'   \item{A1}{numeric}
#'   \item{B1}{numeric}
#'   \item{C1}{numeric}
#'   \item{A2}{numeric}
#'   \item{B2}{numeric}
#'   \item{C2}{numeric}
#'   \item{A3}{numeric}
#'   \item{B3}{numeric}
#'   \item{C3}{numeric}
#' }
"dat_sim"


#' A DAG with a Partial Ordering
#'
#' An example DAG from which the data 'data_sim' was simulated from.
#'
#' @format A DAG (graphNEL object) with 9 nodes and 7 edges.
#'
#' @seealso  See [graph::graphNEL()] for the class 'graphNEL'.
"true_sim"
