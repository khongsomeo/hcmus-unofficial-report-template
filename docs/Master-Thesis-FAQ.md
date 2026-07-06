# 🛠️ FAQ & Troubleshooting

Here are the solutions to common issues when compiling the HCMUS Master's Thesis template.

## 1. Compilation Error: Metadata Field Processing
*   **Symptom**: Compilation fails with error messages inside the title page generation.
*   **Cause**: You put line breaks (`\\`) in a metadata field other than the thesis title.
*   **Solution**: Line breaks (`\\`) are strictly forbidden in all student/supervisor names, departments, programs, and date fields. Remove any `\\` from macros such as `\setHoVaTen`, `\addTenGVHD`, `\setTenBM`, and `\setMSSV`. Only the thesis title `\setTenKL` supports `\\`.

## 2. references are shown as [0] or missing
*   **Symptom**: All citations in the compiled PDF appear as `[0]` or are not printed in the bibliography page.
*   **Cause**: The bibliography was compiled using the legacy `bibtex` command instead of `biber`.
*   **Solution**: Make sure to run `biber main` instead of `bibtex main`, or use the provided build script `bash thesis-build.sh`.

## 3. Reference numbering is reset to [1] for the second section
*   **Symptom**: The Vietnamese bibliography starts at `[1]` and the English bibliography also starts at `[1]`.
*   **Cause**: `defernumbers=true` option is missing in the `biblatex` package configuration.
*   **Solution**: Ensure that your class file includes `defernumbers=true` inside `\RequirePackage[backend=biber,...]{biblatex}`. This is already enabled by default in the latest `hcmusthesis.cls`.

---
*Back to [Home](Home)*
