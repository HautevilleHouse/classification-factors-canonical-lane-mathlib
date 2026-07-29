import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure GeneralizationErrorBounds where
  hypothesisClass : Type u
  trueRisk : Type v
  empiricalRisk : Type w
  uniformDeviationBound : Prop
  VCdimensionBound : Prop
  marginBound : Prop

structure GeneralizationErrorBoundsEvidence (G : GeneralizationErrorBounds) where
  uniformDeviationBoundClosed : G.uniformDeviationBound
  VCdimensionBoundClosed : G.VCdimensionBound
  marginBoundClosed : G.marginBound

def GeneralizationErrorBoundsClosed (G : GeneralizationErrorBounds) : Prop :=
  G.uniformDeviationBound ∧ G.VCdimensionBound ∧ G.marginBound

theorem generalization_error_bounds_closed_from_evidence (G : GeneralizationErrorBounds)
    (E : GeneralizationErrorBoundsEvidence G) : GeneralizationErrorBoundsClosed G := by
  exact And.intro E.uniformDeviationBoundClosed (And.intro E.VCdimensionBoundClosed E.marginBoundClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse