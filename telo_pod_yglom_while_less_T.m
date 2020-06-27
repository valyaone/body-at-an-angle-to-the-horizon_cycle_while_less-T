% Движение под углом к горизонту c циклом while и временем меньше T
clear all;
 
% начальная координата
x0=0; 
y0=0; 

% начальная скорость
alpha=pi/4; 
v0=150;
vx0=v0*cos(alpha);  
vy0=v0*sin(alpha); 

k=30; % коэфф сопр
massa=30;
g=9.801; 

%параметр схемы
dL=5;
T=12;
%начальные условия
U(1,1)=x0;
U(1,2)=y0;
U(1,3)=vx0;
U(1,4)=vy0;
U(1,5)=0;

method = 1; %ERK_ 1,2,3,4

if method == 1
    m=1;
    while U(m,5)<T
        m=m+1;
        z=sqrt(1+U(m-1,3)^2+U(m-1,4)^2+(-k/massa*U(m-1,3))^2+(-g-k/massa*U(m-1,4))^2);
        w(m-1,1)=U(m-1,3)/z;
        w(m-1,2)=U(m-1,4)/z;
        w(m-1,3)=-k/massa*U(m-1,3)/z;
        w(m-1,4)=(-g-k/massa*U(m-1,4))/z;
        w(m-1,5)=1/z;
        for i=1:5
            U(m,i)=U(m-1,i)+dL*w(m-1,i);
        end
    end
end

if method == 2
    m=1;
    a2=2/3;
    b1=1/4;
    b2=3/4;
    c1=0;
    c2=0;
    while U(m,5)<T
        m=m+1;
        z=sqrt(1+U(m-1,3)^2+U(m-1,4)^2+(-k/massa*U(m-1,3))^2+(-g-k/massa*U(m-1,4))^2);
        w1(m-1,1)=U(m-1,3)/z;
        w1(m-1,2)=U(m-1,4)/z;
        w1(m-1,3)=-k/massa*U(m-1,3)/z;
        w1(m-1,4)=(-g-k/massa*U(m-1,4))/z;
        w1(m-1,5)=1/z;
        
        Uw1=U+dL*a2*w1;
        
        z=sqrt(Uw1(m-1,5)^2+Uw1(m-1,3)^2+Uw1(m-1,4)^2+(-k/massa*Uw1(m-1,3))^2+(-g-k/massa*Uw1(m-1,4))^2);
        w2(m-1,1)=Uw1(m-1,3)/z;
        w2(m-1,2)=Uw1(m-1,4)/z;
        w2(m-1,3)=-k/massa*Uw1(m-1,3)/z;
        w2(m-1,4)=(-g-k/massa*Uw1(m-1,4))/z;
        w2(m-1,5)=(1+a2*dL)/z;
        for i=1:5
            U(m,i)=U(m-1,i)+dL*(w1(m-1,i)*b1+b2*w2(m-1,i));
        end
    end
end

if method == 3
    m=1;
    a2=1/2;
    a3=3/4; 
    b1=2/9;
    b2=3/9;
    b3=4/9;  
    while U(m,5)<T
        m=m+1;
        z=sqrt(1+U(m-1,3)^2+U(m-1,4)^2+(-k/massa*U(m-1,3))^2+(-g-k/massa*U(m-1,4))^2);
        w1(m-1,1)=U(m-1,3)/z;
        w1(m-1,2)=U(m-1,4)/z;
        w1(m-1,3)=-k/massa*U(m-1,3)/z;
        w1(m-1,4)=(-g-k/massa*U(m-1,4))/z;
        w1(m-1,5)=1/z;
        
        Uw1=U+dL*a2*w1;
        
        z=sqrt(Uw1(m-1,5)^2+Uw1(m-1,3)^2+Uw1(m-1,4)^2+(-k/massa*Uw1(m-1,3))^2+(-g-k/massa*Uw1(m-1,4))^2);
        w2(m-1,1)=Uw1(m-1,3)/z;
        w2(m-1,2)=Uw1(m-1,4)/z;
        w2(m-1,3)=-k/massa*Uw1(m-1,3)/z;
        w2(m-1,4)=(-g-k/massa*Uw1(m-1,4))/z;
        w2(m-1,5)=(1+a2*dL)/z;
        
        Uw2=U+dL*a3*w2;
        
        z=sqrt(Uw2(m-1,5)^2+Uw2(m-1,3)^2+Uw2(m-1,4)^2+(-k/massa*Uw2(m-1,3))^2+(-g-k/massa*Uw2(m-1,4))^2);
        w3(m-1,1)=Uw2(m-1,3)/z;
        w3(m-1,2)=Uw2(m-1,4)/z;
        w3(m-1,3)=-k/massa*Uw2(m-1,3)/z;
        w3(m-1,4)=(-g-k/massa*Uw2(m-1,4))/z;
        w3(m-1,5)=(1+a3*dL)/z;
        for i=1:5
            U(m,i)=U(m-1,i)+dL*(w1(m-1,i)*b1+b2*w2(m-1,i)+b3*w3(m-1,i));
        end
    end
end

if method == 4
    m=1;
    a2=1/2;
    a3=1/2; 
    a4=1;
    b1=1/6;
    b2=1/3;
    b3=1/3; 
    b4=1/6;  
    while U(m,5)<T
        m=m+1;
        z=sqrt(1+U(m-1,3)^2+U(m-1,4)^2+(-k/massa*U(m-1,3))^2+(-g-k/massa*U(m-1,4))^2);
        w1(m-1,1)=U(m-1,3)/z;
        w1(m-1,2)=U(m-1,4)/z;
        w1(m-1,3)=-k/massa*U(m-1,3)/z;
        w1(m-1,4)=(-g-k/massa*U(m-1,4))/z;
        w1(m-1,5)=1/z;
        
        Uw1=U+dL*a2*w1;
        
        z=sqrt(Uw1(m-1,5)^2+Uw1(m-1,3)^2+Uw1(m-1,4)^2+(-k/massa*Uw1(m-1,3))^2+(-g-k/massa*Uw1(m-1,4))^2);
        w2(m-1,1)=Uw1(m-1,3)/z;
        w2(m-1,2)=Uw1(m-1,4)/z;
        w2(m-1,3)=-k/massa*Uw1(m-1,3)/z;
        w2(m-1,4)=(-g-k/massa*Uw1(m-1,4))/z;
        w2(m-1,5)=(1+a2*dL)/z;
        
        Uw2=U+dL*a3*w2;
        
        z=sqrt(Uw2(m-1,5)^2+Uw2(m-1,3)^2+Uw2(m-1,4)^2+(-k/massa*Uw2(m-1,3))^2+(-g-k/massa*Uw2(m-1,4))^2);
        w3(m-1,1)=Uw2(m-1,3)/z;
        w3(m-1,2)=Uw2(m-1,4)/z;
        w3(m-1,3)=-k/massa*Uw2(m-1,3)/z;
        w3(m-1,4)=(-g-k/massa*Uw2(m-1,4))/z;
        w3(m-1,5)=(1+a3*dL)/z;
        
        Uw3=U+dL*a4*w3;
        
        z=sqrt(Uw3(m-1,5)^2+Uw3(m-1,3)^2+Uw3(m-1,4)^2+(-k/massa*Uw3(m-1,3))^2+(-g-k/massa*Uw3(m-1,4))^2);
        w4(m-1,1)=Uw3(m-1,3)/z;
        w4(m-1,2)=Uw3(m-1,4)/z;
        w4(m-1,3)=-k/massa*Uw3(m-1,3)/z;
        w4(m-1,4)=(-g-k/massa*Uw3(m-1,4))/z;
        w4(m-1,5)=(1+a4*dL)/z;
        for i=1:5
            U(m,i)=U(m-1,i)+dL*(w1(m-1,i)*b1+b2*w2(m-1,i)+b3*w3(m-1,i)+b4*w4(m-1,i));
        end
    end
end

figure(1);
plot(U(:,1),U(:,2),'.');
hold on
plot(U(:,1),0,'k');
xlabel('X');
ylabel('Y');
title('Движение тела под углом к горизонту');
legend('Тело','Земля');