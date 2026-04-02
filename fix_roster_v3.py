import re

def fix_roster_v3():
    with open('reference/res/raw/rosters.csv', 'r', encoding='utf-8') as f:
        content = f.read().replace('\r', '').replace('\n', '')

    # Semicolon is the only separator.
    parts = content.split(';')

    # 1. Extract Header
    header = parts[:17]
    # 'yearsExperience21' -> 'yearsExperience', '21'
    last_header = header[16]
    match = re.search(r'([a-zA-Z]+)(\d+)', last_header)
    header[16] = match.group(1)
    first_data_val = match.group(2)

    data_parts = [first_data_val] + parts[17:]

    # 2. Reconstruct records
    # Each record starts with Age (2 digits) and ends with yearsExperience.
    # The split point between records is where we have [yearsExperience][Age]

    # Let's use a strategy of consuming 17 parts at a time, but the 17th part needs splitting.
    all_rows = [header]

    current_data_idx = 0
    while current_data_idx < len(data_parts):
        row = []
        # Take first 16 parts of the record
        for _ in range(16):
            if current_data_idx < len(data_parts):
                row.append(data_parts[current_data_idx])
                current_data_idx += 1

        # The 17th part contains [yearsExperience] and possibly the [Age] of next record
        if current_data_idx < len(data_parts):
            combined = data_parts[current_data_idx]
            # Heuristic: the Age of next record is the last 2 digits if it's a long number.
            # But wait, what if yearsExperience is 10? (unlikely in this game but possible).
            # Most players have age 18-40.

            # Check if this part is the absolute last part of the file
            if current_data_idx == len(data_parts) - 1:
                row.append(combined)
                all_rows.append(row)
                current_data_idx += 1
            else:
                # Split yearsExp and next Age
                # Use regex to find the last 2 digits
                m = re.match(r'(\d+)(\d{2})$', combined)
                if m:
                    years_exp = m.group(1)
                    next_age = m.group(2)
                    row.append(years_exp)
                    all_rows.append(row)
                    # Put next_age back into data_parts or just increment
                    data_parts[current_data_idx] = next_age # Replace combined with next_age for next iteration
                    # Do NOT increment current_data_idx so we pick up next_age in next row
                else:
                    # Fallback
                    row.append(combined)
                    all_rows.append(row)
                    current_data_idx += 1
        else:
            if row: all_rows.append(row)

    with open('app/src/main/assets/rosters.csv', 'w', encoding='utf-8') as f:
        for row in all_rows:
            if len(row) == 17:
                f.write(';'.join(row) + '\n')

if __name__ == "__main__":
    fix_roster_v3()
