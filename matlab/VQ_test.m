load('knndata.mat')% data_dtw_train data_dtw_test label_dtw_train label_dtw_test model
%data_dtw_train_len data_dtw_test_len
load('model_953.mat')
alphabet = size(codebook,2);
percent = zeros([1,20]);
wrong = zeros([1,20]);
right = zeros([1,20]);
for i = 1:20
i
	%for k = 1:size(data_dtw_test,2)
	for k = 1:size(data_dtw_test,2)
	%i,k,right,wrong;
		current = reshape(data_dtw_test(i,k,:,:),[200,16]);
		%current = reshape(data_dtw_train(i,k,:,:),[200,16])
		mindistort = 11111111;
		result = 1;
		for j = 1:20				
			cj = reshape(codebook(j,:,:),[size(codebook,2),size(codebook,3)]);
			current;
			x =reshape(current',[1,size(current,1)*size(current,2)]);
			[id,distort] = fitvq( x ,16,cj,alphabet);

			if mindistort>distort
				mindistort = distort;
				result = j;
			end		
		end
	%	break
		if label_dtw_test(i,k)==i
			if result== i
				right(i)=right(i)+1;
			else
				wrong(i)=wrong(i)+1;
			end
		end
	%	break
		end
	%break
	percent(i) = right(i)/(wrong(i)+right(i));
end

save vqtest.mat wrong right percent

  
����ο�ģ�������ʸ��Ϊ��\(X={1,2,��, }\)��������������ʸ������Ϊ��\(Y={1,2,��, }\),\(I��J\)��
��ʱ���������Ϊ��\(C={c(1),c(2),��,c(N)}\)��NΪ·�����ȣ�\(c(n)=(i(n),j(n))\),��ʾ��n��ƥ���ԣ�����d(x_i(n) ,j_(n) )\)��Ϊ�ֲ����룻
DTW�㷨��Ѱ��һ�����ʱ�����������ʹ�ô���������ʱ����j�����Ե�ӳ�䵽�ο�ģ���ʱ����i�ϣ�ʹ����ʧ����С��