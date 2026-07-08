#include <stdio.h>

int main() {
  // 1. Criamos um espaço na memória para aguentar uma palavra de até 99 letras (+ o \0)
  char value[100];
  int totalChar = 0;

  printf("Digite uma palavra: ");

  // 2. Usamos %s para ler uma STRING (palavra) inteira.
  // Nota: Não usamos o '&' aqui porque o nome de um array já é o endereço dele!
  scanf("%s", value);

  // 3. Criamos um ponteiro auxiliar que aponta para o começo do nosso array
  char* ptr = value;

  // 4. Enquanto o caractere apontado por ptr não for o fim da string ('\0')
  while (*ptr != '\0') {
    printf("%c", *ptr);
    totalChar++;
    ptr++; // 5. ESSENCIAL: Avança o ponteiro para a próxima letra! (Se não o loop fica infinito)
  }

  printf("\nTotal de caracteres: %d\n", totalChar - 1);

  return 0;
}
