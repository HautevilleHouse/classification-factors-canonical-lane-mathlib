import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure FactorStratificationPackage where
  factorSpace : Type u
  stratification : factorSpace → ℕ
  lowerLevelClosure : Prop
  upperLevelClosure : Prop
  limitStratumCompact : Prop

structure FactorStratificationEvidence (F : FactorStratificationPackage) where
  lowerLevelClosureClosed : F.lowerLevelClosure
  upperLevelClosureClosed : F.upperLevelClosure
  limitStratumCompactClosed : F.limitStratumCompact

def FactorStratificationClosed (F : FactorStratificationPackage) : Prop :=
  F.lowerLevelClosure ∧ F.upperLevelClosure ∧ F.limitStratumCompact

theorem factor_stratification_closed_from_evidence (F : FactorStratificationPackage)
    (E : FactorStratificationEvidence F) : FactorStratificationClosed F := by
  exact And.intro E.lowerLevelClosureClosed
    (And.intro E.upperLevelClosureClosed E.limitStratumCompactClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse