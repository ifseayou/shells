#!/bin/bash

# 检查输入参数是否足够
if [ $# -lt 1 ]; then
  echo "用法: $0 <源路径> <目标目录>"
  exit 1
fi

# 获取源路径
source_path="$1"
target_dir="/Users/xhl/blog/source/_posts"

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$target_dir/$2" ]; then
  echo "目标目录 '$target_dir/$2' 不存在，正在创建."
  mkdir -p "$target_dir/$2"
fi

# 判断源路径是文件还是文件夹
if [ -f "$source_path" ]; then
  # 如果源路径是文件，复制文件到目标目录
  cp "$source_path" "$target_dir"
  echo "文件 '$source_path' 已成功复制到 '$target_dir'"
elif [ -d "$source_path" ]; then
  # 如果源路径是文件夹，复制文件夹及其内容到目标目录
  cp -r "$source_path"/* "$target_dir/$1"
  echo "文件夹 '$source_path' 及其内容已成功复制到 '$target_dir/$2'"
else
  echo "源路径 '$source_path' 既不是文件也不是文件夹."
  exit 1
fi

