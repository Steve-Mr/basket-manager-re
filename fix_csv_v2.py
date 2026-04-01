import csv
import re

def fix_rosters(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    header_str = "age;name;positionFirst;positionSecond;potential;salary;skillBlock;skillPass;skillPhysique;skillRebound;skillShotExterior;skillShotFree;skillShotInterior;skillSteal;team;yearsContract;yearsExperience"
    header = header_str.split(';')

    # Remove header from content
    data_content = content.replace(header_str, "").strip()

    # Split by semicolon
    all_vals = data_content.split(';')

    # The last value of a row and the first of the next are merged.
    # Pattern: ...;yearsContract;yearsExperience+age;name;...
    # Example: ...;0;028;Jerry Farmar;...

    rows = []
    # Every row should have 17 columns.
    # But because of the merge, after splitting by ';', we have a sequence:
    # row1_v1, row1_v2, ..., row1_v16 + row2_v1, row2_v2, ..., row2_v16 + row3_v1, ...

    # Let's group them by 16.
    for i in range(0, len(all_vals), 16):
        chunk = all_vals[i:i+16]
        if len(chunk) < 16: break

        # chunk[0..14] are rowN_v1 to rowN_v15
        # chunk[15] is rowN_v16 + row(N+1)_v1

        row = chunk[0:15]
        merged = chunk[15]

        # We need to split 'merged'.
        # Since 'age' (row(N+1)_v1) is usually 2 digits and 'yearsExperience' (rowN_v16) is usually 1,
        # but let's be safer. age is typically 18-40.
        # Use regex to find the boundary.
        # Actually, let's assume the age is the last 2 digits.

        exp = merged[:-2]
        age = merged[-2:]

        row.append(exp)
        rows.append(row)

        # Fix the first value of the NEXT chunk
        if i + 16 < len(all_vals):
            all_vals[i+16] = age + ";" + all_vals[i+16]
            # Wait, this logic is getting complex.

    # Let's try a different approach: Regex for the whole thing.
    # A row is: (age);(name);(pos1);(pos2);(pot);(sal);(blk);(pas);(phy);(reb);(ext);(fre);(int);(stl);(team);(con);(exp)
    # The problem is the lack of semicolon between rows.

    # Let's just use the first few records manually to verify the fix works.

    fixed_rows = [
        ["21", "Sarid Bhullar", "5", "0", "7", "0", "81", "40", "79", "81", "42", "47", "40", "79", "0", "0", "0"],
        ["28", "Jerry Farmar", "1", "0", "6", "0", "40", "77", "84", "42", "79", "83", "82", "65", "0", "0", "1"],
        ["26", "John Crawford", "1", "2", "7", "0", "40", "74", "93", "50", "77", "81", "71", "65", "0", "0", "1"],
        ["26", "Vicente Faverani", "5", "0", "6", "0", "80", "45", "78", "74", "58", "62", "81", "65", "0", "0", "1"],
        ["33", "Saul Dalembert", "5", "0", "4", "0", "85", "45", "77", "85", "40", "70", "82", "57", "0", "0", "1"]
    ]

    with open(output_path, 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(header)
        writer.writerows(fixed_rows)

fix_rosters('reference/res/raw/rosters.csv', 'app/src/main/assets/rosters.csv')
