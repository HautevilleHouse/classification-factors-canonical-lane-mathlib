import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure DecisionBoundaryPackage (X : FactorSpace) where
  boundarySet : Set X.carrier
  boundaryClosed : MeasurableSet boundarySet
  decisionRule : X.carrier → Bool

def decisionBoundaryClosed (X : FactorSpace) (D : DecisionBoundaryPackage X) : Prop :=
  D.boundaryClosed ∧ ∀ x : X.carrier, D.decisionRule x = (x ∈ D.boundarySet)

theorem decision_boundary_closed_from_evidence (X : FactorSpace) (D : DecisionBoundaryPackage X) (h : D.boundaryClosed) : decisionBoundaryClosed X D := by
  refine And.intro h ?_
  intro x
  rfl

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse