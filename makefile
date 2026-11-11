# ==============================================================================
# Makefile per il solutore NaSto (Incompressible Navier-Stokes 2D)
# ==============================================================================

FC = gfortran
FCFLAGS = -O3 -Wall -Wextra

TARGET = nasto_solver

# Tutti gli oggetti su una riga sola per evitare problemi di spazi invisibili
OBJ = types.o common.o bc.o rhs.o pressure_correction.o poisson.o io.o timeint.o main.o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(FC) $(FCFLAGS) -o $(TARGET) $(OBJ)

%.o: %.f90
	$(FC) $(FCFLAGS) -c $< -o $@

# Dipendenze
common.o: common.f90 types.o
bc.o: bc.f90 common.o types.o
rhs.o: rhs.f90 common.o types.o
pressure_correction.o: pressure_correction.f90 common.o types.o
poisson.o: poisson.f90 common.o types.o
io.o: io.f90 common.o types.o
timeint.o: timeint.f90 common.o types.o rhs.o bc.o pressure_correction.o poisson.o
main.o: main.f90 types.o common.o bc.o pressure_correction.o io.o timeint.o

clean:
	rm -f $(OBJ) $(TARGET) *.mod

.PHONY: all clean
	rm -f *.o *.mod $(TARGET)