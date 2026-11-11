module mod_types
  !
  use iso_fortran_env, only: real64
  !
  implicit none
  !
  public
  !
  ! ============================================================
  ! Define the real precision used throughout the code.
  !
  ! The parameter rp is used as a shorthand for the floating-point
  ! kind, ensuring consistency and portability across all modules.
  ! In this case, double precision (real64) is selected.
  ! ============================================================
  integer, parameter :: rp = real64
  !
  real(rp), parameter :: pi = 4.0_rp*acos(-1.0_rp)
  !
end module mod_types