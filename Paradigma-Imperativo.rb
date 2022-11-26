#INTEGRANTES:
#- Marco Andre Quispe Granda - 20201696
#- Miguel Cesar Aurelio Guillen Bustamante - 20203011
#- Renato Vallejo Arata - 20202174

def almacen
  almacen = []  # Se crea el arreglo almacen, donde se guardaran todos los seres
  
  ded = 0
  pob = 0

  puts ""
  puts "          ▀                           ▀"
  puts "              PARADIGMA IMPERATIVO"
  puts "          ▄                           ▄"
  puts ""

  puts "╔═════════════════════════════════════════════════╗"
  puts "║ SIMULACION DE UN CONJUNTO DE SERES UNICELULARES ║"
  puts "╚═════════════════════════════════════════════════╝"
  puts ""

  puts "┌──────────────────────────┐"
  puts "│    CREACION DE SERES     │"
  puts "└──────────────────────────┘"

  puts ""
  puts "█▓ La simulación empieza con la siguiente población: ▓█"
  puts ""
  
  contadorParaImprimirSer = 0
  for i in (0..99)
    almacen[i]= crear_ser  # Se llena el arreglo almacen, creando los seres
    contadorParaImprimirSer = contadorParaImprimirSer + 1
    print contadorParaImprimirSer
    print ": "
    puts almacen[i]   # Se imprime el arreglo
  end

  for i in (1..5)  # Se inicia la primera iteracion que es denominada como dia, en este caso, se probaran 5 días
    puts ""
    print "Dia "
    print i
    pobini = almacen.length
    
    mutacion(almacen) # Los caracteres tienen un 5% de posibilidad de mutar en una letra U

    puts ""
    puts "▓ Población al inicio del día: ▓"
    puts ""
    puts "-Tenga en cuenta que algunos seres pueden haber mutado-"
    for j in (0..almacen.length-1)
      print j
      print ": "
      puts almacen[j]   # Se imprime el arreglo
    end


    if (almacen.length < 2)
      # Si la poblacion llega a ser menor de que 2, los seres dejan de reproducirse
      puts ""
      puts "«La población se quedo con insuficientes seres para seguir viviendo»"
      puts ""
    
    else

      for j in (1..pobini)
        combinar_seres(almacen,almacen[j-1],almacen[j])
      end
    
    
    end

   
    
    pob = pob + (almacen.length-pobini)

    puts ""
    puts "«Luego de la creación de seres de este dia, esta es la nueva población:»"
    puts ""
    
    for j in (0..almacen.length-1)
       print j+1
       print ": "
       puts almacen[j] # Se imprime el arreglo con la nueva lista de seres

    end

    
    if(almacen.length > 50)  # Si hay mas de 50 elementos restantes en el arreglo...
      puts ""
      puts "-Hay más de 50 elementos, por ello se procede a eliminar a aquellos seres que contengan 'U'-"
      puts ""
      almacen_base=almacen.length
      eliminar(almacen)  #...Se utiliza la funcion eliminar
      ded=ded+(almacen_base-almacen.length)
    else
      puts ""
      puts "-Hoy no se elimina a la población-"
      puts ""

    end

    # Se muestran los contadores de nacimientos y muertes

    puts ""
    print "█ En total, se han creado "
    print pob
    print " nuevos seres"

    puts ""

    print "█ En total, han muerto "
    print ded
    print " seres"
    puts ""
    puts ""


  end

  

  
end

# Funcion para la Mutacion de Seres

def mutacion (array)
  mutacion = Array.new(100) # Se crea el arreglo, para luego llenarse con los numeros 0 o 1, para ser tomados como probabilidad de 95% y 5%
  
  # Los parametros para ver si una letra muta son:
  for i in(1..mutacion.length)
    if(i <= 95) 
      mutacion[i]= 0       # Si es = a 0, la letra no mutó
    else 
      mutacion[i] = 1       # Si es = a 1, entonces la letra si mutó
    end
  end 

  for i in (0..array.length)
    palabra = array[i]
    
    for j in (0..palabra.to_s.length)
      muta = (rand * 99).to_i

      

      if(mutacion[muta]==1)
        

        palabra = palabra.to_s.tr("C","U")

        
          
        array[i]=palabra 
          
        end
      end
    end
 end







