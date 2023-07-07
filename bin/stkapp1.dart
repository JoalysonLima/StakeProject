import 'package:stkapp1/stkapp1.dart' as stkapp1;
import 'dart:io';

late int? aux;
stkapp1.Stack<int> nuns = stkapp1.Stack<int>(10);

void main(List<String> arguments) {
  int menu = -1;

  while (menu != 0) {
    printMenu();
    menu = readOption();
    execOption(menu);
  }
}

int readOption() {
  stdout.write("\nDigite a opção desejada:\n");
  int option = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  return option;
}

void printMenu() {
  print(
      "\n------------------- MENU -------------------\n1. Para inserir um elemento a Pilha.\n2. Para retirar um elemento da Pilha.");
  print(
      "3. Para recuperar o topo da Pilha.\n4. Para imprimir a Pilha.\n5. Para esvaziar a Pilha.");
  print("6. Para verificar se a Pilha está vazia.\n0. Para sair da Aplicação.");
}

void execOption(int option) {
  late int? value;
  switch (option) {
    case 0:
      break;
    case 1:
      stdout.write("\nInforme o valor a ser adicionado: \n");
      value = int.tryParse(stdin.readLineSync() ?? '');
      if (value == null) {
        print("\nA opção é inválida. Tente novamente.\n");
        break;
      }
      nuns.push(value);
      break;

    case 2:
      aux = nuns.pop();
      if (aux == null) {
        print("\nA Pilha está vazia. Tente Novamente. \n");
        break;
      }
      print("\nO valor retirado do topo:");
      print(aux);
      print("");
      break;

    case 3:
      aux = nuns.peek();
      if (aux == null) {
        print("\nA Pilha está vazia. Tente Novamente. \n");
        break;
      }
      print("\nO valor que está no topo:");
      print(aux);
      print("");
      break;

    case 4:
      if (nuns.isEmpty()) {
        print("\nA Pilha está vazia. Adicione valores e tente novamente.\n");
        break;
      }
      print("\nA Pilha atual contém: (Valores do topo ao fundo da Pilha.)");
      nuns.printStack();
      break;

    case 5:
      nuns.clear();
      if (nuns.isEmpty()) {
        print("\nA Pilha foi esvaziada. \n");
        break;
      }
      print("\nTente novamente.\n");
      break;

    case 6:
      if (nuns.isEmpty()) {
        print("\nA Pilha está vazia.\n");
        break;
      }
      print("\nA Pilha não está vazia.\n");
      break;

    default:
      print("\nA opção é inválida. Tente novamente.\n");
  }
}
