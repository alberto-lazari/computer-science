#import "/common.typ": *

= Computational model
In order to understand quantum algorithms it is necessary to define the tensor product operation between matrices.

== Tensor product
Let $A in CC^(m times n), B in CC^(p times q), D in CC^(m p times n q)$

The tensor product $tensor$ is defined as a bilinear operator between vector spaces:
$ tensor : A times B -> D $

In the course the $tensor$ operator always refers to the Kronecker product, a special case of the more generic tensor product.

/ Kronecker product: 
$ D := A tensor B = mat(
    a_11 B, ..., a_(1 n) B;
    a_21 B, ..., a_(2 n) B;
    dots.v, , dots.v;
    a_(m 1) B, ..., a_(m n) B
  )
$
