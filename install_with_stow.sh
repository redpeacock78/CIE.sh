#!/usr/bin/env bash

mkdir ~/stow
declare stow=~/stow
declare version=$(libexec/lab -v | head -n1 | tr ' ' -)

# Unstow older versions of Bats.
shopt -s nullglob

declare old_lab=$(find "${stow}" -type d -name lab-\*)

if [[ "${old_lab}" != "" ]]; then
    for package in "${old_lab[@]}"; do
        stow --dir="${stow}" --delete $(basename "${package}")
    done
fi

./install.sh "${stow}/${version}"
stow --dir="${stow}" --restow "${version}"
