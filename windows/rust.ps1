. ./util.ps1

# 安装 C++生成工具 https://blog.csdn.net/weixin_39842528/article/details/123448326
# https://visualstudio.microsoft.com/zh-hans/visual-cpp-build-tools/
# 只选择 "使用C++的桌面开发", 右侧安装详细信息下可选内容全选

install JetBrains.IntelliJIDEA.Community
install Rustlang.Rustup
install Rustlang.Rust.MSVC
# rustup toolchain install stable-x86_64-pc-windows-gnu
install Rustlang.Rust.GNU
rustup default stable-msvc
# rustup default stable-x86_64-pc-windows-gnu

cp_conf .cargo

cmd.exe /c "setx RUSTUP_DIST_SERVER https://rsproxy.cn"
cmd.exe /c "setx RUSTUP_UPDATE_ROOT https://rsproxy.cn/rustup"
