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

synchronized(this){
    totalAmmount=cash;
    cash=0;
}
synchronized(controlCars){
    totalAmmount=cash;
    cash=0;
}

```

---
