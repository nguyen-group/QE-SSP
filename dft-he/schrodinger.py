# Import the numpy modules
import numpy as np

# The Numerov algorithm for equation: u"(r) = -k(r)u(r) with k(r)=2(E-V)
# Input: k(r), two initial values u0(r) and u1(r)
# Output: u(r)
def numerov(k, u0, u1, dr):
    u = np.zeros_like(k)
    u[0] = u0
    u[1] = u1
    for i in range(2, len(k)):
        dr_sqr = dr**2
        c0 = (1 + 1/12.*dr_sqr*k[i-2])
        c1 = 2*(1 - 5/12.*dr_sqr*k[i-1])
        c2 = (1 + 1/12.*dr_sqr*k[i])
        u[i] = (c1*u[i-1] - c0*u[i-2])/c2 
    return u

# Solve the reduced radial Schrodinger equation u"(r) = -2(E-V)u(r)
# Here, wavefunction is psi=R(r)*Y(theta,phi), where R(r)=u(r)/r
# Inputs: r and V(r)
# Outputs: group-state energy E and reduced radial wavefunction u(r) 
def solve_schrodinger(r, V, eps_min=-4, eps_max=0, maxiter=100, stoptol = 0.0001):
    dr = r[1] - r[0]
    for i in range(maxiter):
        eps = (eps_min + eps_max)/2.
        k = 2*(eps - V)
        u0 = r[-1]*np.exp(-r[-1])
        u1 = r[-2]*np.exp(-r[-2])
        # call the Numerov algorithm 
        u = numerov(k[::-1], u0, u1, dr)
        u = u[::-1]
        num_nodes = np.sum(u[1:]*u[:-1] < 0)
        if num_nodes == 0 and np.abs(u[0]) <= stoptol:
            return (eps, u)
        if num_nodes == 0 and u[0] > 0:
            eps_min = eps
        else:
            assert num_nodes > 0, 'expect #nodes > 0 since u[0] < 0 while u[infty] > 0'
            eps_max = eps   
    raise Exception('Not converged after %d iterations.' %(maxiter))