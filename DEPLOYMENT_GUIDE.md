# 🚀 博客部署指南

恭喜！你的 Hugo 博客已经配置完成，只需要几个简单步骤就可以上线。

## 📋 前提条件
- GitHub 账户：`shijiu2021`
- 域名：`oilvlio.cn`
- 域名管理权限（用于配置 DNS）

## 🔧 部署步骤

### 1. 创建 GitHub 仓库
1. 访问 https://github.com/new
2. 输入仓库名：`blog`（或其他你喜欢的名字）
3. 描述：`玖的个人博客 - Hugo 静态站点`
4. **不要**初始化 README、.gitignore 或 license
5. 点击 "Create repository"

### 2. 推送代码到 GitHub
```bash
# 在 blog 目录执行以下命令
git remote add origin https://github.com/shijiu2021/blog.git
git branch -M main
git push -u origin main
```

或者使用 GitHub Desktop 等 GUI 工具推送。

### 3. 启用 GitHub Pages
1. 进入仓库页面：`https://github.com/shijiu2021/blog`
2. 点击 **Settings** → **Pages**
3. 在 **Build and deployment** 部分：
   - Source: **GitHub Actions**
4. 保存设置

### 4. 配置自定义域名
1. 在仓库 Settings → Pages 页面：
   - 在 **Custom domain** 输入：`oilvlio.cn`
   - 勾选 **Enforce HTTPS**
   - 点击 **Save**

2. **等待 GitHub Actions 完成第一次部署**
   - 进入仓库的 **Actions** 标签页
   - 等待 "Deploy Hugo site to Pages" 工作流完成
   - 完成后会生成 `gh-pages` 分支

### 5. 配置 DNS 记录
在你的域名注册商（如阿里云、腾讯云、Namecheap 等）添加以下 DNS 记录：

| 类型 | 主机记录 | 记录值 | TTL |
|------|----------|--------|-----|
| CNAME | @ | shijiu2021.github.io | 自动 |
| CNAME | www | shijiu2021.github.io | 自动 |

**注意**：如果域名注册商不支持根域名的 CNAME 记录（很多不支持），请使用 A 记录：
| 类型 | 主机记录 | 记录值 | TTL |
|------|----------|--------|-----|
| A | @ | 185.199.108.153 | 自动 |
| A | @ | 185.199.109.153 | 自动 |
| A | @ | 185.199.110.153 | 自动 |
| A | @ | 185.199.111.153 | 自动 |
| CNAME | www | shijiu2021.github.io | 自动 |

### 6. 验证部署
1. 等待 DNS 生效（通常 5-30 分钟，最长 48 小时）
2. 访问 https://oilvlio.cn
3. 访问 https://www.oilvlio.cn
4. 访问 https://shijiu2021.github.io/blog（备用地址）

## ⚡ 自动部署说明
- 当你推送代码到 `main` 分支时，GitHub Actions 会自动：
  - 安装 Hugo
  - 构建静态网站
  - 部署到 GitHub Pages
- 查看部署状态：仓库 → Actions

## 📝 更新博客

### 添加新文章
```bash
# 在 blog 目录
hugo new posts/文章标题.md
# 编辑 content/posts/文章标题.md
# 提交并推送
git add .
git commit -m "添加新文章：文章标题"
git push
```

### 修改配置
- 编辑 `hugo.toml` 修改博客设置
- 编辑 `content/about.md` 修改关于页面
- 提交并推送即可自动更新

## 🛠️ 故障排除

### 1. GitHub Pages 不更新
- 检查 Actions 是否成功
- 检查 `gh-pages` 分支是否存在
- 清除浏览器缓存或使用隐身模式访问

### 2. 自定义域名不工作
- 检查 DNS 记录是否正确
- 等待 DNS 传播（最多 48 小时）
- 检查 GitHub Pages 设置中的自定义域名

### 3. 样式或内容有问题
- 本地运行 `hugo server` 预览
- 检查 Markdown 语法
- 查看 Hugo 构建日志（Actions 中）

## 🔗 相关链接
- **博客地址**: https://oilvlio.cn
- **GitHub 仓库**: https://github.com/shijiu2021/blog
- **GitHub Pages**: https://shijiu2021.github.io/blog
- **Hugo 文档**: https://gohugo.io/documentation/

## 📞 获取帮助
如果遇到问题：
1. 检查本指南
2. 查看 GitHub Actions 日志
3. 联系拾玖（你的 AI 助手）

---

🎉 **部署完成！现在你可以通过 https://oilvlio.cn 访问你的个人博客了！**