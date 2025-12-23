# Candia

**NOTE: This is the original version of the code (cfr. A. Cafarella, M. Guzzi, C. Coriano', Comp.Phys.Comm. 179 2008; A. Cafarella, M. Guzzi, C. Coriano', Nucl.Phys.B748 2006). The updated version is [Candia-v2](https://github.com/champso1/candia-v2)**

STEP 1
Editing the file constants.h

The header file constants.h contains some macros and two arrays that the user may want to
change before compiling:

GRID_PTS     Number of points in the x-grid
NGP          Number of Gaussian points
ITERATIONS   Number of iterations
INTERP_PTS   Polynomial interpolation: INTERP_PTS*2-1 is the grade of the interpolating polynomial
HFT          Switch for the heavy flavors treatment (1=yes, 0=no)

Besides these macros, two important arrays are defined in constants.h:

xtab: The values of x listed in this array need to be in increasing order. The first (lower) value
is the lower value of x in the grid. The last (upper) value must be 1. The eventual intermediate
values will be forced to be in the grid. This array must contain at least two values.

Qtab: An output file with the PDF values computed at the end of the evolution will be generated for
all the values of mu_F listed in this array.

****************************************************************************************************

STEP 2
Compiling

Exact method:
compiling with

make

will produce the executable file candia.x

Truncated method:
compiling with

make -f makefile_trunc

will produce the executable file candia_trunc.x

****************************************************************************************************

STEP 3
Running

Let us suppose that the user wants to use the exact method of solution, so the executable is called
candia.x. The whole procedure applies for the truncated method as well, replacing candia.x
with candia_trunc.x

The user has to supply six parameters to the command line. To have a quick usage update  he/she can
just type the line

./candia.x

whose output is self-explanatory:


USAGE

./candia.x <perturbative_order> <truncation_index> <input_model> <kr> <fns> <ext>

<perturbative_order> can be 0, 1 or 2
<truncation_index> cannot be less than <perturbative_order>
<input_model>:
   0= Les Houches toy model
   1= MRST parametrization
   2= MRST grid at 1.25 GeV^2 (minimal value in their grid)
   3= Alekhin parametrization
   4= Alekhin grid at 1 GeV^2
<kr> is the ratio mu_r^2 / mu_f^2
<fns>:
   0= fixed flavor number scheme
   1= variable flavor number scheme
<ext> is the extension of the output files (max 3 characters allowed)


For example, to run the program with the exact solution method at NNLO, with a truncation
index k=6 and the MRST grid as input, with mu_R^2=mu_F^2, in the variable flavor number
scheme and choosing the extension dat for the output files, one should type the command

./candia.x 2 6 2 1 1 dat

****************************************************************************************************

STEP 4
Understanding the output files

For example, if we choose dat as an extension of the output files and our Qtab array is defined by
the following line in constants.h

const double Qtab[]={50.,100.,150.,200.}

when the program exits, the user will find in the directory some files called Qi.dat, with i ranging
from 0 to the number of elements of Qtab (4 in our example).
Q0.dat is the summary of the relevant output files, and in our example it will look like

file                     Q             Q^2
------------------------------------------
Q1.dat                  50            2500
Q2.dat                 100           10000
Q3.dat                 150           22500
Q4.dat                 200           40000

The other files (for example Q1.dat, showing the PDFs at 50 GeV) have one line for each
point in the x-grid and 14 columns: x, xg, xu, xd, xs, xc, xb, xt, x*ubar,
x*dbar, x*sbar, x*cbar, x*bbar and x*tbar.

To print the output in a different form, one should edit a small portion of the code.
