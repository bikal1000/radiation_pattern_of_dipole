%author:Bikal Shrestha


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
    polar(y,A,'r')
    hold on
    a=(sin(-y)).^2;
    polar(y,a,'r')
    view(-270,-90);
    title('Radiation pattern of Infinitesimal Dipole');
    
    
    
    
     %for normalized field pattern
    x=eps:0.0005:2*pi;
    P=sin(x);
    polar(x,P,'--g')
    hold on
    p=sin(-x);
    polar(x,p,'--g')
    view(-270,-90);
    title('Radiation pattern of Short Dipole');
    
    %for normalized power pattern
     y=eps:0.0005:2*pi;
    A=(sin(y)).^2;
    polar(y,A,'g')
    hold on
    a=(sin(-y)).^2;
    polar(y,a,'g')
    view(-270,-90);
    title('Radiation pattern of Short Dipole');
    
    
    
     %for normalized field pattern
    x=eps:0.0005:pi;
    X=cos(pi/2.*(cos(x)));
    P=(X./sin(x));
    polar(x,P,'--k')
    hold on
    p=(-X./sin(x));
    polar(x,p,'--k')
    view(-270,-90);
    title('Radiation pattern of half-wavelenght dipole ');
    
    %for normalized power pattern
    y=eps:0.0005:pi;
    Z=(cos(pi/2.*(cos(x)))).^2;
    A=(Z./(sin(y)).^2);
    polar(y,A,'k')
    hold on
    a=(-Z./(sin(y)).^2);
    polar(y,a,'k')
    view(-270,-90);
     title('Radiation pattern of half-wavelenght dipole ');
     
     
    
     
      %for field pattern
 
    x=0:0.001:2*pi;
    A=cos(B*L/2);
    p=cos(cos(x).*B.*L/2)-A;
    m=(p./sin(x));
    polar(x,m,'--b')
    hold on
    m=(-p./sin(x));
    polar(x,m,'--b')
    view(-270,-90)
    title('Radiation pattern of Finite length Dipole');
    
    %for power pattern
    x=0:0.001:2*pi;
    A=cos(B*L/2);
    p=cos(cos(x).*B.*L/2)-A;
    m=((p.^2)./sin(x));
    polar(x,m,'b')
    hold on
    m=((-p.^2)./sin(x));
    polar(x,m,'b')
    view(-270,-90)
    title('Radiation pattern of Finite length Dipole');
    
