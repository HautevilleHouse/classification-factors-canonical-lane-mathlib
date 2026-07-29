import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ClassificationFactor where
  factorName : String
  factorType : String
  validationRules : List String
  admissibleRange : List Float

default factorValid : ClassificationFactor → Prop := λ f => f.admissibleRange.length = 2

structure FactorEvidence (f : ClassificationFactor) where
  nameValid : f.factorName ≠ ""
  typeKnown : f.factorType ∈ ["categorical", "continuous", "ordinal"]
  rulesSatisfied : ∀ r ∈ f.validationRules, r ≠ ""
  rangeBoundsPresent : factorValid f

def FactorClosed (f : ClassificationFactor) : Prop :=
  f.factorName ≠ "" ∧ f.factorType ∈ ["categorical", "continuous", "ordinal"] ∧
  (∀ r ∈ f.validationRules, r ≠ "") ∧ factorValid f

theorem factor_closed_from_evidence (f : ClassificationFactor) (e : FactorEvidence f) : FactorClosed f := by
  exact And.intro e.nameValid (And.intro e.typeKnown (And.intro e.rulesSatisfied e.rangeBoundsPresent))

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse