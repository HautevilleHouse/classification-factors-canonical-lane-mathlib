import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure TrainingAlgorithm (X : FactorSpace) where
  algorithmName : String
  parameterSize : ℕ
  convergenceGuarantee : Prop

def algorithmConvergent (X : FactorSpace) (A : TrainingAlgorithm X) : Prop :=
  A.convergenceGuarantee

theorem algorithm_applies (X : FactorSpace) (A : TrainingAlgorithm X) (h : A.convergenceGuarantee) : algorithmConvergent X A := h

structure GradientDescent (X : FactorSpace) extends TrainingAlgorithm X where
  learningRate : ℝ
  iterationCount : ℕ
  gradientNormTolerance : ℝ

def gradientDescentTerminates (X : FactorSpace) (G : GradientDescent X) : Prop :=
  G.iterationCount > 0

theorem gd_terminates (X : FactorSpace) (G : GradientDescent X) (h : G.iterationCount > 0) : gradientDescentTerminates X G := h

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse