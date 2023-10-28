os_name="$(cat /etc/*-release | grep ^ID= | cut -d '=' -f 2)"
cd "./$os_name"

chmod +x ./*.sh
chmod +x ../linux/*.sh
./init_linux.sh

cd ../
