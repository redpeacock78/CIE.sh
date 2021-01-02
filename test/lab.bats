#!/usr/bin/env bats

load test_helper

@test "-v and --version print version number" {
    run lab -v
    [[ "${status}" == 0 ]]
    [[ $(expr $(head -n1 <<<"${lines[0]}") : "lab [0-9][0-9.]*") != 0 ]]
    coverage lab -v
}

@test "-h and --help print help" {
    declare message='Usage: lab [OPTION] L1 a1 b1 L2 a2 b2'
    run lab -h
    [[ "${status}" == 0 ]]
    [[ "${lines[0]}" == "${message}" ]]
    coverage lab -h
}

@test "no arguments prints error" {
    run lab
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab
}

@test "specifying wrong options prints error" {
    run lab -hekp
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -hekp
}

@test "no arguments prints error from -dE76" {
    run lab -dE76
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE76
}

@test "no arguments prints error from -dE94" {
    run lab -dE94
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94
}

@test "no arguments prints error from -dE94 -g" {
    run lab -dE94 -g
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -g
}

@test "no arguments prints error from -dE94 -t" {
    run lab -dE94 -t
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -t
}

@test "no arguments prints error from -dE00" {
    run lab -dE00
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE00
}

@test "not enough arguments prints error from -dE76" {
    run lab -dE76 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE76 50 50 0 40 50
}

@test "not enough arguments prints error from -dE94 -g" {
    run lab -dE94 -g 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -g 50 50 0 40 50
}

@test "not enough arguments prints error from -dE94 -t" {
    run lab -dE94 -t 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE84 -t 50 50 0 40 50
}

@test "not enough arguments prints error from -dE00" {
    run lab -dE00 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE00 50 50 0 40 50
}

@test "many arguments prints error from -dE76" {
    run lab -dE76 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE76 50 50 0 40 50 78
}

@test "many arguments prints error from -dE94 -g" {
    run lab -dE94 -g 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -g  50 50 0 40 50 78
}

@test "many arguments prints error from -dE94 -t" {
    run lab -dE94 -t 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -t 50 50 0 40 50 0 78
}

@test "many arguments prints error from -dE00" {
    run lab -dE00 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE00 50 50 0 40 50 0 78
}

@test "non-numeric arguments prints error from -dE76" {
    run lab -dE76 _ 50 0 40 50 0
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE76 _ 50 0 40 50 0
}

@test "non-numeric arguments prints error from -dE94 -g" {
    run lab -dE94 -g _ 50 0 40 50 0
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -g _ 50 0 40 50 0
}

@test "non-numeric arguments prints error from -dE94 -t" {
    run lab -dE94 -t _ 50 0 40 50 0
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -t _ 50 0 40 50 0
}

@test "non-numeric arguments prints error from -dE00" {
    run lab -dE00 _ 50 0 40 50 0
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE00 _ 50 0 40 50 0
}

@test "-g or -t not specified prints error from -dE94" {
    run lab -dE94 40 50 0 40 50 10
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 40 50 0 40 50 10
}

@test "specifying wrong options prints error from -dE94" {
    run lab -dE94 -t 40 50 0 40 50 10
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
    coverage lab -dE94 -t 40 50 0 40 50 10
}