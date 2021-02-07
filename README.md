# tesis_latex

Carpeta con todos los archivos /Library/Tex/texbin, desde aca:
Para instalar paquetes.
./tlmgr install quotmark

Agregar nuevos paquetes en /usr/local/texlive/texmf-local (en las carpetas bst, tex según corresponda).

Actualizar los paquetes:
sudo ./texhash
Password:
texhash: Updating /usr/local/texlive/2020/texmf-config/ls-R...
texhash: Updating /usr/local/texlive/2020/texmf-dist/ls-R...
texhash: Updating /usr/local/texlive/2020/texmf-var/ls-R...
texhash: Updating /usr/local/texlive/texmf-local/ls-R...