# Load libraries
library(tidymodels)
library(readr)

init <- function() {
    # 
    # Function to load saved model into global variable: model
    # 
    load("trained_model.RData")
    model <<- logreg_fit
}

score <- function(data) {
    # 
    # Function to predict on input data (data.frame)
    # 
    df <- data.frame(data, stringsAsFactors = F)
    preds <- predict(model, df)
    output <- list(label_value = df$label, score = preds$.pred_class)
    return(output)
}

metrics <- function(data) {
    # 
    # Function to compute binary classification metrics on scored and labeled data
    # 
    df <- data.frame(data)
    get_metrics <- metric_set(f_meas, accuracy, sensitivity, specificity, precision)
    output <- get_metrics(data = df, truth = as.factor(label_value), estimate = as.factor(score))
    return(output)
}
