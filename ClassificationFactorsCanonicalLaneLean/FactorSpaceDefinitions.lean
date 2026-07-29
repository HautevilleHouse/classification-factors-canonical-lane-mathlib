import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FactorSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  measurableStructure : MeasurableSpace carrier

structure FactorExtraction (X : FactorSpace) where
  featureMap : X.carrier → ℝⁿ
  featureContinuity : Continuous featureMap
  featureMeasurability : Measurable featureMap

structure ClassLabel (X : FactorSpace) where
  labelSet : Set X.carrier
  labelDefined : MeasurableSet labelSet

def factorExtractionClosed (X : FactorSpace) (F : FactorExtraction X) : Prop :=
  F.featureContinuity ∧ F.featureMeasurability

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse