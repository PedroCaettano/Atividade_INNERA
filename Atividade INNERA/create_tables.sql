import mysql.connector
from mysql.connector import Error

def inserir_dados_no_banco_de_dados(form_data):
    try:
        # Conectar ao banco de dados
        connection = mysql.connector.connect(
            host='seu_host',
            database='seu_banco_de_dados',
            user='seu_usuario',
            password='sua_senha'
        )

        # Criar a tabela se não existir
        cursor = connection.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS resultados (
                id INT PRIMARY KEY AUTO_INCREMENT,
                bedtime TEXT,
                fall_asleep_time TEXT,
                wake_time TEXT,
                sleep_duration TEXT,
                q5a INT,
                q5b INT,
                q5c INT,
                q5d INT,
                q5e INT,
                q5f INT,
                q5g INT,
                q5h INT,
                q5i INT,
                q6 INT,
                q7 INT,
                q8 INT,
                q9 INT,
                bed_partner INT,
                q10a INT,
                q10b INT,
                q10c INT,
                q10d INT,
                q10e INT,
                q10e_text TEXT,
                total_score INT
            );
        ''')

        # Inserir os dados na tabela
        cursor.execute('''
            INSERT INTO resultados (
                bedtime,
                fall_asleep_time,
                wake_time,
                sleep_duration,
                q5a,
                q5b,
                q5c,
                q5d,
                q5e,
                q5f,
                q5g,
                q5h,
                q5i,
                q6,
                q7,
                q8,
                q9,
                bed_partner,
                q10a,
                q10b,
                q10c,
                q10d,
                q10e,
                q10e_text,
                total_score
            ) VALUES (
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s
            );
        ''', [
            form_data['bedtime'],
            form_data['fall_asleep_time'],
            form_data['wake_time'],
            form_data['sleep_duration'],
            form_data['q5a'],
            form_data['q5b'],
            form_data['q5c'],
            form_data['q5d'],
            form_data['q5e'],
            form_data['q5f'],
            form_data['q5g'],
            form_data['q5h'],
            form_data['q5i'],
            form_data['q6'],
            form_data['q7'],
            form_data['q8'],
            form_data['q9'],
            form_data['bed_partner'],
            form_data['q10a'],
            form_data['q10b'],
            form_data['q10c'],
            form_data['q10d'],
            form_data['q10e'],
            form_data['q10e_text'],
            form_data['total_score']
        ])

        # Fechar a conexão com o banco de dados
        connection.commit()
        cursor.close()
        connection.close()

    except Error as e:
        print(f"Erro ao inserir dados no banco de dados: {e}")

# Exemplo de uso
form_data = {
    'bedtime': '22:30',
    'fall_asleep_time': '5 minutos',
    'wake_time': '06:30',
    'sleep_duration': '6 horas de sono',
    'q5a': 1,
    'q5b': 2,
    'q5c': 3,
    'q5d': 4,
    'q5e': 5,
    'q5f': 6,
    'q5g': 7,
    'q5h': 8,
    'q5i': 9,
    'q6': 10,
    'q7': 11,
    'q8': 12,
    'q9': 13,
    'bed_partner': 14,
    'q10a': 15,
    'q10b': 16,
    'q10c': 17,
    'q10d': 18,
    'q10e': 19,
    'q10e_text': 'Texto de exemplo',
    'total_score': 20
}

inserir_dados_no_banco_de_dados(form_data)

def calcular_pontuacao(form_data):
    # ...
    total_score = form_data['q5a'] + form_data['q5b'] + form_data['q5c'] + form_data['q5d'] + form_data['q5e'] + form_data['q5f'] + form_data['q5g'] + form_data['q5h'] + form_data['q5i'] + form_data['q6'] + form_data['q7'] + form_data['q8'] + form_data['q9']
    form_data['total_score'] = total_score
    inserir_dados_no_banco_de_dados(form_data)
    print(f"Pontuação total: {total_score}")
