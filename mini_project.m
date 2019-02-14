%author:Bikal Shrestha

clear;
close all;
clear all;
disp('---RADIATION PATTERNS OF DIFFERENT DIPOLES---')

%%%input data 
F=input('Enter the number 1 or 2 ');
if F==1
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
   
  
    disp('-----Radiation Resistance(Rr)=-----')
    Rr=80.*(pi).*(pi).*(L/lambda)^2
    disp('---Radiation Resistance in dB===')
    R=10*log10(Rr)
    disp('----DIRECTIVITY(D)=----')
    D=3/2
    
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
title('3D-Pattern plot of Infinitesimal Dipole')
    

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
    
  
    disp('---Resistance Resistance(Rr)= ---')
Rr=20.*(pi).*(pi).*(L/lambda).^2
    disp('---Radiation Resistance in bB===')
    R=10*log10(Rr)
disp('---DIRECTIVITY(D)= ---')
D=3/2

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
title('3D-Pattern plot of Short Dipole')




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
    
     
disp('---Radiation Resistance(Rr)= --- ')
       Rr=2.436*etha/(4*pi)
       disp('---Radiation Resistance in bB===')
         R=10*log10(Rr)
         
         disp('---Directivity(D)= ---')
         D=1.76
         
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
title('3D-Pattern plot of Half-wavelength Dipole')



 %for finite length dipole   
else 
    disp('---Finite length Dipole---')
    %for field pattern
    x=0:0.001:2*pi;
    A=cos(B.*L/2);
    p=cos(cos(x).*B.*L/2)-A;
    m=(p./sin(x));
    polar(x,m,'r')
    hold on
    m=(-p./sin(x));
    polar(x,m,'r')
    view(-270,-90)
    title('Radiation pattern of Finite length Dipole');
     
    disp('--- Radiation Resistance(Rr)=  ')
rr=(0.5772+log(B*L))-cosint(B*L);
ro=rr+(1/2).*sin(B*L)*(sinint(2*B*L)-2*sinint(B*L));
Q=ro+(1/2).*cos(B*L)*(0.5772+log(B*L/2)+cosint(2*B*L)-2*cosint(B*L));
Rr=(etha/(2*pi)).*Q

disp('---Radiation Resistance in bB===')
         R=10*log10(Rr)

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
title('3D-Pattern plot of Finite Length Antenna')
end

end

    



