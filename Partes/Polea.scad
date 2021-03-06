/*
    Scanner para análisis tridimensional de cobertura vegetal del suelo
    
    Descripción de la pieza: Polea de 40mm de diametro para transmisión de movimiento del carro.
    Cantidad requerida: 8.

    Autor: Matias J. Micheletto    
    Noviembre 2017
    Directores: Rodrigo Santos - Juan Galantini
    Laboratorio de Sistemas Digitales
    Universidad Nacional del Sur - Departamento de Ingeniería Eléctrica y Computadoras    
*/

$fn = 100;  // Resolucion del modelo

H = 5;      // Altura
Rp = 1.5;     // Radio de la pista (menor que H/2)
R = 19.5+Rp;// Radio exterior
Ra = 2.55;  // Radio eje


// Orificios
Nh = 6;     // Cantidad
Rh = 5;     // Radio
Dh = R/2+1; // Separacion desde el centro

// Ahuecamiento
Di = 2;     // Borde interior
De = 2.5;   // Borde exterior
e = 3;      // Profundidad

difference(){
    cylinder(r = R, h = H); // Envolvente
    
    cylinder(r = Ra, h = H); // Eje

    // Pista para la cuerda
    rotate_extrude(convexity = 10)
    translate([R, H/2, 0])
        circle(r = Rp);  

    // Orificios
    for(angle = [0 : 360/Nh : 360])
        translate([Dh*sin(angle),Dh*cos(angle),0])
            cylinder(r = Rh, h = H); 

    // Ahuecamiento superior
    translate([0,0,H-e])
        difference(){
            cylinder(r = R-De, h = e);
            cylinder(r = Ra+Di, h = e);
        }
}
