#!/bin/bash
gcc -std=c11 -o lang tiny_lang.c

runtest() {
    output=$(./tiny_lang "$1")
    if [ "$output" != "$2" ]; then
        echo "$1: $2 expected, but got $output"
        exit 1
    fi
    echo "$1 => $output"
}

echo '=== arithmetic operators ==='
runtest '+ 1 2' 3
runtest '+ 100 5' 105
runtest '- 5 2' 3
runtest '* 3 5' 15
# runtest '/ 20 5' 4
runtest '+ + + 1 2 3 4' 10
runtest '+ 2 * 4 3' 14

# echo '=== function ==='
# runtest 'F[+ . .] F(1)' 2
# runtest 'F[* . 2] F(5)' 10
# runtest 'F[* . .] F(F(2))' 16
# runtest 'F[* . .] F(F(F(2)))' 256

echo '=== multi function ==='
runtest 'F[* a b] F(2 5)' 10
runtest 'F[+ + a b c] F(2 5 10)' 17

echo '=== fibonacci ==='
runtest 'F[P(a) F(b + a b)] F(1 1)'|head -10



echo ok
