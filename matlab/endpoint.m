%���ò���
n = 16000;
MH = 0.03;
ML = 0.01;
framelen = 256; % a big window for men 20ms
inc = 80; %  half window 0-1/2 is very ok
zpara = 1.5;
max_num_windows = 200;
%TODO: ���δ����˲�


%DCT��̣�ά�Ȳ�ͬ

%dir('.') �г���ǰĿ¼���������ļ��к��ļ�
%dir('G:\Matlab') �г�ָ��Ŀ¼���������ļ��к��ļ�
%dir('*.m') �г���ǰĿ¼�·���������ʽ���ļ��к��ļ�

% ������¼�ĵ�����
sta = zeros(200,1);
mini = 100;
maxi = 1;
data = zeros(1200,max_num_windows,24);
label = zeros(1200,1);
count_data = 0;



for xx = 1:20%�ڼ���
	for x= 1:20%�ĸ���
		for s = 1:3%�ĸ���
			count_data = count_data+1;
			newau = getCut(s,x,xx,n,MH,ML ,framelen,inc,zpara);
			MFCCco = MFCC(newau);		
			%tmpdata = reshape(MFCCco, 1, size(MFCCco,1)*size(MFCCco,2));
			data(count_data,1:size(MFCCco,1),:) = MFCCco;
			label(count_data,1) = x;
			xxx = size(MFCCco,1);
			sta(xxx)=sta(xxx)+1;
			xxx = size(MFCCco,1);
			mini = min(mini,xxx);
			maxi = max(maxi,xxx);				

	end
	end
end
figure(4);
subplot(4,1,1),plot(sta);		
grid on;
maxi
mini

minimums = min(data, [], 1);
ranges = max(data, [], 1) - minimums;
%data = (data - repmat(minimums, size(data, 1), 1)) ./ repmat(ranges, size(data, 1), 1);



test_data = data(901:1200,:,:);
test_label = label(901:1200,:);
data = data(1:900,:,:);
label = label(1:900,:);
save data_label data label  
save test_data_label test_data test_label