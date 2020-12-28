#!/usr/bin/env bats

load test_helper

@test "test function calc() from lab-exec-calc" {
    run calc_func calc 'sqrt((((10 + 10) * 2) / 4) ^ 2)'
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%.*}" == "10" ]]
}

@test "test function abs() from lab-exec-calc" {
    run calc_func abs '-10'
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%.*}" == "10" ]]
}

@test "test function exp() from lab-exec-calc" {
    run calc_func exp '1'
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%%0*}" == "2.718281828459" ]]
}

@test "test function atan2() from lab-exec-calc" {
    run calc_func atan2 '0 -0'
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%%2*}" == "3.14159" ]]
}

@test "test function atan2() from lab-exec-calc" {
    run calc_func atan2 '0 -0'
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%%2*}" == "3.14159" ]]
}

@test "test function radian2degree() from lab-exec-calc" {
    run calc_func radian2degree '1.57'
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%%4*}" == "89.95" ]]
}

@test "test function degree2radian() from lab-exec-calc" {
    run calc_func degree2radian '90'
    echo "${lines[0]}"
    [[ "${status}" == 0 ]]
    [[ "${lines[0]%%0*}" == "1.57" ]]
}