topic_file = 'topics_unfix.csv'
tag_file = 'tags.csv'
out_file = 'topic.csv'
out = ''

tags = {}

with open(tag_file, mode='r', encoding='utf-8') as f:
    for line in f:
        id, tag_id = line.split('\t')
        tags[int(id)] = int(tag_id)

with open(topic_file, mode='r', encoding='utf-8') as f:
    for line in f:
        id, name, bookID, pageNumber = line.split('\t')

        # adding pagenumber for preface page
        # volume 3 have no preface page
        pageNumber = int(pageNumber)
        if bookID == '1':
            pageNumber += 20
        elif bookID == '2' :
            pageNumber += 14

        # adding tag id
        # some does not have tag id
        # so will be use 0 for that
        tag_id = tags.get(int(id),0)
        out += f'{id}\t{name}\t{tag_id}\t{bookID}\t{pageNumber}\n' 

with open(out_file, mode='w', encoding='utf-8') as o:
    o.write(out[:-1])

