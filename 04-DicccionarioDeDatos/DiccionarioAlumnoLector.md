# 📘 Diccionario de Datos – Plantilla General
       //Libro
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumLibro`     | INT          | 15      | ✅  | ❌  | ❌   | ✅     |                                        | -Numero del libro para identificarlo y matener un registro                                            
| `isbn`        | INT             | 100    | ❌  | ❌  | ❌   | ✅     |             | -                                |              |
| `Titulo`          | VARCHAR       | 100      | ❌  | ❌  | ❌   | ✅     |          | -        Titulo del libro como un identificador                                               
| `Autor`        | VARCHAR      | 150    | ❌  | ❌  | ❌   | ✅     |                   |                                 | 



        // Presta

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumLibro`     | INT          | -      | ✅  | ❌  | ✅   | ✅     |                                         | -                                | Identificador del cliente               |
| `NumLector`        | VARCHAR      | 100    | ❌  | ✅  | ❌   | ✅     |            | -                                | Numero del Lector            |
| `FechaPrestamo`          | DATE         | -      | ❌  | ✅  | ❌   | ✅     | Fecha del prestamo registro         | -                                |                        |

       //Lector

       
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumLector`     | INT          | 15      | ✅  | ❌  | ❌   | ✅     |                                        |    registro                                            
| `NumeroMateria`        | INT             | 100    | ❌  | ✅  | ❌   | ✅     |             | -                                |              |
| `Apellido1`          | VARCHAR       | 20      | ❌  | ❌  | ❌   | ❌     |          | -                                                       
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ✅    | ❌     |    
 
