# 📝 Writing Thesis Information (`thongtinluanvan.tex`)

The thesis information page [thongtinluanvan.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/thesis/master/Thesis/Appendix/thongtinluanvan.tex) uses logical environments. All the margins, signature tables, and page breaks are handled automatically.

```tex
\begin{trangthongtinluanvan}
    \begin{tomtatvi}
        % Viết tóm tắt nội dung luận văn Tiếng Việt tại đây...
    \end{tomtatvi}

    \begin{ketquamoivi}
        % Viết kết quả mới đạt được tại đây...
    \end{ketquamoivi}

    \begin{ungdungvi}
        % Viết khả năng ứng dụng thực tiễn tại đây...
    \end{ungdungvi}
\end{trangthongtinluanvan}

\begin{trangthesisinformation}
    \begin{summaryen}
        % Write English summary here...
    \end{summaryen}

    \begin{noveltyen}
        % Write English novelty here...
    \end{noveltyen}

    \begin{applicationsen}
        % Write English applications here...
    \end{applicationsen}
\end{trangthesisinformation}
```

> [!IMPORTANT]
> **Dynamic Supervisor Lists**
> You can print the formatted, comma-separated list of supervisors anywhere in your chapters by using:
> - `\listSupervisors` (Vietnamese, e.g., *PGS. TS. Nguyễn Văn B và TS. Trần Thị C*)
> - `\listSupervisorsEnglish` (English, e.g., *Assoc. Prof. Dr. Nguyen Van B and Dr. Tran Thi C*)

---
*Back to [Home](Home)*
