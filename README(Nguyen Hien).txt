==================================== Nguyen Hien ==================================== 
 Developer: Trần Nguyên Hiền
 Faculty: Electronics and Communication Engineering
=====================================================================================
FlatCAM 8.994 - Hướng dẫn cài đặt và chạy trên Windows (Python 3.8)

Link *********** Tải file FlatCAM Beta 8.994 (.zip):*********** 
  https://bitbucket.org/jpcgt/flatcam/downloads/FlatCAM_beta_8.994_sources.zip

1. Cài đặt Python 3.8.10
------------------------------------------------------------------
- Tải Python 3.8.10 (Windows x86-64) từ link chính thức:
  https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe
- Cài đặt, tick "Add Python 3.8 to PATH".
- Kiểm tra bằng lệnh:
    py -0
  Sẽ thấy danh sách các Python cài trên máy, có cả 3.8.

2. Tạo môi trường ảo cho FlatCAM
-----------------------------------------
- Mở CMD và đi tới thư mục FlatCAM:
  Ex: cd /d E:\ALL DESIGN CAM CNC\FlatCAM\FlatCAM_beta_8.994_sources
- Tạo môi trường ảo bằng Python 3.8:
    py -3.8 -m venv env38
- Kích hoạt môi trường ảo:
    env38\Scripts\activate

3. Cài GDAL phù hợp
-------------------------------------------------------------------------------------
- Tải file WHL phù hợp cho Python 3.8:
  https://download.lfd.uci.edu/pythonlibs/archived/GDAL-3.4.3-cp38-cp38-win_amd64.whl
- Copy vào thư mục FlatCAM (vào folder FlatCAM_beta_8.994_sources), sau đó cài:
    python -m pip install --upgrade pip
    pip install GDAL-3.4.3-cp38-cp38-win_amd64.whl

4. Cài các thư viện còn lại
----------------------------------------------
- Cài tất cả dependencies từ requirements.txt:   
    pip3 install -r requirements.txt
    pip install pywin32

5. Chỉnh phiên bản thư viện để tránh lỗi
----------------------------------------------
- Vispy: FlatCAM cần vispy cũ, cài bản 0.6.6:
    pip uninstall vispy -y
    pip install vispy==0.6.6

- NumPy: dùng bản 1.23.5 để giữ lại np.bool:
    pip uninstall numpy -y
    pip install numpy==1.23.5

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
    try:
        from ezdxf.math.vector import Vector as ezdxf_vector
    except ImportError:
        from ezdxf.math import Vec3 as ezdxf_vector

7. Chạy FlatCAM
---------------------------
- Trong môi trường ảo env38:
    python FlatCAM.py

8. Ghi chú thêm
---------------------------------------
- Nếu pip báo cần nâng cấp:
    python -m pip install --upgrade pip

- Nếu muốn xóa môi trường ảo:
    deactivate
    rmdir /s /q env38
Ví dụ: rmdir /s /q C:\Users\ACER\env38
========================== Toi La Hien Chuc Ban Thanh Cong ========================== 
