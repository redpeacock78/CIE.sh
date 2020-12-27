#!/usr/bin/env bash
set -e

function resolve_link() {
    $(type -p greadlink readlink | head -1) "${1}"
}

function abs_dirname() {
    declare cwd="$(pwd)"
    declare path="${1}"

    while [[ -n "${path}" ]]; do
        cd "${path%/*}"
        declare name="${path##*/}"
        declare path="$(resolve_link "${name}" || true)"
    done

    pwd
    cd "${cwd}"
}

declare PREFIX="${1}"
if [[ -z "${1}" ]]; then
    {
        echo "usage: ${0} <prefix>"
        echo "  e.g. ${0} /usr/local"
    } >&2
    exit 1
fi

declare ROOT="$(abs_dirname "${0}")"
mkdir -p "${PREFIX}"/{bin,libexec}
cp -R "${ROOT}"/bin/* "${PREFIX}"/bin
cp -R "${ROOT}"/libexec/* "${PREFIX}"/libexec

echo "Installed ${PREFIX}/bin/lab"