# Funcion para Crear los Seres
def crear_ser
  caracteres = ["A","A","A","A","T","T","U","C","C","G"]  # A(40 %),T(20 %), U(10 %), C(20 %), G(10 %)

  ser =''

  for i in (1..10)         

    num = (rand * 9).to_i         # Se genera un número aleatorio entre 0 y 9
    #puts num

    letra = caracteres[num]     # Dependiendo del número, se selecciona una letra del arreglo

    #puts letra

    ser = ser + letra     # Se agrega la letra al ser final, si es que este no mutó
      
  end

  return ser
  
end


# Funcion para Combinar los Seres
def combinar_seres(array, padre, madre) # La funcion recibe dos elementos 'string' y un array


  primercorte = (rand(1..4)).to_i  # Se obtiene el numero aleatorio del corte en estas dos lineas
  segundocorte = (rand(1..4)).to_i

  nuevoser1= ""  # Se definen...
  nuevoser2= ""  # ...Los nuevos seres

  # Se verifica el porcentaje de "A" Y "T" para que estos puedan reproducirse
  if((verificar(padre)/padre.to_s.length*4/10).to_f>= 0 && (verificar(madre)/madre.to_s.length* 4/10).to_f >= 0)
    for i in (0..primercorte)
      nuevoser1 = nuevoser1 + padre[i].to_s  # Se unen las partes para el nuevo ser en el primer corte
      nuevoser2 = nuevoser2 + madre[i].to_s
    end
    
    for i in (primercorte..primercorte+segundocorte)
      nuevoser1 = nuevoser1 + padre[i].to_s  # Se unen las partes para el nuevo ser en el segundo corte
      nuevoser2 = nuevoser2 + madre[i].to_s
    end

    for i in (primercorte+segundocorte..padre.to_s.length)
      nuevoser1 = nuevoser1 + padre[i].to_s  #Finalmente se añaden las partes del primer progenitor
      nuevoser2 = nuevoser2 + madre[i].to_s
    end

    array.push(nuevoser1)
    array.push(nuevoser2)
    

  end

end

# Funcion para verificar la proporcion de A y T en la cadena
def verificar(cad)
  cant=0  # Variable contador

  for i in (0..cad.length)
    letra=cad[i]

    if (letra == "A")
      cant += 1
    end
    if (letra == "T")
      cant += 1
    end

  end

  return cant

end


# Funcion para Eliminar los Seres
def eliminar (arreglo)

  count = 0     # Contador de muertes
  indices = []


  for i in (0..arreglo.length)  # Se establece un bucle para recorrer cada elemento del almacen

    if (arreglo[i].to_s.include?("U")  == true)  # Se usa la funcion "to_s.include?" para saber si en el arreglo se encuentra la 'U'
      
      indices.push(i)   # En esta linea, se añaden los indices a la lista para eliminar los seres
      count = count + 1  
    end
  end
  puts count

  indices_rev = indices.reverse()      # Se recorre cada elemento del almacen


  for i in (0..indices.length)
    arreglo.delete_at(indices_rev[i].to_i)  # Se elimina el elemento del arreglo basado en la posicion indicada en el arreglo listas, la funcion "delete_at" del lenguaje Ruby ayuda a remover los elementos del arreglo
  end

  puts ""
  puts ""
  puts "▓ La nueva lista de seres vivos es: ▓ "
  puts ""
  for i in (1..arreglo.length-1)
    print i
    print ": "
    puts arreglo[i]  # Se imprime el arreglo con la nueva lista de seres vivos
  end

  return indices.count
  
end


puts almacen

