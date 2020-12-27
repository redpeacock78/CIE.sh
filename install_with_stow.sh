#!/usr/bin/env bash

mkdir ~/stow
declare stow=~/stow
declare version=$(libexec/lab -v | head -n1 | tr ' ' -)

shopt -s nullglob

declare old_lab=$(find "${stow}" -type d -name lab-\*)

if [[ "${old_lab}" != "" ]]; then
    for package in "${old_lab[@]}"; do
        cd "${stow}"
        stow -D -vv $(basename "${package}")
    done
fi

./install.sh "${stow}/${version}"
cd "${stow}"
stow -vv "${version}"
