###################################
# Prerequisites

# Update the list of packages
sudo apt-get update #sudo se encarga de ejecutar el comando con permisos de administrador y si no estuviera, el sistema no te dejaría modificar paquetes.
                    #apt-get se encarga de instalar, actualizar y eliminar paquetes, se le puede definir como administrador de paquetes.
                    #update Es una subcomando de apt-get y le dice que actualice la lista de paquetes disponibles desde los repositorios.

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common #Este comando instala los paquetes indicados usando permisos de administrador (sudo). La opción -y acepta automáticamente cualquier pregunta, y los tres nombres al final (wget, apt-transport-https y software-properties-common) son los paquetes que se van a instalar.

# Get the version of Ubuntu
source /etc/os-release #source: comando que carga variables de un archivo en la sesión actual. El /etc/os-release: archivo que contiene información del sistema como VERSION_ID, ID, NAME, etc.
                    # Se puede decir que carga los datos del sistema para poder usarlos en el script.

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb  
#Este comando descarga un archivo .deb desde Microsoft. El wget se utiliza para descargar archivos, y la opción -q hace que la descarga se realice en silencio, sin mostrar el progreso. La dirección utiliza $VERSION_ID, que corresponde a la versión de Ubuntu que se está usando.

# Register the Microsoft repository keys #El archivo descargado se va a registrar.
sudo dpkg -i packages-microsoft-prod.deb #Este comando instala el archivo .deb que se descargó anteriormente. 
                                         #El sudo es el encargado de dar permisos de administrador.
                                         #El dpkg es el gestor de los paquetes
                                         #El -i es el encargado de la instalacion del archivo manualmente del paquete .deb.
                                         #Esto agrega el repositorio de Microsoft al sistema.

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh