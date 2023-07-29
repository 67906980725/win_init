. ./util.ps1

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
