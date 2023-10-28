# install Yarn.Yarn
install pnpm.pnpm

$f_name = "node-v18.14.2-x64.msi"
Invoke-WebRequest https://webcdn.m.qq.com/spcmgr/download/$f_name -OutFile $home/Downloads/$f_name
Start-Process -FilePath "$home/Downloads/$f_name"


# refresh env or reboot system

npm config set registry https://registry.npm.taobao.org
# npm config set registry http://registry.npmmirror.com

# dev proj
yarn
yarn build(script_name)


# unable to verify the first certificate
yarn config set strict-ssl false
npm config set strict-ssl false
# getaddrinfo ENOENT: localhost没有与127.0.0.1绑定
C:\Windows\System32\drivers\etc\hosts:  127.0.0.1  localhost
# electron报read ECONNRESET
npm install --save-dev electron

# dependencies-github read ECONNRESET(clash):
# npm config set proxy=http://127.0.0.1:7890 

