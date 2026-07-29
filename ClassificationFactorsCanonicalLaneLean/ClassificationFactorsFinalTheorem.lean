import canonicalLaneMathlib.AdmissibleClass
import ClassificationFactorsCanonicalLaneLean.FactorStratification
import ClassificationFactorsCanonicalLaneLean.SpectralDecomposition
import ClassificationFactorsCanonicalLaneLean.InvariantTheory
import ClassificationFactorsCanonicalLaneLean.ModuliSpace

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

def ClassificationFactorsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem classification_factors_endgame (A : AdmissibleClass) :
    ClassificationFactorsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse