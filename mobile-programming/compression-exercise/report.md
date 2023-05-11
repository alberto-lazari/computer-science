# Mobile Programming and Multimedia - Compression exercise
Lazari Alberto - 2089120

## LZW algorithm
Instead of writing down all the algorithm steps by hand, I've implemented it in a simple shell script. \
The script outputs the dictionary while it's created, as shown in the slides of the lesson, and finally three different encoding results (based on the encoding method).

Here's the source code of the used script and, following, its output.

### Code
```bash
echo ffffffff000ffffff00fffff000ffffff00abcabca00bcabcabcabcabcabc | sed -e 's/./&\n/g' | ./lzw-enc.sh -c
w       k       output  code => symbol
======================================
f       f       f       256 => ff
ff      f       256     257 => fff
fff     f       257     258 => ffff
ff      0       256     259 => ff0
0       0       0       260 => 00
00      f       260     261 => 00f
ffff    f       258     262 => fffff
ff0     0       259     263 => ff00
0       f       0       264 => 0f
fffff   0       262     265 => fffff0
00      0       260     266 => 000
0f      f       264     267 => 0ff
fffff0  0       265     268 => fffff00
0       a       0       269 => 0a
a       b       a       270 => ab
b       c       b       271 => bc
c       a       c       272 => ca
ab      c       270     273 => abc
ca      0       272     274 => ca0
00      b       260     275 => 00b
bc      a       271     276 => bca
abc     a       273     277 => abca
abca    b       277     278 => abcab
bca     b       276     279 => bcab
bcab    c       279     280 => bcabc
c       EOF     c

Encoded sequence:
f 256 257 256 0 260 258 259 0 262 260 264 265 0 a b c 270 272 260 271 273 277 276 279 c

Original size: 61 bytes * 8 = 488 bits

- ASCII 1 byte, codes 9 bits:
Encoded size: 26 characters -> 8 characters * 8 + 19 codes * 9 = 235 bits
Encoding ratio: 0.482

- 9 bits per character:
Encoded size: 26 characters * 9 = (8 characters + 19 codes) * 9 = 243 bits
Encoding ratio: 0.498

- ASCII 1 byte, codes 2 bytes:
Encoded size: 26 characters -> 8 characters * 8 + 19 codes * 16 = 368 bits
Encoding ratio: 0.754
```

### Output
```
$ echo ffffffff000ffffff00fffff000ffffff00abcabca00bcabcabcabcabcabc | sed -e 's/./&\n/g' | ./lzw-enc.sh -c
w       k       output  code => symbol
======================================
f       f       f       256 => ff
ff      f       256     257 => fff
fff     f       257     258 => ffff
ff      0       256     259 => ff0
0       0       0       260 => 00
00      f       260     261 => 00f
ffff    f       258     262 => fffff
ff0     0       259     263 => ff00
0       f       0       264 => 0f
fffff   0       262     265 => fffff0
00      0       260     266 => 000
0f      f       264     267 => 0ff
fffff0  0       265     268 => fffff00
0       a       0       269 => 0a
a       b       a       270 => ab
b       c       b       271 => bc
c       a       c       272 => ca
ab      c       270     273 => abc
ca      0       272     274 => ca0
00      b       260     275 => 00b
bc      a       271     276 => bca
abc     a       273     277 => abca
abca    b       277     278 => abcab
bca     b       276     279 => bcab
bcab    c       279     280 => bcabc
c       EOF     c

Encoded sequence:
f 256 257 256 0 260 258 259 0 262 260 264 265 0 a b c 270 272 260 271 273 277 276 279 c

Original size: 61 bytes * 8 = 488 bits

- ASCII 1 byte, codes 9 bits:
Encoded size: 26 characters -> 8 characters * 8 + 19 codes * 9 = 235 bits
Encoding ratio: 0.482

- 9 bits per character:
Encoded size: 26 characters * 9 = (8 characters + 19 codes) * 9 = 243 bits
Encoding ratio: 0.498

- ASCII 1 byte, codes 2 bytes:
Encoded size: 26 characters -> 8 characters * 8 + 19 codes * 16 = 368 bits
Encoding ratio: 0.754
```

The script reports three different ways of encoding the final result:
#### Minimum number of bits
Normal characters are encoded in a byte, while sequence codes need an additional bit (because > 255). It's the most efficient, however it cannot be decoded: "Do I need to read 8 or 9 bits now?" $\implies$ Some sort of escaping is needed.

#### 9 bits per character
The easiest one. Every character is encoded using 9 bits, so it's always sure how to obtain the characters during decoding.

#### Byte for characters, two bytes for codes
Using an additional byte for sequence codes, instead of just 9 bits. This can be done, for instance, with UTF-8 encoding, that uses just one byte for ASCII characters and an additional one (or more) to encode Unicode symbols. \
It's more convenient than method (2.) for modern systems, since they usually work with whole bytes, so working with 9 bits sets requires some low level parsing, while UTF-8 is well supported on every system.

Here's the expanded version of the table (with all the steps).
```
w       k       output  code => symbol
======================================
NULL    f
f       f       f       256 => ff
ff      f
ff      f       256     257 => fff
ff      f
fff     f
fff     f       257     258 => ffff
ff      f
ff      0       256     259 => ff0
0       0       0       260 => 00
00      0
00      f       260     261 => 00f
ff      f
fff     f
ffff    f
ffff    f       258     262 => fffff
ff      f
ff0     0
ff0     0       259     263 => ff00
0       f       0       264 => 0f
ff      f
fff     f
ffff    f
fffff   f
fffff   0       262     265 => fffff0
00      0
00      0       260     266 => 000
0f      f
0f      f       264     267 => 0ff
ff      f
fff     f
ffff    f
fffff   f
fffff0  0
fffff0  0       265     268 => fffff00
0       a       0       269 => 0a
a       b       a       270 => ab
b       c       b       271 => bc
c       a       c       272 => ca
ab      b
ab      c       270     273 => abc
ca      a
ca      0       272     274 => ca0
00      0
00      b       260     275 => 00b
bc      c
bc      a       271     276 => bca
ab      b
abc     c
abc     a       273     277 => abca
ab      b
abc     c
abca    a
abca    b       277     278 => abcab
bc      c
bca     a
bca     b       276     279 => bcab
bc      c
bca     a
bcab    b
bcab    c       279     280 => bcabc
c       EOF     c
```

## Shannon-Fano algorithm
### Tree
Here's the tree, resulting from the execution of Shannon-Fano's algorithm on the given sequence

![shannon-fano's algorithm tree](shannon-fano-tree.png)

### Table
The table presents the algorithm results, with the encodings of every character

| Character | Occurrences | Code |
|-----------|-------------|------|
|f          |25           |00    |
|0          |12           |10    |
|a          |8            |01    |
|b          |8            |110   |
|c          |8            |111   |

### Encoding
The final encoded string is:
```
```

Where every code is a sequence of just 2 or 3 bits.

The sequence can be obtained with the command:
```bash
```

### Compress ratio
