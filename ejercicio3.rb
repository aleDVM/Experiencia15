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
  file = File.open(text, 'r')
  line = file.readlines
  file.close 
  sum = 0 
  a = 0
	line.each do |l|
		data =  l.split(' ')
		data.each do |o|			
			h = o.split(' ')
			f = h.select{|e| e == st}			
			if h.include?(st)
				a += 1
			end
		end	
	end 
	
print "La cantidad de veces que se encuentra la palabra #{st} es #{a} "

end

 
read2('peliculas.txt', sentence)
