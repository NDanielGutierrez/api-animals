#api-animals
🐾 Animals API
API REST construida con Node.js, Express y PostgreSQL para gestionar una colección de animales. Proyecto de práctica para aprender a conectar Express con una base de datos real.
🚀 ¿Qué hace esta API?
Permite crear, leer, actualizar y eliminar animales (CRUD completo). Los datos persisten en PostgreSQL — sobreviven reinicios del servidor, a diferencia de los arrays en memoria.
🛠️ Tecnologías usadas

Node.js — entorno de ejecución
Express — framework para construir la API
PostgreSQL — base de datos relacional
pg (node-postgres) — librería para conectar Node.js con PostgreSQL

📁 Estructura del proyecto
animals-api/
├── db/
│   └── config.js       # Configuración del pool de conexiones
├── routes/
│   └── animals.js      # Endpoints CRUD
├── server.js           # Servidor Express
├── .env                # Variables de entorno (no se sube a Git)
├── .env.example        # Template de variables de entorno
└── package.json
⚙️ Instalación y configuración
1. Clona el repositorio
bashgit clone <url-del-repo>
cd animals-api
2. Instala dependencias
bashnpm install
3. Configura las variables de entorno
Copia el archivo de ejemplo y edítalo con tus credenciales:
bashcp .env.example .env
Contenido de .env:
DB_HOST=localhost
DB_PORT=5432
DB_NAME=animals_db
DB_USER=animals_user
DB_PASSWORD=tu_password
PORT=3000
4. Configura PostgreSQL
Conéctate a PostgreSQL y ejecuta:
sqlCREATE DATABASE animals_db;
CREATE USER animals_user WITH PASSWORD 'tu_password';
GRANT ALL PRIVILEGES ON DATABASE animals_db TO animals_user;
GRANT ALL PRIVILEGES ON SCHEMA public TO animals_user;
Luego crea la tabla:
sqlCREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  species VARCHAR(100) NOT NULL,
  age INTEGER,
  habitat VARCHAR(100),
  endangered BOOLEAN DEFAULT FALSE
);
5. Inicia el servidor
bashnpm run dev
Deberías ver: Servidor corriendo en http://localhost:3000
📡 Endpoints
MétodoRutaDescripciónGET/api/animalsObtener todos los animalesGET/api/animals/:idObtener un animal por IDPOST/api/animalsCrear un nuevo animalPUT/api/animals/:idActualizar un animalDELETE/api/animals/:idEliminar un animal
🧪 Ejemplos con curl
Obtener todos los animales:
bashcurl http://localhost:3000/api/animals
Obtener un animal por ID:
bashcurl http://localhost:3000/api/animals/1
Crear un animal:
bashcurl -X POST http://localhost:3000/api/animals \
  -H "Content-Type: application/json" \
  -d '{"name":"Simba","species":"León","age":3,"habitat":"Sabana","endangered":false}'
Actualizar un animal (campos parciales):
bashcurl -X PUT http://localhost:3000/api/animals/1 \
  -H "Content-Type: application/json" \
  -d '{"age":4}'
Eliminar un animal:
bashcurl -X DELETE http://localhost:3000/api/animals/1
🔒 Buenas prácticas aplicadas

Queries parametrizadas con $1, $2... para prevenir SQL injection
Variables de entorno para credenciales — nunca hardcodeadas en el código
Pool de conexiones para manejar múltiples requests eficientemente
Manejo de errores con try/catch en todos los endpoints
.env en .gitignore para no exponer credenciales

📚 Lo que aprendí

Conectar Node.js con PostgreSQL usando la librería pg
Diferencia entre Pool y Client — y cuándo usar cada uno
Por qué los datos en memoria no sirven para producción
Cómo prevenir SQL injection con queries parametrizadas
Flujo completo: Request HTTP → Query SQL → PostgreSQL → Response JSON