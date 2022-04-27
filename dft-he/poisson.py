# Import the numpy modules
import numpy as np

# The Verlet integration
def verlet(f, U0, U1, dr):
    dr_sqr = dr**2
    U_H = np.zeros_like(f)
    U_H[0] = U0
    U_H[1] = U1
    for i in range(2, len(f)):
        U_H[i] = 2*U_H[i-1] - U_H[i-2] + f[i-1]*dr_sqr
    return U_H

# Solve the radial Poisson equation U"_H(r) = -u^2(r)/r
# subject to boundary conditions U_H(0) = 0 and U_H(r_max) = 1
# Inputs: u(r)
# Outputs: U_H(r) 
def solve_poisson(r, u):
    # start verlet integration
    dr = r[1]-r[0]
    f = -u**2/r
    U0, U1 = r[0], r[1]
    U_H = verlet(f, U0, U1, dr)
    # fix right-hand side boundary condition
    U_H = U_H - (U_H[-1]-1)/r[-1]*r
    return U_H