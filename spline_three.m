function f = spline_three(x,y,dy1,dyn,x0)
%x��yΪ�������֪��  
%x0Ϊ�����ֵ��ĺ�����  
%dy1,dynΪԼ���������Ƕ˵㴦��һ�׵���ֵ  
n=length(x);  
for i=1:n-1  
    h(i)=x(i+1)-x(i);  
end

d(1,1)=6*((y(2)-y(1))/h(1)-dy1)/h(1);   %��ʽ(11)�Ľ��������϶˵�ֵ  
d(n,1)=6*(dyn-(y(n)-y(n-1))/h(n-1))/h(n-1); %��ʽ(11)�Ľ��������¶˵�ֵ  
for i=2:n-1  
    u(i)=h(i-1)/(h(i-1)+h(i));  
    d(i,1)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1))/(h(i-1)+h(i));  
end  

%�õ�ϵ������  
A(1,1)=2;  
A(1,2)=1;  
A(n,n-1)=1;  
A(n,n)=2;  
for i=2:n-1  
    A(i,i-1)=u(i);  
    A(i,i)=2;  
    A(i,i+1)=1-u(i);  
end

%�ⷽ��  
M=A\d;  
  
format long;
syms t;  
%�õ�ÿ�������ʽ��  
for i=1:n-1  
   a(i)=y(i+1)-M(i+1)*h(i)^2/6-((y(i+1)-y(i))/h(i)-(M(i+1)-M(i))*h(i)/6)*x(i+1);  
   b(i)=((y(i+1)-y(i))/h(i)-(M(i+1)-M(i))*h(i)/6)*t;  
   c(i)=(t-x(i))^3*M(i+1)/(6*h(i));  
   e(i)=(x(i+1)-t)^3*M(i)/(6*h(i));  
   f(i)=a(i)+b(i)+c(i)+e(i);  
end  

%����  
 f=simplify(f);  
 f=vpa(f,6);  
 
if(nargin==5)  
   nn=length(x0);  
    for i=1:nn  
        for j=1:n-1  
            if(x0(i)>=x(j)&x0(i)<=x(j+1))  
                 yynum(i)=subs(f(j),'t',x0(i));   %�����ֵ��ĺ���ֵ.subs���滻��������x0��t�滻  
            end  
        end  
    end     
    f=eval(yynum);  
else  
    f=simplify(f);          %����ֵ����ʽչ��  
    f=vpa(f,6);            %����ֵ����ʽ��ϵ������6λ���ȵ�С��  
end  
end  