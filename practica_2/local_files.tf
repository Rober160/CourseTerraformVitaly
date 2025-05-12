resource "local_file" "productos" { 
    count = 5
    content = "Lista de productos para el proximo mes"
    filename = "productos-${random_string.sufijo[count.index].id}.txt"
}
