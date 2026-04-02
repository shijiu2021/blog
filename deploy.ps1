# 博客部署脚本
# 作者：拾玖
# 使用方法：在 PowerShell 中运行 .\deploy.ps1

Write-Host "🎉 玖的个人博客部署脚本" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan

# 检查当前目录
$currentDir = Get-Location
Write-Host "当前目录: $currentDir" -ForegroundColor Yellow

# 检查 Hugo 是否可用
$hugoPath = "C:\Users\53430\hugo-install\hugo.exe"
if (Test-Path $hugoPath) {
    Write-Host "✅ Hugo 已安装: $hugoPath" -ForegroundColor Green
} else {
    Write-Host "❌ Hugo 未找到，请先安装 Hugo" -ForegroundColor Red
    exit 1
}

# 菜单
Write-Host "`n请选择操作:" -ForegroundColor Cyan
Write-Host "1. 本地预览博客" -ForegroundColor Yellow
Write-Host "2. 生成静态站点" -ForegroundColor Yellow
Write-Host "3. 添加新文章" -ForegroundColor Yellow
Write-Host "4. 推送到 GitHub" -ForegroundColor Yellow
Write-Host "5. 查看部署指南" -ForegroundColor Yellow
Write-Host "6. 退出" -ForegroundColor Gray

$choice = Read-Host "`n请输入选项 (1-6)"

switch ($choice) {
    "1" {
        Write-Host "`n🚀 启动本地服务器..." -ForegroundColor Cyan
        Write-Host "访问地址: http://localhost:1313" -ForegroundColor Green
        Write-Host "按 Ctrl+C 停止服务器`n" -ForegroundColor Yellow
        & $hugoPath server -D
    }
    "2" {
        Write-Host "`n🔨 生成静态站点..." -ForegroundColor Cyan
        & $hugoPath
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ 站点生成成功！" -ForegroundColor Green
            Write-Host "生成目录: $currentDir\public" -ForegroundColor Yellow
            Write-Host "文件数: $(Get-ChildItem -Path "$currentDir\public" -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count)" -ForegroundColor Yellow
        } else {
            Write-Host "❌ 生成失败，请检查错误信息" -ForegroundColor Red
        }
    }
    "3" {
        $title = Read-Host "`n请输入文章标题"
        if ($title) {
            $filename = $title -replace '[^\w\u4e00-\u9fa5]', '-'
            & $hugoPath new "posts/$filename.md"
            Write-Host "✅ 文章创建成功: content\posts\$filename.md" -ForegroundColor Green
            Write-Host "请编辑该文件，然后运行选项2生成站点" -ForegroundColor Yellow
        }
    }
    "4" {
        Write-Host "`n📤 推送到 GitHub..." -ForegroundColor Cyan
        
        # 检查 Git 远程仓库
        $remote = git remote -v 2>$null
        if (-not $remote) {
            Write-Host "⚠️  未设置 Git 远程仓库" -ForegroundColor Yellow
            Write-Host "请先执行以下命令：" -ForegroundColor Yellow
            Write-Host "  git remote add origin https://github.com/shijiu2021/blog.git" -ForegroundColor Green
            Write-Host "  git branch -M main" -ForegroundColor Green
            Write-Host "然后重新运行此选项" -ForegroundColor Yellow
            break
        }
        
        # 生成站点
        Write-Host "生成静态站点..." -ForegroundColor Yellow
        & $hugoPath
        
        # 提交
        Write-Host "提交更改..." -ForegroundColor Yellow
        git add .
        $commitMsg = Read-Host "请输入提交信息"
        if (-not $commitMsg) { $commitMsg = "更新博客内容" }
        git commit -m $commitMsg
        
        # 推送
        Write-Host "推送到 GitHub..." -ForegroundColor Yellow
        git push origin main
        
        Write-Host "`n✅ 推送完成！" -ForegroundColor Green
        Write-Host "GitHub Actions 将自动构建并部署" -ForegroundColor Yellow
        Write-Host "查看部署状态: https://github.com/shijiu2021/blog/actions" -ForegroundColor Cyan
    }
    "5" {
        Write-Host "`n📖 部署指南" -ForegroundColor Cyan
        Write-Host "================" -ForegroundColor Cyan
        Get-Content "$currentDir\DEPLOYMENT_GUIDE.md" -TotalCount 20
        Write-Host "`n完整指南: $currentDir\DEPLOYMENT_GUIDE.md" -ForegroundColor Yellow
        Write-Host "或查看生成的预览: $currentDir\preview.html" -ForegroundColor Yellow
    }
    "6" {
        Write-Host "`n👋 再见！" -ForegroundColor Cyan
        exit 0
    }
    default {
        Write-Host "❌ 无效选项" -ForegroundColor Red
    }
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host "博客地址: https://oilvlio.cn" -ForegroundColor Green
Write-Host "GitHub 仓库: https://github.com/shijiu2021/blog" -ForegroundColor Green
Write-Host "✨ 由拾玖提供技术支持" -ForegroundColor Magenta