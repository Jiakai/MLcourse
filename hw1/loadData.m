function [dataSet] = loadData(fileName,size)
   fid = fopen(fileName);
   tline = fgetl(fid);
   dataSet = cell(size,2);
   i = 1;
   while ischar(tline)
       [flag, restStr] = strtok(tline);
       dataSet{i,1} = str2double(flag); 
       dataSet{i,2} = restStr(2:end);
       tline = fgetl(fid);
       i = i+1;
   end
   
   fclose(fid);
end