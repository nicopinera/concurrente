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
        Robot robot = new Robot("Tom","metal",2017);
        String nombre1 = robot.name; // Esto tira error
        String nombre2 = robot.getName(); // Esta es la forma correcta
    }
}
```


---