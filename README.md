# Atividade_INNERA
Desafio de Implementação e Aplicação de Questionário PSQI

Configurações necessárias para o funcionamento da aplicação e alguns pontos importantes:
- No terminal, navegue até o diretório do seu projeto e execute o código: pip install Flask.
- O servidor rodará em http://127.0.0.1:5000/ por padrão. Acesse http://127.0.0.1:5000/ no seu navegador para visualizar o formulário e submeter os dados,você será redirecionado para a página de teste.
- O SQLite já vem instalado com o Python, então você não precisa fazer nada extra para o banco de dados. Caso contrário, instale o módulo: pip install pysqlite3
- O banco de dados responses.db será criado automaticamente quando o código rodar. O código já inclui a criação da tabela responses no banco.

Estrutura do código:
├── app.py                   # O código Flask principal
└── /templates                # Pasta de templates
    ├── PSQI.html             # Formulário para entrada de dados
    └── teste.html            # Página de teste após submissão

