# ⚙️ **Termux Pawn**  

**Termux Pawn** é uma solução prática para configurar e otimizar o desenvolvimento de scripts em **PAWN** diretamente no Termux. Com este guia, você poderá configurar seu ambiente, instalar pacotes essenciais e entender como utilizar opções avançadas do compilador para melhorar o desempenho e a depuração dos seus scripts.

## ✨ **Funcionalidades Principais**  
- **Compilador PAWN**: Instale e utilize o compilador PAWN com suporte a diversas versões e otimizações.  
- **Depuração Avançada**: Ferramentas dedicadas para identificar e corrigir erros em scripts.  
- **Compatibilidade**: Suporte a includes antigos e ajustes detalhados do compilador.  

---

## 🔧 **Pré-requisitos**  
1. **Termux**: Baixe e instale a versão mais recente do Termux.  
   **[Baixar o Termux aqui](https://f-droid.org/repo/com.termux_1020.apk)**  
2. **Internet**: Conexão necessária para instalar pacotes.  

---

## 📥 **Instalação**  

### 1️⃣ **Adicione o Repositório Termux Pawn**  
Execute o comando abaixo no Termux para adicionar o repositório:  

```bash
mkdir -p $PREFIX/etc/apt/sources.list.d && echo "deb [trusted=yes] https://termux-pawn.github.io/repo stable main" >> $PREFIX/etc/apt/sources.list.d/termux-pawn.list
```

### 2️⃣ **Atualize a Lista de Pacotes**  
Atualize o cache do APT para disponibilizar os pacotes do repositório:  

```bash
yes | pkg upd -y && yes | pkg upg -y
```

### 3️⃣ **Instale o Compilador PAWN**  
Instale o compilador PAWN com o comando:  

```bash
pkg install -y pawncc
```

---

## 📘 **Configuração do Compilador PAWN**  

O PAWN oferece diversas opções para personalizar o comportamento do compilador. Você pode configurá-las usando um arquivo de especificação.

### 🛠️ **Opções do Compilador**  
| **Opção** | **Descrição**                                                                                                                                      | **Recomendação**                                                                 |
|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| `-d`      | Nível de depuração: `0` (nenhum), `1` (normal), `2` (avançado), `3` (avançado sem otimização).                                                     | Utilize `-d3` para **debug** com **crashdetect**, ou `-d0` ao publicar o script. |
| `-Z`      | Compatibilidade com includes antigos. Permite incluir arquivos várias vezes, útil para includes como `y_hooks`.                                    | **Ative** (`-Z+`) se usar includes antigos.                                      |
| `-R`      | Exibe detalhes sobre funções recursivas.                                                                                                          | **Opcional** (`-R+`) para análise de recursão.                                   |
| `-;`      | Exige ponto e vírgula no final de cada instrução.                                                                                                 | **Ative** (`-;+`) para evitar erros de sintaxe.                                  |
| `-(`      | Exige colchetes em cabeçalhos e funções.                                                                                                          | **Ative** (`-(+)`) para um código mais legível.                                  |
| `-i`      | Adiciona um diretório onde as includes podem ser carregadas.                                                                                      | Configure o caminho do seu projeto, ex.: `-i:/sdcard/MeuGM/include`.             |

---

### 📝 **Criando o Arquivo de Configuração**  
Crie um arquivo chamado **`pawn.cfg`** na mesma pasta do script **`.pwn`**, contendo as opções desejadas.  
Por exemplo:  

```plaintext
-d3 -;+ -(+ -R+ -Z+ -i:/sdcard/MeuGM/include
```

**Explicação do Exemplo**:  
- `-d3`: Depuração avançada sem otimização.  
- `-;+`: Ponto e vírgula obrigatório.  
- `-(+`: Uso obrigatório de colchetes.  
- `-R+`: Detalhes sobre funções recursivas ativados.  
- `-Z+`: Compatibilidade com includes antigos ativada.  
- `-i:/sdcard/MeuGM/include`: Define o diretório onde estão os arquivos de include.  

---

### ⚙️ **Compilando com as Especificações**  
Para usar o arquivo de configuração durante a compilação, utilize o símbolo **`@`** seguido do nome do arquivo:  

```bash
pawncc @pawn.cfg script.pwn
```

---

## 📂 **Pacotes Disponíveis**  
- **pawncc**: Compilador PAWN v3.10.10.  
- **pawncc-11**: Compilador PAWN v3.10.11.  
- **deamx**: Decompilador de AMX para SA-MP.  

---

## 📜 **Licença**  
Este projeto está sob a licença **MIT**.  

Aproveite o **Termux Pawn** e eleve seu desenvolvimento para o próximo nível!
