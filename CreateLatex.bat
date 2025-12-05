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

:: --- 3. Tạo file .gitignore ---
echo *.aux > .gitignore
echo *.log >> .gitignore
echo *.out >> .gitignore
echo *.toc >> .gitignore
echo *.synctex.gz >> .gitignore
echo *.pdf >> .gitignore
echo *.fls >> .gitignore
echo *.fdb_latexmk >> .gitignore
echo *.bbl >> .gitignore
echo *.blg >> .gitignore

:: --- 4. Tạo file bibliography.bib ---
type nul > bibliography.bib

:: --- 5. Tạo file preamble.tex ---
echo \usepackage{graphicx} > preamble.tex
echo \usepackage{amsmath} >> preamble.tex
echo \usepackage{hyperref} >> preamble.tex
echo \usepackage{geometry} >> preamble.tex
echo \geometry{a4paper, margin=1in} >> preamble.tex
echo. >> preamble.tex
echo %% --- Dinh nghia cac goi bo tro khac o day --- >> preamble.tex

:: --- 6. Tạo file main.tex (FIXED: Đã sửa lỗi ghi file) ---
echo \documentclass[12pt, a4paper]{article} > main.tex
echo. >> main.tex
echo %% ========================================== >> main.tex
echo %% CAU HINH NGON NGU (LANGUAGE SETUP) >> main.tex
echo %% Comment/Uncomment vung tuong ung >> main.tex
echo %% ========================================== >> main.tex
echo. >> main.tex
echo %% --- OPTION 1: TIENG ANH (ENGLISH) --- >> main.tex
echo \usepackage[english]{babel} >> main.tex
echo. >> main.tex
echo %% --- OPTION 2: TIENG VIET (VIETNAMESE) --- >> main.tex
echo %% \usepackage[utf8]{inputenc} >> main.tex
echo %% \usepackage[T5]{fontenc} >> main.tex
echo %% \usepackage[vietnamese]{babel} >> main.tex
echo. >> main.tex
echo %% ========================================== >> main.tex
echo. >> main.tex
echo \input{preamble} >> main.tex
echo \addbibresource{bibliography.bib} >> main.tex
echo. >> main.tex
echo \title{Ten De Tai Nghien Cuu} >> main.tex
echo \author{Ten Tac Gia} >> main.tex
echo \date{\today} >> main.tex
echo. >> main.tex
echo \begin{document} >> main.tex
echo. >> main.tex
echo \maketitle >> main.tex
echo. >> main.tex
echo \begin{abstract} >> main.tex
echo     \input{sections/00_abstract} >> main.tex
echo \end{abstract} >> main.tex
echo. >> main.tex
echo %% --- Noi dung chinh --- >> main.tex
echo \input{sections/01_introduction} >> main.tex
echo \input{sections/02_related_work} >> main.tex
echo \input{sections/03_methodology} >> main.tex
echo \input{sections/04_experiments} >> main.tex
echo \input{sections/05_results} >> main.tex
echo \input{sections/06_conclusion} >> main.tex
echo. >> main.tex
echo %% --- Tai lieu tham khao --- >> main.tex
echo \bibliographystyle{plain} >> main.tex
echo \bibliography{bibliography} >> main.tex
echo. >> main.tex
echo \end{document} >> main.tex

:: --- 7. Tạo các file nội dung ---
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