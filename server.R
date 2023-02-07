server <- function(input, output) {
  
  sim <- reactiveValues(sim_iris = NULL, sim_glass=NULL, sim_diabet = NULL)
  
  # iris
  output$sumIris <- renderPrint({
    summary(iris)
  })
  
  output$viewIris <- renderDataTable({
    iris
  }, options = list(pageLength = 10))
  
  output$hslKls <- renderPrint({
    model_iris <- randomForest(Species ~ ., data=iris, ntree = input$tre, mtry=input$var)
    sim$sim_iris <- model_iris
    model_iris
  })
  
  output$hslPred <- renderText({
    newiris <- data.frame(
      Sepal.Length = input$sl,
      Sepal.Width = input$sw,
      Petal.Length = input$pl,
      Petal.Width = input$pw)
    prediksi <- predict(sim$sim_iris, newdata=newiris)
    paste0("Hasil prediksi adalah spesies ", as.character(prediksi))
  })
  
  output$varImpIris <- renderPlot({
    varImpPlot(sim$sim_iris, main = "Iris Variable Importance")
  })
  
  # glass
  output$sumGlass <- renderPrint({
    summary(Glass)
  })
  
  output$viewGlass <- renderDataTable({
    Glass
  }, options = list(pageLength = 10))
  
  output$hslKlsG <- renderPrint({
    model_glass <- randomForest(Type ~ ., data=Glass, ntree = input$tree, mtry=input$varb)
    sim$sim_glass <- model_glass
    model_glass
  })
  
  output$hslPredG <- renderText({
    newtype <- data.frame(
      RI=input$va_Ri,
      Na=input$va_Na,
      Mg=input$va_Mg,
      Al=input$va_Al,
      Si=input$va_Si,
      K =input$va_K,
      Ca=input$va_Ca,
      Ba=input$va_Ba,
      Fe=input$va_Fe
    )
    prediksi <- predict(sim$sim_glass, newdata=newtype)
    paste0("Hasil prediksi adalah kaca tipe ", as.character(prediksi))
  })
  
  output$varImpGlass <- renderPlot({
    varImpPlot(sim$sim_glass, main = "Glass Variable Importance")
  })
  
  # diabet
  output$sumDiab <- renderPrint({
    summary(PimaIndiansDiabetes)
  })
  
  output$viewDiab <- renderDataTable({
    PimaIndiansDiabetes
  }, options = list(pageLength = 10))
  
  output$hslKlsD <- renderPrint({
    model_diabet <- randomForest(diabetes ~ ., data=PimaIndiansDiabetes, ntree = input$treeD, mtry=input$varbl)
    sim$sim_diabet <- model_diabet
    model_diabet
  })
  
  output$hslPredD <- renderText({
    newtype <- data.frame(
      pregnant=input$pregnant,
      glucose=input$glucose,
      pressure=input$pressure,
      triceps=input$triceps,
      insulin=input$insulin,
      mass =input$mass,
      pedigree=input$pedigree,
      age=input$age
    )
    prediksi <- predict(sim$sim_diabet, newdata=newtype)
    paste0("Hasil prediksi adalah ", as.character(prediksi), " diabetes")
  })
  
  output$varImpDiab <- renderPlot({
    varImpPlot(sim$sim_diabet, main = "Pima Diabetes Variable Importance")
  })
  
}
