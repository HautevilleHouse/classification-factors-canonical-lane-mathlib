import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassificationFactorsCanonicalLaneLean.FactorSpace

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ClassificationGroup (F : FactorSpace) where
  underlyingSet : Type u
  groupOperation : underlyingSet → underlyingSet → underlyingSet
  identityElement : underlyingSet
  inverseOperation : underlyingSet → underlyingSet
  groupOperationsClosed : Prop
  groupOperationsClosedTerm : groupOperationsClosed

structure ClassificationGroupEvidence {F : FactorSpace} (G : ClassificationGroup F) where
  groupOperationsClosedClosed : G.groupOperationsClosed

def ClassificationGroupClosed {F : FactorSpace} (G : ClassificationGroup F) : Prop :=
  G.groupOperationsClosed

theorem classification_group_closed_from_evidence {F : FactorSpace}
    (G : ClassificationGroup F) (E : ClassificationGroupEvidence G) :
    ClassificationGroupClosed G := by
  exact E.groupOperationsClosedClosed

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse
