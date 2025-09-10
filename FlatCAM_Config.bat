@echo off
echo ====== Install Library FlatCAM 8.994 (Windows) ======
py -3.9 -m venv env39
call env39\Scripts\activate
python -m pip install --upgrade pip
python -m pip install GDAL-3.4.3-cp39-cp39-win_amd64.whl
python -m pip install -r requirements.txt
python -m pip install pywin32
echo ====================== Finish =======================
pause