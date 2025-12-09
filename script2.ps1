Add-Type -AssemblyName System.Windows.Forms # Add-Type es el Cmdlet de PowerShell y sirve para cargar tipos de .NET en el entorno.
                                            # -AssemblyName Indica qué librería .NET queremos cargar.
                                            # System.Windows.Forms es el nombre del ensamblado o de la libreria. Contiene todo lo necesario para crear ventanas gráficas, botones, labels, textbox, etc.
                                            #Esta línea lo que hace es cargar la libreria que nosotros indiquemos
Add-Type -AssemblyName System.Drawing       # Add-Type es el Cmdlet de PowerShell y sirve para cargar tipos de .NET en el entorno.
                                            # -AssemblyName Indica qué librería .NET queremos cargar.
                                            # System.Draving es el tipo libreria que vamos a descargar que en este caso contiene clases de gráficos y sirve para manejar tamaños, colores, posiciones, imágenes, etc.
                                            # Esta línea lo que hace es cargar la libreria que nosotros indiquemos

# Create form
$form = New-Object System.Windows.Forms.Form #$form es la variable que guardará el formulario.
                                             #New-Object crea una instancia nueva o un nuevo objeto.
                                             # System.Windows.Forms.Form es la clase que define todas las características que debe tener una ventana gráfica dentro de windows.
                                             # Esta línea se encarga de crear la ventana principal donde estarán los cuadros de texto y botones. Es básicamente la "pantalla" del programa.
$form.Text = "Input Form" #$form es la variable que contiene el formulario creado.
                          #.Text es la propiedad del formulario que define el título que se va a observar en la barra superior.
                          #"Input Form" es la cadena de texto que será el título que se va a mostrar.
                          #Esta línea asigna el título que se mostrará en la parte superior del formular
$form.Size = New-Object System.Drawing.Size(500,250) #$form es la variable que contienen al formulario.
                                                     #.Size es la que se encarga de las propiedades que define las dimensiones del formulario.
                                                     #New-Object se encarga de crear un nuevo objeto.
                                                     #System.Drawing.Size es la clase que define un tamaño (ancho y alto).
                                                     #(500,250) son los parámetros establecidos: 500 píxeles de ancho y 250 píxeles de alto.
                                                     #Esta línea de código se encarga de establecer el tamaño del formulario en pantalla. 
$form.StartPosition = "CenterScreen" #.StartPosition es propiedad que define la posición en la que va aparecer la ventana al abrirse.
                                     #CenterScreen" es el valor que indica que debe abrirse en el centro de la pantalla.
                                     #Esta línea indica que la ventana debe aparecer centrada cuando se abra. 

############# Define labels label(información, texto fijo, etiqueta)
$textLabel1 = New-Object System.Windows.Forms.Label  #$textLabel1 es la variable donde se almacenará la etiqueta.
                                                     #New-Object crea una nueva instancia.
                                                     #System.Windows.Forms.Label es la herramienta que usa el programa para mostrar un texto fijo en la ventana.
                                                     #Esta línea de código crea una etiqueta visual que será usada para mostrar el texto “Input 1” al usuario.
$textLabel1.Text = "Input 1:" #$textLabel1 es la etiqueta creada.
                              #.Text es la propiedad que define qué texto mostrará.
                              #"Input 1:" es el texto visible en pantalla.
                              #Aquí se define el texto que verá el usuario junto al primer cuadro de entrada.
#Posició y tamaño del label1
$textLabel1.Left = 20   #.Left es la distancia desde el borde izquierdo del formulario y 20 el valor en píxeles.
$textLabel1.Top = 20    #.Top es la distancia desde la parte superior y 20 el valor en píxeles.
$textLabel1.Width = 120 #.Width es el ancho del control y 120 el valor en píxeles.
#Estas líneas lo que hacen es dar los parámetros específicos. 
#Segunda etiqueta creada
$textLabel2 = New-Object System.Windows.Forms.Label  #$textLabel2 es la variable donde se almacenará la etiqueta.
                                                     #New-Object crea una nueva instancia.
                                                     #System.Windows.Forms.Label es la herramienta que usa el programa para mostrar un texto fijo en la ventana.
                                                     #Esta línea de código crea una etiqueta visual que será usada para mostrar el texto “Input 2” al usuario.
$textLabel2.Text = "Input 2:" #$textLabel2 es la segunda etiqueta creada.
                              #.Text es la propiedad que define qué texto mostrará.
                              #"Input 2:" es el texto visible en pantalla.
                              #Aquí se define el texto que verá el usuario junto al segundo cuadro de entrada.
