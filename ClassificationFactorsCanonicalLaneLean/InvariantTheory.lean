import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassificationFactorsCanonicalLaneLean.ClassificationGroup

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure InvariantTheory {F : FactorSpace} {G : ClassificationGroup F} where
  invariantMap : G.underlyingSet → Type u
  invariantProperties : Prop
  classificationLift : Prop
  invariantPropertiesClosed : invariantProperties
  classificationLiftClosed : classificationLift

structure InvariantTheoryEvidence {F : FactorSpace} {G : ClassificationGroup F}
    (I : InvariantTheory G) where
  invariantPropertiesClosed : I.invariantProperties
  classificationLiftClosed : I.classificationLift

def InvariantTheoryClosed {F : FactorSpace} {G : ClassificationGroup F}
    (I : InvariantTheory G) : Prop :=
  I.invariantProperties ∧ I.classificationLift

theorem invariant_theory_closed_from_evidence {F : FactorSpace} {G : ClassificationGroup F}
    (I : InvariantTheory G) (E : InvariantTheoryEvidence I) :
    InvariantTheoryClosed I := by
  exact And.intro E.invariantPropertiesClosed E.classificationLiftClosed

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse
