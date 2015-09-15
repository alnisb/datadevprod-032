library(shiny)
library(rCharts)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Iris Classifier"),
    
    fluidRow(
        column(12,
               h4("Introduction"))),
    
    fluidRow(
        column(6,
               p("The purpose of this app is to identify species of irises based on physical measurements, using the Random Forest classification method. Follow the directions to select a training set, build a model, and apply the model to the test set."))),
    
    fluidRow(
        column(12,
               h4("1. Select and View the Training Set"))),
    
    fluidRow(
        column(3,
               p("Divide the iris data into training and test sets with the slider. Explore the training set using the pull down menus to set the plot's x- and y-axes.")),
        column(3,
               sliderInput("testTrain",
                           label = "Percent of data to use as a training set",
                           min = 50,
                           max = 80,
                           value = 70,
                           step = 5),
               selectInput("xaxis",
                           label = "Choose x-axis",
                           choices = names(iris)[-5],
                           selected = names(iris)[1]),
               uiOutput("uiy")),
        column(6,
               showOutput("plot1", "highcharts"))
    ),
    
    fluidRow(
        
        column(12,
               h4("2. Pick Covariates"))
    ),
    
    fluidRow(
        
        column(3,
               p("Select which covariates are most likely to produce a good classification model.")),
        column(6,
               htmlOutput("warnMsg"),
               selectizeInput(inputId = "coVars",
                              label = "Choose covariates",
                              choices = names(iris[, 1:4]),
                              selected = names(iris[, 1:4]),
                              multiple = TRUE,
                              options = list(plugins = I("['remove_button']"))
               ))
        
    ),
    
    fluidRow(
        
        column(12,
               h4("3. Evaluate the model's performance"))),
    
    fluidRow(
        
        column(2,
               p('The scatterplot shows the test set. The flowers classified wrongly are shown with large dots. You can change how the covariates are plotted against one another to see where the model did well, or not. Toggle the large dots on and off by clicking "False Predictions" in the legend.')),
        column(4,
               selectInput("xaxis2", label = "Choose x-axis",
                           choices = names(iris)[1:4],
                           selected = names(iris[1])),
               uiOutput("uiy2"),
               tableOutput("view"),
               p("The table gives a breakdown of the model's performance.")),
        column(6,
               showOutput("plot2", "highcharts"))
    
)))
