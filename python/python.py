with open(df, 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        parts = row[0].split(';')
        print parts
        flings.append([parts[0],parts[1]])