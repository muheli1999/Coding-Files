import random
def quiz():
    file=open('Words.txt').readlines()
    words=[]
    for line in range(len(file)):
        if file[line] != '\n':
            words.append(file[line].strip().split('/'))
    anspool=[]
    pool=random.sample(range(len(words)),5)
    qalist=random.sample(range(len(words[pool[0]])),2)
    question=words[pool[0]][qalist[0]]
    answer=words[pool[0]][qalist[1]]
    anspool.append(answer)
    for x in pool[1:5]:
        intlist=random.sample(range(len(words[x])),1)
        aint=intlist[0]
        no_ans=words[x][aint]
        anspool.append(no_ans)
    random.shuffle(anspool)
    tags=['A','B','C','D','E']


    print(question+' ')
    #print('')
    for y in range(5):
        print(tags[y]+' '+anspool[y])
    print(' ')
    a=input()
    correct = 0
    if anspool[tags.index(a)]==answer:
        print('Congratulations')
        correct = 1
        for i in pool:
            for j in words[i]:
                if j==answer:

                    print("Correct Answer: "+j)
    else:
        print('Wrong')
        correct = 0
        for i in pool:
            for j in words[i]:
                if j == answer:
                    print('Correct answer: '+j)
                elif j == anspool[tags.index(a)]:
                    print('Your choice: '+j)
    print(' ')
    for z in pool:

        for i in range(len(words[z])):
            if words[z][i] == answer:
                words[z][i] = str.upper(answer)
                #print('correct answer: ' + ans+'\n')
            elif words[z][i] == anspool[tags.index(a)]:
                words[z][i] = str.upper(anspool[tags.index(a)])
                #print('Your choice: ' + choice+'\n')
        print(words[z])

    print(' ')
    print('Press ENTER to continue')
    print('Enter "exit" to quit')
    return input(),correct

num_question = int(input('Please enter number of questions:'))
full_point = num_question
points = 0
while (num_question>0):
    go = quiz()
    num_question = num_question - 1
    if go[1] == 1:
        points = points+1
    if str.lower(go[0]) == 'exit':
        break
    else:
        continue
print('Your score: ' +str(points)+' out of '+str(full_point))
if points <= 0.5*full_point:
    print('Keep working, you got it!')
elif points <= 0.8 * full_point:
    print('You did OK this time.')
else:
    print('Well done!')