# Crear un metodo que reciba dos strings, este metodo creara un archivo
# index.html y pondra como parrafo cada uno de los strings recibidos.
puts 'enter your name'
name = gets.chomp
puts 'enter your last name'
last_name = gets.chomp

def receive(a, b)
  file = File.open('index.html', 'w')
  file.puts "<p>#{a}</p>
   <p> #{b}</p>"
  file.close
end
receive(name, last_name)

# Crear un metodo similar al anterior, que ademas pueda recibir un arreglo.
# Si el arreglo no esta vacio, agregar debajo de los parrafos una lista ordenada
# con cada uno de los elementos.
puts 'write a sentence'
sentence = gets.chomp

def add(array)
  if array != nil
    file = File.open('index.html', 'a')
    file.puts "\t<p>#{array}</p>"
  end
end
add(sentence)

# Crear un tercer metodo que ademas pueda recibir un color.
# Agregar color de fondo a los parrafos.
# El retorno de los metodos debe devolver nil.
puts 'enter a color'
color = gets.chomp
def color(c)
  file = File.open('index.html', 'a')
  file.puts "<style type='text/css'>\n\t p { color: #{c}}\n</style>"
  file.close
end
color(color)
