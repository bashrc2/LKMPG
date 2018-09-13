::: {#preamble .status}
[]{#top}
:::

::: {#content}
::: {#table-of-contents}
Table of Contents
-----------------

::: {#text-table-of-contents}
-   [Introduction](#sec-1)
    -   [PaternitÃ©](#sec-1-1)
    -   [Versions et Notes](#sec-1-2)
    -   [Remerciements](#sec-1-3)
    -   [Qu\'est ce qu\'un module noyau ?](#sec-1-4)
    -   [Paquet de module noyau](#sec-1-5)
    -   [Quels modules sont prÃ©sents dans mon noyau ?](#sec-1-6)
    -   [Ai-je besoin de tÃ©lÃ©charger et de compiler le noyau linux
        ?](#sec-1-7)
    -   [Avant de commencer](#sec-1-8)
-   [En-tÃªte](#sec-2)
-   [Exemples](#sec-3)
-   [Hello World](#sec-4)
    -   [Votre tout premier module](#sec-4-1)
    -   [Salut et Au revoir](#sec-4-2)
    -   [Les macros \_\_init et \_\_exit](#sec-4-3)
    -   [Licences et Documentation du Module](#sec-4-4)
    -   [Passer un argument Ã votre module](#sec-4-5)
    -   [CrÃ©er un module depuis plusieurs fichiers](#sec-4-6)
    -   [CrÃ©er des modules pour un noyau prÃ©compilÃ©](#sec-4-7)
-   [Avant-propos](#sec-5)
    -   [OÃ¹ la vie d\'un module commence et oÃ¹ elle se
        termine](#sec-5-1)
    -   [Fonctions disponibles pour votre module](#sec-5-2)
    -   [Mode utilisateur, mode noyau](#sec-5-3)
    -   [Convention de nommage](#sec-5-4)
    -   [Espace de code](#sec-5-5)
    -   [Les pilotes de pÃ©riphÃ©riques](#sec-5-6)
-   [Pilote de pÃ©riphÃ©rique en mode caractÃ¨re](#sec-6)
    -   [La structure \`file\_operations\`](#sec-6-1)
    -   [La structure \`file\`](#sec-6-2)
    -   [Enregistrer un pÃ©riphÃ©rique](#sec-6-3)
    -   [Supprimer un pÃ©riphÃ©rique](#sec-6-4)
    -   [chardev.c](#sec-6-5)
    -   [Ecrire des modules pour plusieurs versions du noyau.](#sec-6-6)
-   [Le systÃ¨me de fichier /proc](#sec-7)
    -   [Lire et Ã©crire un fichier /proc](#sec-7-1)
    -   [GÃ©rer un fichier /proc avec un systÃ¨me de fichier
        standard](#sec-7-2)
    -   [GÃ©rer un fichier /proc avec seq\_file](#sec-7-3)
-   [sysfs : Interagissez avec votre module](#sec-8)
-   [Interagir avec un fichier de pÃ©riphÃ©rique](#sec-9)
-   [Les appels systÃ¨me](#sec-10)
-   [Processus bloquants et threads](#sec-11)
    -   [Sleep](#sec-11-1)
    -   [AchÃ¨vements](#sec-11-2)
-   [Eviter les collisions et les interblocages](#sec-12)
    -   [Mutex](#sec-12-1)
    -   [Verrou tournant](#sec-12-2)
    -   [Verrou lecture/Ã©criture](#sec-12-3)
    -   [OpÃ©rations atomiques](#sec-12-4)
-   [Remplacer les macros Print](#sec-13)
    -   [Remplacement](#sec-13-1)
    -   [Faire clignoter les LEDS du clavier](#sec-13-2)
-   [TÃ¢ches ordonnancÃ©es](#sec-14)
    -   [Tasklets](#sec-14-1)
    -   [Files de travaux](#sec-14-2)
-   [Gestionnaire d\'interruptions](#sec-15)
    -   [Gestionnaire d\'interruptions](#sec-15-1)
    -   [DÃ©tection de pression de bouton](#sec-15-2)
    -   [Partie immergÃ©e d\'une interruption](#sec-15-3)
-   [Cryptage](#sec-16)
    -   [Fonction de hachage](#sec-16-1)
    -   [Cryptage par clÃ© symÃ©trique](#sec-16-2)
-   [Standardisation des interfaces : Le modÃ¨le de
    pÃ©riphÃ©rique](#sec-17)
-   [Optimisation](#sec-18)
    -   [Conditions likely et unlikely](#sec-18-1)
-   [PiÃ¨ges rÃ©currents](#sec-19)
    -   [Utilisation de bibliothÃ¨ques standards.](#sec-19-1)
    -   [DÃ©sactiver les interruptions](#sec-19-2)
    -   [Ne vous jetez pas dans la gueule du loup](#sec-19-3)
-   [Que faire ensuite ?](#sec-20)
:::
:::

::: {#outline-container-sec-1 .outline-2}
Introduction {#sec-1}
------------

::: {#text-1 .outline-text-2}
Le guide de survie Ã la programmation en noyau Linux est un livre libre.
Vous pouvez le reproduire et le modifier sous respect de l\'Open
Software License, version 3.0.

Cet ouvrage est distribuÃ© avec l\'espoir qu\'il vous sera utile, mais
aucune financiÃ¨re ni d\'utilisation.

Les auteurs encouragent la distribution sans condition de cet ouvrage
pour un usage personnel, ou mÃªme Ã fin commerciale, Ã condition que
toute l\'information concernant les droits d\'auteur et autres droits
d\'exclusivitÃ© soient respectÃ©s et que la licence utilisÃ©e reste
compatible avec les descriptions de la licence Open Software License. En
rÃ©sumÃ©, vous pouvez copier cet ouvrage, le distribuer Ã des fins non
lucratives ou commerciales. Aucune permission explicite n\'est requise
de l\'auteur pour la reproduction de cet ouvrage quelqu\'en soit le
format, papier ou Ã©lectronique tant que vous respectez sa licence.

Tout travail ou traduction Ã partir de ce document doit Ãªtre placÃ©
sous une licence compatible avec les descriptions de la licence Open
Software License, et les droits d\'exclusivitÃ© du document original
doivent Ãªtre prÃ©servÃ©s dans le document final. Si vous avez
contribuÃ© Ã amÃ©liorer ce document, vous devez rendre votre travail
disponible et ouvert pour une mise Ã jour. Merci de rendre vos travaux,
traductions et mises Ã jours Ã disposition du gestionnaire de ce
document, Peter Jay Salzman \\\<p\@dirac.org\\\>. Ceci permettra de
fusionner vos travaux avec la version originale, afin de toujours
fournir Ã la communautÃ© Linux une version mise Ã jour.

Si vous publiez cet ouvrage Ã des fins commerciales, des dons, des
droits d\'auteur et des copies physiques seront grandement apprÃ©ciÃ©es
par les auteurs et le \[Linux Documentation
Project\](<http://www.tldp.org>) (LDP). Contribuer de cette sorte
dÃ©montre votre soutien au logiciel libre et au LDP. Si vous avez des
questions ou des commentaires, merci de contacter (en anglais)
l\'adresse dÃ©crite plus-haut.
:::

::: {#outline-container-sec-1-1 .outline-3}
### PaternitÃ© {#sec-1-1}

::: {#text-1-1 .outline-text-3}
Le guide de survie Ã la programmation en noyau Linux a Ã©tÃ© Ã
l\'origine Ã©crit pour le noyau dans sa version 2.2 par Ori Pomerantz.
Mais Ã terme, Ori n\'a plus eu le temps pour maintenir ce document Ã
jour. AprÃ¨s tout, le noyau Linux est un logiciel trÃ¨s volatile. Peter
Jay Salzman prit en main la mise Ã jour de ce document et l\'a mis Ã
jour pour la version 2.6. Finalement, Peter non plus n\'a plus eu de
temps Ã accorder Ã ce projet, alors Michael Burian est devenu un
co-gestionnaire de ce document et l\'a actualisÃ© pour les verions 2.6.
Bob Mottran a ensuite mis Ã jour les exemples pour les versions 3.8 et
postÃ©rieures, puis a rajoutÃ© le chapitre sur les sysfs et mis Ã jour
d\'autre chapitres. StÃ©phane Burel a traduit les travaux de ces auteurs
en franÃ§ais.
:::
:::

::: {#outline-container-sec-1-2 .outline-3}
### Versions et Notes {#sec-1-2}

::: {#text-1-2 .outline-text-3}
Comme prÃ©cisÃ© plus haut, le noyau Linux est un logiciel trÃ¨s
volatile. Depuis les origines du guide que vous lisez, et alors que les
nouvelles versions de Linux dÃ©filaient, la question s\'est toujours
posÃ©e de savoir si telle ou telle information obsolÃ¨te devait Ãªtre
enlevÃ©e ou si on devait la garder Ã titre historique. Michael Burian et
Bob Mottran ont dÃ©cidÃ© de crÃ©er une nouvelle branche du guide pour
chaque version stable. Ainsi la version du guide 4.15.x traitera du
noyau 4.15.x et la version 2.6.x traitera du noyau 2.6. Le but de ce
guide n\'est donc pas de retenir des informations historiques. Un
personne qui cherche une vieille information devra donc lire le guide
dans la version qui lui convient.

Le code source fourni et les notes gÃ©nÃ©rales devraient contenter
toutes les architectures et versions, mais je ne peux cependant pas vous
l\'assurer.
:::
:::

::: {#outline-container-sec-1-3 .outline-3}
### Remerciements {#sec-1-3}

::: {#text-1-3 .outline-text-3}
Les personnes suivantes ont contribuÃ© aux corrections du prÃ©sent
document et leurs suggestions ont Ã©tÃ© utiles : Ignacio Martin, David
Porter, Daniele Paolo Scarpazza, Dimo Velev, Francois Audeon, Horst
Schirmeier, Bob Mottram et Roman Lakeev.

Merci Ã©galement Ã Jacqueline Toulet pour sa relecture de la traduction
franÃ§aise de ce document.
:::
:::

::: {#outline-container-sec-1-4 .outline-3}
### Qu\'est ce qu\'un module noyau ? {#sec-1-4}

::: {#text-1-4 .outline-text-3}
Vous souhaitez donc Ã©crire un module noyau. Vous connaissez le C, vous
avez crÃ©Ã© quelques programmes que vous avez lancÃ© en tant que simple
processus, et vous souhaitez maintenant mettre les mains dans le
cambouis, lÃ ou un simple pointeur mal maÃ®trisÃ© peut rÃ©duire Ã nÃ©ant
tout votre travail, et oÃ¹ un plantage de votre programme conduit au
mieux au redÃ©marrage de votre machine, au pire Ã la fin du monde.

Vous cherchez donc Ã crÃ©er un module noyau.

Un module noyau est un morceau code qui peut Ãªtre chargÃ© et dÃ©chargÃ©
du noyau Ã la demande. Il Ã©tend les services du noyau sans avoir besoin
de redÃ©marrer le systÃ¨me. Par exemple, les pilotes de pÃ©riphÃ©riques
forment une classe de modules qui permettent au noyau d\'interagir avec
les pÃ©riphÃ©riques connectÃ©s au systÃ¨me. Sans les modules, il
faudrait crÃ©er un noyau monolithique, d\'un seul bloc, et insÃ©rer
toutes les nouveautÃ©s directement dans l\'image du noyau. Non seulement
on aurait donc des noyaux bien plus gros, cette technique a aussi
l\'inconvÃ©nient de nÃ©cessiter une rÃ©installation et un redÃ©marrage
du noyau Ã chaque fois que l\'on cherche une nouvelle fonctionnalitÃ©.
:::
:::

::: {#outline-container-sec-1-5 .outline-3}
### Paquet de module noyau {#sec-1-5}

::: {#text-1-5 .outline-text-3}
Les distributions Linux fournissent les commandes **modprobe**,
**insmod** et **depmod** pour utiliser un paquet.

Sur Debian:

::: {.org-src-container}
``` {.src .src-sh}
sudo apt-get install build-essential kmod
```
:::

Sur Parabola:

::: {.org-src-container}
``` {.src .src-sh}
sudo pacman -S gcc kmod
```
:::
:::
:::

::: {#outline-container-sec-1-6 .outline-3}
### Quels modules sont prÃ©sents dans mon noyau ? {#sec-1-6}

::: {#text-1-6 .outline-text-3}
Vous pouvez savoir les modules qui sont actuellement chargÃ©s dans votre
noyau en utilisant la commande **lsmod**.

::: {.org-src-container}
``` {.src .src-sh}
sudo lsmod
```
:::

La liste des modules sont stockÃ©s au sein du fichier /proc/modules,
pouvez vous donc les voir avec la commande suivante :

::: {.org-src-container}
``` {.src .src-sh}
sudo cat /proc/modules
```
:::

Cette liste pouvant Ãªtre trÃ¨s longue, peut-Ãªtre prÃ©fÃ©rerez vous
chercher un module particulier. Pour chercher le module *fat* :

::: {.org-src-container}
``` {.src .src-sh}
sudo lsmod | grep fat
```
:::
:::
:::

::: {#outline-container-sec-1-7 .outline-3}
### Ai-je besoin de tÃ©lÃ©charger et de compiler le noyau linux ? {#sec-1-7}

::: {#text-1-7 .outline-text-3}
Pour suivre ce cours, ce n\'est pas une nÃ©cessitÃ©. Mais Ã§a reste
conseillÃ© de travailler sur une version de test qui tourne sur une
machine virtuelle afin d\'Ã©viter de ruiner votre systÃ¨me et de tout
perdre en cas de maladresse du lecteur. Les auteurs de ce guide ne sont
pas tenus pour responsable dans un tel cas de figure.
:::
:::

::: {#outline-container-sec-1-8 .outline-3}
### Avant de commencer {#sec-1-8}

::: {#text-1-8 .outline-text-3}
Avant de plonger dans le vif du sujet, je tiens Ã vous signaler qu\'il
existe tellement de versions diffÃ©rentes de Linux que vous pouvez
rencontrez des problÃ¨mes qui ne sont pas signalÃ©es dans ce guide.
Selon le cas, crÃ©er votre premier module \"hello world\", le compiler
et l\'insÃ©rer dans le noyau peut Ãªtre la tÃ¢che la plus ardue de tout
ce guide. Ce qui implique qu\'une fois que vous aurez les pieds dans
l\'eau, ce qui suivra vous semblera plus simple. Ne dÃ©sespÃ©rez jamais
! C\'est la clÃ© pour programmer dans le noyau Linux.
:::

-   []{#sec-1-8-0-1}Version des Modules\
    ::: {#text-1-8-0-1 .outline-text-5}
    Un module compilÃ© pour un noyau donnÃ© ne se chargera pas sur un
    noyau diffÃ©rent, Ã moins que vous activiez l\'option
    CONFIG\_MODVERSIONS dans ce dit noyau. Nous irons plus en profondeur
    dans ce concept plus tard dans ce guide. Jusqu\'Ã ce que nous
    traitions le sujet, les exemples fournis peuvent ne pas marcher si
    vous utilisez un noyau avec cette option activÃ©e. Et la plupart des
    distributions Linux activent cette option par dÃ©faut. Si vous avez
    des problÃ¨mes en chargeant les modules en raison de la version de
    votre noyau, recompilez un noyau qui a dÃ©sactivÃ© cette option.
    :::

-   []{#sec-1-8-0-2}Utilisation d\'une console.\
    ::: {#text-1-8-0-2 .outline-text-5}
    Il vous est vivement recommandÃ© de noter, compiler et charger tous
    les exemples prÃ©sents dans ce guide. Et il est Ã©galement
    recommandÃ© de le faire Ã partir d\'une console. Vous ne devriez pas
    utiliser d\'environnement graphique.

    Les modules ne peuvent pas afficher de message Ã l\'Ã©cran Ã la
    maniÃ¨re d\'un printf(), mais ils peuvent enregistrer des
    informations et des alertes, qui finiront affichÃ©s sur votre
    Ã©cran, mais dans le seul cas oÃ¹ vous utilisez une console. Si vous
    insÃ©rez un module depuis un terminal graphique, les informations et
    les alertes seront enregistrÃ©es, mais seulement dans votre journal
    systemd. Vous ne pourrez pas le lire Ã moins de regarder votre
    journal journalctl. Afin d\'avoir directement, et en temps rÃ©el,
    accÃ¨s Ã toutes ces informations, vous devriez travailler Ã partir
    d\'une console.
    :::
:::
:::

::: {#outline-container-sec-2 .outline-2}
En-tÃªte {#sec-2}
--------

::: {#text-2 .outline-text-2}
Avant de pouvoir crÃ©er quoi que ce soit, vous aurez besoin d\'installer
les en-tÃªtes de votre noyau.

Sur Parabola GNU/Linux:

::: {.org-src-container}
``` {.src .src-sh}
sudo pacman -S linux-libre-headers
```
:::

Sur Debian:

::: {.org-src-container}
``` {.src .src-sh}
sudo apt-get update
apt-cache search linux-headers-$(uname -r)
```
:::

Ceci vous dira quels fichiers d\'en-tÃªte sont disponibles. Par exemple
:

::: {.org-src-container}
``` {.src .src-sh}
sudo apt-get install kmod linux-headers-4.15.2-1-amd64
```
:::
:::
:::

::: {#outline-container-sec-3 .outline-2}
Exemples {#sec-3}
--------

::: {#text-3 .outline-text-2}
Tous les documents de ce guide sont disponibles dans le sous-rÃ©pertoire
*examples*. Pour essayer et pour compiler :

::: {.org-src-container}
``` {.src .src-sh}
cd examples
make
```
:::

Si vous avez des erreurs de compilation vous avez peut-Ãªtre un noyau
plus rÃ©cent ou avez besoin d\'installer les fichiers d\'en-tÃªte
correspondants.
:::
:::

::: {#outline-container-sec-4 .outline-2}
Hello World {#sec-4}
-----------

::: {#text-4 .outline-text-2}
:::

::: {#outline-container-sec-4-1 .outline-3}
### Votre tout premier module {#sec-4-1}

::: {#text-4-1 .outline-text-3}
La plupart des personnes qui commencent Ã programmer dÃ©butent avec un
\"*hello world*\". Je ne sais pas quelles malÃ©dictions encourent celles
et ceux qui brisent cette tradition, et j\'ai trop peur de l\'apprendre.
Nous commencerons donc avec quelques exemples \"*hello world*\" qui vous
montreront les diffÃ©rents aspects des bases nÃ©cessaire Ã l\'Ã©criture
d\'un module noyau.

Voici le module le plus simple.

CrÃ©ez un rÃ©pertoire d\'essai :

::: {.org-src-container}
``` {.src .src-sh}
mkdir -p ~/develop/kernel/hello-1
cd ~/develop/kernel/hello-1
```
:::

Recopiez ceci au sein de votre Ã©diteur et sauvegardez le sous
**hello-1.c**:

::: {.org-src-container}
``` {.src .src-C}
/*
 *  hello-1.c - Module noyau Ã©lÃ©mentaire.
 */
#include <linux/module.h>       /* NÃ©cessaire pour tous les modules */
#include <linux/kernel.h>       /* NÃ©cessaire pour la macro pr_info */

int init_module(void)
{
    pr_info("Hello world 1.\n");

    /*
     * Un retour non nul signifie que init_module a Ã©chouÃ©. Dans ce cas,
     * le module ne peut pas Ãªtre chargÃ©.
     */
    return 0;
}

void cleanup_module(void)
{
    pr_info("Goodbye world 1.\n");
}
```
:::

Vous aurez maintenant besoin d\'un Makefile. Si vous recopiez ceci,
n\'oubliez pas de changer les espaces en tabulations :

::: {.org-src-container}
``` {.src .src-makefile}
obj-m += hello-1.o

all:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```
:::

Puis finalement :

::: {.org-src-container}
``` {.src .src-sh}
make
```
:::

Si tout se passe bien, vous devriez ensuite avoir un module compilÃ©
**hello-1.ko**. Vous pouvez lire les informations de ce module avec la
commande :

::: {.org-src-container}
``` {.src .src-sh}
sudo modinfo hello-1.ko
```
:::

Ã€ ce moment, la commande :

::: {.org-src-container}
``` {.src .src-sh}
sudo lsmod | grep hello
```
:::

Ne doit rien vous renvoyer. Vous pouvez essayer de charger votre module
flambant-neuf avec :

::: {.org-src-container}
``` {.src .src-sh}
sudo insmod hello-1.ko
```
:::

Le trait d\'union sera converti en sous-tiret, donc si vous ressayer la
commande :

::: {.org-src-container}
``` {.src .src-sh}
sudo lsmod | grep hello
```
:::

Vous devriez maintenant voir votre module chargÃ©. Il peut Ãªtre enlevÃ©
avec la commande :

::: {.org-src-container}
``` {.src .src-sh}
sudo rmmod hello_1
```
:::

Vous remarquez donc, comme prÃ©cisÃ© plus haut, que le trait d\'union du
nom de votre module a Ã©tÃ© remplacÃ© par un sous-tiret. Pour voir ce
qui s\'est passÃ© dans le journal :

::: {.org-src-container}
``` {.src .src-sh}
journalctl --since "1 hour ago" | grep kernel
```
:::

Vous connaissez maintenant la base de la crÃ©ation, de la compilation,
de l\'installation et la suppression de modules. Nous allons maintenant
Ã©tudier comment fonctionne un module.

Les modules noyau doivent contenir au moins deux fonctions : une
fonction de dÃ©part (ou d\'initialisation) appelÃ©e **init\_module()**
qui est appelÃ©e par la commande insmod, et une fonction de fin (ou de
nettoyage) appelÃ©e **cleanup\_module()** qui est appelÃ©e par la
commande rmmod. Une nouveautÃ© apportÃ©e par la version 2.3.13 du noyau
vous permet d\'utiliser maintenant les noms que vous souhaitez pour vos
fonctions de dÃ©part et de fin. On Ã©tudiera cette option dans la
rubrique 2.3. De fait, la nouvelle mÃ©thode doit Ãªtre prÃ©fÃ©rÃ©e, mais
vous pouvez rencontrer quelques irrÃ©ductibles traditionalistes qui
prÃ©fÃ¨rent encore travailler Ã l\'ancienne et utiliser les fonctions
init\_module() et cleanup\_module() pour leurs fonctions de dÃ©part et
de fin.

GÃ©nÃ©ralement, la fonction de dÃ©part met en place une fonction
gestionnaire pour une fonctionnalitÃ© du noyau, ou alors remplace l\'une
des fonctions du noyau avec le code de votre module (dans quel cas, le
module exÃ©cute habituellement son code avant d\'appeler le code
originel). Et la fonction de nettoyage quant Ã elle est censÃ©e dÃ©faire
tous les changements apportÃ©s la fonction de dÃ©part, afin de pouvoir
dÃ©charger le module de maniÃ¨re propre et sÃ©curisÃ©e.

Enfin, chaque module du noyau doit maintenant inclure le fichier
linux/module.h. On a besoin d\'inclure Ã©galement le fichier
**linux/kernel.h** pour avoir accÃ¨s Ã la macro pr\_alert() de
journalisation, fonction que l\'on traitera dans la rubrique 2.1.1.
:::

-   []{#sec-4-1-0-1}Note Ã propos du style de code\
    ::: {#text-4-1-0-1 .outline-text-5}
    Un autre point qu\'il faut prÃ©ciser Ã quiconque commence avec la
    programmation au cÅ"ur du noyau linux, c\'est qu\'il faut respecter
    les conventions de codes du noyau. Ã€ ce titre, vous devez utiliser
    comme indentation des tabulations, et non pas des espaces. C\'est
    l\'une des nombreuses conventions du noyau, et vous devez respecter
    ces conventions du noyau si vous voulez soumettre publiquement votre
    code.
    :::

-   []{#sec-4-1-0-2}Introduction aux macros de notations\
    ::: {#text-4-1-0-2 .outline-text-5}
    Au commencement, ce guide comprenait des fonctions **printk**,
    normalement suivies d\'une prioritÃ© telle que KERN\_INFO ou
    KERN\_DEBUG. Mais ces expressions peuvent maintenant Ãªtre
    abrÃ©gÃ©es grÃ¢ce Ã l\'usage de macros telles que **pr\_info** ou
    **pr\_debug**. Ces macros servent juste Ã simplifier votre code et Ã
    Ã©viter l\'oubli de prioritÃ©. Elles peuvent Ãªtre trouvÃ©es au sein
    du fichier **linux/printk.h**. Prenez le temps de lire ces
    dÃ©finitions, afin de voir toutes les prioritÃ©s disponibles.
    :::

-   []{#sec-4-1-0-3}Ã€ propos de la compilation\
    ::: {#text-4-1-0-3 .outline-text-5}
    Les modules noyau doivent Ãªtre compilÃ©s d\'une maniÃ¨re
    lÃ©gÃ¨rement diffÃ©rente d\'un programme utilisateur standard. Les
    premiÃ¨res versions du noyau exigeaient de nous un soin particulier
    vis-Ã -vis des paramÃ¨tres de compilation, habituellement stockÃ©s
    dans les Makefiles. Bien que hiÃ©rarchisÃ©s, de nombreux paramÃ¨tres
    redondants dans les Makefiles de sous-niveaux les rendaient de plus
    en plus gros et difficiles Ã mettre Ã jour. Heureusement, il existe
    dÃ©sormais une maniÃ¨re simplifiÃ©e de gÃ©rer la compilation,
    appelÃ©e kbuild, et le processus de compilation des modules externes
    chargeables Ã la volÃ©e est maintenant entiÃ¨rement intÃ©grÃ©e aux
    mÃ©canismes de compilation standard du noyau. Pour en apprendre
    davantage sur la compilation de modules qui ne font pas
    officiellement partie du noyau (tel que tous les exemples que vous
    trouverez dans ce guide), regardez le fichier
    **linux/Documentation/kbuild/modules.txt**.

    Vous trouverez Ã©galement des dÃ©tails complÃ©mentaires sur les
    Makefiles pour les modules noyau dans le fichier
    **linux/Documentation/kbuild/makefiles.txt**. Lisez ce fichier et
    ceux qui y sont liÃ©s avant de commencer Ã modifier un Makefile;
    vous Ã©conomiserez beaucoup de temps.

    > Voici un petit exercice pour le lecteur : Vous voyez le
    > commentaire plus haut concernant la valeur renvoyÃ©e par la
    > fonction init\_module()? Changez cette valeur pour une valeur
    > quelconque nÃ©gative, recompilez et rechargez le module. Que se
    > passe-t-il ?
    :::
:::

::: {#outline-container-sec-4-2 .outline-3}
### Salut et Au revoir {#sec-4-2}

::: {#text-4-2 .outline-text-3}
Comme je l\'ai prÃ©cisÃ© prÃ©cÃ©demment, dans les premiÃ¨res versions du
noyau, vous deviez utiliser les fonctions **init\_module** et
**cleanup\_module**, comme dans le premier exemple. Mais dÃ©sormais,
vous pouvez appeler vos fonctions comme bon vous semble en utilisant les
macros **module\_init** et **module\_exit**. Ces macros sont dÃ©finies
dans **linut/init.h**. La seule nÃ©cessitÃ© est que les fonctions soient
dÃ©finies avant d\'appeler ces macros, ou vous vous retrouverez avec des
erreurs de compilations. Voici un exemple de cette technique :

::: {.org-src-container}
``` {.src .src-C}
/*
 *  hello-2.c - Exemple montrant l'usage des macros module_init() et
 *              module_exit (). Ces macros sont Ã  prÃ©fÃ©rer aux fonctions
 *              init_module() et cleanup_module().
 */
#include <linux/module.h>       /* NÃ©cessaire pour tous les modules */
#include <linux/kernel.h>       /* NÃ©cessaire pour la macro pr_info */
#include <linux/init.h>         /* NÃ©cessaire pour les macros de modules */

static int __init hello_2_init(void)
{
    pr_info("Hello, world 2\n");
    return 0;
}

static void __exit hello_2_exit(void)
{
    pr_info("Goodbye, world 2\n");
}

module_init(hello_2_init);
module_exit(hello_2_exit);
```
:::

Nous avons maintenant deux modules noyau Ã notre actif. Ajouter un autre
module Ã notre Makefile se fait aussi simplement que Ã§a :

::: {.org-src-container}
``` {.src .src-makefile}
obj-m += hello-1.o
obj-m += hello-2.o
all:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```
:::

Maintenant, jetons un Å"il au fichier linux/drivers/car/Makefile pour un
exemple de Makefile en situation rÃ©elle.

Comme vous pouvez le voir, certains modules sont connectÃ©s en dur au
noyau (obj-y), mais oÃ¹ sont passÃ©s tous les obj-m ? Les lecteurs Ã
l\'aise avec le bash verront rapidement oÃ¹ je veux en venir. Pour les
dÃ©butants, les nombreuses lignes obj-\$(CONFIG\_EXEMPLE) que vous
pouvez voir s\'Ã©tendent soit en obj-y, soit en obj-m, selon que la
variable CONFIG\_EXEMPLE soit Ã©gale Ã y ou Ã m. Ces variables sont
affectÃ©es dans le fichier linux/.config, au moment oÃ¹ vous lancez make
menuconfig ou une autre commande pour configurer votre noyau avant de le
compiler.
:::
:::

::: {#outline-container-sec-4-3 .outline-3}
### Les macros \_\_init et \_\_exit {#sec-4-3}

::: {#text-4-3 .outline-text-3}
Ces macros sont une nouveautÃ© du noyau 2.2. Vous observerez les
changements dans les dÃ©finitions des fonctions de dÃ©part et de fin. La
macro **\_\_init** conduit la fonction d\'entrÃ©e Ã Ãªtre supprimÃ©e du
noyau afin que son espace mÃ©moire soit libÃ©rÃ©, une fois que la
fonction d\'entrÃ©e s\'est terminÃ©e. Comme cette fonction n\'est faite
que pour Ãªtre appelÃ©e qu\'une fois, ce mÃ©canisme est sensÃ©. Cette
fonctionnalitÃ© n\'est cependant disponible que pour les pilotes
compilÃ©s avec votre noyau et n\'aura aucun effet sur votre module.

Il existe Ã©galement une macro **\_\_initdata** donc le fonctionnement
est semblable Ã **\_\_init** mais pour les variables d\'initialisation
plutÃ´t que pour les fonctions.

Il existe Ã©galement la macro **\_\_exit**, qui permet d\'ignorer la
fonction de sortie au moment de la compilation de votre noyau. Si vous
considÃ©rez que cette fonction ne doit pas Ãªtre appelÃ©e puisqu\'elle
ne peut Ãªtre enlevÃ©e de votre noyau, lÃ encore ce mÃ©canisme est
utile. Encore une fois, cette fonctionnalitÃ© n\'a de sens que pour les
pilotes compilÃ©s avec votre noyau et n\'aura aucun effet sur votre
module.

Ces macros sont dÃ©finies dans le fichier **linux/init.h** et ne servent
qu\'Ã Ã©conomiser l\'espace mÃ©moire du noyau. Quand vous lancer votre
noyau vous aurez peut-Ãªtre l\'occasion de votre un message tel que
\"Freeing unused kernel memory : 236k freed\" C\'est prÃ©cisÃ©mment de
ce mÃ©canisme qu\'il s\'agit.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  hello-3.c - Illustre l'usage des macros __init, __initdata et __exit.
 */
#include <linux/module.h>       /* NÃ©cessaire pour tous les modules */
#include <linux/kernel.h>       /* NÃ©cessaire pour la macro pr_info */
#include <linux/init.h>         /* NÃ©cessaire pour les macros de modules */

static int hello3_data __initdata = 3;

static int __init hello_3_init(void)
{
    pr_info("Hello, world %d\n", hello3_data);
    return 0;
}

static void __exit hello_3_exit(void)
{
    pr_info("Goodbye, world 3\n");
}

module_init(hello_3_init);
module_exit(hello_3_exit);
```
:::
:::
:::

::: {#outline-container-sec-4-4 .outline-3}
### Licences et Documentation du Module {#sec-4-4}

::: {#text-4-4 .outline-text-3}
Soyons honnÃªte : Quel genre de fou charge dans son noyau des modules
propriÃ©taires ? Si c\'est votre cas, vous avez peut-Ãªtre dÃ©jÃ vu ce
message :

::: {.org-src-container}
``` {.src .src-txt}
# insmod xxxxxx.o
Warning: loading xxxxxx.ko will taint the kernel: no license
  See http://www.tux.org/lkml/#export-tainted for information about tainted modules
Module xxxxxx loaded, with warnings
```
:::

Vous pouvez utiliser certaines macros pour indiquer la licence pour
votre module. A titre exhaustif, vous pouvez utiliser \"GPL\", \"GPL
v2\", \"GPL and additional rights\", \"Dual BSD/GPL\", \"Dual MIT/GPL\",
\"Dual MPL/GPL\" comme licence libre. Toutes les autres sont
\"Proprietary\", et ne sont donc pas considÃ©rÃ©es comme libres. Ces
macros sont dÃ©finies dans le fichier **linux/module.h**.

La macro pour indiquer la licence de votre module est
**MODULE\_LICENSE**. Cette macro, ainsi que d\'autres servant Ã dÃ©crire
le module sont illustrÃ©es dans l\'exemple suivant.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  hello-4.c - Illustre la documentation des modules.
 */
#include <linux/module.h>       /* NÃ©cessaire pour tous les modules */
#include <linux/kernel.h>       /* NÃ©cessaire pour la macro pr_info */
#include <linux/init.h>         /* NÃ©cessaire pour les macros de modules */

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("A sample driver");
MODULE_SUPPORTED_DEVICE("testdevice");

static int __init init_hello_4(void)
{
        pr_info("Hello, world 4\n");
        return 0;
}

static void __exit cleanup_hello_4(void)
{
        pr_info("Goodbye, world 4\n");
}

module_init(init_hello_4);
module_exit(cleanup_hello_4);
```
:::
:::
:::

::: {#outline-container-sec-4-5 .outline-3}
### Passer un argument Ã votre module {#sec-4-5}

::: {#text-4-5 .outline-text-3}
Les modules peuvent recevoir un argument via une ligne de commande, mais
pas de la maniÃ¨re d\'un programme utilisateur.

Afin de permettre Ã votre module de recevoir des arguments, vous devez
dÃ©clarer des variables globales qui recevront ces arguments. Vous
devrez ensuite utiliser la macro module\_param (laquelle est dÃ©finie
dans le fichier linux/moduleparam.h) afin d\'activer ce mÃ©canisme.
Quand votre module sera lancÃ©, la commande insmod va affecter ces
variables globales avec les valeurs donnÃ©es (par exemple ./insmod
mymodule.ko variable=5). Les variables ainsi que les macros que je viens
de dÃ©crire doivent Ãªtre placÃ©es au dÃ©but de votre module pour des
raisons de lisibilitÃ©. L\'exemple suivant dÃ©montrera ce point plus
facilement qu\'un long discours.

La macro module\_param() prend 3 arguments : le nom de la variable, son
type et la permission du fichier correspondant (qui sera crÃ©Ã© pour
chaque argument) crÃ©Ã© avec sysfs. Les entiers peuvent Ãªtre signÃ©s ou
non signÃ©s. Si vous souhaitez utiliser des tableaux d\'entiers ou des
chaÃ®nes de caractÃ¨res, vous chercherez les macros
module\_param\_array() et module\_param\_string().

::: {.org-src-container}
``` {.src .src-c}
int myint = 3;
module_param(myint, int, 0);
```
:::

Le mÃ©canisme pour les tableaux d\'arguments est maintenant diffÃ©rents
des premiÃ¨res versions de Linux. Pour garder une trace du nombre de
paramÃ¨tres vous devez passer, en troisiÃ¨me argument, un pointeur vers
une variable qui contiendra un compteur. Vous pouvez Ã©galement ignorer
ce compteur et passer la valeur NULL Ã la place. Voici un exemple
traitant ces deux mÃ©thodes :

::: {.org-src-container}
``` {.src .src-c}
int myintarray[2];
module_param_array(myintarray, int, NULL, 0); /* Le nombre d'arguments n'est pas pris en compte */

short myshortarray[4];
int count;
module_parm_array(myshortarray, short, &count, 0); /* Le nombre d'arguments est pris en compte */
```
:::

Un bon usage consiste Ã utiliser des valeurs par dÃ©faut pour vos
variables, tel qu\'un port ou une adresse d\'entrÃ©e/sortie par dÃ©faut.
Si les variables contiennent les valeurs par dÃ©faut, alors vous lancez
une mÃ©canisme d\'autodÃ©tection (qui sera expliquÃ© plus tard). Sinon
vous gardez la valeur passÃ©e en argument. Cet aspect sera clarifiÃ© par
la suite.

Ensuite, il existe une macro de fonction, **MODULE\_PARAM\_DESC()**, qui
est utilisÃ©e pour documenter les arguments que votre module peut
prendre. Cette macro a besoin de deux paramÃ¨tres : un nom de variable
et une chaÃ®ne de caractÃ¨res qui dÃ©crit cette variable.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  hello-5.c - Montre comment recevoir des arguments de la ligne de commande.
 */
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/stat.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Peter Jay Salzman");

static short int myshort = 1;
static int myint = 420;
static long int mylong = 9999;
static char *mystring = "blah";
static int myintArray[2] = { -1, -1 };
static int arr_argc = 0;

/*
 * module_param(foo, int, 0000)
 * Le premier paramÃ¨tre est le nom du paramÃ¨tre
 * Le second est son type
 * Le dernier argument dÃ©crit les drapeaux de permissions du fichier au sein
 *   du sysfs qui sera crÃ©Ã© plus tard (si toutefois cette valeur n'est pas
 *   nulle).
 */

module_param(myshort, short, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
MODULE_PARM_DESC(myshort, "Un entier short");
module_param(myint, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
MODULE_PARM_DESC(myint, "Un entier");
module_param(mylong, long, S_IRUSR);
MODULE_PARM_DESC(mylong, "Un entier long");
module_param(mystring, charp, 0000);
MODULE_PARM_DESC(mystring, "Une chaÃ®ne de caractÃ¨res");

/*
 * module_param_array(name, type, num, perm);
 * Le premier paramÃ¨tre est le nom du paramÃ¨tre (ici le nom du tableau)
 * Le second est le type des Ã©lÃ©ments au sein de ce tableau
 * Le troisiÃ¨me argument est un pointeur vers une variable qui contiendra
 *   suite Ã  l'appel de cette fonction le nombre d'Ã©lÃ©ments initialisÃ© par
 *   l'utilisateur
 * Le dernier argument dÃ©crit les drapeaux de permissions du fichier au sein
 *   du sysfs qui sera crÃ©Ã© plus tard (si toutefois cette valeur n'est pas
 *   nulle).
 */
module_param_array(myintArray, int, &arr_argc, 0000);
MODULE_PARM_DESC(myintArray, "Un tableau d'entiers");

static int __init hello_5_init(void)
{
    int i;
    pr_info("Hello, world 5\n=============\n");
    pr_info("myshort is a short integer: %hd\n", myshort);
    pr_info("myint is an integer: %d\n", myint);
    pr_info("mylong is a long integer: %ld\n", mylong);
    pr_info("mystring is a string: %s\n", mystring);
    for (i = 0; i < (sizeof myintArray / sizeof (int)); i++)
    {
        pr_info("myintArray[%d] = %d\n", i, myintArray[i]);
    }
    pr_info("got %d arguments for myintArray.\n", arr_argc);
    return 0;
}

static void __exit hello_5_exit(void)
{
    pr_info("Goodbye, world 5\n");
}

module_init(hello_5_init);
module_exit(hello_5_exit);
```
:::

Je vous recommande d\'essayer ce code :

::: {.org-src-container}
``` {.src .src-txt}
# sudo insmod hello-5.ko mystring="bebop" mybyte=255 myintArray=-1
mybyte is an 8 bit integer: 255
myshort is a short integer: 1
myint is an integer: 20
mylong is a long integer: 9999
mystring is a string: bebop
myintArray is -1 and 420

# rmmod hello-5
Goodbye, world 5

# sudo insmod hello-5.ko mystring="supercalifragilisticexpialidocious" \
> mybyte=256 myintArray=-1,-1
mybyte is an 8 bit integer: 0
myshort is a short integer: 1
myint is an integer: 20
mylong is a long integer: 9999
mystring is a string: supercalifragilisticexpialidocious
myintArray is -1 and -1

# rmmod hello-5
Goodbye, world 5

# sudo insmod hello-5.ko mylong=hello
hello-5.o: invalid argument syntax for mylong: 'h'
```
:::
:::
:::

::: {#outline-container-sec-4-6 .outline-3}
### CrÃ©er un module depuis plusieurs fichiers {#sec-4-6}

::: {#text-4-6 .outline-text-3}
Vous aurez parfois besoin de diviser le code source de votre module en
plusieurs fichiers.

Voila l\'exemple d\'un module avec une telle organisation :

::: {.org-src-container}
``` {.src .src-C}
/*
 *  start.c - Illustration d'un module dÃ©coupÃ© en plusieurs fichiers
 */

#include <linux/kernel.h>       /* Ce code exÃ©cute du code noyau */
#include <linux/module.h>       /* Et il appelle des fonctions pour modules */

int init_module(void)
{
    pr_info("Hello, world\n");
    return 0;
}
```
:::

Le second fichier :

::: {.org-src-container}
``` {.src .src-C}
/*
 *  start.c - Illustration d'un module dÃ©coupÃ© en plusieurs fichiers
 */

#include <linux/kernel.h>       /* Ce code exÃ©cute du code noyau */
#include <linux/module.h>       /* Et il appelle des fonctions pour modules */

void cleanup_module()
{
    pr_info("Short is the life of a kernel module\n");
}
```
:::

Et finalement : Le Makefile

::: {.org-src-container}
``` {.src .src-makefile}
obj-m += hello-1.o
obj-m += hello-2.o
obj-m += hello-3.o
obj-m += hello-4.o
obj-m += hello-5.o
obj-m += startstop.o
startstop-objs := start.o stop.o

all:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```
:::

VoilÃ le Makefile complet pour tous les exemples que nous avons traitÃ©s
jusqu\'ici. Les cinq premiÃ¨res lignes ne vous Ã©tonneront pas, mais
pour le dernier exemple vous aurez besoin de deux lignes. Nous inventons
d\'abord un nom d\'objet pour tous nos fichiers combinÃ©s, puis on
indique au Makefile quels objets forment le module.
:::
:::

::: {#outline-container-sec-4-7 .outline-3}
### CrÃ©er des modules pour un noyau prÃ©compilÃ© {#sec-4-7}

::: {#text-4-7 .outline-text-3}
Nous vous recommandons fortement de recompiler votre noyau, afin que
vous puissiez activer de nombreuses fonctionnalitÃ©s utiles pour le
dÃ©bogage, par exemple forcer l\'enlÃ¨vement du noyau de votre module :
(**MODULE\_FORCE\_UNLOAD**): cette option vous permettra de dÃ©charger
votre module du noyau mÃªme quand ce dernier estime qu\'il est dangereux
de le dÃ©charger, via la commande **sudo rmmod -f module**. Cette option
vous fera Ã©conomiser beaucoup de temps et de redÃ©marrage durant le
dÃ©veloppement de votre module. Si vous ne dÃ©sirez pas recompiler votre
noyau, vous pouvez envisager d\'utiliser une machine virtuelle. Si vous
commettez une erreur vous pourrez donc facilement redÃ©marrer ou
restaurer votre machine virtuelle Ã son Ã©tat initial.

Il existe Ã©galement de nombreux cas dans lesquels vous prÃ©fÃ©rerez
charger votre module dans un noyau prÃ©compilÃ©, tel que ceux fournis
avec la plupart des distributions Linux, ou un noyau que vous avez dÃ©jÃ
compilÃ© vous-mÃªme. Dans certaines circonstances, vous aurez besoin de
compiler et d\'insÃ©rer vos modules dans un noyau que vous ne pouvez pas
recompiler, ou sur une machine qu\'il ne vaut mieux pas redÃ©marrer. Si
vous pensez que ce genre de situation ne vous arrivera jamais, vous
pouvez passer Ã la suite et considÃ©rer le reste de ce chapitre comme
une grosse note de bas de page.

Maintenant, si vous avez installÃ© le code source du noyau, utilisez-le
pour compiler votre module et si vous essayez d\'insÃ©rer votre module
au sein du noyau, dans la plupart des cas vous subirez l\'erreur
suivante :

::: {.org-src-container}
``` {.src .src-txt}
insmod: error inserting 'poet_atkm.ko': -1 Invalid module format
```
:::

Des informations moins laconiques sont enregistrÃ©es dans le journal
systemd :

::: {.org-src-container}
``` {.src .src-txt}
Jun  4 22:07:54 localhost kernel: poet_atkm: version magic '2.6.5-1.358custom 686
REGPARM 4KSTACKS gcc-3.3' should be '2.6.5-1.358 686 REGPARM 4KSTACKS gcc-3.3'
```
:::

En d\'autres mots, votre noyau refuse d\'accepter votre module car les
versions (on parle de version magics) ne correspondent pas. D\'ailleurs,
les versions sont enregistrÃ©es dans votre module compilÃ© sous la forme
d\'une chaÃ®ne de caractÃ¨res statique, commenÃ§ant pas vermagic:. Cette
version est insÃ©rÃ©e dans votre module au moment oÃ¹ ce dernier est
liÃ© au fichier **init/vermagic.o**. Afin d\'observer la version et les
autres chaÃ®nes de caractÃ¨res stockÃ©es au sein d\'un module, vous
pouvez utilisez la commande modinfo :

::: {.org-src-container}
``` {.src .src-txt}
# sudo modinfo hello-4.ko
license:        GPL
author:         Bob Mottram <bob@freedombone.net>
description:    A sample driver
vermagic:       4.15.2-1.358 amd64 REGPARM 4KSTACKS gcc-4.9.2
depends:
```
:::

Pour rÃ©gler le problÃ¨me soulevÃ© plus haut, nous pouvons avoir recours
Ã l\'option **--force-vermagic**, mais cette solution est
potentiellement dangereuse, et inacceptable pour un module dont le
dÃ©veloppement est en phase de production. En consÃ©quence, nous voulons
compiler nos modules dans un environnement qui est identique Ã celui
dans le quel notre noyau a Ã©tÃ© compilÃ©. Comment procÃ©der est
l\'objet de ce chapitre.

Avant tout, assurez-vous d\'avoir le code source de votre noyau Ã
portÃ©e de main, et dans la mÃªme version que celle de votre noyau
actuel, ou du noyau de votre machine virtuelle. Ensuite, trouvez le
fichier de configuration qui a Ã©tÃ© utilisÃ© pour compiler votre noyau.
Habituellement, vous pouvez le trouver dans votre rÃ©pertoire *boot,
sous un nom tel que config-4.7.xxx. Vous voulez peut-Ãªtre juste le
copier dans votre code source : \*cp /boot/config-\`uname -r\`
/usr/src/linux-\`uname -r\`*.config\*.

Concentrons-nous maintenant sur le message d\'erreur prÃ©cÃ©dent : en
regardant de plus prÃ¨s les versions, on constate que mÃªme si les deux
fichiers de configurations sont exactement identiques, il existe une
lÃ©gÃ¨re diffÃ©rence dans les versions, et cette diffÃ©rence suffit Ã
empÃªcher votre module d\'Ãªtre insÃ©rÃ© dans votre noyau. Cette petite
diffÃ©rence, Ã savoir la chaÃ®ne de caractÃ¨res modifiÃ©e dans la
version du module vient de la modification apportÃ©e par le Makefile de
certaines distributions. Examinez donc le fichier
**/usr/src/linux/Makefile**, et assurez-vous que la version spÃ©cifiÃ©e
corresponde bien Ã votre noyau actuel. Par exemple, votre Makefile peut
commencer par :

::: {.org-src-container}
``` {.src .src-makefile}
VERSION = 4
PATCHLEVEL = 7
SUBLEVEL = 4
EXTRAVERSION = -1.358custom
```
:::

Dans ce cas, vous devez restaurer la valeur du symbole **EXTRAVERSION**
Ã -1.358. Nous vous suggÃ©rons cependant de garder une sauvegarde du
Makefile utilisÃ© pour compiler votre noyau, lequel est disponible dans
**/lib/modules/4.15.2-1.358/build**. Une simple commande **cp
/lib/modules/\`uname-r\`/build/Makefile /usr/src/linux-\`uname -r\`**
devrait suffir. De plus si vous avez dÃ©jÃ commencÃ© Ã compiler un noyau
avec le (mauvais) Makefile prÃ©cÃ©dent, vous devriez relancer la
compilation, ou alors modifier le symbole UTS\_RELEASE dans le fichier
**/usr/src/linux-4.15.2/include/linux/version.h** pour qu\'il
corresponde au contenu du fichier
**/lib/modules/4.15.2/build/include/linux/version.h** (ou alors Ã©craser
le second avec le premier).

Maintenant relancez la commande make pour mettre Ã jour la configuration
et les versions :

::: {.org-src-container}
``` {.src .src-txt}
# make
CHK     include/linux/version.h
UPD     include/linux/version.h
SYMLINK include/asm -> include/asm-i386
SPLIT   include/linux/autoconf.h -> include/config/*
HOSTCC  scripts/basic/fixdep
HOSTCC  scripts/basic/split-include
HOSTCC  scripts/basic/docproc
HOSTCC  scripts/conmakehash
HOSTCC  scripts/kallsyms
CC      scripts/empty.o
```
:::

Vous n\'avez pas besoin de recompiler la totalitÃ© de votre noyau, vous
pouvez interrompre la compilation avec un Ctrl+C aprÃ¨s la ligne SPLIT,
parce qu\'Ã ce moment, tous les fichiers dont vous avez besoin ont dÃ©jÃ
Ã©tÃ© recompilÃ©s. Vous pouvez revenir dans le rÃ©pertoire de votre
module et le recompiler : Il sera recrÃ©Ã© conformÃ©ment aux exigences
des paramÃ¨tres de votre noyau actuel et pourra donc Ãªtre chargÃ© sans
erreurs.
:::
:::
:::

::: {#outline-container-sec-5 .outline-2}
Avant-propos {#sec-5}
------------

::: {#text-5 .outline-text-2}
:::

::: {#outline-container-sec-5-1 .outline-3}
### OÃ¹ la vie d\'un module commence et oÃ¹ elle se termine {#sec-5-1}

::: {#text-5-1 .outline-text-3}
Un programme est d\'habitude intÃ©grÃ© dans une fonction \`main()\`, y
entre, exÃ©cute un certain nombre d\'instructions avant de se terminer.
Les modules du noyau ne fonctionnent pas de cette maniÃ¨re. Un module
commence avec la fonction de dÃ©part, que ce soit la fonction
init\_module ou la fonction spÃ©cifiÃ©e par la macro module\_init.
C\'est la fonction d\'entrÃ©e pour mes modules; elle informe le noyau
des fonctionnalitÃ©s que ce module fournit, et paramÃ¨tre le noyau pour
lancer les fonctions du module quand nÃ©cessaire. Ensuite, la fonction
de dÃ©part se termine et le module ne fait plus rien tant que le noyau
n\'a pas dÃ©cidÃ© d\'appeler le code fournit par le module.

Tous les modules se terminent par une fonction de fin, soit en
**cleanup\_module**, soit la fonction spÃ©cifiÃ©e par l\'appel de la
macro **module\_exit**. C\'est la fonction de sortie de votre module;
elle doit dÃ©faire tous les changements apportÃ©s par votre fonction de
dÃ©part. La fonction de fin doit enlever toutes les fonctionnalitÃ©s que
la fonction de dÃ©part avait enregistrÃ©es.

Tous les modules doivent avoir une fonction de dÃ©part et une fonction
de fin. Comme il y a de nombreuses faÃ§ons d\'appeler ces fonctions, je
m\'emploierai Ã faire de mon mieux pour parler de fonction de dÃ©part et
de sortie, mais si par mÃ©garde j\'emploie les termes de fonction
d\'entrÃ©e et de sortie ou de fonction init\_module et cleanup\_module,
vous saurez de quoi je veux parler.
:::
:::

::: {#outline-container-sec-5-2 .outline-3}
### Fonctions disponibles pour votre module {#sec-5-2}

::: {#text-5-2 .outline-text-3}
Les dÃ©veloppeurs utilisent sans arrÃªt des fonctions qu\'ils n\'ont pas
eux-mÃªmes dÃ©finies. Un exemple flagrant est la fonction **printf()**
Vous utilisez des bibliothÃ¨ques de fonctions qui sont fournies par la
bibliothÃ¨que standard du C, libc. Votre code n\'appelle pas rÃ©ellement
ces fonctions avant l\'Ã©dition de lien, qui s\'assure que le code est
disponible, et modifie les appels des fonctions recherchÃ©es pour qu\'il
pointe effectivement vers le code concernÃ©.

Ici aussi, les modules sont diffÃ©rents. Dans l\'exemple hello world,
vous avez peut-Ãªtre remarquÃ© que nous avons utilisÃ© une fonction,
**pr\_info()** mais que nous n\'avons pas inclut de bibliothÃ¨que
d\'entrÃ©e/sortie. C\'est parce que les modules sont des fichiers objets
dont les symboles sont affectÃ©s au moment de l\'insertion de votre
module. La dÃ©finition de ces symboles vient du noyau lui-mÃªme. Les
seuls fonctions externes que vous pouvez utiliser sont celles fournies
pas le noyau. Si vous Ãªtes curieux et souhaitez savoir quels symboles
sont exportÃ©s par votre noyau, vous pouvez regarder **/proc/kallsyms**.

Il faut garder Ã l\'esprit la diffÃ©rence entre fonctions de
bibliothÃ¨ques et appels systÃ¨me. Les fonctions de bibliothÃ¨ques sont
situÃ©es Ã un niveau plus haut, tournent dans l\'espace utilisateur et
fournissent une interface plus accessible que les fonctions qui font
rÃ©ellement tout le boulot : les appels systÃ¨me. Les appels systÃ¨me
sont fournis par le noyau et tournent dans l\'espace noyau sur demande
de l\'utilisateur. La fonction de bibliothÃ¨que printf() peut vous
sembler Ãªtre une fonction trÃ¨s gÃ©nÃ©raliste, mais en rÃ©alitÃ© tout
ce qu\'elle fait est de formater les informations passÃ©es dans une
chaÃ®ne de caractÃ¨res et ensuite Ã©crire la chaÃ®ne de caractÃ¨res en
utilisant l\'appel systÃ¨me bas niveau write(), lequel envoit les
donnÃ©es Ã Ã©crire vers l\'affichage standard.

Vous souhaitez voir Ã quels appels systÃ¨me fait appel un simple
printf() ? Rien de plus simple ! Compilez le programme suivant avec la
commande **gcc -Wall -o hello hello.c** :

::: {.org-src-container}
``` {.src .src-c}
#include <stdio.h>

int main(void)
{
    printf("hello");
    return 0;
}
```
:::

Lancez l\'exÃ©cutable avec **strace ./hello**. ImpressionÃ© ? Chacune
des lignes que vous voyez correspond Ã un appel systÃ¨me.
[strace](https://strace.io/) est un programme trÃ¨s utile qui vous
dÃ©taille la liste des appels systÃ¨me Ã©mis, avec quels arguments et
quelles sont les valeurs retournÃ©es. C\'est un outil inestimable pour
comprendre Ã quels fichiers un programme accÃ¨de. Ã€ la fin, vous
devriez voir une ligne semblable Ã (1, \"hello\", 5hello). Voici le
visage derriÃ¨re le masque d\'un printf(). Vous n\'Ãªtiez peut-Ãªtre pas
trÃ¨s familiarisÃ© avec la fonction write(), puisque la plupart des
dÃ©veloppeurs utilisent des bibliothÃ¨ques utilisateurs pour les
entrÃ©es/sorties (tel que fopen, fputs, fclose). Si c\'est la cas, jetez
un coup d\'oeil au manuel man 2 write. La deuxiÃ¨me section des manuels
(man 2) correspond aux appels systÃ¨me (tel que kill() ou read()). La
troisiÃ¨me section quant Ã elle contient des appels Ã des bibliothÃ¨ques
utilisateurs (comme cosh() ou random()).

Vous pouvez mÃªme Ã©crire des modules pour remplacer les appels systÃ¨me
du noyau, ce qu\'on fera trÃ¨s prochainement. Les pirates utilisent
souvent cette technique pour introduire un cheval de Troie au sein d\'un
systÃ¨me, mais vous pouvez utiliser votre module pour faire des choses
bien pus innocentes, comme Ã©crire \"You hou, Ã§a chatouille !\" Ã
chaque fois que quelqu\'un demande Ã supprimer un fichier sur votre
systÃ¨me.
:::
:::

::: {#outline-container-sec-5-3 .outline-3}
### Mode utilisateur, mode noyau {#sec-5-3}

::: {#text-5-3 .outline-text-3}
Il existe bien des maniÃ¨res de rÃ©sumer un systÃ¨me d\'exploitation.
L\'une d\'entre elles est de le voir comme un gestionnaire de
ressources, que ces ressources en questions soient une carte graphique,
un disque dur ou mÃªme la mÃ©moire. Plusieurs programmes rentrent
souvent en compÃ©tition avec la mÃªme ressource. Alors que je viens
juste de sauvegarder ce document, updatedb a commencÃ© a mettre Ã jour
sa base de donnÃ©e locale. Mon Ã©diteur de texte et updatedb doivent
tous les deux utiliser mon disque dur, en mÃªme temps. Le noyau doit
gÃ©rer ces demandes concurrentes, et ne pas donner Ã l\'utilisateur tous
les accÃ¨s ressources quand ce dernier le souhaite. Pour rÃ©pondre Ã
cete exigeance, un processeur peut gÃ©rer plusieurs modes. Chaque mode
donne certains droits sur le systÃ¨me. Par exemple, l\'architecture
Intel 80386 d\'Intel gÃ¨re ainsi quatre niveaux de privilÃ¨ges
diffÃ©rents. Unix n\'en utilise que deux : le niveau le plus haut
(niveau 0, aussi appelÃ© mode noyau, ou superviseur), et le niveau le
plus bas, appelÃ© niveau utilisateur.

Revenons sur les diffÃ©rences entre bibliothÃ¨ques utilisateur et appels
systÃ¨me. Le plus souvent, vous utilisez une fonction d\'une
bibliothÃ¨que utilisateur en mode utilisateur. Cette fonction appelle un
ou plusieurs appels systÃ¨me, et ces derniers, exÃ©cutÃ©s sur demande de
l\'utilisateur, sont lancÃ©s en mode noyau, puisqu\'ils font partie du
noyau. Au retour des appels systÃ¨me, l\'exÃ©cution est de nouveau
transfÃ©rÃ©e en mode utilisateur.
:::
:::

::: {#outline-container-sec-5-4 .outline-3}
### Convention de nommage {#sec-5-4}

::: {#text-5-4 .outline-text-3}
Quand vous Ã©crivez un petit programme en C, vous utilisez des variables
avec un nom cohÃ©rent et qui sont facilement comprÃ©hensibles pour le
lecteur. Mais si vous Ã©crivez des fonctions qui seront insÃ©rÃ©es dans
un noyau, toutes vos variables globales seront confondues avec toutes
les variables globales du systÃ¨me. Et comme deux variables ne peuvent
Ãªtre homonymes, des conflits peuvent apparaÃ®tre. Quand un programme
utilise de nombreuses variables globales qui ne sont pas assez prÃ©cises
et que des conflits apparaissent, alors on parle de pollution de
nommage. De maniÃ¨re gÃ©nÃ©rale, dans les projets imposants, un effort
particulier doit Ãªtre portÃ© pour respecter une convention de nommage,
afin de nommer les variables et les macros de maniÃ¨re unique et
standardisÃ©e.

Quand vous Ã©crivez du code pour le noyau, mÃªme le plus petit module
peut Ãªtre liÃ© avec tout le noyau, et le faire entiÃ¨rement dÃ©railler,
alors il faut prendre ce problÃ¨me au sÃ©rieux. La meilleure maniÃ¨re de
procÃ©der est de dÃ©clarer toutes vos variables de maniÃ¨res statiques
et d\'utiliser des prÃ©fixes bien dÃ©finis pour vos symboles. La
convention pour le noyau est de crÃ©er des prÃ©fixes en minuscule. Et si
vous ne voulez pas dÃ©clarer toutes vos variables en statiques, vous
avez la possibilitÃ© de dÃ©clarer une table des symboles et de
l\'enregistrer dans le noyau. Nous y reviendrons plus tard.

Le fichier **/proc/kallsyms** dÃ©tient tous les symboles dont le noyau a
conscience qui sont donc accessible depuis votre module, tant que ce
dernier partage l\'espace du noyau.
:::
:::

::: {#outline-container-sec-5-5 .outline-3}
### Espace de code {#sec-5-5}

::: {#text-5-5 .outline-text-3}
La gestion de la mÃ©moire est un sujet trÃ¨s compliquÃ©, et la majoritÃ©
du livre de O\'Reilly\'s **Understanding The Linux Kernel** se rÃ©sume Ã
expliquer la gestion de mÃ©moire de Linux ! Pour continuer ce cours,
vous n\'aurez pas besoin d\'Ãªtre des experts en gestion de mÃ©moire,
mais il est important de savoir certaines choses avant de commencer Ã
crÃ©er de vrais modules.

Si vous ne vous Ãªtes jamais vraiment demandÃ© le mÃ©canisme derriÃ¨re
une segfault, vous serez surpris de savoir que les pointeurs ne pointent
pas vraiment vers un emplacement mÃ©moire rÃ©el. Quand un processus est
crÃ©Ã©, le noyau lui attribue une partie de la mÃ©moire physique, que le
processus va utiliser pour stocker son code d\'exÃ©cution, ses
variables, sa pile, ses allocations etc. Cette mÃ©moire commence Ã
l\'adresse 0x0 (pour 0) et s\'Ã©tend tant qu\'elle en a besoin.
L\'espace mÃ©moire de deux processus ne peuvent pas se confondre.
Imaginons donc un processus P1 qui accÃ¨de Ã une adresse donnÃ©e, disons
0x7fca. Ce dernier n\'accÃ©dera pas Ã l\'adresse physique rÃ©elle
0x7fca, mais Ã un index qui porte ce nom, et qui pointe vers la zone
mÃ©moire fournie par le noyau Ã P1, Ã une sorte de curseur dÃ©terminÃ©
par la valeur 0x7fca. Un second processus P2 qui souhaite accÃ©der Ã la
mÃªme adresse 0x7fca, n\'accÃ©dera donc pas du tout Ã la mÃªme adresse
physique que celle demandÃ©e par P1. Pour le commun des mortels, un
processus ne peut pas accÃ©der Ã l\'espace mÃ©moire d\'un autre
processus, mais il y a pour les initiÃ©s une maniÃ¨re de procÃ©der
qu\'on va traiter un peu plus tard.

De mÃªme que chaque processus a son propre espace dans la mÃ©moire, le
noyau a son espace rÃ©servÃ©. Comme un module est un code qui est
insÃ©rÃ© dynamiquement, puis supprimÃ© du noyau, alors le module partage
l\'espace de code du noyau, et c\'est donc dans cet espace que son code
est insÃ©rÃ©. Par consÃ©quent, si votre module commet une erreur de
segmentation, c\'est tout le noyau qui est responsable de cette erreur.
Et si par erreur vous dÃ©passer de votre espace mÃ©moire, c\'est dans le
noyau que vous Ã©crirez, et les rÃ©percussions peuvent Ãªtre
catastrophiques. Soyez donc trÃ¨s attentifs car une erreur ici peut
causer la mort dÃ©finitive de tout votre systÃ¨me.

Je tiens aussi Ã insister sur le fait que ceci est vrai pour tous les
systÃ¨mes d\'exploitation conÃ§us sur base d\'un noyau monolithique.
Mais il existe aussi ce qu\'on appelle les micro-noyaux, qui sont des
systÃ¨mes d\'exploitation oÃ¹ les modules ont un espace mÃ©moire qui
leur est propre. Le GNU Hurd et le QNX Neutrino sont des exemples de
micro-noyaux.
:::
:::

::: {#outline-container-sec-5-6 .outline-3}
### Les pilotes de pÃ©riphÃ©riques {#sec-5-6}

::: {#text-5-6 .outline-text-3}
Les pilotes de pÃ©riphÃ©riques forment une catÃ©gorie de modules, qui
fournissent des fonctionnalitÃ©s au matÃ©riel telle qu\'un port sÃ©rie.
Sur Unix, chaque pÃ©riphÃ©rique matÃ©riel est reprÃ©sentÃ© par un
fichier, appelÃ© fichier de pÃ©riphÃ©rique dans le rÃ©pertoire /dev. Ce
fichier fournit des moyens pour communiquer avec le matÃ©riel. Le pilote
de pÃ©riphÃ©rique fournit donc au programme utilisateur une
communication avec le matÃ©riel. Ainsi, le pilote de pÃ©riphÃ©rique de
carte son es1370.o doit connecter le fichier de pÃ©riphÃ©rique
/dev/sound Ã la carte son Ensoniq IS1370. L\'intÃ©rÃªt, c\'est qu\'un
programme utilisateur comme mp3blaster pourra utiliser /dev/sound sans
se soucier du modÃ¨le de carte son prÃ©sent sur la machine.

Dans Unix, tout est fichier. Votre pÃ©riphÃ©rique et son pilote seront
tous deux reprÃ©sentÃ©s par leur propre fichier. Par la suite, il peut
m\'arriver d\'employer le terme fichier de pÃ©riphÃ©rique pour parler du
fichier associÃ© Ã un pÃ©riphÃ©rique, et de fichier de pilote, ou juste
pilote, pour parler du fichier associÃ© au pilote de votre
pÃ©riphÃ©rique.
:::

-   []{#sec-5-6-0-1}NumÃ©ros majeurs et numÃ©ros mineurs\
    ::: {#text-5-6-0-1 .outline-text-5}
    Jetons un Å"il Ã certains fichiers associÃ©s aux pÃ©riphÃ©riques.
    Voici les fichiers de pÃ©riphÃ©riques qui reprÃ©sentent les trois
    premiÃ¨res partitions d\'un disque dur SATA :

    ::: {.org-src-container}
    ``` {.src .src-sh}
    # ls -l /dev/sda[1-3]
    brw-rw---- 1 root disk 8, 1 Mar 27 13:09 sda1
    brw-rw---- 1 root disk 8, 2 Mar 27 13:09 sda2
    brw-rw---- 1 root disk 8, 3 Mar 27 13:09 sda3
    ```
    :::

    Observez les colonnes de chiffres sÃ©parÃ©s par une virgule. Le
    premier chiffre est le numÃ©ro majeur du pÃ©riphÃ©rique. Le second
    chiffre est le numÃ©ro mineur. Le numÃ©ro majeur vous prÃ©cise quel
    pilote est utilisÃ© pour accÃ©der au matÃ©riel. Ã€ chaque pilote est
    donc attribuÃ© un numÃ©ro majeur unique, et tous les pÃ©riphÃ©riques
    partageant un numÃ©ro majeur partagent Ã©galement un pilote commun.
    Dans notre exemple, tous les numÃ©ro majeurs sont 8, parce que tous
    ces pÃ©riphÃ©riques sont contrÃ´lÃ©s par le mÃªme pilote.

    Le numÃ©ro mineur quant Ã lui est utilisÃ© par le pilote pour faire
    une distinction entre tous les pÃ©riphÃ©riques qu\'il contrÃ´le.
    Pour revenir sur l\'exemple plus haut, bien que les pÃ©riphÃ©riques
    aient un numÃ©ro majeur en commun, ils ont tous un numÃ©ro mineur
    diffÃ©rent parce que les pilote les voit comme des matÃ©riels
    diffÃ©rents.

    Le monde des fichiers de pÃ©riphÃ©rique se divise en deux
    catÃ©gories : ceux en mode caractÃ¨re, et ceux en mode bloc. La
    diffÃ©rence vient du fait que les fichiers de pÃ©riphÃ©riques en
    mode bloc possÃ¨dent un tampon pour ses requÃªtes, afin qu\'ils
    puissent choisir avec soin dans quel ordre rÃ©pondre Ã ces
    requÃªtes. Cette stratÃ©gie est trÃ¨s importante dans le cas d\'un
    pÃ©riphÃ©rique de stockage, comme un disque dur, oÃ¹ il est plus
    rapide de lire et d\'Ã©crire des espaces mÃ©moire voisins, plutÃ´t
    que de rÃ©aliser les requÃªtes dans n\'importe quel ordre. Une autre
    diffÃ©rence est que les fichiers de pÃ©riphÃ©riques en mode bloc ne
    peuvent recevoir et renvoyer que des donnÃ©es sous la forme de blocs
    (dont la taille varie selon le pÃ©riphÃ©rique) alors que les
    fichiers pÃ©riphÃ©riques en mode caractÃ¨re sont autorisÃ©s Ã lire
    et Ã Ã©crire autant d\'octets qu\'ils le souhaitent. La plupart des
    fichiers de pÃ©riphÃ©riques sont en mode caractÃ¨re, parce qu\'ils
    n\'ont pas besoin d\'un tampon et qu\'ils ne travaillent pas avec
    une taille fixe de donnÃ©e. Vous pouvez savoir quel est le type
    d\'un fichier de pÃ©riphÃ©rique en regardant le premier caractÃ¨re
    affichÃ© sur une ligne par la commande \`ls -l\`. Si elle commence
    par un \'b\', alors la ligne dÃ©crit un fichier de pÃ©riphÃ©rique en
    mode bloc. Si elle commence par un \'c\', alors il s\'agit du mode
    caractÃ¨re. Les fichiers de pÃ©riphÃ©riques vus prÃ©cÃ©demment sont
    donc en mode bloc. VoilÃ quelques fichiers pÃ©riphÃ©riques de mode
    caractÃ¨re (les ports sÃ©ries) :

    ::: {.org-src-container}
    ``` {.src .src-sh}
    crw-rw----  1 root  dial 4, 64 Feb 18 23:34 /dev/ttyS0
    crw-r-----  1 root  dial 4, 65 Nov 17 10:26 /dev/ttyS1
    crw-rw----  1 root  dial 4, 66 Jul  5  2000 /dev/ttyS2
    crw-rw----  1 root  dial 4, 67 Jul  5  2000 /dev/ttyS3
    ```
    :::

    Si vous souhaitez savoir quels numÃ©ros majeurs ont dÃ©jÃ Ã©tÃ©
    assignÃ©s, alors jetez un Å"il au fichier
    \`/usr/src/linux/Documentation/devices.txt\`.

    Quand le systÃ¨me a Ã©tÃ© installÃ©, tous ces fichiers de
    pÃ©riphÃ©riques ont Ã©tÃ© crÃ©Ã©s par la commande mknod. Pour crÃ©er
    un nouveau fichier pÃ©riphÃ©rique en mode caractÃ¨re appelÃ©
    \'chocolat\' avec les numÃ©ros majeurs et mineurs respectivement 12
    et 2, vous n\'avez qu\'Ã utiliser la commande mknod /dev/chocolat c
    12 2. Vous n\'Ãªtes pas obligÃ© d\'insÃ©rer votre fichier de
    pÃ©riphÃ©rique dans le dossier /dev, mais comme c\'est une
    convention utilisÃ©e par Linux, vous devriez le faire si vous
    souhaitez Ã©viter le bÃ»cher. Bien sÃ»r, quand vous crÃ©ez un
    fichier de pÃ©riphÃ©rique Ã des fins d\'essais ou de dÃ©bogage, vous
    pouvez le crÃ©er dans votre rÃ©pertoire de travail. Assurez-vous
    cependant de le placer au bon endroit quand vous aurez terminÃ©
    votre module.

    Je souhaiterais cependant insister sur le fait qu\'au moment oÃ¹ on
    accÃ¨de Ã un fichier de pÃ©riphÃ©rique, le noyau utilise le numÃ©ro
    majeur du fichier pour dÃ©terminer quel pilote il doit utiliser.
    Cela veut donc dire que le noyau n\'a pas Ã se prÃ©occuper du
    numÃ©ro mineur, mais c\'est le pilote de pÃ©riphÃ©rique qui regarde
    ce dernier afin de savoir quel Ã quel matÃ©riel il doit accÃ©der.

    D\'ailleurs, quand je parle de \"matÃ©riel\", je veux parler d\'une
    chose plus abstraite qu\'une carte PCI que vous pouvez tenir dans
    votre main. Par exemple, regardez ces deux fichiers de
    pÃ©riphÃ©riques :

    ::: {.org-src-container}
    ``` {.src .src-sh}
    #ls -l mmcblk0*
    brw-rw---- 1 root disk 179, 0 Apr  7 23:45 mmcblk0
    brw-rw---- 1 root disk 179, 1 Apr  7 23:45 mmcblk0p1
    ```
    :::

    Maintenant vour savez que ces deux fichiers de pÃ©riphÃ©riques sont
    des pÃ©riphÃ©riques de blocs et qu\'ils sont gÃ©rÃ©s par le mÃªme
    pilote (numÃ©ro majeur 179). Vous savez peut-Ãªtre Ã©galement
    qu\'ils ne reprÃ©sentent tous deux qu\'une seule et mÃªme carte SD
    connectÃ©e Ã votre ordinateur. Pourquoi alors deux fichiers pour une
    seule carte SD ? Une reprÃ©sente la carte SD dans son ensemble, et
    l\'autre une partition de votre carte (mÃªme si cette derniÃ¨re ne
    contient qu\'une partition). Donc mÃªme si techniquement ces deux
    fichiers ne reprÃ©sentent qu\'un seul matÃ©riel physique, le noyau
    voit deux matÃ©riaux diffÃ©rents. Soyez donc avertis que le mot
    \"matÃ©riel\", peut, dans notre cas, Ã©voquer quelque chose
    d\'abstrait.
    :::
:::
:::

::: {#outline-container-sec-6 .outline-2}
Pilote de pÃ©riphÃ©rique en mode caractÃ¨re {#sec-6}
-------------------------------------------

::: {#text-6 .outline-text-2}
:::

::: {#outline-container-sec-6-1 .outline-3}
### La structure \`file\_operations\` {#sec-6-1}

::: {#text-6-1 .outline-text-3}
La structure \`file\_operations\` est dÃ©finie dans le fichier
\`linux/fs.h\`, et contient des pointeurs vers des fonctions dÃ©finies
par le pilote et qui effectue diverses opÃ©rations sur le
pÃ©riphÃ©rique. Chaque champ de cette structure correspond Ã une
requÃªte particuliÃ¨re et permet au pilote d\'appeler la bonne fonction
selon la demande.

Par exemple, chaque pilote en mode caractÃ¨re peut dÃ©finir une fonction
qui lit une information depuis le pÃ©riphÃ©rique. La structure
\`file\_operations\` contient l\'adresse de la fonction de votre module
qui va permettre d\'effectuer cette opÃ©ration. Voici Ã quoi ressemble
une telle dÃ©finition pour le noyau 3.0 :

::: {.org-src-container}
``` {.src .src-c}
struct file_operations {
    struct module *owner;
    loff_t (*llseek) (struct file *, loff_t, int);
    ssize_t (*read) (struct file *, char __user *, size_t, loff_t *);
    ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
    ssize_t (*aio_read) (struct kiocb *, const struct iovec *, unsigned long, loff_t);
    ssize_t (*aio_write) (struct kiocb *, const struct iovec *, unsigned long, loff_t);
    int (*iterate) (struct file *, struct dir_context *);
    unsigned int (*poll) (struct file *, struct poll_table_struct *);
    long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
    long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
    int (*mmap) (struct file *, struct vm_area_struct *);
    int (*open) (struct inode *, struct file *);
    int (*flush) (struct file *, fl_owner_t id);
    int (*release) (struct inode *, struct file *);
    int (*fsync) (struct file *, loff_t, loff_t, int datasync);
    int (*aio_fsync) (struct kiocb *, int datasync);
    int (*fasync) (int, struct file *, int);
    int (*lock) (struct file *, int, struct file_lock *);
    ssize_t (*sendpage) (struct file *, struct page *, int, size_t, loff_t *, int);
    unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
    int (*check_flags)(int);
    int (*flock) (struct file *, int, struct file_lock *);
    ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int);
    ssize_t (*splice_read)(struct file *, loff_t *, struct pipe_inode_info *, size_t, unsigned int);
    int (*setlease)(struct file *, long, struct file_lock **);
    long (*fallocate)(struct file *file, int mode, loff_t offset,
              loff_t len);
    int (*show_fdinfo)(struct seq_file *m, struct file *f);
};
```
:::

Toutes les opÃ©rations ne sont pas implantÃ©es par un pilote. Par
exemple, un pilote qui gÃ¨re une carte graphique n\'a pas besoin de lire
un rÃ©pertoire. Le champ correspondant Ã la lecture de rÃ©pertoire d\'un
pilote de carte graphique devrait Ãªtre assignÃ© Ã la valeur NULL, afin
que le noyau ait conscience que cette opÃ©ration n\'est pas gÃ©rÃ©e par
le pilote en question.

Il existe une extension de gcc qui vous permet d\'assigner cette
structure de maniÃ¨re plus confortable. Voici une autre maniÃ¨re, dÃ©jÃ
un peu plus moderne, de crÃ©er cette structure :

::: {.org-src-container}
``` {.src .src-c}
struct file_operations fops = {
        read: device_read,
        write: device_write,
        open: device_open,
        release: device_release
};
```
:::

Il existe Ã©galement une maniÃ¨re plus gracieuse depuis C99 d\'assigner
des Ã©lÃ©ments Ã une structure, qui doit Ãªtre prÃ©fÃ©rÃ©e aux autre
pour des raisons de lisibilitÃ© et de portabilitÃ©.

::: {.org-src-container}
``` {.src .src-c}
struct file_operations fops = {
        .read = device_read,
        .write = device_write,
        .open = device_open,
        .release = device_release
};
```
:::

Cette mÃ©thode est claire, et vous devez avoir conscience que les
membres de la structure qui ne sont pas explicitement assignÃ©s sont
assignÃ©s Ã NULL par gcc.

L\'instance de la struct **file\_operations** (et qui est donc utilisÃ©e
pour implanter des fonctions de lecture, d\'Ã©criture, d\'ouverture...)
d\'un module est communÃ©ment appelÃ©e fops.
:::
:::

::: {#outline-container-sec-6-2 .outline-3}
### La structure \`file\` {#sec-6-2}

::: {#text-6-2 .outline-text-3}
Chaque pÃ©riphÃ©rique est reprÃ©sentÃ© dans le noyau par une structure
**file**, laquelle est dÃ©finie par **linux/fs.h**. Gardez en tÃªte que
cette structure reste au niveau du noyau, et l\'utilisateur n\'y a
jamais accÃ¨s. Il ne faut pas le confondre avec la structure FILE, qui
est dÃ©finie par la glibc et qui, elle, ne devrait jamais apparaÃ®tre
dans une fonction dans l\'espace noyau. La structure **file** a un nom
traÃ®tre : cette structure ne rÃ©prÃ©sente pas un \"vrai\" fichier sur
le disque (ce dernier est reprÃ©sentÃ© par la structure **inode**).

L\'instance de la struct **file** d\'un module est communÃ©ment appelÃ©
filp. Mais vous la verrez parfois porter le nom de file (struct **file**
file). Je vous dÃ©conseille d\'utiliser un tel nom.

Continuez et regardez dans vos sources la dÃ©finition de la structure
**file**. La plupart des variables que vous voyez, comme la **dentry**,
ne sont pas utilisÃ©es par les pilotes de pÃ©riphÃ©riques, et vous
pouvez les ignorer. C\'est parce que les pilotes ne remplissent pas
directement de structure **file** mais ils ne font qu\'utiliser les
membres d\'une structure **file** crÃ©Ã©e ailleurs.
:::
:::

::: {#outline-container-sec-6-3 .outline-3}
### Enregistrer un pÃ©riphÃ©rique {#sec-6-3}

::: {#text-6-3 .outline-text-3}
Comme nous l\'avons dit plus tÃ´t, on peut accÃ©der Ã un pÃ©riphÃ©rique
Ã travers des fichiers le reprÃ©sentant, appelÃ©s fichiers de
pÃ©riphÃ©riques, localisÃ©s par convention dans le rÃ©pertoire **/dev**.
Le numÃ©ro majeur vous renvoie Ã quel pilote gÃ¨re le fichier de
pÃ©riphÃ©rique. Le numÃ©ro mineur n\'est utilisÃ© que par le pilote pour
diffÃ©rencier les diffÃ©rents pÃ©riphÃ©riques sur lesquels il opÃ¨re.

Ajouter un pilote Ã votre systÃ¨me veut dire l\'enregistrer dans votre
noyau. Ce qui revient Ã y assigner un numÃ©ro majeur au moment de
l\'initialisation du module. C\'est ce que vous faites en utilisant la
fonction **register\_chrdev**, dÃ©finie dans **linux/fs.h** :

::: {.org-src-container}
``` {.src .src-c}
int register_chrdev(unsigned int major, const char *name, struct file_operations *fops);
```
:::

Ici, **unsigned int major** est le numÃ©ro majeur que vous souhaitez
avoir, **const char \\** name\* est le nom de votre pÃ©riphÃ©rique tel
qu\'il apparaÃ®tra dans le rÃ©pertoire **/proc/devices** et **struct
file\_operations \\\*fops** est un pointeur vers la structure
**file\_operations** de votre pilote. Un retour nÃ©gatif de cette
fonction signifie que l\'enregistrement a Ã©chouÃ©. Notez que nous
n\'avons pas fourni le numÃ©ro mineur Ã cette fonction, pour la simple
et bonne raison que le noyau ne se prÃ©occupe pas du numÃ©ro mineur.
Encore une fois, il n\'y a que notre pilote qui gÃ¨re le numÃ©ro mineur.

La vraie question maintenant est : comment demander un numÃ©ro majeur
qui n\'est pas dÃ©jÃ utilisÃ© ? Une maniÃ¨re serait de regarder la liste
de nos pÃ©riphÃ©riques et d\'en choisir un non utilisÃ©. C\'est une
mauvaise solution parce que vous ne savez pas si le numÃ©ro que vous
avez choisi ne sera pas utilisÃ© plus tard. La meilleure chose Ã faire
pour rÃ©gler ce problÃ¨me est de demander au noyau de vous assigner un
numÃ©ro majeur dynamiquement.

Si vous passez le numÃ©ro majeur 0 Ã la fonction \`register\_chrdev\`,
alors la valeur renvoyÃ©e sera le numÃ©ro majeur qui vous est allouÃ©.
L\'inconvÃ©nient de cette solution est que vous ne pouvez pas crÃ©er un
fichier de pÃ©riphÃ©rique en avance, puisque vous ne savez pas alors
quel numÃ©ro majeur vous allez utiliser. Il existe cependant des
maniÃ¨res de contourner ce problÃ¨me. Par exemple, le pilote lui-mÃªme
peut afficher la valeur assignÃ©e, et nous pouvons crÃ©er le fichier Ã
la main. Une autre maniÃ¨re de procÃ©der est la suivante : le
pÃ©riphÃ©rique fraÃ®chement enregistrÃ© aura une ligne dÃ©diÃ©e dans le
fichier **/proc/devices**, et on peut soit crÃ©er un fichier Ã la main,
soit crÃ©er un script shell pour lire ce fichier et ensuite crÃ©er le
fichier de pÃ©riphÃ©rique correspondant. Une autre mÃ©thode est que
notre fichier de pÃ©riphÃ©rique soit crÃ©Ã© par notre pilote en
utilisant la fonction **device\_create** aprÃ¨s une insertion rÃ©ussie,
et qu\'elle appelle la fonction **device\_destroy** durant l\'appel de
la fonction de sortie de votre module.
:::
:::

::: {#outline-container-sec-6-4 .outline-3}
### Supprimer un pÃ©riphÃ©rique {#sec-6-4}

::: {#text-6-4 .outline-text-3}
On ne peut pas permettre qu\'un module noyau soit enlevÃ© du noyau quand
le superviseur le souhaite. Si jamais le fichier de pÃ©riphÃ©rique est
ouvert par un processus et qu\'Ã ce moment on supprime le module du
noyau, alors utiliser ce fichier conduirait Ã faire un appel d\'une
fonction (par exemple pour une fonction de lecture/Ã©criture) Ã une
adresse mÃ©moire qui Ã©tait pointÃ©e par le fichier de pÃ©riphÃ©rique
avant que ce dernier ne soit supprimÃ© du noyau. Dans le meilleur des
cas, vous aurez droit Ã un message d\'erreur. Dans le pire cas, un autre
module a Ã©tÃ© chargÃ© et vous accÃ©dez Ã une autre fonction du noyau et
les rÃ©sultats peuvent Ãªtre catastrophiques. Dans tous les cas, vous
voulez Ã©viter que cette situation arrive.

En temps normal, quand vous refusez d\'autoriser quelque chose, vous
renvoyer un code d\'erreur (un chiffre nÃ©gatif). Mais c\'est impossible
avec la fonction **cleanup\_module** car celle-ci ne renvoie rien.
Cependant, il existe un compteur qui garde une trace de tous les
processus qui utilisent votre module. Vous pouvez voir sa valeur en
regardant le troisiÃ¨me champ du fichier **/proc/modules**. Si cette
valeur n\'est pas nulle, alors la commande **rmmod** va Ã©chouer. Vous
n\'avez pas cependant Ã vous en prÃ©occuper dans la fonction
**cleanup\_module** car cette vÃ©rification est faite pour vous par
l\'appel systÃ¨me **sys\_delete\_module** (dÃ©fini dans
**linux/module.c**). Vous ne devriez par accÃ©der directement Ã ce
compteur, mais des fonctions dÃ©finies dans le fichier
**linux/module.h** vous permettent de dÃ©crÃ©menter, d\'incrÃ©menter ou
d\'obtenir la valeur de ce compteur :

::: {.org-src-container}
``` {.src .src-bash}
* try_module_get(THIS_MODULE): IncrÃ©mente le compteur d'utilisation.
* module_put(THIS_MODULE): DecrÃ©mente le compteur d'utilisation.
```
:::

Il est essentiel de garder ce compteur Ã jour. Si vous perdez sa valeur
correcte, vous ne serez jamais Ã mÃªme de dÃ©charger le module, et il ne
vous restera plus qu\'Ã redÃ©marrer votre machine. Et je peux vous
garantir que Ã§a vous arrivera tÃ´t ou tard durant votre dÃ©veloppement.
:::
:::

::: {#outline-container-sec-6-5 .outline-3}
### chardev.c {#sec-6-5}

::: {#text-6-5 .outline-text-3}
Le prochain code crÃ©e un pilote en mode caractÃ¨re appelÃ© **chardev**.
Vous pouvez lire son fichier de pÃ©riphÃ©rique via la commande suivante
:

::: {.org-src-container}
``` {.src .src-bash}
cat /proc/devices
```
:::

Et le pilote vous renverra le nombre de fois que le fichier de
pÃ©riphÃ©rique a Ã©tÃ© lu. Notre module ne gÃ¨re pas l\'Ã©criture vers
notre fichier (tel que **echo \"hi\" \> /dev/hello**), mais il prend en
compte ces essais et informe l\'utilisateur que cette opÃ©ration n\'est
pas gÃ©rÃ©e. Ne vous inquiÃ©tez pas si vous ne savez pas comment gÃ©rer
le tampon lors d\'une Ã©criture sur notre fichier, ce n\'est pas notre
problÃ¨me. On ne fait ici que lire une donnÃ©e et afficher un accusÃ© de
rÃ©ception.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  chardev.c: CrÃ©e un pÃ©riphÃ©rique de type caractÃ¨re en mode lecture-seule
 *  qui contient le nombre de lecture du fichier dev
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/irq.h>
#include <asm/uaccess.h>
#include <asm/irq.h>
#include <asm/io.h>
#include <linux/poll.h>
#include <linux/cdev.h>

/*
 *  Prototypes - Dans le meilleur des mondes, contenu dans un fichier .h
 */
int init_module(void);
void cleanup_module(void);
static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);

#define SUCCESS 0
#define DEVICE_NAME "chardev"   /* Nom du pÃ©riphÃ©rique tel qu'il apparait
                                 * dans in /proc/devices */
#define BUF_LEN 80              /* Taille maximum du message lu depuis le
                                 * pÃ©riphÃ©rique. */

/*
 * Les variables globales sont dÃ©clarÃ©es statiques, et sont donc globales aux
 * yeux du code contenu dans le fichier.
 */

static int Major;               /* NumÃ©ro majeur attribuÃ© Ã  notre pilote */
static int Device_Open = 0;     /* Le fichier est-il dÃ©jÃ  ouvert ?       *
                                 * Variable utilisÃ©e pour Ã©viter les     *
                                 * accÃ¨s concurrents au pÃ©riphÃ©riques    */
static char msg[BUF_LEN];       /* La rÃ©ponse du pÃ©riphÃ©rique en cas de  *
                                 * lecture                               */
static char *msg_Ptr;

static struct class *cls;

static struct file_operations chardev_fops = {
    .read = device_read,
    .write = device_write,
    .open = device_open,
    .release = device_release
};

/*
 * Cette fonction est appelÃ©e au chargement du module
 */
int init_module(void)
{
    Major = register_chrdev(0, DEVICE_NAME, &chardev_fops);

    if (Major < 0) {
        pr_alert("Registering char device failed with %d\n", Major);
        return Major;
    }

    pr_info("I was assigned major number %d.\n", Major);

    cls = class_create(THIS_MODULE, DEVICE_NAME);
    device_create(cls, NULL, MKDEV(Major, 0), NULL, DEVICE_NAME);

    pr_info("Device created on /dev/%s\n", DEVICE_NAME);

    return SUCCESS;
}

/*
 * Cette fonction est appelÃ©e au dÃ©chargement du module
 */
void cleanup_module(void)
{
    device_destroy(cls, MKDEV(Major, 0));
    class_destroy(cls);

    /*
     * Supprime le pÃ©riphÃ©rique
     */
    unregister_chrdev(Major, DEVICE_NAME);
}

/*
 * Fonctions :
 */

/*
 * AppelÃ©e quand un processus essaie d'ouvrir le fichier du pÃ©rophÃ©rique
 * par exemple "cat /dev/mycharfile"
 */
static int device_open(struct inode *inode, struct file *file)
{
    static int counter = 0;

    if (Device_Open)
        return -EBUSY;

    Device_Open++;
    sprintf(msg, "I already told you %d times Hello world!\n", counter++);
    msg_Ptr = msg;
    try_module_get(THIS_MODULE);

    return SUCCESS;
}

/*
 * AppelÃ©e quand un processus ferme le fichier associÃ© au pÃ©riphÃ©rique
 */
static int device_release(struct inode *inode, struct file *file)
{
    Device_Open--; /* Nous sommes maintenant prÃªt pour l'appel suivant */

    /*
     * DÃ©crÃ©mente le compteur d'utilisation du fichier,
     * sans quoi une fois que vous aurez ouvert votre
     * fichier, vous ne pourrez plus jamais dÃ©charger
     * votre module
     */
    module_put(THIS_MODULE);

    return SUCCESS;
}

/*
 * AppelÃ©e quand un processus, qui a dÃ©jÃ  ouvert le fichier, essaie de lire
 * son contenu.
 */
static ssize_t device_read(struct file *filp,   /* Voir include/linux/fs.h  */
                           char *buffer,        /* Tampon Ã  remplir         */
                           size_t length,       /* Taille du tampon         */
                           loff_t * offset)
{
    /*
     * Nombres d'octets Ã©crits dans le tampon
     */
    int bytes_read = 0;

    /*
     * Si la tÃªte de lecture atteint la fin du message,
     * Renvoyer la valeur 0 signifie la "fin du fichier"
     */
    if (*msg_Ptr == 0)
        return 0;

    /*
     * Insertion des donnÃ©es dans le tampon
     */
    while (length && *msg_Ptr) {

        /*
         * Le tampon est dans l'espace mÃ©moire de l'utilisateur, mais pas
         * dans l'espace noyau. C'est pourquoi l'assignement via pointeur '*'
         * ne fonctionnera pas. Nous devons donc utiliser la fonction put_user
         * qui copie des donnÃ©es depuis l'espace noyau vers l'espace
         * utilisateur.
         */
        put_user(*(msg_Ptr++), buffer++);

        length--;
        bytes_read++;
    }

    /*
     * La plupart des fonctions de lecture renvoient le nombre d'octets
     * Ã©crits dans le tampon
     */
    return bytes_read;
}

/*
 * AppelÃ©e quand un processus Ã©crit dans le fichier associÃ© au pÃ©riphÃ©rique
 * par exemple: echo "hi" > /dev/hello
 */
static ssize_t device_write(struct file *filp,
                            const char *buff,
                            size_t len,
                            loff_t * off)
{
    pr_alert("Sorry, this operation isn't supported.\n");
    return -EINVAL;
}
```
:::
:::
:::

::: {#outline-container-sec-6-6 .outline-3}
### Ecrire des modules pour plusieurs versions du noyau. {#sec-6-6}

::: {#text-6-6 .outline-text-3}
Les appels systÃ¨me, qui font l\'interface primaire entre le noyau et
les processus, restent gÃ©nÃ©ralement similaires selon les versions de
Linux. Un nouvel appel systÃ¨me peut Ãªtre rajoutÃ©, mais, sauf
exception rarissime, les appels systÃ¨me dÃ©jÃ implantÃ©s ne seront pas
modifiÃ©s. Cette stratÃ©gie est nÃ©cessaire pour la compatibilitÃ©; une
nouvelle version Linux doit faire fonctionner des processus crÃ©Ã©s pour
une version plus vieille. Dans la plupart des cas, les fichiers de
pÃ©riphÃ©rique resteront les mÃªmes. Cependant, les interfaces internes
au noyau peuvent changer entre chaque version.

Les versions du noyau sont dÃ©finies par trois numÃ©ros x.y.z. Le
numÃ©ro x reprÃ©sente le numÃ©ro majeur, le numÃ©ro y reprÃ©sente le
numÃ©ro mineur et le numÃ©ro z reprÃ©sente la correction. Le numÃ©ro x
n\'est qu\'un symbole et deux versions diffÃ©rentes n\'impliquent pas
nÃ©cessairement un changement profond du noyau. Ainsi, le changement du
noyau de la version 2.6 en 3.0 n\'a rien apportÃ© de rÃ©volutionnaire au
noyau, alors que le changement de version 2.4 en 2.6 a, lui, apportÃ©
beaucoup de changement, sans que le numÃ©ro majeur ne change.

Les versions mineures du noyau Linux sont divisÃ©es entre les versions
stables (y est un numÃ©ro pair) et les versions de dÃ©veloppements (y
est un numÃ©ro impair). Ces derniÃ¨res contiennent toutes les idÃ©es
originales, y compris celles qui seront par la suite reconsidÃ©rÃ©es
comme des erreurs, ou qui seront modifiÃ©es. Par consÃ©quent, si vous
travaillez avec ces versions instables, sachez que les interfaces sur
lesquelles vous travaillez risquent de changer, c\'est pourquoi vous ne
pouvez donc pas trop compter sur elles. C\'est la raison pour laquelle
je ne traiterai pas ces versions instables dans ce livre : elles
impliquent trop de changement qui ne seront qu\'Ã©phÃ©mÃ¨res et Ã§a
conduirait Ã trop de travail pour mettre Ã jour ce livre. Les versions
stables cependant reposent sur une interface immuable, quel que soit le
numÃ©ro de correction (le numÃ©ro z).

DiffÃ©rentes versions du noyau impliquent de multiples disparitÃ©s, et
si vous souhaitez crÃ©er du code qui soit compatible avec de nombreuses
versions du noyau, vous devrez alors utiliser des consignes
conditionnelles de compilation. La maniÃ¨re de procÃ©der et de comparer
deux macros : LINUX\_VERSION\_CODE et KERNEL\_VERSION. Pour une version
du noyau x.y.z, la valeur de cette macro sera
(x\\\*(2\^16))+(y\\\*(2\^8))+z.

Les versions prÃ©cÃ©dentes de ce guide vous montraient prÃ©cisÃ©ment
comment Ã©crire du code compatible avec des versions antÃ©rieures, mais
nous avons dÃ©cidÃ© de briser cette tradition. Les lecteurs dÃ©sireux
d\'un tel savoir devraient donc lire une version de ce guide qui
corresponde Ã leur noyau. On a donc dÃ©cidÃ© d\'une gestion de version
pour ce guide identique au noyau (en ce qui concerne les numÃ©ros
majeurs et mineurs). En ce qui concerne les correctifs, nous utilisons
nos propres correctifs indÃ©pendamment du noyau. Si vous cherchez un
guide pour le noyau 2.6.39, vous devrez donc chercher le guide dans sa
version 2.6.z (le numÃ©ro de correction importe peu). Assurez-vous juste
d\'avoir le correctif le plus Ã jour du guide, et du noyau.

Vous aurez peut-Ãªtre remarquÃ© que certaines versions du noyau
comportent quatre numÃ©ros de versions. Dans ce cas, les trois
premiÃ¨res versions ont le mÃªme sens qu\'avant, mais la quatriÃ¨me
indique des mises Ã jours de sÃ©curitÃ©, en attendant qu\'un correctif
stable sorte.
:::
:::
:::

::: {#outline-container-sec-7 .outline-2}
Le systÃ¨me de fichier /proc {#sec-7}
----------------------------

::: {#text-7 .outline-text-2}
Dans Linux, il y existe des mÃ©canismes pour que le noyau et ses modules
envoient des informations aux processus : le systÃ¨me de fichier /proc.
Ã€ l\'origine crÃ©Ã© pour permettre un accÃ¨s aisÃ© aux informations des
processus (d\'oÃ¹ le nom), ce mÃ©canisme est dÃ©sormais utilisÃ© de
toute part dans le noyau quand ce dernier doit signaler quelque chose,
tel que **proc/modules**, qui fournit la liste des modules, ou
**proc/meminfo** qui affiche des statistiques d\'utilisation de la
mÃ©moire.

La maniÃ¨re d\'utiliser le systÃ¨me de fichier proc est similaire Ã la
mÃ©thode utilisÃ©e avec les pilotes de pÃ©riphÃ©riques : une structure
est crÃ©Ã©e, laquelle contient toutes les informations requises par le
fichier **/proc**, y compris des pointeurs vers les fonctions qui vont
gÃ©rer notre fichier (dans notre cas, il n\'existe qu\'un pointeur :
celui qui est appelÃ© quand un programme essaie de lire le fichier
**/proc**). Ensuite, init\_module enregistre la structure au sein du
noyau et cleanup\_module la supprime.

Un systÃ¨me de fichier standard dÃ©crira des documents qui seront
localisÃ©s sur le disque plutÃ´t qu\'en mÃ©moire (contrairement au
systÃ¨me de fichier **/proc**). Dans le cas d\'un fichier sur le disque,
l\'index du noeud (inode) contiendra un pointeur vers la position, au
sein du disque, oÃ¹ le fichier dÃ©crit par l\'inode est localisÃ©.
L\'inode possÃ¨de Ã©galement certaines informations relatives au
fichier, tel que les permissions du fichier.

Parce qu\'aucun code ne sera appelÃ© quand le fichier sera ouvert, ou
fermÃ©, on ne peut mettre en place les fonctions try\_module\_get et
try\_module\_put dans notre module. C\'est pourquoi il n\'existe aucun
moyen d\'Ã©viter les consÃ©quences, si un fichier est ouverte, puis que
le module est enlevÃ© du noyau.

VoilÃ un exemple Ã©lÃ©mentaire qui vous montre comment utiliser un
fichier **/proc**. C\'est le \"HelloWorld\" du systÃ¨me de fichier
**/proc**. Cette mÃ©thode contient trois parties. La premiÃ¨re, c\'est
de crÃ©er le fichier **/proc/helloworld** dans la fonction init\_module.
La seconde, c\'est de renvoyer une valeur (et un tampon) quand le
fichier **/proc/helloworld** est lu, via la fonction de rappel
**procfile\_read**. La troisiÃ¨me, c\'est de supprimer le fichier
**/proc/helloworld** dans la fonction cleanup\_module.

Le fichier **/proc/helloworld** sera crÃ©Ã© via la fonction
**proc\_create** quand le module sera chargÃ©. La valeur renvoyÃ©e est
une **struct proc\_dir\_entry**, et elle sera utilisÃ©e pour configurer
le fichier **/proc/helloworld** (par exemple, pour y inscrire le
propriÃ©taire du fichier). Une valeur nulle renvoyÃ©e signifie que la
crÃ©ation a Ã©chouÃ©.

Ã€ chaque fois que le fichier **/proc/helloworld** sera lu, alors la
fonction **procfile\_read** sera appelÃ©e. Deux paramÃ¨tres de cette
function sont trÃ¨s importants : le tampon (le premier paramÃ¨tre) et le
curseur (le troisiÃ¨me paramÃ¨tre). Ainsi, sera modifiÃ© le contenu du
tampon passÃ© par le processus lecteur du fichier (par exemple, une
commande cat) en fonction du curseur, qui dÃ©signe la position actuelle
de la tÃªte de lecture au sein du fichier. Attention cependant, si la
fonction ne renvoie pas une valeur nulle, alors cette fonction sera
rappelÃ©e. Ainsi, si cette fonction ne renvoie jamais 0, alors cette
fonction sera appelÃ©e en boucle infiniment.

::: {.org-src-container}
``` {.src .src-txt}
# cat /proc/helloworld
HelloWorld!
```
:::

::: {.org-src-container}
``` {.src .src-C}
/*
 procfs1.c
*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include <linux/uaccess.h>

#define procfs_name "helloworld"

struct proc_dir_entry *Our_Proc_File; /* Notre Fichier Proc */


ssize_t procfile_read(struct file *filePointer,char *buffer,
                      size_t buffer_length, loff_t * offset)
{
    int ret=0;
    if(strlen(buffer) ==0) {
        pr_info("procfile read %s\n",filePointer->f_path.dentry->d_name.name);
        ret=copy_to_user(buffer,"HelloWorld!\n",sizeof("HelloWorld!\n"));
        ret=sizeof("HelloWorld!\n");
    }
    return ret;

}

static const struct file_operations proc_file_fops = {
    .owner = THIS_MODULE,
    .read  = procfile_read,
};

int init_module()
{
    Our_Proc_File = proc_create(procfs_name,0644,NULL,&proc_file_fops);
    if(NULL==Our_Proc_File) {
        proc_remove(Our_Proc_File);
        pr_alert("Error:Could not initialize /proc/%s\n",procfs_name);
        return -ENOMEM;
    }

    pr_info("/proc/%s created\n", procfs_name);
    return 0;
}

void cleanup_module()
{
    proc_remove(Our_Proc_File);
    pr_info("/proc/%s removed\n", procfs_name);
}
```
:::
:::

::: {#outline-container-sec-7-1 .outline-3}
### Lire et Ã©crire un fichier /proc {#sec-7-1}

::: {#text-7-1 .outline-text-3}
Nous avons vu un exemple rudimentaire d\'un fichier /proc,
**/proc/helloworld**, qu\'on ne pouvait que lire. Mais il est Ã©galement
possible d\'Ã©crire au sein d\'un fichier /proc file. De la mÃªme
maniÃ¨re qu\'une lecture, une fonction est appelÃ©e quand une Ã©criture
est demandÃ©e sur le fichier /proc. Mais il existe une lÃ©gÃ¨re
diffÃ©rence avec la fonction de lecture, oÃ¹ les donnÃ©es viennent de
l\'espace utilisateur, et vous devez donc importer ces donnÃ©es depuis
l\'espace utilisateur vers l\'espace noyau (grÃ¢ce aux fonctions
copy\_from\_user ou get\_user).

La raison pour laquelle l\'usage de la fonction copy\_from\_user ou
get\_user est nÃ©cessaire vient du fait qu\'au sein de Linux, la
mÃ©moire est segmentÃ©e (en tout cas pour les architectures Intel, mais
ceci peut Ãªtre diffÃ©rent sur d\'autres processeurs). Ce qui signifie
qu\'un pointeur, ne rÃ©fÃ©rence pas une location dans la mÃ©moire, mais
une location dans un segment de la mÃ©moire, et vous devez savoir Ã quel
segment il appartient. Il existe un segment mÃ©moire pour le noyau, et
un segment mÃ©moire pour chaque processus.

Un processus n\'a accÃ¨s qu\'Ã son propre segment mÃ©moire, afin qu\'Ã
l\'Ã©criture d\'un simple programme Ã lancer en tant que processus, le
dÃ©veloppeur n\'ait pas Ã se prÃ©occuper des segments mÃ©moires. Quand
vous Ã©crivez un noyau module, vous cherchez la plupart du temps Ã
accÃ©der au segment mÃ©moire du noyau, lequel est gÃ©rÃ© par le
systÃ¨me. Cependant, quand le contenu d\'un tampon mÃ©moire doit Ãªtre
passÃ© d\'un segment mÃ©moire Ã un autre, en l\'occurrence du processus
en train de tourner vers le noyau, alors la fonction du noyau reÃ§oit un
pointeur vers un espace du segment mÃ©moire du processus qui le demande.
Les macros put\_user et get\_user permettent au noyau d\'accÃ©der Ã ce
segment mÃ©moire. Ces fonctions ne gÃ¨rent qu\'un seul caractÃ¨re. Vous
pouvez maniez plusieurs caractÃ¨res avec les fonctions copy\_to\_user et
copy\_from\_user. Comme le tampon (dans une fonction de lecture ou
d\'Ã©criture) est situÃ© dans le segment mÃ©moire du noyau, vous n\'avez
pas besoin de gÃ©rer ces diffÃ©rents espaces dans le cas d\'une lecture,
car les donnÃ©es sont dÃ©jÃ dans l\'espace noyau. Cependant, dans le cas
d\'une Ã©criture, vous aurez besoin d\'importer ces donnÃ©es car elles
viennent de l\'espace utilisateur.

::: {.org-src-container}
``` {.src .src-C}
/**
 *  procfs2.c -  CrÃ©Ã© un "fichier"
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>  /* NÃ©cessaire parce qu'on utilise le proc fs  */
#include <linux/uaccess.h>  /* NÃ©cessaire pour la fonction copy_from_user */

#define PROCFS_MAX_SIZE         1024
#define PROCFS_NAME             "buffer1k"

/**
 * Cette structure contient les informatiosn relative au fichier /proc
 */
static struct proc_dir_entry *Our_Proc_File; /* Notre Fichier Proc */

/**
 * Le tampon qui contiendra les caractÃ¨res pour ce module
 */
static char procfs_buffer[PROCFS_MAX_SIZE];

/**
 * La taille du tampon
 */
static unsigned long procfs_buffer_size = 0;

/**
 * Cette fonction est appelÃ©e quand le fichier /proc est lu
 */
ssize_t procfile_read(struct file *filePointer,char *buffer,
                      size_t buffer_length, loff_t * offset)
{
    int ret=0;
    if(strlen(buffer) ==0) {
        pr_info("procfile read %s\n",filePointer->f_path.dentry->d_name.name);
        ret=copy_to_user(buffer,"HelloWorld!\n",sizeof("HelloWorld!\n"));
        ret=sizeof("HelloWorld!\n");
    }
    return ret;
}


/**
 * Cette fonction est appelÃ©e quand on Ã©crit dans le fichier /proc
 */
static ssize_t procfile_write(struct file *file, const char *buff,
                              size_t len, loff_t *off)
{
    procfs_buffer_size = len;
    if (procfs_buffer_size > PROCFS_MAX_SIZE)
        procfs_buffer_size = PROCFS_MAX_SIZE;

    if (copy_from_user(procfs_buffer, buff, procfs_buffer_size))
        return -EFAULT;

    procfs_buffer[procfs_buffer_size] = '\0';
    return procfs_buffer_size;
}

static const struct file_operations proc_file_fops = {
    .owner = THIS_MODULE,
    .read  = procfile_read,
    .write  = procfile_write,
};

/**
 * Cette fonction est appelÃ©e quand le module est chargÃ©
 */
int init_module()
{
    Our_Proc_File = proc_create(PROCFS_NAME,0644,NULL,&proc_file_fops);
    if(NULL==Our_Proc_File) {
        proc_remove(Our_Proc_File);
        pr_alert("Error:Could not initialize /proc/%s\n",PROCFS_NAME);
        return -ENOMEM;
    }

    pr_info("/proc/%s created\n", PROCFS_NAME);
    return 0;
}

/**
 * Cette fonction est appelÃ©e quand le module est dÃ©chargÃ©
 */
void cleanup_module()
{
    proc_remove(Our_Proc_File);
    pr_info("/proc/%s enleve\n", PROCFS_NAME);
}
```
:::
:::
:::

::: {#outline-container-sec-7-2 .outline-3}
### GÃ©rer un fichier /proc avec un systÃ¨me de fichier standard {#sec-7-2}

::: {#text-7-2 .outline-text-3}
Nous avons vu comment lire et Ã©crire dans un fichier /proc, avec
l\'interface du systÃ¨me de fichier proc. Mais il est Ã©galement
possible de gÃ©rer un fichier /proc avec des inodes. Pour cela, il faut
utiliser des fonctions avancÃ©es, telles que les permissions.

Dans Linux, il existe un mÃ©canisme standard pour l\'enregistrement des
systÃ¨mes de fichiers. Comme chaque systÃ¨me de fichier doit avoir ses
propres fonctions pour gÃ©rer les inodes et les opÃ©rations sur les
fichiers, il existe une structure particuliÃ¨re qui contient les
pointeurs vers toutes ces fonctions, Ã savoir struct
**inode\_operations**, laquelle inclut un pointeur vers une struct
file\_operations.

La diffÃ©rence entre une opÃ©ration sur une inode et une opÃ©ration sur
un fichier tient au fait qu\'une opÃ©ration sur un fichier intervient
sur le fichier lui-mÃªme, alors qu\'une opÃ©ration sur son inode
n\'interagit avec le rÃ©fÃ©rencement du fichier, tel que la crÃ©ation de
liens vers le fichier.

Dans /proc, quand nous enregistrons un nouveau fichier, nous pouvons
spÃ©cifier quelle structure inode\_operations sera utilisÃ©e pour
interagir avec le fichier. Cette derniÃ¨re contient un pointeur vers une
structure file\_operations, qui elle-mÃªme contient des pointeurs vers
nos fonctions procfs\_read et procfs\_write.

Une autre partie intÃ©ressante est la fonction module\_permission. Cette
derniÃ¨re est appelÃ©e quand un processus essaie d\'accÃ©der Ã notre
fichier /proc. Cette fonction accorde ou refuse la permission
d\'accÃ©der Ã notre fichier. Pour l\'instant, cette dÃ©cision n\'est
basÃ©e que sur l\'opÃ©ration demandÃ©e et le numÃ©ro de l\'utilisateur
(qu\'on peut connaÃ®tre via un pointeur vers une structure qui contient
toutes les informations sur le processus qui tourne actuellement), mais
on pourrait baser cette dÃ©cision sur toutes les conditions que l\'on
souhaite, telles que l\'heure, ce que d\'autres processus font avec ce
fichier, les derniÃ¨res donnÃ©es qu\'on a reÃ§ues, ou bien d\'autres
encore.

Il faut Ã©galement noter que les rÃ´les des fonctions de lecture et
d\'Ã©criture sont inversÃ©s dans le noyau. En effet, une fonction de
lecture doit renvoyer une valeur lue, alors qu\'une fonction
d\'Ã©criture doit recevoir des donnÃ©es Ã Ã©crire. La fonction de
lecture envoie des donnÃ©es, l\'Ã©criture en reÃ§oit. La raison pour
laquelle cette notion est inversÃ©e vient du fait que par convention,
les fonctions de lecture et d\'Ã©criture sont nommÃ©es du point de vue
de l\'utilisateur. Si un processus utilisateur veut lire une information
via le noyau, ce dernier doit renvoyer cette information Ã
l\'utilisateur, et inversement.

::: {.org-src-container}
``` {.src .src-C}
/*
    procfs3.c
*/

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/sched.h>
#include <linux/uaccess.h>

#define PROCFS_MAX_SIZE         2048
#define PROCFS_ENTRY_FILENAME   "buffer2k"

struct proc_dir_entry *Our_Proc_File;
static char procfs_buffer[PROCFS_MAX_SIZE];
static unsigned long procfs_buffer_size = 0;

static ssize_t procfs_read(struct file *filp, char *buffer,
                           size_t length, loff_t *offset)
{
    static int finished = 0;
    if(finished)
    {
        pr_debug("procfs_read: END\n");
        finished = 0;
        return 0;
    }
    finished = 1;
    if(copy_to_user(buffer, procfs_buffer, procfs_buffer_size))
        return -EFAULT;
    pr_debug("procfs_read: read %lu bytes\n", procfs_buffer_size);
    return procfs_buffer_size;
}
static ssize_t procfs_write(struct file *file,  const char *buffer,
                            size_t len, loff_t *off)
{
    if(len>PROCFS_MAX_SIZE)
        procfs_buffer_size = PROCFS_MAX_SIZE;
    else
        procfs_buffer_size = len;
    if(copy_from_user(procfs_buffer, buffer, procfs_buffer_size))
        return -EFAULT;
    pr_debug("procfs_write: write %lu bytes\n", procfs_buffer_size);
    return procfs_buffer_size;
}
int procfs_open(struct inode *inode, struct file *file)
{
    try_module_get(THIS_MODULE);
    return 0;
}
int procfs_close(struct inode *inode, struct file *file)
{
    module_put(THIS_MODULE);
    return 0;
}

static struct file_operations File_Ops_4_Our_Proc_File = {
    .read       = procfs_read,
    .write      = procfs_write,
    .open       = procfs_open,
    .release    = procfs_close,
};

int init_module()
{
    Our_Proc_File = proc_create(PROCFS_ENTRY_FILENAME, 0644, NULL,&File_Ops_4_Our_Proc_File);
    if(Our_Proc_File == NULL)
    {
        remove_proc_entry(PROCFS_ENTRY_FILENAME, NULL);
        pr_debug("Erreur : Impossible d'initialiser /proc/%s\n", PROCFS_ENTRY_FILENAME);
        return -ENOMEM;
    }
    proc_set_size(Our_Proc_File, 80);
    proc_set_user(Our_Proc_File,  GLOBAL_ROOT_UID, GLOBAL_ROOT_GID);

    pr_debug("/proc/%s cree\n", PROCFS_ENTRY_FILENAME);
    return 0;
}
void cleanup_module()
{
    remove_proc_entry(PROCFS_ENTRY_FILENAME, NULL);
    pr_debug("/proc/%s removed\n", PROCFS_ENTRY_FILENAME);
}
```
:::

Si vous souhaitez en apprendre plus sur le systÃ¨me de fichier procfs,
sachez que procfs a Ã©tÃ© rendu obsolÃ¨te et qu\'il est maintenant
conseillÃ© d\'utiliser sysfs (que nous verrons dans un prochain
chapitre). Si malgrÃ© tout vous souhaitez en apprendre plus, il existe
une documentation que je vous recommande pour le systÃ¨me de fichier
procfs au sein de linux/Documentation/DocBook/. Utilisez la commande
make help Ã la racine de vos sources Linux pour apprendre comment
convertir ces informations dans votre format de prÃ©dilection. Par
exemple : make htmldocs. Je vous conseille d\'utiliser ce mÃ©canisme si
vous souhaitez documenter des informations relatives au noyau.
:::
:::

::: {#outline-container-sec-7-3 .outline-3}
### GÃ©rer un fichier /proc avec seq\_file {#sec-7-3}

::: {#text-7-3 .outline-text-3}
Comme vous l\'avez remarquÃ©, crÃ©er un fichier /proc tient plus du
parcours du combattant que de la balade enfantine. C\'est pourquoi une
API appelÃ©e seq\_file a Ã©tÃ© implantÃ©e, afin d\'aider les
programmeurs. Le principe d\'utilisation de cette API repose sur des
sÃ©quences, qui sont composÃ©es de trois fonctions : start(), next(), et
stop(). L\'API seq\_file commencera une sÃ©quence quand le fichier /proc
associÃ© sera lu.

Une sÃ©quence commence avec l\'appel Ã la fonction start(). Si la valeur
renvoyÃ©e est non nulle, alors la fonction next() est appelÃ©e. Cette
fonction est un itÃ©rateur. Son but est de parcourir les donnÃ©es de
notre fichier. Ã€ chaque fois que la fonction next() est appelÃ©e, la
fonction show() l\'est Ã©galement. Cette derniÃ¨re Ã©crit la valeur des
donnÃ©es lues dans le tampon lu par l\'utilisateur. La fonction next()
est appelÃ©e continuellement jusqu\'Ã ce qu\'elle renvoie une valeur
nulle. Quand la fonction next renvoie une valeure nulle, alors la
sÃ©quence se termine par l\'appel Ã la fonction stop().

Attention cependant : Quand une sÃ©quence se termine, une autre est
lancÃ©e. Ce qui signifie quÃ la fin de la fonction stop(), la fonction
start() est rappelÃ©e. Cette boucle se termine quand la fonction start()
renvoie une valeur nulle. Vous pouvez voir un schÃ©ma dÃ©crivant le
comportement dÃ©crit plus haut intitulÃ© \"Comment seq\_file
fonctionne\".

::: {.figure}
![seq\_file.png](img/seq_file.png)
:::

Seq\_file fournit des fonctions basiques pour la structure
file\_operations, telles que seq\_read, seq\_lseek ou d\'autres. Mais
aucune fonction n\'est fournit pour Ã©crire dans notre fichier. Vous
pouvez bien sÃ»r utiliser les mÃªmes mÃ©thodes que dans notre exemple
prÃ©cÃ©dent pour le faire.

::: {.org-src-container}
``` {.src .src-C}
/**
 *  procfs4.c -  Cree un "fichier" dans /proc
 *      Ce programme utilise la bibliothÃ¨que seq_file pour gÃ©rer
 *      le fichier /proc
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/proc_fs.h>      /* NÃ©cessaire pour utiliser le proc fs */
#include <linux/seq_file.h>     /* NÃ©cessaire pour seq_file */

#define PROC_NAME       "iter"

MODULE_AUTHOR("Philippe Reynes");
MODULE_LICENSE("GPL");

/**
 * Cette fonction est appelÃ©e au dÃ©but d'une sÃ©quence, par exemple quand :
 *      - Le fichier /proc est lu (pout la premiÃ¨re fois)
 *      - A la fin de la la fonction stop (fin de sÃ©quence)
 */
static void *my_seq_start(struct seq_file *s, loff_t *pos)
{
    static unsigned long counter = 0;

    /* Est-ce qu'on commande une nouvelle sÃ©quence ? */
    if ( *pos == 0 ) {
        /* Si oui => Renvoie une valeur non nulle pour dÃ©marrer la sÃ©quence */
        return &counter;
    }
    else {
        /*
         * Sinon => Signifie la fin de la sÃ©quence, renvoie NULL pour
         * arrÃªter la lecture
         */
        *pos = 0;
        return NULL;
    }
}

/**
 * Cette fonction est appelÃ©e aprÃ¨s le dÃ©but la sÃ©quence.
 * Elle est appelÃ©e en boucle jusqu'Ã  ce qu'elle renvoie la valeur NULL.
 * Cette valeur signifie la fin de la sÃ©quence.
 */
static void *my_seq_next(struct seq_file *s, void *v, loff_t *pos)
{
    unsigned long *tmp_v = (unsigned long *)v;
    (*tmp_v)++;
    (*pos)++;
    return NULL;
}

/**
 * Cette fonction est appelÃ©e Ã  la fin de la sÃ©quence.
 */
static void my_seq_stop(struct seq_file *s, void *v)
{
    /*
     * Rien Ã  faire, on utilise une variable
     * statique dans la fonction start()
     */
}

/*
 * Cette fonction est appelÃ©e Ã  chaque Ã©tape d'une sÃ©quence.
 */
static int my_seq_show(struct seq_file *s, void *v)
{
    loff_t *spos = (loff_t *) v;

    seq_printf(s, "%Ld\n", *spos);
    return 0;
}

/*
 * Cette structure dÃ©finit les fonctions qui gÃ¨reront la sÃ©quence
 */
static struct seq_operations my_seq_ops = {
        .start = my_seq_start,
        .next  = my_seq_next,
        .stop  = my_seq_stop,
        .show  = my_seq_show
};

/*
 * Cette fonction est appelÃ©e quand le fichier /proc sera ouvert
 */
static int my_open(struct inode *inode, struct file *file)
{
    return seq_open(file, &my_seq_ops);
};

/*
 * Cette structure dÃ©finit les fonctions qui gÃ©reront le fichier /proc
 */
static struct file_operations my_file_ops = {
    .owner   = THIS_MODULE,
    .open    = my_open,
    .read    = seq_read,
    .llseek  = seq_lseek,
    .release = seq_release
};


/*
 * Cette fonction sera appelÃ©e quand le module sera chargÃ©
 */
int init_module(void)
{
    struct proc_dir_entry *entry;

    entry = proc_create(PROC_NAME, 0, NULL, &my_file_ops);
    if(entry == NULL)
    {
        remove_proc_entry(PROC_NAME, NULL);
        pr_debug("Error: Could not initialize /proc/%s\n", PROC_NAME);
        return -ENOMEM;
    }

    return 0;
}

/*
 * Cette fonction sera appelÃ©e quand le module sera dÃ©chargÃ© du noyau
 */
void cleanup_module(void)
{
    remove_proc_entry(PROC_NAME, NULL);
    pr_debug("/proc/%s supprime\n", PROC_NAME);
}
```
:::

Si vous dÃ©sirez plus d\'informations, je vous conseille ce lien :

-   <http://lwn.net/Articles/22355/>
-   <http://www.kernelnewbies.org/documents/seq_file_howto.txt>

Vous pouvez Ã©galement lire le code de fs/seq\_file.c au sein du noyau.
:::
:::
:::

::: {#outline-container-sec-8 .outline-2}
sysfs : Interagissez avec votre module {#sec-8}
--------------------------------------

::: {#text-8 .outline-text-2}
*sysfs* vous permet d\'interagir avec le noyau depuis l\'espace
utilisateur, via la lecture ou l\'Ã©criture de variable au sein de
modules. Ã‡a peut Ãªtre trÃ¨s utile Ã des fins de dÃ©bogage, ou encore
cela peut vous servir d\'interface pour vos applications ou vos scripts.
Vous pouvez trouvez des rÃ©pertoires et des fichiers sysfs au sein du
rÃ©pertoire *sys* de votre systÃ¨me.

::: {.org-src-container}
``` {.src .src-bash}
ls -l /sys
```
:::

L\'Ã©ternel exemple du module hello world incluant la crÃ©ation d\'une
variable accessible via sysfs est fourni plus bas :

::: {.org-src-container}
``` {.src .src-c}
/*
 * hello-sysfs.c sysfs example
 */

#include <linux/module.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/string.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bob Mottram");

static struct kobject *mymodule;

/* La variable que vous souhaitez pouvoir modifier */
static int myvariable = 0;

static ssize_t myvariable_show(struct kobject *kobj,
                               struct kobj_attribute *attr,
                               char *buf)
{
    return sprintf(buf, "%d\n", myvariable);
}

static ssize_t myvariable_store(struct kobject *kobj,
                                struct kobj_attribute *attr,
                                char *buf, size_t count)
{
    sscanf(buf, "%du", &myvariable);
    return count;
}


static struct kobj_attribute myvariable_attribute =
    __ATTR(myvariable, 0660, myvariable_show,
           (void*)myvariable_store);

static int __init mymodule_init (void)
{
    int error = 0;

    pr_info("mymodule: initialised\n");

    mymodule =
        kobject_create_and_add("mymodule", kernel_kobj);
    if (!mymodule)
        return -ENOMEM;

    error = sysfs_create_file(mymodule, &myvariable_attribute.attr);
    if (error) {
        pr_info("failed to create the myvariable file " \
               "in /sys/kernel/mymodule\n");
    }

    return error;
}

static void __exit mymodule_exit (void)
{
    pr_info("mymodule: Exit success\n");
    kobject_put(mymodule);
}

module_init(mymodule_init);
module_exit(mymodule_exit);
```
:::

CrÃ©ez et installez votre module :

::: {.org-src-container}
``` {.src .src-sh}
make
sudo insmod hello-sysfs.ko
```
:::

VÃ©rifiez qu\'il existe :

::: {.org-src-container}
``` {.src .src-sh}
sudo lsmod | grep hello_sysfs
```
:::

Quelle est la valeur de *myvariable* ?

::: {.org-src-container}
``` {.src .src-sh}
cat /sys/kernel/mymodule/myvariable
```
:::

Modifiez la valeur de *myvariable* et vÃ©rifiez qu\'elle a changÃ©e

::: {.org-src-container}
``` {.src .src-sh}
echo "32" > /sys/kernel/mymodule/myvariable
cat /sys/kernel/mymodule/myvariable
```
:::

Finalement, supprimez ce module exemple :

::: {.org-src-container}
``` {.src .src-sh}
sudo rmmod hello_sysfs
```
:::
:::
:::

::: {#outline-container-sec-9 .outline-2}
Interagir avec un fichier de pÃ©riphÃ©rique {#sec-9}
-------------------------------------------

::: {#text-9 .outline-text-2}
Les fichiers de pÃ©riphÃ©riques sont censÃ©s reprÃ©senter des
pÃ©riphÃ©riques physiques. La plupart de ces pÃ©riphÃ©riques physiques
sont utilisÃ©s aussi bien en lecture qu\'en Ã©criture, il existe donc
des mÃ©canismes pour que le pilote du pÃ©riphÃ©rique concernÃ© reÃ§oive
des informations du processus qui souhaite Ã©crire dans le
pÃ©riphÃ©rique. Ce mÃ©canisme est rÃ©alisÃ© en ouvrant le fichier du
pÃ©riphÃ©rique pour une Ã©criture, et en Ã©crivant dedans, tout comme
vous Ã©cririez dans un simple fichier. Dans l\'illustration suivante, un
exemple vous est donnÃ© via la fonction device\_write.

Mais ce n\'est pas suffisant. Imaginez que vous disposez d\'un port
sÃ©rie, lequel est connectÃ© Ã une carte rÃ©seau (mÃªme si vous avez une
carte rÃ©seau intÃ©grÃ©e dans votre carte mÃ¨re, celle-ci est
implantÃ©e, du point de vue du processeur, comme un port sÃ©rie
connectÃ© Ã une carte rÃ©seau, vous n\'aurez donc pas Ã pousser loin
votre imagination). Le comportement qui pourra vous sembler naturel sera
d\'utiliser le fichier de pÃ©riphÃ©rique du port sÃ©rie vers la carte
rÃ©seau pour y Ã©crire (soit des ordres pour commander la carte rÃ©seau,
soit des donnÃ©es Ã transmettre sur la ligne) ou pour y lire des
informations depuis la carte rÃ©seau (soit les rÃ©ponses des commandes,
soit des donnÃ©es reÃ§ues depuis la ligne). Vous avez rÃ©glÃ© le
problÃ¨me, mais la question reste ouverte de savoir comment vous ferez
quand vous souhaiterez interagir avec le port-sÃ©rie lui-mÃªme, par
exemple pour dÃ©finir Ã quelle frÃ©quence il doit recevoir et envoyer
des donnÃ©es.

La rÃ©ponse au sein d\'Unix est d\'utiliser une fonction spÃ©ciale
appelÃ©e **ioctl** (raccourci pour Input Output ConTrol). Chaque
pÃ©riphÃ©rique a ses propres commandes ioctl, qui peuvent Ãªtre soit en
lecture (envoyer des informations du processus vers le noyau), soit en
Ã©criture (renvoyer les informations Au processus), soit les deux, soit
aucune des deux. Vous noterez qu\'ici, les rÃ´les des fonctions de
lecture et d\'Ã©critures sont inversÃ©es une fois de plus. Ainsi avec
les ioctl, la lecture consiste Ã envoyer des informations vers le noyau,
et l\'Ã©criture consiste Ã recevoir des informations du noyau.

Les fonctions ioctl sont appelÃ©es avec trois paramÃ¨tres : le file
descriptor du fichier de pÃ©riphÃ©rique appropriÃ©, le numÃ©ro d\'ioctl,
et un paramÃ¨tre de type long afin que vous puissiez le caster pour
passer l\'adresse de tout ce que vous souhaitez.

Le numÃ©ro de l\'ioctl est une valeur formatÃ©e qui contient le numÃ©ro
majeur de votre pÃ©riphÃ©rique, le type de l\'ioctl, la commande, et le
type de votre paramÃ¨tre. Le numÃ©ro d\'ioctl est habituellement crÃ©Ã©
dans une fichier d\'en-tÃªte via un appel de macro (\\\_IO, \\\_IOR,
\\\_IOW ou \\\_IOWR , en fonction du type). Ce fichier d\'entÃªte devra
ensuite Ã©galement Ãªtre inclus Ã la fois par le programme utilisateur
qui va employer l\'ioctl (afin qu\'il puisse gÃ©nÃ©rer un numÃ©ro
correct), et par le module (afin qu\'il puisse comprendre ce numÃ©ro).
Dans l\'exemple suivant, le fichier d\'en-tÃªte est chardev.h et le
programme utilisateur qui exÃ©cute l\'ioctl est ioctl.c

Si vous souhaitez utiliser les ioctls pour votre propre module, la
meilleure maniÃ¨re est de demander un numÃ©ro officiel, ainsi vous ne
risquez pas de partager votre numÃ©ro avec un autre, dans quel cas le
rÃ©sultat pourrait Ãªtre dÃ©sastreux. Pour plus d\'informations, jetez
un oeil au fichier Documentation/ioctl-number.txt au sein des sources de
votre noyau.

::: {.org-src-container}
``` {.src .src-C}
/*
 * chardev2.c - CrÃ©Ã© un pÃ©riphÃ©rique d'entrÃ©e/sortie en mode caractÃ¨re
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/irq.h>
#include <asm/uaccess.h>
#include <asm/irq.h>
#include <asm/io.h>
#include <linux/poll.h>
#include <linux/cdev.h>

#include "chardev.h"
#define SUCCESS 0
#define DEVICE_NAME "char_dev"
#define BUF_LEN 80

/*
 * Est-ce que le pÃ©riphÃ©rique est
 * actuellement ouvert ?
 * UtilisÃ© pour Ã©viter les accÃ¨s
 * concurrents au mÃªme pÃ©riphÃ©riques
 */
static int Device_Open = 0;

/*
 * Le message que fournira le pÃ©riphÃ©rique quand on lui demandera
 */
static char Message[BUF_LEN];

/*
 * OÃ¹ en est le processus qui lit le message ?
 * Utile si message est plus grand que la taille du tampon Ã  remplir dans
 * la fonction device_read()
 */
static char *Message_Ptr;

static int Major; /* NumÃ©ro Major associÃ© au pilote de notre pÃ©riphÃ©rique */
static struct class *cls;

/*
 * C'est appelÃ© quand un processus demande une ouverture du fichier associÃ©
 * Ã  notre pÃ©riphÃ©rique
 */
static int device_open(struct inode *inode, struct file *file)
{
#ifdef DEBUG
        pr_info("device_open(%p)\n", file);
#endif

    /*
     * On ne souhaite pas traiter deux processus concurentiellement
     */
    if (Device_Open)
        return -EBUSY;

    Device_Open++;
    /*
     * Initialise le message
     */
    Message_Ptr = Message;
    try_module_get(THIS_MODULE);
    return SUCCESS;
}

static int device_release(struct inode *inode, struct file *file)
{
#ifdef DEBUG
    pr_info("device_release(%p,%p)\n", inode, file);
#endif

    /*
     * Nous sommes maintenant prÃªt pour traiter l'appel suivant
     */
    Device_Open--;

    module_put(THIS_MODULE);
    return SUCCESS;
}

/*
 * Cette fonction est appelÃ©e quand un processus qui a dÃ©jÃ  ouvert le fichier
 * associÃ© Ã  notre pÃ©riphÃ©rique demande une lecture de ce dernier
 */
static ssize_t device_read(struct file *file,   /* voir include/linux/fs.h  */
                           char __user * buffer,        /* Tampon qui sera  *
                                                         * remplis          */
                           size_t length,       /* Taille du tampon         */
                           loff_t * offset)
{
    /*
     * Nombre d'octets rÃ©ellement Ã©crits dans le tampon
     */
    int bytes_read = 0;

#ifdef DEBUG
    pr_info("device_read(%p,%p,%d)\n", file, buffer, length);
#endif

    /*
     * Si on atteint la fin du message, renvoie un 0 pour signifier
     * la fin du fichier
     */
    if (*Message_Ptr == 0)
        return 0;

    /*
     * Insertion des donnÃ©es dans le tampon
     */
    while (length && *Message_Ptr) {
    /*
     * Parce que le tampon est dans l'espace utilisateur, et non pas dans
     * l'espace noyau oÃ¹ nous nous trouvons au moment oÃ¹ l'on exÃ©cute ce
     * code, une simple modification de valeur par les variable ne
     * fonctionnerait pas. C'est pourquoi nous devons utiliser la fonction
     * put_user() qui copie des donnÃ©es de l'espace noyau vers l'espace
     * utilisateur
     */
     put_user(*(Message_Ptr++), buffer++);
     length--;
     bytes_read++;
}

#ifdef DEBUG
    pr_info("Read %d bytes, %d left\n", bytes_read, length);
#endif
    /*
     * La plupart des fonctions de lecture renvoie le nombre d'octets
     * qui ont Ã©tÃ© insÃ©rÃ© dans le tampon
     */
    return bytes_read;
}

/*
 * Cette fonction sera appelÃ©e quand quelqu'un commandera une Ã©criture
 * dans le fichier associÃ© Ã  notre pÃ©riphÃ©rique
 */
static ssize_t
device_write(struct file *file,
             const char __user * buffer, size_t length, loff_t * offset)
{
    int i;

#ifdef DEBUG
    pr_info("device_write(%p,%s,%d)", file, buffer, length);
#endif

    for (i = 0; i < length && i < BUF_LEN; i++)
        get_user(Message[i], buffer + i);

    Message_Ptr = Message;

    /*
     * Une fois n'est pas coutume, nous renvoyons
     * le nombre de caractÃ¨res traitÃ©s
     */
    return i;
}

/*
 * Cette fonction sera appelÃ©e quand un processus essaiera de commander
 * un ioctl sur le fichier associÃ© Ã  notre pÃ©riphÃ©rique. Par rapport aux
 * structures inode et file, on a ici deux paramÃ¨tres supplÃ©mentaires :
 * le numÃ©ro de l'ioctl appelÃ© et le paramÃ¨tre passÃ© Ã  la fonction ioctl.
 *
 * Si l'ioctl est en mode Ã©criture, ou lecture/Ã©criture, ce qui implique
 * qu'une valeur sera renvoyÃ©e au processus l'exÃ©cutant, alors l'appel
 * ioctl renverra la mÃªme chose que cette fonction.
 */
long device_ioctl(struct file *file,
                  unsigned int ioctl_num,    /* NumÃ©ro de l'appel ioctl    */
                  unsigned long ioctl_param) /* ParamÃ¨tre de l'appel ioctl */
{
    int i;
    char *temp;
    char ch;

    /*
     * Switch en fonction du numÃ©ro de l'appel ioctl
     */
    switch (ioctl_num) {
    case IOCTL_SET_MSG:
        /*
         * ReÃ§oit via le paramÃ¨tre de l'appel ioctl
         * un pointeur vers un message (dans l'espace utilisateur)
         * et le modifie pour qu'il pointe vers le message de notre
         * pÃ©riphÃ©rique.
         */
        temp = (char *)ioctl_param;

         /*
          * Cherche la taille de notre message
          */
         get_user(ch, temp);
         for (i = 0; ch && i < BUF_LEN; i++, temp++)
             get_user(ch, temp);

         device_write(file, (char *)ioctl_param, i, 0);
         break;

    case IOCTL_GET_MSG:
        /*
         * Renvoie un message au processus qui demande une lecture
         * Notre paramÃ¨tre est un pointeur, il faut donc le remplir
         */
        i = device_read(file, (char *)ioctl_param, 99, 0);

        /*
         * Puis pour faire faire les choses proprement,
         * il faut insÃ©rer un 0 Ã  la fin du tampon
         */
        put_user('\0', (char *)ioctl_param + i);
        break;

    case IOCTL_GET_NTH_BYTE:
        /*
         * Cette ioctl est Ã  la fois en mode entrÃ©e (ioctl_param)
         * et en mode sortie (la valeur renvoyÃ©e par cette fonction)
         */
        return Message[ioctl_param];
        break;
    }

    return SUCCESS;
}

/* DÃ©clarations des module */

/*
 * Cette structure va contenir les fonctions qui seront appelÃ©es au moment
 * oÃ¹ un processus agira sur le pÃ©riphÃ©rique qu'on a crÃ©Ã©. Comme un pointeur
 * vers cette structure est conservÃ© dans la table des pÃ©riphÃ©riques, ce
 * dernier ne peut pas Ãªtre local Ã  init_module.
 *
 * La valeur NULL est assignÃ©e aux fonctions non implantÃ©es.
 */
struct file_operations Fops = {
        .read = device_read,
        .write = device_write,
        .unlocked_ioctl = device_ioctl,
        .open = device_open,
        .release = device_release,     /* Fonction de fermeture */
};

/*
 * Initialiser le module - Enregistrer le pÃ©riphÃ©rique de type caractÃ¨re
 */
int init_module()
{
    int ret_val;
    /*
     * Enregistre le pÃ©riphÃ©rique de type caractÃ¨re
     * (ou du moins essaie de le faire)
     */
    ret_val = register_chrdev(MAJOR_NUM, DEVICE_NAME, &Fops);

    /*
     * Les valeurs nÃ©gatices signifient des erreurs
     */
    if (ret_val < 0) {
        pr_alert("%s failed with %d\n",
                 "Sorry, registering the character device ", ret_val);
        return ret_val;
    }

    Major = ret_val;

    cls = class_create(THIS_MODULE, DEVICE_FILE_NAME);
    device_create(cls, NULL, MKDEV(Major, MAJOR_NUM), NULL, DEVICE_FILE_NAME);

    pr_info("Device created on /dev/%s\n", DEVICE_FILE_NAME);

    return 0;
}

/*
 * Nettoyage - Supprime le fichier appropriÃ© de /proc
 */
void cleanup_module()
{
    device_destroy(cls, MKDEV(Major, 0));
    class_destroy(cls);

    /*
     * Supprime le pÃ©riphÃ©rique
     */
    unregister_chrdev(Major, DEVICE_NAME);
}
```
:::

::: {.org-src-container}
``` {.src .src-C}
/*
 *  chardev.h - Le fichier d'en-tÃªte qui contient toutes les dÃ©finitions
 *  d'ioctl
 *
 *  Les dÃ©clarations ici doivent obligatoirement Ãªtre contenues dans ce type
 *  de fichier, parce qu'elles doivent Ãªtre connues Ã  la fois :
 *  - de notre module (dans le fichier chardev.c)
 *  - et par le processus qui appelle les ioctl (ioctl.c).
 */

#ifndef CHARDEV_H
#define CHARDEV_H

#include <linux/ioctl.h>

/*
 * Le numÃ©ro majeur de pÃ©riphÃ©rique.
 * On ne peut plus utiliser un mÃ©canisme d'attribution dynamique, car les
 * ioctls doivent le connaÃ®tre.
 */
#define MAJOR_NUM 100

/*
 * Assigne le message du pilote de notre pÃ©riphÃ©rique
 * depuis un processus utilisateur
 */
#define IOCTL_SET_MSG _IOW(MAJOR_NUM, 0, char *)
/*
 * _IOW signifie qu'on est en train de crÃ©er un numÃ©ro d'ioctl
 * pour passer des informations depuis un processus utilisateur
 * vers un module noyau.
 *
 * Le premier argument, MAJOR_NUM, est le numÃ©ro majeur du pÃ©riphÃ©rique
 * qu'on utilise.
 *
 * Le deuxiÃ¨me argument est le numÃ©ro de la commande.
 * Au sein d'un pilote, il peut exister diffÃ©rentes commandes ioctl. Ce numÃ©ro
 * sert Ã  les identifier
 *
 * Le troisiÃ¨me argument est le type qu'on attend du processus exÃ©cutant
 * une commande ioctl.
 */

/*
 * Obtiens le message du pilote de notre pÃ©riphÃ©rique
 */
#define IOCTL_GET_MSG _IOR(MAJOR_NUM, 1, char *)
/*
 * Cet IOCTL est utilisÃ© pour diffuser une information, pour informer le
 * processus du contenu de notre pilote. Cependant, on a encore besoin
 * d'un tampon pour y insÃ©rer les donnÃ©es que l'utilisateur souhaite,
 * tampon qui nous est fourni par ce dernier.
 */

/*
 * Obtenir le NÃ¨me caractÃ¨re de notre message
 */
#define IOCTL_GET_NTH_BYTE _IOWR(MAJOR_NUM, 2, int)
/*
 * L'IOCTL est utilisÃ© Ã  la fois en sortie et en entrÃ©e.
 * Il reÃ§oit un numÃ©ro N de l'utilisateur, et renvoie Message[N]
 */

/*
 * Le nom du fichier associÃ© Ã  notre pÃ©riphÃ©rique
 */
#define DEVICE_FILE_NAME "char_dev"

#endif
```
:::

::: {.org-src-container}
``` {.src .src-C}
/*
 *  ioctl.c - Le programme utilisateur qui exÃ©cutera des ioctls pour
 *  intÃ©ragir avec notre module
 *
 *  Jusqu'Ã  maintenant, nous pouvions utiliser des commandes comme cat
 *  pour commander une entrÃ©e ou une sortie sur nos modules, mais
 *  pour exÃ©cuter un appel ioctl, il faut nÃ©cessairement Ã©crire notre
 *  propre programme utilisateur
 */

/*
 * SpÃ©cifique Ã  notre pÃ©riphÃ©rique, ce fichier contient les numÃ©ro des ioctls
 * et le numÃ©ro majeur du fichier associÃ© Ã  notre pÃ©riphÃ©rique.
 */
#include "../chardev.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>     /* open */
#include <unistd.h>    /* exit */
#include <sys/ioctl.h> /* ioctl */

/*
 * Fonction pour les appels ioctls
 */

int ioctl_set_msg(int file_desc, char *message)
{
    int ret_val;

    ret_val = ioctl(file_desc, IOCTL_SET_MSG, message);

    if (ret_val < 0) {
        printf("ioctl_set_msg failed:%d\n", ret_val);
        exit(-1);
    }
    return 0;
}

int ioctl_get_msg(int file_desc)
{
    int ret_val;
    char message[100];

    /*
     * Attention ! Ceci est dangereux parce qu'on ne dit pas au noyau
     * jusqu'oÃ¹ il doit Ã©crire, alors il existe un risque de dÃ©passement
     * du tampon. En condition rÃ©elle de programmation noyau, nous
     * aurions utilisÃ© deux appels ioctls :
     * - un pour informer le noyau de la taille du tampon
     * - un second avec le tampon Ã  remplir
     */
    ret_val = ioctl(file_desc, IOCTL_GET_MSG, message);

    if (ret_val < 0) {
        printf("ioctl_get_msg failed:%d\n", ret_val);
        exit(-1);
    }

    printf("get_msg message:%s\n", message);
    return 0;
}

int ioctl_get_nth_byte(int file_desc)
{
    int i;
    char c;

    printf("get_nth_byte message:");

    i = 0;
    do {
        c = ioctl(file_desc, IOCTL_GET_NTH_BYTE, i++);

        if (c < 0) {
            printf("ioctl_get_nth_byte failed at the %d'th byte:\n",
                   i);
            exit(-1);
        }

        putchar(c);
    } while (c != 0);
    putchar('\n');
    return 0;
}

/*
 * Main - Appel des fonctions d'ioctls
 */
int main()
{
    int file_desc, ret_val;
    char *msg = "Message passed by ioctl\n";

    file_desc = open(DEVICE_FILE_NAME, 0);
    if (file_desc < 0) {
        printf("Can't open device file: %s\n", DEVICE_FILE_NAME);
        exit(-1);
    }

    ioctl_get_nth_byte(file_desc);
    ioctl_get_msg(file_desc);
    ioctl_set_msg(file_desc, msg);

    close(file_desc);
    return 0;
}
```
:::
:::
:::

::: {#outline-container-sec-10 .outline-2}
Les appels systÃ¨me {#sec-10}
-------------------

::: {#text-10 .outline-text-2}
Jusqu\'ici, tout ce qu\'on a fait Ã©tait d\'utiliser des mÃ©canismes
prÃ©dÃ©finis pour enregistrer un fichier **/proc** et des gestionnaires
de pÃ©riphÃ©riques. Ã‡a vous suffira tant que vous vous cantonnez Ã ce
que les dÃ©veloppeurs noyaux ont prÃ©vu pour vous, comme Ã©crire un
pilote de pÃ©riphÃ©rique. Mais qu\'en est-il si vous souhaitez aller
plus loin ? Si vous souhaitez modifier le fonctionnement du systÃ¨me ?

Si vous n\'avez pas encore succombÃ© aux sirÃ¨nes de la machine
virtuelle, alors c\'est ici que le dÃ©veloppement du noyau peut vraiment
devenir dangereux. Pendant que j\'ai Ã©crit l\'exemple plus bas, J\'ai
tuÃ© l\'appel systÃ¨me **open()**. Ce qui signifie que : je ne pouvais
plus ouvrir aucun fichier, je ne pouvais plus lancer aucun programme, et
je ne pouvais plus Ã©teindre le systÃ¨me. J\'ai dÃ» redÃ©marrer
brutalement ma machine virtuelle. Je n\'ai perdu aucun fichier
important, mais si j\'avais fait de mÃªme sur une vraie machine, ce
cauchemar aurait pu devenir rÃ©alitÃ©. Pour vous assurer de ne pas
perdre de fichier, mÃªme au sein d\'un environnement d\'essai, pensez Ã
exÃ©cuter **sync** juste avant d\'appeler **insmod** et **rmmod**.

Oubliez tout Ã propos des fichiers **/proc** et des fichiers de
pÃ©riphÃ©riques. Ce ne sont que des dÃ©tails sans importance Ã
l\'Ã©chelle de votre systÃ¨me. Les vrais mÃ©canismes de communication du
noyau sont les appels systÃ¨me. Ce sont eux qui sont appelÃ©s par tous
les processus. Quand un processus demande un service au noyau (tel
qu\'ouvrir un fichier, crÃ©er un nouveau processus, ou demander plus de
mÃ©moire), c\'est ce mÃ©canisme qui est appelÃ©. Si vous souhaitez
changer le fonctionnement de votre noyau, c\'est par lÃ que vous devrez
passer. Comme j\'en ai parlÃ© plus tÃ´t, si vous souhaitez voir tous les
appels systÃ¨me effectuÃ©s par un programme, utilisez la commande
**strace**.

En gÃ©nÃ©ral, un processus n\'est pas censÃ© pouvoir accÃ©der au noyau.
Il ne peut ni accÃ©der Ã la mÃ©moire du noyau, ni appeler les fonctions
du noyau. Le matÃ©riel, via le CPU, s\'en assure (c\'est la raison pour
laquelle ce mÃ©canisme est appelÃ© \'mode superviseur\', ou \'protection
de pages\').

Les appels systÃ¨me sont une exception Ã cette rÃ¨gle gÃ©nÃ©rale. Ce qui
se passe, c\'est que les processus remplissent des registres avec des
valeurs en guise de paramÃ¨tres, et appellent ensuite une instruction
particuliÃ¨re qui saute Ã une adresse dÃ©finie prÃ©cÃ©demment, au sein
du noyau (bien sÃ»r, cette adresse peut Ãªtre lue par les processus
utilisateurs, mais ces derniers ne peuvent pas y Ã©crire). Au sein des
CPU Intels, on y accÃ¨de via l\'interruption 0x80. Le matÃ©riel sait
qu\'une fois que vous avez sautÃ© Ã cette adresse, votre processeur
n\'est plus en mode utilisateur, mais en mode noyau --- vous Ãªtes donc
libre de faire tout ce que vous souhaitez.

L\'adresse au sein du noyau oÃ¹ un processus peut sauter est appelÃ©
system\_call. L\'algorithme Ã l\'arrivÃ©e de ce code regarde le numÃ©ro
d\'appel systÃ¨me, qui dÃ©finit quelle fonction systÃ¨me est demandÃ©e.
Ensuite, le programme regarde dans la table d\'appels systÃ¨me (appelÃ©e
sys\_call\_table) quelle est l\'adresse de la fonction demandÃ©e. Pour
finir, le processeur saute Ã cette fonction, et avant d\'en revenir,
effectue quelques vÃ©rifications systÃ¨mes avant de redonner la main au
processus utilisateur appelant (ou Ã un autre processus si le premier Ã
Ã©tÃ© trop long). Si vous souhaitez lire ce code, il est disponible dans
le code source (arch/\$\<\$architecture\$\>\$/kernel/enty.S, aprÃ¨s la
ligne ENTRY(system\_call)).

Ainsi, si vous souhaitez, d\'une certaine maniÃ¨re, changer le
fonctionnement d\'un certain appel systÃ¨me, ce que vous devez faire est
de crÃ©er votre propre fonction pour l\'insÃ©rer (gÃ©nÃ©ralement cette
fonction exÃ©cutera votre code avant d\'appeler la fonction systÃ¨me
originale) et ensuite changer le pointeur de la table sys\_call\_table
pour que cette derniÃ¨re pointe vers votre fonction. Attention ! Parce
que vous ne souhaitez pas que votre module soit enlevÃ© en laissant le
systÃ¨me dans un Ã©tat instable, il est important que la fonction
cleanup\_module modifie la table dans son Ã©tat prÃ©cÃ©dent.

Le code source suivant est un exemple d\'un tel module noyau. On
souhaite ici \"espionner\" un certain utilisateur, afin de notifier, via
**pr\_info()**, quand cet utilisateur ouvre un fichier. Pour procÃ©der,
on remplace l\'appel systÃ¨me lancÃ© Ã l\'ouverture d\'un fichier par
notre propre fonction, appelÃ©e ici **our\_sys\_open**. Cette fonction
vÃ©rifie l\'uid (l\'identifiant de l\'utilisateur) du processus courant,
et si cet uid est Ã©gal Ã celui qu\'on surveille, alors la fonction
appelle **pr\_info()** afin d\'afficher le nom du fichier en cours
d\'ouverture. Ensuite, et peu importe l\'uid, notre fonction appelle la
fonction originale open() avec les mÃªmes paramÃ¨tres, pour
effectivement ouvrir le fichier.

La fonction **init\_module** remplace la fonction concernÃ©e dans la
table **sys\_call\_table** avec notre fonction, et conserve l\'originale
dans une variable. La fonction cleanup\_module utilise cette variable
pour restaurer le systÃ¨me dans l\'Ã©tat oÃ¹ il se trouvait avant cette
modification. Cette mÃ©thode est trÃ¨s dangereuse, dans le cas ou deux
modules noyaux modifient le mÃªme appel systÃ¨me.

Imaginez deux modules, A et B. L\'ouverture de A sera A\_open, et celle
de B B\_open. Maintenant, quand A est insÃ©rÃ© dans le noyau, l\'appel
systÃ¨me open est remplacÃ© par A\_open, qui appellera l\'appel original
open Ã sa fin. Ensuite, si on insÃ¨re B au sein de noyau, ce dernier
remplacera l\'appel systÃ¨me A\_open avec le B\_open. L\'appel de
A\_open sera sonc effectuÃ© Ã la fin de la fonction B\_open.

Ensuite, enlevons ces modules. Si B est enlevÃ© en premier, alors il
n\'y aura aucun problÃ¨me --- l\'appel systÃ¨me sera restaurÃ© Ã
A\_open, qui lui-mÃªme appelle l\'open() original. Cependant, si A est
enlevÃ©, alors l\'appel systÃ¨me original sera restaurÃ© (ce qui
signifie que B\_open ne sera jamais appelÃ©). C\'est problÃ©matique,
mais pas catastrophique. Cependant, si vous enlevez ensuite B, la
suppression de ce dernier va restaurer l\'appel systÃ¨me Ã ce qu\'il
pense Ãªtre l\'original, **A\_open**, lequel n\'est plus prÃ©sent en
mÃ©moire. Les consÃ©quences seront dÃ©sastreuses.

Ã€ premiÃ¨re vue, un module peut rÃ©gler ce problÃ¨me en vÃ©rifiant,
lors de sa suppression, si l\'appel systÃ¨me prÃ©sent dans la table
sys\_call\_table est bien sa propre fonction, et si ce n\'est pas le
cas, il ne doit rien changer (ainsi B ne changerait aucun appel systÃ¨me
Ã sa suppression), mais cette solution conduirait en rÃ©alitÃ© Ã un
problÃ¨me plus grave encore. Quand A est enlevÃ©, ce dernier voit que
l\'appel systÃ¨me a Ã©tÃ© changÃ© Ã **B\_open**. Ce dernier ne
restaurera donc pas l\'appel systÃ¨me original. Mais malheureusement, B
n\'a pas conscience de Ã§a. **B\_open** commencera, puis appellera
**A\_open**, qui n\'existe pas en mÃ©moire. Donc mÃªme sans enlever B du
systÃ¨me, votre systÃ¨me va planter.

Notez que tous les problÃ¨mes relatifs Ã cette situation rendent tout
simplement la redÃ©finition des appels systÃ¨me impossible pour des
usages en situation de production. Afin de ne pas tenter les
dÃ©veloppeurs du dimanche de faire des choses potentiellement
dÃ©sastreuses, la table **sys\_call\_table** n\'est plus exportÃ©e, ce
qui signifie que si vous souhaitez exÃ©cuter l\'exemple suivant, vous
devrez modifier votre noyau pour exporter la table en question. Dans le
rÃ©pertoire examples, vous trouverez un README et la modification Ã
apporter. Comme vous l\'imaginez, une telle modification ne doit pas
Ãªtre prise Ã la lÃ©gÃ¨re. N\'essayez pas de rÃ©aliser une telle action
sur un systÃ¨me important (par exemple un systÃ¨me que vous ne possÃ©dez
pas ou que vous ne pouvez pas restaurer aisÃ©ment). Vous aurez besoin
d\'accÃ©der au code source complet de ce guide pour avoir accÃ¨s aux
modifications et au README. En fonction de votre version du noyau, vous
risquez mÃªme devoir effectuer cette modification Ã la main.

C\'est ici que se clÃ´t ce chapitre. Sachez cependant que si Le Coyote
chassant Bip Bip Ã©tait un hacker noyau, ce serait la premiÃ¨re chose
qu\'il essaierait pour attraper son repas !

::: {.org-src-container}
``` {.src .src-C}
/*
 *  syscall.c
 *
 *  Exemple de "vol" d'un d'appel systÃ¨me.
 *
 *  DÃ©sactive la protection des pages au niveau du processeur
 *  en changeant le 16Ã¨me bit dans le registre cr0
 *  (spÃ©cifique aux processeurs Intel)
 *
 *  DÃ©monstration basÃ©e sur l'exemple de Peter Jay Salzman et sur
 *  https://bbs.archlinux.org/viewtopic.php?id=139406
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/syscalls.h>
#include <linux/delay.h>
#include <asm/paravirt.h>
#include <linux/moduleparam.h>  /* Qui contiendra les paramÃ¨tres */
#include <linux/unistd.h>       /* La liste des appels systÃ¨me */

/*
 * On a besoin de ces fichiers afin de connaÃ®tre qui est
 * l'utilisateur dans la structure du processus actuel
 */
#include <linux/sched.h>
#include <linux/uaccess.h>

unsigned long **sys_call_table;
unsigned long original_cr0;

/*
 * UID qu'on souhaite espionner - sera affectÃ©e
 * par la ligne de commande
 */
static int uid;
module_param(uid, int, 0644);

/*
 * La prochaine variable est un pointeur qui contiendra l'adresse
 * de l'appel systÃ¨me avant notre modification.
 *
 * On garde cette adresse dans ce pointeur pour pouvoir, quand on dÃ©chargera
 * notre module, remettre le systÃ¨me dans son Ã©tat initial. On doit garder en
 * mÃ©moire dans ce pointeur l'appel systÃ¨me avant qu'on le modifie, et on ne
 * peut pas juste utiliser l'appel systÃ¨me original (sys_open) dans le cas ou
 * un autre module a modifiÃ© cet appel systÃ¨me avant non. Notez bien que cette
 * sÃ©curitÃ© n'est pas absolument sÃ»re, car dans le cas redoutÃ© dÃ©crit dans
 * ce guide de deux modules modifiant le mÃªme appel systÃ¨me, alors si le
 * module qui a modifiÃ© l'appel systÃ¨me original est supprimÃ© avant le notre,
 * alors si j'appelle une fonction de ce module supprimÃ© dÃ©puis, je ne sais
 * pas ce qui attends notre noyau !
 *
 * Une autre raison pour laquelle on utilise ce pointeur c'est que sys_open
 * est une variable statique, et elle n'est donc pas exportÃ©e.
 */
asmlinkage int (*original_call) (const char *, int, int);

/*
 * La fonction suivante va remplacer sys_open
 * Elle sera donc appelÃ©e quand n'importe quel processus exÃ©cutera l'appel
 * systÃ¨me open.
 * Pour trouver le prototype exact, afin que correspondent parfaitement
 * les arguments, vous devrez faire un tour dans le fichier qui contient la
 * fonction originale (fs/open.c).
 *
 * En thÃ©orie, Ã§a veut dire que notre code est donc dÃ©pendant de la version
 * actuelle du noyau, puisque notre fonction dÃ©pend des types et nombres
 * d'arguments que prennent l'appel systÃ¨me original.
 * En pratique, ne vous inquiÃ©tez pas, les appels systÃ¨me ne sont quasiment
 * jamais modifiÃ©s (cela signifirai que tous les programmes conÃ§us avant cette
 * mise Ã  jour soit recompilÃ©s, puisque les appels systÃ¨me sont l'interface
 * entre le noyau et les processus, et Ã§a causerait donc des ravages
 * dÃ©vastateurs pour le noyau et sa rÃ©putation)
 */
asmlinkage int our_sys_open(const char *filename, int flags, int mode)
{
    int i = 0;
    char ch;

    /*
     * Note l'ouverture du fichier, si nÃ©cessaire
     */
    pr_info("Opened file by %d: ", uid);
    do {
        get_user(ch, filename + i);
        i++;
        pr_info("%c", ch);
    } while (ch != 0);
    pr_info("\n");

    /*
     * A lÃ  fin de notre appel systÃ¨me, notre code doit, bien sur, appeler
     * le code original, sinon quoi on perdrait la capacitÃ© d'ouvrir
     * tous les fichiers
     */
    return original_call(filename, flags, mode);
}

static unsigned long **aquire_sys_call_table(void)
{
    unsigned long int offset = PAGE_OFFSET;
    unsigned long **sct;

    while (offset < ULLONG_MAX) {
        sct = (unsigned long **)offset;

        if (sct[__NR_close] == (unsigned long *) sys_close)
            return sct;

        offset += sizeof(void *);
    }

    return NULL;
}

static int __init syscall_start(void)
{
    if(!(sys_call_table = aquire_sys_call_table()))
        return -1;

    original_cr0 = read_cr0();

    write_cr0(original_cr0 & ~0x00010000);

    /* Garde l'adresse de l'appel systÃ¨me open original */
    original_call = (void*)sys_call_table[__NR_open];

    /* Modifie la table des appels systÃ¨me pour utiliser notre fonction */
    sys_call_table[__NR_open] = (unsigned long *)our_sys_open;

    write_cr0(original_cr0);

    pr_info("Spying on UID:%d\n", uid);

    return 0;
}

static void __exit syscall_end(void)
{
    if(!sys_call_table) {
        return;
    }

    /*
     * Restaure la table des appels systÃ¨me Ã
     * son Ã©tat avant notre modification
     */
    if (sys_call_table[__NR_open] != (unsigned long *)our_sys_open) {
        pr_alert("Somebody else also played with the ");
        pr_alert("open system call\n");
        pr_alert("The system may be left in ");
        pr_alert("an unstable state.\n");
    }

    write_cr0(original_cr0 & ~0x00010000);
    sys_call_table[__NR_open] = (unsigned long *)original_call;
    write_cr0(original_cr0);

    msleep(2000);
}

module_init(syscall_start);
module_exit(syscall_end);

MODULE_LICENSE("GPL");
```
:::
:::
:::

::: {#outline-container-sec-11 .outline-2}
Processus bloquants et threads {#sec-11}
------------------------------

::: {#text-11 .outline-text-2}
:::

::: {#outline-container-sec-11-1 .outline-3}
### Sleep {#sec-11-1}

::: {#text-11-1 .outline-text-3}
Que faites-vous quand quelqu\'un vous demande de faire quelque chose que
vous ne pouvez pas faire immÃ©diatement ? Si vous Ãªtes un Corse
dÃ©rangÃ© par quelqu\'un vous lui rÃ©pondrez sans doute \"*Pas
maintenant, laisse-moi dormir !*\". Mais si vous Ãªtes un module et que
vous Ãªtes dÃ©rangÃ© par un processus, vous avez une autre possibilitÃ©
: Vous pouvez endormir le processus qui vous demande jusqu\'Ã ce que
vous puissiez vous en occuper. AprÃ¨s tout, les processus sont endormis
et rÃ©veillÃ©s sans arrÃªt par le noyau (c\'est la raison pour laquelle
de nombreux processus donnent l\'impression de tourner en mÃªme temps
sur un seul processeur).

Le module noyau suivant est un exemple de Ã§a. Le fichier (appelÃ©
**/proc/sleep**) ne peut Ãªtre ouvert que par un seul processus Ã la
fois. Si le fichier est dÃ©jÃ ouvert, le module appelle
wait\_event\_interruptible. La maniÃ¨re la plus simple de garder un
fichier ouvert est la suivante :

::: {.org-src-container}
``` {.src .src-bash}
tail -f
```
:::

La fonction wait\_event\_interruptible change l\'Ã©tat de la tÃ¢che (une
tÃ¢che est ni plus ni moins qu\'une structure de donnÃ©es dans le noyau
qui contient les informations d\'un processus et les appels systÃ¨me
utilisÃ©s) pour **TASK\_INTERRUPTIBLE**, qui signifie que la tÃ¢che ne
sera pas lancÃ©e avant qu\'elle ne soit rÃ©veillÃ©e d\'une quelconque
maniÃ¨re. La fonction wait\_event\_interruptible va ensuite ajouter la
tÃ¢che en question Ã WaitQ, la file des tÃ¢ches qui attendent pour
accÃ©der au fichier. Ensuite, la fonction appelle l\'ordonnanceur pour
changer le contexte d\'exÃ©cution de la thread Ã endormir pour une
autre, qui sera vraiment utilisÃ©e par le CPU.

Quand le processus qui utilisait le fichier n\'en a plus besoin, ce
processus ferme le fichier, la fonction module\_close est alors
appelÃ©e. Cette fonction rÃ©veille tous les processus dans la file
d\'attente (il n\'y a pas de moyen de n\'en rÃ©veiller qu\'un). Quand
cette fonction se termine, alors le processus qui vient de fermer le
fichier peut continuer sa vie. En temps voulu, l\'ordonnanceur dÃ©cidera
que ce processus a assez profitÃ© du processeur, et \"donnera\" le
processeur Ã un autre processus. Et tÃ´t ou tard, l\'un des processus
qui Ã©tait dans la file d\'attente pour le fichier se verra donner
l\'accÃ¨s au processeur par l\'ordonnanceur. Et il reprendra sa vie
juste aprÃ¨s l\'appel Ã **module\_interruptible\_sleep\_on**.

Ã‡a signifie que le processus est encore en train d\'exÃ©cuter du code
noyau. D\'un point de vue du code utilisateur du programme, on est
encore situÃ© dans l\'appel systÃ¨me open, lequel ne s\'est pas encore
terminÃ©. Le processus n\'a absolument aucune idÃ©e qu\'un autre
processus a utilisÃ© le processeur entre le moment oÃ¹ il a exÃ©cutÃ©
l\'appel Ã la fonction open() et le moment oÃ¹ cette fonction s\'est
terminÃ©e.

Une fois que le processus qui attendait l\'accÃ¨s au fichier a la main
sur le processeur et sur le fichier, il peut ensuite affecter une
variable globale pour signaler aux autres processus que le fichier est
encore ouvert (en l\'occurrence par lui), et continuer son affaire.
Quand les autres processus qui attendent l\'accÃ¨s Ã ce fichier auront
accÃ¨s au processeur, ils liront que cette variable globale signale que
le fichier sur lequel ils attendent un accÃ¨s est encore occupÃ©, et se
rendormiront aussitÃ´t.

Dans notre cas, nous utiliserons tail -f pour garder le fichier ouvert
continuellement en tÃ¢che de fond, pendant que nous essaierons d\'y
accÃ©der avec d\'autres processus (toujours en tÃ¢che de fond, afin que
nous n\'ayons pas besoin de basculer vers un autre terminal). DÃ¨s que
le premier fichier sera tuÃ© avec la commande kill%1, alors le second se
rÃ©veillera, aura finalement accÃ¨s au fichier avant de se terminer.

Pour rendre cette expÃ©rience plus intÃ©ressante, sachez que bien que
notre processus endormi attend son prince charmant, la fonction
**module\_close** n\'a pas le monopole du rÃ©veil de notre processus. Ce
dernier peut Ãªtre Ã©galement rÃ©veillÃ© par d\'autre interruptions,
telles qu\'un signal Ctrl+c/ (**SIGINT**). Ceci vient du fait qu\'on a
prÃ©fÃ©rÃ© utiliser **module\_interruptible\_sleep\_on**. On aurait pu
utiliser **module\_sleep\_on** Ã la place, lequel ignore les signaux,
mais pour une raison qui m\'Ã©chappe, les utilisateurs n\'aiment pas
avoir l\'impression que le contrÃ´le de leur machine leur Ã©chappe.

Dans le cas d\'un rÃ©veil par Ctrl+c/, on veut terminer la fonction
immÃ©diatement et renvoyer un **-EINTR**. C\'est essentiel afin que les
utilisateurs puissent tuer un processus avant que ce dernier ne
reÃ§oivent le fichier qu\'il attend.

Il y a encore un point important Ã retenir. Parfois, les processus sont
exigeants et ne souhaitent pas s\'endormir. Ils veulent soit obtenir ce
qu\'ils demandent immÃ©diatement, soit qu\'on leur informe que la
ressource qu\'ils demandent n\'est pas disponible. De tels processus
utilisent le drapeau **O\_NONBLOCK** quand ils ouvrent un fichier. Le
noyau est censÃ© intervenir en renvoyant une erreur **-EAGAIN** Ã
l\'appel d\'une opÃ©ration qui ignorerait ce drapeau pour bloquer le
processus appelant. Le programme cat\_noblock, disponible dans le code
source de ce chapitre de votre guide, peut Ãªtre utiliser pour illustrer
l\'ouverture d\'un fichier avec l\'option **O\_NONBLOCK**.

::: {.org-src-container}
``` {.src .src-sh}
hostname:~/lkmpg-examples/09-BlockingProcesses# insmod sleep.ko
hostname:~/lkmpg-examples/09-BlockingProcesses# cat_noblock /proc/sleep
Last input:
hostname:~/lkmpg-examples/09-BlockingProcesses# tail -f /proc/sleep &
Last input:
Last input:
Last input:
Last input:
Last input:
Last input:
Last input:
tail: /proc/sleep: file truncated
[1] 6540
hostname:~/lkmpg-examples/09-BlockingProcesses# cat_noblock /proc/sleep
Open would block
hostname:~/lkmpg-examples/09-BlockingProcesses# kill %1
[1]+  Terminated              tail -f /proc/sleep
hostname:~/lkmpg-examples/09-BlockingProcesses# cat_noblock /proc/sleep
Last input:
hostname:~/lkmpg-examples/09-BlockingProcesses#
```
:::

::: {.org-src-container}
``` {.src .src-C}
/*
 *  sleep.c - CrÃ©er un fichier /proc, et si
 *  plusieurs processus essaient d'y accÃ¨der
 *  en mÃªme temps, les endorts tous sauf un
 *  Ã  qui la lecture est accordÃ©e
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/proc_fs.h> /* NÃ©cessaire comme nous utilisons proc fs */
#include <linux/sched.h>   /* NÃ©cessaire pour endormir les processus  *
                              et les rÃ©veiller                        */
#include <linux/uaccess.h> /* NÃ©cessaire pour les fonctions get_user  *
                              et put_user                             */

/*
 * Les fonctions de notre module
 */

/*
 * Dans ce tableau on garde le dernier message reÃ§u,
 * afin de prouver que notre fichier gÃ¨re les entrÃ©es
 */
#define MESSAGE_LENGTH 80
static char Message[MESSAGE_LENGTH];

static struct proc_dir_entry *Our_Proc_File;
#define PROC_ENTRY_FILENAME "sleep"

/*
 * Fonction de lecture associÃ©e dans notre struct file operations
 */
static ssize_t module_output(struct file *file, /* Voir include/linux/fs.h  */
                             char *buf,         /* Le tampon dans lequel on *
                                                   va insÃ©rer les donnÃ©es   *
                                                   (situÃ© dans l'espace     *
                                                   utilisateur)             */
                             size_t len,        /* La taille du tampon      */
                             loff_t * offset)
{
    static int finished = 0;
    int i;
    char message[MESSAGE_LENGTH + 30];

    /*
     * Renvoie 0 pour signifier la fin du fichier
     */
    if (finished) {
        finished = 0;
        return 0;
    }

    /*
     * Si vous ne comprenez pas Ã§a au point oÃ¹ vous en Ãªtes,
     * alors vous Ãªtes aussi dÃ©sespÃ©rant qu'un programmeur noyau
     */
    sprintf(message, "Last input:%s\n", Message);
    for (i = 0; i < len && message[i]; i++)
        put_user(message[i], buf + i);

    finished = 1;
    return i;               /* Renvoie le nombre d'octets "lus" */
}

/*
 * Cette fonction reÃ§oit des donnÃ©es de l'utilisateur quand ce dernier Ã©crit
 * quelque chose dans notre fichier /proc
 */
static ssize_t module_input(struct file *file,  /* Le fichier en question   */
                            const char *buf,    /* Le tampon contenant les  *
                                                   donnÃ©es Ã  "Ã©crire"       */
                            size_t length,      /* La taille du tampon      */
                            loff_t * offset)    /* Curseur de notre fichier *
                                                   (Ã  ignorer)              */
{
    int i;

    /*
     * Modifie notre tableau Message avec les donnÃ©es passÃ©es par
     * l'utilisateur, afin que que notre fonction module_output
     * puisse par la suite s'en servir
     */
    for (i = 0; i < MESSAGE_LENGTH - 1 && i < length; i++)
        get_user(Message[i], buf + i);
    /*
     * On souhaite une chaÃ®ne de caractÃ¨res bien faite, terminÃ©e par un 0
     */
    Message[i] = '\0';

    /*
     * On doit renvoyer le nombre de caractÃ¨res passÃ©s par l'utilisateur
     * qu'on a effectivement utilisÃ©s
     */
    return i;
}

/*
 * Vaut 1 si le fichier est actuellement ouvert par un processus
 */
int Already_Open = 0;

/*
 * File des processus qui veulent ouvrir notre fichier
 */
DECLARE_WAIT_QUEUE_HEAD(WaitQ);
/*
 * AppelÃ©e quand notre fichier /proc est ouvert
 */
static int module_open(struct inode *inode, struct file *file)
{
    /*
     * Si les drapeaux de notre fichier incluent O_NONBLOCK, Ã§a signifie que
     * le processus qui a essaie d'ouvrir notre fichier ne souhaite pas
     * Ãªtre bloquÃ© si ce dernier n'est pas disponible. Dans ce cas, si
     * le fichier est dÃ©jÃ  ouvert, on doit terminer la fonction avec la valeur
     * d'Ã©chec -EAGAIN, qui signifie "Essaie encore !" plutÃ´t que de bloquer
     * un processus qui prÃ©fÃ¨re rester libre et rÃ©veillÃ©
     */
    if ((file->f_flags & O_NONBLOCK) && Already_Open)
        return -EAGAIN;

    /*
     * C'est le bon endroit pour insÃ©rer la fonction
     * try_module_get(THIS_MODULE), car si jamais un
     * processus est dans la boucle qui vient juste
     * aprÃ¨s, laquelle se situe dans le code noyau,
     * alors notre module ne doit pas Ãªtre supprimÃ©
     */
    try_module_get(THIS_MODULE);

    /*
     * Si le fichier est dÃ©jÃ  ouvert, attendre qu'il ne le soit plus
     */
    while (Already_Open) {
        int i, is_sig = 0;

        /*
         * Cette fonction endort le processus en-cours (y compris tous les
         * appels systÃ¨me). Son exÃ©cution reprendra juste aprÃ¨s l'appel Ã
         * cette fonction, soit parce qu'un autre processus a exÃ©cutÃ©
         * wake_up(&WaitQ) (seulement module_close fait cela, quand le
         * fichier est fermÃ©), soit quand un signal (par exemple un Ctrl+C)
         * est envoyÃ© au dit-processus
         */
        wait_event_interruptible(WaitQ, !Already_Open);

        /*
         * Si le processus est rÃ©veillÃ© parce qu'il a reÃ§ut un signal,
         * alors il faut renvoyer -EINTR(ce qui signifie un Ã©chec de l'appel
         * systÃ¨me). Cela permet aux processus qui attendent un fichier
         * d'Ãªtre tuÃ©s ou arrÃªtÃ©s par un signal.
         */

        /*
         * Cmmentaire de Emmanuel Papirakis traduit :
         *
         * Ceci est une petite mise Ã  jour par rapport Ã  la version 2.2.*.
         * Les signaux sont maintenant contenus dans deux mots (de 64 bits)
         * et sont stockÃ©s dans une structure qui contient un tableau de
         * deux entiers longs non signÃ©s.
         * On doit donc faire deux vÃ©rifications dans notre "si"
         *
         * Commentaire de Ori Pomerantz traduit :
         *
         * Personne n'a jamais promis de ne pas utiliser des mots plus longs
         * que 64 bits, ou que ce guide ne serait pas utilisÃ© pour des
         * versions de Linux qui utilisent des mots de 16 bits.
         * C'est pourquoi ce code marchera quelque soit votre architecture.
         */
        for (i = 0; i < _NSIG_WORDS && !is_sig; i++)
            is_sig =
                current->pending.signal.sig[i] & ~current->
                blocked.sig[i];

        if (is_sig) {
            /*
             * Il est important de dÃ©crÃ©menter le compteur d'utilisation dans
             * le cas ou le processus voulant ouvrir notre fichier a reÃ§u
             * un signal. Si on oublie de dÃ©crÃ©menter ce compteur, notre
             * module sera immortel et ne pourra pas Ãªtre enlevÃ© du noyau
             * autrement que par un redÃ©marrage.
             */
            module_put(THIS_MODULE);
            return -EINTR;
        }
    }

    /*
     * Si on est ici, alors la variable Already_Open doit Ãªtre Ã©gale Ã  0
     */

    /*
     * Ouvre le fichier
     */
    Already_Open = 1;
    return 0;               /* Autorise l'accÃ¨s */
}

/*
 * AppelÃ© quand notre fichier /proc est fermÃ©
 */
int module_close(struct inode *inode, struct file *file)
{
    /*
     * Met la variable Already_Open Ã  0, afin que l'un des processus qui
     * attend sagement d'ouvrir le fichier puisse enfin mettre la main
     * dessus, en signalant son utilisation en remettant la variable
     * Already_Open Ã  1 avant d'effectivement ouvrir le fichier.
     * Tous les processus qui attendent notre fichier verront alors
     * qu'Already_Open vaut 1, signifiant qu'un processus a dÃ©jÃ  la main
     * sur le fichier. Ces processus s'endormiront alors une fois encore.
     */
    Already_Open = 0;

    /*
     * RÃ©veille tous les processus prÃ©sent dans la file d'attente WaitQ,
     * Afin que ces derniers puissent enfin prendre la main sur le fichier
     * qu'ils attendent.
     */
    wake_up(&WaitQ);

    module_put(THIS_MODULE);

    return 0;               /* SuccÃ¨s */
}

/*
 * Structure pour enregister le fichier /proc, contenant des
 * pointeurs vers les fonctions associÃ©es.
 */

/*
 * La structure file operations pour notre fichier proc. C'est ici qu'on place
 * les pointeurs vers toutes les fonctions appelÃ©es quand quelqu'un essaie de
 * faire quoique ce soit avec notre fichier. La valeur NULL signifie qu'on
 * n'a pas implantÃ© la fonction associÃ©e.
 */
static struct file_operations File_Ops_4_Our_Proc_File = {
    .read = module_output,   /* "Lecture" de notre fichier              */
    .write = module_input,   /* "Ecriture" de notre fichier             */
    .open = module_open,     /* AppelÃ©e quand notre fichier sera ouvert */
    .release = module_close, /* AppelÃ©e quand notre fichier sera fermÃ©  */
};

/*
 * Initialisation et suppression de notre module.
 */

/*
 * Initialise notre module en enregistrant le fichier proc
 */

int init_module()
{
    Our_Proc_File = proc_create(PROC_ENTRY_FILENAME, 0644, NULL, &File_Ops_4_Our_Proc_File);
    if(Our_Proc_File == NULL)
    {
        remove_proc_entry(PROC_ENTRY_FILENAME, NULL);
        pr_debug("Error: Could not initialize /proc/%s\n", PROC_ENTRY_FILENAME);
        return -ENOMEM;
    }
    proc_set_size(Our_Proc_File, 80);
    proc_set_user(Our_Proc_File,  GLOBAL_ROOT_UID, GLOBAL_ROOT_GID);

    pr_info("/proc/test created\n");

    return 0;
}

/*
 * Fonction de sortie de notre module - Supprime notre fichier de /proc.
 * Cela pourrait Ãªtre dangereux si il y avait encore des processus prÃ©sents
 * dans WaitQ, attendant la libÃ©ration de notre fichier, parcequ'ils ont leurs
 * pointeurs de code dirigÃ©s vers notre fonction open(), qui va Ãªtre dÃ©chargÃ©e
 * du noyau. J'expliquerai dans le chapitre 10 comment Ã©viter de dÃ©charger un
 * module du noyau dans un tel cas.
 */
void cleanup_module()
{
    remove_proc_entry(PROC_ENTRY_FILENAME, NULL);
    pr_debug("/proc/%s removed\n", PROC_ENTRY_FILENAME);
}
```
:::

::: {.org-src-container}
``` {.src .src-C}
/*
 * cat_noblock.c - Ouvre un fichier et affiche son contenu, mais prÃ©fÃ¨re
 * s'arrÃ©ter plutot que d'attendre le fichier
 */
/* Copyright (C) 1998 de Ori Pomerantz */

#include <stdio.h>    /* EntrÃ©e/Sortie standard */
#include <fcntl.h>    /* Pour la fonction open  */
#include <unistd.h>   /* Pour la fonction read  */
#include <stdlib.h>   /* Pour la fonction exit  */
#include <errno.h>    /* Pour les erreurs       */

#define MAX_BYTES 1024*4


int main(int argc, char *argv[])
{
    int    fd;                /* Le descripteur de fichier pour le fichier *
                               * qu'on souhaite lire                       */
    size_t bytes;             /* Le nombre d'octets lus                    */
    char   buffer[MAX_BYTES]; /* Le tampon qui recevra les donnÃ©es         */


    /* VÃ©rification du bon utilisation de notre programme */
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        puts("Reads the content of a file, but doesn't wait for input");
        exit(-1);
    }

    /* Ouvre le fichier pour une lecture en mode non bloquant */
    fd = open(argv[1], O_RDONLY | O_NONBLOCK);

    /* Si l'ouverture a Ã©chouÃ©e */
    if (fd == -1) {
        if (errno = EAGAIN)
            puts("Open would block");
        else
            puts("Open failed");
        exit(-1);
    }

    /* Lit le fichier et affiche son contenu */
    do {
        int i;

        /* Lit les caractÃ¨res depuis le fichier */
        bytes = read(fd, buffer, MAX_BYTES);

        /* Si une erreur est renvoyÃ©e, la signaler *
         * avant de terminer le processus          */
        if (bytes == -1) {
            if (errno = EAGAIN)
                puts("Normally I'd block, but you told me not to");
            else
                puts("Another read error");
            exit(-1);
        }

        /* Affiche les caractÃ¨res */
        if (bytes > 0) {
            for(i=0; i<bytes; i++)
                putchar(buffer[i]);
        }

        /* Continuer tant qu'il reste des caractÃ¨res *
         * Ã  lire dans notre fichier                 */
    } while (bytes > 0);
    return 0;
}
```
:::
:::
:::

::: {#outline-container-sec-11-2 .outline-3}
### AchÃ¨vements {#sec-11-2}

::: {#text-11-2 .outline-text-3}
Parfois, certaines choses doivent se dÃ©rouler avec d\'autres au sein
d\'un module disposant de plusieurs threads. PlutÃ´t que d\'utiliser la
commande **/proc/sleep**, le noyau a un autre moyen de rÃ©aliser ce
mÃ©canisme, tout en permettant les temporisations et les interruptions.

Dans l\'exemple suivant, deux threads sont dÃ©marrÃ©es au sein d\'un
module, mais l\'une d\'entre elle doit commencer aprÃ¨s l\'autre pour le
bon fonctionnement du module.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/kthread.h>
#include <linux/completion.h>

static struct {
    struct completion crank_comp;
    struct completion flywheel_comp;
} machine;

static int machine_crank_thread(void* arg)
{
    pr_info("Turn the crank\n");

    complete_all(&machine.crank_comp);
    complete_and_exit(&machine.crank_comp, 0);
}

static int machine_flywheel_spinup_thread(void* arg)
{
    wait_for_completion(&machine.crank_comp);

    pr_info("Flywheel spins up\n");

    complete_all(&machine.flywheel_comp);
    complete_and_exit(&machine.flywheel_comp, 0);
}

static int completions_init(void)
{
    struct task_struct* crank_thread;
    struct task_struct* flywheel_thread;

    pr_info("completions example\n");

    init_completion(&machine.crank_comp);
    init_completion(&machine.flywheel_comp);

    crank_thread =
        kthread_create(machine_crank_thread,
                       NULL, "KThread Crank");
    if (IS_ERR(crank_thread))
        goto ERROR_THREAD_1;

    flywheel_thread =
        kthread_create(machine_flywheel_spinup_thread,
                       NULL, "KThread Flywheel");
    if (IS_ERR(flywheel_thread))
        goto ERROR_THREAD_2;

    wake_up_process(flywheel_thread);
    wake_up_process(crank_thread);

    return 0;

ERROR_THREAD_2:
    kthread_stop(crank_thread);
ERROR_THREAD_1:

    return -1;
}

void completions_exit(void)
{
    wait_for_completion(&machine.crank_comp);
    wait_for_completion(&machine.flywheel_comp);

    pr_info("completions exit\n");
}

module_init(completions_init);
module_exit(completions_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Completions example");
MODULE_LICENSE("GPL");
```
:::

La structure *machine* contient l\'Ã©tat de complÃ©tude de ces deux
threads. Ã€ la sortie de chacune de ces threads, l\'Ã©tat associÃ© est
mis Ã jour pour signaler une terminaison, et *wait\_for\_completion* est
utilisÃ©e par la thread flywheel pour s\'assurer qu\'elle ne dÃ©marre
pas prÃ©maturÃ©ment.

Ainsi, mÃªme si *flywheel\_thread* est dÃ©marrÃ©e en premier, vous
noterez, si vous chargez ce module avec de jeter un coup d\'oeil aux
entrÃ©es du journal du noyau, que la note \"turning the crank\"
apparaÃ®t toujours en premier. C\'est parce que la thread flywheel
attend toujours la complÃ©tion de l\'autre thread avant de s\'exÃ©cuter.

Il existe d\'autres versions de la fonction *wait\_for\_completion*, qui
incluent des temporisations ou des interruptions, mais ce mÃ©canisme
basique conviendra dans la plupart des situations, en ayant l\'avantage
de limiter la complexitÃ© de votre module.
:::
:::
:::

::: {#outline-container-sec-12 .outline-2}
Eviter les collisions et les interblocages {#sec-12}
------------------------------------------

::: {#text-12 .outline-text-2}
Si des processus qui tournent sur diffÃ©rents processeurs ou dans
diffÃ©rentes threads essaient d\'accÃ©der au mÃªme espace mÃ©moire, il
est possible que des choses surprenantes arrivent, voir que votre
systÃ¨me se bloque. Pour Ã©viter ces problÃ¨mes, plusieurs types de
fonction d\'exclusion mutuelles sont disponibles au sein du noyau.
Celles-ci indiquent si une partie de code est \"verrouillÃ©\" ou
\"libre\", afin d\'Ã©viter des exÃ©cutions concurrentes du mÃªme code.
:::

::: {#outline-container-sec-12-1 .outline-3}
### Mutex {#sec-12-1}

::: {#text-12-1 .outline-text-3}
Vous pouvez utiliser les mutex noyau (exclusions mutuelles) de la mÃªme
maniÃ¨re que vous les exÃ©cuteriez en espace utilisateur. Ce mÃ©canisme
sera suffisant pour Ã©viter les collisions dans la plupart des cas.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/mutex.h>

DEFINE_MUTEX(mymutex);

static int example_mutex_init(void)
{
    int ret;

    pr_info("example_mutex init\n");

    ret = mutex_trylock(&mymutex);
    if (ret != 0) {
        pr_info("mutex is locked\n");

        if (mutex_is_locked(&mymutex) == 0)
            pr_info("The mutex failed to lock!\n");

        mutex_unlock(&mymutex);
        pr_info("mutex is unlocked\n");
    }
    else
        pr_info("Failed to lock\n");

    return 0;
}

static void example_mutex_exit(void)
{
    pr_info("example_mutex exit\n");
}

module_init(example_mutex_init);
module_exit(example_mutex_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Mutex example");
MODULE_LICENSE("GPL");
```
:::
:::
:::

::: {#outline-container-sec-12-2 .outline-3}
### Verrou tournant {#sec-12-2}

::: {#text-12-2 .outline-text-3}
Le verrou tournant, ou spinlock, est un mÃ©canisme de verrou basÃ© sur
l\'attente active ; La thread qui essaie d\'acquÃ©rir une ressource
vÃ©rouillÃ©e va mobiliser toutes les ressources du processeur en vue
d\'acquÃ©rir ce verrou. Elle va faire la demande de la ressource des
millions de fois, jusqu\'Ã ce qu\'elle l\'obtienne. C\'est la raison
pour laquelle vous ne devriez utiliser ce verrou que pour du code qui
peut espÃ©rer rÃ©aliser sa tÃ¢che en moins de quelques millisecondes.
Dans le cas contraire l\'utilisateur risquera d\'Ãªtre tÃ©moin de
ralentissements du systÃ¨me.

L\'exemple ici est /\"irq safe\"/ dans le sens oÃ¹les interruptions qui
peuvent arriver durant le verrou ne seront pas omises grÃ¢ce Ã la
variable *flags* qui les retiendra. Elles seront ensuite traitÃ©es quand
le verrou sera libÃ©rÃ©.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/spinlock.h>
#include <linux/interrupt.h>

DEFINE_SPINLOCK(sl_static);
spinlock_t sl_dynamic;

static void example_spinlock_static(void)
{
    unsigned long flags;

    spin_lock_irqsave(&sl_static, flags);
    pr_info("Locked static spinlock\n");

    /* Ici vous devez Ãªtre sÃ»r de ce que vous
       faites. Parce que vous avez verrouillÃ©
       une ressource, et qu'un autre programme
       qui attendra l'accÃ¨s Ã  cette ressource
       utilisera TOUTES les ressources de
       votre processeur, ce code ne doit
       jamais demander plus de quelques
       millisecondes pour Ãªtre exÃ©cutÃ©. */

    spin_unlock_irqrestore(&sl_static, flags);
    pr_info("Unlocked static spinlock\n");
}

static void example_spinlock_dynamic(void)
{
    unsigned long flags;

    spin_lock_init(&sl_dynamic);
    spin_lock_irqsave(&sl_dynamic, flags);
    pr_info("Locked dynamic spinlock\n");

    /* Ici vous devez Ãªtre sÃ»r de ce que vous
       faites. Parce que vous avez verrouillÃ©
       une ressource, et qu'un autre programme
       qui attendra l'accÃ¨s Ã  cette ressource
       utilisera TOUTES les ressources de
       votre processeur, ce code ne doit
       jamais demander plus de quelques
       millisecondes pour Ãªtre exÃ©cutÃ©. */

    spin_unlock_irqrestore(&sl_dynamic, flags);
    pr_info("Unlocked dynamic spinlock\n");
}

static int example_spinlock_init(void)
{
    pr_info("example spinlock started\n");

    example_spinlock_static();
    example_spinlock_dynamic();

    return 0;
}

static void example_spinlock_exit(void)
{
    pr_info("example spinlock exit\n");
}

module_init(example_spinlock_init);
module_exit(example_spinlock_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Spinlock example");
MODULE_LICENSE("GPL");
```
:::
:::
:::

::: {#outline-container-sec-12-3 .outline-3}
### Verrou lecture/Ã©criture {#sec-12-3}

::: {#text-12-3 .outline-text-3}
Le verrou de type lecture/Ã©criture est une sorte de verrou tournant
spÃ©cialisÃ©, afin que vous puissiez exclusivement lire ou Ã©crire vers
une certaine ressource. Comme l\'exemple de verrou tournant prÃ©cÃ©dent,
cet exemple est \"irq safe\", dans le sens oÃ¹ si d\'autres fonctions
doivent Ãªtre appelÃ©es en raison d\'interruptions reÃ§ues, leurs
exÃ©cutions seront diffÃ©rÃ©es sans Ãªtre oubliÃ©es. Comme
prÃ©cÃ©demment, c\'est une bonne idÃ©e de n\'utiliser le verrou qu\'un
minimum de temps possible afin de ne pas ralentir le systÃ¨me. Ceci bien
sÃ»r afin d\'Ã©viter le soulÃ¨vement des utilisateurs contre le diktat
de votre module.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/interrupt.h>

DEFINE_RWLOCK(myrwlock);

static void example_read_lock(void)
{
    unsigned long flags;

    read_lock_irqsave(&myrwlock, flags);
    pr_info("Read Locked\n");

    /* Lecture */

    read_unlock_irqrestore(&myrwlock, flags);
    pr_info("Read Unlocked\n");
}

static void example_write_lock(void)
{
    unsigned long flags;

    write_lock_irqsave(&myrwlock, flags);
    pr_info("Write Locked\n");

    /* Ecriture */

    write_unlock_irqrestore(&myrwlock, flags);
    pr_info("Write Unlocked\n");
}

static int example_rwlock_init(void)
{
    pr_info("example_rwlock started\n");

    example_read_lock();
    example_write_lock();

    return 0;
}

static void example_rwlock_exit(void)
{
    pr_info("example_rwlock exit\n");
}

module_init(example_rwlock_init);
module_exit(example_rwlock_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Read/Write locks example");
MODULE_LICENSE("GPL");
```
:::

Bien sÃ»r, si vous Ãªtes certain qu\'aucune fonction dÃ©clenchÃ©e par
des interruptions ne pourra gÃªner votre algorithme, alors vous pouvez
vous contenter des fonctions *read\_lock(&myrwlock)* et
*read\_unlock(&myrwlock)/*
:::
:::

::: {#outline-container-sec-12-4 .outline-3}
### OpÃ©rations atomiques {#sec-12-4}

::: {#text-12-4 .outline-text-3}
Si vous rÃ©alisez des opÃ©rations arithmÃ©tiques simple : ajouter,
soustraire ou rÃ©aliser des opÃ©rations bit-Ã -bit, alors il existe un
autre moyen pour s\'assurer, dans un monde oÃ¹ plusieurs processeurs et
programmes tournent en concurrence, qu\'un Ã©tranger ne vous a pas
dÃ©rangÃ© dans votre travail. En utilisant les opÃ©rations atomiques,
vous Ãªtes assurÃ© que votre opÃ©ration s\'est dÃ©roulÃ© exactement
comme vous le souhaitez, et qu\'un tierce programme n\'a pas modifiÃ© la
valeur sur laquelle vous travaillez en mÃªme temps que lui. En voici un
exemple :

::: {.org-src-container}
``` {.src .src-C}
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/interrupt.h>

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0')

static void atomic_add_subtract(void)
{
    atomic_t debbie;
    atomic_t chris = ATOMIC_INIT(50);

    atomic_set(&debbie, 45);

    /* DÃ©crÃ©mentation atomique */
    atomic_dec(&debbie);

    atomic_add(7, &debbie);

    /* IncrÃ©mentation atomique */
    atomic_inc(&debbie);

    pr_info("chris: %d, debbie: %d\n",
           atomic_read(&chris), atomic_read(&debbie));
}

static void atomic_bitwise(void)
{
    unsigned long word = 0;

    pr_info("Bits 0: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(word));
    set_bit(3, &word);
    set_bit(5, &word);
    pr_info("Bits 1: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(word));
    clear_bit(5, &word);
    pr_info("Bits 2: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(word));
    change_bit(3, &word);

    pr_info("Bits 3: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(word));
    if (test_and_set_bit(3, &word))
        pr_info("wrong\n");
    pr_info("Bits 4: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(word));

    word = 255;
    pr_info("Bits 5: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(word));
}

static int example_atomic_init(void)
{
    pr_info("example_atomic started\n");

    atomic_add_subtract();
    atomic_bitwise();

    return 0;
}

static void example_atomic_exit(void)
{
    pr_info("example_atomic exit\n");
}

module_init(example_atomic_init);
module_exit(example_atomic_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Atomic operations example");
MODULE_LICENSE("GPL");
```
:::
:::
:::
:::

::: {#outline-container-sec-13 .outline-2}
Remplacer les macros Print {#sec-13}
--------------------------

::: {#text-13 .outline-text-2}
:::

::: {#outline-container-sec-13-1 .outline-3}
### Remplacement {#sec-13-1}

::: {#text-13-1 .outline-text-3}
Dans la section 1.2.1.2, j\'ai dit que les interfaces graphiques et les
modules ne vont pas bien ensemble. C\'est vrai pour le dÃ©veloppement de
modules noyau, mais en situation rÃ©elle, vous souhaitez Ãªtre capable
d\'envoyer des messages au terminal qui vous a demandÃ© de charger le
module en question.

\"tty\" est une abrÃ©viation de *teletype*: Ã l\'origine, il s\'agissait
d\'un pÃ©riphÃ©rique matÃ©riel, une combinaison clavier-moniteur
utilisÃ©e pour communiquer avec un systÃ¨me Unix. C\'est aujourd\'hui
devenu, par abstraction, un flot de texte utilisÃ© par un programme
Unix, que ce soit un terminal physique, un terminal virtuel au sein
d\'une interface graphique, une connexion rÃ©seau utilisÃ©e par le
rÃ©seau via ssh, et bien d\'autres...

Cette abstraction est implantÃ©e de la maniÃ¨re suivante : On dispose
d\'un pointeur, current, vers la tÃ¢che en cours d\'exÃ©cution, Ã partir
duquel on peut obtenir la structure tty de cette tÃ¢che. Ensuite, au
sein de cette structure tty, on dispose d\'un pointeur vers une fonction
d\'Ã©criture, qui sera appelÃ©e pour Ã©crire une chaÃ®ne de caractÃ¨res
sur le terminal du programme en cours.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  print_string.c - Affichage de donnÃ©es sur le terminal, qu'il
 *  s'agisse d'un terminal graphique, d'une liaison ssh, etc.
 *  Pour agir, il suffit d'Ã©crire une chaÃ®ne de caractÃ¨res sur le
 *  terminal associÃ© Ã  la tÃ¢che courante.
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/sched.h>   /* Fournit l'accÃ¨s Ã  la structure   *
                            * associÃ©e Ã  la tÃ¢che courrante    */
#include <linux/tty.h>     /* Pour les dÃ©clarations du tty     */
#include <linux/version.h> /* Pour la macro LINUX_VERSION_CODE */

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Peter Jay Salzman");

static void print_string(char *str)
{
    struct tty_struct *my_tty;
    const struct tty_operations *ttyops;

    /*
     * La location de la structure tty a changÃ©
     * depuis la version 2.6.6 du noyau
     */
#if ( LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,5) )
    /*
     * Pour le tty de la tÃ¢che courante, pour les noyaux plus vieux que 2.6.6
     */
    my_tty = current->tty;
#else
    /*
     * Pour le tty de la tÃ¢che courante, pour les noyaux les plus rÃ©cents
     */
    my_tty = get_current_tty();
#endif
    ttyops = my_tty->driver->ops;

    /*
     * Si my_tty est NULL, Ã§a signifie qu'aucun tty n'est associÃ© Ã  la
     * tÃ¢che courante. (Cela peut vous arriver, par exemple si c'est un
     * dÃ©mon). Si c'est le cas, vous Ãªtes pieds et poings liÃ©s et ne
     * pouvez rien faire.
     */
    if (my_tty != NULL) {

        /*
         * my_tty->driver est une structure qui contient les fonctions
         * du tty, dont l'une d'entre elle (write) est utilisÃ©e pour
         * Ã©crire des chaÃ®nes de caractÃ¨res au tty.
         * On peut s'en servir pour Ã©crire une chaÃ®ne, qu'elle soit
         * localisÃ©e dans l'espace utilisateur, ou dans l'espace noyau
         *
         * Le premier paramÃ¨tre de la fonction est le tty vers lequel
         * vous souhaitez Ã©crire.
         *
         * Le second paramÃ¨tre est un boolÃ©en qui stipule si la chaÃ®ne
         * de caractÃ¨re reÃ§ue vient de l'espace noyau (0/faux), oÃ¹
         * s'il vient de l'espace utilisateur (vrai/positif).
         * Attention cependant : Depuis les versions du Noyau supÃ©rieures
         * Ã  2.6.9, ce paramÃ¨tre a Ã©tÃ© supprimÃ©.
         *
         * Le paramÃ¨tre suivant est un pointeur vers la chaÃ®ne de
         * caractÃ¨res Ã  Ã©crire.
         *
         * Le dernier paramÃ¨tre est la taille de la chaÃ®ne de caractÃ¨res
         * Ã  Ã©crire.
         *
         * Comme vous le verrez plus bas, il est parfois nÃ©cessaire
         * d'utiliser le prÃ©processeur pour crÃ©er du code qui marchera
         * sur diffÃ©rentes versions du noyau. L'approche naÃ¯vre qu'on a
         * adoptÃ© ici est loin d'Ãªtre parfaite. Le meilleur moyen de
         * rÃ©gler ces problÃ¨mes  est dÃ©crit dans la seconde section de
         * linux/Documentation/SubmittingPatches
         */
        (ttyops->write) (my_tty,      /* Le tty */
#if ( LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,9) )
                         0,            /* La chaÃ®ne de caractÃ¨res           *
                                        * est localisÃ©e en espace           *
                                        * noyau                             */
#endif
                         str,          /* La chaÃ®ne de caractÃ¨res
                                        * Ã  Ã©crire                          */
                         strlen(str)); /* Taille de la chaÃ®ne de caractÃ¨res */

        /*
         * Les ttys Ã©taient Ã  l'origine des pÃ©riphÃ©riques physiques
         * qui, le plus souvant, suivaient Ã  la lettre la rÃ¨gle ASCII
         * standard. En ASCII, pour accÃ¨der Ã  une nouvelle ligne,
         * vous avez besoin de deux caractÃ¨res : un retour de chariot
         * et un saut de ligne. Sur Unix, le saut de ligne sert aussi
         * de retour chariot, mais pas pour votre tty. C'est pourquoi
         * on ne peut donc pas se contenter d'un \n. Il faut rajouter
         * un retour chariot, ou sinon quoi notre terminal continuera
         * bien son affichage sur la ligne suivante, mais sur la mÃªme
         * colonne.
         *
         * C'est pourquoi les fichiers de texte sont diffÃ©rents selon
         * Unix ou Windows. Dans CP/M est ses dÃ©rivÃ©s, tel que MS-DOS
         * et MS-Windows, la rÃ¨gle ASCII a Ã©tÃ© suivie Ã  la lettre, ce
         * qui signifie qu'une nouvelle ligne inclut un saut de ligne
         * ET un retour chariot (d'ou le \rn).
         */

#if ( LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,9) )
        (ttyops->write) (my_tty, 0, "\015\012", 2);
#else
        (ttyops->write) (my_tty, "\015\012", 2);
#endif
    }
}

static int __init print_string_init(void)
{
    print_string("The module has been inserted.  Hello world!");
    return 0;
}

static void __exit print_string_exit(void)
{
    print_string("The module has been removed.  Farewell world!");
}

module_init(print_string_init);
module_exit(print_string_exit);
```
:::
:::
:::

::: {#outline-container-sec-13-2 .outline-3}
### Faire clignoter les LEDS du clavier {#sec-13-2}

::: {#text-13-2 .outline-text-3}
Vous chercherez parfois un moyen plus simple et plus concret de
communiquer avec le monde extÃ©rieur. Un exemple frappant : les LEDs de
votre clavier qui vous signalent que vous Ãªtes en mode majuscule ou
minuscule. On peut se servir de ces LEDs pour attirer l\'attention ou
afficher un Ã©tat de votre systÃ¨me. Les LEDs sont prÃ©sents sur
quasiment tous les claviers, dans quel cas ils sont toujours visibles,
n\'ont pas besoin d\'Ãªtre installÃ©s, en plus de quoi leur usage est
plus simple et discret que l\'Ã©criture sur un terminal ou sur un
fichier.

Le code suivant est un exemple de noyau minimal qui permet, une fois
qu\'il est chargÃ© de faire clignoter les LEDs du clavier jusqu\'Ã son
dÃ©chargement du noyau.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  kbleds.c - Fait clignoter les LEDs du clavier tant que le module est
 *  chargÃ© au sein du noyau
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/vt_kern.h>              /* Pour l'accÃ¨s Ã  fg_console    */
#include <linux/tty.h>                  /* Pour l'accÃ¨s Ã  fg_console,   *
                                         * et Ã  la macroMAX_NR_CONSOLES */
#include <linux/kd.h>                   /* Pour l'accÃ¨s Ã  KDSETLED      */
#include <linux/vt.h>
#include <linux/console_struct.h>       /* Pour l'accÃ¨s Ã  vc_cons       */

MODULE_DESCRIPTION("Example module illustrating the use of Keyboard LEDs.");
MODULE_AUTHOR("Daniele Paolo Scarpazza");
MODULE_LICENSE("GPL");

struct timer_list my_timer;
struct tty_driver *my_driver;
char kbledstatus = 0;

#define BLINK_DELAY   HZ/5
#define ALL_LEDS_ON   0x07
#define RESTORE_LEDS  0xFF

/*
 * La fonction my_timer_func fait clignoter les LEDs du clavier de maniÃ¨re
 * pÃ©riodique en appelant la commande KDSETLED (qui est un appel ioctl sur
 * une console virtuelle) sur le pilote du clavier.
 * Pour en apprendre plus sur les opÃ©rations sur les consoles virtuelles,
 * regardez le fichier :
 *     /usr/src/linux/drivers/char/vt_ioctl.c, fonction vt_ioctl().
 *
 * L'argument de KDSETLED est affectÃ© Ã  tour de rÃ´le Ã  0x07 et Ã  0xFF.
 * 0x07 conduit les Leds Ã  Ãªtre affectÃ©es Ã  LED_SHOW_IOCTL, ce qui les allume
 * 0xFF affecte les Leds Ã  LED_SHOW_FLAGS, oÃ¹ ces derniÃ¨res correspondes Ã
 * l'Ã©tat du clavier.
 * Pour en apprendre plus, regardez :
 *     /usr/src/linux/drivers/char/keyboard.c, fonction setledstate().
 */

static void my_timer_func(unsigned long ptr)
{
    unsigned long *pstatus = (unsigned long *)ptr;
    struct tty_struct* t = vc_cons[fg_console].d->port.tty;

    if (*pstatus == ALL_LEDS_ON)
        *pstatus = RESTORE_LEDS;
    else
        *pstatus = ALL_LEDS_ON;

    (my_driver->ops->ioctl) (t, KDSETLED, *pstatus);

    my_timer.expires = jiffies + BLINK_DELAY;
    add_timer(&my_timer);
}

static int __init kbleds_init(void)
{
    int i;

    pr_info("kbleds: loading\n");
    pr_info("kbleds: fgconsole is %x\n", fg_console);
    for (i = 0; i < MAX_NR_CONSOLES; i++) {
        if (!vc_cons[i].d)
            break;
        pr_info("poet_atkm: console[%i/%i] #%i, tty %lx\n", i,
               MAX_NR_CONSOLES, vc_cons[i].d->vc_num,
               (unsigned long)vc_cons[i].d->port.tty);
    }
    pr_info("kbleds: finished scanning consoles\n");

    my_driver = vc_cons[fg_console].d->port.tty->driver;
    pr_info("kbleds: tty driver magic %x\n", my_driver->magic);

    /*
     * RÃ¨gle le temporisateur de clignotement pour la premiÃ¨re fois
     */
    timer_setup(&my_timer, (void*)&my_timer_func, (unsigned long)&kbledstatus);
    my_timer.expires = jiffies + BLINK_DELAY;
    add_timer(&my_timer);

    return 0;
}

static void __exit kbleds_cleanup(void)
{
    pr_info("kbleds: unloading...\n");
    del_timer(&my_timer);
    (my_driver->ops->ioctl) (vc_cons[fg_console].d->port.tty,
                             KDSETLED, RESTORE_LEDS);
}

module_init(kbleds_init);
module_exit(kbleds_cleanup);
```
:::

Si aucun des exemples prÃ©sents dans ce chapitre ne rÃ©pond Ã vos
besoins en terme de dÃ©bogage, il existe encore quelques astuces Ã
essayer. Vous Ãªtes vous dÃ©jÃ demandÃ© Ã quoi la macro
CONFIG\_LL\_DEBUG du make menuconfig sert ? Si vous l\'activez, alors
vous aurez un accÃ¨s bas niveau au port sÃ©rie. Bien que Ã§a ne semble
pas trÃ¨s utile, sachez que vous pourrez alors modifier
**kernel/printk.c** ou n\'importe quel autre appel systÃ¨me pour
utiliser printascii, ce qui vous permettra de laisser une trace sur
absolument tout ce que fait votre code, de prÃ¨s ou de loin, sur le port
sÃ©rie. Si vous souhaitez porter le noyau sur une nouvelle architecture,
cette manipulation est gÃ©nÃ©ralement la premiÃ¨re Ã rÃ©aliser. Se
connecter Ã votre noyau Ã travers une console via le rÃ©seau pourra
aussi Ãªtre une chose trÃ¨s utile Ã des fin de dÃ©bogage.

Bien que vous ayez lu quelques maniÃ¨res de dÃ©boguer, sachez que le
dÃ©bogage est presque toujours une mÃ©thode trÃ¨s intrusive vis-Ã -vis
de votre code. La simple insertion de code de dÃ©bogage pour localiser
un problÃ¨me peut changer en profondeur votre code jusqu\'Ã ce que vous
ayez l\'impression que votre problÃ¨me est rÃ©solu. C\'est un problÃ¨me
qui vous arrivera tÃ´t ou tard. C\'est la raison pour laquelle vous
devrez limiter le code de dÃ©bogage au strict minimum, et surtout faire
des essais, sans cesse et sans arrÃªt, pour s\'assurer que les
problÃ¨mes ne reviendront pas en situation de production.
:::
:::
:::

::: {#outline-container-sec-14 .outline-2}
TÃ¢ches ordonnancÃ©es {#sec-14}
---------------------

::: {#text-14 .outline-text-2}
Il existe deux maniÃ¨res de lancer un tÃ¢che : via le mÃ©canisme de
tasklet et via les files de travaux. Les tasklets sont un moyen rapide
et facile d\'ordonnancer une tÃ¢che unique, par exemple en la
dÃ©clanchant suite Ã une interruption, alors que les files de travaux
sont plus complexes, mais plus efficaces pour exÃ©cuter plusieurs
tÃ¢ches.
:::

::: {#outline-container-sec-14-1 .outline-3}
### Tasklets {#sec-14-1}

::: {#text-14-1 .outline-text-3}
Voici un exemple de module qui utilise les tasklets. La fonction
*tasklet\_fn* est lancÃ©e pour quelques secondes, durant lesquelles
l\'exÃ©cution de *example\_tasklet\_init* continue jusqu\'Ã se terminer.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/interrupt.h>

static void tasklet_fn(unsigned long data)
{
    pr_info("Example tasklet starts\n");
    mdelay(5000);
    pr_info("Example tasklet ends\n");
}

DECLARE_TASKLET(mytask, tasklet_fn, 0L);

static int example_tasklet_init(void)
{
    pr_info("tasklet example init\n");
    tasklet_schedule(&mytask);
    mdelay(200);
    pr_info("Example tasklet init continues...\n");
    return 0;
}

static void example_tasklet_exit(void)
{
    pr_info("tasklet example exit\n");
    tasklet_kill(&mytask);
}

module_init(example_tasklet_init);
module_exit(example_tasklet_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Tasklet example");
MODULE_LICENSE("GPL");
```
:::

Ansi, avec cet exemple, les notes au sein de *dmesg* devraient contenir
:

::: {.org-src-container}
``` {.src .src-bash}
tasklet example init
Example tasklet starts
Example tasklet init continues...
Example tasklet ends
```
:::
:::
:::

::: {#outline-container-sec-14-2 .outline-3}
### Files de travaux {#sec-14-2}

::: {#text-14-2 .outline-text-3}
Pour ajouter une tÃ¢che Ã l\'ordonnanceur, vous pouvez utiliser une file
de travaux. Le noyau utilise ensuite le Completely Fair Scheduler (CFS)
(entendez l\'ordonnanceur parfaitement Ã©quitable) pour exÃ©cuter les
travaux dans cette file d\'attente.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/module.h>
#include <linux/init.h>
#include <linux/workqueue.h>

static struct workqueue_struct *queue=NULL;
static struct work_struct work;

static void work_handler(struct work_struct *data)
{
    pr_info ("work handler function.\n");
}

int init_module()
{
    queue = alloc_workqueue("HELLOWORLD", WQ_UNBOUND, 1);
    INIT_WORK(&work, work_handler);
    schedule_work(&work);

    return 0;

}

void cleanup_module()
{
    destroy_workqueue(queue);
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Workqueue example");
```
:::
:::
:::
:::

::: {#outline-container-sec-15 .outline-2}
Gestionnaire d\'interruptions {#sec-15}
-----------------------------

::: {#text-15 .outline-text-2}
:::

::: {#outline-container-sec-15-1 .outline-3}
### Gestionnaire d\'interruptions {#sec-15-1}

::: {#text-15-1 .outline-text-3}
Ã€ l\'exception du dernier chapitre, tout ce qu\'on a rÃ©alisÃ© dans le
noyau jusqu\'ici Ã©tait du code appelÃ© par un processus qui le
demandait, que ce soit Ã travers un fichier spÃ©cial, Ã travers l\'envoi
d\'un ioctl(), ou un appel systÃ¨me. Mais ce n\'est pas la principale
fonction d\'un noyau. Un systÃ¨me d\'exploitation a la tÃ¢che
essentielle de communiquer avec le matÃ©riel connectÃ© Ã la machine.

Il existe deux interactions diffÃ©rentes entre le processeur et les
autres pÃ©riphÃ©riques. La premiÃ¨re, c\'est quand le processeur ordonne
des actions au matÃ©riel, et les transferts de donnÃ©es qui en
dÃ©coulent. La seconde interaction, appelÃ©e interruption, advient quand
le matÃ©riel doit informer le processus d\'une situation particuliÃ¨re.
Les interruptions sont dures Ã implanter, parce que le dÃ©veloppeur doit
tenir compte des contraintes matÃ©rielles que le processeur ignore. Par
exemple, de nombreux pÃ©riphÃ©riques ont une mÃ©moire trÃ¨s limitÃ©e. Si
vous ne lisez pas les bons registres du pÃ©riphÃ©rique quand elle est
disponible, cette information risque d\'Ãªtre perdue trÃ¨s vite. Par
exemple, certains claviers ont un registre unique qui contient la
derniÃ¨re touche tapÃ©e par l\'utilisateur. Si l\'information n\'est pas
lue avant que l\'utilisateur appuie sur une nouvelle touche, cette
information risque d\'Ãªtre perdue. Pour Ã©viter ce cas, le clavier va
envoyer une interruption au systÃ¨me pour le prÃ©venir qu\'une nouvelle
information est disponible.

Sous Linux, les interruptions matÃ©rielles sont appelÃ©es IRQ, pour
requÃªtes d\'interruption. Il existe deux types d\'IRQ : les courtes et
les longues. Une IRQ courte est une IRQ qui doit Ãªtre traitÃ©e en trÃ¨s
peu de temps, pendant lequel aucune autre interruption ne pourra Ãªtre
prise en compte. Une IRQ longue peut au contraire durer plus longtemps
et peut Ãªtre interrompue par d\'autres interruptions d\'un matÃ©riel
diffÃ©rent (mais pas du mÃªme matÃ©riel). Dans chaque cas oÃ¹ la
situation le permet, il est prÃ©fÃ©rable d\'utiliser les IRQ longues.

Quand le processeur reÃ§oit une interruption, il arrÃªte ce qu\'il fait
(Ã moins qu\'il ne soit dÃ©jÃ occupÃ© par une interruption plus
importante, dans quel cas il s\'occupe de l\'interruption la plus
importante), sauvegarde certains paramÃ¨tres sur la pile d\'exÃ©cution,
et appelle le gestionnaire d\'interruption. Ce qui signifie que tout
n\'est pas permis dans le gestionnaire d\'interruption. C\'est pourquoi
le gestionnaire d\'interruption se contente de faire ce qui est urgent,
en gÃ©nÃ©ral il s\'agit de lire ou d\'Ã©crire dans les registres du
matÃ©riel, avant d\'ordonnancer la gestion de cette nouvelle information
afin de s\'en occuper plus tard (c\'est ce qu\'on appelle le \"bottom
half\", ou la partie immergÃ©e). Finalement, le gestionnaire
d\'interruption rend la main Ã la tÃ¢che qui a Ã©tÃ© interrompue par
l\'interruption. Le noyau garantit ensuite d\'appeler la partie
immergÃ©e de l\'interruption dÃ¨s que possible -- et Ã ce moment, le
noyau aura tous les droits.

Le moyen de procÃ©der de la sorte est d\'appeler **request\_irq()** afin
que votre gestionnaire d\'interruption soit appelÃ© quand l\'IRQ
associÃ©e est reÃ§ut.

Dans la pratique, la gestion des IRQ est un peu plus complexe. La
plupart des pÃ©riphÃ©riques sont conÃ§us de telle sorte que deux
gestionnaires devront Ãªtre appelÃ©s en cascade. Ainsi, toutes les IRQs
d\'un gestionnaire d\'interruption B seront reconduites vers une
certaine IRQ d\'un autre gestionnaire d\'interruption A. Bien sÃ»r, Ã§a
nÃ©cessite que le noyau cherche quelle Ã©tait l\'IRQ qui Ã©tait vraiment
lancÃ©e par le matÃ©riel. D\'autres architectures matÃ©rielles proposent
d\'autres mÃ©canismes d\'interruptions, appelÃ©s \"fast IRQ\" (FIQ) pour
requÃªte d\'interruption rapide. Comme ils sont relatifs Ã certaines
architectures, ils doivent Ãªtre codÃ©s en assembleur. C\'est la raison
pour laquelle ils sont d\'une certaine maniÃ¨re Ã l\'Ã©cart du noyau.
Ils peuvent Ãªtre conÃ§us de la mÃªme maniÃ¨re que les autres IRQs mais
dans ce cas ils ne seraient pas plus rapides que les requÃªtes
interruptions \"normales\". Les noyaux conÃ§us pour les systÃ¨mes
multi-processeurs (les noyaux SMP, pour Symmetric MultiProcessor) ont
encore plus de problÃ¨mes Ã rÃ©gler. Dans ces noyaux, au moment oÃ¹ une
interruption est levÃ©e, il faut non seulement trouver quelle IRQs est
levÃ©e, mais il faut aussi prendre en compte Ã quel processeur elle
Ã©tait destinÃ©e. Cela dÃ©passe le cadre de ce cours, mais les personnes
qui souhaitent en savoir plus devraient faire des recherches sur les
\"Advanced Programmable Interrupt Controller\".

La fonction **request\_irq()** qui permet d\'activer une fonction qui va
gÃ©rer l\'interruption reÃ§oit un numÃ©ro de requÃªte d\'interruption,
une fonction, des drapeaux, un nom pour le fichier *proc* de
l\'interruption et un paramÃ¨tre Ã passer au gestionnaire
d\'interruption. Il n\'y a qu\'un certain nombre de requÃªtes
d\'interruption, et ce nombre dÃ©pend du matÃ©riel. Les drapeaux qui
sont passÃ©s peuvent inclure SA\_SHIRQ, qui indique que vous Ãªtes en
train de partager la requÃªte d\'interruption en cours avec un autre
gestionnaire d\'interruption (en gÃ©nÃ©ral parce que plusieurs
pÃ©riphÃ©riques matÃ©riels partagent la mÃªme requÃªte d\'interruption),
ou SA\_INTERRUPT, qui indique que vous traitez une interruption courte.
Cette fonction ne se terminera avec succÃ¨s que s\'il n\'existe pas
dÃ©jÃ un gestionnaire pour cette interuption, ou si les deux
gestionnaires ont conscience de partager une mÃªme interruption.
:::
:::

::: {#outline-container-sec-15-2 .outline-3}
### DÃ©tection de pression de bouton {#sec-15-2}

::: {#text-15-2 .outline-text-3}
Les ordinateurs monocartes les plus populaires, comme les Raspberry Pis
ou les Beagleboard disposent de plusieurs broches GPIO (traduites
littÃ©ralement par EntrÃ©e/Sortie pour un Usage GÃ©nÃ©ral). Vous pouvez
attacher un bouton poussoir Ã ces broches. Vous aurez ensuite deux
maniÃ¨re diffÃ©rentes de savoir si un utilisateur appuie sur l\'un des
boutons. Soit en crÃ©ant une tÃ¢che qui va gaspiller du temps de
processeur et de l\'Ã©nergie en regardant pÃ©riodiquement si le bouton
est appuyÃ©, ou faire en sorte que l\'appui dÃ©clenche une interruption,
qui sera gÃ©rÃ©e par le processeur en appelant la fonction de gestion
d\'interruption associÃ©e.

VoilÃ un exemple de code pour Raspberry PI, oÃ¹ des boutons sont
connectÃ©s aux broches 17 et 18 et une LED est connectÃ©e Ã la broche 4.
Vous pouvez bien sÃ»r changer ces numÃ©ros pour qu\'ils correspondent Ã
votre machine.

::: {.org-src-container}
``` {.src .src-C}
/*
 *  intrpt.c - GÃ¨re les GPIOs avec les interruptions
 *
 *  Copyright (C) 2017 par Bob Mottram
 *  BasÃ© sur l'exemple sur Raspberry Py de Stehan Wendler(devnull@kaltpost.de)
 *  de:
 *    https://github.com/wendlers/rpi-kmod-samples
 *
 *  Appuyez sur un boutton pour allumer une LED,
 *  et sur un autre pour l'Ã©teindre
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>

static int button_irqs[] = { -1, -1 };

/* DÃ©finit les GPIOs pour les LEDs.              *
 * Changez ces valeurs en fonction de votre rasp */
static struct gpio leds[] = {
        {  4, GPIOF_OUT_INIT_LOW, "LED 1" }
};

/* DÃ©finit les GPIOs pour les boutons.           *
 * Changez ces valeurs en fonction de votre rasp */
static struct gpio buttons[] = {
        { 17, GPIOF_IN, "LED 1 ON BUTTON" },
        { 18, GPIOF_IN, "LED 1 OFF BUTTON" }
};

/*
 * Fonction d'interruption qui sera appelÃ©e quand un bouton sera pressÃ©
 */
static irqreturn_t button_isr(int irq, void *data)
{
    /* Premier bouton */
    if (irq == button_irqs[0] && !gpio_get_value(leds[0].gpio))
            gpio_set_value(leds[0].gpio, 1);
    /* Second bouton */
    else if(irq == button_irqs[1] && gpio_get_value(leds[0].gpio))
            gpio_set_value(leds[0].gpio, 0);

    return IRQ_HANDLED;
}

int init_module()
{
    int ret = 0;

    pr_info("%s\n", __func__);

    /* Les registres correspondant aux broches associÃ©es aux LEDs */
    ret = gpio_request_array(leds, ARRAY_SIZE(leds));

    if (ret) {
        pr_err("Unable to request GPIOs for LEDs: %d\n", ret);
        return ret;
    }

    /* Les registres correspondant aux broches associÃ©es aux bouttons */
    ret = gpio_request_array(buttons, ARRAY_SIZE(buttons));

    if (ret) {
        pr_err("Unable to request GPIOs for BUTTONs: %d\n", ret);
        goto fail1;
    }

    pr_info("Current button1 value: %d\n",
           gpio_get_value(buttons[0].gpio));

    ret = gpio_to_irq(buttons[0].gpio);

    if (ret < 0) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail2;
    }

    button_irqs[0] = ret;

    pr_info("Successfully requested BUTTON1 IRQ # %d\n",
           button_irqs[0]);

    ret = request_irq(button_irqs[0], button_isr,
                      IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
                      "gpiomod#button1", NULL);

    if (ret) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail2;
    }


    ret = gpio_to_irq(buttons[1].gpio);

    if (ret < 0) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail2;
    }

    button_irqs[1] = ret;

    pr_info("Successfully requested BUTTON2 IRQ # %d\n",
           button_irqs[1]);

    ret = request_irq(button_irqs[1], button_isr,
                      IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
                      "gpiomod#button2", NULL);

    if (ret) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail3;
    }

    return 0;

/* Nettoie ce qui a dÃ©jÃ  Ã©tÃ© fait en cas d'Ã©chec */
fail3:
    free_irq(button_irqs[0], NULL);

fail2:
    gpio_free_array(buttons, ARRAY_SIZE(leds));

fail1:
    gpio_free_array(leds, ARRAY_SIZE(leds));

    return ret;
}

void cleanup_module()
{
    int i;

    pr_info("%s\n", __func__);

    /* LibÃ¨re les interruptions */
    free_irq(button_irqs[0], NULL);
    free_irq(button_irqs[1], NULL);

    /* Eteint les LEDs */
    for (i = 0; i < ARRAY_SIZE(leds); i++)
        gpio_set_value(leds[i].gpio, 0);

    /* Suppression */
    gpio_free_array(leds, ARRAY_SIZE(leds));
    gpio_free_array(buttons, ARRAY_SIZE(buttons));
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Handle some GPIO interrupts");
```
:::
:::
:::

::: {#outline-container-sec-15-3 .outline-3}
### Partie immergÃ©e d\'une interruption {#sec-15-3}

::: {#text-15-3 .outline-text-3}
Supposez maintenant que vous devez faire beaucoup de choses au sein de
votre gestionnaire d\'interruption. La maniÃ¨re la plus simple de
procÃ©der ainsi sans dÃ©sactiver les interruptions pour un long dÃ©lai
est de combiner ce gestionnaire avec le mÃ©canisme de tasklet. Ainsi, le
gros de travail est dÃ©portÃ© vers l\'ordonnanceur.

L\'exemple plus bas modifie l\'exemple prÃ©cÃ©dent pour lancer une
tÃ¢che additionnelle quand une interruption est levÃ©e.

::: {.org-src-container}
``` {.src .src-C}
/*
 * bottomhalf.c - Gestion d'interruption utilisant la partie immergÃ©e
 *
 *  Copyright (C) 2017 par Bob Mottram
 *  BasÃ© sur l'exemple pour rasp de Stefan Wendler (devnull@kaltpost.de)
 *  disponible ici :
 *    https://github.com/wendlers/rpi-kmod-samples
 *
 *  Appuyez sur un bouton pour allumer une LED,
 *  et sur un autre pour l'Ã©teindre
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/gpio.h>
#include <linux/delay.h>
#include <linux/interrupt.h>

static int button_irqs[] = { -1, -1 };

/* DÃ©finit les GPIOs pour les LEDs.              *
 * Changez ces valeurs en fonction de votre rasp */
static struct gpio leds[] = {
        {  4, GPIOF_OUT_INIT_LOW, "LED 1" }
};

/* DÃ©finit les GPIOs pour les boutons.           *
 * Changez ces valeurs en fonction de votre rasp */
static struct gpio buttons[] = {
        { 17, GPIOF_IN, "LED 1 ON BUTTON" },
        { 18, GPIOF_IN, "LED 1 OFF BUTTON" }
};

/* Tasklet qui contient du code long Ã  s'exÃ©cuter */
static void bottomhalf_tasklet_fn(unsigned long data)
{
    pr_info("Bottom half tasklet starts\n");
    /* Ici vous pouvez insÃ©rer du code lourd Ã  exÃ©cuter */
    mdelay(500);
    pr_info("Bottom half tasklet ends\n");
}

DECLARE_TASKLET(buttontask, bottomhalf_tasklet_fn, 0L);

/*
 * Fonction d'interruption : DÃ©clenchÃ©e quand un bouton est appuyÃ©
 */
static irqreturn_t button_isr(int irq, void *data)
{
    /* Ici vous pouvez insÃ©rer du code rapide Ã  exÃ©cuter */
    if (irq == button_irqs[0] && !gpio_get_value(leds[0].gpio))
            gpio_set_value(leds[0].gpio, 1);
    else if(irq == button_irqs[1] && gpio_get_value(leds[0].gpio))
            gpio_set_value(leds[0].gpio, 0);

    /* Chargez maintenant le reste    *
     * (la partie la plus Ã©nergivore) *
     * de la tÃ¢che Ã  exÃ©cuter         */
    tasklet_schedule(&buttontask);

    return IRQ_HANDLED;
}

int init_module()
{
    int ret = 0;

    pr_info("%s\n", __func__);

    /* Enregistrement des broches liÃ©es aux LEDs */
    ret = gpio_request_array(leds, ARRAY_SIZE(leds));

    if (ret) {
        pr_err("Unable to request GPIOs for LEDs: %d\n", ret);
        return ret;
    }

    /* Enregistrement des broches liÃ©es aux boutons */
    ret = gpio_request_array(buttons, ARRAY_SIZE(buttons));

    if (ret) {
        pr_err("Unable to request GPIOs for BUTTONs: %d\n", ret);
        goto fail1;
    }

    pr_info("Current button1 value: %d\n",
           gpio_get_value(buttons[0].gpio));

    ret = gpio_to_irq(buttons[0].gpio);

    if (ret < 0) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail2;
    }

    button_irqs[0] = ret;

    pr_info("Successfully requested BUTTON1 IRQ # %d\n",
           button_irqs[0]);

    ret = request_irq(button_irqs[0], button_isr,
                      IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
                      "gpiomod#button1", NULL);

    if (ret) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail2;
    }


    ret = gpio_to_irq(buttons[1].gpio);

    if (ret < 0) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail2;
    }

    button_irqs[1] = ret;

    pr_info("Successfully requested BUTTON2 IRQ # %d\n",
           button_irqs[1]);

    ret = request_irq(button_irqs[1], button_isr,
                      IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
                      "gpiomod#button2", NULL);

    if (ret) {
        pr_err("Unable to request IRQ: %d\n", ret);
        goto fail3;
    }

    return 0;

/* Nettoyage de ce qui a Ã©tÃ© exÃ©cutÃ©, en cas d'Ã©chec */
fail3:
    free_irq(button_irqs[0], NULL);

fail2:
    gpio_free_array(buttons, ARRAY_SIZE(leds));

fail1:
    gpio_free_array(leds, ARRAY_SIZE(leds));

    return ret;
}

void cleanup_module()
{
    int i;

    pr_info("%s\n", __func__);

    /* LibÃ©ration des interruptions */
    free_irq(button_irqs[0], NULL);
    free_irq(button_irqs[1], NULL);

    /* Extinction des LEDs */
    for (i = 0; i < ARRAY_SIZE(leds); i++)
        gpio_set_value(leds[i].gpio, 0);

    /* Suppression */
    gpio_free_array(leds, ARRAY_SIZE(leds));
    gpio_free_array(buttons, ARRAY_SIZE(buttons));
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Interrupt with top and bottom half");
```
:::
:::
:::
:::

::: {#outline-container-sec-16 .outline-2}
Cryptage {#sec-16}
--------

::: {#text-16 .outline-text-2}
Ã€ l\'aube de l\'internet, le monde Ã©tait bienveillant... mais tout ne
s\'est pas passÃ© comme prÃ©vu. Quand la premiÃ¨re version de ce guide a
Ã©tÃ© Ã©crite, le monde de l\'informatique Ã©tait bien plus innocent et
tout le monde se fichait du cryptage - en tout cas c\'Ã©tait le cas des
dÃ©veloppeurs noyau. C\'est n\'est plus le cas de nos jours. Pour gÃ©rer
le cryptage, le noyau a sa propre API qui fournit des mÃ©thodes de
cryptage, de dÃ©cryptage, et votre fonction de hachage prÃ©fÃ©rÃ©e.
:::

::: {#outline-container-sec-16-1 .outline-3}
### Fonction de hachage {#sec-16-1}

::: {#text-16-1 .outline-text-3}
Le hachage d\'une information et sa vÃ©rification sont des opÃ©rations
communes. VoilÃ en exemple pour hacher une donnÃ©e avec l\'algorithme
sha256 au sein d\'un module noyau :

::: {.org-src-container}
``` {.src .src-C}
#include <linux/module.h>
#include <crypto/internal/hash.h>

#define SHA256_LENGTH (256/8)

static void show_hash_result(char * plaintext, char * hash_sha256)
{
    int i;
    char str[SHA256_LENGTH*2 + 1];

    pr_info("sha256 test for string: \"%s\"\n", plaintext);
    for (i = 0; i < SHA256_LENGTH ; i++)
        sprintf(&str[i*2],"%02x", (unsigned char)hash_sha256[i]);
    str[i*2] = 0;
    pr_info("%s\n", str);
}

int cryptosha256_init(void)
{
    char * plaintext = "This is a test";
    char hash_sha256[SHA256_LENGTH];
    struct crypto_shash *sha256;
    struct shash_desc *shash;

    sha256 = crypto_alloc_shash("sha256", 0, 0);
    if (IS_ERR(sha256))
        return -1;

    shash =
        kmalloc(sizeof(struct shash_desc) + crypto_shash_descsize(sha256),
                GFP_KERNEL);
    if (!shash)
        return -ENOMEM;

    shash->tfm = sha256;
    shash->flags = 0;

    if (crypto_shash_init(shash))
        return -1;

    if (crypto_shash_update(shash, plaintext, strlen(plaintext)))
        return -1;

    if (crypto_shash_final(shash, hash_sha256))
        return -1;

    kfree(shash);
    crypto_free_shash(sha256);

    show_hash_result(plaintext, hash_sha256);

    return 0;
}

void cryptosha256_exit(void)
{
}

module_init(cryptosha256_init);
module_exit(cryptosha256_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("sha256 hash test");
MODULE_LICENSE("GPL");
```
:::

Pour crÃ©er et installer le module :

::: {.org-src-container}
``` {.src .src-sh}
make
sudo insmod cryptosha256.ko
dmesg
```
:::

Vous devriez vous apercevoir que la chaÃ®ne de caractÃ¨re a Ã©tÃ©
hachÃ©e.

Finalement, enlevez le module :

::: {.org-src-container}
``` {.src .src-sh}
sudo rmmod cryptosha256
```
:::
:::
:::

::: {#outline-container-sec-16-2 .outline-3}
### Cryptage par clÃ© symÃ©trique {#sec-16-2}

::: {#text-16-2 .outline-text-3}
Voici un exemple de cryptage de clÃ© symÃ©trique d\'une chaÃ®ne de
caractÃ¨res en utilisant l\'algorithme AES et une clÃ© secrÃ¨te
associÃ©e.

::: {.org-src-container}
``` {.src .src-C}
#include <crypto/internal/skcipher.h>
#include <linux/module.h>
#include <linux/crypto.h>

#define SYMMETRIC_KEY_LENGTH 32
#define CIPHER_BLOCK_SIZE    16

struct tcrypt_result {
    struct completion completion;
    int err;
};

struct skcipher_def {
    struct scatterlist sg;
    struct crypto_skcipher * tfm;
    struct skcipher_request * req;
    struct tcrypt_result result;
    char * scratchpad;
    char * ciphertext;
    char * ivdata;
};

static struct skcipher_def sk;

static void test_skcipher_finish(struct skcipher_def * sk)
{
    if (sk->tfm)
        crypto_free_skcipher(sk->tfm);
    if (sk->req)
        skcipher_request_free(sk->req);
    if (sk->ivdata)
        kfree(sk->ivdata);
    if (sk->scratchpad)
        kfree(sk->scratchpad);
    if (sk->ciphertext)
        kfree(sk->ciphertext);
}

static int test_skcipher_result(struct skcipher_def * sk, int rc)
{
    switch (rc) {
    case 0:
        break;
    case -EINPROGRESS:
    case -EBUSY:
        rc = wait_for_completion_interruptible(
            &sk->result.completion);
        if (!rc && !sk->result.err) {
            reinit_completion(&sk->result.completion);
            break;
        }
    default:
        pr_info("skcipher encrypt returned with %d result %d\n",
            rc, sk->result.err);
        break;
    }

    init_completion(&sk->result.completion);

    return rc;
}

static void test_skcipher_callback(struct crypto_async_request *req, int error)
{
    struct tcrypt_result *result = req->data;
    int ret;

    if (error == -EINPROGRESS)
        return;

    result->err = error;
    complete(&result->completion);
    pr_info("Encryption finished successfully\n");
}

static int test_skcipher_encrypt(char * plaintext, char * password,
                                 struct skcipher_def * sk)
{
    int ret = -EFAULT;
    unsigned char key[SYMMETRIC_KEY_LENGTH];

    if (!sk->tfm) {
        sk->tfm = crypto_alloc_skcipher("cbc-aes-aesni", 0, 0);
        if (IS_ERR(sk->tfm)) {
            pr_info("could not allocate skcipher handle\n");
            return PTR_ERR(sk->tfm);
        }
    }

    if (!sk->req) {
        sk->req = skcipher_request_alloc(sk->tfm, GFP_KERNEL);
        if (!sk->req) {
            pr_info("could not allocate skcipher request\n");
            ret = -ENOMEM;
            goto out;
        }
    }

    skcipher_request_set_callback(sk->req, CRYPTO_TFM_REQ_MAY_BACKLOG,
                                  test_skcipher_callback,
                                  &sk->result);

    /* Nettoyez la clÃ©s */
    memset((void*)key,'\0',SYMMETRIC_KEY_LENGTH);

    /* Utilisez le meilleur mot de passe du monde */
    sprintf((char*)key,"%s",password);

    /* Cryptage AES 256 par clÃ©s symÃ©triques */
    if (crypto_skcipher_setkey(sk->tfm, key, SYMMETRIC_KEY_LENGTH)) {
        pr_info("key could not be set\n");
        ret = -EAGAIN;
        goto out;
    }
    pr_info("Symmetric key: %s\n", key);
    pr_info("Plaintext: %s\n", plaintext);

    if (!sk->ivdata) {
        /* Voyez https://fr.wikipedia.org/wiki/Vecteur_d%27initialisation */
        sk->ivdata = kmalloc(CIPHER_BLOCK_SIZE, GFP_KERNEL);
        if (!sk->ivdata) {
            pr_info("could not allocate ivdata\n");
            goto out;
        }
        get_random_bytes(sk->ivdata, CIPHER_BLOCK_SIZE);
    }

    if (!sk->scratchpad) {
        /* Le texte que vous souhaitez crypter */
        sk->scratchpad = kmalloc(CIPHER_BLOCK_SIZE, GFP_KERNEL);
        if (!sk->scratchpad) {
            pr_info("could not allocate scratchpad\n");
            goto out;
        }
    }
    sprintf((char*)sk->scratchpad,"%s",plaintext);

    sg_init_one(&sk->sg, sk->scratchpad, CIPHER_BLOCK_SIZE);
    skcipher_request_set_crypt(sk->req, &sk->sg, &sk->sg,
                               CIPHER_BLOCK_SIZE, sk->ivdata);
    init_completion(&sk->result.completion);

    /* Cryptage */
    ret = crypto_skcipher_encrypt(sk->req);
    ret = test_skcipher_result(sk, ret);
    if (ret)
        goto out;

    pr_info("Encryption request successful\n");

out:
    return ret;
}

int cryptoapi_init(void)
{
    /* Le meilleur mot de passe du monde */
    char * password = "password123";

    sk.tfm = NULL;
    sk.req = NULL;
    sk.scratchpad = NULL;
    sk.ciphertext = NULL;
    sk.ivdata = NULL;

    test_skcipher_encrypt("Testing", password, &sk);
    return 0;
}

void cryptoapi_exit(void)
{
    test_skcipher_finish(&sk);
}

module_init(cryptoapi_init);
module_exit(cryptoapi_exit);

MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Symmetric key encryption example");
MODULE_LICENSE("GPL");
```
:::
:::
:::
:::

::: {#outline-container-sec-17 .outline-2}
Standardisation des interfaces : Le modÃ¨le de pÃ©riphÃ©rique {#sec-17}
-------------------------------------------------------------

::: {#text-17 .outline-text-2}
Jusqu\'ici, on a vu plusieurs sortes de modules qui faisaient toutes
sortes de choses, mais leurs interfaces avec le reste du noyau Ã©taient
limitÃ©es. L\'idÃ©e est venue, pour imposer une interface standardisÃ©e
(afin qu\'il existe une maniÃ¨re normalisÃ©e de dÃ©marrer, suspendre et
reprendre un pÃ©riphÃ©rique), de crÃ©er un modÃ¨le de pÃ©riphÃ©rique.
C\'est ce qui a Ã©tÃ© ajoutÃ© au sein du noyau. L\'exemple suivant le
montre, et vous pouvez utiliser ce modÃ¨le pour ajouter vos propres
fonctions de pÃ©riphÃ©rique telle qu\'une fonction d\'arrÃªt, de
redÃ©marrage, ou autre.

::: {.org-src-container}
``` {.src .src-C}
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/platform_device.h>

struct devicemodel_data {
    char *greeting;
    int   number;
};

static int devicemodel_probe(struct platform_device *dev)
{
    struct devicemodel_data *pd = (struct devicemodel_data *)(dev->dev.platform_data);

    pr_info("devicemodel probe\n");
    pr_info("devicemodel greeting: %s; %d\n", pd->greeting, pd->number);

    /* Le code d'initialisation de votre pÃ©riphÃ©rique */

    return 0;
}

static int devicemodel_remove(struct platform_device *dev)
{
    pr_info("devicemodel example removed\n");

    /* Le code de suppression de votre pÃ©riphÃ©rique */

    return 0;
}

static int devicemodel_suspend(struct device *dev)
{
    pr_info("devicemodel example suspend\n");

    /* Le code de mise en veille de votre pÃ©riphÃ©rique */

    return 0;
}

static int devicemodel_resume(struct device *dev)
{
    pr_info("devicemodel example resume\n");

    /* Le code de reprise en activitÃ© de votre pÃ©riphÃ©rique */

    return 0;
}

static const struct dev_pm_ops devicemodel_pm_ops =
{
    .suspend = devicemodel_suspend,
    .resume = devicemodel_resume,
    .poweroff = devicemodel_suspend,
    .freeze = devicemodel_suspend,
    .thaw = devicemodel_resume,
    .restore = devicemodel_resume
};

static struct platform_driver devicemodel_driver = {
    .driver     = {
        .name   = "devicemodel_example",
        .owner  = THIS_MODULE,
        .pm     = &devicemodel_pm_ops,
    },
    .probe      = devicemodel_probe,
    .remove     = devicemodel_remove,
};

static int devicemodel_init(void)
{
    int ret;

    pr_info("devicemodel init\n");

    ret = platform_driver_register(&devicemodel_driver);

    if (ret) {
        pr_err("Unable to register driver\n");
        return ret;
    }

    return 0;
}

static void devicemodel_exit(void)
{
    pr_info("devicemodel exit\n");
    platform_driver_unregister(&devicemodel_driver);
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bob Mottram");
MODULE_DESCRIPTION("Linux Device Model example");

module_init(devicemodel_init);
module_exit(devicemodel_exit);
```
:::
:::
:::

::: {#outline-container-sec-18 .outline-2}
Optimisation {#sec-18}
------------

::: {#text-18 .outline-text-2}
:::

::: {#outline-container-sec-18-1 .outline-3}
### Conditions likely et unlikely {#sec-18-1}

::: {#text-18-1 .outline-text-3}
Vous souhaitez parfois que votre code tourne de la maniÃ¨re la plus
rapide possible, spÃ©cialement si ce dernier concerne la gestion d\'une
interruption, ou tout autre chose qui peut prendre du temps lÃ ou vous
souhaitez l\'Ã©viter. Si votre code contient des conditions boolÃ©ennes,
et si vous savez que ces conditions auront presque toujours la mÃªme
valeur (que ce soit vraie *true* ou fausse *false*), alors vous pouvez
optimiser votre code en utilisant les macros *likely* (pour une
condition qui sera souvent vraie) ou *unlikely* (pour une condition qui
sera souvent fausse).

Par exemple, l\'allocation de mÃ©moire va statistiquement le plus
souvent rÃ©ussir.

::: {.org-src-container}
``` {.src .src-C}
bvl = bvec_alloc(gfp_mask, nr_iovecs, &idx);
if (unlikely(!bvl)) {
  mempool_free(bio, bio_pool);
  bio = NULL;
  goto out;
}
```
:::

Quand la macro *unlikely* est utilisÃ©e, alors le compilateur modifie
les instructions qui y sont liÃ©es de sorte qu\'il Ã©vite un saut au
sein du code coÃ»teux en ressource, saut qui ne sera effectuÃ© que si la
condition est vraie. Ceci Ã©vite de vider le pipeline de votre
processeur, et Ã§a vous Ã©vitera donc de nombreux cycles durant lesquels
votre processeur sera bloquÃ©. L\'exact opposÃ© arrive si vous utilisez
la macro *likely*.

Attention cependant. Cette manoeuvre doit Ãªtre utilisÃ©e dans les
conditions dont vous Ãªtes presque toujours sur du rÃ©sultat. C\'est une
mauvaise idÃ©e de trop l\'utiliser sur les conditions de vÃ©rification
d\'erreurs et donc d\'en tirer des conclusions hÃ¢tives sur votre code.
Il ne faudrait pas confondre prÃ©diction et espoir, puisque vous
prÃ©voyez rarement quand les erreurs vont arriver.
:::
:::
:::

::: {#outline-container-sec-19 .outline-2}
PiÃ¨ges rÃ©currents {#sec-19}
-------------------

::: {#text-19 .outline-text-2}
La messe n\'est pas dite. Avant de vous renvoyer dans le monde Ã©crire
des modules noyau, vous devez Ãªtre prÃ©venu de certaines choses. Si je
ne vous ai pas assez prÃ©venu et qu\'une chose mauvaise vous arrive,
merci de signaler le problÃ¨me, et je vous rembourserai le montant que
j\'ai touchÃ© pour votre copie papier de ce guide.
:::

::: {#outline-container-sec-19-1 .outline-3}
### Utilisation de bibliothÃ¨ques standards. {#sec-19-1}

::: {#text-19-1 .outline-text-3}
Vous ne pouvez pas les utiliser, et si vous le faites vous Ãªtes
passible du bÃ»cher. Ces bibliothÃ¨ques sont rÃ©servÃ©es au code
utilisateur et vous n\'avez le droit de n\'utiliser que des fonctions
noyau, qui sont les fonctions dont vous pouvez apercevoir les symboles
dans le fichier /proc/kallsyms.
:::
:::

::: {#outline-container-sec-19-2 .outline-3}
### DÃ©sactiver les interruptions {#sec-19-2}

::: {#text-19-2 .outline-text-3}
Vous devrez parfois dÃ©sactiver toutes les interruptions pour une trÃ¨s
courte pÃ©riode, et Ã§a ne pose pas de problÃ¨me, mais si vous ne les
rÃ©activez pas ensuite, votre systÃ¨me sera embourbÃ© et vous serez
contraint de l\'Ã©teindre Ã la maniÃ¨re d\'un barbare.
:::
:::

::: {#outline-container-sec-19-3 .outline-3}
### Ne vous jetez pas dans la gueule du loup {#sec-19-3}

::: {#text-19-3 .outline-text-3}
Je n\'ai probablement pas besoin de vous prÃ©venir pour Ã§a, mais je
vais quand mÃªme le faire, juste au cas oÃ¹...
:::
:::
:::

::: {#outline-container-sec-20 .outline-2}
Que faire ensuite ? {#sec-20}
-------------------

::: {#text-20 .outline-text-2}
J\'aurais facilement pu rajouter plusieurs chapitres Ã ce livre. Il y a
tant Ã dire ! J\'aurais pu ajouter un chapitre sur l\'ajout de nouveau
systÃ¨mes de fichiers, ou l\'ajout d\'un nouveau protocole de
communication rÃ©seau (comme si vous en aurez un jour besoin -- vous
risquez de chercher longtemps pour trouver un protocole rÃ©seau qui
n\'est pas encore gÃ©rÃ© par Linux). J\'aurais pu ajouter des
explications sur les mÃ©canismes du noyau qu\'on a pas traitÃ©s, tel que
le dÃ©marrage du systÃ¨me, ou l\'interface disque/systÃ¨me.

J\'ai pourtant choisi de ne pas le faire. Mon but en Ã©crivant ce livre
Ã©tait de fournir au lecteur une premiÃ¨re initiation aux mystÃ¨res de
la programmation de module noyau pour Linux, et Ã ce but d\'enseigner
les techniques Ã©lÃ©mentaires de dÃ©veloppement noyau. Mais pour les
lecteurs qui restent sur leur faim et qui sont intÃ©ressÃ©s pour en
apprendre davantage, je conseille
[kernelnewbies.org](https://kernelnewbies.org) et le rÃ©pertoire
*Documentation* au sein du code source du noyau, qui n\'est pas toujours
trÃ¨s clair, mais qui est un excellent point de dÃ©part pour en
apprendre plus. De plus, comme l\'a dit Linus Torvalds, la meilleure
maniÃ¨re d\'en apprendre plus sur le noyau reste de lire le code source.

Si vous Ãªtes intÃ©ressÃ© par plus d\'exemples de modules noyau, alors
je vous conseille de chercher du contenu de sites comme Github,
Bitbucket ou Gitlab, dont les contenus sont trÃ¨s bien rÃ©fÃ©rencÃ©s
(mais vous pouvez tomber sur tout et n\'importe quoi, comme de vieilles
versions de ce guide qui ne compileront plus sur des versions Ã jour du
noyau). Vous trouverez Ã©galement des exemples trÃ¨s instructifs sur
l\'utilisation de modules pour attaquer, compromettre un systÃ¨me, ou
encore en tirer des donnÃ©es normalement privÃ©es. La meilleure maniÃ¨re
de savoir dÃ©fendre un systÃ¨me, c\'est en connaissant ses points
faibles, c\'est pourquoi je vous conseille la lecture de tels dÃ©pots.

J\'espÃ¨re vraiment vous avoir aidÃ© dans votre quÃªte pour devenir un
meilleur dÃ©veloppeur, ou au moins pour vous amuser ou en apprendre plus
sur cette technologie. Si vous souhaitez Ã©crire des modules utiles et
intÃ©ressants pour le noyau, j\'espÃ¨re que vous le ferez sous une
licence libre, afin que je puisse m\'en servir ou m\'en inspirer.

Si vous souhaitez contribuer Ã ce guide, reporter une chose erronÃ©e, ou
si vous souhaitez ajouter des commentaires acerbes ou sardoniques, par
exemple en rajoutant des remarques Ã©voquant des singes ou d\'autres
animaux dans des situations inÃ©narrables, dÃ©posez alors une
disputation, ou mieux, proposez une pull request sur le dÃ©pÃ´t git de
ce projet : <https://bitbucket.org/s_burel/lkmpg_fr>.
:::
:::
:::

::: {#postamble .status}
::: {.back-to-top}
[Back to top](#top) \| [E-mail me](mailto:bob@freedombone.net)
:::
:::
