{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "gruvbox-factory";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "paulopacitti";
    repo = "gruvbox-factory";
    rev = "v${version}";
    hash = "sha256-w5Yqko3H327DY6OShLOSgi+VVRD/CbazcoTZXEGe+LU=";
  };
  # Fixing issue with ddependencies versions
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace 'numpy==2.2.2' 'numpy >= 2.2.2' \
      --replace 'setuptools==75.8.0' 'setuptools >= 75.8.0'
  '';

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  dependencies = with python3.pkgs; [
    certifi
    charset-normalizer
    ffmpeg-python
    future
    idna
    image-go-nord
    markdown-it-py
    mdurl
    numpy
    pick
    pillow
    pygments
    requests
    rich
    setuptools
    urllib3
  ];

  pythonImportsCheck = [
    "factory"
  ];

  meta = {
    description = "Convert any image to the gruvbox pallete";
    homepage = "https://github.com/paulopacitti/gruvbox-factory";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "gruvbox-factory";
  };
}
