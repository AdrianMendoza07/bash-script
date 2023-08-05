#!/bin/bash
sender=adrian25336@gmail.com
gapp=psjqjwxzdbcfifbs
sub='Tu lista de libros'

echo 'Bienvenido, con este script podras guardar una lista de libros, son sus respectivos autores'
echo 'Ingresa el nombre del libro'
read  nombre_libro
echo 'Ingresa el nombre del autor'
read  nombre_autor
echo  "$nombre libro - $nombre_autor" >> libros.txt
echo "El libro $nombre_libro de $nombre_autor ha sido agregado a tu lista de libros"
echo "Quieres anadir otro libro a tu lista de libros (Escribe y/n)"
read answer

if [ "$answer" = y ]
then ./miScript.sh

 elif [ "$answer" = n ]; then
 read -p 'Ahora necesito tu correo electronico: ' receiver
	cat > libros.txt
	body =$(cat libros.txt)

	rm libros.txt

	curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
    	--mail-from $sender \
    	--mail-rcpt $receiver\
   	--user $sender:$gapp \
	-T <(echo -e "From: ${sender}
		To: ${receiver}
		Subject:${sub}

		 ${body}")
fi

echo 'Tu lista de libros a sido enviada a tu correo'




