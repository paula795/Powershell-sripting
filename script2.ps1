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
                                                     #New-Object → crea una nueva instancia.
                                                     #System.Windows.Forms.Label es la herramienta que usa el programa para mostrar un texto fijo en la ventana.
                                                     #Esta línea de código crea una etiqueta visual que será usada para mostrar el texto “Input 1” al usuario.
$textLabel1.Text = "Input 1:"
$textLabel1.Left = 20
$textLabel1.Top = 20
$textLabel1.Width = 120

$textLabel2 = New-Object System.Windows.Forms.Label
$textLabel2.Text = "Input 2:"
$textLabel2.Left = 20
$textLabel2.Top = 60
$textLabel2.Width = 120

$textLabel3 = New-Object System.Windows.Forms.Label
$textLabel3.Text = "Input 3:"
$textLabel3.Left = 20
$textLabel3.Top = 100
$textLabel3.Width = 120

############# Textbox 1
$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Left = 150
$textBox1.Top = 20
$textBox1.Width = 200

############# Textbox 2
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Left = 150
$textBox2.Top = 60
$textBox2.Width = 200

############# Textbox 3
$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Left = 150
$textBox3.Top = 100
$textBox3.Width = 200

############# Default values
$defaultValue = ""
$textBox1.Text = $defaultValue
$textBox2.Text = $defaultValue
$textBox3.Text = $defaultValue

############# OK Button
$button = New-Object System.Windows.Forms.Button
$button.Left = 360
$button.Top = 140
$button.Width = 100
$button.Text = "OK"

############# Button click event
$button.Add_Click({
    $form.Tag = @{
        Box1 = $textBox1.Text
        Box2 = $textBox2.Text
        Box3 = $textBox3.Text
    }
    $form.Close()
})

############# Add controls
$form.Controls.Add($button)
$form.Controls.Add($textLabel1)
$form.Controls.Add($textLabel2)
$form.Controls.Add($textLabel3)
$form.Controls.Add($textBox1)
$form.Controls.Add($textBox2)
$form.Controls.Add($textBox3)

############# Show dialog
$form.ShowDialog() | Out-Null

############# Return values
return $form.Tag.Box1, $form.Tag.Box2, $form.Tag.Box3