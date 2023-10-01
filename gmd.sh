#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename="$1"
title="${filename%.*}" # 提取文件名（不含扩展名）作为title
current_date=$(date +"%Y-%m-%d %H:%M:%S")

md_content="---
title: $title
date: $current_date
categories: 请输入你的分类，只能一个
tags: 输入你的标记，可以多个
mathjax: true
---




<!-- more -->

"

echo -e "$md_content" > "$filename.md"
echo "Markdown文件 '$filename.md' 已创建并包含默认内容。"

