# Instruções para entrega de arquivo

Este documento é um guia sobre como usar o processo de submissão de tarefas com
o GitHub.

## Sobre o GIT

GIT é um sistema de controle de versão. Controlar a versão significa criar e
manter um mapeamento automático das mudanças feitas em um código computacional.
O sistema de controle de versão evita situações como não conseguir voltar a uma
versão do código que funcionava, ou não conseguir se lembrar das modificações
propostas nos últimos dias.

### Controle de versão - local

Quando um desenvolvedor propõe uma nova modificação ao código, primeiro deverá
testá-la. Uma vez que a modificação tenha sido testada, pode então ser
registrada no sistema de controle de versão. Esse registro é feito através da
funcionalidade commit. Para usá-la, você deve:

1. Ir ao diretório-raiz de seu código: `cd /home/seu_diretorio`
1. Utilizar a função commit: `git commit -am 'mensagem de commit obrigatoria'`

A mensagem de commit é obrigatória e explica o que foi modificado no seu
código. Algumas mensagens são mais informativas que outras. Veja por exemplo:

* `git commit -am 'Alguns bugs resolvidos'`
* `git commit -am 'Pilha funciona corretamente'`
* `git commit -am 'Implementei pilha usando malloc'`

Idealmente, você deve fazer um commit para cada modificação completa, porém
pequena, do seu código:

* `git commit -am 'Push da pilha funcionando'`
* `git commit -am 'Pull da pilha funcionando'`
* `git commit -am 'API da pilha opera corretamente'`

Caso a sua modificação envolva adicionar controle de versão a um novo arquivo,
então deve usar o comando:

* `git add nome_do_arquivo`

### Controle de versão - servidor

GIT, assim como outros sistemas de controle de versão, pode ser usado para
compartilhar código com outros desenvolvedores. Para isso, é necessário criar um
espaço em algum servidor. Esse espaço se chama *repositório*. Websites como o
[GitHub](http://www.github.com) permitem criar repositórios online
gratuitamente. Para usar o controle de versão em um servidor, você deve dominar
três comandos essenciais:

1. `git clone endereco_do_repositorio`: cria um clone local de um repositório
   online.
1. `git push`: *empurra* as modificações já registradas localmente para o
   servidor
1. `git pull`: *puxa* para o clone local as modificações empurradas para o
   servidor. Use caso você esteja trabalhando em equipe ou caso venha a
   trabalhar no seu projeto usando um outro computador.

### Exercícios com GitHub

Caso nunca tenha usado GIT, é interessante treinar um pouco em um ambiente
controlado. Nesse caso, execute os passos abaixo e, simultaneamente, crie uma
cheat-sheet, isto é, uma pequena tabela com os passos necessários para completar
cada passo:

1. Vá ao GitHub e crie um usuário (caso não tenha) e faça login.
1. Crie um novo repositório com um nome à sua escolha.
1. Faça um clone local do repositório.
1. Modifique o conteúdo de um arquivo em seu clone local.
1. Registre (commit) as modificações
1. Envie as modificações para o servidor (push)
1. Vá ao site do seu repositório no GitHub e clique em Commits. Veja se encontra
   a sua mensagem de commit e as modificações que propôs ao código.
1. Localmente, crie um novo arquivo. Adicione-o ao controle de versão e envie
   para o repositório remoto. Novamente, verifique o que acontece na sua área do
   GitHub.

## Makefile

Programas em C geralmente consistem de uma série de arquivos com a extensão .c.
Durante o processo de compilação, é necessário transformar cada um desses
arquivos em um código-objeto (extensão .o) e então gerar um programa executável
(sem extensão).

É possível executar esse processo usando o *gcc* em linha de comando, com
instruções como:

`gcc -c arquivo.c`

Porém, em projetos maiores isso pode ser bastante laborioso. Um Makefile é um
arquivo que contém todas as instruções necessárias para compilar um programa, de
forma que uma série de chamadas ao gcc pode ser transformada simplesmente no
comando:

`make`

## Testes automáticos e estruturas de diretórios

Este projeto está organizado em diretórios da seguinte forma:

* Raiz `./`: Makefile e scripts de administração. Não deveria ser
  modificado.
* `./src`: Todos os arquivos-fonte (.c) e header files (.h) ficam aqui. O
  arquivo main.c é o que contém o programa principal.
* `./tests`: Contém entradas e saídas para testes. Pode ser usado como suporte
  para depuração do projeto.
* `./doc`: Arquivos de documentação (como este texto).

Essa organização não deve ser modificada. Usando essa estrutura, é possível
executar os seguintes comandos:

* `make`: compila o programa principal.
* `make test`: compila o programa principal e executa os testes de unidade.
  As mensagens na tela permitem saber em quais testes o programa falhou.
* `make clean`: remove todos os arquivos criados por processos de compilação

## Processo de submissão de código

1. Navegue para o repositório principal do código da atividade usando GitHub
1. Usando o botão Fork, crie uma cópia do repositório principal em sua própria
   área do github.
1. Use `git clone ...` para fazer uma cópia local da **sua cópia do
   repositório** (importante: não clone o repositório original, pois, do
   contrário, não será possível usar o *push* para enviar cópias)
1. Complete a atividade. Lemebre-se de fazer commit/push sempre que tiver uma
   nova modificação funcional do código.
1. Use *make test* para testar seu código quantas vezes achar necessário.
1. Use `git push` para enviar sua atividade para o repositório. Lembre-se de
   modificar somente o diretório *src*.

Após o prazo de envios, todas as tarefas serão clonadas e testadas em nosso
servidor central. Não se esqueça de registrar seu username no GitHub para que
esse processo funcione corretamente.

## Uso avançado e compatibilidade retroativa

Pode ser que você já seja uma pessoa que usa Makefiles e Git há muito tempo.
Talvez você não se sinta confortável com alguma restrição imposta por este
workflow. Por favor, sinta-se livre para modificar o Makefile, se achar
necessário, ou ainda, para modificar a estrutura de arquivos. Lembre-se apenas
de seguir as seguintes diretrizes:

* No procedimento de teste automático, a integridade dos testes de unidade será
  verificada, então não os modifique.
* O procedimento de teste automático executará o comando `make test
  VERBOSE=0`, então lembre-se de garantir que o comando funciona corretamente em
  um servidor Debian.
* O servidor tem algumas bibliotecas, mas não todas. Por favor, não use
  bibliotecas não-padrão em seu código.

