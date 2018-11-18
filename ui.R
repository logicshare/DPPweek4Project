library(shiny)
shinyUI(
		fluidPage
		(
		 titlePanel("mpgapp : Predcit Miles/(US) gallon"),
		 sidebarLayout
		 (
		  sidebarPanel
		  (
		   sliderInput("sliderHP","Gross horsepower?",50,350,value=100),
		   sliderInput("sliderWT","Weight of car(x 1000 lbs)?",1,6,value=4),
		   selectInput("selectAM",label="Transmission type?",choices=c("automatic","manual"),selected="automatic")		      
		  ),
		  mainPanel(plotOutput("plot"),h3("Predicted Miles/(US) gallon (highlighted in black): "),textOutput("pred"))
		 ),
		helpText( a(strong("Help"),href="https://logicshare.github.io/mpgapp_documentation.html",target="_blank"))
		)  
		)
