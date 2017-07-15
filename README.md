# Spyrographics

VIDEO : 
https://www.youtube.com/watch?v=Puk9GwLdf-g&t=3s

Video de instalación (como instalarlo): https://www.youtube.com/watch?v=obPg2Rfykkg&t=39s
Video de uso (como usarlo): https://www.youtube.com/watch?v=QqH8csJEEi4&t=60s
Videos are in spanish for now only.


GIFS : 

SPYROGRAPHICS ONLY : 
https://media.giphy.com/media/l0HlE1StQMxSopLt6/200.gif#26
https://media.giphy.com/media/3o6ZtoDLw5MFU9Uy9W/200.gif#29
https://media.giphy.com/media/l0HlMiSKaNkZJI8eI/200.gif#34

SPYROGRAPHICS && RESOLUME : 

https://media.giphy.com/media/l2JhFafVpK9UN5xKM/200.gif#15
https://media.giphy.com/media/l2JhFafVpK9UN5xKM/200.gif#15
https://media.giphy.com/media/3oriO07YHnivWJIdZm/200.gif#23

Album de imagenes - ALBUM OF IMAGES MADE WITH THIS SOFT :

https://www.facebook.com/julian.puppo/media_set?set=a.10209248135934727.1073741837.1061460212&type=3

REFERENCIA EN ESPAÑOL:

Aplicación basada en el movimiento de un espirografo para la generación de visuales adaptada para que funcione en el resolume.
Caracteristicas : 

*Uso de libreria de MIDI (Esta mapeada para un nanoKontrol2 , para modificarla se debería hacer directo por codigo, o directamente usar el resolume)

*Uso de OSC utilizando la app ControlOSC (https://play.google.com/store/apps/details?id=com.charlieroberts.Control)

*Visuales Audioreactivas.

INSTALACIÓN : 

1)Instalar Spout. 
2)Instalar SpoutControls
Link : http://spout.zeal.co/download-software/
3)Instalar Processing.
4)Descargar la carpeta con todos los archivos del proyecto y colocarlas dentro de la carpeta de instalación del resolume>plugins>vfx
5)Abrir el archivo que dice "Spyrographics.pde".
Las primeras 6 lineas de codigo indican que librerias se estan utilizando para el proyecto.
descargar librerías faltantes . Ir Tools>Add Tools > Libraries y buscar : 

* Themidibus.
* oscP5.
* Controlp5.
* Minim.
* Spout.

Los controles solo funcionan si se esta abierto como ventana del processing, es decir que si estamos trabajando en resolume no va a funcionar. 

CONTROLES 
 
 * v : Cambia el modo de display. 
 * a : Limpia la pantalla
 * B : PrintScreen

 1) MODO DIBUJAR A MANO. En este modo es solo un patron de dibujos, sin que se mueva.
 
 M: Modo mouse o no mouse. Dibuja solo cuando apretas el mouse o dibuja siempre.
 
 
 2) MODO MATRIX : Te genera una matriz visual de objetos perfectamente separada.
 
 Para controlar las filas y columnas se utilizan las flechas :

  * UP :  Agrega fila.
  * DOWN : Borra fila.
  * LEFT : Agrega columna.
  * RIGHT : Borra columna.


 3) MODO OBJETOS. ESTE ES EL MODO POR DEFECTO
 
 * R: Borra todos los dibujos.
 * C: Te desactiva el ultimo objeto que apretaste
 
 Se pueden crear grupos de objetos seteados con variables para luego poder crear otros y tener distintos grupos.
 para hacer varias figuras moviendose. 
 
 BARRA ESPACIADORA: Setea un grupo de objetos para que no cambien las variables
 (Todos los que se crearon desde que se apreto el mouse hasta que se apreto la barra espaciadora).
 
 4) CONTROLosc - MultiButton Demo.
   Genera también una matriz de dibujos con la posibilidad de activar y desactivar cada dibujo especifico.
   Este modo de display tiene mapeado el layout multibutton demo de la aplicación ControlOSC. 
   
 5) CONTROLosc - MultiTouchXY.
 Te permite manipular cada dibujo utilizando el layout de controlOSC.


 * t,g : Para aumentar y disminuir el tamaño del dibujo
 * y,h : Para aumentar y disminuir la circunferencia de giro
 * u,j : Para aumentar el efecto espirografico.
 * a  : Para limpiar la pantalla
 * d  : Para activar el modo que se limpia la pantalla constantemente
 * q  : Para randomizar de 0 el tamaño al ultimo tamaño asignado.
 * e  : Para activar un random que te rompe la cabeza con el color.
 * i,k Para aumentar y disminuir el HUE
 * o,l Para aumentar y disminuir la saturacion
 * p,ñ Para aumentar y disminuir el brillo.
 * b,n : transparencia. 
 
 Colores del borde
 * 2,3: Tamaño del borde
 * 4,5: Saturación del borde
 * 6,7: brillo del borde
 * 8,9: transparencia del borde