#Posición y tamaño del label2
$textLabel2.Left = 20 #.Left es la distancia desde el borde izquierdo del formulario y 20 el valor en píxeles.
$textLabel2.Top = 60  #.Top es la distancia desde la parte superior y 60 el valor en píxeles.
$textLabel2.Width = 120 #.Width es el ancho del control y 120 el valor en píxeles.
#Estas líneas lo que hacen es dar los parámetros específicos. 
#Tercera etiqueta creada
$textLabel3 = New-Object System.Windows.Forms.Label #$textLabel3 es la variable donde se almacenará la etiqueta.
                                                     #New-Object crea una nueva instancia.
                                                     #System.Windows.Forms.Label es la herramienta que usa el programa para mostrar un texto fijo en la ventana.
                                                     #Esta línea de código crea una etiqueta visual que será usada para mostrar el texto “Input 3” al usuario.
$textLabel3.Text = "Input 3:" #$textLabel3 es la tercera etiqueta creada.
                              #.Text es la propiedad que define qué texto mostrará.
                              #"Input 3:" es el texto visible en pantalla.
                              #Aquí se define el texto que verá el usuario junto al tercer cuadro de entrada.
#Posición y tamaño del label3
$textLabel3.Left = 20 #.Left es la distancia desde el borde izquierdo del formulario y 20 el valor en píxeles.
$textLabel3.Top = 100 #.Top es la distancia desde la parte superior y 100 el valor en píxeles.
$textLabel3.Width = 120 #.Width es el ancho del control y 120 el valor en píxeles.
#Estas líneas lo que hacen es dar los parámetros específicos. 
############# Textbox 1 (Clase: como debe de ser un objeto)
$textBox1 = New-Object System.Windows.Forms.TextBox #$textBox1 es la variable donde se guardará el cuadro de texto.
                                                    #New-Object crea un nuevo objeto desde una clase.
                                                    #System.Windows.Forms.TextBox es la clase que representa el primer cuadro donde el usuario puede escribir.TextBox tipo de objeto que se crea.
                                                    #Esta línea crea un cuadro de texto editable, donde el usuario puede escribir un valor. Ese cuadro se guarda en la variable $textBox1 para poder manipularlo.
#Posición y tamaño del textBox1
$textBox1.Left = 150  #.Left es la distancia desde el borde izquierdo del formulario y 150 el valor en píxeles.
$textBox1.Top = 20    #.Top es la distancia desde la parte superior y 20 el valor en píxeles.
$textBox1.Width = 200 #.Width es el ancho del control y 120 el valor en píxeles.
#Estas líneas lo que hacen es dar los parámetros específicos. 
############# Textbox 2
$textBox2 = New-Object System.Windows.Forms.TextBox #$textBox2 es la variable donde se guardará el cuadro de texto.
                                                    #New-Object crea un nuevo objeto desde una clase.
                                                    #System.Windows.Forms.TextBox es la clase que representa el segundo cuadro donde el usuario puede escribir.TextBox tipo de objeto que se crea.
                                                    #Esta línea crea un cuadro de texto editable, donde el usuario puede escribir un valor. Ese cuadro se guarda en la variable $textBox1 para poder manipularlo.
#Posición y tamaño del tectBox2
$textBox2.Left = 150  #.Left es la distancia desde el borde izquierdo del formulario y 150 el valor en píxeles.
$textBox2.Top = 60    #.Top es la distancia desde la parte superior y 60 el valor en píxeles.
$textBox2.Width = 200 #.Width es el ancho del control y 200 el valor en píxeles.
#Estas líneas lo que hacen es dar los parámetros específicos. 
############# Textbox 3
$textBox3 = New-Object System.Windows.Forms.TextBox #$textBox3 es la variable donde se guardará el cuadro de texto.
                                                    #New-Object crea un nuevo objeto desde una clase.
                                                    #System.Windows.Forms.TextBox es la clase que representa el tercer cuadro donde el usuario puede escribir.TextBox tipo de objeto que se crea.
                                                    #Esta línea crea un cuadro de texto editable, donde el usuario puede escribir un valor. Ese cuadro se guarda en la variable $textBox1 para poder manipularlo.
#Posición y tamaño del textBox3
$textBox3.Left = 150  #.Left es la distancia desde el borde izquierdo del formulario y 150 el valor en píxeles.
$textBox3.Top = 100   #.Top es la distancia desde la parte superior y 100 el valor en píxeles.
$textBox3.Width = 200 #.Width es el ancho del control y 200 el valor en píxeles.
#Estas líneas lo que hacen es dar los parámetros específicos. 
############# Default values
$defaultValue = ""     #$defaultValue es la variable.
                       #"" indica que la cadena esta vacía.
                       # Esta línea de código define que el contenido inicial de todos los TextBox estará vacío.
