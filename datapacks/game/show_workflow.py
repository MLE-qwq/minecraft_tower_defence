import os, json

already_done=[]
output=[]
line_cnt=0
char_cnt=0

def traverse(node,layer):
    global char_cnt,line_cnt
    if (node[0]+':'+node[1] in already_done):
        output_line='.   '*layer+'*'+node[0]+':'+node[1]+' ['
        for i in range(len(node[2])):
            condition=node[2][i]
            output_line+=condition
            if (i+1<len(node[2])):
                output_line+=', '
        output_line+='] '
        output.append(output_line)
        return
    output_line='.   '*layer+node[0]+':'+node[1]+' ['
    for i in range(len(node[2])):
        condition=node[2][i]
        output_line+=condition
        if (i+1<len(node[2])):
            output_line+=', '
    output_line+='] '
    output.append(output_line)
    
    already_done.append(node[0]+':'+node[1])  
    with open('.\\data\\'+node[0]+'\\function\\'+node[1]+'.mcfunction','r') as file:
        j=0
        for line in file:
            j+=1
            char_cnt+=len(line)
            #print(line)
            line_cnt+=1
            if (line.find('#')!=-1):
                if (line.find('#')<=1):
                    continue
            if (line.strip()==''):
                continue
            if (line.find('function')==-1):
                continue
            
            params=line.strip().split(' ')
            func_info=''
            func_enter_conditions=[str(j)]
            for i in range(len(params)):
                param=params[i]
                if (param=='if'):
                    if (params[i+1]=='score'):
                        if (params[i+4]=='matches'):
                            func_enter_conditions.append('score/'+params[i+3]+'='+params[i+5])
                        else:
                            func_enter_conditions.append('score/'+params[i+3]+params[i+4]+params[i+6])
                    else:
                        func_enter_conditions.append(params[i+1])
                if (param=='function'):
                    func_info=params[i+1]
                    break
            if (func_info==''):
                raise Exception('Invalid /funciton command.')
            namespace,name=func_info.split(':')
            traverse((namespace,name,func_enter_conditions),layer+1)
    
def numerate_minecraft_built_in_triggers():
    with open(".\\data\\minecraft\\tags\\function\\load.json", "r") as file:
        data=json.load(file)
        for func_info in data['values']:
            traverse((func_info.split(':')[0],func_info.split(':')[1],['ONCE_UPON_LOADING']),0)
    with open(".\\data\\minecraft\\tags\\function\\tick.json", "r") as file:
        data=json.load(file)
        for func_info in data['values']:
            traverse((func_info.split(':')[0],func_info.split(':')[1],['EVERY_GAME_TICK']),0)

def instructions():
    root_path=os.path.dirname(os.path.abspath(__file__))
    root_name=os.path.basename(root_path)
    output.append('Datapack Traversal by MLE_qwq')
    output.append('Pack Name: \"'+root_name+'\"')
    with open('.\\pack.mcmeta','r') as file:
        data=json.load(file)
        output.append('Pack Description: \"'+data['pack']['description']+'\"')
    
    output.append('\n-------\n')
    
    output.append('<example>')
    output.append('namespace:unconditional_function [line_in_file]')
    output.append('namespace:scoreboard_conditional_function [line_in_file, score/objective=value|other objective]')
    output.append('namespace:misc_conditional_function [line_in_file, condition_0, condition_1, ...]')
    output.append('*namespace:function_already_numerated [conditions]')
    output.append('</example>')
    
    
    output.append('\n-------\n')

def overview():
    global line_cnt,char_cnt
    print('统计完毕: ↓这只肖茂一共写了\n'+str(line_cnt)+'行指令/'+str(char_cnt)+'个字符...\n')
    output.append('\nTraversal completed for '+str(len(already_done))+' functions / '+str(line_cnt)+' lines / '+str(char_cnt)+' characters.')

def main():
    instructions()
    numerate_minecraft_built_in_triggers()
    overview()
    
    with open('.\\workflow.txt','w',encoding='utf-8') as file:
        for output_line in output:
            file.write(output_line+'\n')
    os.startfile('.\\workflow.txt')

main()