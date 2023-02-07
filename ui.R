ui <- tagList(
  
  tags$head(
    tags$title("Mini App RandomForest")
    # tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ), 
  
  navbarPage(
    theme = shinytheme("cerulean"), 
    title = "Random Forest",
    
    tabPanel("About",
             sidebarPanel(includeMarkdown("md/about-app.md")),
             mainPanel(
               # img(src="img/rf.png", height = "100px"),
               img(src="img/himpro.jpg", height = "200px"),
               HTML('&nbsp;&nbsp;&nbsp;&nbsp;'),
               img(src="img/ipb.png", height = "200px")
               )
    ),
    
    tabPanel("Biologi",
             sidebarPanel(
               includeMarkdown("md/iris.md")
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Ringkasan data",
                   verbatimTextOutput("sumIris"),
                   dataTableOutput("viewIris")
                 ),
                 tabPanel("Klasifikasi",
                    numericInput(inputId = "tre",
                                 label = "Jumlah pohon klasifikasi yang terbentuk:",
                                 value = 500),
                    numericInput(inputId = "var",
                                 label = "Jumlah peubah acak:",
                                 value = 3),
                    HTML('<hr>'),
                    h4("Ringkasan pemodelan"),
                    verbatimTextOutput("hslKls"),
                    HTML('<hr>'),
                    plotOutput("varImpIris")
                 ),
                 tabPanel("Prediksi",
                    numericInput(inputId = "sl",
                                 label = "Panjang kelopak bunga:",
                                 value = 4),
                    numericInput(inputId = "sw",
                                 label = "Lebar kelopak bunga:",
                                 value = 2),
                    numericInput(inputId = "pl",
                                 label = "Panjang daun bunga:",
                                 value = 1),
                    numericInput(inputId = "pw",
                                 label = "Lebar daun bunga:",
                                 value = 0.3),
                    h4("Hasil prediksi"),
                    textOutput("hslPred")
                 )
               )
               
             )
    ),
    tabPanel("Kesehatan",
             sidebarPanel(
               includeMarkdown("md/diabetes.md")
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Ringkasan data",
                          verbatimTextOutput("sumDiab"),
                          dataTableOutput("viewDiab")
                 ),
                 tabPanel("Klasifikasi",
                          numericInput(inputId = "treeD",
                                       label = "Jumlah pohon klasifikasi yang terbentuk:",
                                       value = 500),
                          numericInput(inputId = "varbl",
                                       label = "Jumlah peubah acak:",
                                       value = 3),
                          HTML('<hr>'),
                          h4("Ringkasan pemodelan"),
                          verbatimTextOutput("hslKlsD"),
                          HTML('<hr>'),
                          plotOutput("varImpDiab")
                 ),
                 tabPanel("Prediksi",
                          numericInput(inputId = "pregnant", label = "Kehamilan:", value = 0),
                          numericInput(inputId = "glucose", label = "Uji toleransi glukosa:", value = 0),
                          numericInput(inputId = "pressure", label = "Tekanan darah:", value = 0),
                          numericInput(inputId = "triceps", label = "Ketebalan lipatan kulit trisep:", value = 0),
                          numericInput(inputId = "insulin", label = "Insulin:", value = 0),
                          numericInput(inputId = "mass", label = "BMI:", value = 20),
                          numericInput(inputId = "pedigree", label = "Silsilah diabetes:", value = 0.2),
                          numericInput(inputId = "age", label = "Umur:", value = 20),
                          h4("Hasil prediksi"),
                          textOutput("hslPredD")
                 )
               )
             )
    ),
    tabPanel("Kimia",
             sidebarPanel(
               
               includeMarkdown("md/glass.md")
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Ringkasan data",
                          verbatimTextOutput("sumGlass"),
                          dataTableOutput("viewGlass")
                 ),
                 tabPanel("Klasifikasi",
                          numericInput(inputId = "tree",
                                       label = "Jumlah pohon klasifikasi yang terbentuk:",
                                       value = 500),
                          numericInput(inputId = "varb",
                                       label = "Jumlah peubah acak:",
                                       value = 3),
                          HTML('<hr>'),
                          h4("Ringkasan pemodelan"),
                          verbatimTextOutput("hslKlsG"),
                          HTML('<hr>'),
                          plotOutput("varImpGlass")
                 ),
                 tabPanel("Prediksi",
                          numericInput(inputId = "va_Ri", label = "Refractive index:", value = 1.5),
                          numericInput(inputId = "va_Na", label = "Sodium:", value = 11),
                          numericInput(inputId = "va_Mg", label = "Magnesium:", value = 0),
                          numericInput(inputId = "va_Al", label = "Aluminum:", value = 0.1),
                          numericInput(inputId = "va_Si", label = "Silicon:", value = 70),
                          numericInput(inputId = "va_K", label = "Potassium:", value = 0.1),
                          numericInput(inputId = "va_Ca", label = "Calcium:", value = 5),
                          numericInput(inputId = "va_Ba", label = "Barium:", value = 0),
                          numericInput(inputId = "va_Fe", label = "Iron:", value = 0),
                          h4("Hasil prediksi"),
                          textOutput("hslPredG")
                 )
               )
             )
    )
  )
)
