function New-FolderCreation { #function se declara una función.
                              #New-FolderCreation es el nombre de la función que se definio.
                              #{ → abre el bloque de código de la función.
                              #Aquí empiezas a definir la función llamada New-FolderCreation.
    [CmdletBinding()]   # [CmdletBinding()] convierte la función en una función avanzada, otorgándole capacidades similares a los cmdlets.
    param( #Abre la sección donde se declaran los parámetros 
        [Parameter(Mandatory = $true)] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                       #La opción Mandatory = $true indica que el parámetro es obligatorio y que el usuario debe proporcionarlo.
        [string]$foldername #Indica que $foldername se va a definir como un string.
    ) #Cierra la declración

    # Create absolute path for the folder relative to current location
    $logpath = Join-Path -Path (Get-Location).Path -ChildPath $foldername #Toma la carpeta donde estás actualmente, le añade el nombre que está en $foldername, y el resultado lo guarda en $logpath como la ruta completa de esa nueva carpeta.
    if (-not (Test-Path -Path $logpath)) { #Se encarga de verificar si la carpeta existe y en el que caso que no ejecuta la siguente línea de código.
        New-Item -Path $logpath -ItemType Directory -Force | Out-Null # Se encarga de crear la carpeta en el caso de que esta no existiera y suprime la salida para que no muestre texto en la consola.
    } #Cierra la condición

    return $logpath #La función retorna con el comando return la ruta completa que quedó guardada en $logpath, para que el código que llamó a la función pueda utilizar esa ruta después.
} #Da fin a la función 

