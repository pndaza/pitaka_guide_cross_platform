in_file = 'topic.csv.org.csv'
out_file = 'topic.csv'
out = ''

with open(in_file, mode='r', encoding='utf-8') as f:
    id = 1
    for line in f:
        name, catID, bookID, pageNumber = line.split('\t')
        pageNumber = int(pageNumber)
        if bookID == '1':
            pageNumber += 20
        elif bookID == '2' :
            pageNumber += 14

        out += f'{id}\t{name}\t{catID}\t{bookID}\t{pageNumber}\n' 
        id += 1

with open(out_file, mode='w', encoding='utf-8') as o:
    o.write(out[:-1])

