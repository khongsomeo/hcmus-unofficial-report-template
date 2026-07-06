# 📄 Structure of `main.tex`

The body of [main.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/thesis/master/main.tex) is clean and focuses entirely on the logical structure of your thesis, hiding complex LaTeX resets and styles under the hood:

```latex
\begin{document}

% 1. Trang bìa (không đánh số trang)
\makethesiscover

% Bắt đầu đánh số trang La Mã (i, ii, iii, ...) cho phần giới thiệu đầu
\pagenumbering{roman}

% 2. Lời cam đoan
\inputreassurances

% 3. Lời cảm ơn
\inputthanks

% 4. Các trang mục lục và danh mục
\maketableofcontents
\makelistoffigures
\makelistoftables
\makeglossaryofacronyms

% 5. Trang thông tin luận văn (Tiếng Việt & Tiếng Anh)
% [!] Tự động định dạng các đề mục của trang thông tin và khôi phục khi hoàn tất
\inputthesisinfo

% ========================================================================================= %
% CÁC CHƯƠNG NỘI DUNG
% ========================================================================================= %

% Bắt đầu đánh số trang Ả Rập (1, 2, 3, ...) từ Chương 1
\pagenumbering{arabic}

\input{Thesis/Chapter1-Introduction/chapter1}
\input{Thesis/Chapter2-RelatedWorks/chapter2}
\input{Thesis/Chapter3/chapter3}
\input{Thesis/Chapter4/chapter4}
\input{Thesis/Chapter5-Conclusion/chapter5}

% ========================================================================================= %
% CÔNG TRÌNH & TÀI LIỆU THAM KHẢO & PHỤ LỤC
% ========================================================================================= %

% Danh mục công trình của tác giả (nếu không có thì comment dòng này)
\inputpublications

% In tài liệu tham khảo (Tự động chia nhóm Tiếng Việt & Tiếng Anh với số thứ tự liên tục)
\printthesisbibliography

% Phần phụ lục (nếu có)
\appendix
\input{Thesis/Appendix/appendix-a}

\end{document}
```

---
*Back to [Home](Home)*
