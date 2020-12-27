#!/usr/bin/env bats

@test "test function dE76()" {
    declare lab_pairs=('50 50 0 40 50 0' '50 50 0 50 50 10')

    for ((i=0; i<"${#a[@]}"; i++)); do
        declare output="$(./bin/lab -dE76 ${lab_pairs[i]})"
        declare result="$(bc -l <<<"${output} == 10.0000")"

        echo "echo ${output}"

        [ "$result" -eq 1 ]
    done
}