$textBox1.Text = $defaultValue # $textBox1 es la variable 
                               #.Text es el contenido interno del TextBox
                               # Indica el valor vacío $defaultValue
$textBox2.Text = $defaultValue # $textBox2 es la variable 
                               #.Text es el contenido interno del TextBox
                               # Indica el valor vacío $defaultValue
$textBox3.Text = $defaultValue # $textBox3 es la variable 
                               #.Text es el contenido interno del TextBox
                               # Indica el valor vacío $defaultValue
#Estas tres líneas de código se aseguran que cada cuadro comience sin texto, listo para que el usuario escriba.
############# OK Button
$button = New-Object System.Windows.Forms.Button #$button es la variable donde se guardará el botón.
                                                 #New-Object crea un nuevo objeto.
                                                 # System.Windows.Forms.Button es la clase que representa un botón interactivo.
                                                 #Esta línea crea un botón real, ese que el usuario va a poder presionar.
$button.Left = 360  #.Left es la distancia desde el borde izquierdo del formulario y 360 el valor en píxeles.
$button.Top = 140   #.Top es la distancia desde la parte superior y 140 el valor en píxeles.
$button.Width = 100 #.Width es el ancho del control y 100 el valor en píxeles.
$button.Text = "OK" #.Text es el texto que va a tener el botón.

############# Button click event
$button.Add_Click({ #$button es el botón que ya se creo.
                    #.Add_Click es lo que permite agregar lo que pasará cuando se haga clic en el botón.
                    #({  }) es el bloque de código que se ejecuta al presionar el botón.
    $form.Tag = @{ # Tag es una propiedad del formulario, es el encargado de guardar información temporal dentro del formulario.
                   #@{ se lo puede definir como un diccionario, una estructura de datos con “clave = valor”.
        Box1 = $textBox1.Text #Box1 es el nombre de la clave que tú inventas y representa el primer valor.
                              #$textBox1.Text obtiene el texto que escribió el usuario en el primer cuadro.
                              #Esta línea de código se encarga de guardar el valor del primer TextBox dentro de la clave Box1.
        Box2 = $textBox2.Text #Box2 es el nombre de la clave que tú inventas y representa el segundo valor.
                              #$textBox2.Text obtiene el texto que escribió el usuario en el segundo cuadro.
                              #Esta línea de código se encarga de guardar el valor del segundo TextBox dentro de la clave Box3.
        Box3 = $textBox3.Text #Box3 es el nombre de la clave que tú inventas y representa el tercer valor.
                              #$textBox3.Text obtiene el texto que escribió el usuario en el tercer cuadro.
                              #Esta línea de código se encarga de guardar el valor del tercer TextBox dentro de la clave Box3.
    } #Se cierra el diccionario 
    $form.Close() #$form.Close() es el comando que cierra la ventana del formulario y termina la interfaz gráfica después de guardar los datos.
})

############# Add controls
#$form.Controls es colección que contiene todos los elementos visuales del formulario
#() es lo que se desea agregar 
#Addes el comando que agrega un elemento
$form.Controls.Add($button) #Agrega el botón OK a la ventana.
$form.Controls.Add($textLabel1) #Agrega la primera etiqueta (“Input 1”).
$form.Controls.Add($textLabel2) #Agrega la segunda etiqueta (“Input 2”).
$form.Controls.Add($textLabel3) #Agrega la tercera etiqueta (“Input 3”).
$form.Controls.Add($textBox1) #Agrega el cuadro donde el usuario escribe Input 1.
$form.Controls.Add($textBox2) #Agrega el cuadro donde el usuario escribe Input 2.
$form.Controls.Add($textBox3) #Agrega el cuadro donde el usuario escribe Input 3.

############# Show dialog
$form.ShowDialog() | Out-Null #La línea ShowDialog hace que la ventana se muestre y que el programa espere hasta que el usuario presione el botón OK.
                              #Out-Null solo sirve para mantener la consola limpia.

############# Return values
return $form.Tag.Box1, $form.Tag.Box2, $form.Tag.Box3
#return es la instrucción que envía valores de vuelta al script.
#$form.Tag es donde guardamos la información del usuario.
#.Box1 / .Box2 / .Box3 son las claves del diccionario creado.
#La coma ,  hace que se devuelvan varios valores juntos.
# Esta línea de texto hace que se devuelva al script los tres textos escritos por el usuario.