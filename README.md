# german_credit_r
A sample data science project that uses a Logitistic Regression model built in R to predict default or pay off of loans from the German Credit dataset.

## Running Locally
For reproducability, we list platform and library info below, on which the model was trained:

R version 4.1.2 (2021-11-01)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 22.04.1 LTS

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.10.0
LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.10.0

locale:
 [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8        LC_COLLATE=C.UTF-8    
 [5] LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8    LC_PAPER=C.UTF-8       LC_NAME=C             
 [9] LC_ADDRESS=C           LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] stringr_1.4.1      jsonlite_1.8.3     readr_2.1.3        yardstick_1.1.0    workflowsets_1.0.0
 [6] workflows_1.1.2    tune_1.0.1         tidyr_1.2.1        tibble_3.1.8       rsample_1.1.0     
[11] recipes_1.0.3      purrr_0.3.5        parsnip_1.0.3      modeldata_1.0.1    infer_1.0.3       
[16] ggplot2_3.4.0      dplyr_1.0.10       dials_1.1.0        scales_1.2.1       broom_1.0.1       
[21] tidymodels_1.0.0 


To launch `german_credit.R`, run
```
R
```

Then in the R terminal,
```
source("german_credit.R")
init()
```

To produce predictions and write them to file,
```
df_sample = readr::read_csv("./data/df_sample.csv", show_col_types = FALSE)
write_csv(data.frame(score(df_sample)), "./data/score_output.csv")
```

To compute metrics on scored data and write them to file,
```
df_sample_scored = readr::read_csv("./data/df_sample_scored.csv", show_col_types = FALSE)
write_csv(data.frame(metrics(df_sample_scored)), "./data/metrics_output.csv")  
```


## Assets:
- `german_credit.R` is the main R script that contains the code to predict and get metrics on data.
- `trained_model.RData` is the trained model artifact that is loaded upon prediction. In our case, the artifact is a workflow built on top of a recipe that includes a few data cleaning steps and a call to a logistic regression model.
- The datasets used for **scoring** are `./data/df_baseline.json` and `./data/df_sample.json`. These datasets represent raw data that would first be run into a batch scoring job. A sample of the outcome to the scoring job is provided in the `./data/score_output.csv` file.
- The datasets for **metrics** are `./data/df_baseline_scored.json` and `./data/df_sample_scored.json`. These datasets represent data that have the predictions from a scoring job. A sample of the outcome to the merics job is provided in the `./data/metrics_output.csv` file.