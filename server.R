library(shiny)

shinyServer(function(input, output) {
  
  output$starPlot <- renderPlot({
      if(input$type=='Pointed Star'){
          n <- input$n_lines
          col <- input$color
          lwd <- input$lineWidth
          lty <- as.numeric(input$lineType)
          sides <- input$sides
          
          y <- c(n:1)
          par(mar=c(0,0,0,0))
          plot.new()
          plot.window(xlim=c(-n,n), ylim=c(-n,n))
          lines(c(-n,n), c(0,0), col=col, lwd=lwd, lty=lty)
          lines(c(0,0), c(-n,n), col=col, lwd=lwd, lty=lty)
          if(input$rect){rect(-n,-n,n,n, border=col, lwd=lwd, lty=1)}
          
          for(i in 1:n){
              if('Side 1' %in% sides){lines(c(i,0), c(0,y[i]),   
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 1
              if('Side 2' %in% sides){lines(c(-i,0), c(0,y[i]),  
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 2 
              if('Side 3' %in% sides){lines(c(-i,0), c(0,-y[i]), 
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 3
              if('Side 4' %in% sides){lines(c(i,0), c(0,-y[i]),
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 4
          }
      }
      
      if(input$type=='Inverse Star'){
          n <- input$n_lines
          col <- input$color
          lwd <- input$lineWidth
          lty <- as.numeric(input$lineType)
          sides <- input$sides
          
          y <- c(n:1) 
          par(mar=c(1,1,1,1))
          plot.new()
          plot.window(xlim=c(0,n), ylim=c(0,n))
          if(input$rect){rect(0,0,n,n, border=col, lwd=lwd, lty=1)}
          
          for(i in 1:n){
              if('Side 1' %in% sides){lines(c(i,0), c(0,y[i]), 
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 1
              if('Side 2' %in% sides){lines(c(0,y[i]), c(y[i]-1,n), 
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 2 
              if('Side 3' %in% sides){lines(c(i-1,n), c(n,y[i]-1), 
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 3
              if('Side 4' %in% sides){lines(c(i-1,n), c(0,i), 
                                    col=col, lwd=lwd, lty=lty)} # Quadrant 4
          }
      }
  })
})
