import json
import random

# Abre el archivo JSON y carga los datos
with open('tweets_extraction.json', 'r') as file:
    data = json.load(file)

# Crea una lista de tuplas donde cada tupla es (índice, tweet)
indexed_data = list(enumerate(data))

# Selecciona 5 tuplas (índice, tweet) aleatorias
random_tweets = random.sample(indexed_data, 5)

# Itera a través de los 5 tweets seleccionados
for index, (original_index, item) in enumerate(random_tweets):
    print(f"Tweet original {original_index + 1} (aleatorio {index + 1}) keys:")  # Imprime el número original y el número del tweet aleatorio
    estructura_datos = {}  # Inicializa un diccionario vacío para almacenar la estructura de datos
    # Procesa cada campo en el elemento actual
    for field, value in item.items():
        if isinstance(value, list):  # Verifica si el valor es una lista
            if value:  # Si la lista no está vacía
                # Almacena el tipo de cada elemento en la lista
                estructura_datos[field] = [type(element).__name__ for element in value]
            else:
                # Indica que la lista está vacía
                estructura_datos[field] = 'Lista vacía'
        else:
            # Almacena el tipo del valor (si no es una lista)
            estructura_datos[field] = type(value).__name__
    # Imprime la estructura del elemento actual
    print(estructura_datos)
