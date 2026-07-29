import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure EmpiricalRiskMinimization where
  hypothesisSet : Type u
  lossFunction : Type v
  sampleComplexity : Prop
  convergenceRate : Prop
  riskBound : Prop

structure EmpiricalRiskMinimizationEvidence (E : EmpiricalRiskMinimization) where
  sampleComplexityClosed : E.sampleComplexity
  convergenceRateClosed : E.convergenceRate
  riskBoundClosed : E.riskBound

def EmpiricalRiskMinimizationClosed (E : EmpiricalRiskMinimization) : Prop :=
  E.sampleComplexity ∧ E.convergenceRate ∧ E.riskBound

theorem empirical_risk_minimization_closed_from_evidence (E : EmpiricalRiskMinimization)
    (Ev : EmpiricalRiskMinimizationEvidence E) : EmpiricalRiskMinimizationClosed E := by
  exact And.intro Ev.sampleComplexityClosed (And.intro Ev.convergenceRateClosed Ev.riskBoundClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse