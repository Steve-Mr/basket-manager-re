import re

def fix_roster_robust():
    with open('reference/res/raw/rosters.csv', 'r', encoding='utf-8') as f:
        content = f.read().replace('\r', '')

    # The file has no newlines, just semicolons.
    # Header: age;name;positionFirst;positionSecond;potential;salary;skillBlock;skillPass;skillPhysique;skillRebound;skillShotExterior;skillShotFree;skillShotInterior;skillSteal;team;yearsContract;yearsExperience
    # Then data follows: 21;Sarid Bhullar;...;028;Jerry Farmar;...

    # Split by semicolon
    parts = content.split(';')

    # Header fields
    header = parts[:17]
    # The last header part is joined with first data part: 'yearsExperience21'
    last_header = header[16]
    match = re.search(r'([a-zA-Z]+)(\d+)', last_header)
    if match:
        header[16] = match.group(1)
        first_age = match.group(2)
    else:
        first_age = "20" # fallback

    data_values = [first_age] + parts[17:]

    rows = [header]
    current_row = []

    # Process data values. Each row has 17 fields.
    # The last field of each row is joined with the first field of the next row.
    # Pattern: [yearsExperience][age]

    i = 0
    while i < len(data_values):
        val = data_values[i]

        if len(current_row) == 16:
            # This is the 17th field, potentially joined with next age
            # Typical format "021" -> yearsExp 0, Age 21
            # But wait, the very last record won't have a next age.
            if i < len(data_values) - 1:
                # Heuristic: last 2 chars are age (18-40), prefix is yearsExp
                # Or use regex to find the break
                # Note: team field is 15th (index 14), yearsContract 16th, yearsExp 17th
                # Wait, yearsExp is the last one.
                # Let's see the order again: ...;team;yearsContract;yearsExperience
                # Actually, in Roster.java: team is String, yearsContract Int, yearsExperience Int.

                match_join = re.match(r'(\d+)(\d{2})$', val)
                if match_join:
                    years_exp = match_join.group(1)
                    next_age = match_join.group(2)
                    current_row.append(years_exp)
                    rows.append(current_row)
                    current_row = [next_age]
                else:
                    current_row.append(val)
                    rows.append(current_row)
                    current_row = []
            else:
                # Last value of the file
                current_row.append(val)
                rows.append(current_row)
        else:
            current_row.append(val)

        i += 1

    with open('app/src/main/assets/rosters.csv', 'w', encoding='utf-8') as f:
        for row in rows:
            f.write(';'.join(row) + '\n')

if __name__ == "__main__":
    fix_roster_robust()
