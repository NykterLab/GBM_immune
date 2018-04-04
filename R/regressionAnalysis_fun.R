# R script for rgeression analysis (last updated 04.04.2018)
# Author: Suvi Luoto, University of Tampere, Finland (suvi.luoto@uta.fi)
#
# Requirements:
# R version 3.4.1 or later
# install.packages('glmnet')
#
# Usage: 
# Set working directory to directory containing R script
# source('regressionAnalysis_fun.R')
# proportions <- regressionAnalysis(mixture, reference_cells, alpha)
#
# 
#
#
#

# Function for regression analysis
regressionAnalysis = function(mixture, reference_cells, alpha = NULL) {
  # Dependencies 
  if (!require(glmnet)) {
    install.packages('glmnet')
  }
  
  library(glmnet)
  
  # Initialize results matrix
  res = matrix(nrow = length(colnames(reference_cells)),
                          ncol = length(colnames(mixture)))
  colnames(res) = colnames(mixture)
  rownames(res) = colnames(reference_cells)
  
  # Set alpha
  if (is.null(alpha)) {
    ALPHA = 0.5
  } else {
    ALPHA = alpha
  }
  
  # Run regression analysis separateky for each sample
  for (s in 1:length(colnames(mixture))) {
    
    # Choose lambda using cross-validation
    LAMBDA = cv.glmnet(x = reference_cells, y = mixture[, s], alpha = ALPHA)$lambda.1se
    
    # Calculate coeffients
    res[, s] = coef(glmnet(x = reference_cells, y = mixture[, s], alpha = ALPHA), 
                    s = LAMBDA)[-1, 1]
  }
  
  return(res)
}



























