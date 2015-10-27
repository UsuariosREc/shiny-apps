##-----------------------------------------------------------##
#               app informe mediciones - ui.R                 #
##-----------------------------------------------------------##

library(shiny)

shinyUI(fixedPage( 
  HTML("<body style=background:##FAFAFA> </body>"),
  
#--------------------------- fixed row 1 logos---------------------------------#
fixedRow(
  HTML("<hr color=SteelBlue noshade=noshade />"),
  column(width=2,offset = 0,
         HTML("<a href=http://www.consultoresmatematicos.com/#!capacitaciones/cjg9>
               <img src=logo_ssl_ult.jpeg
              width = 240 height = 90> </a>")
  ),
  column(width=4,offset = 2,
         HTML("<div align=center> <font color=SteelBlue face=Elephant size=6> Informe de Ensayos 
              Metrológicos </font> </div>")
         ),
  column(width=2,offset = 2,
         HTML("<a href=http://www.consultoresmatematicos.com> <img src=logo_msplus.jpg
              width = 110 height = 90> </a>")#,
         #tags$img(src = "logo_msplus.jpg", width = "145px", height = "80px",border="1")       
  )
  ),    
HTML("<hr color=SteelBlue noshade=noshade />"),

#--------------------- fixed row 2 grafico comparacion-------------------------#  
# Informacion medidor
fixedRow(
  sidebarPanel(width=6,
     textInput(inputId="nomb", label = "Nombre",value = "Source Stat Lab"),
     textInput(inputId="direc", label = "Dirección",value = "Fernando Oviedo E8-65 y Jose Barba"),
     textInput(inputId="repre", label = "Representante",value = "MS-PLUS Consultores"),
     textInput(inputId="telf", label = "Teléfono",value = "+ 593-998 890 021"),
     HTML("<div align=left> <font color=SteelBlue face=Arial size=2>
          Información del Cliente </font> </div>")
     ),
sidebarPanel(width=3,
     textInput(inputId="mod", label = "Modelo",value = "Multimag"),
     textInput(inputId="serie", label = "Serie",value = "14005998"),
     
     textInput(inputId="diam", label = "Diámetro",value = "15mm"),
     
     textInput(inputId="clase", label = "Clase",value = "B"),
     HTML("<div align=left> <font color=SteelBlue face=Arial size=2>
          Información del Medidor </font> </div>")
     ),
sidebarPanel(width = 3,
     numericInput(inputId="qmin", label = "Qmin",value = 30),
     numericInput(inputId="qt", label = "Qt",value = 120),
     numericInput(inputId="qn", label = "Qn",value = 1500),
     numericInput(inputId="qmax", label = "Qmax",value = 3000),
     HTML("<div align=left> <font color=SteelBlue face=Arial size=2>
          Información de Caudales </font> </div>")
     )
),   

HTML("<hr> </hr>"),
  
#--------------- Graficos
#-------------------------------------------------
fixedRow(
  column(width=5,offset = 0,  
         plotOutput(outputId="graf1", width = 520, height = 290)
  ),
  column(width=3,offset = 1,
         sidebarPanel(width=11,
         radioButtons("vm3", label ="Tipo de lectura", choices = c("Volúmen mayor"="mayor",
                                                    "Volúmen menor"="menor"),
                      selected="mayor")
         ),
         HTML("<hr> </hr>"),
         HTML("<img src=medidor.jpg width = 90 height = 80 align=left>"),
         tags$h5("Medidor aceptado?", style = "color:red",align="center"),
         tags$h2(textOutput("medidor"),style = "color:red",align="center")
  ),
  column(width=3,offset = 0,
         sidebarPanel(width=11,
         radioButtons("tipmed", label ="Tipo de medidor", choices = c("Medidor nuevo"="nuevo",
                                                       "Medidor usado"="usado"),
                      selected="nuevo")
         ),
         HTML("<hr> </hr>"),
         sidebarPanel(width=11,
         textInput(inputId="marca", label = "Marca del medidor",value = "MARCA SSL")
         )
  )
),
  
#------------------ fixed row 3 tabla descrip comparacion----------------------#
fixedRow(
 column(width=5,offset = 0,
        # tabla descriptivos error
        HTML("<br> </br>"),
        plotOutput(outputId="graf2", width = 550, height = 120)
 ),
 column(width=2,offset = 1,
        HTML("<b> <font color=SteelBlue face=Cambria size=3> Análisis </font> </b>"),
        HTML("<p> <img src=analisis.jpg width = 80 height = 70 align=left>
             <font color=SteelBlue face=Cambria size=2> Gráfico del error porcentual
             entre lecturas medidores patrón y usario.
             </font> <p>"),
       submitButton("Analizar")
 ),
 column(width=2,offset = 1,
        HTML("<b> <font color=SteelBlue face=Cambria size=3> Generar Informe </font> </b>"),
        HTML("<p> <img src=report.png width = 80 height = 70 align=left>
            <font color=SteelBlue face=Cambria size=2> Se genera el reporte automático
            con la información dada. </font> <p>"),
       downloadButton('downloadReportrnw', label="Descargar")
  )
),
  
  #------------------------ Datos ensayo medidor patron -------------------------#
HTML("<hr> </hr>"),
HTML("<b> <font color=Green face=Arial size=3> Lecturas en medidor patrón </font> </b>"),
fixedRow(
 column(width=1,
        HTML("<br> </br>"),
        HTML("<b> <font face=Arial size=2> Inicial: </font> </b>"),
        HTML("<br> </br>"),
        HTML("<b> <font face=Arial size=2> Final: </font> </b>")
 ),
 column(width=2,
        numericInput("mpqmini",label ="Qmin",value = 0),
        numericInput("mpqminf",label ="",value = 0)
 ),
 column(width=2,
        numericInput("mpqti",label ="Qt",value = 0),
        numericInput("mpqtf",label ="",value = 0)
 ),
 column(width=2,
        numericInput("mpqni",label ="Qn",value = 0),
        numericInput("mpqnf",label ="",value = 0)
 ),
 column(width=2,
        numericInput("mpqmaxi",label ="Qmax",value = 0),
        numericInput("mpqmaxf",label ="",value = 0)
 )
),
  
# Datos ensayo medidor usuario
HTML("<b> <font color=Green face=Arial size=3> Lecturas en medidor de usuario </font> </b>"),
fixedRow(
 column(width=1,
        HTML("<br> </br>"),
        HTML("<b> <font face=Arial size=2> Inicial: </font> </b>"),
        HTML("<br> </br>"),
        HTML("<b> <font face=Arial size=2> Final: </font> </b>")
 ),    
 column(width=2,
        numericInput("muqmini",label ="Qmin",value = 0),
        numericInput("muqminf",label ="",value = 0)
 ),
 column(width=2,
        numericInput("muqti",label ="Qt",value = 0),
        numericInput("muqtf",label ="",value = 0)
 ),
 column(width=2,
        numericInput("muqni",label ="Qn",value = 0),
        numericInput("muqnf",label ="",value = 0)
 ),
 column(width=2,
        numericInput("muqmaxi",label ="Qmax",value = 0),
        numericInput("muqmaxf",label ="",value = 0)
 )
),
tags$hr(),
tags$hr(),

# Auspiciantes
HTML("<b> <font color=Green face=Arial size=5> Auspiciantes </font> </b>"),
tags$hr(),
fixedRow(
  column(width=4,
         # ms plus consultores
         HTML("<a href=http://www.consultoresmatematicos.com> <img src=logo_msplus.jpg
              width = 110 height = 90> 
              <b> <font color=SteelBlue face=Arial size=3> MS-PLUS Consultores 
              </font> </b> </a>")
         ),
  column(width=4,
         # source stat lab
         HTML("<a href=http://www.consultoresmatematicos.com/#!capacitaciones/cjg9>
               <img src=logo_ssl_ult.jpeg
              width = 240 height = 90> </a>")
  ),
         
  column(width=3,offset = 0,
         # r users group
         HTML("<a href=http://usuariosrec.github.io/Web> <img src=logo_rgroup.jpg
              width = 110 height = 90> 
              <b> <font color=SteelBlue face=Arial size=3> R Users Group Ec 
              </font> </b> </a>")
         )
  ),
tags$hr(),
tags$hr(),

# Redes sociales
HTML("<font color=SteelBlue face=Arial size=1.7> Siguenos en</font>"),
HTML("<a href=https://www.facebook.com/sourcestatlab> <img src=facebook.png width = 50
     height = 35> 
     <font color=SteelBlue face=Arial size=1.7>  Source Stat Lab EC </font> </a>"),
HTML("<a href=https://twitter.com/SourceStatLab> <img src=twitter.jpg width = 50
     height = 45> 
     <font color=SteelBlue face=Arial size=1.7> @SourceStatLabEC </font> </a>"),
HTML("<hr color=SteelBlue noshade=noshade />"),

tags$hr()

)
)


