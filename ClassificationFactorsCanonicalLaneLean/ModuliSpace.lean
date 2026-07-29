import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure ModuliSpacePackage where
  parameterSpace : Type u
  fiber : parameterSpace → Type u
  localTriviality : Prop
  hausdorffProperty : Prop
  completeness : Prop

structure ModuliSpaceEvidence (M : ModuliSpacePackage) where
  localTrivialityClosed : M.localTriviality
  hausdorffPropertyClosed : M.hausdorffProperty
  completenessClosed : M.completeness

def ModuliSpaceClosed (M : ModuliSpacePackage) : Prop :=
  M.localTriviality ∧ M.hausdorffProperty ∧ M.completeness

theorem moduli_space_closed_from_evidence (M : ModuliSpacePackage)
    (E : ModuliSpaceEvidence M) : ModuliSpaceClosed M := by
  exact And.intro E.localTrivialityClosed
    (And.intro E.hausdorffPropertyClosed E.completenessClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse