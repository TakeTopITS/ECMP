for %%f in (*.*) do (
   chcp 65001 > nul
   echo Converting: %%f
   iconv -f GBK -t UTF-8 "%%f" -o "new_%%f"
)