//Declaração da classe genérica utilizando o parâmetro T.
class Stack<T> {
  //Instância de uma lista com o tipo genérico T que pode receber valores Null para a remoção de elementos e liberação de memória.
  late List<T?> _stack;
  //Variável utilizada para rastrear a posição do topo da pilha.
  late int _instSize;

//Construtor da classe Stack, que recebe como parâmetro um Inteiro que informa o tamanho máximo da pilha.
  Stack(int size) {
    //Inicializa a lista com o tamanho especificado, preenchendo todos os seus elementos com Null.
    _stack = List<T?>.filled(size, null);
    //O rastreamento do topo da pilha começa em -1, já que o primeiro índice de uma lista é o 0, informando que a lista está vazia.
    _instSize = -1;
  }

//O método Push adiciona um elemento a pilha.
  void push(T value) {
    if (_instSize < _stack.length - 1) {
      //Atualiza a minha variável de marcação e insere o valor desejado.
      _instSize++;
      _stack[_instSize] = value;
    }
    print("\nA Pilha está cheia. Esvazie-a e tente novamente.\n");
  }

//O método Pop retira um elemento da pilha.
  T? pop() {
    //Verifica se a pilha está vazia ou se o valor que precisa ser retirado é nulo, evitando erros.
    if (isEmpty()) {
      return null;
    }
    //Guarda o valor que será retirado da pilha para ser retornado pela função.
    T? poppedValue = _stack[_instSize];
    //Liberando o espaço de memória que não será mais utilizado atribuindo Null.
    _stack[_instSize] = null;
    //Atualizando a minha variável de marcação de topo.
    _instSize--;
    //Retorno do valor retirado.
    return poppedValue;
  }

//O método Peek recupera o valor que está armazenado no topo da pilha.
  T? peek() {
    //Verifica se a pilha está vazia ou se o valor que deseja ser recuperado é nulo, evitando erros.
    if (isEmpty()) {
      return null;
    }
    //Retorna o valor requisitado.
    return _stack[_instSize];
  }

//O método verifica se a pilha está vazia utilizando a variável de marcação.
  bool isEmpty() {
    return _instSize == -1;
  }

//O método verifica o tamanho da pilha utilizando a variável de marcação.
  int size() {
    return _instSize + 1;
  }

//Imprime os elementos da pilha, do topo ao fundo.
  void printStack() {
    if (isEmpty()) {
      throw Exception("A Pilha está vazia.");
    }
    for (int i = _instSize; i >= 0; i--) {
      print(_stack[i]);
    }
  }

//O método libera todos os espaços de memória da pilha, atribuindo Null, deixando-a vazia e atualiza a variável de marcação.
  void clear() {
    for (int i = 0; i <= _instSize; i++) {
      _stack[i] = null;
    }
    _instSize = -1;
  }
}
