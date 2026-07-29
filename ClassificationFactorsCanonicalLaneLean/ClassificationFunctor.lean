import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassificationFactorsCanonicalLaneLean.MorphismClassification

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ClassificationFunctor {F : FactorSpace} {G : ClassificationGroup F}
    {I : InvariantTheory G} (M : MorphismClassification I) where
  objectMapping : F.baseSet → Type u
  morphismMapping : ∀ x y : F.baseSet, M.source → M.target → Type u
  functorProperties : Prop
  classificationCompatibility : Prop
  functorPropertiesClosed : functorProperties
  classificationCompatibilityClosed : classificationCompatibility

structure ClassificationFunctorEvidence {F : FactorSpace} {G : ClassificationGroup F}
    {I : InvariantTheory G} {M : MorphismClassification I}
    (Fct : ClassificationFunctor M) where
  functorPropertiesClosed : Fct.functorProperties
  classificationCompatibilityClosed : Fct.classificationCompatibility

def ClassificationFunctorClosed {F : FactorSpace} {G : ClassificationGroup F}
    {I : InvariantTheory G} {M : MorphismClassification I}
    (Fct : ClassificationFunctor M) : Prop :=
  Fct.functorProperties ∧ Fct.classificationCompatibility

theorem classification_functor_closed_from_evidence {F : FactorSpace}
    {G : ClassificationGroup F} {I : InvariantTheory G} {M : MorphismClassification I}
    (Fct : ClassificationFunctor M) (E : ClassificationFunctorEvidence Fct) :
    ClassificationFunctorClosed Fct := by
  exact And.intro E.functorPropertiesClosed E.classificationCompatibilityClosed

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse
