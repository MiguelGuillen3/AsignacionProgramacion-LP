using Microsoft.VisualBasic.FileIO;
using System.Collections.Generic;
using System.Runtime.ConstrainedExecution;
using System.Text;

// INTEGRANTES:
//- Marco Andre Quispe Granda - 20201696
//- Miguel Cesar Aurelio Guillen Bustamante - 20203011
//- Renato Vallejo Arata - 20202174



internal class Program
{
    private static void Main(string[] args)
    {
        var bichos = new List<string>();
        int ded = 0;    // Numero de muertes totales
        int pob = 0;    // Numero de gente total que ha vivido

        Console.WriteLine("         ▀                                ▀");
        Console.WriteLine("           PARADIGMA ORIENTADO A OBJETOS");
        Console.WriteLine("         ▄                                ▄");

        Console.WriteLine("\n╔═════════════════════════════════════════════════╗");
        Console.WriteLine("║ SIMULACION DE UN CONJUNTO DE SERES UNICELULARES ║");
        Console.WriteLine("╚═════════════════════════════════════════════════╝");
        Console.WriteLine("\n┌──────────────────────────┐");
        Console.WriteLine("│    CREACION DE SERES     │");
        Console.WriteLine("└──────────────────────────┘");



        Console.WriteLine("\n█▓ La simulación empieza con la siguiente población: ▓█\n");

        for (int i = 0; i < 100; i++)          // En este bucle se crean los seres y son almacenados
        {
  
            Console.Write((i+1) + ": ");  // Esta funcion del C# se encarga de imprimir en consola
            bichos.Add(CrearSer());
        }

         for(int i = 0; i < 10; i++)         // Aqui se inicia la primera iteración, denominada día
        {
            Console.WriteLine("\n════════");
            Console.WriteLine(" Dia " + (i + 1));
            Console.WriteLine("════════");
            int pobini= bichos.Count;       // Se crea un contador con la poblacion inicial para realizar diversos calculos

            
            mutacion(bichos);           // Al inicio del día, los caracteres tienen una posibilidad de 5% de mutar en una letra 'U'

            Console.WriteLine("▓ Población al inicio del día: ▓");
            Console.WriteLine("\n-Tenga en cuenta que algunos seres pueden haber mutado-\n");
            for (int j = 0; j < bichos.Count; j++)
            {
                Console.WriteLine((j + 1) + ": " + bichos[j]);      // Se muestra toda la lista
            }

            if (bichos.Count < 2)
            {
                   // Si la población llega a ser menor que 2, los seres dejan de reproducirse
                Console.WriteLine("\n«La población se quedo con insuficientes seres para seguir viviendo»\n");
            }
            else
            {
                for(int j = 1; j < pobini; j++)
                {
                    combinar(bichos, bichos[j - 1], bichos[j]);     // Se crean 2 seres nuevos en base a sus progenitores
                    j++;
                }
            }
            

            pob= pob +(bichos.Count-pobini);    // Se ajusta la cantidad total de seres creados


            Console.WriteLine("\n«Luego de la creación de seres de este dia, esta es la nueva población:»\n");

            for (int j = 0; j < bichos.Count; j++)
            {
                Console.WriteLine((j + 1) + ": " + bichos[j]);      // Se imprime el arreglo con la nueva lista de seres vivos
            }

            if (bichos.Count > 50)              // Si la cantidad de seres es mayor a 50, se elimina a los que contengan la letra U
            {
                Console.WriteLine("\n-Hay más de 50 elementos, se procede a eliminar a los que contengan la base nitrogenada 'U'-\n");
                ded = ded + eliminar(bichos);
            }
            else
            {
                Console.WriteLine("\n-Hoy no se elimina a la población-\n");        // Si la poblacion es menor a 50, no se elimina a ningun ser en esta iteración
            }

            // Se muestran los contadores de nacimientos y muertes
            Console.WriteLine("\n█ En total, se han creado " + pob + " nuevos seres.");
            Console.WriteLine("█ En total, han muerto " + ded + " seres.");
        }


    }

    // Funcion para Crear los Seres
    static string CrearSer()
    {
        // Probabilidades de cada letra
        // A(40 %),T(20 %), U(10 %), C(20 %), G(10 %)

        string[] caracteres = { "A", "A", "A", "A", "T", "T", "U", "C", "C", "G", };

        Random rnd = new Random();  // Se inicializa la fumcion random, para generar un número aleatorio
        string ser = null;

        for (int i = 1; i <= 10; i++)
        {
            int num = rnd.Next(0, 9 + 1);       // Se genera un número aleatorio entre 0 y 9
            string letra = caracteres[num];     // Dependiendo del número, se selecciona una letra del arreglo
            ser = ser + letra;              // Se agrega la letra al ser 
        }
        Console.WriteLine(ser);
        return ser;
    }

