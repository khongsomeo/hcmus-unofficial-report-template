# 🔬 HCMUS Scientific Research Templates

This directory contains LaTeX templates designed for academic scientific research projects:
1. **[project-report/](project-report/)**: Final Project Report template (Báo cáo tổng hợp kết quả thực hiện đề tài cấp trường).
2. **[acceptance-form/](acceptance-form/)**: Acceptance Board Request Form (Đơn đề nghị nghiệm thu đề tài).

---

## 🛠️ How to Compile

A unified build helper script [build.sh](build.sh) is provided in this folder.

To compile interactively (choose from a menu):
```bash
bash build.sh
```

Or compile a specific template directly by passing the target name:
- **Compile Project Report**: `bash build.sh report`
- **Compile Acceptance Form**: `bash build.sh form`

---

## 🎨 Template Compilation Modes (Review vs. Print)

Configure these modes via the `\documentclass` options inside the template's main entry file (e.g. `\documentclass[review]{...}` or `\documentclass[print]{...}`):

*   **Review Mode (`review`)**:
    *   **Project Report**: Displays official document labels (`Mẫu T-BCTH-22v1`) and index number labels in tables to aid verification. Signature date is left blank.
    *   **Acceptance Form**: Displays document labels (`Mẫu T-ĐĐNNT-22v1`) and highlights all filled variable fields in **purple text** for easy review.
*   **Print Mode (`print` / `publish`)**:
    *   Hides all document and table index labels for a clean, formal layout.
    *   Acceptance form is printed in standard academic black.
    *   Stamps the current execution date automatically in the report signature block.

---

## 📖 Detailed Documentation

For full configuration steps, layout parameters, and detailed guides, please visit the [Project Wiki Guide](https://github.com/khongsomeo/hcmus-unofficial-report-template/wiki/Scientific-Research).
