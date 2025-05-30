# Mundo WAP - Teste Técnico Flutter

## Como executar

### 1. Clonar o projeto

```bash
git clone <url-do-repositorio>
cd <nome-do-projeto>
```

### 2. Rodar o servidor local `json_rest_server`

Dentro da pasta do projeto, localize a pasta onde o servidor está configurado (por exemplo, `json_rest_server`), entre nela:

```bash
cd path/para/pasta/do/json_rest_server
```

Ative globalmente o `json_rest_server` (se ainda não fez):

```bash
dart pub global activate json_rest_server
```

Execute o servidor local:

```bash
json_rest_server run
```

O servidor ficará rodando localmente, respondendo às requisições do app.

### 3. Executar o aplicativo Flutter

Volte à raiz do projeto (caso tenha entrado em outra pasta):

```bash
cd ../../  # ajuste conforme a sua navegação
```

Instale as dependências:

```bash
flutter pub get
```

Execute o app:

```bash
flutter run
```

---

## Sobre o projeto

Este projeto é um aplicativo desenvolvido com **Flutter (versão 3.29.2)** e **Dart**, que simula a comunicação com um webservice via a biblioteca **Dio**. Para contornar a indisponibilidade da API real, utiliza-se um servidor local JSON (`json_rest_server`) para responder às requisições.

O aplicativo segue a arquitetura **MVVM (Model-View-ViewModel)** com modularização paralela utilizando o **Flutter Modular**, promovendo uma separação clara entre as camadas e organização escalável do código.

## Telas Principais

O app possui três telas principais:

* **Tela de Login:** Interface para o usuário inserir credenciais (usuário e senha) e autenticar via API (ou servidor local). Em caso de sucesso, armazena as informações do usuário de forma segura e direciona para a área logada.

* **Tela de Listagem de Tasks:** Exibe a lista de tarefas disponíveis para o usuário, mostrando informações básicas e um marcador de status (pendente ou concluída). Permite selecionar uma tarefa para aplicação.

* **Tela de Aplicação do Formulário:** Apresenta o formulário dinâmico da tarefa selecionada, com campos configurados conforme o tipo definido (texto, máscara, etc). Permite preencher e salvar as respostas no banco local SQLite. Também mantém os dados temporariamente para recuperação em caso de interrupções.

## Principais bibliotecas utilizadas

* **dio:** Cliente HTTP para comunicação com APIs REST.
* **flutter\_modular:** Modularização e injeção de dependências.
* **signals:** Gerenciamento reativo de estado.
* **sqflite:** Banco de dados SQLite para persistência local.
* **flutter\_secure\_storage:** Armazenamento seguro de dados sensíveis.
* **lottie:** Animações vetoriais em JSON.
* **intl:** Formatação de datas e internacionalização.
* **synchronized:** Controle sincronizado para código assíncrono.
* **path:** Manipulação de caminhos de arquivos.
* **easy\_mask:** Aplicação de máscaras em inputs.

## Estrutura do projeto

```
lib
├── core
│   ├── app              # Configurações e inicialização geral
│   ├── dtos             # Objetos de transferência de dados
│   ├── handlers         # Tratamento de erros e eventos globais
│   ├── helpers          # Funções auxiliares
│   ├── mixins           # Comportamentos reutilizáveis
│   ├── models           # Entidades e modelos globais
│   ├── network          # Configurações de rede e comunicação HTTP
│   ├── routes           # Definição de rotas
│   ├── ui               # Componentes e temas globais da UI
│   └── core.dart        # Exportação centralizada do core
├── generated
│   └── assets.dart      # Arquivos gerados automaticamente (assets)
├── modules
│   ├── home
│   │   ├── controllers  # Controladores (ViewModels) responsáveis pela lógica e estado da UI
│   │   ├── daos         # Objetos de acesso a dados locais (SQLite)
│   │   ├── enums        # Definições de enums usados no módulo (ex: status de tarefa)
│   │   │   ├── enums.dart
│   │   │   └── task_status.dart
│   │   ├── mixins       # Mixins para reutilização de código comum
│   │   │   ├── home_variables.dart
│   │   │   └── mixins.dart
│   │   ├── models       # Modelos de dados específicos do módulo
│   │   ├── repositories # Repositórios para abstrair acesso a dados (local e remoto)
│   │   ├── widgets      # Componentes visuais reutilizáveis do módulo
│   │   │   ├── task_list.dart
│   │   │   ├── task_widget.dart
│   │   │   ├── title_widget_skeleton.dart
│   │   │   ├── title_widget.dart
│   │   │   └── widgets.dart
│   │   ├── home_module.dart  # Configuração do módulo no Flutter Modular (rotas, binds)
│   │   ├── home_page.dart    # Tela principal do módulo (view)
│   │   └── home.dart         # Arquivo que inicia o módulo (exportações)
└── main.dart
```

## Arquitetura do Projeto

O projeto adota o padrão **MVVM (Model-View-ViewModel)** para garantir separação clara das responsabilidades:

* **Model:** Representa dados e regras de negócio, incluindo entidades e repositórios para acesso local e remoto.
* **View:** Interface do usuário construída com widgets e páginas.
* **ViewModel (Controllers):** Controladores que gerenciam o estado e a lógica, conectando a Model à View.

A organização do código é modular, usando o **Flutter Modular** para dividir o app em módulos paralelos independentes, cada um com sua própria estrutura MVVM. Isso facilita o desenvolvimento, testes e manutenção isolada de funcionalidades.

## Modelagem do Banco de Dados Local (SQLite)

A modelagem suporta um sistema dinâmico de tarefas com formulários customizados:

* **task:** Define tarefas com id, usuário, nome e descrição.
* **field:** Campos personalizados de cada tarefa, com label, tipo e obrigatoriedade.
* **taskInstance:** Registra cada execução da tarefa, armazenando status e data.
* **fieldResponse:** Guarda as respostas para cada campo em cada execução, mantendo a integridade relacional.

### Justificativa da Modelagem

* **Flexibilidade:** Criação dinâmica de tarefas e formulários sem alteração estrutural.
* **Histórico completo:** Registro detalhado das execuções das tarefas.
* **Integridade dos dados:** Relacionamentos garantem consistência.
* **Escalabilidade:** Facilita inclusão de novos campos e funcionalidades.

## Decisões Técnicas

* **Exception Handler Centralizado:** Captura exceções globalmente, exibindo mensagens amigáveis e registrando logs, podendo ser integrado a ferramentas como Crashlytics.
* **Uso de Extensions:** Extensões Dart foram criadas para aumentar legibilidade e reaproveitamento de código.
* **Gerenciamento de Estado com SignalFutureBuilder:** Usado para gerenciar estados de carregamento, sucesso e erro de forma reativa e eficiente na interface.
* **Abstração com FutureHandler:** Centraliza a lógica assíncrona para tratamento de erros e atualização dos sinais, reduzindo duplicação e facilitando manutenção.
