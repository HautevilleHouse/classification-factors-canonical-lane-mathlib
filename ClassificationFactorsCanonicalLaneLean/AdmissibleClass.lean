import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FactorClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse