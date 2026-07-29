import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure DecisionBoundaryRegularization where
  classifierFunction : Type u → Type v
  regularizationTerm : Prop
  smoothnessConstraint : Prop
  marginCondition : Prop

structure DecisionBoundaryRegularizationEvidence (R : DecisionBoundaryRegularization) where
  regularizationTermClosed : R.regularizationTerm
  smoothnessConstraintClosed : R.smoothnessConstraint
  marginConditionClosed : R.marginCondition

def DecisionBoundaryRegularizationClosed (R : DecisionBoundaryRegularization) : Prop :=
  R.regularizationTerm ∧ R.smoothnessConstraint ∧ R.marginCondition

theorem decision_boundary_regularization_closed_from_evidence
    (R : DecisionBoundaryRegularization) (E : DecisionBoundaryRegularizationEvidence R) :
    DecisionBoundaryRegularizationClosed R := by
  exact And.intro E.regularizationTermClosed (And.intro E.smoothnessConstraintClosed E.marginConditionClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse