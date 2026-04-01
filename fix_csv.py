import csv

def fix_rosters(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Split by semicolon
    parts = content.split(';')
    # There are 17 columns
    num_cols = 17

    rows = []
    # Header is the first 17 parts, but the 17th part 'yearsExperience' might be merged with the first value of next row
    # Let's be more precise.
    # The header names are known.
    header = ["age", "name", "positionFirst", "positionSecond", "potential", "salary", "skillBlock", "skillPass", "skillPhysique", "skillRebound", "skillShotExterior", "skillShotFree", "skillShotInterior", "skillSteal", "team", "yearsContract", "yearsExperience"]

    # Wait, the content actually looks like: "...yearsExperience21;Sarid Bhullar;..."
    # 'yearsExperience' is the last column name. '21' is the first data value.
    # It seems the semicolons only separate fields WITHIN a row, but not necessarily between rows?
    # No, look at the sample: "...0;0;028;Jerry Farmar..."
    # Row 1 ends with 0;0;0 (yearsExperience is 0). Row 2 starts with 28.
    # So '028' is '0' (last field of row 1) + '28' (first field of row 2).

    # This is tricky because the last field of a row and the first field of the next row are merged.
    # But we know the header has 17 fields.
    # Let's find where the split happens.

    # Re-reading the sample:
    # yearsExperience21;Sarid Bhullar;5;0;7;0;81;40;79;81;42;47;40;79;0;0;028;Jerry Farmar;...

    # Split by semicolon gives:
    # ['age', 'name', ..., 'yearsExperience21', 'Sarid Bhullar', ..., '0', '0', '028', 'Jerry Farmar', ...]

    all_parts = parts
    # Replace the merged parts
    # First merged part is at index 16: 'yearsExperience21'
    # We want to split 'yearsExperience' and '21'.

    # Let's try to reconstruct it.
    fixed_rows = []

    # Header
    fixed_rows.append(header)

    # Data starts from index 16.
    # Index 16 is 'yearsExperience21'.
    current_data_start_val = all_parts[16].replace('yearsExperience', '')

    remaining_parts = [current_data_start_val] + all_parts[17:]

    # Now each row should have 17 fields, but the 17th field is merged with the 1st of the next.
    for i in range(0, len(remaining_parts), 16):
        row_slice = remaining_parts[i:i+16]
        if len(row_slice) < 16: break

        last_and_next = row_slice[-1]
        # How to split last_and_next?
        # The first part of a row is 'age'. Age is typically 2 digits.
        # But some might be 1 or 3? Unlikely.
        # Actually, in the sample '028', row 1 ended with 0, row 2 started with 28.
        # It seems the last field of row N and first field of row N+1 are merged.

        # Wait, if I split by 17 columns...
        # Row 1: parts[0..15] + parts[16] (split)

    # Let's try a different approach. We know the pattern.
    # Header: 17 fields.
    # Each row: 17 fields.

    # Split the merged string at index 16
    first_row_first_val = all_parts[16][len('yearsExperience'):]

    data_parts = [first_row_first_val] + all_parts[17:]

    # Now in data_parts:
    # Index 0: age of row 1
    # Index 1: name of row 1
    # ...
    # Index 15: yearsContract of row 1
    # Index 16: yearsExperience of row 1 + age of row 2

    # We can iterate through data_parts and break every 16 indices?
    # No, every 17th index is the merged one.

    final_data = []
    for i in range(0, len(data_parts), 16):
        chunk = data_parts[i:i+16]
        if len(chunk) < 16: break

        # chunk[0..14] are fields 1..15.
        # chunk[15] is field 16 + next row's field 1.

        row = chunk[0:15]
        merged = chunk[15]

        # To split merged, we need to know where yearsExperience ends and next age starts.
        # yearsExperience is likely 1 digit in most cases?
        # Actually, the original CSV is so messy.
        # Let's look at '028'. Age is 28. Experience is 0.
        # So split at length - 2?

        exp = merged[:-2]
        next_age = merged[-2:]
        row.append(exp)
        final_data.append(row)

        # Update data_parts for next iteration
        if i + 16 < len(data_parts):
            data_parts[i+16] = next_age

    with open(output_path, 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(header)
        writer.writerows(final_data)

fix_rosters('reference/res/raw/rosters.csv', 'app/src/main/assets/rosters.csv')
