# ZXJTU Beamer 模板

一个面向中文学术汇报与课程展示的 Beamer 模板，基于自定义类 `ZXJTU.cls` 封装，适合用于课程汇报、组会展示、论文答辩草稿以及数学建模类演示文稿。

模板当前提供了两份示例：

- `Beamer.tex`：通用功能演示，涵盖目录、列表、数学公式、图片区块、自定义色块等常见写法。
- `problem_modeling.tex`：更贴近实际汇报场景的完整示例，展示了 TikZ 图示、表格、建模表达与多页结构组织方式。

## 特性

- 基于 Beamer `Madrid` 主题进行中文汇报风格定制
- 默认适配中文排版，适合中文教学或科研场景
- 预置常用数学、图表、表格相关宏包
- 提供可直接复用的彩色区块环境
- 支持临时 RGB 区块和命名式自定义 block 环境
- 兼容 `XeLaTeX` 与 `pdfLaTeX`，其中中文场景更推荐 `XeLaTeX`

## 文件结构

```text
ZXJTU_Beamer/
├── ZXJTU.cls            # 模板类文件
├── Beamer.tex           # 通用演示示例
├── problem_modeling.tex # 实际汇报示例
├── Fig/                 # 示例图片资源目录
├── Beamer.pdf           # 示例输出 PDF
└── problem_modeling.pdf # 示例输出 PDF
```

## 快速开始

最小示例：

```tex
\documentclass[10pt,aspectratio=169]{ZXJTU}

\title{标题}
\subtitle{副标题}
\author{作者}
\institute{单位}
\date{\today}

\begin{document}

\begin{frame}
  \titlepage
\end{frame}

\begin{frame}{内容示例}
  这是一个简单的 Beamer 页面。
\end{frame}

\end{document}
```

## 编译方式

### 推荐方式

建议优先使用 `XeLaTeX` 编译，尤其是在中文内容较多、需要更稳定字体效果时。

```bash
xelatex Beamer.tex
xelatex problem_modeling.tex
```

如果使用 `latexmk`：

```bash
latexmk -xelatex Beamer.tex
latexmk -xelatex problem_modeling.tex
```

### 兼容说明

`ZXJTU.cls` 内部对引擎做了区分：

- `XeLaTeX`：通过 `fontspec` 和 `xeCJK` 处理中文字体。
- `pdfLaTeX`：通过 `ctex` 提供中文支持。

## 字体说明

模板在 `XeLaTeX` 模式下默认使用以下 Windows 字体：

- 宋体 `SimSun`
- 黑体 `SimHei`
- 楷体 `KaiTi`
- 微软雅黑 `Microsoft YaHei`

如果你在 macOS 或 Linux 下使用本模板，建议根据本机字体环境修改 `ZXJTU.cls` 中的以下设置：

```tex
\setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi]{SimSun}
\setCJKsansfont{Microsoft YaHei}
\setCJKmonofont{SimSun}
```

## 常用参数

文档类可直接传入 Beamer 常见参数，例如：

```tex
\documentclass[10pt,aspectratio=43]{ZXJTU}
```

可用选项示例：

- 字号：`8pt`、`9pt`、`10pt`、`11pt`、`12pt`
- 纵横比：`aspectratio=43`、`aspectratio=169`
- 其他 Beamer 原生选项也可直接透传给模板类

## 自定义彩色区块

这是模板的一个实用扩展，适合在汇报中突出定义、结论、提示或关键假设。

### 1. 临时使用 RGBblock

```tex
\begin{RGBblock}{标题}{64,132,170}{235,245,249}
  这里填写区块内容。
\end{RGBblock}
```

参数含义：

1. 区块标题
2. 标题背景 RGB
3. 正文背景 RGB
4. 可选：标题文字 RGB，默认为 `255,255,255`
5. 可选：正文文字 RGB，默认为 `0,0,0`

### 2. 声明可复用的自定义 block

在导言区声明：

```tex
\DeclareCustomBlockRGB{theoryblock}{74,126,187}{235,242,250}{255,255,255}{0,0,0}
```

正文中使用：

```tex
\begin{theoryblock}{理论说明}
  这里填写区块内容。
\end{theoryblock}
```

这种方式适合在整套汇报中统一视觉风格。

## 已加载的常用宏包

模板类内已经预置了一些常见宏包，包括但不限于：

- 数学：`mathtools`、`amsmath`、`amsfonts`、`amsthm`
- 图形：`graphicx`、`tikz`
- 表格：`booktabs`、`multirow`、`array`
- 参考文献：`natbib`
- 其他：`caption`、`subfigure`、`comment`

如果你的文稿需要额外功能，可以在主 `.tex` 文件中继续自行添加宏包。

## 使用建议

- 如果只是快速写汇报，建议直接从 `Beamer.tex` 复制并改标题、作者、章节内容。
- 如果需要做建模汇报、项目答辩或流程图展示，建议以 `problem_modeling.tex` 为起点。
- 如果你希望统一组会模板，可在 `ZXJTU.cls` 中集中修改颜色、字体、页边距和 block 风格。

## 已知事项

- `XeLaTeX` 模式下默认字体偏向 Windows 环境，跨平台使用时通常需要自行调整字体配置。
- 仓库中包含若干 `.aux`、`.nav`、`.snm`、`.toc`、`.fls` 等编译中间文件；发布到 GitHub 时可根据需要补充 `.gitignore` 清理这些文件。

## 致谢

本模板在 Beamer 基础能力之上进行了中文汇报场景下的整理与封装，适合继续按个人或团队需求二次扩展。

如果你觉得这个模板有帮助，欢迎在 GitHub 上使用、修改和分享。(别忘了给个star~)
