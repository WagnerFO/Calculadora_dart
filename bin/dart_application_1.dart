import 'dart:io';

void main(List<String> arguments){

  stdout.write('Digite a operação: ');
  String? input = stdin.readLineSync();

  if(input == null){
    print('Expressão Inválida!');
    return;
  }

  String expression = input.replaceAll(' ', '');

  if(!expressaoValida(expression)){
    print('Expressão Inválida!');
    return;
  }

  List<String> tokens = quebrarEmTokens(expression);

  if(!resolvePriority(tokens)){
    print('Expressão Inválida!');
    return;
  }

    double resultado = resolveSumSub(tokens);

  print(resultado);
}

bool expressaoValida (String expression){
  if(expression.isEmpty) return false;

  String Operadores = '+-*/';

  if(Operadores.contains(expression[expression.length - 1])) {
    return false;
  }

  bool ultimoFoiOperador = false;
  int contadorPoint = 0;

  for(int i = 0; i < expression.length; i++){
    String char = expression[i];

    bool isNumber = char.compareTo('0') >= 0 && char.compareTo('9') <= 0;
    bool isOperator = char == '+' || char == '-' || char == '*' || char == '/';
    bool isPoint = char == '.';

    if(!isNumber && !isOperator && !isPoint){
      return false;
    }

    if(isOperator){
      if(ultimoFoiOperador){
        return false;
      }
      ultimoFoiOperador = true;
      contadorPoint = 0;
    }else{
      ultimoFoiOperador = false;

      if(isPoint){
        contadorPoint++;
        if(contadorPoint > 1){
          return false;
        }
      }
    }
  }

  return true;
}


List<String> quebrarEmTokens (String expression){
  List<String> tokens = [];
  String numberAtual = '';

  for( int i = 0; i < expression.length;i++ ){
    String char = expression[i];

    bool isOperator = char == '+' || char == '-' || char == '*' || char == '/';

    if(isOperator){
      tokens.add(numberAtual);
      tokens.add(char);
      numberAtual = '';
    }else{
      numberAtual += char;
    }
  }

  tokens.add(numberAtual);

  return tokens;
}

bool resolvePriority(List<String> tokens){
  for(int i = 0; i < tokens.length; i++){
    if(tokens[i] == '*' || tokens[i] =='/'){
      double num1 = double.parse(tokens[i-1]);
      double num2 = double.parse(tokens[i+1]);

      if(tokens[i] == '/' && num2 == 0){
        return false;
      }

      double result = tokens[i] == '*'
      ? num1 * num2
      : num1 / num2;

      tokens[i-1] = result.toString();
      tokens.removeAt(i);
      tokens.removeAt(i);

      i--;
    }
  }

  return true;
}


double resolveSumSub(List<String> tokens){
  double result = double.parse(tokens[0]);

  for(int i = 1; i < tokens.length; i += 2){
    String operator = tokens[i];
    double number = double.parse(tokens[i + 1]);

    if(operator == '+'){  
      result += number;
    }else if(operator == '-'){
      result -= number;
    }
  }

  return result;
}