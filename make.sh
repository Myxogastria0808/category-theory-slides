#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
	echo "Usage: $0 <project-name>" >&2
	exit 1
fi

project="$1"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
template_dir="$script_dir/.template"
project_dir="$script_dir/$project"

if [ -d "$project_dir" ]; then
	echo "Error: $project_dir already exists" >&2
	exit 1
fi

cp -r "$template_dir" "$project_dir"

sed -i "s/{{PROJECT_NAME}}/$project/" "$project_dir/sections/title.typ"

echo "Created new project at $project_dir"

