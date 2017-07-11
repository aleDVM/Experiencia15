# Crear un metodo que reciba el archivo peliculas.txt, lo abra y
# cuente la cantidad total de palabras. El metodo debe devolver este valor.
def read(text)
  file = File.open(text, 'r')
  data = file.read
  file.close
  print data.split(' ').size
end
read('peliculas.txt')
# Crear un metodo similar para que ademas reciba -como argumento- un string.
# En este caso el metodo debe contar unicamente las apariciones de ese string
# en el archivo.
puts 'Write a sentence'
sentence = gets.chomp
def read2(text, st)
  file = File.open(text, 'a')
  file.puts "#{st}"
  file.close
  print st.split(' ').size
end
read2('peliculas.txt', sentence)
