# Java : Conceptos basicos

## Modificadores

- De acceso
  - `Public`
  - `Private`
  - `Protected`
- `Static`
- `Final`

### Modificadores de Acceso - "Public"

Un objeto, atributo o método Público puede ser accedido por cualquier otro objeto o método fuera de su clase. Su acceso no se limita a su scope.

```java
public class Robot{
    public String name;
    public String type;
    public int year;
    public Robot(String name, String type, int year){
        this.name = name;
        this.type = type;
        this.year = year;
    }
    public String getName(){
        return name;
    }
}

public class Main{
    public static void main(String[] args){
        Robot robot = new Robot("Tom","metal",2017);
        String nombre1 = robot.name; // Se puede usar esto
        String nombre2 = robot.getName(); // O esta forma de obtener el nombre
    }
}
```

### Modificadores de Acceso - "Private"

Un objeto, atributo o método **Privado** NO puede ser accedido por cualquier otro objeto o método **fuera** de su clase. Su acceso no se **limita** a su scope.

```java
public class Robot{
    private String name;
    private String type;
    private int year;

    public Robot(String name, String type, int year){
        this.name = name;
        this.type = type;
        this.year = year;
    }
    public String getName(){
        return name;
    }

    // Resto de getters ...
}

public class Main{
    public static void main(String[] args){
        Robot robot = new Robot("Tom","metal",2017);
        String nombre1 = robot.name; // Esto tira error
        String nombre2 = robot.getName(); // Esta es la forma correcta
    }
}
```

### Modificadores de Acceso - "Protected"

Un objeto, atributo o método Protegido NO puede ser accedido por cualquier otro objeto o método fuera de su clase, EXCEPTO por sus subclases.

```java
public class Robot{
    protected String name;
    private String type;
    private int year;

    public Robot(String name, String type, int year){
        this.name = name;
        this.type = type;
        this.year = year;
    }
}

public class Drone extends Robot{
    public Drone(String name, String type, int year){
        super(name,type,year)
        this.name = "drone - " + name; // Si se puede acceder a este atributo
        this.type = "drone - " + type; // No se puede acceder
    }
}
```

### Modificador "Static"

Un modificador Estático, hace que un atributo o método, pertenezca a la CLASE y no a la INSTANCIA de la clase. Es posible su uso SIN tener una instancia de la clase.

```java
public class Calculadora{

    public Calculadora(){}

    public static int sumaEntera(int a, int b){
        return a+b;
    }
}

public class Main{
    public static void main(String[] args){
        int a = 10;
        int b = 5
        int suma = Calculadora.sumaEntera(a,b); // No es necesario crear una instancia de la clase
    }
}
```

### Modificadores– “Final”

Un modificador Final, es inicializado con un valor que NO puede cambiar en tiempo de ejecución.

```java
public class Calculadora{

    public static final double PI = 3.1415;
    public static final double E = 2.7182;
    public static int numero = 10;

    public Calculadora(){}
}

public class Main{
    public static void main(String[] args){
        Calculadora.numero = 9; // si lo puedo modificar y todos van a ver el mismo valor
        Calculadora.PI = 34; // No se puede realizar esto
    }
}
```

## Clases y Métodos Abstractos

Una clase abstracta tiene su razón de ser en la herencia. Una superclase abstracta NO tendrá instancias, sino que sus subclases tendrán instancias, y deberán implementar todos los métodos abstractos de la superclase

## Interfaces

Una Interface NO posee implementaciones de métodos (\*). Solo posee DEFINICIONES que obligatoriamente tienen que implementar las clases que implementan esa interfaz. Son utilizadas para unificar clases. Es una colección de métodos abstractos y propiedades constantes

---

[Presentacion de Conseptos de Java](../fuentes/Java_Conceptos_básicos.pdf)
