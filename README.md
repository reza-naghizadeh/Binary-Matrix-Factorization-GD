# Binary Matrix Factorization using Gradient Descent

This repository contains a MATLAB implementation of **Binary Matrix Factorization** using gradient descent for approximating a binary neighborhood matrix. The algorithm learns two factor matrices \( U \) and \( V \) such that their product approximates the input matrix \( M \), with binary thresholding applied to the result.

This code was developed as part of our Optimization course project at IASBS, in collaboration with my groupmate, [Erfan Faridi](https://github.com/erfanfaridii/).

---

## Features
- Factorizes a binary neighborhood matrix into two lower-dimensional matrices \( U \) and \( V \).
- Iteratively updates \( U \) and \( V \) using gradient descent.
- Applies binary thresholding to reconstruct a binary matrix.
- Computes error and evaluates matrix reconstruction accuracy.

---

## Files
- **main.m**: Contains the full implementation of binary matrix factorization.
- **neighborhoodMatrix.csv**: Input matrix file used for factorization.
  
---

## How to Run
1. Place the input matrix `neighborhoodMatrix.csv` in the same directory as `main.m`.
2. Open MATLAB and run the `main.m` script.
3. View the output, including the reconstruction error and mismatched entries.

---

## Output
- **Factorized Matrices**: \( U \) and \( V \), which approximate the input matrix.
- **Reconstructed Matrix**: Binary matrix \( Q \), derived from \( U \times V \).
- **Error Metrics**: Frobenius norm of the error and count of mismatched entries.

---

## Requirements
- MATLAB R2021b or later.
- `neighborhoodMatrix.csv` as input.

---

## Example
```matlab
% Run the script
M = readmatrix('neighborhoodMatrix.csv');

% Factorize M into U and V
Q = U * V;

% Binary thresholding applied
disp('Reconstruction Error: ');
disp(error);
```