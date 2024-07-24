# Define a imagem Docker personalizada que será usada para o WordPress. Inclui as instruções necessárias para construir a imagem.

# Use a imagem oficial do WordPress como base
FROM wordpress:latest

# Copie o conteúdo do diretório atual para o diretório /var/www/html no contêiner
COPY . /var/www/html

# Defina as permissões corretas para o diretório /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Exponha a porta 80 para acesso ao servidor web
EXPOSE 80

# Comando para iniciar o servidor web
CMD ["apache2-foreground"]
