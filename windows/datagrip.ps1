. ./util.ps1

# https://3.jetbra.in/

cp_conf "Documents\jetbrains-2020.1.3-agent.jar"
Invoke-WebRequest https://download.jetbrains.com/datagrip/datagrip-2020.1.3.exe -OutFile $home\Downloads\datagrip-2020.1.3.exe
Start-Process -FilePath "$home\Downloads\datagrip-2020.1.3.exe"
explorer $home/Documents # 打开datagrip后试用, 然后把jetbrains-2020.1.3-agent.jar拖到软件界面中就可以激活了
explorer https://www.jetbrains.com/datagrip/jdbc-drivers/