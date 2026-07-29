import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FactorSpace where
  baseSet : Type u
  structureSheaf : baseSet → Type v
  localStructure : Prop
  factorizationProperty : Prop
  structureSheafDefined : localStructure → factorizationProperty

structure FactorSpaceEvidence (F : FactorSpace) where
  localStructureClosed : F.localStructure
  factorizationPropertyClosed : F.factorizationProperty
  structureSheafDefinedClosed : F.structureSheafDefined F.localStructureClosed

def FactorSpaceClosed (F : FactorSpace) : Prop :=
  F.localStructure ∧ F.factorizationProperty

theorem factor_space_closed_from_evidence (F : FactorSpace) (E : FactorSpaceEvidence F) :
    FactorSpaceClosed F := by
  exact And.intro E.localStructureClosed E.factorizationPropertyClosed

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse
