import java.util.Scanner;// se utiliza para leer entradas del usuario desde el teclado.

public class ConversionBases {//Declara una clase pública llamada ConversionBases

    // Convertir un número de una base a otra
    public static String convertir(int numero, int baseDestino) {//Define un método estático llamado convertir que toma un entero numero y un entero baseDestino como parámetros y devuelve una cadena (String)
        if (baseDestino == 10) { //Convierte el número entero numero a una cadena en la base de destino especificada
            return Integer.toString(numero);
        } else if (baseDestino == 2) {
            return Integer.toBinaryString(numero);
        } else if (baseDestino == 8) {
            return Integer.toOctalString(numero);
        } else if (baseDestino == 16) {
            return Integer.toHexString(numero).toUpperCase();
        } else {
            throw new IllegalArgumentException("Base de destino no soportada");
        }
    }

    // Convertir un número de una base a decimal
    public static int deBaseDecimal(String numero, int baseOrigen) {//Define un método estático llamado deBaseDecimal que toma una cadena numero y un entero baseOrigen, y convierte el número de la base baseOrigen a un entero decimal usando Integer.parseInt.
        return Integer.parseInt(numero, baseOrigen);
    }

    // Convertir un número de una base a otra
    public static String convertirBase(String numero, int baseOrigen, int baseDestino) {//Define un método estático llamado convertirBase que convierte un número de baseOrigen a baseDestino. Primero convierte el número a decimal usando deBaseDecimal y luego a la base de destino usando convertir
        int decimal = deBaseDecimal(numero, baseOrigen);
        return convertir(decimal, baseDestino);
    }

    public static void main(String[] args) {//Define el método main, el punto de entrada del programa
        Scanner scanner = new Scanner(System.in);//Crea una instancia de Scanner para leer la entrada del usuario desde el teclado.
        
        // Solicitar el número, base de origen y base de destino desde el teclado
        System.out.print("Introduce el número a convertir: ");
        String numero = scanner.nextLine();
        
        System.out.print("Introduce la base de origen (2, 8, 10, 16): ");
        int baseOrigen = scanner.nextInt();
        
        System.out.print("Introduce la base de destino (2, 8, 10, 16): ");
        int baseDestino = scanner.nextInt();
        
        // Convertir el número y mostrar el resultado
        String resultado = convertirBase(numero, baseOrigen, baseDestino);
        System.out.println(numero + " en base " + baseOrigen + " es " + resultado + " en base " + baseDestino);
        
        scanner.close();
    }
}
