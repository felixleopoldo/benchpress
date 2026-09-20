# syntax=docker/dockerfile:1
#
# Restores and builds LGAI-Research/breaking-bad. The public repository ships
# without a few files that depend on external projects, for licensing
# reasons; this Dockerfile fills them in, always fetching external code fresh
# from its original repository at build time rather than rewriting it from
# memory.
#
# Do not push an image built from this file to a public registry: it embeds
# XGES's BICScorer.h/.cpp, which XGES itself does not license for
# redistribution. Restored here for local use only.
#
# Build:   docker build -t breaking-bad .
# Shell:   docker run --rm -it breaking-bad

FROM ubuntu:24.04

# ---------------------------------------------------------------------------
# Section 3: system prerequisites.
#
# R comes from apt, not conda: conda-forge's r-bnlearn has no linux-aarch64
# build, which would otherwise force this image under amd64 emulation on
# arm64 hosts (e.g. Apple Silicon). Using it also means there is only ever
# one R on the image, so no dual-R/LD_LIBRARY_PATH conflict can occur here.
#
# Ubuntu 24.04's own r-base package is stuck at R 4.3.3, too old for CRAN's
# current bnlearn (>= 4.4.0 required), so R is pulled from CRAN's official
# apt repository instead, pinned to 4.5.2 -- the version this was tested
# against, available there for both amd64 and arm64.
# ---------------------------------------------------------------------------
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential cmake zlib1g-dev git ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*

ARG R_VERSION=4.5.2-1.2404.0
RUN curl -fsSL https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
        | gpg --dearmor -o /usr/share/keyrings/r-project.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/" \
        > /etc/apt/sources.list.d/r-project.list \
    && apt-get update && apt-get install -y --no-install-recommends \
        "r-base-core=${R_VERSION}" "r-base-dev=${R_VERSION}" \
    && rm -rf /var/lib/apt/lists/*

# bnlearn from CRAN (apt's R, native arch -- the piece conda-forge can't
# provide on arm64). No specific bnlearn version is pinned; CRAN's current
# release is used.
RUN Rscript -e 'install.packages("bnlearn", repos="https://cloud.r-project.org")'

# ---------------------------------------------------------------------------
# Miniforge: conda + conda-forge channel + libmamba solver by default.
# Picks the installer matching the build host's architecture (conda-forge
# ships both linux-64 and linux-aarch64 builds of every package this project
# needs) rather than hardcoding x86_64, which fails under Rosetta/QEMU
# emulation on arm64 hosts (e.g. Apple Silicon).
# ---------------------------------------------------------------------------
RUN <<'BASHEOF'
set -e
case "$(uname -m)" in
    x86_64) MF_ARCH=x86_64 ;;
    aarch64|arm64) MF_ARCH=aarch64 ;;
    *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac
curl -fsSL -o /tmp/miniforge.sh \
    "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-${MF_ARCH}.sh"
bash /tmp/miniforge.sh -b -p /opt/conda
rm /tmp/miniforge.sh
BASHEOF
ENV PATH=/opt/conda/bin:$PATH

# ---------------------------------------------------------------------------
# Pinned commits (the versions this was tested against)
# ---------------------------------------------------------------------------
ARG SPDLOG_COMMIT=57cb5fb
ARG CNPY_COMMIT=4e8810b
ARG XGES_COMMIT=3c60d7a

# ---------------------------------------------------------------------------
# The public repository itself
# ---------------------------------------------------------------------------
WORKDIR /repo
RUN git clone --depth 1 https://github.com/LGAI-Research/breaking-bad.git .

# ---------------------------------------------------------------------------
# Conda environment with the C++ dependencies (R comes from apt above, not
# from here -- see the note earlier in this file)
# ---------------------------------------------------------------------------
RUN conda create -n breaking-bad --override-channels -c conda-forge --solver=libmamba \
        python=3.10 "numpy=1.26" boost openblas eigen -y \
    && conda clean -afy

# CMAKE_PREFIX_PATH: lets CMake find the env's Boost/Eigen config files
# without a `conda activate` shell. LD_LIBRARY_PATH: env's shared libs
# (OpenBLAS etc.) at runtime.
ENV CONDA_DEFAULT_ENV=breaking-bad \
    CONDA_PREFIX=/opt/conda/envs/breaking-bad \
    PATH=/opt/conda/envs/breaking-bad/bin:/opt/conda/bin:$PATH \
    CMAKE_PREFIX_PATH=/opt/conda/envs/breaking-bad \
    LD_LIBRARY_PATH=/opt/conda/envs/breaking-bad/lib \
    PYTHONNOUSERSITE=1

# ---------------------------------------------------------------------------
# 4.2 Python packages
# ---------------------------------------------------------------------------
WORKDIR /repo/breaking-bad
RUN pip install --no-cache-dir -r requirements.txt