COMO RETOCAR VARIABLES MAXIMAS Y MINIMAS PARA EL RESOLUME : 
 
 Abrir el archivo que dice Spyrographics.txt, ahí figura el nombre de cada variable, el valor maximo y el minimo. 

CAMBIOS PARA HACER : 
- Remplazar los arrays por arraylists. 
- Emprolijar el codigo. 

 
REFERENCE IN ENGLISH

App developed in processing for generating visuales inspired in a spirograph

Features:

* MIDI LIBRARY(Esta mapeada para un nanoKontrol2 , para modificarla se debería hacer directo por codigo, o directamente usar el resolume)

* OSC using ControlOSC (https://play.google.com/store/apps/details?id=com.charlieroberts.Control)

* Audioreactive drawings

INSTALLATION : 

1)Install Spout. 
2)Install SpoutControls
Link : http://spout.zeal.co/download-software/
3)Install Processing.
4)Download the folder with all of the files of the proyect and put them inside plugins>vfx in the resolume installation folder.
5)Open the file with the name "Spyrographics.pde".
The first 6 lines of code tell´s you what libraries are being used. Download missing libraries :
Go to Tools>Add Tools > Libraries y search for : 

* Themidibus.
* oscP5.
* Controlp5.
* Minim.
* Spout.

 HOW TO CHANGE MIN AND MAX POSIBLES VALUES IN RESOLUME : 
 open the file with the name "Spyrographics.txt" , there you will find all the variables names, changes max and min values as you wish.


CONTROLS 
 
 * v : Change displayMODE
 * a : Clears the screen
 * B : PrintScreen

 1) DISPLAY MODE 1 : HANDDRAWING . This mode is for drawing with the mouse.
 Press M for activate the "always draw" or "draw only when press" option
 
 2) DISPLAY MODE 2 : MATRIX : Makes a object matrix separated of drawings
 
 To add or remove columns and rows :
  *UP :  Add row.
  *DOWN : Remove Row.
  *LEFT : Add column.
  *RIGHT : Remove column.


 3) MODO FREE OBJECTS. DEFAULT MODE :
 
 R: Erase all objects 
 C: Erase last object

 You can set diferent groups of figures using SPACEBAR

 
 4) CONTROLosc - MultiButton Demo.

 Also makes a object matrix with the posibility to activate or desactivate each object specifically. It´s used ControlOSC- multibutton demo Layout to work.
  
 5) CONTROLosc - MultiTouchXY.
 Make posible to control each object separated using the multiTouchXY layout also from OSC


 * t,g : size
 * y,h : Amplitud
 * u,j : Speed of the spirographich effect
 * d  : Activate always cleaning mode
 * q  : Randomize size of drawing  using SIZE value as the max posible value and 0 as the min posible value
 * e  : HEADACHE RANDOM COLOR. (IT BURNS YOUR BRAIN)
 * i,k : HUE
 * o,l :saturacion
 * p,ñ : brightness.
 * b,n : Alpha channel. 
 
 STROKE : 
 * 1: HUE
 * 2,3: SIZE
 * 4,5: SATURATION
 * 6,7: brightness
 * 8,9: Alpha channel
 

 
