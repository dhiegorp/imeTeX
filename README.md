# imeTeX
Modelos padrões de LaTeX para trabalhos acadêmicos do Instituto Militar de Engenharia.

## Instalação
### Linux
Primeiramente é necessário o texlive com abntex2. O jeito mais fácil de nunca mais se preocupar com texlive é instalar todos os pacotes:
```bash
sudo apt-get install texlive-full
```

Execute o comando a seguir para descobrir o caminho definido para TEXMF
```
kpsewhich -var-value=TEXMFHOME
```

O padrão é `/home/username/texmf`. Coloque a pasta imeTeX neste diretorio (crie, se necessario):
```
TEXMFHOME/tex/latex
```
Por exemplo:
```
/home/vvbchaves/texmf/tex/latex/imeTex
```

### Windows
Desinstalar Windows e instalar Linux

## Exemplos
### Relatório de Laboratório de Física
Provavelmente o primeiro trabalho no IME em que LaTeX se torna importante.

labfisica.tex

### Relatório de Iniciação Científica
Relatório que exige mais elementos do que os trabalhos comuns (como orientadores e banca de avaliação). 

inci.tex

### Apresentação (Slides)

apresentação.tex

### Tema Dirigido
Relatório de Tema Dirigido.

td.tex

### Iniciação a Pesquisa
Antigo trabalho nos moles de Iniciação Científica, semelhante ao Tema Dirigido.

ip.tex

### Relatório de Estágio
Relatório de Estágio, semelhante a um trabalho comum mas com um supervisor.

estagio.tex

### Projetode Fim de Curso
Relatório do Trabalho de Conclusão de Curso, seguindo o padrão ABNT de publicação.

pfc.tex

### Arquivo de Bibliografia
Arquivo extra usado em todas as outras classes. Pode ser feito manualmente, mas é mais fácil de escrever desta forma.

bibliografia.bib
