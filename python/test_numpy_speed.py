import numpy as np
import time
import argparse
from contextlib import contextmanager


def create_timer():
    counter = iter(range(1, int(1e6)))  # Local counter, encapsulated in closure

    @contextmanager
    def timer(label=None):
        nonlocal counter
        if label is None:
            label = f"Block-{next(counter)}"
        start_time = time.time()
        yield  # Code block execution happens here
        elapsed = time.time() - start_time
        print(f"[{label}] Elapsed: {elapsed:.6f} seconds")

    return timer



def main(size, dtype='float32'):
  
  timer = create_timer()

  with timer("gen a"):
    a = np.random.randn(size)
  with timer("a.dtype"):
    a = a.astype(dtype)

  with timer("gen b"):
    b = np.random.randn(size)
  with timer("b.dtype"):
    b = b.astype(dtype)


  with timer("c = a+b"):
    c = a + b

  print(f"{c.shape=}, {c.dtype=}")

  with timer("c.sum()"):
    z = c.sum()

  print(f"{z=:.4f}")


def parse_args() -> dict:
  parser = argparse.ArgumentParser()
  parser.add_argument("--dtype", default='float32', choices=['float32', 'float64', 'int32', 'int64', 'int16'])
  parser.add_argument("size", type=int)
  args = parser.parse_args()
  return vars(args)

if __name__ == '__main__':
  args = parse_args()
  main(**args)