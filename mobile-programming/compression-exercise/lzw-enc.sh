#!/usr/bin/env bash

if [[ $1 == '-c' ]]; then
    compact=true
else
    compact=false
fi

declare -A dict
# Initial code value
code=256

echo w$'\t'k$'\t'output$'\t'code =\> symbol
echo ======================================

while read k; do
    if [[ -n ${dict[$w$k]} ]]; then
        w=$w$k
        $compact || echo $w$'\t'$k$'\t'
    else
        if [[ -z ${dict[$k]} ]]; then
            dict+=([$k]=$k)
        fi

        if [[ -n $w ]]; then
            dict+=([$w$k]=$code)
            echo $w$'\t'$k$'\t'${dict[$w]}$'\t'$code =\> $w$k
            enc="$enc ${dict[$w]}"
            code=$(( $code + 1 ))
        else
            $compact || echo NULL$'\t'$k
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

e_bytes=$(echo $enc | sed -e 's/ .[0-9][0-9]//g' | wc -w | sed -e 's/[^0-9]*//g')
e_codes=$(echo $enc | sed -e 's/[^0-9] //g' | sed -e 's/[^0-9]. / /g' | wc -w | sed -e 's/[^0-9]*//g')
e_bits=$(( $e_bytes * 9 + e_codes * 9 ))

echo $'\n'- 9 bits per character:
echo "Encoded size: $e_size characters * 9 = ($e_bytes characters + $e_codes codes) * 9 = $e_bits bits"
printf 'Encoding ratio: %.3f\n' $(bc -le "$e_bits / $o_bits")