    static void mutacion(List<string> arr)
    {
        Random rnd = new Random();
        int[] mutacion = new int[100];

        for (int i = 1; i < mutacion.Length; i++)     // Se llena el arreglo de mutacion con los numeros 0 o 1, para ser tomados como probabilidad de 95% y 5%
        {
            // Los parametros para ver si una letra muta son:
            if (i < 95)
            {
                mutacion[i] = 0;    // Si es = a 0, la letra no mutó
            }
            else
            {
                mutacion[i] = 1;    // Si es = a 1, entonces la letra si mutó
            }
        }

        for(int i = 0; i < arr.Count; i++)
        {
            string palabra = arr[i];

            for(int j = 0; j < palabra.Length; j++)
            {
                int muta = rnd.Next(0, 99 + 1);

                if(mutacion[muta] == 1)
                {
                    palabra = palabra.Remove(j, 1).Insert(j, "U");

                    arr[i] = palabra;
                }
            }
        }
    }



    // Funcion para Eliminar los Seres
    static int eliminar(List<string> arr)
    {
        var indices = new List<int>();

        for (int i = 0; i < arr.Count; i++)     // Se establece un bucle para recorrer cada elemento del almacen
        {
            if (arr[i].Contains("U"))   // Se usa la funcion "contains" para saber si en el arreglo se encuentra la 'U'
            {
                indices.Add(i);     // Se añaden los indices a una lista secundaroa para eliminar los seres en la lista principal
            }
        }

        indices.Reverse();          //se invierte la lista para eliminar desde el ultimo elemento que contenga la U hasta el primero 


        for (int i = 0; i < indices.Count; i++)
        {
            arr.RemoveAt(indices[i]);       // Esta funcion del C# ayuda a remover los elementos de la lista
        }

        Console.WriteLine("\n▓ La nueva lista de seres vivos es: ▓ \n");
        for (int i = 0; i < arr.Count; i++)
        {
            Console.WriteLine((i+1)+ ": " + arr[i]);      // Se imprime el arreglo con la nueva lista de seres vivos
        }

        return indices.Count;
    }




    // Funcion para Combinar los Seres
    static void combinar(List<string> arr, string padre, string madre)    // La funcion recibe dos elementos 'string'
    {
        Random rnd = new Random();
        int primercorte = rnd.Next(1, 4 + 1);   // Se obtiene el numero aleatorio del corte en estas dos lineas
        int segundocorte = rnd.Next(1, 4 + 1);

        string nuevoser1 = null;     // Se definen...
        string nuevoser2 = null;     // ...Los nuevos seres




        // se verifica que el porcentaje de "A" y "T", tanto del padre como de la madre sea de al menos 40% para que puedan reproducirse
        if(Decimal.Compare(Decimal.Divide(verificar(padre), padre.Length),Decimal.Divide(4, 10))>= 0 && Decimal.Compare(Decimal.Divide(verificar(madre), madre.Length), Decimal.Divide(4, 10)) >= 0)
        {
            for (int i = 0; i < primercorte; i++)
            {
                nuevoser1 = nuevoser1 + padre[i];   // Se agregan a ambos seres las partes de sus progenitores
                nuevoser2 = nuevoser2 + madre[i];
            }

            for (int i = primercorte; i < primercorte + segundocorte; i++)
            {
                nuevoser1 = nuevoser1 + madre[i];   // Se agregan a ambos seres las partes de sus otros progenitores
                nuevoser2 = nuevoser2 + padre[i];
            }


            for (int i = primercorte + segundocorte; i < padre.Length; i++)
            {
                nuevoser1 = nuevoser1 + padre[i];   // Finalmente se termina de añadir las partes del primer progenitor
                nuevoser2 = nuevoser2 + madre[i];
            }

            arr.Add(nuevoser1);             //se agregan los nuevos seres a la lista
            arr.Add(nuevoser2);

        }
    }


    static int verificar(string cad)            // Funcion para verificar la proporcion de A y T dentro de una cadena
    {
        int cant = 0;                           // Se crea una variable contador

        for(int i =0; i< cad.Length; i++)       
        {
            char letra = cad[i];                // Se examina el primer caracter de la cadena...

            if(letra.Equals('A'))               // ...y se compara tanto con la A como con la T
            {
                cant++;                         // En caso sean iguales, se añade 1 al contador
            }

            if (letra.Equals('T'))
            {
                cant++;
            }
        }
        return cant;
    }
}

