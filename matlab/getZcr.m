function zcr = getZcr(au, framelen, inc)

%����ƽ��������z0
%TO DO ���ѡ�������ϵ�� ����ط����Ĳ�̫��
%[a,Fs] = audioread('void.wav'); 
%a = a/max(abs(au));
%tmp1 = enframe(a(1:end-1),framelen,inc);
%tmp2 = enframe(a(2:end),framelen,inc);
%signs = (tmp1.*tmp2)<0;
%diffs = (tmp1 - tmp2)>0.01;
%zcr = sum(signs.*diffs,2);
%z0 = sum(zcr')/size(zcr,1);


%���������
tmp1 = enframe(au(1:end-1),framelen,inc);
tmp2 = enframe(au(2:end),framelen,inc);
signs = (tmp1.*tmp2)<0;
diffs = (tmp1 - tmp2)>0.0001;
zcr = sum(signs.*diffs,2);
zcr = sum(signs.*diffs,2);

end





