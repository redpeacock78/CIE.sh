# shellcheck source=/dev/null

function setup() {
    export PATH="${BATS_TEST_DIRNAME/test/bin}:${HOME}/kcov/bin:${PATH}"
    export DATA="${BATS_TEST_DIRNAME}/data"
    export err_msg='lab: Sorry. An error has occurred :_('
}

function calc_func() {
    source "${BATS_TEST_DIRNAME/test/libexec}/lab-exec-calc"
    if [[ "${1}" == "calc" ]]; then
        shift && calc "${@}"
    elif [[ "${1}" == "abs" ]]; then
        shift && abs "${@}"
    elif [[ "${1}" == "exp" ]]; then
        shift && exp "${@}"
    elif [[ "${1}" == "atan2" ]]; then
        shift && atan2 "${@}"
    elif [[ "${1}" == "radian2degree" ]]; then
        shift && radian2degree "${@}"
    elif [[ "${1}" == "degree2radian" ]]; then
        shift && degree2radian "${@}"
    fi
}

function coverage() {
    kcov -- coverage "${@}" || true
}
