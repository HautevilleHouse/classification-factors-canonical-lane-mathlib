import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ModelEvaluation (X : FactorSpace) (D : DecisionBoundaryPackage X) where
  truePositive : ℕ
  trueNegative : ℕ
  falsePositive : ℕ
  falseNegative : ℕ
  accuracy : ℚ := (truePositive + trueNegative) / (truePositive + trueNegative + falsePositive + falseNegative)
  precision : ℚ := truePositive / (truePositive + falsePositive)
  recall : ℚ := truePositive / (truePositive + falseNegative)

def evaluationGood (X : FactorSpace) (D : DecisionBoundaryPackage X) (E : ModelEvaluation X D) : Prop :=
  E.accuracy > 0.9 ∧ E.precision > 0.85 ∧ E.recall > 0.85

theorem evaluation_positive (X : FactorSpace) (D : DecisionBoundaryPackage X) (E : ModelEvaluation X D) (hacc : E.accuracy > 0.9) (hprec : E.precision > 0.85) (hrec : E.recall > 0.85) : evaluationGood X D E := by
  exact And.intro hacc (And.intro hprec hrec)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse