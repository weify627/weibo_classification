classlist  = dir('D:\本学期课程\机器学习概论\new_weibo_13638');
% 读取后namelist 的格式为
% name -- filename
% date -- modification date
% bytes -- number of bytes allocated to the file
% isdir -- 1 if name is a directory and 0 if not

%It is used to read a collection of ".txt" files from subdirectories of a root directory and write them into one ".txt" file.
%Contents include Chinese characters.


result_id=fopen('result.txt','wt');
l = length(classlist); 
maxlen=0;

 for i=3:l
        file_name{i}=classlist(i).name;
        entrylist  = dir(['D:\本学期课程\机器学习概论\new_weibo_13638\' file_name{i}]);
        if maxlen<length(entrylist)
            maxlen=length(entrylist);
            record=[num2str(i) num2str(j)]
        end
            
        for j=3:length(entrylist)
            x= importdata(['D:\本学期课程\机器学习概论\new_weibo_13638\' file_name{i} '\' entrylist(j).name]);
            fid=fopen(['D:\本学期课程\机器学习概论\new_weibo_13638\' file_name{i} '\' entrylist(j).name],'r+','n','utf-8');
            tline=fgetl(fid); %bb = textscan(fid,'%s');
            fprintf(result_id,'n,%d,%s\n',i-3,tline);
            fclose(fid);
        end
 end
fclose(result_id);
