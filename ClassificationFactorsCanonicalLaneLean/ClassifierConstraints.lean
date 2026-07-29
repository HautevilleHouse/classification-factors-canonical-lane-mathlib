import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ClassifierConstraint where
  featureType : Type u
  hypothesisClass : Type v
  constraintInequality : Prop
  admissibilityCondition : Prop

structure ClassifierConstraintEvidence (C : ClassifierConstraint) where
  constraintInequalityClosed : C.constraintInequality
  admissibilityConditionClosed : C.admissibilityCondition

def ClassifierConstraintClosed (C : ClassifierConstraint) : Prop :=
  C.constraintInequality ∧ C.admissibilityCondition

theorem classifier_constraint_closed_from_evidence (C : ClassifierConstraint)
    (E : ClassifierConstraintEvidence C) : ClassifierConstraintClosed C := by
  exact And.intro E.constraintInequalityClosed E.admissibilityConditionClosed

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse