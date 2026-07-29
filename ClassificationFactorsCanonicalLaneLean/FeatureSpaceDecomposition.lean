import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FeatureSpaceDecomposition where
  baseSpace : Type u
  fibers : Type v
  baseSpaceTopology : TopologicalSpace baseSpace
  fiberSpaceTopology : TopologicalSpace fibers
  trivializationCondition : Prop
  baseClosed : Prop
  fiberClosed : Prop

structure FeatureSpaceDecompositionEvidence (D : FeatureSpaceDecomposition) where
  trivializationConditionClosed : D.trivializationCondition
  baseClosedTerm : D.baseClosed
  fiberClosedTerm : D.fiberClosed

def FeatureSpaceDecompositionClosed (D : FeatureSpaceDecomposition) : Prop :=
  D.trivializationCondition ∧ D.baseClosed ∧ D.fiberClosed

theorem feature_space_decomposition_closed_from_evidence (D : FeatureSpaceDecomposition)
    (E : FeatureSpaceDecompositionEvidence D) : FeatureSpaceDecompositionClosed D := by
  exact And.intro E.trivializationConditionClosed (And.intro E.baseClosedTerm E.fiberClosedTerm)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse