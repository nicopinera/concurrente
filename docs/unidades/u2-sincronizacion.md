# Sincronizacion basada en memoria comparida: Sincronizacion y Semaforos

## Términos Clave de la Concurrencia

- Las operaciones atómicas son aquellas operaciones que siempre se ejecutan hasta terminas todas. O todos se ejecutan juntos o ninguno de ellos se ejecuta. Si una operación es atómica entonces no puede estar parcialmente completa, esta competa o no comenzó.
- Los recursos compartidos pueden conducir a un comportamiento inesperado o erróneo, por lo que las partes del programa donde se acceden al recurso compartido deben protegerse de manera que se evite el acceso concurrente. Esta sección protegida es la sección critica o región critica. No puede ser ejecutado por más de un proceso/hilo a la vez.
- La exclusión mutua es una propiedad para el control de la concurrencia para prevenir las condiciones de carrera. Es requisito de que un hilo de ejecución nunca entre en su sección critica al mismo tiempo que otro hilo está ejecutando.
- Condiciones de carrera: Cuando el resultado de la ejecución de varios hilos concurrentes puede ser correcto o incorrecto dependiendo como se entrelacen los hilos. El problema aparece cuando varios hilos hacen ciclos de modificación de una variable compartida (lectura + modificación + escritura)
- Deadlock o punto muerto: Es un estado en el que cada miembro de un grupo de procesos/hilos está esperando otro miembro, incluido el mismo, tome medidas (enviar un mensaje o liberar el bloqueo)
- Livelock: se produce cuando dos o más procesos repiten continuamente la misma interacción en respuesta a cambios en los otros procesos sin realizar ningún trabajo útil. Estos procesos no están en estado de espera y se ejecutan simultáneamente.
- Inanición o starvation: es un problema donde un proceso se le niega perpetuamente recursos para procesar su trabajo, puede ser causado por errores en algoritmos, fugas de recursos e intencionalmente a través de un ataque de denegación de servicio.

## Gestión de Procesos concurrentes y memoria compartida

Si los diferentes hilos de un programa concurrente tienen acceso a variables globales o secciones de memoria comunes, la transferencia de datos a través de ella es una vía habitual de comunicación y sincronización entre ellos. Las primitivas para la programación concurrente basada en memoria compartida resuelven los siguientes problemas: Sincronización entre procesos y Exclusión mutua.

- Secciones criticas: Son mecanismos de nivel medio de abstracción orientados a su implementación en el contexto de un lenguaje y que permiten la ejecución de un bloque de sentencias de forma segura
- Semáforos: Los semáforos tienen una variable que no es negativa y se comparte entre hilos, se utiliza para resolver el problema de la sección crítica y logra la sincronización del proceso en entornos de multiprocesamiento. Java proporciona la clase Semaphore en el paquete “java.util.concurrent” que implementa este mecanismo
- Monitores: Son módulos de alto nivel de abstracción orientados a la gestión de recursos que van a ser usados concurrentemente por otra clase

## Recursos de Java para Sincronizar threads

Todos los objetos tienen un bloqueo asociado, lock o cerrojo que puede ser adquirido y liberado mediante el uso de métodos y sentencias synchronized. La sincronización fuerza a que la ejecución de los dos hilos sea mutuamente exclusiva en el tiempo. Existen dos mecanismos de bloqueo:

- Métodos synchronized (exclusión mutua): Función con el atributo de Sincronización, permite que un solo hilo la ejecute por vez
- Bloques synchronized (regiones criticas): Bloques que utilizan un lock de un objeto para ingresar.

## Bloques Synchronized

Es el mecanismo para implementar regiones críticas en java para métodos synchronized (exclusión mutua) o para bloques synchronized (regiones criticas) Synchronized puede ser ejecutado con el uso del lock de un objeto (this o explicito otro objeto). En ese caso solo se ejecuta si se obtiene el lock asociado al objeto. Se utiliza en un entorno concurrente y cuando el objeto es explicito, este es definido con el fin de usar su lock y preferentemente es private. La sincronización fuerza a que la ejecución de los dos hilos sea mutuamente exclusiva en el tiempo.

```java
// Bloques synchronized
public void close(){
    System.out.printf("Closing accounting");
    long totalAmmount;
    synchronized(this){
        totalAmmount=cash;
        cash=0;
    }
    /*
    Lock explicito
        synchronized(controlCars){
            totalAmmount=cash;
            cash=0;
        }
    */
    System.out.printf("The total ammount is : %d",totalAmmount);
}

// Metodos Syncronized
public synchronized char recoger(){
    while(!disponible){
        try{
            wait();
        }catch(InterruptedException ex){}
    }
    disponible = false;
    notify();
    return contenido;
}


```

## Lock asociado a los objetos Java

Cada objeto derivado de la clase object (esto es, prácticamente todos) tienen asociado un elemento de sincronización o lock intrínseco, que afecta a la ejecución de los métodos definidos como synchronized en el objeto:

- Cuando un objeto ejecuta un método synchronized, toma el lock y cuando termina de ejecutarlo lo libera
- Cuando un thread tiene tomado el lock ningún otro thread puede ejecutar ningún otro método synchronized por el mismo objeto
- El thread que ejecuta un método synchronized de un objeto cuyo lock se encuentra tomado, se suspende hasta que el objeto es liberado y se le concede el acceso
  Cada clase java derivada de object tiene también un mecanismo de lock asociado a ella que es independiente del asociado a los objetos de esa clase y que afecta a los procedimientos estáticos declarados synchronized.

## Método synchronized

Los métodos de una clase java se pueden declarar como synchronized. Esto significa que se garantiza que se ejecutara con régimen de exclusión mutua respecto de otro método del mismo objeto que también lo sea. Si el método synchronized es estático (static), el lock al que hace referencia es de clase y no de objeto por lo que se hace en exclusión mutua con cualquier otro método estático synchronized de la misma clase.

## Consideraciones sobre métodos synchronized

- El lock es tomado por el thread, por lo que mientras lo tengan tomado, por lo que mientras un thread tiene tomado el lock de un objeto puede acceder a otro método synchronized del mismo objeto.
- El lock es por cada instancia del objeto
- Los métodos de clase (static) también pueden ser synchronized.
- Por cada clase hay un lock y es relativo a todos los métodos synchronized de la clase
- Este lock no afecta al acceso a los métodos synchronized de los objetos que son instancia de la clase
- Cuando una clase se extiende y un método se sobrescribe, este se puede definir como synchronized o no, con independencia de cómo era y como sigue siendo el método de la clase madre.

## Recursos de Java para sincronizar threads

Todos los objetos tienen un bloqueo asociado. Los hilos pueden comunicarse entre sí a través de los métodos definidos en la clase Object y solo se pueden llamar desde un contexto sincronizado. Estos métodos son básicos y engloban los conceptos más importantes. Están definidos e implementados en la clase object:

```java
public final void wait() throws interruptedexception;
```

le dice al hilo de llamada que abandone el bloqueo y se vaya a dormir hasta que algún otro hilo ingrese al mismo monitor y llame notify(). Libera el bloqueo antes de esperar y vuelve a adquirir el bloqueo antes de regresar de dormir. Está estrechamente integrado con el bloque de sincronización, utilizando como una función que no está disponible directamente desde el mecanismo de sincronización. Espera indefinida hasta que reciba una notificación.

```java
public final void wait (long timeout) throws interuptedexception;
```

El thread que ejecuta el método se suspende hasta que, recibe una notificación o transcurre el timeout establecido en el argumento. Wait (0) representa una espera indefinida hasta que llegue la notificación.

```java
public final wait (long timeout, int nanos);
```

Wait en el que el tiempo de timeout es $1000000*timeout + nanos$ nanosegundos

```java
public final void notify ();
```

Despierta un solo hilo que invoco wait() el mismo objeto. Cabe señalar que las llamadas en notify () en realidad no ceden el bloqueo de un recurso. Le dice a un hilo en espera que ese hilo puede despertarse. Sin embargo, el bloqueo no se abandona hasta que el bloqueo sincronizado del notificador se ha completado. Notifica al objeto un cambio de estado, esta notificación es transferida a solo uno de los threads que esperan (han ejecutado un wait) sobre el objeto. No se puede especificar a cuál de los objetos que esperan en el objeto será despertado.

```java
public final void nofityall ();
```

despierta a todos los hilos que llamaron a wait() al mismo objeto. Notifica a todos los threads que esperan (han ejecutado un wait) sobre el objeto.

Todos son métodos de la clase object. Solo se pueden invocar por el thread propietario del lock. En caso contrario lanzara la excepción “IllegalMonitorStateExcepcion”

## Definición de semáforo

Un semáforo es un mecanismo de más alto nivel que synchronized. Es un tipo de objeto y tiene un contador que protege el acceso a uno o más recursos compartidos. Puede controlar el acceso a uno o más recursos que no necesariamente están en el mismo bloque. No posee Ownership o no tiene dueño

Un semáforo como cualquier tipo de datos, queda definido por: Conjunto de valores que se le pueden asignar y un conjunto de operaciones que se le pueden aplicar. También tiene asociada una lista/cola de procesos en la que se incluyen los procesos suspendidos a la espera de su cambio de estado. Los mismos son herramientas básicas de la programación concurrente y son proporcionados por la mayoría de los lenguajes de programación.

### Valores de un semáforo

En función del rango de valores que puede tomar los semáforos se clasifican en:

- Semáforos binarios: pueden tomar solo valores 0 y 1. `var mutex: BinSemaphore;`
- Semáforos generales: Pueden tomar cualquier valor natural, entero no negativo. “var escribiendo: Semaphore”. Tiene los siguientes métodos `acquire (); reléase ()`

`semáforo = 0 -> lock cerrado. | semáforo> 0 -> lock abierto.`

Es posible demostrar que un semáforo general se puede implementar utilizando semáforos binarios. Los sistemas suelen ofrecer como componente primitivo semáforos generales y su uso lo convierte de hecho en semáforo binario.

- Para declarar un semaphore:

```java
Semaphore semaphore = new Semaphore(1);
```

- Cuando un hilo quiere acceder a uno de los recursos compartidos primero debe adquirir el semáforo: `semaphore.acquire();`
- Cuando el hilo ha terminado de usar el recurso compartido debe liberar el semáforo con el que libera el recurso: `semaphore.release();`

Si el contador interno del semáforo es mayor que 0 el semáforo disminuye el contador y permite el acceso al recurso compartido. Un contador mayor que 0 implica que hay recursos que pueden ser utilizados por lo que el hilo puede acceder y utilizar uno de ellos.

Si el contador es 0, el semáforo pone el hilo a dormir hasta que el contador sea mayor que 0. Un valor de 0 en el contador significa que todos los recursos compartidos están siendo utilizados así que el hilo que quiera usar uno de ellos debe esperar hasta que uno este libre

---
