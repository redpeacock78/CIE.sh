#!/usr/bin/env bats

@test "test function dE76()" {
    declare lab_pairs=('50 50 0 40 50 0' '50 50 0 50 50 10')
    declare dE1976=('10.0000' '10.0000')

    for (( i=0; i < "${#lab_pairs[@]}"; i++ )); do
        declare output="$(./bin/lab -dE76 ${lab_pairs[i]})"
        declare result="$(bc -l <<<"${output} == ${dE1976[i]}")"

        echo "Lab pairs: ${lab_pairs[i]}"
        echo "Output: ${output}"
        echo "dE1976: ${dE1976[i]}"

        [[ "${result}" == 1 ]]
    done
}