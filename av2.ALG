Algoritmo "semnome"
tipo
   rCadPedido = registro
      numpedido, tipopedido : inteiro
      nomecliente: caractere
      valorpedido : real
   fimregistro


funcao incluirpedido(pos_lista : inteiro) : inteiro
inicio
   limpatela
   pos_lista <- pos_lista + 1
   escreval ("Digite o numero do pedido")
   leia (vLanc[pos_lista].numpedido)
   repita
   escreval ("O pedido será atendido na loja (1) ou via delivery (2)?")
   leia (vLanc[pos_lista].tipopedido)
   ate (vLanc[pos_lista].tipopedido = 1) ou (vLanc[pos_lista].tipopedido = 2)
   escreval("Digite o nome do cliente")
   leia (vLanc[pos_lista].nomecliente)
   escreval("Digite o valor total do pedido")
   leia (vLanc[pos_lista].valorpedido)
   retorne pos_lista
fimfuncao

procedimento listarpedido(pos_lista : inteiro)
var
   ind : inteiro
inicio
   limpatela
   se pos_lista < 1 entao
      escreval ("Lista Vazia!!")
   senao
      escreval ("------ LISTA DE PEDIDOS -------")
      para ind de 1 ate pos_lista faca
         escreval ("Numero do pedido: " ,vLanc[ind].numpedido)
         escreval ("Tipo do pedido: ",vLanc[ind].tipopedido)
         escreval ("Nome do cliente: ",vLanc[ind].nomecliente)
         escreval ("Valor do pedido: ",vLanc[ind].valorpedido)
         escreval ("-----------------------------")
      fimpara
   fimse
fimprocedimento

procedimento acharpedido(pos_lista : inteiro)
var
   ind, buscarped: inteiro
   achei: logico
inicio
   se pos_lista = 0 entao
      escreval ("Lista vazia!")
   senao
      escreval ("Digite o numero do pedido")
      leia(buscarped)
      achei <-falso
      ind <- 1
      repita
         se buscarped = vLanc[ind].numpedido entao
            escreval(" nome do cliente: " ,vLanc[ind].nomecliente)
            escreval(" numero do pedido: " ,vLanc[ind].numpedido)
            escreval(" tipo de pedido: " ,vLanc[ind].tipopedido)
            escreval(" valor do pedido: " ,vLanc[ind].valorpedido)
            achei <- verdadeiro
         fimse
         ind <- ind + 1
      ate (achei = verdadeiro) ou (ind > pos_lista)
      se achei = falso entao
         escreval ("Pedido nao encontrado")
      fimse
   fimse

fimprocedimento

funcao atenderpedido (pos_lista : inteiro) : inteiro
var
   ind: inteiro
inicio
   se pos_lista = 0 entao
      escreval ("Lista vazia")
   senao
      para ind de 2 ate pos_lista faca
         vLanc[(ind - 1)] <- vLanc [ind]
      fimpara
      pos_lista <- pos_lista - 1
      escreval("Pedido atendido")
   fimse
   retorne pos_lista
fimfuncao

funcao finalizarp (pos_lista : inteiro) : logico
var
   fimprograma: logico
inicio
   fimprograma <- falso
   se pos_lista > 0 entao
      escreval ("Impossivel finalizar, ainda existem pedidos")
      leia (pause)
   senao
      fimprograma <- verdadeiro
   fimse
   retorne fimprograma
fimfuncao




Var
   // Seção de Declarações das variáveis
   opc, ind, max, pfim: inteiro
   vLanc: vetor [1..10] de rCadPedido
   pause, finalizar: logico
   
   //pfim está associado ao pos_lista das funçoes e refere-se ao ultimo termo


Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...
   ind <- 1

   repita
      limpatela
      escreval ("###### LANCHONETE ######")
      escreval ("# 1 - INCLUIR PEDIDO   #")
      escreval ("# 2 – ATENDER PEDIDO   #")
      escreval ("# 3 – LISTAR PEDIDOS   #")
      escreval ("# 4 – PESQUISAR PEDIDO #")
      escreval ("# 5 - ENCERRAR         #")
      escreval ("########################")
      escreval ("")
      escreva  ("Informe a opção desejada: ")
      leia (opc)
      escolha opc

      caso 1
         pfim <- incluirpedido(pfim)
         leia (pause)

      caso 2
         pfim <- atenderpedido (pfim)
         leia(pause)
      caso 3
         listarpedido(pfim)
         leia (pause)
      caso 4
         acharpedido(pfim)
         leia (pause)

      caso 5
         finalizar <- finalizarp(pfim)
         se finalizar = verdadeiro entao
            escreval ("Saindo...")
         fimse






      fimescolha
   ate finalizar = verdadeiro




Fimalgoritmo


