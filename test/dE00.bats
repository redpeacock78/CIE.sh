#!/usr/bin/env bats

@test "test function dE00()" {
    #Reference: http://www2.ece.rochester.edu/~gsharma/ciede2000/dataNprograms/CIEDE2000.xls
    declare lab_pairs=(
        '50.0000 2.6772 -79.7751 50.0000 0.0000 -82.7485' \
        '50.0000 3.1571 -77.2803 50.0000 0.0000 -82.7485' \
        '50.0000 2.8361 -74.0200 50.0000 0.0000 -82.7485' \
        '50.0000 -1.3802 -84.2814 50.0000 0.0000 -82.7485' \
        '50.0000 -1.1848 -84.8006 50.0000 0.0000 -82.7485' \
        '50.0000 -0.9009 -85.5211 50.0000 0.0000 -82.7485' \
        '50.0000 0.0000 0.0000 50.0000 -1.0000 2.0000' \
        '50.0000 -1.0000 2.0000 50.0000 0.0000 0.0000' \
        '50.0000 2.4900 -0.0010 50.0000 -2.4900 0.0009' \
        '50.0000 2.4900 -0.0010 50.0000 -2.4900 0.0010' \
        '50.0000 2.4900 -0.0010 50.0000 -2.4900 0.0011' \
        '50.0000 2.4900 -0.0010 50.0000 -2.4900 0.0012' \
        '50.0000 -0.0010 2.4900 50.0000 0.0009 -2.4900' \
        '50.0000 -0.0010 2.4900 50.0000 0.0010 -2.4900' \
        '50.0000 -0.0010 2.4900 50.0000 0.0011 -2.4900' \
        '50.0000 2.5000 0.0000 50.0000 0.0000 -2.5000' \
        '50.0000 2.5000 0.0000 73.0000 25.0000 -18.0000' \
        '50.0000 2.5000 0.0000 61.0000 -5.0000 29.0000' \
        '50.0000 2.5000 0.0000 56.0000 -27.0000 -3.0000' \
        '50.0000 2.5000 0.0000 58.0000 24.0000 15.0000' \
        '50.0000 2.5000 0.0000 50.0000 3.1736 0.5854' \
        '50.0000 2.5000 0.0000 50.0000 3.2972 0.0000' \
        '50.0000 2.5000 0.0000 50.0000 1.8634 0.5757' \
        '50.0000 2.5000 0.0000 50.0000 3.2592 0.3350' \
        '60.2574 -34.0099 36.2677 60.4626 -34.1751 39.4387' \
        '63.0109 -31.0961 -5.8663 62.8187 -29.7946 -4.0864' \
        '61.2901 3.7196 -5.3901 61.4292 2.2480 -4.9620' \
        '35.0831 -44.1164 3.7933 35.0232 -40.0716 1.5901' \
        '22.7233 20.0904 -46.6940 23.0331 14.9730 -42.5619' \
        '36.4612 47.8580 18.3852 36.2715 50.5065 21.2231' \
        '90.8027 -2.0831 1.4410 91.1528 -1.6435 0.0447' \
        '90.9257 -0.5406 -0.9208 88.6381 -0.8985 -0.7239' \
        '6.7747 -0.2908 -2.4247 5.8714 -0.0985 -2.2286' \
        '2.0776 0.0795 -1.1350 0.9033 -0.0636 -0.5514'
    )
    declare dE2000=(
        '2.0425' '2.8615' \
        '3.4412' '1.0000' \
        '1.0000' '1.0000' \
        '2.3669' '2.3669' \
        '7.1792' '7.1792' \
        '7.2195' '7.2195' \
        '4.8045' '4.8045' \
        '4.7461' '4.3065' \
        '27.1492' '22.8977' \
        '31.9030' '19.4535' \
        '1.0000' '1.0000' \
        '1.0000' '1.0000' \
        '1.2644' '1.2630' \
        '1.8731' '1.8645' \
        '2.0373' '1.4146' \
        '1.4441' '1.5381' \
        '0.6377' '0.9082'
    )

    for (( i=0; i < "${#lab_pairs[@]}"; i++ )); do
        declare output="$(./bin/lab -dE00 ${lab_pairs[i]})"
        declare result="$(bc -l <<<"${output} == ${dE2000[i]}")"
        
        echo "Lab pairs: ${lab_pairs[i]}"
        echo "Output: ${output}"
        echo "dE2000: ${dE2000[i]}"

        [[ "${result}" == 1 ]]
    done
}