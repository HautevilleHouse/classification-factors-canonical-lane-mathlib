import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure InferenceRule where
  premises : List String
  conclusion : String
  confidence : Float

def ruleSound (r : InferenceRule) : Prop := r.confidence ≥ 0.7

structure InferenceEvidence (r : InferenceRule) where
  premisesConsistent : ∀ p ∈ r.premises, p ≠ ""
  conclusionNonempty : r.conclusion ≠ ""
  confidenceSufficient : ruleSound r

def InferenceRuleClosed (r : InferenceRule) : Prop :=
  (∀ p ∈ r.premises, p ≠ "") ∧ r.conclusion ≠ "" ∧ ruleSound r

theorem inference_rule_closed_from_evidence (r : InferenceRule) (e : InferenceEvidence r) : InferenceRuleClosed r := by
  exact And.intro e.premisesConsistent (And.intro e.conclusionNonempty e.confidenceSufficient)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse