@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" > NUL
if errorlevel 1 (
    echo vcvars64.bat failed
    exit /b 1
)
call "C:\Program Files (x86)\Intel\oneAPI\compiler\latest\env\vars.bat" intel64
if errorlevel 1 (
    echo ifx vars.bat failed
    exit /b 1
)
call "C:\Program Files (x86)\Intel\oneAPI\mkl\latest\env\vars.bat" intel64
if errorlevel 1 (
    echo mkl vars.bat failed
    exit /b 1
)
set BLA_VENDOR=Intel10_64lp_seq
echo === Toolchain ===
where cmake
where ifx
where cl
echo MKLROOT=%MKLROOT%
echo BLA_VENDOR=%BLA_VENDOR%
echo === Building ===
set "VIRTUAL_ENV=%CD%\.venv"
uv pip install --no-build-isolation -ve .
