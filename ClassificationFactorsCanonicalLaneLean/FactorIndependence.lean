import ClassificationFactorsCanonicalLaneLean.FeatureSpaceStructure

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FactorIndependencePackage
    {F : FeatureSpaceStructurePackage} where
  pairwiseIndependent : Prop
  mutualInformationZero : Prop
  correlationTestPassed : Prop
  confoundingControlled : Prop

structure FactorIndependenceEvidence
    {F : FeatureSpaceStructurePackage}
    (I : FactorIndependencePackage F) where
  pairwiseIndependentClosed : I.pairwiseIndependent
  mutualInformationZeroClosed : I.mutualInformationZero
  correlationTestPassedClosed : I.correlationTestPassed
  confoundingControlledClosed : I.confoundingControlled

def FactorIndependenceClosed
    {F : FeatureSpaceStructurePackage}
    (I : FactorIndependencePackage F) : Prop :=
  I.pairwiseIndependent ∧ I.mutualInformationZero ∧
  I.correlationTestPassed ∧ I.confoundingControlled

theorem factor_independence_closed_from_evidence
    {F : FeatureSpaceStructurePackage}
    (I : FactorIndependencePackage F) (E : FactorIndependenceEvidence I) :
    FactorIndependenceClosed I := by
  exact And.intro E.pairwiseIndependentClosed
    (And.intro E.mutualInformationZeroClosed
      (And.intro E.correlationTestPassedClosed E.confoundingControlledClosed))

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse