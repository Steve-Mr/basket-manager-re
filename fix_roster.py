import csv

def fix_roster():
    with open('reference/res/raw/rosters.csv', 'r', encoding='utf-8') as f:
        content = f.read()

    # Original file seems to have columns like age;name;...;yearsExperience
    # and then the next row starts immediately.
    # We need to find where a new row starts.
    # Based on the bash output, "yearsExperience21" suggests the last column and first column merged.

    header = "age;name;positionFirst;positionSecond;potential;salary;skillBlock;skillPass;skillPhysique;skillRebound;skillShotExterior;skillShotFree;skillShotInterior;skillSteal;team;yearsContract;yearsExperience"
    cols = header.split(';')
    num_cols = len(cols)

    # Try to split by ';'
    parts = content.replace('\r', '').split(';')

    # The first part is 'age', last of header is 'yearsExperience21'
    # Actually the very first part of content is the header names.

    data_parts = []
    # Skip header parts
    # The content actually starts with the header.
    # Let's find the first data value.
    # header is 17 columns.

    all_parts = []
    for p in parts:
        if '\n' in p:
             all_parts.extend(p.split('\n'))
        else:
             all_parts.append(p)

    # Clean empty parts
    all_parts = [p.strip() for p in all_parts if p.strip()]

    # Based on "yearsExperience21", it seems some parts are joined.
    # Let's try a different approach.
    import re
    # Match numbers at the end of a string that should have been a separate field
    # But wait, name can contain numbers? Unlikely.
    # The last field is yearsExperience (Int), first is age (Int).

    # Let's look at the structure again.
    # Every 17 fields is a row.
    # If the 17th field is "021", it means yearsExperience is 0 and age is 21.

    fixed_rows = []
    current_row = []

    # Re-read raw to be safe
    with open('reference/res/raw/rosters.csv', 'r', encoding='utf-8') as f:
        raw_parts = f.read().replace('\r', '').split(';')

    # Clean header from parts
    # age;name;...;yearsExperience
    # raw_parts[0] is 'age'
    # raw_parts[16] is 'yearsExperience21' (or similar)

    actual_data_start_index = 16
    first_val_with_age = raw_parts[16]
    # Split 'yearsExperience21' into 'yearsExperience' and '21'
    # But it might be 'yearsExperience' then '21' in the next part if split correctly?
    # No, the bash output showed 'yearsExperience21'.

    # Let's just extract all values and group them by 17.
    # We need to handle the joined fields.

    all_values = []
    # First 16 header parts
    for i in range(16):
        all_values.append(raw_parts[i])

    # The 17th part and onwards
    for i in range(16, len(raw_parts)):
        part = raw_parts[i]
        # Check if it's a join of a number and a start of next record
        # A record ends with yearsExperience (Int) and starts with age (Int)
        # However, looking at the data, it might be that it's just missing a semicolon.

        # Simple heuristic: if it's the 17th field, split it.
        # But we don't know the exact split point.
        # Most ages are 2 digits.

        # Let's look at the sample: "yearsExperience21"
        # "yearsExperience" is the header name.
        if i == 16:
            all_values.append("yearsExperience")
            all_values.append(part.replace("yearsExperience", ""))
        else:
            # For subsequent rows, the join is [yearsExperience][age]
            # e.g. "128" -> yearsExperience 1, age 28
            # or "021" -> yearsExperience 0, age 21
            if len(part) >= 3 and part.isdigit():
                # yearsExperience is likely 1 digit (0-9), age is 2 digits.
                all_values.append(part[:-2])
                all_values.append(part[-2:])
            else:
                all_values.append(part)

    # Now group by 17
    rows = []
    for i in range(0, len(all_values), 17):
        rows.append(all_values[i:i+17])

    with open('app/src/main/assets/rosters.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        for row in rows:
            if len(row) == 17:
                writer.writerow(row)

if __name__ == "__main__":
    fix_roster()
