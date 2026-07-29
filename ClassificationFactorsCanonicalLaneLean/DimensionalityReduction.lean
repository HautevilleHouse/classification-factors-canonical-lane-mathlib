import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure DimensionalityReductionPackage (X : FactorSpace) where
  embeddingDim : ℕ
  embeddingMap : X.carrier → ℝ^embeddingDim
  embeddingContinuity : Continuous embeddingMap
  embeddingInjective : Function.Injective embeddingMap

def dimensionalityReductionClosed (X : FactorSpace) (D : DimensionalityReductionPackage X) : Prop :=
  D.embeddingContinuity ∧ D.embeddingInjective

theorem dimensionality_reduction_closed_from_evidence (X : FactorSpace) (D : DimensionalityReductionPackage X) (hcont : D.embeddingContinuity) (hinj : D.embeddingInjective) : dimensionalityReductionClosed X D := by
  exact And.intro hcont hinj

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse