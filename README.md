# primeira coisa quando vc instalar o termux  

apt update && apt upgrade

# instalando o git pra clonar repositórios
apt install git -y

# apos isso faça tudo abaixo para instalar o nodejs e o reactjs globalmente

apt install nodejs -y

npm install yarn -g

yarn global add create-react-app

# apos isso você vai instalar o neovim e configurar ele

apt install neovim -y

# antes de abrir ele você vai adiconar o arquivo de configuração com todos os plugins que eu uso, com destaque de syntax para todas as linguagens, incluindo reactjs,  e eslint e outras coisas que vc vai perceber quando tiver usando ele.

# o arquivo de configuração do neovim se chama init.vim, eu vou ti enviar o repositório no git com ele pra vc só mover pra pasta certa 

git clone https://github.com/DKSecurity99/my-init-neovim

# como tu deve saber o git vai clonar meu repo com meu init.vim, antes de mover a pasta pro lugar certo, tu tem que criar a pasta pro neovim saber onde está as configurações dele

mkdir $HOME/.config/nvim

# Caso diga que a pasta .config ja existe tu só acessa ela e la dentro cria a pasta nvim

cd $HOME/.config 
mkdir nvim && cd nvim

# Agora volta pra HOME do termux, pra isso só digita "cd" e da enter claro.

# Agora entra na pasta do repositório com meu init.vim, que tu clonou e move pra pasta que criamos 

cd my-init-neovim 
mv init.vim $HOME/.config/nvim

# Pronto agora tu sai da pasta com "cd .." e abre o neovim, pra abrir ele digita "nvim" e da enter, quando abrir pode aparecer algum erro, mas ai tu da enter até sumir, ou aperta ":" nesses 2 pontos ai do seu teclado, isso diz pro neovim que vc vai digitar algum comando.

# pra instalar as configurações tu digita isso, provavelmente ele vai abrir uma janela no próprio editor e vai começar a instalar tudo automaticamente, ai tu precisa fazer nada, caso não apareça nada tu digita o comando abaixo

:PlugInstall

# e da enter 

# Espera aparecer "Fishined done..." algo  assim deps disso vai ta tudo configurado, por padrão eu já uso o tema dracula, então tu não precisa mexer nisso

# Deps disso tu aperta na tecla "ESQ" que fica na barra do termux encima do teu teclado, isso é pra poder dizer ao neovim que tu vai digitar algo pra ele executar, não mandei fzr isso lá encima pq quando tu entra ele já fica pronto pra executar comandos nele, bom deps de apertar em "ESQ" tu digita o comando abaixo pra sair do neovim, pra ele poder aceitar as config.

:q! 

# deps tu já pode entrar no neovim pra programar em Js por exemplo pra isso tu faz

nvim teste.js

# ele vai abrir um arquivo chamado teste.js, igual tu escreveu na linha de comando, ai pra tu começar a escrever código tu aperta a letra "i" do teu teclado.

# Deps de tu ter programado e etc, tu precisa salvar o arquivo, pra isso tu aperta "ESQ" e digita o comando abaixo pra salva  o arquivo que vc estava usando, e tbm pra salvar o que tu escreveu nele.

:wq 

# Abaixo vou deixar os comandos abaixo pra tu usar no neovim

# pra fechar o neovim sem salvar as alterações no arquivo 

:q 

:q!  # com o carácter de exclamação é pra salvar forçado 

# salvar alterações 

:wq

:wq! # forçado 

# pra reverter algo que tu escreveu no código

:u

# pra abrir a janela no lado esquerdo tipo o vs code com as pastas e arquivos do diretório que tu tá 

# tu aperta no "CTRL" da barra do termux e em seguida na letra "b" do teu teclado pra abrir a janela 

# bons outros comandos do terminal é a mesma coisa de um terminal Linux, estudando Linux tu usa o termux de boa.

