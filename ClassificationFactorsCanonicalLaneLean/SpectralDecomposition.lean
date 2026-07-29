import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassificationFactorsCanonicalLaneLean

structure SpectralDecompositionPackage where
  operator : Type u
  spectrum : Set ℝ
  discreteSpectrum : Prop
  continuousSpectrum : Prop
  spectralResolution : Prop

structure SpectralDecompositionEvidence (S : SpectralDecompositionPackage) where
  discreteSpectrumClosed : S.discreteSpectrum
  continuousSpectrumClosed : S.continuousSpectrum
  spectralResolutionClosed : S.spectralResolution

def SpectralDecompositionClosed (S : SpectralDecompositionPackage) : Prop :=
  S.discreteSpectrum ∧ S.continuousSpectrum ∧ S.spectralResolution

theorem spectral_decomposition_closed_from_evidence (S : SpectralDecompositionPackage)
    (E : SpectralDecompositionEvidence S) : SpectralDecompositionClosed S := by
  exact And.intro E.discreteSpectrumClosed
    (And.intro E.continuousSpectrumClosed E.spectralResolutionClosed)

end ClassificationFactorsCanonicalLaneLean
end HautevilleHouse