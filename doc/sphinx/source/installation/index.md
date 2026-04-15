# Installation

AxiSEM3D is a software written in C++ that needs to be configured
and compiled before it can be run to produce
simulations.

The installation of **AxiSEM3D** consists of three parts:

- [the mesher](mesher.md)
- [the solver](solver/index.md)
- a few tools for pre- and post-processing  

## System Requirements

- Unix-like operating system (Linux, macOS, Windows WSL)
- A C++ compiler supporting the **C++17** standard
- `cmake` **3.26 or above**
- MPI implementation (serial build is possible but not recommended)

---

```{toctree}
---
maxdepth: 1
---
mesher.md
solver/index.md
```
