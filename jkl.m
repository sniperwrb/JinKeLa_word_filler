function y=jkl(x,preference)
if (nargin<2)
    preference=0;
end
l=length(x);
c=1;
a=cell(1);
p=1;
for i=1:l
    if (x(i)==' ')
        q=i-1;
        a{c}=x(p:q);
        c=c+1;
        p=i+1;
    end
end
a{c}=x(p:l);
load pinyin
%np=93;
load sayer
%ns=15;
load said
b=zeros(c,1);%input
f=1;
y='';
for i=1:c
    for j=1:np
        if strcmp(a{i},pinyin{j})
            b(i)=j;
            break;
        end
    end
    if (b(i)==0)
        y=[y,' ',a{i}];
        f=0;
    end
end
if (f==0)
    y=[y,' error'];
    return
end
%start
d=zeros(ns,1);%count
dt=zeros(4,1);
for i=1:c
    for j=1:ns
        if (said(b(i),j))
            d(j)=d(j)+1;
        end
    end
    for j=1:4
        if (saidt(b(i),j))
            dt(j)=dt(j)+1;
        end
    end
end
switch preference
    case {'fei','f','1',1}
        pt=1;
    case {'ri','r','2',2}
        pt=2;
    case {'mei','m','3',3}
        pt=3;
    otherwise
        [~,pt]=max(dt);
end
sel=zeros(c,1);
e=a;
[~,pr]=max(d(pt*4-3:pt*4));
pr=pr+(pt-1)*4;
for i=1:c
    if (said(b(i),pr))
        sel(i)=pr;
    elseif (saidt(b(i),pt))
        rnd=ceil(rand*4)+(pt-1)*4;
        while (~said(b(i),rnd))
            rnd=ceil(rand*4)+(pt-1)*4;
        end
        sel(i)=rnd;
    else
        rnd=ceil(rand*16);
        while (~said(b(i),rnd))
            rnd=ceil(rand*16);
        end
        sel(i)=rnd;
    end
    if mod(said(b(i),sel(i)),2)
        e{i}=sayer{sel(i)};
    else
        e{i}=['A',sayer{sel(i)}];
    end
end
y=[a{1},e{1}];
for i=2:c
    y=[y,' ',a{i},e{i}];
end
%display(y);
end