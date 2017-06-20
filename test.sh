# Script para testes de unidade automaticos

# Configuracao: escolhe se o programa retonara mensagens teste-a-teste
verbose=$2

# A primeira linha indica que o script foi inicializado corretamente
if [ $verbose -eq 1 ]; then
  echo "Testando $1"
fi;

# A variavl dirtestes indica onde os arquivos teste (.in e .out) estao
dirtestes=./tests

# Essas variaveis de contagem devem ser inicializadas com zero
ntestes=0
npassou=0
program=$1

# Expressao do SED que significa: substituir .in por .out
sedexpression='s/\.in/\.out/'

# tests sera inicializada com o resultado da expressao find,
# encontrando todos os arquivos .in do diretorio dirtestes
tests=`find $dirtestes -name '*.in'`

# Para cada teste...
for t in $tests
do
  # Adiciona 1 no contador de testes
  ntestes=`echo $ntestes + 1 | bc`

  # Encontra o nome do arquivo relacionado a saida do teste
  o=`echo $t | sed $sedexpression`

  # Executa o programa que foi compilado usando o arquivo de teste.in como
  # entrada
  res=`$program < $t`

  # Verifica se a diferenca entre a saida encontrada e a saida desejada
  # eh uma string de comprimento nao-zero
  d=`echo $res | diff  $o -`
  if [ -n "$d" ]; then
    if [ $verbose -eq 1 ]; then
      echo "Teste: $t - Falhou"
    fi
  else
    if [ $verbose -eq 1 ]; then
      echo "Teste $t - OK!"
    fi
    npassou=`echo $npassou + 1 | bc`
  fi
done

indice=`echo "(100.0 * $npassou) / $ntestes" | bc`

if [ $verbose -eq 1 ]; then
  echo "Total de testes: $ntestes"
  echo "Total de acertos: $npassou"
  echo "Indice de acertos: $indice"
fi;

if [ $verbose -eq 0 ]; then
  echo $indice
fi;

