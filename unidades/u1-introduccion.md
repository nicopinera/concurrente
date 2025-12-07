# Introduccion a la Programacion Concurrente

## El problema de la correccion del software

Poder garantizar la corrección del software que construimos es una tarea deseable. En algunas aplicaciones es sin dudas crucial (software para equipamiento médico, vehículos, control de procesos etc.). Estos sistemas cuyas fallas pueden ocasionar daños de gran importancia incluyendo pérdida de vidas humanas, catástrofes ecológicas, grandes pérdidas financieras se denominan **Sistemas Críticos**.

## Limitaciones del testing y la simulacion

Tanto el testing como la simulación involucran experimentos previos al lanzamiento o uso masivo del software. En general ambos métodos proveen una serie de entradas al software y estudian el comportamiento del mismo en esos caos. El testing y la simulación raramente permiten generalizar la usencia de errores, con lo que se pretende afirmar que “El testing puede confirmar la presencia de errores, pero nunca garantizar su ausencia”. Con lo que se pretende afirmar que la verificación sólo puede hacerlo en teoría.

## Verificación (semi) automática de software

Existen serias limitaciones en lo que respecta a la verificación automática de software. Sin embargo, si imponemos algunas restricciones sobre las propiedades que queremos verificar, algunas tareas podrán verificarse automáticamente sobre el sistema.

## El enfoque de modelar

Nuestros modelos representan comportamientos verdaderos de programas escritos en java. Los modelos abstractos de programas se centran en los detalles reales relacionados con la representación de datos, asignación de recursos y la interacción con el usuario. Introduciremos mecanismos para verificar que el modelo satisface condiciones particulares de seguridad y las propiedades de progreso que son requeridas por las aplicaciones.

Estos mecanismos de verificación son posibles gracias a una herramienta de modelado, con la que comprobaremos exhaustivamente el modelo utilizado, lo que permite comprobar propiedades deseables como indeseables para todas las posibles secuencias de eventos y acciones. Los modelos se basan en máquinas de estados finitos y Redes de Petri.

Las máquinas de estados finitos Se utilizan para especificar el comportamiento dinámico de los objetos en métodos bien conocidos de diseño orientado a objetos. tienen una semántica intuitiva, fáciles de entender y una representación gráfica sencilla y tienen propiedades matemáticas bien definidas, que facilitan el análisis formal y la comprobación mecánica de sistemas, evitando el tedio y la introducción de errores inherentes al trabajo manual e intelectual de los métodos formales. Hay que notar que la representación gráfica de las máquinas de estado, limita seriamente la complejidad de los problemas que se pueden abordar. Por lo que se utiliza Redes de Petri.

## Características reactivas de los sistemas concurrentes

Muchos programas concurrentes sueles ser reactivos, es decir su funcionamiento involucra la interacción permanente con el ambiente y otros procesos. Los sistemas reactivos tienen características diferentes a las de los programas transformacionales. En muchos casos estos no computan resultados y suelen no requerir que terminen.

![Sistemas Reactivos](/imagenes/sist_reactivos.png)

## Interacción de programas concurrentes

Los programas concurrentes están compuestos por procesos (threads o componentes) que necesitan interactuar, existen diferentes formas de interactuar como la memoria compartida o el intercambio de mensajes. Además, los programas concurrentes deben, en general, colaborar para llegar a un objetivo común para lo cual la sincronización entre procesos es crucial.

---
