# To rotate given x,y coordinates by angle theta:

read -p "Enter x-coordinate of the vector: " x
read -p "Enter y-coordinate of the vector: " y
read -p "Enter z-coordinate of the vector: " z
read -p "Enter angle of rotation theta in degrees: " theta
read -p "Enter x-coordinate of axis of rotation Ux: " Ux
read -p "Enter y-coordinate of axis of rotation Uy: " Uy
read -p "Enter z-coordinate of axis of rotation Uz: " Uz
#Ux=1.0
#Uy=0.0
#Uz=0.0
#theta=45.00

#Shifting origin, Here ox,oy and oz are coordinates of origin or center of octahedra
read -p "Enter x-coordinate of origin: " ox
read -p "Enter y-coordinate of origin: " oy
read -p "Enter z-coordinate of origin: " oz
#ox=10.00
#oy=10.00
#oz=10.00


x=$(echo "$x-$ox"|bc -l)
y=$(echo "$y-$oy"|bc -l)
z=$(echo "$z-$oz"|bc -l)

#Normalize axis-vector
mod=$(echo "sqrt(($Ux^2)+($Uy^2)+($Uz^2))"|bc -l)
ux=$(echo "$Ux/$mod"|bc -l)
uy=$(echo "$Uy/$mod"|bc -l)
uz=$(echo "$Uz/$mod"|bc -l)

theta=$(echo "($theta*3.141592654)/180.0"|bc -l)

X=$(echo "($x*(c($theta)+($ux^2)*(1-c($theta))))+($y*(($ux*$uy)*(1-c($theta))-$uz*s($theta)))+($z*(($ux*$uz)*(1-c($theta))+$uy*s($theta)))"|bc -l)
Y=$(echo "($x*(($ux*$uy)*(1-c($theta))+$uz*s($theta)))+($y*(c($theta)+($uy^2)*(1-c($theta))))+($z*(($uy*$uz)*(1-c($theta))-$ux*s($theta)))"|bc -l)
Z=$(echo "($x*(($uz*$ux)*(1-c($theta))-$uy*s($theta)))+($y*(($uz*$uy)*(1-c($theta))+$ux*s($theta)))+($z*(c($theta)+($uz^2)*(1-c($theta))))"|bc -l)

#Shifting back origin
X=$(echo "$X+$ox"|bc -l)
Y=$(echo "$Y+$oy"|bc -l)
Z=$(echo "$Z+$oz"|bc -l)


printf " Value of X : "
printf "%5.9f\n" $X
printf " Value of Y : "
printf "%5.9f\n" $Y
printf " Value of Z : "
printf "%5.9f\n" $Z
