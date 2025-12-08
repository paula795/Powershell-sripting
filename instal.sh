###################################
# Prerequisites

# Update the list of packages
sudo apt-get update #sudo se encarga de ejecutar el comando con permisos de administrador y si no estuviera, el sistema no te dejaría modificar paquetes.
                    #apt-get se encarga de instalar, actualizar y eliminar paquetes, se le puede definir como administrador de paquetes.
                    #update Es una subcomando de apt-get y le dice que actualice la lista de paquetes disponibles desde los repositorios.

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common

# Get the version of Ubuntu
source /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh