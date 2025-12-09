function Start-ProgressBar { # Esta línea lo que crea es una función llamada Start-ProgressBar (Se incia la función)
                             # La palabra function es la Palabra clave que define una función en PowerShell.
                             # Start-ProgressBar es el Nombre de la función que escogimos.
    [CmdletBinding()] #      # [CmdletBinding()] convierte la función en una función avanzada, otorgándole capacidades similares a los cmdlets.
    param (   # param es el que indica que viene una lista de parámetros de entrada.
              # Se encarga de abrir la definición de parámetros que la función recibirá (Abre la lista).
        [Parameter(Mandatory = $true)] #El comando [Parameter()] se utiliza para definir que debe hacer un parámetro.
                                       #La opción Mandatory = $true indica que el parámetro es obligatorio y que el usuario debe proporcionarlo.
        $Title,                        #$Title representa el “título” del progress bar, es decir, el texto que aparece en la parte superior de la barra de progreso mientras la función está en ejecución.
        
        [Parameter(Mandatory = $true)] #Este comando hace que el parametro sea obligatorio.
        [int]$Timer # int indica el tipo de datos que se necesita en este caso entero 
                    # $Timer es el nombre del parámetro; $ indica variable. Representa el tiempo en segundos.
                    #Esta línea representa la cantidad total de segundos que durará la barra de progreso, es decir, el tiempo que tomará completar todo el proceso mientras el código se ejecuta.
    ) #(Cierrra la lista)
    
    for ($i = 1; $i -le $Timer; $i++) {  #El ciclo for (bucle) se utiliza para repetir un conjunto de instrucciones un número específico de veces. (Apertura del for)
                                         #La variable $i se inicializa en 1 y la condición $i -le $Timer indica que el ciclo seguirá ejecutándose mientras $i sea menor o igual al valor de Timer. 
                                         #El comando $i++ muestra que la variable aumentará en una unidad después de cada vuelta. 
                                         #En conjunto, esta línea de código recorre desde 1 hasta el número total de segundos definido en Timer, permitiendo que el programa ejecute acciones una vez por cada segundo.
        Start-Sleep -Seconds 1 #El cmdlet Start-Sleep se utiliza para pausar la ejecución del código durante un tiempo determinado.
                               #El parámetro -Seconds 1 indica que la pausa será de un segundo. 
                               # Esta línea hace que cada iteración del ciclo dura exactamente un segundo, permitiendo que el progreso avance de manera sincronizada con el tiempo real.
        $percentComplete = ($i / $Timer) * 100 #La variable $percentComplete se utiliza para guardar el porcentaje de avance del proceso.
                                               #$i representa los segundos transcurridos dentro del bucle (Contador) 
                                               #$Timer corresponde al total de segundos que dura el progreso. 
                                               #La operación ($i / $Timer) se realiza una división para obtener la fracción del tiempo completado, se lo multiplica por 100 para convertir esa fracción en un porcentaje.
                                               #El programa meustra el avance real de la barra de progreso en cada iteración.
        Write-Progress -Activity $Title -Status "$i seconds elapsed" -PercentComplete $percentComplete #Write-Progress se encarga de indicar una barra de progreso en la consola.
                                                                                                       #-Activity $Title se encarga de mostrar el título de la actividad.
                                                                                                       #-Status "..." se encarga de mostrar el mensaje debajo de la barra (cuántos segundos han pasado).
                                                                                                       #-PercentComplete $percentComplete indica cuánto porcentaje se ha completado.

👉 Actualiza la barra de progreso cada segundo.
    } #(Cierre del for)
}     #(Ciere de primera función)

# Call the function #Llamada a la función 
Start-ProgressBar -Title "Test timeout" -Timer 30
#Start-ProgressBar es la llamada a la función, es el comando que ejecuta la función Start-ProgressBar.
#-Title "Test timeout" Define el título que se mostrará en la barra de progreso mientras se ejecuta.
#-Timer 30 Indica el tiempo total de duración del progreso, en este caso 30 segundos.
#Esto inicia la barra de progreso con un título personalizado y la muestra al usuario durante los 30 segundos definidos.