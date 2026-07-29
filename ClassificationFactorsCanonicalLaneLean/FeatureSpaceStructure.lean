import ClassificationFactorsCanonicalLaneLean.ClassificationFactorsAdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FeatureSpaceStructurePackage where
  featureCount : ℕ
  featureTypes : List Type
  scalingApplied : Prop
  dimensionalityReduction : Prop
  kernelChoice : Prop

structure FeatureSpaceStructureEvidence (F : FeatureSpaceStructurePackage) where
  featureCountClosed : F.featureCount = 7
  scalingAppliedClosed : F.scalingApplied
  dimensionalityReductionClosed : F.dimensionalityReduction
  kernelChoiceClosed : F.kernelChoice

def FeatureSpaceStructureClosed (F : FeatureSpaceStructurePackage) : Prop :=
  F.featureCount = 7 ∧ F.scalingApplied ∧ F.dimensionalityReduction ∧ F.kernelChoice

theorem feature_space_structure_closed_from_evidence
    (F : FeatureSpaceStructurePackage) (E : FeatureSpaceStructureEvidence F) :
    FeatureSpaceStructureClosed F := by
  exact And.intro E.featureCountClosed
    (And.intro E.scalingAppliedClosed
      (And.intro E.dimensionalityReductionClosed E.kernelChoiceClosed))

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse