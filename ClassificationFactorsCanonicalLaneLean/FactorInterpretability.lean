import ClassificationFactorsCanonicalLaneLean.ClassifierPerformance

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FactorInterpretabilityPackage
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    {P : ClassifierPerformancePackage F I} where
  shapValuesComputed : Prop
  permutationImportance : Prop
  partialDependencePlots : Prop
  reliabilityAssessed : Prop

structure FactorInterpretabilityEvidence
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    {P : ClassifierPerformancePackage F I}
    (R : FactorInterpretabilityPackage F I P) where
  shapValuesComputedClosed : R.shapValuesComputed
  permutationImportanceClosed : R.permutationImportance
  partialDependencePlotsClosed : R.partialDependencePlots
  reliabilityAssessedClosed : R.reliabilityAssessed

def FactorInterpretabilityClosed
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    {P : ClassifierPerformancePackage F I}
    (R : FactorInterpretabilityPackage F I P) : Prop :=
  R.shapValuesComputed ∧ R.permutationImportance ∧
  R.partialDependencePlots ∧ R.reliabilityAssessed

theorem factor_interpretability_closed_from_evidence
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    {P : ClassifierPerformancePackage F I}
    (R : FactorInterpretabilityPackage F I P) (E : FactorInterpretabilityEvidence R) :
    FactorInterpretabilityClosed R := by
  exact And.intro E.shapValuesComputedClosed
    (And.intro E.permutationImportanceClosed
      (And.intro E.partialDependencePlotsClosed E.reliabilityAssessedClosed))

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse