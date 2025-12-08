# Preguntas de Coloquio

## Unidad 1

### ¿Qué es una clase viva?

Toda aquella clase que implemente la interfaz Runnable o extienda de la clase Thread y se vuelva capaz de ser ejecutada por un hilo. Cuando genero un “New Thread” se le pasa por parámetro una instancia de una clase que tenga implementado el método “run ()”.

### Cuándo termina un programa?

Cuando todos los hilos no daemon terminen. Si un hilo daemon se está ejecutando y se termina el programa, ese hilo también termina.

### Concepto del interleaving y como se ejecutan los procesos concurrentes

Los procesos concurrentes se ejecutan intercalando las acciones atomicas que los componen, llamamos a esto interleaving, se refiere a la forma en que las instrucciones de múltiples hilos o procesos se mezclan y ejecutan de manera no secuencial. Ir cambiando entre los procesos actuales.

### Que es un sistema critico

Sistemas cuyas fallas pueden ocasionar daños de gran importancia, incluyendo perdida de vidas humanas, catastrofes ecologicas y grandes perdidas financieras.

### Qué problema existe con el testing

El testing raramente permiten generalizar la ausencia de errores, garantiza la presencia de errores pero no la usencia de los mismos.

### Que cosas pueden suceder con un hilo (concepto de starvation, deadlock, exclusión mutua, condición de carrera, livelock)

- La **exclusión mutua** es una propiedad para el control de la concurrencia para prevenir las condiciones de carrera. Es requisito de que un hilo de ejecución nunca entre en su sección critica al mismo tiempo que otro hilo está ejecutando.
- **Condiciones de carrera**: Cuando el resultado de la ejecución de varios hilos concurrentes puede ser correcto o incorrecto dependiendo como se entrelacen los hilos. El problema aparece cuando varios hilos hacen ciclos de modificación de una variable compartida (lectura + modificación + escritura)
- **Deadlock o punto muerto**: Es un estado en el que cada miembro de un grupo de procesos/hilos está esperando otro miembro, incluido el mismo, tome medidas (enviar un mensaje o liberar el bloqueo)
- **Livelock**: se produce cuando dos o más procesos repiten continuamente la misma interacción en respuesta a cambios en los otros procesos sin realizar ningún trabajo útil. Estos procesos no están en estado de espera y se ejecutan simultáneamente.
- **Inanición o starvation**: es un problema donde un proceso se le niega perpetuamente recursos para procesar su trabajo, puede ser causado por errores en algoritmos, fugas de recursos e intencionalmente a través de un ataque de denegación de servicio.

### Determinismo e indeterminismo

Un sistema es deterministico cuando estando en un estado frente al mismo evento, va al mismo lugar siempre. Un sistema indeterministico es aleatorio al estado que puede saltar frente al mismo input.

### Definición de proceso, hilo (puedes darle un ejemplo para darte a entender), ¿cuál es más fácil de crear y de matar?

Un proceso es una unidad de atividad que se caracteriza por la ejeucion de una secuencia de instrucciones, un estado actual y un conjunto de recursos del sistema. Un hilo permite a un proceso ejecutar varias tareas a la vez, los distintos hilos de ejecucion comparten recursos, permitiendo llevar a cabo distintas funciones simultaneamente. Los procesos son independientes, llevan bastante información de estados, e interactúan sólo a través de mecanismos de comunicación dados por el sistema. Los hilos generalmente comparten otros recursos de forma directa. Es más simple y rápido cambiar de un hilo a otro dentro del mismo proceso, que cambiar de un proceso a otro. Este fenómeno se debe a que los hilos comparten datos y espacios de direcciones, mientras que los procesos, al ser independientes, no lo hacen.

### Que es una sección critica

Los recursos compartidos pueden conducir a un comportamiento inesperado o erróneo, por lo que las partes del programa donde se acceden al recurso compartido deben protegerse de manera que se evite el acceso concurrente. Esta sección protegida es la sección critica o región critica. No puede ser ejecutado por más de un proceso/hilo a la vez.

### Estados de los hilos (son 7)

- **Nuevo**: El hilo ha sido instanciado pero aún no ha comenzado su ejecución.
- **Ready to Run**: Está en la cola de espera, listo para ser ejecutado tan pronto como el planificador (scheduler) del sistema le ceda tiempo de CPU.
- **Running**: Actualmente está utilizando la CPU.
- **Sleeping**: El hilo se ha puesto a dormir explícitamente (`Thread.sleep()`). La diferencia clave es que volverá automáticamente al estado "Ready to Run" después de que pase el tiempo especificado.
- **Blocking**: Está esperando un recurso, generalmente la adquisición de un bloqueo (lock) o un monitor para ingresar a una sección crítica de código.
- **Waiting**: Similar a Bloqueado/Sleeping, pero este hilo está esperando indefinidamente a que otro hilo le envíe una señal o notificación específica (`wait()` y `notify()`). No tiene un temporizador.
- **Dead**: La ejecución del hilo ha finalizado, ya sea porque completó su tarea o porque se produjo una excepción no controlada.

### Que es un sistema reactivo

En un sistema reactivo, su funcionamiento involucra la interaccion permanente con el ambiente y otros procesos, no computan resultados y suelen no requerir que terminen.

### Diferencia entre estado bloqueado y dormido

El estado bloqueado esta esperando un recurso, en el estado dormido es por un tiempo determinado, no necesariamente esta esperando un recurso.

- Que es un autómata (tener cuidado aquí hay que saber esta relación con el tp final, y las expresiones regulares)
- Concepto de símbolo, vocabulario o alfabeto, cadena, cadena vacía, concatenación de cadenas, universo del discurso.
- Que es el lenguaje y no vacío
- Que es la gramática
- Conocer los tipos de gramática y lenguaje (de tipo 0 a 3), Tenes que saber la jerarquía de Chomsky
- Conocer los tipos de autómata (de Turing, linealmente acotado, de pila y el regular; saber cuál tipo pertenece a cada uno en el orden seria 0,1,2 y 3)
- Hay que entender la relación que existe en el tp final; lo que sucede es que la expresión regular es un lenguaje de tipo3 generado por una gramática 3 y el autómata de tipo 3. En el tp final implementamos eso Tenes que saber explicar la relación entre gramática, lenguaje y autómata.
- Siendo que un autómata en un sistema que la entrada son la cadena de símbolos los reconoce y las transforma en otros símbolos (en el tp final cual serian nuestra entrada, es una pregunta que va en el tp final); rpta: las transiciones
- Autómata de mealy y Moore de que depende la salida, ventajas y desventajas de cada uno
- Que es el estado accesible de un autómata
- Que es un autómata conexo ¿la máquina de Turing acepta el definido por el conjunto, siendo a el alfabeto? Rpta: a^2^n
- Que es una red de Petri y para qué sirven
- Que es una red de petri autonoma y no autonoma
- Que es una red de petri ordinaria
- Que es una maquina de estado
- Que es un mg de eventos
- Cuando existe conflicto estructural, y cuando existe el libre de conflicto y la libre eleccion (hay una relacion entre las tres)
- Que es una red de petri simple
- Que es una red de petri pura e impura y si puedo volver la pura en impura
- Que es una red de petri coloreada, para que sirven
- Que es un arco inhibidor
- Como se resuelven los indeterminismos; rpta: implementando una politica
- Saber explicar y dibujar la red de petri lector y escritor con exclusion mutua
- Dibujar y explicar la red de petri de los filosofos, ¿hay alguna forma de hacerla mas simple?
- Dibujar y explicar la red de petri productor consumidor
- Dibujar y explicar la red de petri de la barberia, ¿como se resuelve el bug que tiene esta red?
- Aclaracion a las tres redes anteriores saber: invariantes de plaza, transicion, si es viva, pseudo viva y quasi viva; entender si es acotada, segura, si hay deadlock, cuando hay conflicto estructural, efectivo y general (antes de que te pregunte si hay conflicto general te preguntara por el concepto de grado de habilitacion)
- Que es una red de petri acotada
- Que es una red de petri segura
- Concepto de red de petri viva, pseudoviva y cuasiviva
- concepto de homestate y rdp reversible
- Definicion y cuando ocurre estructural, efectivo y general (podes aprenderte algunas redes que tengan estos conflictos asi podes explicarlas bien)
- Que es el grado de habilitacion (se relacion con el conflicto general)
- Que son los invariantes, que es un invariante de plaza (componente conservativo) y de transicion (componente repetitivo)
- Concepto de persistencia
- Que es un grafo de marcado
- Que es un grafo de cobertura (es el del macro marcado)
- Que es la matriz de incidencia, que representa
- Cual es la ecuacion fundamental de la redes de petri, explicar cada parte de la misma; ¿cómo sabes que el estado al que llegaste es valido?
- Cuales son las desventajas de los semaforos
- Cuales son las primitivas de los semaforos
- Concepto de ownership del lock y si el semaforo tiene concepto de ownership
- Cual es la ventaja del monitor y que es un monitor
- Que contiene el monitor; rpta: variables y procedimientos
- ¿lo que hace el hilo, lo hace dentro o afuera?
- Entender como funciona internamente el monitor (cuantos hilos puede haber dentro, por ejemplo, saber porque tiene un metodo de acceso publico)
- Que son las variables de condicion
- Saber las 4 politicas (a mi me tomo mayormente la de signal and urgent wait)
- Hay un tema con los tiempos en el urgent and wait por ejemplo, el tema de los tiempos de los hilos los resuelve el scheduler quien da esos tiempos de procesamiento para que no hay ados hilos dentro del monitor, y el hilo que esta por ejecutarse lo pone en estado ready to run
- ¿yo hilo que puedo hacer sobre una variable de condicion? Rpta: wait(), signal() y isempty()-----→ el isempty() se lo olvidan mucho en los coloquios, pero muchisimo entender el diagrama de secuencias de la clase monitor hay una parte donde explica la red de petri productor consumidor, que esta implementado con semaforos; tenes que entender esto y ademas una pregunta puntual es: ¿si hay mas de un mutex y hay que tomar varios el orden influye? Rpta: la idea es implementarlo con un monitor
- Que es una red de petri con tiempo
- Que es una semantica de tipo fuerte y debil
- Cuales son los intervalo de tiempo que se puede dar a una transicion
- Analisis de tiempo (no haras un analisis de tiempo solo tenes que entender que la ejecucion de todos los elementos en su peor caso no equivale al peor caso de ejecucion del sistemas completo)
- Que es una expresion regular
- Para que sirven las expresiones regulares
- Entender la relación entre las expresiones regulares y las invariantes (va para el tp final tambien)
- Concepto de lock
