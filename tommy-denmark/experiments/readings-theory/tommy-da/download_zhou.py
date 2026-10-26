import urllib.request
import os

pdf_url = "https://journals.ametsoc.org/downloadpdf/journals/clim/37/6/JCLI-D-23-0207.1.pdf"
output_pdf = "zhou_paper.pdf"

print("Attempting to download Zhou 2024 paper...")
try:
    req = urllib.request.Request(pdf_url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response:
        with open(output_pdf, 'wb') as f:
            f.write(response.read())
    print("Download successful!")
except Exception as e:
    print(f"Failed to download: {e}")
