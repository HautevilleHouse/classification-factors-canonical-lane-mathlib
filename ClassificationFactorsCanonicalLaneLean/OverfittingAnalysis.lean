import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure OverfittingPackage (X : FactorSpace) (F : FactorExtraction X) (D : DecisionBoundaryPackage X) where
  trainingAccuracy : ℚ
  validationAccuracy : ℚ
  generalizationGap : ℚ := trainingAccuracy - validationAccuracy
  gapThresholdExceeded : Bool := generalizationGap > 0.05

def overfittingDetected (X : FactorSpace) (F : FactorExtraction X) (D : DecisionBoundaryPackage X) (O : OverfittingPackage X F D) : Prop :=
  O.gapThresholdExceeded

theorem overfitting_warning (X : FactorSpace) (F : FactorExtraction X) (D : DecisionBoundaryPackage X) (O : OverfittingPackage X F D) (h : O.generalizationGap > 0.05) : overfittingDetected X F D O := by
  exact h

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse