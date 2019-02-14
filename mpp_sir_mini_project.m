clear;
close all;
clear all;
disp('---RADIATION PATTERNS OF DIFFERENT DIPOLES---')

%%%input data 

F=input('Enter the value of frequency in Hertz-=\n ');
lambda=(3e8)/F
L=input('Enter the  vlaue of length in meter= \n');
B=2*pi/lambda;
etha=377;

%for infinitesimal dipole

if L<=lambda/50
    disp('--INFINITESIMAL DIPOLE---')
    
    
    %normalized field pattern
    
     x=0:0.0005:2*pi;
    P=sin(x);
    polar(x,P,'--r')
    hold on
    p=sin(-x);
    polar(x,p,'--r')
    view(-270,-90);
    title('Radiation pattern of Infinitesimal Dipole');
   
    %normalized power pattern
    y=0:0.0005:2*pi;
    A=(sin(y)).^2;
    polar(y,A,'b')
    hold on
    a=(sin(-y)).^2;
    polar(y,a,'b')
    view(-270,-90);
    title('Radiation pattern of Infinitesimal Dipole');
    
   
   % 3-D plot for normalized field pattern
    figure
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
A = sin(tehta); 
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image
rotate3d on
title('3D-Pattern plot of Infinitesimal Dipole--Field Pattern')

%3-D plot for normalized power pattern
  figure
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
A = (sin(tehta)).^2; 
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image
rotate3d on
title('3D-Pattern plot of Infinitesimal Dipole--Power pattern')
    

% for short dipole

elseif (L>lambda/50)&(L<=lambda/10)
    disp('---Short Dipole---')
    
    %for normalized field pattern
    x=eps:0.0005:2*pi;
    P=sin(x);
    polar(x,P,'--r')
    hold on
    p=sin(-x);
    polar(x,p,'--r')
    view(-270,-90);
    title('Radiation pattern of Short Dipole');
    
    %for normalized power pattern
     y=eps:0.0005:2*pi;
    A=(sin(y)).^2;
    polar(y,A,'b')
    hold on
    a=(sin(-y)).^2;
    polar(y,a,'b')
    view(-270,-90);
    title('Radiation pattern of Short Dipole');
    
  

%3-D plot
 figure
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
A = sin(tehta); 
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image
rotate3d on
title('3D-Pattern plot of Short Dipole--Field Pattern')


%3-D plot for normalized power pattern
  figure
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
A = (sin(tehta)).^2; 
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image
rotate3d on
title('3D-Pattern plot of Short Dipole--Power pattern')


%for half-wave dipole
    
elseif L==lambda/2
    disp('---half-wavelength dipole---')
    
    %for normalized field pattern
    x=eps:0.0005:pi;
    X=cos(pi/2.*(cos(x)));
    P=(X./sin(x));
    polar(x,P,'--r')
    hold on
    p=(-X./sin(x));
    polar(x,p,'--r')
    view(-270,-90);
    title('Radiation pattern of half-wavelenght dipole ');
    
    %for normalized power pattern
    y=eps:0.0005:pi;
    Z=(cos(pi/2.*(cos(x)))).^2;
    A=(Z./(sin(y)).^2);
    polar(y,A,'b')
    hold on
    a=(-Z./(sin(y)).^2);
    polar(y,a,'b')
    view(-270,-90);
     title('Radiation pattern of half-wavelenght dipole ');
    
      
         %3-D plot for field pattern
 figure
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
  P=cos(pi/2.*(cos(tehta)));
 Q=(P./sin(tehta));
A = P./Q;
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image
rotate3d on
title('3D-Pattern plot of Half-wavelength Dipole--field pattern')

%3-D plot for power pattern
 figure
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
  P=cos(pi/2.*(cos(tehta)));
 Q=(P./sin(tehta));
A = (P.^2)./(Q.^2);
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image
rotate3d on
title('3D-Pattern plot of Half-wavelength Dipole--power pattern')


 %for finite length dipole   
else 
    disp('---Finite length Dipole---')
    
    %for field pattern
    x=0:0.001:2*pi;
    A=cos(B.*L/2);
    p=cos(cos(x).*B.*L/2)-A;
    m=(p./sin(x));
    polar(x,m,'--r')
    hold on
    m=(-p./sin(x));
    polar(x,m,'--r')
    view(-270,-90)
    title('Radiation pattern of Finite length Dipole');
    
    %for power pattern
    x=0:0.001:2*pi;
    A=cos(B.*L/2);
    p=cos(cos(x).*B.*L/2)-A;
    m=((p.^2)./sin(x));
    polar(x,m,'b')
    hold on
    m=((-p.^2)./sin(x));
    polar(x,m,'b')
    view(-270,-90)
    title('Radiation pattern of Finite length Dipole');
    
    
         %3-D plot for field pattern
figure 
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
k = L/lambda; % Half Wave Dipole 
Num = cos(pi*k*cos(tehta))-cos(pi*k); 
Den = sin(tehta); 
A = Num./Den; 
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image 
rotate3d on
title('3D-Pattern plot of Finite Length Antenna-field pattern')

%3-D plot for power plot
figure 
n_tehta = 120; % Samples on Elevation 
n_phi = 120; % Samples on Azimut 
[tehta,phi]=meshgrid(eps:pi./(n_tehta-1):pi,... 
            0:2*pi./(n_phi-1):2*pi) ; 
k = L/lambda; 
Num = cos(pi*k*cos(tehta))-cos(pi*k); 
Den = sin(tehta); 
A = (Num.^2)./Den; 
X=A.*sin(tehta).*cos(phi); 
Y=A.*sin(tehta).*sin(phi); 
Z=A.*cos(tehta); 
surf(X,Y,Z)
camlight right
light

colorbar
axis image 
rotate3d on
title('3D-Pattern plot of Finite Length Antenna-power pattern')

end


    



