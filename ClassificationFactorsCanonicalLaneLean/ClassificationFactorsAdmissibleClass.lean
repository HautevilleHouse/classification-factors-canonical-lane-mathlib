import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ClassificationAdmittedObject where
  dataset : Type
  featureSpace : Type
  targetLabels : Prop
  factorStructure : Prop
  conclusion : factorStructure

structure AdmissibleClass where
  object : ClassificationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def ClassificationObjectClosed (O : ClassificationAdmittedObject) : Prop :=
  O.factorStructure

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse