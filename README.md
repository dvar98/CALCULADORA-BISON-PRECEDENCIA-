# Calculadora bison precedencia 

Este repositorio contiene tres implementaciones de gramáticas en Bison, cada una ubicada en su propia carpeta para evitar conflictos. Cada gramática define una calculadora con diferentes reglas para las operaciones aritméticas.

## Estructura del Proyecto

- **normal_calculator/**: Calculadora con la precedencia usual de los operadores `+`, `-`, `*`, `/`.
- **inverse_calculator/**: Calculadora con precedencia invertida (`/`, `*`, `-`, `+`).
- **low_parenthesis_precedence/**: Calculadora donde los paréntesis tienen la menor precedencia posible.

Cada carpeta contiene los archivos `calculadora.l` y `calculadora.y` para definir el analizador léxico (Flex) y sintáctico (Bison), además de un `Makefile` para facilitar la compilación.

## Requisitos

- **Bison** y **Flex**: Necesitas tener instalados Bison y Flex para poder generar los analizadores.
- **GCC**: Para compilar el código generado.

### Instalación de Dependencias en Linux

```sh
sudo apt-get install bison flex gcc
```

## Cómo Compilar y Ejecutar

1. Clona el repositorio en tu máquina local:
    ```sh
    git clone https://github.com/dvar98/CALCULADORA-BISON-PRECEDENCIA-
    cd tu-repositorio
    ```

2. Calculadora Normal (normal_calculator/)

    Dirígete a la carpeta normal_calculator:

   ``` sh
   cd normal_calculator
    ```
## Genera los archivos con Bison:
 ```sh
bison -d calculadora.y
```

## Genera el analizador léxico con Flex:

```sh
flex calculadora.l
```

## Compila con GCC:

```sh
gcc calculadora.tab.c lex.yy.c -o calculadora -lm
```

## Ejecuta la calculadora:

```sh
./calculadora
```

## Estructura de Archivos

Cada carpeta contiene los siguientes archivos:

    calculadora.l: Archivo Flex para definir los tokens.
    calculadora.y: Archivo Bison para definir la gramática.

## Uso

    Ingresa expresiones aritméticas y obtendrás el resultado en la consola.
    Utiliza CTRL+D (en Linux) para finalizar la entrada de expresiones.


## Estructura del proyecto

- calculadora.l: Archivo de definición léxica que describe los patrones que deben ser reconocidos por el escáner.

- calculadora.y: Archivo de definición sintáctica que define las reglas de gramática y la lógica de la calculadora.

- calculadora.tab.h y calculadora.tab.c: Archivos generados por Bison que contienen las tablas de análisis sintáctico.calculadora.l: Archivo de definición léxica que describe los patrones que deben ser reconocidos por el escáner.

calculadora.y: Archivo de definición sintáctica que define las reglas de gramática y la lógica de la calculadora.

calculadora.tab.h y calculadora.tab.c: Archivos generados por Bison que contienen las tablas de análisis sintáctico.
lex.yy.c: Archivo generado por Flex que contiene el código del escáner léxic

- lex.yy.c: Archivo generado por Flex que contiene el código del escáner léxico

## Licencia 

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

## Equipo

- **Daniel Santiago Varela Guerrero**
- **Miguel Angel Velasco**
- **Sebastian Sabogal Castillo**

