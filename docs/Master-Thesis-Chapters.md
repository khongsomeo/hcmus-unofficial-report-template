# 🗂️ Adding New Chapters & Appendices

## 1. Adding New Chapters
Each chapter is stored as a separate `.tex` file inside its own dedicated folder in the `Thesis/` directory (e.g., `Thesis/Chapter1-Introduction/chapter1.tex`).

> [!TIP]
> **Co-locating Resources**
> The purpose of creating a dedicated folder for each chapter is to keep chapter-specific resources (such as figures, images, or raw data tables) self-contained within that directory. This makes managing complex documents much easier and prevents cluttering the global folders.

### How to Add a New Chapter
1. **Create the Folder & File**: Create a folder (e.g., `Thesis/Chapter6-MyNewChapter/`) and create a `.tex` file inside it (e.g., `chapter6.tex`).
2. **Start the Chapter**: Write the chapter header at the top of the file:
   ```tex
   \chapter{Tên Chương Mới}
   \label{Chapter6}
   
   Nội dung chương mới viết ở đây...
   ```
3. **Register in `main.tex`**: Import your chapter inside `main.tex` under the `% Các chương nội dung` block (before the publication/bibliography imports):
   ```tex
   \input{Thesis/Chapter6-MyNewChapter/chapter6}
   ```

---

## 📎 2. Adding Appendices
Appendices are stored inside the `Thesis/Appendix/` directory (e.g., `Thesis/Appendix/appendix-a.tex`).

### How to Add a New Appendix
1. **Create the File**: Create a `.tex` file (e.g., `Thesis/Appendix/appendix-b.tex`).
2. **Start the Appendix**: Use standard `\chapter` tags. In LaTeX, calling `\chapter` after the `\appendix` command automatically formats it as an Appendix (e.g., *Phụ lục B*) instead of a standard chapter:
   ```tex
   \chapter{Bảng Biểu Chi Tiết}
   \label{appendix:b}
   
   Nội dung phụ lục viết ở đây...
   ```
3. **Register in `main.tex`**: Import your appendix file inside `main.tex` under the `% Phần phụ lục` block (at the very bottom of the document):
   ```tex
   \appendix
   \input{Thesis/Appendix/appendix-a}
   \input{Thesis/Appendix/appendix-b}
   ```

---
*Back to [Home](Home)*
