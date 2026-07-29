import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassificationFactorsCanonicalLaneLean.InvariantTheory

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure MorphismClassification {F : FactorSpace} {G : ClassificationGroup F}
    {I : InvariantTheory G} where
  source : F.baseSet
  target : F.baseSet
  morphismProperty : Prop
  classificationPreserved : Prop
  morphismPropertyClosed : morphismProperty
  classificationPreservedClosed : classificationPreserved

structure MorphismClassificationEvidence {F : FactorSpace} {G : ClassificationGroup F}
    {I : InvariantTheory G} (M : MorphismClassification I) where
  morphismPropertyClosed : M.morphismProperty
  classificationPreservedClosed : M.classificationPreserved

def MorphismClassificationClosed {F : FactorSpace} {G : ClassificationGroup F}
    {I : InvariantTheory G} (M : MorphismClassification I) : Prop :=
  M.morphismProperty ∧ M.classificationPreserved

theorem morphism_classification_closed_from_evidence {F : FactorSpace}
    {G : ClassificationGroup F} {I : InvariantTheory G}
    (M : MorphismClassification I) (E : MorphismClassificationEvidence M) :
    MorphismClassificationClosed M := by
  exact And.intro E.morphismPropertyClosed E.classificationPreservedClosed

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse
