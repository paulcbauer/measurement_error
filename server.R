shinyServer(function(input, output) {

  
output$plot <- renderPlot({
  times1 <- 0
  # Vector of true weights
  true.weight <- 70

  # Number of times measured
  times <- input$times.measured

  # systematic.error (size)
  systematic.error <- input$size_systematic_error

  # Size of random error
  random.error <- input$size_random_error

  # Times = 0, Systematic error = 0, Random error = 0
  if(times == 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # Plot line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error = ", "0", sep=""), cex=2, pos = 4)
  }

  # Times > 0, Systematic error = 0, Random error = 0
  if(times > 0 && systematic.error == 0 && random.error == 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # Plot line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    x.values <- rep(true.weight, times)
    y.values <- rnorm(times, mean = 2.5, sd = 0.7)
    points(x.values, y.values, pch=4)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error =", systematic.error, sep=""), cex=2, pos = 4)
  }


  # delta[Tom]

  # Times > 0, Systematic error = 0, Random error > 0
  if(times > 0 && systematic.error == 0 && random.error > 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # Plot line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    x.values <- rnorm(times, mean = 70, sd = random.error)
    y.values <- rnorm(times, mean = 2.5, sd = 0.7)
    points(x.values, y.values, pch=4)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error =", systematic.error, sep=""), cex=2, pos = 4)
  }

  # Times > 0, Systematic error > 0, Random error = 0
  if(times > 0 && systematic.error > 0 && random.error == 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # True weight line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    # Measurements
    x.values <- rnorm(times, mean = true.weight+systematic.error, sd = random.error)
    y.values <- rnorm(times, mean = 2.5, sd = 0.7)
    points(x.values, y.values, pch=4)
    # Line for mean of measured weights
    mean.measured.weights <- mean(x.values)
    lines(c(mean.measured.weights,mean.measured.weights), c(0,5), col="black", lwd=2, lty=2)
    #
    # Add arrow for error
    arrows(true.weight, 4.5, mean.measured.weights, 4.5, length = 0.25, angle = 30, col="red")
    middle <- true.weight+(systematic.error/2)
    text(middle, 5.5, expression(delta), col="red", cex=2)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error =", systematic.error, sep=""), cex=2, pos = 4)
  }

  # Times > 0, Systematic error > 0, Random error > 0
  if(times > 0 && systematic.error > 0 && random.error > 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # True weight line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    # Measurements
    x.values <- rnorm(times, mean = true.weight+systematic.error, sd = random.error)
    y.values <- rnorm(times, mean = 2.5, sd = 0.7)
    points(x.values, y.values, pch=4)
    # Line for mean of measured weights
    mean.measured.weights <- mean(x.values)
    lines(c(mean.measured.weights,mean.measured.weights), c(0,5), col="black", lwd=2, lty=2)
    #
    # Add arrow for error
    arrows(true.weight, 4.5, mean.measured.weights, 4.5, length = 0.25, angle = 30, col="red")
    middle <- true.weight+(systematic.error/2)
    text(middle, 5.5, expression(delta), col="red", cex=2)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error =", systematic.error, sep=""), cex=2, pos = 4)
  }

  # Times > 0, Systematic error < 0, Random error = 0
  if(times > 0 && systematic.error < 0 && random.error == 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # True weight line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    # Measurements
    x.values <- rnorm(times, mean = true.weight+systematic.error, sd = random.error)
    y.values <- rnorm(times, mean = 2.5, sd = 0.7)
    points(x.values, y.values, pch=4)
    # Line for mean of measured weights
    mean.measured.weights <- mean(x.values)
    lines(c(mean.measured.weights,mean.measured.weights), c(0,5), col="black", lwd=2, lty=2)
    #
    # Add arrow for error
    arrows(true.weight, 4.5, mean.measured.weights, 4.5, length = 0.25, angle = 30, col="red")
    middle <- true.weight+(systematic.error/2)
    text(middle, 5.5, expression(delta), col="red", cex=2)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error =", systematic.error, sep=""), cex=2, pos = 4)
  }

  # Times > 0, Systematic error < 0, Random error > 0
  if(times > 0 && systematic.error < 0 && random.error > 0){
    plot(NA, xlim=c(0,140), ylim=c(0,10), xlab="", ylab="", yaxt="n", cex.axis=2)
    axis(1, at=seq(0,140,10), labels=seq(0,140,10), cex.axis=2)
    mtext("Weight", side=1, line=3, col="black", cex=2)
    # True weight line
    lines(c(true.weight,true.weight), c(0,5), col="blue", lwd=2, lty=2)
    text(true.weight, 6.7, "Tom's true weight", col="blue", cex=2)
    # Measurements
    x.values <- rnorm(times, mean = true.weight+systematic.error, sd = random.error)
    y.values <- rnorm(times, mean = 2.5, sd = 0.7)
    points(x.values, y.values, pch=4)
    # Line for mean of measured weights
    mean.measured.weights <- mean(x.values)
    lines(c(mean.measured.weights,mean.measured.weights), c(0,5), col="black", lwd=2, lty=2)
    #
    # Add arrow for error
    arrows(true.weight, 4.5, mean.measured.weights, 4.5, length = 0.25, angle = 30, col="red")
    middle <- true.weight+(systematic.error/2)
    text(middle, 5.5, expression(delta), col="red", cex=2)
    text(0, 9.5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # text(0, 8.5, paste("Systematic Error =", systematic.error, sep=""), cex=2, pos = 4)
  }
        }, height=400)
































output$plot2 <- renderPlot({
  times1 <- 0
  # Vector of true weights
  true.weight <- 70
  
  # Number of times measured
  times <- input$times.measured
  
  # systematic.error (size)
  systematic.error <- input$size_systematic_error
  
  # Size of random error
  random.error <- input$size_random_error
  
  # Times = 0, Systematic error = 0, Random error = 0
  if(times == 0){
    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
                )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
  }
  
  
  
  
  
  # Times > 0, Systematic error = 0, Random error = 0
  if(times > 0 && systematic.error == 0 && random.error == 0){
    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
    )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
    text(-7, 5, paste("N = ", times, sep=""), cex=2, pos = 4)
    # 
    for(i in 0:times){
    rep(radialtext("x", center=c(0,0), start=NA, middle=0, end=NA, angle=0,
               deg=NA, expand=0, stretch=0, nice=TRUE, cex=NA), times)
    }
  }
  
  
  # delta[Tom]
  
  # Times > 0, Systematic error = 0, Random error > 0
  if(times > 0 && systematic.error == 0 && random.error > 0){
    
    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
    )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
    text(-7, 5, paste("N = ", times, sep=""), cex=2, pos = 4)
    #   
    x.values <- abs(rnorm(times, mean = 0, sd = random.error/10))
    y.values <- runif(times, min = 0, max=360)
    # polar.plot(x.values,y.values,main="Test Polar Plot",rp.type="s",point.symbols=4, add=TRUE)
    # 
    for(i in 1:times){
      rep(radialtext(".", center=c(0,0), start=NA, middle=x.values[i], end=NA, angle=NA,
                     deg=y.values[i], expand=0, stretch=0, nice=F, cex=NA))
    }
    
    
  }
  
  # Times > 0, Systematic error > 0, Random error = 0
  if(times > 0 && systematic.error > 0 && random.error == 0){
  
    
    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
    )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
    text(-7, 5, paste("N = ", times, sep=""), cex=2, pos = 4)
    #   
    x.values <- abs(rnorm(times, mean = 0, sd = random.error/10))
    y.values <- runif(times, min = 0, max=360)
    # polar.plot(x.values,y.values,main="Test Polar Plot",rp.type="s",point.symbols=4, add=TRUE)
    # 
    for(i in 1:times){
      rep(radialtext(".", center=c(0,systematic.error/10), start=NA, middle=x.values[i], end=NA, angle=NA,
                     deg=y.values[i], expand=0, stretch=0, nice=F, cex=NA))
    }
    
  
  

  }
  
  # Times > 0, Systematic error > 0, Random error > 0
  if(times > 0 && systematic.error > 0 && random.error > 0){

    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
    )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
    text(-7, 5, paste("N = ", times, sep=""), cex=2, pos = 4)
    #   
    x.values <- abs(rnorm(times, mean = 0, sd = random.error/10))
    y.values <- runif(times, min = 0, max=360)
    # polar.plot(x.values,y.values,main="Test Polar Plot",rp.type="s",point.symbols=4, add=TRUE)
    # 
    for(i in 1:times){
      rep(radialtext(".", center=c(0,systematic.error/10), start=NA, middle=x.values[i], end=NA, angle=NA,
                     deg=y.values[i], expand=0, stretch=0, nice=F, cex=NA))
    }
    
  }
  
  # Times > 0, Systematic error < 0, Random error = 0
  if(times > 0 && systematic.error < 0 && random.error == 0){

    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
    )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
    text(-7, 5, paste("N = ", times, sep=""), cex=2, pos = 4)
    #   
    x.values <- abs(rnorm(times, mean = 0, sd = random.error/10))
    y.values <- runif(times, min = 0, max=360)
    # polar.plot(x.values,y.values,main="Test Polar Plot",rp.type="s",point.symbols=4, add=TRUE)
    # 
    for(i in 1:times){
      rep(radialtext(".", center=c(0,systematic.error/10), start=NA, middle=x.values[i], end=NA, angle=NA,
                     deg=y.values[i], expand=0, stretch=0, nice=F, cex=NA))
    }
    
    
      }
  
  # Times > 0, Systematic error < 0, Random error > 0
  if(times > 0 && systematic.error < 0 && random.error > 0){
  
    radial.plot(rep(0,4),rep(0,4), main="", labels="\n",  
                line.col="black", lwd=1, lty=3,rad.col="black", rp.type="p", 
                radial.lim=c(0,4), label.prop=1.1, cex.axis=.5,
                show.grid.labels=3, 
                radial.labels=NA,
                show.centroid=F,
                show.radial.grid=FALSE
    )  
    text(2.3,0, "Tom's true weight", font=1)
    points(0,0, col="red", pch=19)
    text(-7, 5, paste("N = ", times, sep=""), cex=2, pos = 4)
    #   
    x.values <- abs(rnorm(times, mean = 0, sd = random.error/10))
    y.values <- runif(times, min = 0, max=360)
    # polar.plot(x.values,y.values,main="Test Polar Plot",rp.type="s",point.symbols=4, add=TRUE)
    # 
    for(i in 1:times){
      rep(radialtext(".", center=c(0,systematic.error/10), start=NA, middle=x.values[i], end=NA, angle=NA,
                     deg=y.values[i], expand=0, stretch=0, nice=F, cex=NA))
    }
    
    
  }
}, height=400)


})
