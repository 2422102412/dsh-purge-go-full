# 定制数据（data/）

本仓库除插件本体外，附带一份**现场数据**，对应一台已调好的机器：

| 文件 | 大小 | 落点 |
|---|---|---|
| `data/prompt-inject.md` | 31967 B | `$DSH_HOME/prompt-inject.md`（注入正文，Scoped Rules 1–39 已烘焙） |
| `data/categories.json` | 2648 B | `$DSH_HOME/dsh-purge/categories.json`（分类覆盖层，30–39 十条） |
| `data/capabilities.md` | 901 B | `$DSH_HOME/dsh-purge/capabilities.md`（能力协议段） |
| `data/raw.md` | 26795 B | `$DSH_HOME/dsh-purge/prompts/raw.md`（未烘焙原稿） |

## 装法

```bash
# 1) 插件本体（本仓库根就是 npm 包）
dsh plugin --profile web add github:<OWNER>/dsh-purge-go

# 2) 定制数据（包内自带，离线还原，覆盖前自动备份）
bash "$(dirname "$(readlink -f "$HOME/.dsh/profiles/web/node_modules/dsh-purge-go")")/data/restore.sh"
```

装完重启 App，`/purge status` 的 `lastBytes` 应为 `31967`，`/purge cat list` 应列出 26–39 共 14 条。

## 说明

- 30–39 十条已经 **bake** 进 `prompt-inject.md`，不依赖覆盖层重算；覆盖层同时保留，方便 `/purge cat off` / `rm` 单条调整，改完要再 `/purge cat bake` 才同步进正文。
- `data/` 已加入 `package.json` 的 `files`，`github:` 安装时会随 tarball 一起打进 profile 的 `node_modules`。
