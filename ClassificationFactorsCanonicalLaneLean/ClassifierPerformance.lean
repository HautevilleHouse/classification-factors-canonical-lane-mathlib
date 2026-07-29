import ClassificationFactorsCanonicalLaneLean.FactorIndependence

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ClassifierPerformancePackage
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F} where
  accuracy : Prop
  precision : Prop
  recall : Prop
  f1Score : Prop
  auc : Prop

structure ClassifierPerformanceEvidence
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    (P : ClassifierPerformancePackage F I) where
  accuracyClosed : P.accuracy
  precisionClosed : P.precision
  recallClosed : P.recall
  f1ScoreClosed : P.f1Score
  aucClosed : P.auc

def ClassifierPerformanceClosed
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    (P : ClassifierPerformancePackage F I) : Prop :=
  P.accuracy ∧ P.precision ∧ P.recall ∧ P.f1Score ∧ P.auc

theorem classifier_performance_closed_from_evidence
    {F : FeatureSpaceStructurePackage}
    {I : FactorIndependencePackage F}
    (P : ClassifierPerformancePackage F I) (E : ClassifierPerformanceEvidence P) :
    ClassifierPerformanceClosed P := by
  exact And.intro E.accuracyClosed
    (And.intro E.precisionClosed
      (And.intro E.recallClosed
        (And.intro E.f1ScoreClosed E.aucClosed)))

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse