import ClassificationFactorsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FactorClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse