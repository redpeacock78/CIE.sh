#!/usr/bin/env bats

load test_helper

@test "-v and --version print version number" {
    run lab -v
    [[ "${status}" == 0 ]]
    [[ $(expr $(head -n1 <<<"${lines[0]}") : "lab [0-9][0-9.]*") != 0 ]]
}

@test "-h and --help print help" {
    declare message='Usage: lab [OPTION] L1 a1 b1 L2 a2 b2'
    run lab -h
    [[ "${status}" == 0 ]]
    [[ "${lines[0]}" == "${message}" ]]
}

@test "no arguments prints error" {
    run lab
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "no arguments prints error from -dE76" {
    run lab -dE76
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "no arguments prints error from -dE94" {
    run lab -dE94
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "no arguments prints error from -dE94 -g" {
    run lab -dE94 -g
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "no arguments prints error from -dE94 -t" {
    run lab -dE94 -t
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "no arguments prints error from -dE00" {
    run lab -dE00
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "not enough arguments prints error from -dE76" {
    run lab -dE76 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "not enough arguments prints error from -dE94 -g" {
    run lab -dE94 -g 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "not enough arguments prints error from -dE94 -t" {
    run lab -dE94 -t 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "not enough arguments prints error from -dE00" {
    run lab -dE00 50 50 0 40 50
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "many arguments prints error from -dE76" {
    run lab -dE76 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "many arguments prints error from -dE94 -g" {
    run lab -dE94 -g 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "many arguments prints error from -dE94 -t" {
    run lab -dE94 -t 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}

@test "many arguments prints error from -dE00" {
    run lab -dE00 50 50 0 40 50 0 78
    [[ "${status}" == 1 ]]
    [[ $(head -n1 <<<"${lines[0]}") == "${err_msg}" ]]
}