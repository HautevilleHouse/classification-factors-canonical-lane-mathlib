import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure KernelFeatureEmbedding where
  inputSpace : Type u
  featureSpace : Type v
  kernelFunction : inputSpace → inputSpace → ℝ
  positiveDefinite : Prop
  reproducingProperty : Prop
  separabilityCondition : Prop

structure KernelFeatureEmbeddingEvidence (K : KernelFeatureEmbedding) where
  positiveDefiniteClosed : K.positiveDefinite
  reproducingPropertyClosed : K.reproducingProperty
  separabilityConditionClosed : K.separabilityCondition

def KernelFeatureEmbeddingClosed (K : KernelFeatureEmbedding) : Prop :=
  K.positiveDefinite ∧ K.reproducingProperty ∧ K.separabilityCondition

theorem kernel_feature_embedding_closed_from_evidence (K : KernelFeatureEmbedding)
    (E : KernelFeatureEmbeddingEvidence K) : KernelFeatureEmbeddingClosed K := by
  exact And.intro E.positiveDefiniteClosed (And.intro E.reproducingPropertyClosed E.separabilityConditionClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse