library(shiny)

hip <- read.csv("HIP_star.dat", header=TRUE)

shinyServer(
  function(input, output) {
	output$hrdiag <- renderPlot({
		plot(hip$B.V, hip$Vmag, 
			 ylab='Stellar luminosity, in magnitudes',
			 xlab='B-V color index, in magnitudes',
			 main='Hipparcos H-R Diagram',
			 col='lightblue'
		     )
        m <- input$slope
		b <- input$intercept
		x0 <- min(hip$B.V, na.rm=TRUE)
		x1 <- max(hip$B.V, na.rm=TRUE)
		lines(c(x0, x1), c(m*x0+b, m*x1+b), col='red')
		mse <- mean((hip$Vmag - (m*(hip$B.V)+b))^2, na.rm=TRUE)
		text(2.5, 1, paste("MSE = ", round(mse, 2)))
	})
  }
)