@echo off
echo ====== Install Library FlatCAM 8.994 (Windows) ======
echo Installing Python 3.9 Virtual Environment...
py -3.9 -m venv env39
echo Installed Successfully
call env39\Scripts\activate
echo Virtual Environment Activation Successful
python -m pip install --upgrade pip
python -m pip install GDAL-3.4.3-cp39-cp39-win_amd64.whl
python -m pip install -r requirements.txt
python -m pip install pywin32
echo ====================== Finish =======================
pause