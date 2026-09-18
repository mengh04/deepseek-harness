# 分发步骤（维护者）

1. 在 GitHub 上 Fork `deepseek-ai/deepseek-harness` 到本账号（只需一次）。
2. 推送分支：

   ```sh
   git remote add fork git@github.com:mengh04/deepseek-harness.git   # 已加过可跳过
   git push fork desktop-linux-x64-dev
   ```

3. 本地出包：

   ```sh
   ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/ \
     pnpm run package:desktop:linux:x64:dir
   cd apps/desktop/installer/arch && ./build.sh
   ```

4. 在 fork 仓库页面创建 Release：tag 填 `desktop-<pkgver>`（如 `desktop-0.1.6.alpha.2`），
   上传 `deepseek-harness-desktop-<pkgver>.tar.zst`（makepkg 源），
   可选再传 `deepseek-harness-desktop-<pkgver>-1-x86_64.pkg.tar.zst`（给只想 pacman -U 的朋友）。
5. 把新版 tarball 的 `sha256sum` 更新进 PKGBUILD，提交推送。

# 朋友安装

- 有 PKGBUILD：放进空目录，`makepkg -si`
- 更省事：直接下载 Release 里的 `.pkg.tar.zst`，`sudo pacman -U <文件>`
