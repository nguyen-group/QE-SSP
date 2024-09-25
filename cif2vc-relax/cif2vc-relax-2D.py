import os
import subprocess
import json
from ase.io import read
import numpy as np

# Load the JSON file for SSSP efficiency pseudopotentials
with open('SSSP_1.3.0_PBE_efficiency.json', 'r') as f:
    sssp_data = json.load(f)

# Inspect the keys at the top level
# print(sssp_data.keys())

# Extract pseudopotential information
pseudopotential_data = {element: {
    'pseudopotential': info.get('filename'),
    'ecutwfc': info.get('cutoff_wfc'),
    'ecutrho': info.get('cutoff_rho')
} for element, info in sssp_data.items()}

# Print the pseudopotential data
# print(pseudopotential_data)

# Function to convert CIF to QE input
def convert_cif_to_qe_input(cif_file, output_dir):
    # Read the structure using ASE
    structure = read(cif_file)

    # Get the chemical formula
    formula = structure.get_chemical_formula()

    # Get the number of atoms
    num_atoms = structure.get_global_number_of_atoms()
    print('Formula:', formula, '& Number of atoms:', num_atoms)
    
    # Get the chemical symbols in the structure
    symbols = list(set(structure.get_chemical_symbols()))

    # Get the lattice parameter
    cell = structure.cell.array

    # Get the reciprocal lattice parameter
    reciprocal_lattice = 2 * np.pi * np.linalg.inv(cell)

    # Get k-point grid
    k_density = 0.3 # k-point density in Angstrom^-1 for structure with 1, 2, 3 atoms
    reciprocal_lengths = np.linalg.norm(reciprocal_lattice, axis=1)
    kpoints = np.ceil(reciprocal_lengths / k_density).astype(int)

    # Check and print symbols not in pseudopotential data
    # missing_symbols = [symbol for symbol in symbols if symbol not in pseudopotential_data]
    # if missing_symbols:
    #     print(f"Warning: Pseudopotential cutoff not defined for elements: {', '.join(missing_symbols)}")
    
    # Ensure that all symbols have cutoffs defined
    for symbol in symbols:
        if symbol not in pseudopotential_data:
            raise ValueError(f"Pseudopotential cutoff not defined for element: {symbol}")
    
    max_ecut = max([pseudopotential_data[symbol]['ecutwfc'] for symbol in symbols])
    max_ecutrho = max([pseudopotential_data[symbol]['ecutrho'] for symbol in symbols])
    
    # Generate the QE input using cif2cell
    output_file = os.path.join(output_dir, os.path.splitext(os.path.basename(cif_file))[0] + '.in')

    # Define the command with the --force flag
    cif2cell_cmd = [
        "cif2cell",
        "--force",  # Add the --force flag here
        "-p", "pwscf",
        "-f", cif_file,
        "-o", output_file
    ]
 
    try:
        result = subprocess.run(cif2cell_cmd, capture_output=True, text=True, check=True)
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Error while running cif2cell:")
        print(e.stderr)
        raise
    
    # Modify the QE input file to set ecut, ecutrho, and pseudopotentials
    with open(output_file, 'r+') as f:
        lines = f.readlines()

        # Reset file pointer to the beginning
        f.seek(0)
        f.truncate()  # Clear the content before writing new content

        # Add CONTROL section
        f.write('&CONTROL\n')
        f.write('  calculation = \'vc-relax\'\n')
        f.write('  restart_mode = \'from_scratch\'\n')
        f.write('  pseudo_dir = \'../pseudo/\'\n')
        f.write('  outdir = \'../tmp/\'\n')
        f.write('  prefix = \'{}\'\n'.format(formula))
        f.write('  verbosity = \'high\'\n')
        f.write('  wf_collect = .true.\n')
        f.write('  tstress = .true.\n')
        f.write('  tprnfor = .true.\n')
        f.write('  etot_conv_thr = 1.0E-5\n')
        f.write('  forc_conv_thr = 1.0D-4\n')
        f.write('  nstep = 100\n')
        f.write('/\n')
        
        # Add SYSTEM, ELECTRONS, and IONS sections
        for line in lines:
            if not line.strip().startswith('#'):
                f.write(line)
            if 'SYSTEM' in line:
                f.write('  ecutwfc = {}\n'.format(max_ecut))
                f.write('  ecutrho = {}\n'.format(max_ecutrho))
                f.write('  occupations = \'smearing\'\n')
                f.write('  smearing = \'mv\'\n')
                f.write('  degauss = 0.02\n')
            if '/' in line:
                f.write('&ELECTRONS\n')
                f.write('  electron_maxstep = 100\n')
                f.write('  conv_thr = 1.0d-9\n')
                f.write('  mixing_beta = 0.3\n')
                f.write('/\n')
                f.write('&IONS\n')
                f.write('  ion_dynamics = \'bfgs\'\n')
                f.write('/\n')
                f.write('&CELL\n')
                f.write('  cell_dynamics = \'bfgs\'\n')
                f.write('  press_conv_thr = 0.05\n')
                f.write('  cell_dofree = \'2Dxy\'\n')
                f.write('/\n')

        # Replace "symbol_PSEUDO" with the actual pseudopotential names
        f.seek(0)  # Go back to the start of the file to read and replace content
        content = f.read()
        for symbol in symbols:
            pseudo_name = pseudopotential_data[symbol]['pseudopotential']
            content = content.replace(f"{symbol}_PSEUDO", pseudo_name)
        
        # Write the modified content back to the file
        f.seek(0)
        f.write(content)
        f.truncate()
        
        # Add information to the K_POINTS section
        f.write("K_POINTS {automatic}\n")
        f.write(f" {kpoints[0]} {kpoints[1]} 1 0 0 0\n")

    return output_file

# Directory paths
#cif_files_dir = './cif_files_small'
#output_dir = './qe_inputs-sssp-1.3'
cif_files_dir = './cif_files'
output_dir = './vc-relax'

# Convert all CIF files in the directory
for cif_file in os.listdir(cif_files_dir):
    if cif_file.endswith('.cif'):
        cif_path = os.path.join(cif_files_dir, cif_file)
        try:
            qe_input_file = convert_cif_to_qe_input(cif_path, output_dir)
        except subprocess.CalledProcessError:
            continue