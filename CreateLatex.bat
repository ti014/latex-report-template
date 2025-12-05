@echo off
setlocal enabledelayedexpansion

:: --- 1. Nhập tên dự án ---
set /p "ProjectName=Nhap ten du an (se tao thu muc moi): "
if "%ProjectName%"=="" set "ProjectName=paper"

echo Dang khoi tao du an: %ProjectName%...
mkdir "%ProjectName%"
cd "%ProjectName%"

:: --- 2. Tạo cấu trúc thư mục ---
mkdir figures
mkdir sections
mkdir tables

:: --- 3. Tạo file .gitignore (Rất quan trọng cho Latex) ---
(
echo *.aux
echo *.log
echo *.out
echo *.toc
echo *.synctex.gz
echo *.pdf
echo *.fls
echo *.fdb_latexmk
echo *.bbl
echo *.blg
) > .gitignore

:: --- 4. Tạo file bibliography.bib ---
type nul > bibliography.bib

:: --- 5. Tạo file preamble.tex (Các gói lệnh dùng chung) ---
(
echo \usepackage{graphicx}      %% Xu ly hinh anh
echo \usepackage{amsmath}       %% Xu ly toan hoc
echo \usepackage{hyperref}      %% Tao lien ket
echo \usepackage{geometry}      %% Can chinh le
echo \geometry{a4paper, margin=1in}
echo.
echo %% --- Dinh nghia cac goi bo tro khac o day ---
) > preamble.tex

:: --- 6. Tạo file main.tex (Cấu hình song ngữ EN/VI) ---
(
echo \documentclass[12pt, a4paper]{article}
echo.
echo %% ==========================================
echo %% CAU HINH NGON NGU (LANGUAGE SETUP)
echo %% Comment/Uncomment vung tuong ung
echo %% ==========================================
echo.
echo %% --- OPTION 1: TIENG ANH (ENGLISH) ---
echo \usepackage[english]{babel}
echo.
echo %% --- OPTION 2: TIENG VIET (VIETNAMESE) ---
echo %% \usepackage[utf8]{inputenc}
echo %% \usepackage[T5]{fontenc}
echo %% \usepackage[vietnamese]{babel}
echo.
echo %% ==========================================
echo.
echo \input{preamble}
echo \addbibresource{bibliography.bib}
echo.
echo \title{Ten De Tai Nghien Cuu}
echo \author{Ten Tac Gia}
echo \date{\today}
echo.
echo \begin{document}
echo.
echo \maketitle
echo.
echo \begin{abstract}
echo     \input{sections/00_abstract}
echo \end{abstract}
echo.
echo %% --- Noi dung chinh ---
echo \input{sections/01_introduction}
echo \input{sections/02_related_work}
echo \input{sections/03_methodology}
echo \input{sections/04_experiments}
echo \input{sections/05_results}
echo \input{sections/06_conclusion}
echo.
echo %% --- Tai lieu tham khao ---
echo \bibliographystyle{plain}
echo \bibliography{bibliography}
echo.
echo \end{document}
) > main.tex

:: --- 7. Tạo các file nội dung trong thư mục sections ---
echo %% Tom tat noi dung > sections\00_abstract.tex
echo \section{Introduction} > sections\01_introduction.tex
echo \section{Related Work} > sections\02_related_work.tex
echo \section{Methodology} > sections\03_methodology.tex
echo \section{Experiments} > sections\04_experiments.tex
echo \section{Results} > sections\05_results.tex
echo \section{Conclusion} > sections\06_conclusion.tex

echo.
echo ========================================================
echo   DA KHOI TAO THANH CONG DU AN: %ProjectName%
echo ========================================================
pause