# Check the Python/R setup: sempler imports rpy2 internally, so rpy2 must
# load R and see bnlearn. Fails loudly rather than silently if it doesn't.
RUN <<'BASHEOF'
set -e
python -c "import sempler, numba, rpy2.robjects as ro; print('R:', ro.r('R.version.string')[0])"
python -c "import rpy2.robjects.packages as rp; rp.importr('bnlearn'); print('bnlearn: OK')"
BASHEOF

# ---------------------------------------------------------------------------
# 4.3 spdlog and cnpy
# ---------------------------------------------------------------------------
WORKDIR /repo/breaking-bad/lib
RUN git clone https://github.com/gabime/spdlog.git \
    && git -C spdlog checkout ${SPDLOG_COMMIT} \
    && git clone https://github.com/rogersce/cnpy.git \
    && git -C cnpy checkout ${CNPY_COMMIT}

# ---------------------------------------------------------------------------
# 4.4(a) Restore the BIC scorer sources from XGES, unmodified, plus the two
# verbatim pieces from XGES's main.cpp that BICScoreloader.cpp needs
# ---------------------------------------------------------------------------
RUN git clone https://github.com/ANazaret/XGES.git /tmp/xges \
    && git -C /tmp/xges checkout ${XGES_COMMIT} \
    && cp /tmp/xges/src-cpp/BICScorer.h /tmp/xges/src-cpp/BICScorer.cpp /repo/breaking-bad/src/ \
    && sed -n '19,26p' /tmp/xges/src-cpp/main.cpp > /tmp/rowmajor_loader.txt \
    && grep -q 'RowMajorMatrixXd' /tmp/rowmajor_loader.txt \
    && grep -q 'load_npy' /tmp/rowmajor_loader.txt \
    && rm -rf /tmp/xges

# ---------------------------------------------------------------------------
# 4.4(b) Complete breaking-bad/src/BICScoreloader.cpp
# (one of only two files in the repo this build modifies)
# ---------------------------------------------------------------------------
RUN <<'PYEOF'
#!/usr/bin/env python3
import pathlib

path = pathlib.Path("/repo/breaking-bad/src/BICScoreloader.cpp")
src = path.read_text()
loader = pathlib.Path("/tmp/rowmajor_loader.txt").read_text().rstrip("\n")

old_include = '#include "ScorerInterface.h"\n'
new_include = (
    '#include "ScorerInterface.h"\n'
    '#include "BICScorer.h"\n'
    '#include "cnpy/cnpy.h"\n'
    '\n'
    f'{loader}\n'
)
assert src.count(old_include) == 1, "ScorerInterface.h include not found (or not unique)"
src = src.replace(old_include, new_include, 1)

old_body = '''std::unique_ptr<ScorerInterface>
make_bic_scorer_from_npy(const std::string &npy_path, double alpha,
                         int &n_variables, int &n_samples) {
    // TODO: implement following steps 2-3 in the header comment above.
    (void) npy_path;
    (void) alpha;
    (void) n_variables;
    (void) n_samples;
    throw std::runtime_error(
            "make_bic_scorer_from_npy() is not implemented. Complete "
            "src/BICScoreloader.cpp (see the instructions at the top of the file "
            "and the README section \\"BIC scorer\\").");
}
'''
new_body = '''std::unique_ptr<ScorerInterface>
make_bic_scorer_from_npy(const std::string &npy_path, double alpha,
                         int &n_variables, int &n_samples) {
    RowMajorMatrixXd matrix = load_npy<double>(npy_path);
    n_variables = static_cast<int>(matrix.cols());
    n_samples = static_cast<int>(matrix.rows());
    return std::make_unique<BICScorer>(matrix, alpha);
}
'''
assert src.count(old_body) == 1, "TODO function body not found (or not unique)"
src = src.replace(old_body, new_body, 1)

path.write_text(src)
print(src)
PYEOF

# ---------------------------------------------------------------------------
# 4.4(c) Add Eigen to breaking-bad/src/CMakeLists.txt
# (the second, and last, file this build modifies)
# ---------------------------------------------------------------------------
RUN printf '\nfind_package(Eigen3 REQUIRED NO_MODULE)\ntarget_link_libraries(${BINARY} PRIVATE Eigen3::Eigen)\n' \
        >> /repo/breaking-bad/src/CMakeLists.txt

# ---------------------------------------------------------------------------
# 4.5 Build
# ---------------------------------------------------------------------------
WORKDIR /repo/breaking-bad
RUN mkdir -p build \
    && cd build \
    && cmake .. \
    && make -j"$(nproc)"

WORKDIR /repo/breaking-bad
CMD ["/bin/bash"]
