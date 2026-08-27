import os,shlex

processed=[]
skipped=[]
path = ".\\data\\"

strings=[]
strings_processed=[]
string_translations=[]

def record(file_path,row,line,text_start,text_end):
    result=''
    i=text_start
    while (i<=text_end):
        result+=line[i]
        i+=1
    print('string found at "'+file_path+'" ['+str(row)+']: "'+result+'"')
    result=result.replace('\\u00a7','`')
    if (result not in strings):
        strings.append(result)

for root, dirs, files in os.walk(path):
    for file in files:
        file_path=os.path.join(root, file)
        #print(os.path.splitext(file_path))
        if (os.path.splitext(file_path)[1] in ['.mcfunction','.json']):
            #print('Processing file: \"'+file_path+'\"')
            with open(file_path,'r') as f:
                i=0
                for line_unstripped in f:
                    line=line_unstripped.strip('\n')
                    text_start,text_end=-1,-1
                    for j in range(len(line)):
                        if (line[j]=='"'):
                            if (j>0):
                                if (line[j-1]=='\\'):
                                    continue
                            if (text_start==-1):
                                text_start=j
                            else:
                                text_end=j
                                record(file_path,i,line,text_start+1,text_end-1)
                                text_start,text_end=-1,-1
                    if (text_start!=-1 and text_end==-1):
                        raise Exception("String not closed")
                                
                    #print(line)
                    i+=1
        else:
            print('Skipping file: \"'+file_path+'\"')
            skipped.append(file_path)

cached_strings=[]
cached_string_translations=[]
try:
    with open('.\\cached_strings.mqdata','r') as f:
        for line_unstripped in f:
            cached_strings.append(line_unstripped.strip('\n'))
except:
    pass
    
try:
    with open('.\\cached_string_translations.mqdata','r') as f:
        for line_unstripped in f:
            cached_string_translations.append(line_unstripped.strip('\n'))
except:
    pass

i=0
for i in range(len(strings)):
    string=strings[i]
    string_translation=''
    if (string in cached_strings):
        j=0
        for cached_string in cached_strings:
            if (cached_string==string):
                break
            j+=1
        string_translation=cached_string_translations[j]
        print('\nusing cached translation for "'+string+'" -> "'+string_translation+'", skipping...')
        strings_processed.append(string)
        string_translations.append(string_translation)
    else:  
        print('\nstrings to be translated remaining: '+str(len(strings)-i))
        print('instructions: "\\u00a7" -> "`"; "@" for leaving the string as it is; "#quit" for ending task and saving progress')
        print('original content: "'+string+'"')
        string_translation=input('input translated content>>>')
        if (string_translation=='#quit'):
            break
        if (string_translation=='@'):
            strings_processed.append(string)
            string_translations.append(string)
        else:
            strings_processed.append(string)
            string_translations.append(string_translation)

with open('.\\cached_strings.mqdata','w',encoding='utf-8') as file:
    for string in strings_processed:
        file.write(string+'\n')

with open('.\\cached_string_translations.mqdata','w',encoding='utf-8') as file:
    for string in string_translations:
        file.write(string+'\n')
        
print('Overwriting original content...')

def search_for_translation(old):
    replacement=''
    k=0
    for cached_string in strings_processed:
        if (cached_string.replace('`','\\u00a7')==old):
            break
        k+=1
    if (k>=len(cached_strings)):
        raise Exception('Translation not found for "'+old+'". Unexpected error.')
    return string_translations[k].replace('`','\\u00a7')

for root, dirs, files in os.walk(path):
    for file in files:
        file_path=os.path.join(root, file)
        #print(os.path.splitext(file_path))
        if (os.path.splitext(file_path)[1] in ['.mcfunction','.json']):
            #print('Processing file: \"'+file_path+'\"')
            file_output=[]
            with open(file_path,'r') as f:
                i=0
                for line_unstripped in f:
                    line=line_unstripped.strip('\n')
                    text_start,text_end=-1,-1
                    j=0
                    while (j<len(line)):
                        if (line[j]=='"'):
                            if (j>0):
                                if (line[j-1]=='\\'):
                                    continue
                            if (text_start==-1):
                                text_start=j+1
                            else:
                                text_end=j-1
                                
                                old=line[text_start:text_end+1]
                                replacement=search_for_translation(old)
                                line=line[:text_start]+replacement+line[text_end+1:]
                                j=len(line[:text_start]+replacement)
                                text_start,text_end=-1,-1
                        j+=1
                    if (text_start!=-1 and text_end==-1):
                        raise Exception("String not closed")
                    file_output.append(line)
                    #print(line)
                    i+=1
            with open(file_path,'w',encoding='utf-8') as f:
                for line in file_output:
                    f.write(line+'\n')
        else:
            print('Skipping file: \"'+file_path+'\"')
            skipped.append(file_path)