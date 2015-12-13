library(markdown)
library(plotrix)



  shinyUI(fluidPage(

  titlePanel("Measurement error (systematic and random)"),

  sidebarLayout(
    sidebarPanel(

      sliderInput("times.measured", label = "Times measured:",
                  min = 0, max = 1000, value = 0, step = 1),
      sliderInput("size_systematic_error", label = "Add systematic error:",
                  min = -20, max = 20, value = 0, step = 1),
      sliderInput("size_random_error", label = "Add random error:",
                  min = 0, max = 20, value = 0, step = 1),
      br(), br(),
      
      div("Shiny app by", 
          a(href="http://paulcbauer.eu/",target="_blank", 
            "Paul C. Bauer"),align="right", style = "font-size: 8pt"),
      
      
      div("Shiny/R code:",
          a(href="https://github.com/paulbauer/measurement_error/",
            target="_blank","GitHub"),align="right", style = "font-size: 8pt")



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

















