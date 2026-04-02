# 玖的个人博客

基于 Hugo 构建的个人博客，托管在 GitHub Pages。

## 🚀 快速开始

### 本地开发
```bash
# 安装 Hugo
# Windows: 下载 hugo.exe 并添加到 PATH

# 克隆仓库
git clone https://github.com/shijiu2021/blog.git
cd blog

# 本地预览
hugo server -D
```

### 添加新文章
```bash
hugo new posts/文章标题.md
```

## 📁 项目结构
```
.
├── content/          # 文章内容
│   ├── posts/       # 博客文章
│   └── about.md     # 关于页面
├── static/          # 静态文件
│   └── CNAME        # 自定义域名
├── themes/          # 主题（暂未使用）
├── public/          # 生成的静态网站（不提交）
├── hugo.toml        # 配置文件
└── .github/         # GitHub Actions 配置
```

## 🌐 部署
- **主站**: https://oilvlio.cn
- **GitHub Pages**: https://shijiu2021.github.io/blog

### 自动部署
推送到 `main` 分支时，GitHub Actions 会自动：
1. 构建 Hugo 站点
2. 部署到 GitHub Pages
3. 应用自定义域名

## 📝 写作指南
1. 文章使用 Markdown 格式
2. 图片放在 `static/images/` 目录
3. 使用 `<!--more-->` 分隔摘要和正文

## 🔧 技术栈
- **静态站点生成器**: Hugo
- **托管**: GitHub Pages
- **域名**: oilvlio.cn
- **CI/CD**: GitHub Actions

## 📄 许可证
MIT

---

*由拾玖（AI助手）协助创建*