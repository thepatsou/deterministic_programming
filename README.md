# Deterministic Programming in Operations Research

MATLAB/Octave implementations of deterministic optimization models developed for an academic Operations Research project. The repository shows how practical problems can be formulated as linear programs in standard form and solved numerically with `glpk`.

## Project Overview

The project covers four applications of linear programming:

1. **Multi-period production planning** - minimizes production and inventory-holding costs under demand and storage-capacity constraints.
2. **Network transshipment** - models flows between stations subject to node balances and arc capacities.
3. **Road-lighting design** - minimizes total over-lighting and under-lighting relative to a desired illumination profile.
4. **Polynomial approximation** - minimizes the total absolute deviation between observed data and a polynomial approximation.

The complete mathematical formulations and discussion are available in the [project report](deterministic%20programming.pdf) (in Greek).

## Repository Structure

| File | Description |
| --- | --- |
| `stock.m` | Builds the objective vector and constraint matrices for the production-planning model. |
| `prob12.m` | Defines a 10-period production-planning example, solves it for multiple storage capacities, and plots the objective value. |
| `transfer.m` | Builds the standard-form representation of the network-transshipment model. |
| `light.m` | Builds the linear-programming model for the road-lighting problem. |
| `prob33.m` | Solves the lighting model for a range of triangular-profile slope values and plots the objective value. |
| `polapprox.m` | Builds the linear-programming model for least-absolute-deviation polynomial approximation. |
| `deterministic programming.pdf` | Project report containing the problem statements, formulations, and analysis. |

## Mathematical Form

The implementations construct models in equality standard form:

$$
\max \; c^T x
$$

subject to

$$
Ax=b, \qquad x\geq 0.
$$

Auxiliary and slack variables are introduced where required. Some original minimization objectives are sign-adjusted before being passed to `glpk`; see the corresponding script and report for each model's convention.

## Requirements

- GNU Octave with `glpk` available, or MATLAB configured with a compatible GLPK interface
- A plotting environment supported by MATLAB/Octave

No external dataset is required; the example scripts define their input data directly.

## Getting Started

Clone the repository and open its directory:

```bash
git clone https://github.com/<username>/<repository-name>.git
cd <repository-name>
```

Start MATLAB or Octave from that directory, or add the repository to the search path:

```matlab
addpath(pwd)
```

## Running the Examples

### Production planning

Run:

```matlab
prob12
```

The script:

- defines production, demand, and inventory-holding costs for ten periods;
- generates the linear program using `stock.m`;
- solves the model for a sequence of storage capacities; and
- plots the optimal objective value as a function of storage capacity.

### Road-lighting optimization

Run:

```matlab
prob33
```

The script evaluates a triangular desired-lighting profile with peak level $B=100$, solves the model using `light.m`, and plots the objective value against the slope parameter $d$.

### Calling the model-building functions

The remaining models can be incorporated into custom experiment scripts:

```matlab
% Production planning
[f, A, b] = stock(demand, productionCost, holdingCost, capacity);

% Network transshipment
[b, A, c] = transfer(available, demand, arcCapacity, arcCost);

% Road lighting
[c, A, b] = light(lightParameters, targetLighting);

% Polynomial approximation
[c, A, b] = polapprox(x, y, degree);
```

Pass the returned arrays to `glpk` using the objective-sign convention documented in the relevant source file and report.

## Results

Add the plots produced by `prob12.m` and `prob33.m` to an `images/` directory, then replace the placeholders below.

### Production cost versus storage capacity

<!-- Replace with: ![Production-planning result](images/production-planning.png) -->

_Add a short interpretation of how storage capacity affects the optimal objective value._

### Lighting deviation versus profile slope

<!-- Replace with: ![Road-lighting result](images/road-lighting.png) -->

_Add a short interpretation of how the desired profile's slope affects the minimum deviation._

## Possible Extensions

- Add reproducible driver scripts for the transshipment and polynomial-approximation models.
- Export figures automatically with consistent titles, labels, legends, and units.
- Add input validation and solver-status checks.
- Add numerical tests for matrix dimensions, feasibility, and known benchmark solutions.
- Provide `linprog` alternatives for native MATLAB workflows.

## Author

Panagiota Tsoutsoulopoulou

## License

This academic project is provided for educational purposes. Add a license file before redistributing or reusing the code.
