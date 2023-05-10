#!/usr/bin/env bash -e

declare -A dict
code=256

echo w$'\t'output$'\t'code =\> symbol
echo ================================

while read k; do
    if [[ -n ${dict[$w$k]} ]]; then
        w=$w$k
    else
        if [[ -z ${dict[$k]} ]]; then
            dict+=([$k]=$k)
        fi

        if [[ -n $w ]]; then
            dict+=([$w$k]=$code)
            echo $w$'\t'${dict[$w]}$'\t'$code =\> $w$k
            enc="$enc ${dict[$w]}"
            code=$(( $code + 1 ))
        fi
        w=$k
    fi
done

echo $'\n'Encoded sequence:
echo $enc #| sed -e 's/ //g'
o_size=$(wc -w input | sed -e 's/[^0-9]*//g')
o_bits=$(( $o_size * 8 ))
echo Original size: $o_size bytes \* 8 = $o_bits bits

e_size=$(echo $enc | wc -w | sed -e 's/[^0-9]*//g')
e_bits=233

bytes=$(echo $enc | sed -e 's/ .[0-9][0-9]//g')
codes=$(echo $enc | sed -e 's/[^0-9] //g' | sed -e 's/[^0-9]. //g')

echo "Encoded size: $e_size characters (...) -> $e_bits bits"
echo Encoding ratio: 0$(bc -le "$e_bits / $o_bits")
