import re

with open('/home/abhi/code/defence/defence/learning/deep-stats-learning/foundational-training-resource-map-and-sprint/sprints/tommy-da/part_12.md', 'r') as f:
    content = f.read()

cleaned = []
for line in content.split('\n'):
    if line.startswith('The following code') or line.startswith('<line_number>'):
        continue
    line = re.sub(r'^\d+:\s', '', line).strip()
    if line:
        cleaned.append(line)

text = ' '.join(cleaned)

parts = re.split(r'(\d{4}[a-z]?\.) ', text)
out_lines = []
current_ref = ""
for i in range(0, len(parts)-1, 2):
    current_ref += parts[i] + parts[i+1]
    out_lines.append(current_ref.strip())
    current_ref = ""
if len(parts) % 2 != 0:
    current_ref += parts[-1]
if current_ref.strip():
    out_lines.append(current_ref.strip())

# Some entries might just be hanging ends, e.g. "Soc., 137, 435-451, 2011."
# I will bold the start if it looks like an author list.
def bold_authors(ref):
    # authors usually end with a comma before the title.
    # We can approximate by finding the first word that isn't a name/initial and isn't "and".
    # simpler: just bold the whole reference up to the first colon or year? No.
    # Let's bold the first two comma separated parts if they look like names.
    return ref

with open('refactored_part_12.md', 'w') as f:
    f.write("## References\n\n")
    for r in out_lines:
        if len(r) > 10:
            # Fix spacing issues
            r = re.sub(r'\s+', ' ', r)
            r = re.sub(r' ,', ',', r)
            r = re.sub(r' \.', '.', r)
            
            # Simple author bolding: try to bold up to the first title word (first word that has 3+ lowercase letters and is not 'and')
            # Let's just output as is, bulleted.
            f.write(f"- {r}\n")

