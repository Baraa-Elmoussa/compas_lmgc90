@echo off
call "C:\ProgramData\anaconda3\condabin\conda.bat" activate compas_lmgc90-dev
if errorlevel 1 (
    echo conda activate failed
    exit /b 1
)
echo === Toolchain ===
where cmake
where gcc
where gfortran
where python
python --version
echo === Building ===
pip install --no-build-isolation -ve .
