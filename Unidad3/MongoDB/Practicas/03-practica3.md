# Practica 3. Updates y Deletes

1. Cambiar el salario del empleado Imogene Nolan. Se le asigna 8000.
```json
db.empleados.updateOne({nombre:'Imogene'},{$set:{salario:8000}})
```
![Respuesta](../img/a.png)

2. Cambiar "Belgium" por "Bélgica" en los empleados (debe haber dos).
```json
db.empleados.updateOne({pais:'Belgium'},{$set:{pais:'Belgica'}})
```
![Respuesta](../img/b.png)
4. Reemplazar el empleado Omar Gentry por el siguiente documento:
```json
db.empleados.replaceOne({nombre:'Omar'},{
"nombre": "Omar",
"apellidos": "Gentry",
"correo": "sin correo",
"direccion": "Sin calle",
"region": "Sin region",
"pais": "Sin pais",
"empresa": "Sin empresa",
"ventas": 0,
"salario": 0,
"departamentos": "Este empleado ha sido anulado"
})
```
![Respuesta](../img/c.png)
5. Con un find comprobar que el empleado ha sido modificado

```json
db.empleados.find({nombre:'Omar'})
```
![Respuesta](../img/d.png)

6. Borrar todos los empleados que ganen mas de 8500. Nota: deben ser borrados 3 documentos
```json
db.empleados.deleteMany({salario:{$gt:8500}})
```
![Respuesta](../img/e.png)

7. Visualizar con una expresión regular todos los empleados con apellidos que comiencen con "R"
```json
db.empleados.find({apellidos:/R/})
```
![Respuesta](../img/f.png)

8. Buscar todas las regiones que contenga un "V". Hacerlo con el operador $regex y que no distinga mayúsculas y minúsculas. Deben salir 2.
```json
db.empleados.find({
    region:{
        $regex:/V/i
    }
})
```
![Respuesta](../img/g.png)
9. Visualizar los apellidos de los empleados ordenados por el propio apellido.
```json
db.empleados.find({},{apellido:1}).sort({apellido:1})
```
![Respuesta](../img/h.png)

10. Indicar el número de empleados que trabajan en Google.
```json
db.empleados.find({empresa: 'Google'}).size()
```
![Respuesta](../img/i.png)

11. Borrar la colección empleados y la base de datos
```json
db.empleados.drop()
db.curso.dropDataBase()
```