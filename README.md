# 🧮 Calculadora em Dart (Terminal)

Uma calculadora desenvolvida em Dart para execução no terminal, criada com o objetivo de praticar lógica de programação, manipulação de strings e implementação manual de precedência matemática.

---

## 📌 Sobre o Projeto

Este projeto recebe uma expressão matemática digitada pelo usuário e realiza o cálculo respeitando a ordem correta das operações:

- Primeiro: multiplicação (*) e divisão (/)
- Depois: soma (+) e subtração (-)

Toda a lógica foi implementada manualmente, sem uso de bibliotecas externas para avaliação de expressões.

---

## 🚀 Funcionalidades

✔ Recebe expressão completa via terminal  
✔ Suporte a números inteiros e decimais  
✔ Operadores suportados:
- Soma (+)
- Subtração (-)
- Multiplicação (*)
- Divisão (/)

✔ Respeita precedência matemática  
✔ Validações implementadas:
- Expressão inválida
- Operadores consecutivos
- Número com dois pontos decimais
- Divisão por zero

---

## 💻 Como executar o projeto

### ✅ 1. Instalar o Dart

Caso ainda não tenha o Dart instalado:

https://dart.dev/get-dart

Verifique a instalação com:

```bash
dart --version
```

### ✅ 2. Clonar o repositório
git clone https://github.com/WagnerFO/Calculadora_dart.git

### ✅ 3. Acessar a pasta do projeto
cd calculadora-dart

### ✅ 4. Executar a aplicação
dart run bin/dart_application_1.dart

### 🧪 Exemplo de uso
Digite a operação: 23+34-4*6+235/2

Resultado irá dar: 150.5