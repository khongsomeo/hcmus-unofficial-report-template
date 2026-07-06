# 📄 Managing Publications (`publish.tex`)

The list of candidate publications is managed in [Thesis/Appendix/publish.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/thesis/master/Thesis/Appendix/publish.tex).

### How to Add a New Publication
Add a new item inside the `enumerate` block using `\item[CT-xx]` and `\hypertarget`:
```tex
\item[CT-02] \hypertarget{pub:CT-02}{} \textbf{Họ Tên Tác Giả}, \textit{Tên bài báo mới}. Tên tạp chí/hội nghị, Năm.
```

> [!NOTE]
> **Understanding Labels**
> - The prefix `CT` stands for **"Công trình"** (work). You are free to change this prefix to whatever you prefer (e.g., `BB` for *Bài báo* or `PUB` for *Publication*).
> - Make sure to keep the labels consistent between `\item[...]` and the `\hypertarget{pub:...}{}` anchor so that any cross-references or hyperlinks point to the correct items.

### How to Remove the Publications Page
If you do not have any publications yet, simply comment out or remove this line in `main.tex`:
```tex
% \inputpublications
```

---
*Back to [Home](Home)*
