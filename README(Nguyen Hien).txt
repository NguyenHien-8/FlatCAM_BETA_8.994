==================================== Nguyen Hien ==================================== 
 Developer: Trần Nguyên Hiền
 Faculty: Electronics and Communication Engineering
=====================================================================================
- Windows
************************ Tải file FlatCAM Beta 8.994 ************************ 
  https://bitbucket.org/jpcgt/flatcam/downloads/FlatCAM_beta_8.994_sources.zip

===========================================================
       Chạy file FlatCAM_Config.bat (trên PowerShell)
===========================================================
1. Cài đặt Python 3.9.10
------------------------------------------------------------------
- Tải Python 3.9.10 (Windows x86-64) từ link chính thức:
  https://www.python.org/ftp/python/3.9.10/python-3.9.10-amd64.exe
- Cài đặt, tick "Add Python 3.9 to PATH".
- Kiểm tra bằng lệnh:
    py -0
  Sẽ thấy danh sách các Python cài trên máy, có cả 3.9.

2. Tạo môi trường ảo cho FlatCAM
------------------------------------------------------------------
- Mở CMD và đi tới thư mục FlatCAM:
  Ex: E:\ALL DESIGN CAM CNC\FlatCAM\REPOSITORY\FlatCAM_BETA_8.994
- Tạo môi trường ảo bằng Python 3.9:
    py -3.9 -m venv env39

- Kích hoạt môi trường ảo:
    env39\Scripts\activate
3. Cài GDAL phù hợp
-------------------------------------------------------------------------------------
- Tải file WHL phù hợp cho Python 3.9:
  https://wheelhouse.openquake.org/v3/windows/py39/GDAL-3.4.3-cp39-cp39-win_amd64.whl
- Copy vào thư mục FlatCAM (vào folder FlatCAM_beta_8.994_sources), sau đó cài:
    python -m pip install --upgrade pip
    pip install GDAL-3.4.3-cp39-cp39-win_amd64.whl
4. Cài các thư viện còn lại
----------------------------------------------
- Cài tất cả dependencies từ requirements.txt:   
    pip install -r requirements.txt
    pip install pywin32

5. Chỉnh phiên bản thư viện để tránh lỗi
----------------------------------------------
- Vispy: FlatCAM cần vispy cũ, cài bản 0.6.6:
    pip uninstall vispy -y
    pip install vispy==0.6.6
  Kiểm Tra: pip show vispy

- NumPy: dùng bản 1.23.5 để giữ lại np.bool:
    pip uninstall numpy -y
    pip install numpy==1.23.5
  Kiểm Tra: pip show numpy

- Nếu thiếu module thì cài riêng, ví dụ:
    pip install simplejson shapely
    pip install shapely
    pip install reportlab svglib
    pip install svglib
    pip install PyOpenGL PyOpenGL_accelerate
    pip install vispy.visuals.markers


6. Sửa lỗi ezdxf (nếu gặp)
-----------------------------------------------------------
- Mở file: appParsers\ParseDXF.py
- Tìm dòng:
    from ezdxf.math.vector import Vector as ezdxf_vector
- Thay bằng:
    from ezdxf.math import Vec3 as ezdxf_vector

7. Chạy FlatCAM
---------------------------
- Chạy python FlatCAM.py
- Hoặc Chạy Run_FlatCAM.bat
8. Ghi chú thêm
---------------------------------------
- Nếu pip báo cần nâng cấp:
    python -m pip install --upgrade pip

- Lệnh xóa git và môi trường ảo:
  +Nếu đang ở CMD:
    rmdir /s /q .git
    rmdir /s /q env39
  +Nếu đang ở PowerShell:
    ri -r -fo .\env39  (Remove-Item -Recurse -Force env39)
    ri -r -fo .\.git   (Remove-Item -Recurse -Force .git)
Ví dụ: rmdir /s /q C:\Users\ACER\env39
========================== Toi La Hien Chuc Ban Thanh Cong ========================== 
