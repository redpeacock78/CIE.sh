#!/usr/bin/env bats

@test "test function dE00()" {
    #Reference: http://www2.ece.rochester.edu/~gsharma/ciede2000/dataNprograms/CIEDE2000.xls

    IFS=$'\n'
    declare lab_pairs=($(cat ./test/data/lab_paires.txt))
    declare dE2000=($(cat ./test/data/dE2000.txt))

    for (( i=0; i < "${#lab_pairs[@]}"; i++ )); do
        run ./bin/lab -dE00 ${lab_pairs[i]}
        [[ "${lines[0]}" == "${dE2000[i]}" ]]
    done
}