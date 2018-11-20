function [timestamp]=readGPStimestamp(fileName_timestamp)
fid = fopen(fileName_timestamp);
[timerlength,~]=textread(fileName_timestamp,'%s %s ','delimiter',',');  
timer =strings(length(timerlength),1);
numlines =1;
%%
%������ת���������ַ�
while 1     
    line = fgetl(fid);
    if ~ischar(line), break, end
%     year= str2double(line(1:4));
%     month = str2double(line(6:7));
%     day= str2double(line(9:10));
%     hour= str2double(line(14:15));
%     minute= str2double(line(17:18));
%     second= str2double(line(19:20));
%     todsec(k) = 3600*hour(k) + 60*minute(k) + second(k);  
    year= (line(1:4));
    month = (line(6:7));
    day= (line(9:10));
    hour= (line(14:15));
    minute= (line(17:18));
    second= (line(20:21));        
    timer(numlines)= strcat(year,month,day,hour,minute,second);
    numlines =numlines +1;
end

%%
%�޳��ظ�����
k=1;
timestamp(1) =str2double( timer(1) );
for i = 2:length(timer)
    if  ~isequal (timer(i) , timer(i-1))
    timestamp(k) =str2double( timer(i-1) );
    k=k+1;
    end
end
timestamp(k) = str2double(timer(i));
timestamp = timestamp';
end
