# library(shiny)
# library(BH)
# library(stringr)
# library(lattice)
# library(latticeExtra)
# library(psych) # enfernen?
library(markdown)
library(plotrix)



  shinyUI(fluidPage(

  # Application title
  titlePanel("Measurement error (systematic and random)"),

  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(


      sliderInput("times.measured", label = "Times measured:",
                  min = 0, max = 1000, value = 0, step = 1),
      sliderInput("size_systematic_error", label = "Add systematic error:",
                  min = -20, max = 20, value = 0, step = 1),
      sliderInput("size_random_error", label = "Add random error:",
                  min = 0, max = 20, value = 0, step = 1)



  ),

 mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Simple plot", plotOutput("plot")),
        tabPanel("Bull's eye", plotOutput("plot2")),
        tabPanel("Explanation", includeMarkdown("explanation.md")),
        tabPanel("Instructions", includeMarkdown("instruction.md")),
        tabPanel("About", includeMarkdown("about.md"))

      )
    )
  )
))

















