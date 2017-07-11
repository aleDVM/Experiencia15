# Se tiene un peliculas.txt con diversas peliculas:

# Crear un metodo que lea el archivo, lo abra y devuelva la
# cantidad de lineas que posee.

file = File.open('peliculas.txt', 'r')
data = file.readlines
file.close
puts data.size
