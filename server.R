library(shiny)
library(ggplot2)

shinyServer(function(input,output){

			mtcars$am <- factor(mtcars$am,labels=c('automatic','manual'))

			model<-lm(mpg ~ hp + wt + am, data=mtcars)
			
			modelpred<-reactive({
			
			hpInput<-input$sliderHP
			wtInput<-input$sliderWT
			amInput<-input$selectAM
			
			mtcarsNew<-data.frame(hp=hpInput,wt=wtInput,am=amInput)
			
			mtcarsNew$am <- as.factor(mtcarsNew$am)
			
			predict(model,newdata=mtcarsNew)
			
			})
			
			output$plot<-renderPlot({

			hpInput<-input$sliderHP
			wtInput<-input$sliderWT
			amInput<-input$selectAM
			
			mtcarsNew<-data.frame(hp=hpInput,wt=wtInput,am=amInput)
			
			mtcarsNew$am <- as.factor(mtcarsNew$am)
			
			ggplot(mtcars, aes(x=hp,y=mpg,label=rownames(mtcars))) + geom_text(vjust = -1,size = 3.5,angle=315,check_overlap = TRUE) + geom_point(aes(size=wt,colour=am)) + geom_point(aes(x=mtcarsNew$hp,y=modelpred(),size=mtcarsNew$wt,shape=mtcarsNew$am)) + labs(x= "Gross horsepower", y= "Miles/(US) gallon" , title="Gross horsepower vs Miles/(US) gallon for automatic and manual transmission")
			
			})
			
			output$pred<-renderText({
			modelpred()
			})
	
			}
		   )
