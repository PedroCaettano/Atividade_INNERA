from flask import Flask, request, render_template, redirect, url_for
import sqlite3

# Esse código usa Flask para criar uma aplicação web simples que coleta dados de um formulário, 
# armazena-os em um banco de dados SQLite e, em seguida, redireciona o usuário.
#Esse código é uma aplicação básica de coleta de dados usando Flask e SQLite

# EXPLICANDO FUNCIONALIDADES - Passo a Passo:
# 1: A função connect_db() conecta à base de dados chamada responses.db. Esse banco armazena os dados que você coletará do formulário.
# 2: A função create_table() cria uma tabela chamada responses, caso ela ainda não exista. Ela contém colunas para armazenar:
#  • id: um número que identifica cada entrada (autoincrementado).
#  • bedtime, fall_asleep_time, wake_time, sleep_duration, q5a, q5j_text: são campos de texto ou números que armazenam informações enviadas pelo formulário

# 3:  O caminho '/' é a rota principal. Quando você visita o site, ele carrega o arquivo index.html, que é o formulário onde o usuário pode preencher suas respostas. Isso é feito pela função index().
# 4: Quando o usuário envia o formulário, a função submit() é chamada na rota /submit. Ela faz o seguinte:
#  • Pega os dados enviados pelo usuário (usando request.form).
#  • Conecta ao banco de dados e insere esses dados na tabela responses.
#  • Após inserir os dados, o usuário é redirecionado de volta para a página principal (/).
# 5: Quando você roda o aplicativo (if __name__ == '__main__'), ele chama create_table() para garantir que a tabela existe. Em seguida, ele inicia o servidor Flask (app.run(debug=True)), que permite você acessar o site no navegador e interagir com ele.



app = Flask(__name__)

# Função para conectar ao banco de dados
def connect_db():
    conn = sqlite3.connect('responses.db')
    return conn

# Rota principal para exibir o formulário
@app.route('/')
def index():
    return render_template('PSQI.html')

@app.route('teste')
def teste():
    return render_template('teste.html')

# Rota para processar e armazenar as respostas
@app.route('/submit', methods=['POST'])
def submit():
    if request.method == 'POST':
        bedtime = request.form['bedtime']
        fall_asleep_time = request.form['fall_asleep_time']
        wake_time = request.form['wake_time']
        sleep_duration = request.form['sleep_duration']
        q5a = request.form['q5a']
        q5j_text = request.form.get('q5j_text', '')
        q3 = request.form['q3']
        bed_partner = request.form['bed_partner']
        q10a = request.form['q10a']

        # Conectar ao banco de dados e inserir as respostas
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute('''CREATE TABLE IF NOT EXISTS responses
                          (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                           bedtime TEXT, 
                           fall_asleep_time TEXT, 
                           wake_time TEXT,
                           sleep_duration TEXT,
                           q5a TEXT,
                           q5j_text TEXT,
                           q3 TEXT,
                           bed_partner TEXT,
                           q10a TEXT)''')

        cursor.execute('''INSERT INTO responses 
                          (bedtime, fall_asleep_time, wake_time, sleep_duration, q5a, q5j_text, q3, bed_partner, q10a)
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)''', 
                          (bedtime, fall_asleep_time, wake_time, sleep_duration, q5a, q5j_text, q3, bed_partner, q10a))

        conn.commit()
        conn.close()
        print("ta aqui")
        return redirect(teste)

if __name__ == '__main__':
    app.run(debug=True)

