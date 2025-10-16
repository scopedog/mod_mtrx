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

    $$d \times c = b, \quad \text{i.e.,} \quad d = a^{-1}$$

  - However, if $a$ is **even**, there is **no** $d$ such that

    $$d = a^{-1} \quad \text{and} \quad d \times c = b$$

In other words, elements that are **odd** (i.e., coprime with $2^n$) have a **multiplicative inverse**, while **even** elements do not — just as in modular arithmetic modulo a power of 2.

To arreviate this restriction, we included an example solution for an even $a$ such that $a / 2$ is odd (ex. 2, 6, 10,....).
Suppose $a = 2e$, where $e$ is odd, and $e^{-1} = f$. then we have:

$$a \times b = c \Leftrightarrow 2e \times b = c$$

Herein, if we mulitply $c$ with $f$, we have: 

$$f \times c = f \times 2e \times b = e^{-1} \times 2e \times b = 2b$$

Therefore,

$$b = (f \times c) / 2$$

holds. In other words,

$$b = (f \times c) >> 1$$

This indicates that even if $a$ is even, it is possible to obtain $b$ with $c$ and $f$.

However, there arises a question "What is the value of the highest bit of $b$ in $n$-bit modular arithmetic obtained from the above way?" Suppose $f \times c = g$ with 32-bit modulo, the value of the highest bit of $g >> 1$ automatically becomes zero.
However, it should not be always zero.

To determine the correct value of the highest bit of $g >> 1$, we beforehand save the highest bit of original $b$ as $b_{parity}$, i.e.,

$$b_{parity} = b \text{&amp;} 0x80000000$$

Then, we get $b$ as:

$$b =  ((f \times c) >> 1) | b_{parity}$$

Thus for $a \times b = c$ with even $a$, we can obtain $b$ from $a$, $c$ and $b_{parity}$.
However, there arises another question. Do we really use $b_{parity}$, which is a part of $b$, to obtain $b$? If we use this arithmetic for cryptographic matrix multiplicaton such as Hill Cipher, is it safe to use $b_{parity}$? How should we store the values of $b_{parity}$? Good questions. It will be still safe to use $b_{parity}$ as long as they are also encrypted and are capsuled together with the other encrypted data. Then, what about $b_{parity}$ of $b_{parity}$ s? Don't worry, for $b_{parity}$ of $b_{parity}$ s, we use $b$ such that its highest bit is always zero, in other words, no $b_{parity}$ of $b_{parity}$ s is necessary.


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

