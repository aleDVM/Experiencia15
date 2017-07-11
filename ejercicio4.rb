# Se tiene un archivo con diversos productos, donde la primera columna
# indica el nombre del producto y el resto de las columnas muestra
# el stock en distintas tiendas.
=begin
Producto1, 10, 15, 21
Producto2, 20, 0, 3
Producto3, 4, 8, 0
Producto8, 1, 2, NR
Producto12, NR, 2, NR
# Donde NR significa no registrado.

#Se pide:

# Crear un menu con 5 opciones, se debe validar que la opcion escogida
# sea 1, 2, 3, 4, 5 o 6.

La opcion 1 permite conocer la cantidad de productos existentes.
Al seleccionar esta opcion, se mostrara un submenu que permitira:

a) Mostrar la existencia por productos.
b) Mostrar la existencia total por tienda.
c) Mostrar la existencia total en todas las tiendas.
d) Volver al menu principal.
Hint: Se debe validar que la opcion ingresada sea valida.

La opcion 2 permite que el usuario ingrese el nombre de un producto
y el programa respondera con la cantidad de stock total (suma en las bodegas)
de ese producto.

La opcion 3 muestra los productos no registrados en cada bodega.

La opcion 4 permite conocer los productos con una existencia total menor
a un valor ingresado por el usuario.

La opcion 5 permite registrar un nuevo producto con su respectivo stock
en cada bodega. (Hint: abrir el archivo como append).

Si el usuario ingresa la opcion 6 el programa sale, si ingresa cualquier
otra opcion se debe mostrar que la opcion es invalida, y mostrar el menu
nuevamente y la opcion de elegir.
=end
option = 1
while option > 0 && option <= 6
  puts 'Welcome, Enter your option'
  puts 'Option 1 : Number of existing products'
  puts 'Option 2 : Total stock by product in warehouses'
  puts 'Option 3 : Shows the products not registered in each warehouse'
  puts 'Option 4 : Products with a smaller total quantity to a value'
  puts 'Option 5 : Register a new product with your stock in each warehouse'
  puts 'Option 6 : Exit'

  option = gets.chomp.to_i
  if option > 0 && option <= 6
    case option
      
    when 1
      puts 'Choose an option'
      puts 'Option a : Show product availability'
      puts 'Option b : Show total existence per store'
      puts 'Option c : Show total existence in all stores'
      puts 'Option d : Exit'
      submenu = gets.chomp.downcase
      case submenu

      when 'a'
        puts 'products availability are:'
        file = File.open('products.txt', 'r')
        data = file.readlines
        file.close
        b = nil
        a = data.each do |e|
          b = e.split(', ')
          print " #{b[0]}   "
          sum = 0
          c = b.each_with_index do |el, i|
                sum += el.to_i
              end
               print sum
               puts
        end
        puts

        when 'b'
          puts 'Total existence per store'
          file = File.open('products.txt', 'r')
          data = file.readlines
          file.close
          sum1 = data.inject(0) { |sum, el| sum + el.split(', ')[1].to_i }
          puts "Store 1 #{sum1}"
          sum2 = data.inject(0) { |sum, el| sum + el.split(', ')[2].to_i }
          puts "Store 2 #{sum2}"
          sum3 = data.inject(0) { |sum, el| sum + el.split(', ')[3].to_i }
          puts "Store 3 #{sum3}"

        when 'c'

          file = File.open('products.txt', 'r')
          data = file.readlines
          file.close
            sum = 0

          data.each do |el|
            j = el.split(', ')
            d = j.inject(0) { |sum, el| sum + el.to_i }
             sum += d
          end
          print "Total existence in all stores: #{sum}"
            puts
        else
        end

      when 2
        puts 'Enter the product to consult'
        product_search = gets.chomp
        file = File.open('products.txt', 'r')
        data = file.readlines
        file.close
        data.each do |e|
          d = e.split(', ')
          if d[0] == product_search
            sum = 0
            d.each do |e|
              l = e.to_i
              sum += l
            end
            print "Total stock by product in warehouses: #{sum}"
            puts
          end
        end
      when 3
        file = File.open('products.txt', 'r')
        data = file.readlines
        file.close
        data.each do |e|

          r = e.split(', ').map { |h| h.chomp }

          r.each_with_index do |ele, i|
            if ele == 'NR'
              print " #{r[0]}  warehouse #{i}"
              puts
            end
           end
          end

        when 4
          puts 'Enter an amount'
          amount = gets.chomp.to_i
          file = File.open('products.txt', 'r')
          data = file.readlines
          file.close
          a  sum = 0
            c = b.each_with_index do |el, i|
                  sum += el.to_i
                end
                if sum < amount
                  print " #{b[0]} #{sum}"
                  puts
               end

          when 5
            puts 'Enter a new product'
            product = gets.chomp
            puts 'Enter quantity of product in warehouse 1 or NR'
            warehouse1 = gets.chomp
            puts 'Enter quantity of product in warehouse 2 or NR'
            warehouse2 = gets.chomp
            puts 'Enter quantity of product in warehouse 3 or NR'
            warehouse3 = gets.chomp

            file = File.open('products.txt', 'a')
            file.print "#{product}, #{warehouse1}, #{warehouse2}, #{warehouse3}"
            file.close
            data.each do |e|
              b = e.split(', ')
              sum = 0
              c = b.each_with_index do |el, i|
                sum += el.to_i
              end
                if sum < amount
                  print " #{b[0]} #{sum}"
                  puts
             end
            end
          else
            option = 34
          end
  else
    option = 3
  end

end
