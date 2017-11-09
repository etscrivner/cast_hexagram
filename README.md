# Cast Hexagram

Simple console based application for casting an Iching hexagram. Uses `SecureRandom` as a source of
high quality entropy.

## Why?

In any undertaking it is common to get stuck in rut - a local minima or maxima from which we can't
seem to find a mode of escape. This is the state of [aporia](https://en.wikipedia.org/wiki/Aporia)
from the Greek phrase a-poros meaning "without passage" - implying the lack of a clear way forward.

Similar to [Oblique Strategies](https://en.wikipedia.org/wiki/Oblique_Strategies), it is often
useful when you find yourself stuck like this to inject some random information into the mix to help
unstick yourself. Casting an Iching hexagram is a simple way to accomplish this.

## Usage

To begin with, first think of the question you would like to have answered.
Then, run the application as follows:

```
./bin/cast_hexagram "YOUR QUESTION HERE"
```

The program will then randomly toss coins to generate a hexagram and display the answer something
like the following:

```
QUESTION: YOUR QUESTION HERE

PRIMARY HEXAGRAM (#60):
---X---
-------
-------
--- ---
--( )--
---X---

RELATING HEXAGRAM (#34):
-------
-------
-------
--- ---
--- ---
-------
```

This shows both your primary hexagram and its [King Wen
sequence](https://en.wikipedia.org/wiki/King_Wen_sequence) number as well as your relating hexagram
derived from the changing lines with its King Wen sequence number.

You can then take your hexagrams and consult a copy of the Iching or your favorite online reference
for the answer.
