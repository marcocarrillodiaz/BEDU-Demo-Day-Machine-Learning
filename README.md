# BEDU-Demo-Day-Machine-Learning
## Proyectos elaborados para el curso BEDU Machine Learning

## ***Marco Antonio Carrillo Díaz***

*La lógica te llevará de "A a B", pero la imaginación te llevará donde sea: **Albert Einstein***
****

**Introducción**

El estudio de cualquier rama del conocimiento es en sí muy intereante, la suma de este conocimiento ha traido como consecuencia la consecución de objetivos que hace hasta hace una decada parecían imposibles.

Machine Leraning y la ciencia de datos, aunque parecen términos nuevos, aunque no lo son, pues siempre el manejo de la información ha sido y será una herramienta útil en cualquier actividad que realicemos; ha permitido que la sociedad en general sea transformada y los paradigmas sociales del siglo pasado cambien de forma drástica: la forma en que socializamos e interactuamos con los demás sufrió un impacto muy importante, por mencionar un ejemplo. Este cambio provocó que se pudieran "modelar" nuestros habitos, pero para conseguir esto, antes, se tuvieron que generar los datos, y quien generó estos datos: nosotros mismos. Con el auge de los telefonos celulares y nuestra interacción a traves de ellos se vivió un bum desde aproximadamente 10 años a la fecha. Los modelos que los datosy la tecnología  nos han permitido crear, ya estaban presentes matemáticamente hablando. Así pues con el auge tecnológico y el crecimiento de la data que ha traido es que cobra relevancia importante el estudio del Machine Learning y la Ciencia de Datos.

***
**Acerca del presente trabajo**

El presente trabajo es la conclusión de una aproximación al universo del analisis formal de los datos, su recolección, limpieza, transformación e interpretación para entender el comportamiento de los mismos que se van generando para dar estimaciones futuras que a su vez nos permitirian tomar mejores decisiones o entender mejor un problema o evento.

El primer Modulo empezamos con las bases de datos relacionales o SQL a tra vez del uso de MySQL y poteriormente nos adentramos a las bases de datos no relacionales o NoSQL mediante el uso de MongoDB, el contenido de la carpeta **Modulo 1** Contiene el análisis de una propuesta para trabajar con presupuestos y su aplicación en las diferentes áreas de una empresa: Gastos, Cxp, etc. por mencionar algunas. Posteriormete se hace un analisis sobre como sería su implementación en MongoDB.

El Modulo 2 se introduce en el manejo de R y R Studio como herramienta para crear código, no se tiene carpeta para este modulo pues todo lo que se revisó (Estadistica Descriptiva, graficas y su interpretación) se retoma del lado de Python en el Módulo 4.

El **Módulo 3** revisa tópicos como la recolección y tratamiento de los datos, donde es importante la limpieza y transformación de los mismos para su manipulación posterior: En este caso el contenido de esta carpeta presenta el analisis sobre el comportamiento del valor del Bitcoin a la fecha del 7 Julio y actual; para ello se dispone de un archivo histórico con valores del Bitcoin desde el 2013. Posteriormente al encontrar "vaciós" en el archivo, se consulta el histórico en línea y se le aplican una serie de procesos de limpieza y transformación de las columnas para darle el formato adecuado a los datos para su posterior manipulación.

El **Modulo4** toma el trabajo del módulo anterior y realiza un analisis estadístico mas profundo sobre los datos con los que contamos presentando boxplots, histogramas, graficas de densidad, heatmaps para una mejor comprension de la correlación de los datos. Todo esto para tener una mejor perspectiva y poder estimar inicialmente si los datos presentan algun patron o si por el contratio es necesario transformarlos nuevamente, para generar series de tiempo, como resulta ser el caso, pues la estadística nos lleva a concluir que el analisis total de los datos no nos dirige a ningún punto y es necesario segmentarlos mediante series de tiempo para un posterior analisis.

El **Módulo 5**, finalmente nos introduce de lleno en el Machine Learning. Entender desde la importancia de tener una buena muestra de datos los cuales nos permita modelar posteriormente el problema que queremos resolver, la segmentación de la muestra, definir una buena muestra para poder entrenar los diferentes algoritmos de Machine Learning. El proyecto de este apartado consiste en una clasificación binaria donde se pretende detectar casos de fraude en las operaciones con tarjeta de credito. El data set con el que se contó estaba desbalanceado por lo que cobra especial importancia no tomar decisiones "ingénuas" pues es necesario implementar estrategias de balanceo para posteriormente procesar los diferentes algoritmos, de este modo se observan que los resultados cambian trayendo consigo mejores resultados para no caer en "falacias" y concluir erroneamente. En este proyecto se aplican practicamente los apartados de los Modulos 2 al 4, donde se retoma el trato de los datos, su transformación y posterior analisis estadístico para entender como se distribuyen los datos. Cobra especial importancia las Matrices de confusion mismas que se grafican y de este modo se aprecia mejor que tambuenos resultados presentan los diferentes algoritmos de Machine Learning, donde se evalua el comportamiento mediante Regresion Lineal sin balanceo, Regresión Lineal con Penalizacion para el balanceo, Regresión lineal con Subsampling para el balanceo de los datos terminando con Regresión Lineal con Oversampling como estrategia de balanceo; posteriormente se siguen con algoritmos de Arboles de decision, Random Forest, Naive Bayes, K means y Redes Neuronales. Se intentó implementar un algoritmo de Máquina de Soporte Vectorial, sin embargo el proceso demoró demasiado por lo que tuvo que interrumpirse.

***

## Conclusiones
Cuando llegamos al lenguaje R y vi las capacidades del mismo así como los resultados que podía generar, pensé que era la herramienta ideal para Macine Learning, sin embargo, Python en lo personal, considero que es mejor ya que el manejo de los datos es más legible, R requiere de un mejor entendimiento matemático de lo que se pretende; por ello es que me decidí continuar con la ruta de Python para el analisis de cada uno de los modelos de Machine Learning. Por otro lado el analisis estadístico así como su inerpretación es de suma importancia para tener un panorama general del comportamiento de los datos, de este modo podemos darnos una idea de la estrategia a seguir, si es necesario tomar una muestra más pequeña u si esta no es suficiente o se encuentra desbalanceada como fue el caso del Módulo 5 y finalmente la comparación de los diferentes algoritmos de machine learning nos enseña que dependiendo de lo que se busque y el conjunto de datos el modelo puede adaptarse a nuestras necesidades, pero para conseguir esto es necesario probarlos para de este modo justificar nuestra decisión.


## Agradecimientos

A Intelisis, la empresa que me ha permitido desarrollarme y crecer profesionalmente.
A Julio Olmos, Director de Producto Intelisis, su ejemplo y determinación así como el apoyo que me otorgó para poder formar parte de este grupo.
A mis compañeros de grupo, sus intervenciones en cada uno de los módulos fueron de suma importancia pues enriquecieron el contenido del curso.
