//primer script sencillo Terraform en local
resource "local_file" "productos" {
    content = "Lista de productos para el proximo mes"
    filename = "productos.txt"
}
