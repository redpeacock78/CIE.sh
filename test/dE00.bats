#!/usr/bin/env bats

load test_helper

@test "test function dE00()" {
    #Reference: http://www2.ece.rochester.edu/~gsharma/ciede2000/dataNprograms/CIEDE2000.xls

    IFS=$'\n'
    declare lab_pairs=($(cat "${DATA}/lab_paires.txt"))
    declare dE2000=($(cat "${DATA}/dE2000.txt"))

    for (( i=0; i < "${#lab_pairs[@]}"; i++ )); do
        run lab -dE00 ${lab_pairs[i]}
        [[ "${lines[0]}" == "${dE2000[i]}" ]]
    done
}