function Write-Log { #function se define otra función, el Write-Log es el nombre de la función y el { abre su bloque.

    [CmdletBinding()] # [CmdletBinding()] convierte la función en una función avanzada, otorgándole capacidades similares a los cmdlets.
    param( #Abre la sección donde se declaran los parámetros 
        # Create parameter set
        [Parameter(Mandatory = $true, ParameterSetName = 'Create')] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Create.
        [Alias('Names')] #Crea un nombre alternativo para el mismo parametro
        [object]$Name,   #Declara que $Name va hacer considerado un bojeto           # can be single string or array

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Create.
        [string]$Ext,     #Obliga al usuario a declarar la extensión del archivo.

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Create.
        [string]$folder, #Se declara el nombre de la carpeta donde se guardan los logs.

        [Parameter(ParameterSetName = 'Create', Position = 0)] #Este parámetro pertenece a set Create y su posición posicional es 0
        [switch]$Create,  #Activa el modo de creación de archivo 

        # Message parameter set
        [Parameter(Mandatory = $true, ParameterSetName = 'Message')]#El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Message.
        [string]$message, #Indica el texto que se agregará al archivo en modo Message.

        [Parameter(Mandatory = $true, ParameterSetName = 'Message')] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Message.
        [string]$path, #Indica la direccion del archivo donde se agregará el mensaje.

        [Parameter(Mandatory = $false, ParameterSetName = 'Message')]#El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Message.
        [ValidateSet('Information','Warning','Error')]  #[ValidateSet(...)] indica qué valores se pueden usar para el parámetro.'Information','Warning','Error' son los unicos valores que se aceptan.
        [string]$Severity = 'Information', #Lo primero que hace es definir $Severity como un string y en el caso de que no se ingrese nada se mostrara el mensaje de Information.

        [Parameter(ParameterSetName = 'Message', Position = 0)] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro dentro de una función.
                                                                    #La opción Mandatory = $true indica que el parámetro es obligatorio que el usuario debe proporcionarlo y este epecifica que es obligatorio solo en Message.
        [switch]$MSG #Activa el modo mensaje
    ) #Cierra los parametros

    switch ($PsCmdlet.ParameterSetName) { #Decide que parametro se va a ejecutar segun lo que el usuario decida
        "Create" { #Se define el parametro
            $created = @() #inicia un array vacío para guardar rutas creadas.
#Empieza el proceso de crear archivos y prepara una lista para las rutas resultantes.
            # Normalize $Name to an array
            $namesArray = @() #Inicia $namesArray como array vacío.
            if ($null -ne $Name) { #Esta línea verifica si el usuario realmente pasó un valor para $Nam
                if ($Name -is [System.Array]) { $namesArray = $Name } #Aquí se comprueba si $Name ya es un array, es decir, si el usuario pasó varios nombres al mismo tiempo.
                else { $namesArray = @($Name) } #Toma lo que haya en $Name y lo convierte en una lista, aunque sea un solo valor.
            } #Cierre

            # Date + time formatting (safe for filenames)
            $date1 = (Get-Date -Format "yyyy-MM-dd") #Esta línea guarda la fecha en formato seguro para nombres de archivos.
            $time  = (Get-Date -Format "HH-mm-ss") #Guarda la hora exacta de creación del archivo.

            # Ensure folder exists and get absolute folder path
            $folderPath = New-FolderCreation -foldername $folder

            foreach ($n in $namesArray) { #Repite la creación de archivo para cada nombre que el usuario haya pasado, uno por uno.
                # sanitize name to string
                $baseName = [string]$n #Asegura que el nombre del archivo sea texto.

                # Build filename
                $fileName = "${baseName}_${date1}_${time}.$Ext" #Aquí se genera un nombre único para cada archivo de log, usando el nombre del usuario, la fecha y la hora.

                # Full path for file
                $fullPath = Join-Path -Path $folderPath -ChildPath $fileName #Crea la ruta completa donde se guardará el archivo, lista para crear el archivo físico en disco.

                # Create the file (New-Item -Force will create or overwrite; use -ErrorAction Stop to catch errors)
                try { #Indica el manejo de errores
                    # If you prefer to NOT overwrite existing file, use: if (-not (Test-Path $fullPath)) { New-Item ... }
                    New-Item -Path $fullPath -ItemType File -Force -ErrorAction Stop | Out-Null #Esta línea crea físicamente el archivo en la computadora, y si algo falla, muestra un error.

                    # Optionally write a header line (uncomment if desired)
                    # "Log created: $(Get-Date)" | Out-File -FilePath $fullPath -Encoding UTF8 -Append

                    $created += $fullPath #Guarda en un registro todas las rutas de los archivos que se crearón.
                }
                catch { #Muestra de Errores, entra en donde se encuentre el error sin sfectar  a lo demas.
                    Write-Warning "Failed to create file '$fullPath' - $_" #Indica que archivos no se puedieron crear y el motivo.
                } #Cierre del cath
            }

            return $created
        } #Finaliza el foreach

        "Message" { #Nombre del conjunto de parámetros
            # Ensure directory for message file exists
            $parent = Split-Path -Path $path -Parent #Esta línea determina en qué carpeta se guardará el mensaje.
            if ($parent -and -not (Test-Path -Path $parent)) { #Si la carpeta donde se quiere guardar el archivo no existe, esta línea la crea automáticamente.
            } #Cierra la condición

            $date = Get-Date #Se guarda la fecha y hora actual
            $concatmessage = "|$date| |$message| |$Severity|" #Construye el mensaje final con todo el texto que se pide.

            switch ($Severity) { #Evalúa el valor de $Severity, lo relaciona según el color
                "Information" { Write-Host $concatmessage -ForegroundColor Green } #Mensaje en verde
                "Warning"     { Write-Host $concatmessage -ForegroundColor Yellow } #Mensaje en Amarillo
                "Error"       { Write-Host $concatmessage -ForegroundColor Red } #Mensaje en rojo
            }

            # Append message to the specified path (creates file if it does not exist)
            Add-Content -Path $path -Value $concatmessage -Force #Se guarda el mensaje en el archivo de log.

            return $path #devuelve la ruta del archivo para que el script pueda usarlo.
        }

        default { #Se ejecuta en el caso que no existan ninguna coincidencia.
            throw "Unknown parameter set: $($PsCmdlet.ParameterSetName)" #Lanza un error y indica cual fue el conjunto de parámetros que no se reconoció.
        }
    } #Cierre
} #Finaliza la ultima función

# ---------- Example usage ----------
# This will create the folder "logs" (if missing) and create a file Name-Log_YYYY-MM-DD_HH-mm-ss.log
$logPaths = Write-Log -Name "Name-Log" -folder "logs" -Ext "log" -Create #Invoca la función Write-Log en modo “Create”, de manera que genere la carpeta "logs"
$logPaths #Guarda la ruta del archivo creado y la muestra.