# Introduccion a la Programacion Concurrente

## El problema de la correccion del software

Poder garantizar la corrección del software que construimos es una tarea deseable. En algunas aplicaciones es sin dudas crucial (software para equipamiento médico, vehículos, control de procesos etc.). Estos sistemas cuyas fallas pueden ocasionar daños de gran importancia incluyendo pérdida de vidas humanas, catástrofes ecológicas, grandes pérdidas financieras se denominan **Sistemas Críticos**.

## Limitaciones del testing y la simulacion

Tanto el testing como la simulación involucran experimentos previos al lanzamiento o uso masivo del software. En general ambos métodos proveen una serie de entradas al software y estudian el comportamiento del mismo en esos caos. El testing y la simulación raramente permiten generalizar la usencia de errores, con lo que se pretende afirmar que “El testing puede confirmar la presencia de errores, pero nunca garantizar su ausencia”. Con lo que se pretende afirmar que la verificación sólo puede hacerlo en teoría.

---
