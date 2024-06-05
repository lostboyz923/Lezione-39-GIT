# creo il repository locale
mkdir librosacro
cd librosacro
git init 

# configuro identità
git config --global user.email "bob@unipi.it"
git config --global user.name "bob"

# scrivo primo file
echo -e "Capitolo 1\nNerdGenesi\n\nAll'inizio ci fu Bob, che era l'origine di tutto.\n" > capitolo1.txt

# faccio primo commit
git add capitolo1.txt
git commit -m "primo capitolo aggiunto."

# qui sotto comandi utili da approfondire
# git status
# git show
# git diff 
# git log

# creo repository remoto (in locale per semplicità)
git init --bare ../librosacro_remoto/librosacro.git
git remote add origin ../librosacro_remoto/librosacro.git

# altri comandi utili da approfondire
# git remote show origin
# git push --set-upstream origin master
# git branch -vv

# spingo il commit a origin dal master branch
git push origin master

# clono il progetto dal reporitory remoto ad un secondo locale
cd ..
git clone librosacro_remoto/librosacro.git librosacro_tim
cd  librosacro_tim

# configuro l'identità per la copia locale
git config --global user.email "tim@unipi.it"
git config --global user.name "tim"

# effettuo ulteriori modifiche e spingo il nuovo commit al repository remoto
echo -e "Capitolo 1\nNerdCloning\n\nE poi ci fu Tim, che pensò fosse cosa buona e giusta.\n" > capitolo2.txt
git add capitolo2.txt
git commit -m "capitolo due, pronto!"
git push origin master

# dall'altro repository locale mi sincronizzo usando il comando "pull"
cd ..
cd librosacro
git pull origin master

# creo nuove diramazioni (branch)
cd ..
cd librosacro_tim
git checkout -b comandamenti

# posso operare modifiche sul branch senza condizionare altri rami
echo -e "primo comandamento" > comandamenti.txt
git add .
git commit -m "primo comandamento.. fatto!"
echo -e "\nsecondo comandamento" >> comandamenti.txt
git add .
git commit -m "secondo comandamento.. fatto!"
# git log --graph --all

# merging del branch (il branch si fonde e scompare)
git checkout master
git merge comandamenti
git push origin master

echo "fine!"