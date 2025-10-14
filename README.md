# mod_mtrx
Matrix and Vector Calculation with 8-, 16-, or 32-bit Modular Arithmetic

## Background

This project demonstrates that modular arithmetic with modulus $2^n$ — such as $2^8$, $2^{16}$, or $2^{32}$ — can be utilized as an alternative to Galois (finite) fields.  
Fast processing algorithms in Galois Fields using SIMD (AVX, NEON, etc.) and their applications to Erasure Coding (EC) are patented by StreamScale Inc.  
We believe it is almost impossible to achieve high-performance data processing in Galois Fields using SIMD without infringing on their patents.  

Therefore, we propose algorithms based on modular arithmetic as an alternative approach to processing data in a *pseudo* finite field.

The algorithms presented in this project perform faster than those for Galois Fields. However, there is an important trade-off:

- For $a \times b = c$, where $a, b, c \in \mathbb{Z}$:
  - If $a$ is **odd**, there exists a $d$ such that  
    \[
    d \times c = b, \quad \text{i.e.,} \quad d = a^{-1}
    \]
  - However, if $a$ is **even**, there is **no** $d$ such that  
    \[
    d = a^{-1} \quad \text{and} \quad d \times c = b
    \]

In other words, elements that are **odd** (i.e., coprime with $2^n$) have a **multiplicative inverse**, while **even** elements do not — just as in modular arithmetic modulo a power of 2.

To arreviate this restriction, we included an example solution for an even $a$ such that $a / 2$ is odd (ex. 2, 6, 10,....).


---

## Installation

You can clone the repository using:

```sh
git clone https://github.com/scopedog/mod_mtrx.git
```

and make the executable:

```sh
cd mod_mtrx
make
```

