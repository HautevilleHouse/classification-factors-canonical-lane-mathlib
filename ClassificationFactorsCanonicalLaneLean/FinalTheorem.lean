import ClassificationFactorsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

def ConstrainedFactorClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_factor_endgame (A : AdmissibleClass) : ConstrainedFactorClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse