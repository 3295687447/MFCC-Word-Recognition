
% ����ƽ̨��Mac OSX��MATLAB R2014b
% ¼��¼2����
Time = 2;

% �������ѧ��
Id = '13307130444';

% ������¼�ĵ�����
Word = {
  '����',
  '����',   
  '�ź�',
  '����',
  'ʶ��', 
 '����',
 '����',
 '�Ϻ�',   
 '����', 
 '����',
 'Speech', 
 'Voice',
 'Sound', 
 'Happy',  
 'Lucky', 
 'File',
 'Open', 
 'Close', 
 'Start', 
 'Stop'};

FS = 8000;
nBits = 16;
recObj = audiorecorder(FS, nBits, 1);
for j = 1:20
	
	item = Word{j};
	for i = 1:20
	%if i == 1
		disp(strcat(strcat('Start speaking.',num2str(i)),item))
		recordblocking(recObj, Time);
		disp('End of Recording.');

		myRecording = getaudiodata(recObj);

		filename = strcat(Id, '_');
		filename = strcat(filename, item);
		filename = strcat(filename, '_');
		filename = strcat(filename,num2str(i,'%02d'); 
		%datestr(now, 30));
		filename = strcat(filename, '.wav');
		audiowrite(filename, myRecording, FS)
	%end
	end
end