import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassificationFactorsCanonicalLaneLean.ClassificationFunctor

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | () => True

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  unfold bridgeClosed
  match A.object with
  | () => trivial

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedClassificationFactorsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_classification_factors_endgame (A : AdmissibleClass) :
    ConstrainedClassificationFactorsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse