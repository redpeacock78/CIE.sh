#!/usr/bin/env bats

load test_helper

@test "test function dE94() with graphic arts" {
    #Reference: http://www2.ece.rochester.edu/~gsharma/ciede2000/dataNprograms/CIEDE2000.xls
    #Reference: https://qiita.com/nagito25/items/0293bc317067d9e6c560
    #Reference: http://www.brucelindbloom.com/index.html?ColorDifferenceCalc.html

    IFS=$'\n'
    declare lab_pairs=($(cat "${DATA}/lab_paires.txt"))
    declare dE1994=($(cat "${DATA}/dE1994_graphic.txt"))

    for (( i=0; i < "${#lab_pairs[@]}"; i++ )); do
        run lab -dE94 -g ${lab_pairs[i]}
        [[ "${lines[0]}" == "${dE1994[i]}" ]]
        coverage lab -dE94 -g ${lab_pairs[i]}
    done
}

@test "test function dE94() with textiles" {
    #Reference: http://www2.ece.rochester.edu/~gsharma/ciede2000/dataNprograms/CIEDE2000.xls
    #Reference: https://qiita.com/nagito25/items/0293bc317067d9e6c560
    #Reference: http://www.brucelindbloom.com/index.html?ColorDifferenceCalc.html

    IFS=$'\n'
    declare lab_pairs=($(cat "${DATA}/lab_paires.txt"))
    declare dE1994=($(cat "${DATA}/dE1994_textiles.txt"))

    for (( i=0; i < "${#lab_pairs[@]}"; i++ )); do
        run lab -dE94 -t ${lab_pairs[i]}
        [[ "${lines[0]}" == "${dE1994[i]}" ]]
        coverage lab -dE94 -t ${lab_pairs[i]}
    done
}