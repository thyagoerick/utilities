# Guia Rápido para TMUX

> O TMUX é um terminal multiplexer, que nos permite, através do nosso terminal, emular diversos outros, executar processo em background e principalmente organizar nosso trabalho.

# Instalando o TMUX
> **Obs.:** Estou conectado via SSH em um Ubuntu 22.04LTS

```
user@server:~$ sudo apt instal tmux
```

# Como funciona o TMUX?

Antes de tudo, é importante entender 3 conceitos:

- **O tmux tem sessões**.
- As **sessões tem janelas**.
- As **janelas tem painéis**.

As sessões e as janelas servem principalmente para organizar o trabalho.
Nós digitamos nossos comandos nos painéis.

> **Obs:** Podemos trocar de janelas, sessões e painéis nos preocupar se os comandos foram cancelados, etc. Todo o processo continua em background a menos que sejam cancelados manualmente.



## Criando uma sessão

```
user@server:~$ tmux
```
### Localizando-se
>**Obs.:** O tmux usa tudo como índice 0, ou seja, o primeiro item de cada contexto terá o número 0.
Neste momento você está:
- Logado em sua primeira sessão ([0]).
- Na sua sessão, tem uma janela (0:bash*).
- Na sua janela 0, tem um painel (onde está o seu cursor para digitar comandos)


## Trabalhando com Sessões
> **Obs.:** Como já sabemos abrir uma sessão vamos como:

### Sair de uma sessão ativa do tmux e voltar ao terminal
>**Obs.:** Para colocar o tmux em modo de comando, usamos o **CTRL+b**, "aka" **PREFIX** (não é um comando, é uma forma mais fácil de mensionar o CTRL+b)
```
[PREFIX+d]
```
> Neste momento, nos desanexamos da sessão 0.
>  desanexar **é diferente de terminar**
Isso significa que se você estava com um comando sendo executado e fizer o **_detach_** (+d), ele continuará rodando lá


### Criar uma nova sessão
```
user@server:~$ tmux
```
> Perceba que na barra de baixo, o que antes tinha um [0] no canto inferior esquerdo, agora tem um [1].
Isso significa que temos a nossa sessão 1 criada e estamos logados nela, ou melhor, estamos **anexados** à ela.


### Sair da sessão X e entrar na sessão Y
```
[PREFIX+d]
user@server:~$ tmux a -t 0
```
> _Esse comando significa: tmux, me anexe (a) à sessão 0 (-t 0)._


### Finalizando a sessão X
> Quando fizemos o detach da sessão (PREFIX+d), ela ainda continua em background.
Para finalizar uma sessão e todos os processo que estão vinculados à essa sessão, usamos o comando:
```
user@server:~$ tmux kill-session -t NOME_SESSAO
```
No nosso caso: 
```
user@server:~$ tmux kill-session -t 1
```

### Ver todas as sessões que estão ativas
```
[PREFIX+d]
user@server:~$ tmux ls
```

### Renomeando uma sessão
Quando estiver logado em uma sessão, use o comando:
```
[PREFIX+$]
```
> Na parte inferior esquerda, a barra ficará amarela e você poderá renomear a sessão.
Se você estiver fora da sessão e quiser se conectar à ela, você pode usar o nome para isso:
```
[PREFIX+d]
user@server:~$ tmux a -t NOME_SESSAO
```

### Nomear uma sessão ao iniciá-la
```
user@server:~$tmux new -s mysession
```

### Painel de Sessões
Abra o painel usando o comando:
```
[PREFIX+s]
```
> Na parte de cima, temos todas as sessões, do meio para baixo temos o preview daquela sessão.
Podemos com a seta navegar entre as linhas amarelas e escolher qual sessão queremos nos logar apertando _ENTER_.

---------------------------[CONTINUA]---------------------------


## Trabalhando com Janelas
**As janelas organizam o trabalho dentro de uma sessão**

Logado em uma sessão Y como localizar as janelas?
No canto inferior esquerdo, ao lado do nome da sua sessão estão suas janelas.
No caso dos nossos exemplos possuimos apenas uma, a **_0:bash*_**.

## Criar duas novas janelas
```
[PREFIX+c]
[PREFIX+c]
```
As informações que temos na parte inferior são:
- O nome da nossa sessão e as 3 janelas que fazem parte dela.
- Temos dois símbolos aqui, o traço (-) e o asterísco (*). 
	- O **asterísco (*)** indica a sua janela atual;
	- O **traço (-)** indica a janela anterior. Ele serve caso você queira ficar trocando entre as janelas ATUAL e ANTERIOR. Este comportamento pode ser feito usando o comando:
```
[PREFIX+l]
```

## Como navegar entre as janelas de forma independente

### Navegar pelo número
```
[PREFIX+NUMERO_JANELA]
```
Ex.:
```
[PREFIX+0]
```

### Navegação sequencial
Se quiser ir para a próxima janela(ex: se está na 1, ir para a 2):
```
[PREFIX+n]
```

### Se quiser para a janela anterior (ex: se está na 1, ir para a 0):
```
[PREFIX+p]
```

### Renomear as janelas
```
[PREFIX+,] vírgula 
```
### Fechar uma janela
```
[PREFIX+&]
```


# Trabalhando com Painéis
Da mesma forma que uma sessão já nasce com uma janela, **uma janela já nasce com um painel**. São neles que de fato digitamos nosso código

## Dividindo verticalmente
> Para criar um novo painel verticalmente
```
[PREFIX+%]
```


## Dividindo horizontallmente
> Para criar um novo painel horizontalmente
```
[PREFIX+"] aspas duplas 
```

## Identificando painéis
```
[PREFIX+q]
```
> Mostrar visualmente o número de cada painel. O número que estiver em vermelho é o painel ativo no momento (onde seu cursor está).


## Navegar nos painéis pelo seu número
```
[PREFIX+q+NUMERO_PAINEL]
```

## Navegar utilizando as teclas direcionais
```
[PREFIX+TECLA_DIRECIONAL] (⬆ ➡ ️⬇⬅)
```

## Gerenciando Painéis

### Converter painel em janela
```
[PREFIX+!] exclamação 
```
> Perceba que nosso painel agora está na janela 2:bash* .
> E na Janela 1 ficou apenas aqueles outros 2


### Fechar um painel
```
[PREFIX+x]
```


## Modo de Comando
Em várias documentações você verá alguns comandos não usando o PREFIX e sim algo como:
```
:set -g OPTION
```
> Estes ":" indicam que você deve executá-los em modo de comando.


### Entrar no modo de comando
```
[PREFIX+:] dois pontos 
```

#### Habilitando o uso do mouse

```
[PREFIX+:]
:set mouse on
```
> Clicar em um painel ativa ele, clicar em uma janela ativa ela e assim por diante.
